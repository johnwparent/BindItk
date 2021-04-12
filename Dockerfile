FROM johnwparent/autopybind11 as APB

ARG ITK_INSTALL_DIR="/install-ITK"

# Build ITK
RUN git clone https://github.com/InsightSoftwareConsortium/ITK.git \
    && mkdir -p build-ITK/release\
    && cd build-ITK/release\
    && cmake ../../ITK\
        -DBUILD_TESTING=OFF\
        -DBUILD_EXAMPLES=OFF\
        -DITK_BUILD_DEFAULT_MODULES=ON\
        -DBUILD_SHARED_LIBS=ON\
        -DCMAKE_BUILD_TYPE=RELEASE\
        -DCMAKE_INSTALL_PREFIX=${ITK_INSTALL_DIR}\
    && make -j$(nproc) \
    && make install

ENV ITK_INSTALL_DIR=${ITK_INSTALL_DIR}


ENTRYPOINT [ "bash" ]
