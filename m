Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 670EEC25B5F
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 May 2024 14:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bPQKE4S2VZbueyfavtxziiFoV3GGms9XNypz+UATpH0=; b=k6rGJ4dLQ4poTWNFEUoGW1QWww
	IBARgEOMWGOZ23TWimh9xzRydXbQRs4VdE1JrS8gi85NeVvdhhgb3LblgZueVFyyTXr1wXq3XMCCH
	MUnrUz6u2Ez8h/oJGGuOLflhvP2Lz5FaqnqeJPftFJqsRiMB3W895LqPsyzogKQm/BU7uMYZNvSml
	DZag579qkbRxNPhNTxqG8n8Kya4xjfBnPJ77G3/tj0CVU7avTPnWrU0V4miZwLGtbYIw50aQy2EPf
	4WSpEmNnsigMGUK5YoMBeneZernjeaWK6/RENwEA68yeViE9/L4CGEuAb0HIr1Kz/ThbwYiZ50ky8
	zU36yg6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3zau-00000007ij4-0NWm;
	Mon, 06 May 2024 14:45:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3yUx-00000007T05-0E2I;
	Mon, 06 May 2024 13:35:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 59EB26120A;
	Mon,  6 May 2024 13:35:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97E0BC3277B;
	Mon,  6 May 2024 13:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715002518;
	bh=TuYMERR0RaUaMlVi9q6zNXvlpim/SMByOC7RHr5bFKA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PFKvbrefjvVIf53ItfzYZvHVza+Ja0BR+Vd7BHiSXEA1gtTj09HbUVXMNyYUMffFR
	 /Wp4yNUxMD8kCBWwzKQpWQL4T3Y1mWiGvXFjBH9WDLET+qYEAWK7PtxrFjhQbixWQ6
	 oOE3PIhRQFuXvdLywvfIOk4Mp9D/DKUsRd0qFNyYPec+lVs1DljLS74AIuLqldYBA9
	 deu6o8W1gp9xjfDwqskRyyX50TBHOEwcMQLVNJUfPrMxdl5KJffx3jeaz+/H/egyHv
	 VoDfgA+MewIY+jixWlLFUWUMd74PAm5lZFYCZ8MAjAzwC4SeFjosrNDTgoZopKvqhZ
	 ySULCnuFnPlmw==
From: Michael Walle <mwalle@kernel.org>
Date: Mon, 06 May 2024 15:34:32 +0200
Subject: [PATCH 03/20] drm/mediatek: dsi: add support for
 .dsi_lp11_notity()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240506-tc358775-fix-powerup-v1-3-545dcf00b8dd@kernel.org>
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
X-CRM114-CacheID: sfid-20240506_063519_654411_04B55C5E 
X-CRM114-Status: UNSURE (   8.78  )
X-CRM114-Notice: Please train this message.
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

drm_bridge_dsi_lp11_notify() shall be called while both the clock and
data lanes are still in LP-11 mode. Add the callback.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index ed45c9cc3137..d4a5a2bd591a 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -709,6 +709,7 @@ static void mtk_output_dsi_enable(struct mtk_dsi *dsi)
 
 	mtk_dsi_lane_ready(dsi);
 	mtk_dsi_set_mode(dsi);
+	drm_bridge_dsi_lp11_notify(dsi->next_bridge);
 	mtk_dsi_clk_hs_mode(dsi, 1);
 
 	dsi->enabled = true;

-- 
2.39.2


