From: srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Subject: [PATCH 03/25] nvmem: Introduce devm_nvmem_(un)register()
Date: Fri,  9 Mar 2018 14:46:57 +0000
Message-ID: <20180309144719.29904-4-srinivas.kandagatla@linaro.org>
References: <20180309144719.29904-1-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20180309144719.29904-1-srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org
Cc: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, cphealy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

From: Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Introduce devm_nvmem_register()/devm_nvmem_unregister() to make
.remove() unnecessary in trivial drivers.

Cc: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Cc: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Cc: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: cphealy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Signed-off-by: Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/nvmem/core.c           | 59 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/nvmem-provider.h | 17 ++++++++++++
 2 files changed, 76 insertions(+)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 99e04cfcc723..b05aa8e81303 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -549,6 +549,65 @@ int nvmem_unregister(struct nvmem_device *nvmem)
 }
 EXPORT_SYMBOL_GPL(nvmem_unregister);
 
+static void devm_nvmem_release(struct device *dev, void *res)
+{
+	WARN_ON(nvmem_unregister(*(struct nvmem_device **)res));
+}
+
+/**
+ * devm_nvmem_register() - Register a managed nvmem device for given
+ * nvmem_config.
+ * Also creates an binary entry in /sys/bus/nvmem/devices/dev-name/nvmem
+ *
+ * @config: nvmem device configuration with which nvmem device is created.
+ *
+ * Return: Will be an ERR_PTR() on error or a valid pointer to nvmem_device
+ * on success.
+ */
+struct nvmem_device *devm_nvmem_register(struct device *dev,
+					 const struct nvmem_config *config)
+{
+	struct nvmem_device **ptr, *nvmem;
+
+	ptr = devres_alloc(devm_nvmem_release, sizeof(*ptr), GFP_KERNEL);
+	if (!ptr)
+		return ERR_PTR(-ENOMEM);
+
+	nvmem = nvmem_register(config);
+
+	if (!IS_ERR(nvmem)) {
+		*ptr = nvmem;
+		devres_add(dev, ptr);
+	} else {
+		devres_free(ptr);
+	}
+
+	return nvmem;
+}
+EXPORT_SYMBOL_GPL(devm_nvmem_register);
+
+static int devm_nvmem_match(struct device *dev, void *res, void *data)
+{
+	struct nvmem_device **r = res;
+
+	return *r == data;
+}
+
+/**
+ * devm_nvmem_unregister() - Unregister previously registered managed nvmem
+ * device.
+ *
+ * @nvmem: Pointer to previously registered nvmem device.
+ *
+ * Return: Will be an negative on error or a zero on success.
+ */
+int devm_nvmem_unregister(struct device *dev, struct nvmem_device *nvmem)
+{
+	return devres_release(dev, devm_nvmem_release, devm_nvmem_match, nvmem);
+}
+EXPORT_SYMBOL(devm_nvmem_unregister);
+
+
 static struct nvmem_device *__nvmem_device_get(struct device_node *np,
 					       struct nvmem_cell **cellp,
 					       const char *cell_id)
diff --git a/include/linux/nvmem-provider.h b/include/linux/nvmem-provider.h
index b00567a07496..f89598bc4e1c 100644
--- a/include/linux/nvmem-provider.h
+++ b/include/linux/nvmem-provider.h
@@ -72,6 +72,11 @@ struct nvmem_config {
 struct nvmem_device *nvmem_register(const struct nvmem_config *cfg);
 int nvmem_unregister(struct nvmem_device *nvmem);
 
+struct nvmem_device *devm_nvmem_register(struct device *dev,
+					 const struct nvmem_config *cfg);
+
+int devm_nvmem_unregister(struct device *dev, struct nvmem_device *nvmem);
+
 #else
 
 static inline struct nvmem_device *nvmem_register(const struct nvmem_config *c)
@@ -84,5 +89,17 @@ static inline int nvmem_unregister(struct nvmem_device *nvmem)
 	return -ENOSYS;
 }
 
+static inline struct nvmem_device *
+devm_nvmem_register(struct device *dev, const struct nvmem_config *c)
+{
+	return nvmem_register(c);
+}
+
+static inline int
+devm_nvmem_unregister(struct device *dev, struct nvmem_device *nvmem)
+{
+	return nvmem_unregister(nvmem);
+}
+
 #endif /* CONFIG_NVMEM */
 #endif  /* ifndef _LINUX_NVMEM_PROVIDER_H */
-- 
2.15.1
