From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH v3 01/22] nvmem: Document struct nvmem_config
Date: Wed,  3 Jan 2018 12:00:53 -0800
Message-ID: <20180103200114.23922-2-andrew.smirnov@gmail.com>
References: <20180103200114.23922-1-andrew.smirnov@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180103200114.23922-1-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Masahiro Yamada <yamada.masahiro@socionext.com>, Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>, Matthias Brugger <matthias.bgg@gmail.com>, cphealy@gmail.com, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

Add a simple description of struct nvmem_config and its fields.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Heiko Stuebner <heiko@sntech.de>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Carlo Caione <carlo@caione.org>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: cphealy@gmail.com
Cc: linux-kernel@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
Cc: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 include/linux/nvmem-provider.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/include/linux/nvmem-provider.h b/include/linux/nvmem-provider.h
index 497706f5adca..27e599222ec1 100644
--- a/include/linux/nvmem-provider.h
+++ b/include/linux/nvmem-provider.h
@@ -22,6 +22,28 @@ typedef int (*nvmem_reg_read_t)(void *priv, unsigned int offset,
 typedef int (*nvmem_reg_write_t)(void *priv, unsigned int offset,
 				 void *val, size_t bytes);
 
+/**
+ * struct nvmem_config - NVMEM device configuration
+ *
+ * @dev:	Parent device.
+ * @name:	Optional name.
+ * @id:		Optional device ID used in full name. Ignored if name is NULL.
+ * @owner:	Pointer to exporter module. Used for refcounting.
+ * @cells:	Optional array of pre-defined NVMEM cells.
+ * @ncells:	Number of elements in cells.
+ * @read_only:	Device is read-only.
+ * @root_only:	Device is accessibly to root only.
+ * @reg_read:	Callback to read data.
+ * @reg_write:	Callback to write data.
+ * @size:	Device size.
+ * @word_size:	Minimum read/write access granularity.
+ * @stride:	Minimum read/write access stide.
+ * @priv:	User context passed to read/write callbacks.
+ *
+ * Note: A default "nvmem<id>" name will be assigned to the device if
+ * no name is specified in its configuration. In such case "<id>" is
+ * generated with ida_simple_get() and provided id field is ignored.
+ */
 struct nvmem_config {
 	struct device		*dev;
 	const char		*name;
-- 
2.14.3
