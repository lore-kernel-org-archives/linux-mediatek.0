Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99518C27C52
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jun 2024 08:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YeD6MfvMCDss8xIrAwzRquwsKR0GI7snBrlrIBm/Ko4=; b=RBJOKA6jiLY+ffzxl1CibmSXaf
	0WLoYBDMjB+2EU+g0s+TZ3eQBbHuWjQkPYtR1ATR7tnUc2UTe+i4k+1xgQW/qzNVsxdx1NcYZlHrA
	6vZQnjDKrXctmgQ56bSXRY5pU1ZDs/V1At0XogTpKysjMHsC6XpP3HMSY/dj+Ne/ELfxfVqspahAz
	CCNRfQmsLwz8kZNE0ZrHq1+7pKMCrOvfVz8DDXYEJ36UxBHSqSYsG9FUj+/+wwHBsWnvG3Gq0pOMP
	P3uVK4dJwYr6u66hxWz2cN+QgVz9f+iUtUuc80yUwDaesd8MP+DGQfywJvxvsQxDbtGu+pg34MsyG
	cwNpiy+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEPc6-00000001gjs-0bNe;
	Tue, 04 Jun 2024 08:33:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEPc1-00000001gjO-3S4l;
	Tue, 04 Jun 2024 08:33:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5199161199;
	Tue,  4 Jun 2024 08:33:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89DEBC2BBFC;
	Tue,  4 Jun 2024 08:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717490024;
	bh=WcdjXKp0usjBkPhOi1eWLnKB5YMWTKiIrOQDU48frSc=;
	h=From:To:Cc:Subject:Date:From;
	b=qZfdi1+5gE9tloM9plnd3OEOQJBcvuaiwPhWTsubkB3Hn1yhrHMBn2W32u+eBZSLB
	 j3Px4R8aU+jzL2Q/Gm+E1qYhquQJGBWvOizcZVm5lVCTgwmCmcQK/Y/KK0Ww9amtbW
	 lKZdaM1s5gQTgve53ySXMXBI7m43/erS8Hw7un8inpwt37c4JgVvBlmz9N3EJAuiVI
	 2wiAymER1ylE2RtZDuWBGJSPo3By47m53Oquc03Vua3beillfXm6uXsEBmSsTcyhyP
	 bxBZbxuxsEC2pnQDkmSK90BXCeNIsoxqqJRuIdAsLSCidQusCgsedOFQ4DFn12ZeYd
	 wbogKIXNYjCJA==
From: Michael Walle <mwalle@kernel.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Jani Nikula <jani.nikula@intel.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Michael Walle <mwalle@kernel.org>
Subject: [PATCH RESEND] drm/mediatek/dp: fix spurious kfree()
Date: Tue,  4 Jun 2024 10:33:37 +0200
Message-Id: <20240604083337.1879188-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_013345_950479_66C20337 
X-CRM114-Status: GOOD (  13.74  )
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

drm_edid_to_sad() might return an error or just zero. If that is the
case, we must not free the SADs because there was no allocation in
the first place.

Fixes: dab12fa8d2bd ("drm/mediatek/dp: fix memory leak on ->get_edid callback audio detection")
Signed-off-by: Michael Walle <mwalle@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 536366956447..ada12927bbac 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -2073,9 +2073,15 @@ static const struct drm_edid *mtk_dp_edid_read(struct drm_bridge *bridge,
 		 */
 		const struct edid *edid = drm_edid_raw(drm_edid);
 		struct cea_sad *sads;
+		int ret;
 
-		audio_caps->sad_count = drm_edid_to_sad(edid, &sads);
-		kfree(sads);
+		ret = drm_edid_to_sad(edid, &sads);
+		/* Ignore any errors */
+		if (ret < 0)
+			ret = 0;
+		if (ret)
+			kfree(sads);
+		audio_caps->sad_count = ret;
 
 		/*
 		 * FIXME: This should use connector->display_info.has_audio from
-- 
2.39.2


