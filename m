Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B95606A33E
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Nov 2026 09:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jI83AW4N
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=sOmg8pF/82dquPMd4rQf73eaB6QpmmTcPKl4uD99Q8U=; b=jI83AW4NQfOhS2
	rOvCS0B6+UXIywUAa4qkxFLi4QF7D1/kk5vvTcXJ35VABerA4Ceq9m1yIpp/rkztVxKTaa17rfQoJ
	LHSa9/KTYDhfWmoGlbh+UYI7RGspj/J1sXMBULWnoZ7C1i6t8KaL1DZGb+a1N2YxofZwXDB5PwXGM
	sVCT3BLsy7BVAhIJPzERO9yant1PXlSF7xoLNqDpeIIok5MV0GF4ytjWe3tk47HRgGv9EO3q5lDn0
	RItp2OQ2fVDbIKSHYC3MkkufcjPpJnUIWPxALdDpP4t/nkxBWl/Zi3x7C6eVfg/E2pSv1L+boQye0
	zp2DhxN2/WVuscOYT3iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR4oF-00000006DZa-4AkU;
	Wed, 11 Nov 2026 09:40:03 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR4o8-00000006DUv-0exp;
	Wed, 11 Nov 2026 09:39:57 +0000
Received: from [2a04:4540:1401:33fc:b262:f9a8:847e:6650] (helo=bertha10..)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <john@phrozen.org>)
	id 1xR4nz-001U9u-28;
	Wed, 11 Nov 2026 10:39:47 +0100
From: John Crispin <john@phrozen.org>
To: Stefan Roese <sr@denx.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	devicetree@vger.kernel.org,
	lei.dong@airoha.com,
	Linqi.zhang@airoha.com,
	linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Rajeev.kumar@airoha.com,
	upstream@airoha.com,
	Weifeng.xu@airoha.com,
	zhengping.zhang@airoha.com
Subject: [PATCH 2/2] i2c: mt7621: add support for Airoha AN7589
Date: Wed, 11 Nov 2026 10:39:41 +0100
Message-Id: <20261111093941.691801-3-john@phrozen.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261111093941.691801-1-john@phrozen.org>
References: <20261111093941.691801-1-john@phrozen.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_013956_199825_2A4BE836 
X-CRM114-Status: GOOD (  18.74  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The Airoha AN7589 carries this controller with a second control
register at 0x68. It holds a 16 bit clock divider selected by
SM0CTL2_SCL_DIV_SEL, wider than the 11 bit field in SM0CTL0, and SDA
wait control. The AN7589 also runs without SCL stretching.

Describe the variants as match data: whether to set SCL_STRETCH, and
whether to program the extended divider. With the extended divider the
bus frequency is clamped to the range from standard mode to fast mode
plus instead of the fixed divider bounds of the MT7621.

Signed-off-by: John Crispin <john@phrozen.org>
---
 drivers/i2c/busses/i2c-mt7621.c | 58 ++++++++++++++++++++++++++++-----
 1 file changed, 50 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt7621.c b/drivers/i2c/busses/i2c-mt7621.c
index 9ea5e3f9a763..37524bae1f8b 100644
--- a/drivers/i2c/busses/i2c-mt7621.c
+++ b/drivers/i2c/busses/i2c-mt7621.c
@@ -10,6 +10,7 @@
  * (C) 2014 Sittisak <sittisaks@hotmail.com>
  */
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/i2c.h>
@@ -18,6 +19,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/reset.h>
 
 #define REG_SM0CFG2_REG		0x28
@@ -28,6 +30,7 @@
 #define REG_PINTEN_REG		0x5c
 #define REG_PINTST_REG		0x60
 #define REG_PINTCL_REG		0x64
+#define REG_SM0CTL2_REG		0x68
 
 /* REG_SM0CFG2_REG */
 #define SM0CFG2_IS_AUTOMODE	BIT(0)
@@ -54,13 +57,25 @@
 #define SM0CTL1_MODE_MASK	(0x7 << 4)
 #define SM0CTL1_TRI		BIT(0)
 
+/* REG_SM0CTL2_REG */
+#define SM0CTL2_DATA_WAIT_SDA	BIT(18)
+#define SM0CTL2_INIT_WAIT_SDA	BIT(17)
+#define SM0CTL2_SCL_DIV_SEL	BIT(16)
+#define SM0CTL2_CLK_DIV_EXT	GENMASK(15, 0)
+
 /* timeout waiting for I2C devices to respond */
 #define TIMEOUT_MS		1000
 
+struct mtk_i2c_soc_data {
+	bool scl_stretch;
+	bool ext_clk_div;
+};
+
 struct mtk_i2c {
 	void __iomem *base;
 	struct device *dev;
 	struct i2c_adapter adap;
+	const struct mtk_i2c_soc_data *soc;
 	u32 bus_freq;
 	u32 clk_div;
 	u32 flags;
@@ -83,6 +98,7 @@ static int mtk_i2c_wait_idle(struct mtk_i2c *i2c)
 
 static void mtk_i2c_reset(struct mtk_i2c *i2c)
 {
+	u32 ctl0;
 	int ret;
 
 	ret = device_reset(i2c->adap.dev.parent);
@@ -93,8 +109,16 @@ static void mtk_i2c_reset(struct mtk_i2c *i2c)
 	 * Don't set SM0CTL0_ODRAIN as its bit meaning is inverted. To
 	 * configure open-drain mode, this bit needs to be cleared.
 	 */
-	iowrite32(((i2c->clk_div << 16) & SM0CTL0_CLK_DIV_MASK) | SM0CTL0_EN |
-		  SM0CTL0_SCL_STRETCH, i2c->base + REG_SM0CTL0_REG);
+	ctl0 = ((i2c->clk_div << 16) & SM0CTL0_CLK_DIV_MASK) | SM0CTL0_EN;
+	if (i2c->soc->scl_stretch)
+		ctl0 |= SM0CTL0_SCL_STRETCH;
+	iowrite32(ctl0, i2c->base + REG_SM0CTL0_REG);
+
+	if (i2c->soc->ext_clk_div)
+		iowrite32(SM0CTL2_SCL_DIV_SEL | SM0CTL2_DATA_WAIT_SDA |
+			  FIELD_PREP(SM0CTL2_CLK_DIV_EXT, i2c->clk_div),
+			  i2c->base + REG_SM0CTL2_REG);
+
 	iowrite32(0, i2c->base + REG_SM0CFG2_REG);
 }
 
@@ -250,8 +274,17 @@ static const struct i2c_algorithm mtk_i2c_algo = {
 	.functionality = mtk_i2c_func,
 };
 
+static const struct mtk_i2c_soc_data mt7621_i2c_soc_data = {
+	.scl_stretch = true,
+};
+
+static const struct mtk_i2c_soc_data an7589_i2c_soc_data = {
+	.ext_clk_div = true,
+};
+
 static const struct of_device_id i2c_mtk_dt_ids[] = {
-	{ .compatible = "mediatek,mt7621-i2c" },
+	{ .compatible = "mediatek,mt7621-i2c", .data = &mt7621_i2c_soc_data },
+	{ .compatible = "airoha,an7589-i2c", .data = &an7589_i2c_soc_data },
 	{ /* sentinel */ }
 };
 
@@ -259,11 +292,16 @@ MODULE_DEVICE_TABLE(of, i2c_mtk_dt_ids);
 
 static void mtk_i2c_init(struct mtk_i2c *i2c)
 {
-	i2c->clk_div = clk_get_rate(i2c->clk) / i2c->bus_freq - 1;
-	if (i2c->clk_div < 99)
-		i2c->clk_div = 99;
-	if (i2c->clk_div > SM0CTL0_CLK_DIV_MAX)
-		i2c->clk_div = SM0CTL0_CLK_DIV_MAX;
+	unsigned long rate = clk_get_rate(i2c->clk);
+	unsigned long div_min = 99;
+	unsigned long div_max = SM0CTL0_CLK_DIV_MAX;
+
+	if (i2c->soc->ext_clk_div) {
+		div_min = rate / I2C_MAX_FAST_MODE_PLUS_FREQ - 1;
+		div_max = rate / I2C_MAX_STANDARD_MODE_FREQ - 1;
+	}
+
+	i2c->clk_div = clamp(rate / i2c->bus_freq - 1, div_min, div_max);
 
 	mtk_i2c_reset(i2c);
 }
@@ -278,6 +316,10 @@ static int mtk_i2c_probe(struct platform_device *pdev)
 	if (!i2c)
 		return -ENOMEM;
 
+	i2c->soc = device_get_match_data(&pdev->dev);
+	if (!i2c->soc)
+		return -EINVAL;
+
 	i2c->base = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
 	if (IS_ERR(i2c->base))
 		return PTR_ERR(i2c->base);
-- 
2.34.1


