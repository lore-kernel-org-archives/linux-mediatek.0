Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97907C25B4F
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 May 2024 14:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2tSx7Ic2SVtcK6pZ/xXOJj7K7utlsI2X9s7StX5o1K8=; b=Gr4P9/+Rj7jE4aVMRPF+6/iQxW
	bnNGo841HPoLRQZIV4wfZ8VIfe7aMjLafAvDDOBA19GMuVAKppEI+oFzNpi1SGND9ii3pu7XNAt2m
	DlAW2YsJjMlP3LgtJBF48D4JUyEuLm3ZilqkpPEGBm0lzEGehWE/S7HRwXGBwqKp51Stdp2WJXidl
	feYbuztzOgRN1iZzbelaCjnfGJ7Qo4isYalEXQe2sN/uVNewapb1V2fpEaLzL81pBZYbPxB6oLMYo
	/iMaen4fpGax4SAxtHxGxXdI/bjZpe56JwYu8uwKTLtzTi+xUuKhVY6AB+Rct5fJp7d9C6bUTmji+
	5XwU+ahg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3zb0-00000007ioK-0NMz;
	Mon, 06 May 2024 14:45:38 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3yW3-00000007Tpi-2OBk;
	Mon, 06 May 2024 13:36:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B9A8E612B8;
	Mon,  6 May 2024 13:36:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26C2BC4AF68;
	Mon,  6 May 2024 13:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715002586;
	bh=Hm8IbzH7o86qGsPyzm5DKDFy+pWLYyONwjVqfO4C4rg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=c9s/WUkzLe0/Gv60ykQuMYisA+qfLshxmw/LYojmokJi/IFRzXPXz3p7WTjXqTUcu
	 9cO9wxDiJJ7V/gNHD316aargzM6HJ5kQz5tLFxy4b09QtHmY9CGScsnCBH9raaqgg1
	 ovFY1Lzdq3L8wtWXvB9u6txLzMzgSj7OAApgNpQ7MjR4Q+gv5VBsFB0jo/myaNQ5ep
	 yyg8txlfAv6PT6aHaUh56acPXe/OiSPLwqS6+rv6rmUM7jbdnhK1aCssHYK1R/wfF7
	 AhMejO6EnmKXCMlB3MpkvgKwRNXoZhDi9d52bnu5PEsjffWVTT3Bf5rKI+RhyPmL8P
	 iWTPegQ6Oqw3g==
From: Michael Walle <mwalle@kernel.org>
Date: Mon, 06 May 2024 15:34:46 +0200
Subject: [PATCH 17/20] drm/bridge: tc358775: move bridge power up/down into
 functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240506-tc358775-fix-powerup-v1-17-545dcf00b8dd@kernel.org>
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
X-CRM114-CacheID: sfid-20240506_063628_199220_5F028503 
X-CRM114-Status: GOOD (  12.28  )
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

Move the bridge power-up and power-down handling into own functions.
This is a preparation patch to fix the power-up sequencing of the
bridge. No functional change.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/gpu/drm/bridge/tc358775.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/tc358775.c
index c50554ec4b28..d5b3d691d2c1 100644
--- a/drivers/gpu/drm/bridge/tc358775.c
+++ b/drivers/gpu/drm/bridge/tc358775.c
@@ -215,6 +215,7 @@ struct tc_data {
 	struct gpio_desc	*reset_gpio;
 	struct gpio_desc	*stby_gpio;
 	bool			lvds_dual_link;
+	bool			powered;
 	u8			bpc;
 
 	enum tc3587x5_type	type;
@@ -233,9 +234,8 @@ static inline struct tc_data *bridge_to_tc(struct drm_bridge *b)
 	return container_of(b, struct tc_data, bridge);
 }
 
-static void tc_bridge_pre_enable(struct drm_bridge *bridge)
+static void tc358775_power_up(struct tc_data *tc)
 {
-	struct tc_data *tc = bridge_to_tc(bridge);
 	struct device *dev = &tc->dsi->dev;
 	int ret;
 
@@ -256,9 +256,8 @@ static void tc_bridge_pre_enable(struct drm_bridge *bridge)
 	usleep_range(10, 20);
 }
 
-static void tc_bridge_post_disable(struct drm_bridge *bridge)
+static void tc358775_power_down(struct tc_data *tc)
 {
-	struct tc_data *tc = bridge_to_tc(bridge);
 	struct device *dev = &tc->dsi->dev;
 	int ret;
 
@@ -279,6 +278,20 @@ static void tc_bridge_post_disable(struct drm_bridge *bridge)
 	usleep_range(10000, 11000);
 }
 
+static void tc_bridge_pre_enable(struct drm_bridge *bridge)
+{
+	struct tc_data *tc = bridge_to_tc(bridge);
+
+	tc358775_power_up(tc);
+}
+
+static void tc_bridge_post_disable(struct drm_bridge *bridge)
+{
+	struct tc_data *tc = bridge_to_tc(bridge);
+
+	tc358775_power_down(tc);
+}
+
 /* helper function to access bus_formats */
 static struct drm_connector *get_connector(struct drm_encoder *encoder)
 {

-- 
2.39.2


