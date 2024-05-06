Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF44FC25B4F
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 May 2024 13:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4BQmtEZV/yonZCDjMvNhltvj6dDRsNeCnO0rfrstorw=; b=wQ3wXQLfRYLVFB6fn5VK11P012
	QzTP1rRcjmz/T+VMbgiXZODhy/YaG4Wu1Pw7uNH2qOkIamskoioXemcihhqjxyZDTEDjqqvELXODH
	CMSlqYKAB31yw/Dk+qqUiZBWeEKI/hOJADObBpRWIESF3rUIm+hMI8HNWPYw4xhXRRAAxCpZiwte4
	SjXYbot6xtwb2Zp2Yi/8rMRLQWctkj8OuFhJjYUhG8Mq7Z9PmbWrOkdz16IoEkPbUlRdQ6HlJ2i2R
	2taXB1wktPyKa4VXXainjb4UMTBWng59h7uEysNaCXwDdte1GxxV7TcRQRuTWKfDfqGiAkqbLqNf6
	mRBUEpmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3yWC-00000007TwI-0LqO;
	Mon, 06 May 2024 13:36:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3yVk-00000007Tax-1Hr7;
	Mon, 06 May 2024 13:36:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=4BQmtEZV/yonZCDjMvNhltvj6dDRsNeCnO0rfrstorw=; b=Qq/tMPqny9akZ6ebKqqOzb7Rt7
	RKK5sT2Vj0wYuMhOTeXoKicEdIXzG0GlpIvu+UuHIEfMlABidgWJcY9XTSSaFvPD6ZDbGYbMlkb6u
	Dzhu2WpPK5F3x6rStp4IO41LtwCCUPcH+g1+AmzP928Mk6ClGWOop9QlgLe2H19dZRMW1zJZ0kVG8
	yfTX84saggCnAzFYyl6ygT+6yxhUZghJL3e3K/NH9ecE0V2mdDi3BGRThkrX/oT641hhubH/EDQ/f
	87U/KwGkAvXlgcktRFBhUWFOlD6NurCXzyADkRoAc0ZZp56P1Y0AbWjfZL6LxLh29ULBUGsukjapO
	EbRRJeAw==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3yVY-00000001j7z-3qxt;
	Mon, 06 May 2024 13:36:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B04B261180;
	Mon,  6 May 2024 13:35:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC6E7C4DDE0;
	Mon,  6 May 2024 13:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715002552;
	bh=WxRrG6WTFlRQfn6WWcefR6HHCbkvvHD6Cc1lLV/qbGE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fkIFGsQvkv1zts7XnHArWvq5f6naVeYQf+gyv4hIjws7yh55elTEiD8E/gZClAhKt
	 2Nm8vAV4FymXXd+glXnlSr9Wi4znWxmiXt0ju4tdA60Zf/sl9QcxuMD6XMzogZ0i+f
	 XZekXyKMV8g+eGYA8o2AxeORRn1LY73iuelV5XTvS8qB9VhsOyNcdYRR1VI7F31Bqy
	 61wBlpLyw6poCnKygq72ifnnqGRa2Y9LtUlhMr6OB6IDF7522UfUhiu07Dc907F4GA
	 LrfmNplDZxSkhYiQGJjHvN4Rf3vmZd1re2RAEgCYpFFCwgSkRTME6JNwvTXNNQaen+
	 +vPi2Xo0NRgZQ==
From: Michael Walle <mwalle@kernel.org>
Date: Mon, 06 May 2024 15:34:39 +0200
Subject: [PATCH 10/20] drm/bridge: tc358775: simplify lvds_link property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240506-tc358775-fix-powerup-v1-10-545dcf00b8dd@kernel.org>
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
X-CRM114-CacheID: sfid-20240506_143559_363653_5DDD3328 
X-CRM114-Status: GOOD (  12.61  )
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

The LVDS link can either be a single link or a dual link. No need for a
u8. Replace it with a bool "lvds_dual_link".

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/gpu/drm/bridge/tc358775.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/tc358775.c
index a9d731e87970..be2175571b99 100644
--- a/drivers/gpu/drm/bridge/tc358775.c
+++ b/drivers/gpu/drm/bridge/tc358775.c
@@ -231,7 +231,7 @@ struct tc_data {
 	struct regulator	*vddio;
 	struct gpio_desc	*reset_gpio;
 	struct gpio_desc	*stby_gpio;
-	u8			lvds_link; /* single-link or dual-link */
+	bool			lvds_dual_link;
 	u8			bpc;
 
 	enum tc3587x5_type	type;
@@ -409,7 +409,7 @@ static void tc_bridge_enable(struct drm_bridge *bridge)
 	regmap_write(tc->regmap, VFUEN, VFUEN_EN);
 
 	val = LVCFG_LVEN_BIT;
-	if (tc->lvds_link == DUAL_LINK) {
+	if (tc->lvds_dual_link) {
 		val |= TC358775_LVCFG_LVDLINK(1);
 		val |= TC358775_LVCFG_PCLKDIV(DIVIDE_BY_6);
 	} else {
@@ -460,8 +460,8 @@ tc_mode_valid(struct drm_bridge *bridge,
 	 * Maximum pixel clock speed 135MHz for single-link
 	 * 270MHz for dual-link
 	 */
-	if ((mode->clock > 135000 && tc->lvds_link == SINGLE_LINK) ||
-	    (mode->clock > 270000 && tc->lvds_link == DUAL_LINK))
+	if ((mode->clock > 135000 && !tc->lvds_dual_link) ||
+	    (mode->clock > 270000 && tc->lvds_dual_link))
 		return MODE_CLOCK_HIGH;
 
 	switch (info->bus_formats[0]) {
@@ -516,7 +516,6 @@ static int tc358775_parse_dt(struct device_node *np, struct tc_data *tc)
 
 	of_node_put(tc->host_node);
 
-	tc->lvds_link = SINGLE_LINK;
 	endpoint = of_graph_get_endpoint_by_regs(tc->dev->of_node,
 						 TC358775_LVDS_OUT1, -1);
 	if (endpoint) {
@@ -525,13 +524,14 @@ static int tc358775_parse_dt(struct device_node *np, struct tc_data *tc)
 
 		if (remote) {
 			if (of_device_is_available(remote))
-				tc->lvds_link = DUAL_LINK;
+				tc->lvds_dual_link = true;
 			of_node_put(remote);
 		}
 	}
 
 	dev_dbg(tc->dev, "no.of dsi lanes: %d\n", tc->num_dsi_lanes);
-	dev_dbg(tc->dev, "operating in %d-link mode\n",	tc->lvds_link);
+	dev_dbg(tc->dev, "operating in %s-link mode\n",
+		tc->lvds_dual_link ? "dual" : "single");
 
 	return 0;
 }

-- 
2.39.2


