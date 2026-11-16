Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49009606A331
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2026 17:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=u0Cp5C0N
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=NNv20ieaX4wZbuOOjfLaQxIZbiUJkwUImQSoKQ5uEkw=; b=u0Cp5C0NpKxx+o
	ouJDjuiLxvA3I7Ujsb98OwsUlH84IfBorJAemGOeAfDDDZ7LNoMiNMGoPd95p5qtcTDXMnL5vAa3a
	ULcFS9G4rK7f5x4dgLTXlKZnxDxKNxDhm35G/0xD7hyD5oA3ZMfMue0VfOQrprWnxA9fnMOEmZ8A8
	gIbv8myWKCBEV/BCPOlTkGINxAb5fvO4WetYTpwimECNRrX2GDvwCSGZwJ4KEywigWOEN/A00NBvQ
	Nee9JTD5OiKslS4epY2wsRWxnG2rf9F+dFBR4Vw5jYE3/ScXAlOfFJFifHuGy+esy0anX4Picu/E1
	IU2mdk/RN1kahsdmGCkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT0u4-00000003SXJ-3yw3;
	Mon, 16 Nov 2026 17:54:04 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT0u1-00000003SVB-2EKT;
	Mon, 16 Nov 2026 17:54:02 +0000
Received: from [2a04:4540:1403:e6fc:5f71:2c1e:7d62:945f] (helo=bertha10..)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <john@phrozen.org>)
	id 1xT0tq-004GoI-2W;
	Mon, 16 Nov 2026 18:53:50 +0100
From: John Crispin <john@phrozen.org>
To: Stefan Roese <sr@denx.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
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
Subject: [PATCH v3 3/3] i2c: mt7621: add support for Airoha AN7589
Date: Mon, 16 Nov 2026 18:53:43 +0100
Message-Id: <20261116175343.344425-4-john@phrozen.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261116175343.344425-1-john@phrozen.org>
References: <20261116175343.344425-1-john@phrozen.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_095401_630956_B61733C5 
X-CRM114-Status: GOOD (  21.43  )
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
whether to program the extended divider. The extended divider is set
up before the controller is enabled, and the SM0CTL0 divider stays
zero. With the extended divider and the 200 MHz clock the bus runs
from fast mode plus down to about 3 kHz, where the SM0CTL0 divider
stops at 97.7 kHz.

Signed-off-by: John Crispin <john@phrozen.org>
---
Changes in v3:
- Cap the bus rate at 1 MHz instead of the divider from below, so the
  limits are constant and a clock rate below 1 MHz cannot wrap the
  divider. Same divider for every valid rate (kernel test robot,
  sashiko).
- Link to the report: https://lore.kernel.org/oe-kbuild-all/202611140348.p9TnfxBF-lkp@intel.com/

Changes in v2:
- The extended divider supports bus rates down to about 3 kHz with
  the 200 MHz clock. The SM0CTL0 divider stops at 97.7 kHz.
- Set up the extended divider before the controller is enabled. The
  SM0CTL0 divider stays zero.

 drivers/i2c/busses/i2c-mt7621.c | 60 ++++++++++++++++++++++++++++-----
 1 file changed, 52 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt7621.c b/drivers/i2c/busses/i2c-mt7621.c
index 7a31cc8b89ce..ec6fbb051bea 100644
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
@@ -84,6 +99,7 @@ static int mtk_i2c_wait_idle(struct mtk_i2c *i2c)
 
 static void mtk_i2c_reset(struct mtk_i2c *i2c)
 {
+	u32 ctl0;
 	int ret;
 
 	ret = reset_control_assert(i2c->rst);
@@ -96,8 +112,17 @@ static void mtk_i2c_reset(struct mtk_i2c *i2c)
 	 * Don't set SM0CTL0_ODRAIN as its bit meaning is inverted. To
 	 * configure open-drain mode, this bit needs to be cleared.
 	 */
-	iowrite32(((i2c->clk_div << 16) & SM0CTL0_CLK_DIV_MASK) | SM0CTL0_EN |
-		  SM0CTL0_SCL_STRETCH, i2c->base + REG_SM0CTL0_REG);
+	ctl0 = SM0CTL0_EN;
+	if (i2c->soc->ext_clk_div)
+		iowrite32(SM0CTL2_SCL_DIV_SEL | SM0CTL2_DATA_WAIT_SDA |
+			  FIELD_PREP(SM0CTL2_CLK_DIV_EXT, i2c->clk_div),
+			  i2c->base + REG_SM0CTL2_REG);
+	else
+		ctl0 |= (i2c->clk_div << 16) & SM0CTL0_CLK_DIV_MASK;
+	if (i2c->soc->scl_stretch)
+		ctl0 |= SM0CTL0_SCL_STRETCH;
+	iowrite32(ctl0, i2c->base + REG_SM0CTL0_REG);
+
 	iowrite32(0, i2c->base + REG_SM0CFG2_REG);
 }
 
@@ -253,8 +278,17 @@ static const struct i2c_algorithm mtk_i2c_algo = {
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
 
@@ -262,11 +296,17 @@ MODULE_DEVICE_TABLE(of, i2c_mtk_dt_ids);
 
 static void mtk_i2c_init(struct mtk_i2c *i2c)
 {
-	i2c->clk_div = clk_get_rate(i2c->clk) / i2c->bus_freq - 1;
-	if (i2c->clk_div < 99)
-		i2c->clk_div = 99;
-	if (i2c->clk_div > SM0CTL0_CLK_DIV_MAX)
-		i2c->clk_div = SM0CTL0_CLK_DIV_MAX;
+	unsigned long rate = clk_get_rate(i2c->clk);
+	u32 bus_freq = i2c->bus_freq;
+
+	if (i2c->soc->ext_clk_div) {
+		bus_freq = min(bus_freq, I2C_MAX_FAST_MODE_PLUS_FREQ);
+		i2c->clk_div = min(rate / bus_freq - 1,
+				   FIELD_MAX(SM0CTL2_CLK_DIV_EXT));
+	} else {
+		i2c->clk_div = clamp(rate / bus_freq - 1, 99,
+				     SM0CTL0_CLK_DIV_MAX);
+	}
 
 	mtk_i2c_reset(i2c);
 }
@@ -281,6 +321,10 @@ static int mtk_i2c_probe(struct platform_device *pdev)
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


