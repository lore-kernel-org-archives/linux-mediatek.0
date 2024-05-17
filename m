Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2132CC04FFE
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 May 2024 09:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GTlnCi7AzbNoF5CmVZPFQOFsREJaSB9TFOOPDhFQIW0=; b=2AQ68szVKvzhzsMe/7xjsLxozO
	QSv7oPP/jeA0coLzo4Bkx2CroSKV5vDqGtGWQm4dIPY22QfqTjCBDT2SPb2KDDJZD6L5Wgwb0UI9X
	FAby8vuNYnBJ2XiLsYvvneIHzvIQ4RrGLE5DayyfqQLDTtkCGEcHsqtvquVpeUZ86yUeOe+FX73G9
	Zis2f0P7p2uMAt+aVZzKE1HV3ZUM6yInEupUJnBYflDyljyNSyZSvEdzawUIdIwvkHZkmzEoOY2Jf
	vq1ywBsnZtGI1BdWxbPd+FdkBxPcRIgg2D0J8nvYUWEqQto8pS+71H6y+f/UXrSm2c8OQJl0Sb6DP
	rPn7AUMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7tvH-00000007MB5-2G04;
	Fri, 17 May 2024 09:30:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7tvD-00000007M8r-3S7i;
	Fri, 17 May 2024 09:30:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A7AA8618CA;
	Fri, 17 May 2024 09:30:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1284C2BD10;
	Fri, 17 May 2024 09:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715938235;
	bh=0Ppg0DAmyJKW6/IVs6KUizB75FN0TSYnPMZbnsVDHgs=;
	h=From:To:Cc:Subject:Date:From;
	b=bmH5v00wYUvLkqz9+qA8rWRCupLwX1m5hMeQDJUs2qwYwkbzF9ljuNOloc11WvjyP
	 hvUSG9PXL4eIZwZp0lRZmjOam88aPbFXJDXvDchIm6iWfQ628f88uEx0xNhlri7gSG
	 mE0fl0sBvBSVlreZ+Kwjf6A5Cx7UNduJJ4D08U50oibH27oiPdvytGeH1FG/Ib7o29
	 D8KnrhHLu8YBqtv+4OZLc85M438kcmrOREv46vm1cjXNLK1s3bvEVZ+H6Y52UoBBEB
	 K6vQl5keKuLDsify+oRjgAmE65x4Gpb4zBidqZ5M/5H3R6b8ZzTJ3z7w8DZeM7zrlD
	 Zxti9UU8qPyIA==
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
Subject: [PATCH] drm/mediatek/dp: fix spurious kfree()
Date: Fri, 17 May 2024 11:30:24 +0200
Message-Id: <20240517093024.1702750-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240517_023039_940793_BA446DF4 
X-CRM114-Status: GOOD (  13.57  )
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


