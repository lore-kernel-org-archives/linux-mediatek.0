From: <michael.mei-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 2/2] dt-bindings: nvmem: mediatek: add support for MediaTek
 mt8183 SoC
Date: Tue, 16 Apr 2019 16:19:20 +0800
Message-ID: <20190416081922.21711-3-michael.mei@mediatek.com>
References: <20190416081922.21711-1-michael.mei@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20190416081922.21711-1-michael.mei-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: orz811017-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Michael Mei <michael.mei-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

From: Michael Mei <michael.mei-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

This updates dt-binding documentation for MediaTek mt8183
For the both SoCs supported all rely on the fallback binding
of the generic case with "mediatek,efuse".

Signed-off-by: Michael Mei <michael.mei-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
This patch is based on v5.1-rc1 and these patches:

https://patchwork.kernel.org/patch/10856987/
https://patchwork.kernel.org/patch/10839021/
https://patchwork.kernel.org/patch/10879015/
https://patchwork.kernel.org/patch/10878999/
https://patchwork.kernel.org/patch/10858941/
https://patchwork.kernel.org/patch/10846685/
https://patchwork.kernel.org/patch/10893519
---
 Documentation/devicetree/bindings/nvmem/mtk-efuse.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/nvmem/mtk-efuse.txt b/Documentation/devicetree/bindings/nvmem/mtk-efuse.txt
index 0668c45a156d..b4d448bb60ce 100644
--- a/Documentation/devicetree/bindings/nvmem/mtk-efuse.txt
+++ b/Documentation/devicetree/bindings/nvmem/mtk-efuse.txt
@@ -7,6 +7,7 @@ Required properties:
 	      "mediatek,mt7622-efuse", "mediatek,efuse": for MT7622
 	      "mediatek,mt7623-efuse", "mediatek,efuse": for MT7623
 	      "mediatek,mt8173-efuse" or "mediatek,efuse": for MT8173
+	      "mediatek,mt8183-efuse" or "mediatek,efuse": for MT8183
 - reg: Should contain registers location and length
 
 = Data cells =
-- 
2.18.0
