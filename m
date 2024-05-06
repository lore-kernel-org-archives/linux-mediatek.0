Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C562FC10F16
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 May 2024 14:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0T+vh1iRxvVUFEtNL0FND4tlRk7huiUosBEtzmQXssc=; b=eQAO7qisKePOU78bXjjrzDUFjQ
	T/dvq1RXW8MdCf0mfernF009kIHiBXJhjeHqMoyro5cLAAy07y4PBstZhbPE74DsEFkHEIi6KnpOp
	erfeaSsYTiY2SOI9JyoT6aJ7KGNrkuGX/kQ0NDf6NeRtVpHf+iTmiz9j7IqqH9DLF8hLIBwy+knYj
	xoEcHFEUoQ7aZsyxInrcgrYpzRWfSR3l0t3AC4HGLWPN7zrlEXgoo5/BPuch96Z24cZRSeEHWQQV/
	fyWRnK6DGGWaWkELMODXQH3yEzS8zoVgRechti+3rWaYpUn5Lg4DhcDI6Atfp4OOyAkLJq8PeJVgr
	noc8K1sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3zas-00000007iiG-4BA6;
	Mon, 06 May 2024 14:45:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3yUn-00000007SqL-1LYN;
	Mon, 06 May 2024 13:35:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9975F612AF;
	Mon,  6 May 2024 13:35:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7B95C3277B;
	Mon,  6 May 2024 13:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715002508;
	bh=2gxAViJr9NJSI0wyF8/7Q/WmZNqJmwnGrC0yrjFayzk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GVbJ0rfY3xs6Ux0UxSoIfjcF29PmoHxtN3SrZJzOiF4gjY6sEQ5ignodSdmCheGi1
	 CXDdWHGpV7NtdHJeEuDVvMHAFb8xiVlY30Y7lruDFe37+n9bE4e+JYRLJ9xz88nIsR
	 DfumMVuId5PtRdGCcKxv+PGuiZ5jtcqEPjiVb+GeyoIDjefa43RHYbpMHWOHi8kb6s
	 jDu75XS7G6pLuFk+SwyxyqJCxneAM/tiialtVN+aX1fFhLp6Wm4qL+A33iJjFMeyGA
	 VH685LOmQKsjuF3229lcd00iPmIurLhYWyMnC54vhk5wlRCgM8SXUijj5zb1BXX7sg
	 5DE/nd2ifTc/Q==
From: Michael Walle <mwalle@kernel.org>
Date: Mon, 06 May 2024 15:34:30 +0200
Subject: [PATCH 01/20] drm/bridge: add dsi_lp11_notify mechanism
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240506-tc358775-fix-powerup-v1-1-545dcf00b8dd@kernel.org>
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
X-CRM114-CacheID: sfid-20240506_063509_858803_3F7D0FE6 
X-CRM114-Status: GOOD (  15.51  )
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

Some bridges have very strict power-up reqirements. In this case, the
Toshiba TC358775. The reset has to be deasserted while *both* the DSI
clock and DSI data lanes are in LP-11 mode. After the reset is relased,
the bridge needs the DSI clock to actually be able to process I2C
access. This access will configure the DSI side of the bridge during
which the DSI data lanes have to be in LP-11 mode. After everything is
configured the video stream can finally be enabled.

This means:
 (1) The bridge has to be configured completely in .pre_enable() op
     (with the clock turned on and data lanes in LP-11 mode, thus
     .pre_enable_prev_first has to be set).
 (2) The bridge will enable its output in the .enable() op
 (3) There must be some mechanism before (1) where the bridge can
     release its reset while the clock lane is still in LP-11 mode.

Unfortunately, (3) is crucial for a correct operation of the bridge.
To satisfy this requriment, introduce a new callback .dsi_lp11_notify()
which will be called by the DSI host driver.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/gpu/drm/drm_bridge.c | 16 ++++++++++++++++
 include/drm/drm_bridge.h     | 12 ++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 28abe9aa99ca..98cd6558aecb 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -1339,6 +1339,22 @@ void drm_bridge_hpd_notify(struct drm_bridge *bridge,
 }
 EXPORT_SYMBOL_GPL(drm_bridge_hpd_notify);
 
+/**
+ * drm_bridge_dsi_lp11_notify - notify clock/data lanes LP-11 mode
+ * @bridge: bridge control structure
+ *
+ * DSI host drivers shall call this function while the clock and data lanes
+ * are still in LP-11 mode.
+ *
+ * This function shall be called in a context that can sleep.
+ */
+void drm_bridge_dsi_lp11_notify(struct drm_bridge *bridge)
+{
+	if (bridge->funcs->dsi_lp11_notify)
+		bridge->funcs->dsi_lp11_notify(bridge);
+}
+EXPORT_SYMBOL_GPL(drm_bridge_dsi_lp11_notify);
+
 #ifdef CONFIG_OF
 /**
  * of_drm_find_bridge - find the bridge corresponding to the device node in
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 4baca0d9107b..4ef61274e0a8 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -630,6 +630,17 @@ struct drm_bridge_funcs {
 	 */
 	void (*hpd_disable)(struct drm_bridge *bridge);
 
+	/**
+	 * dsi_lp11_notify:
+	 *
+	 * Will be called by the DSI host driver while both the DSI clock
+	 * lane as well as the DSI data lanes are in LP-11 mode. Some bridges
+	 * need this state while releasing the reset, for example.
+	 * Not all DSI host drivers will support this. Therefore, the DSI
+	 * bridge driver must not rely on this op to be called.
+	 */
+	void (*dsi_lp11_notify)(struct drm_bridge *bridge);
+
 	/**
 	 * @debugfs_init:
 	 *
@@ -898,6 +909,7 @@ void drm_bridge_hpd_enable(struct drm_bridge *bridge,
 void drm_bridge_hpd_disable(struct drm_bridge *bridge);
 void drm_bridge_hpd_notify(struct drm_bridge *bridge,
 			   enum drm_connector_status status);
+void drm_bridge_dsi_lp11_notify(struct drm_bridge *bridge);
 
 #ifdef CONFIG_DRM_PANEL_BRIDGE
 bool drm_bridge_is_panel(const struct drm_bridge *bridge);

-- 
2.39.2


