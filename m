From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 2/5] nvmem: mtk-efuse: use stack for nvmem_config instead of
 malloc'ing it
Date: Mon, 11 Sep 2017 22:01:01 +0900
Message-ID: <1505134864-11975-3-git-send-email-yamada.masahiro@socionext.com>
References: <1505134864-11975-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1505134864-11975-1-git-send-email-yamada.masahiro@socionext.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Jassi Brar <jaswinder.singh@linaro.org>, Keiji Hayashibara <hayashibara.keiji@socionext.com>, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-mediatek@lists.infradead.org, Masami Hiramatsu <mhiramat@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

nvmem_register() copies all the members of nvmem_config to
nvmem_device.  So, nvmem_config is one-time use data during
probing.  There is no point to keep it until the driver detach.
Using stack should be no problem because nvmem_config is pretty
small.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/nvmem/mtk-efuse.c | 24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/drivers/nvmem/mtk-efuse.c b/drivers/nvmem/mtk-efuse.c
index 32fd572..fa7a0f6 100644
--- a/drivers/nvmem/mtk-efuse.c
+++ b/drivers/nvmem/mtk-efuse.c
@@ -49,7 +49,7 @@ static int mtk_efuse_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct resource *res;
 	struct nvmem_device *nvmem;
-	struct nvmem_config *econfig;
+	struct nvmem_config econfig = {};
 	void __iomem *base;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
@@ -57,19 +57,15 @@ static int mtk_efuse_probe(struct platform_device *pdev)
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
-	econfig = devm_kzalloc(dev, sizeof(*econfig), GFP_KERNEL);
-	if (!econfig)
-		return -ENOMEM;
-
-	econfig->stride = 4;
-	econfig->word_size = 4;
-	econfig->reg_read = mtk_reg_read;
-	econfig->reg_write = mtk_reg_write;
-	econfig->size = resource_size(res);
-	econfig->priv = base;
-	econfig->dev = dev;
-	econfig->owner = THIS_MODULE;
-	nvmem = nvmem_register(econfig);
+	econfig.stride = 4;
+	econfig.word_size = 4;
+	econfig.reg_read = mtk_reg_read;
+	econfig.reg_write = mtk_reg_write;
+	econfig.size = resource_size(res);
+	econfig.priv = base;
+	econfig.dev = dev;
+	econfig.owner = THIS_MODULE;
+	nvmem = nvmem_register(&econfig);
 	if (IS_ERR(nvmem))
 		return PTR_ERR(nvmem);
 
-- 
2.7.4
