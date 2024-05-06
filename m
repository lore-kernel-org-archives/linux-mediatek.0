Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A62EFC25B4F
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 May 2024 14:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=64wVEfSynVptGH6hwKSFay1aUoj4V5DdAvkLfwVrQHs=; b=a6+uaBmU35k4svIbIjOibGT925
	KfFTDeDh114l6jJm81QyJZnShNUEU6dJ7m5mlN80PqYbLwEIK26Am0JlYKdUXn8FhZ6NjomX6Tm44
	URyA1Brs4IRvQRNbeNaKEO6WycU3WzVi+FVQs65myiaAw66zzHc9Xs45IOqhpeFrkiEQNvcS5QT2q
	LJ0b70PwWrB8+RTxtZdF320+aMfM+wbaBYpyGwhtH2Kr8biRk4HS9EdUiegshtypqulYEfxsybiqH
	A2IX7fYKIIOK6r/0X4undY+PrePJvMZiUZeNS4CK6q4VqF617LSEyAy4OKBKYIXjghN9OoOjlsoYU
	QsTvSQmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3zat-00000007iiR-1MqN;
	Mon, 06 May 2024 14:45:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3yUs-00000007SvH-1Hhk;
	Mon, 06 May 2024 13:35:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 77586612B3;
	Mon,  6 May 2024 13:35:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7DC2C116B1;
	Mon,  6 May 2024 13:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715002513;
	bh=pK9ICrlhU4yI7C8UmfAMhDpOxq05RC8K7IM/L/yquWw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kD47ngL8uom7ANO5DcjrAAVmsG/a74GHNet69KvrccOpmOl+iw4znkaN5ZTvBBOtn
	 KEH5rlnCJbms83AhqwyyASbLLAekbP61TQQsLpg/hpD69G2D/8T7Q3/yZCZcFl2u4p
	 37nfSL+WDB9rMSWujjU2hcXW+NTJg6iCGrCfJgpD9IhRCwOGBs3scufG5lSUnzc0d7
	 UHyOzgfIBNcGd9vWR4YkB9oygn2/2iHBfxxD8jxluCoVhezMvA40NmN2UXBv2AHJy+
	 ZcrDgHDdbvzWruLtC2LRRrq3NZv/Alc3WV4Ypbjt2ACSPWr1CdSKLaBNlnLqi1F0Ke
	 eEKv2/eLNYJZA==
From: Michael Walle <mwalle@kernel.org>
Date: Mon, 06 May 2024 15:34:31 +0200
Subject: [PATCH 02/20] drm/mediatek: dsi: provide LP-11 mode during
 .pre_enable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240506-tc358775-fix-powerup-v1-2-545dcf00b8dd@kernel.org>
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
X-CRM114-CacheID: sfid-20240506_063514_879229_21808BE7 
X-CRM114-Status: GOOD (  10.33  )
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

As per specification in drivers/gpu/drm/drm_bridge.c the data lanes
should be in LP-11 mode after .pre_enable() has been run. HS mode of the
data lanes are enabled with mtk_dsi_start(). Therefore, move that call
to the .enable() callback.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index c255559cc56e..ed45c9cc3137 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -711,8 +711,6 @@ static void mtk_output_dsi_enable(struct mtk_dsi *dsi)
 	mtk_dsi_set_mode(dsi);
 	mtk_dsi_clk_hs_mode(dsi, 1);
 
-	mtk_dsi_start(dsi);
-
 	dsi->enabled = true;
 }
 
@@ -759,7 +757,7 @@ static void mtk_dsi_bridge_atomic_enable(struct drm_bridge *bridge,
 	if (dsi->refcount == 0)
 		return;
 
-	mtk_output_dsi_enable(dsi);
+	mtk_dsi_start(dsi);
 }
 
 static void mtk_dsi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
@@ -771,6 +769,9 @@ static void mtk_dsi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 	ret = mtk_dsi_poweron(dsi);
 	if (ret < 0)
 		DRM_ERROR("failed to power on dsi\n");
+
+	/* Enter LP-11 state */
+	mtk_output_dsi_enable(dsi);
 }
 
 static void mtk_dsi_bridge_atomic_post_disable(struct drm_bridge *bridge,

-- 
2.39.2


