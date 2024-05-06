Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D215FC10F16
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 May 2024 13:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wYR4CHMFT2tFQ3GNhSGJHwMj2WpG/UFvjzjttD6A7ZU=; b=l7n6eGVlNh/FGElvZymYuemwX0
	yFtXSBRScxdLcBHIFfE1QkvztLdBYUEvwHwFKmR1vKa81NTAqtJhmcRuHmk2ileFkbNrdEuGMyVAa
	8pVojmWhZt+5bdp3UbGyJ2TsJT1kLFjjOJ93Zd5bLijmCvnJmt+MRKlJulHiz0wrxifS72DPOlik6
	zOcmdnPLdnteao6FU3f54iaFQKFgCvzA81h7AJSThMpcS4Orc3JJOwa8WbYCHlHly7dNgzq0GmX03
	qJFYzCocuzL3QQRj7tdhgm+wrJiwRUeFXAzhnQ24t6bnzG7nwFzFUUvBoTq371Z3xKeFK7SNeRsoE
	uEIAqKqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3yWP-00000007U7b-3iaH;
	Mon, 06 May 2024 13:36:49 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3yVg-00000007TYV-3rrX;
	Mon, 06 May 2024 13:36:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 01803CE0E80;
	Mon,  6 May 2024 13:36:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6837C4DDE5;
	Mon,  6 May 2024 13:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715002562;
	bh=YmpOGEQU+z5JeHvt+cgcHdm9hosKLft7UIh+6MtYGhg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=a3ct+NdR+5aJutYApenouWYx06bW4/90sUE6T0mSnF6DwppBal8R6H5WFjpl8EsN1
	 1R9euYYTnHrPB4mjxmjXVXXnQH/PWXYf/SO4FWYmNrImmlOwVPU8y6oRUtC2gzRgo8
	 WoKZdyUMoON1o3K+TT4biGHTWYtq0AEq0O2xl/CegLTNzmSd31jTX6eXHbZEgRyUMg
	 me2+z/jwu3HzdRYjEMSOBa16g5eU0wScs8L1ykrQsJfeIe8NBVHWMnUoViR58GWqgi
	 bpDDT5NBgrk8WAX9VI/u+vzi2K0W+JtwWWz66R5aC/hWQCRhBCTL7euBpsJydX5Mxr
	 Nb5fgv6ijkMuQ==
From: Michael Walle <mwalle@kernel.org>
Date: Mon, 06 May 2024 15:34:41 +0200
Subject: [PATCH 12/20] drm/bridge: tc358775: correctly configure LVDS clock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240506-tc358775-fix-powerup-v1-12-545dcf00b8dd@kernel.org>
References: <20240506-tc358775-fix-powerup-v1-0-545dcf00b8dd@kernel.org>
In-Reply-To: <20240506-tc358775-fix-powerup-v1-0-545dcf00b8dd@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sam Ravnborg <sam@ravnborg.org>, Vinay Simha BN <simhavcs@gmail.com>, 
 Tony Lindgren <tony@atomide.com>
Cc: Daniel Semkowicz <dse@thaumatec.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, Michael Walle <mwalle@kernel.org>
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_063605_546361_EF7ABF46 
X-CRM114-Status: GOOD (  13.18  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The driver assumes a DSI link with four lanes for now and has the LVDS
clock divider hardcoded to either 3 or 6. Take the number of lanes into
account, too. Also, explicitly set the clock source to the DSI clock.

While at it, replace the TC358775_LVCFG_PCLKDIV() and
TC358775_LVCFG_LVDLINK() inline functions style by the more common
linux bitfields functions.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/gpu/drm/bridge/tc358775.c | 48 +++++++++++++++++----------------------
 1 file changed, 21 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/tc358775.c
index e6d1f0c686ac..eea41054c6fa 100644
--- a/drivers/gpu/drm/bridge/tc358775.c
+++ b/drivers/gpu/drm/bridge/tc358775.c
@@ -139,6 +139,12 @@ enum {
 };
 
 #define LVCFG           0x049C  /* LVDS Configuration  */
+#define LVCFG_LVEN	BIT(0)
+#define LVCFG_LVDLINK	BIT(1)
+#define LVCFG_PCLKDIV	GENMASK(7, 4)
+#define LVCFG_PCLKSEL	GENMASK(11, 10)
+#define PCLKSEL_HSRCK	0	/* DSI clock */
+
 #define LVPHY0          0x04A0  /* LVDS PHY 0 */
 #define LV_PHY0_RST(v)          FLD_VAL(v, 22, 22) /* PHY reset */
 #define LV_PHY0_IS(v)           FLD_VAL(v, 15, 14)
@@ -183,28 +189,8 @@ enum {
 #define DEBUG01         0x05A4  /* LVDS Data */
 
 #define DSI_CLEN_BIT		BIT(0)
-#define DIVIDE_BY_3		3 /* PCLK=DCLK/3 */
-#define DIVIDE_BY_6		6 /* PCLK=DCLK/6 */
-#define LVCFG_LVEN_BIT		BIT(0)
-
 #define L0EN BIT(1)
 
-#define TC358775_LVCFG_PCLKDIV__MASK	0x000000f0
-#define TC358775_LVCFG_PCLKDIV__SHIFT	4
-static inline u32 TC358775_LVCFG_PCLKDIV(uint32_t val)
-{
-	return ((val) << TC358775_LVCFG_PCLKDIV__SHIFT) &
-			TC358775_LVCFG_PCLKDIV__MASK;
-}
-
-#define TC358775_LVCFG_LVDLINK__MASK                         0x00000002
-#define TC358775_LVCFG_LVDLINK__SHIFT                        1
-static inline u32 TC358775_LVCFG_LVDLINK(uint32_t val)
-{
-	return ((val) << TC358775_LVCFG_LVDLINK__SHIFT) &
-			TC358775_LVCFG_LVDLINK__MASK;
-}
-
 enum tc358775_ports {
 	TC358775_DSI_IN,
 	TC358775_LVDS_OUT0,
@@ -327,6 +313,8 @@ static void tc_bridge_enable(struct drm_bridge *bridge)
 	struct tc_data *tc = bridge_to_tc(bridge);
 	u32 hback_porch, hsync_len, hfront_porch, hactive, htime1, htime2;
 	u32 vback_porch, vsync_len, vfront_porch, vactive, vtime1, vtime2;
+	int bpp = mipi_dsi_pixel_format_to_bpp(tc->dsi->format);
+	int clkdiv;
 	unsigned int val = 0;
 	struct drm_display_mode *mode;
 	struct drm_connector *connector = get_connector(bridge->encoder);
@@ -408,14 +396,20 @@ static void tc_bridge_enable(struct drm_bridge *bridge)
 
 	regmap_write(tc->regmap, VFUEN, VFUEN_EN);
 
-	val = LVCFG_LVEN_BIT;
-	if (tc->lvds_dual_link) {
-		val |= TC358775_LVCFG_LVDLINK(1);
-		val |= TC358775_LVCFG_PCLKDIV(DIVIDE_BY_6);
-	} else {
-		val |= TC358775_LVCFG_PCLKDIV(DIVIDE_BY_3);
-	}
+	/* Configure LVDS clock */
+	clkdiv = bpp / tc->num_dsi_lanes;
+	if (!tc->lvds_dual_link)
+		clkdiv /= 2;
+
+	val = u32_encode_bits(clkdiv, LVCFG_PCLKDIV);
+	val |= u32_encode_bits(PCLKSEL_HSRCK, LVCFG_PCLKSEL);
+	if (tc->lvds_dual_link)
+		val |= LVCFG_LVDLINK;
+
 	regmap_write(tc->regmap, LVCFG, val);
+
+	/* Finally, enable the LVDS transmitter */
+	regmap_write(tc->regmap, LVCFG, val | LVCFG_LVEN);
 }
 
 /*

-- 
2.39.2


