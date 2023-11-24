Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1374C61D97
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Nov 2023 13:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:From:Cc:To:Subject:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DLYSpi2IIBdT1UaiLlaw/dIzdtoQo+eydP9qDF7FjJ4=; b=pG2MjosxH4L9DgqTHMJbC/618J
	OLIv1/cbwSutS7iMtpBMuSThCDmCK4RoyouxUfPGWZqZaEDRKgs3qk6BFfG8IZ7m86SkRZRdYyuDY
	W/dq5OToBmQ2lC6/7+K8+Hs7KJ2Lc+dkDom159PF9AaFcCUR7tG68qSFCbl+fR6FjRnKohnd/n3gq
	/HfRuELc38T9Yvu3QygTVbD0kr8cC8Bae3pwHv/ppOGpvR1wzcSBh//uN5U7rLHmT6Or9wgzWge4+
	RSwJzspADCiLgDO5N5Qyv0HKTlw5VNDJDXru/eO2kPW1gyBeiqTXtyDc44BuevqgH3z9Sppz0zZB/
	FP5gpSfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6W7E-007IRK-2A;
	Fri, 24 Nov 2023 13:21:04 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6W7B-007IPq-0c;
	Fri, 24 Nov 2023 13:21:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id D631EB830A1;
	Fri, 24 Nov 2023 13:20:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A84BC433AD;
	Fri, 24 Nov 2023 13:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700832059;
	bh=sEoj9n53qRs/A2Kl+/8b56M1qG901NPWD6gfWCRPhk0=;
	h=Subject:To:Cc:From:Date:From;
	b=UPO9t34gZw4LSbDGycF4Vo6GXdhF11oPkyFTQzuNyHLLCnS0yxwMZF7tKfUyJHM4U
	 USfxqkWVVa6fdc49RqMkkdBuadbLjfX6Gw+MFOEuDmitkCYsnZF60uCAb6SY+apUKZ
	 pHNGIUEH4368RVLxPedYZPEkMzyAQcVn6qbSHEzY=
Subject: Patch "drm/mediatek/dp: fix memory leak on ->get_edid callback audio detection" has been added to the 6.6-stable tree
To: angelogioacchino.delregno@collabora.com,chunkuang.hu@kernel.org,dmitry.osipenko@collabora.com,dri-devel@lists.freedesktop.org,granquet@baylibre.com,gregkh@linuxfoundation.org,jani.nikula@intel.com,linux-arm-kernel@lists.infradead.org,linux-mediatek@lists.infradead.org,matthias.bgg@gmail.com,p.zabel@pengutronix.de,rex-bc.chen@mediatek.com,wenst@chromium.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Fri, 24 Nov 2023 13:18:58 +0000
Message-ID: <2023112458-thirty-suffocate-b88f@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_052101_520928_88650A63 
X-CRM114-Status: GOOD (  15.35  )
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


This is a note to let you know that I've just added the patch titled

    drm/mediatek/dp: fix memory leak on ->get_edid callback audio detection

to the 6.6-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-mediatek-dp-fix-memory-leak-on-get_edid-callback-audio-detection.patch
and it can be found in the queue-6.6 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From dab12fa8d2bd3868cf2de485ed15a3feef28a13d Mon Sep 17 00:00:00 2001
From: Jani Nikula <jani.nikula@intel.com>
Date: Thu, 14 Sep 2023 18:53:17 +0300
Subject: drm/mediatek/dp: fix memory leak on ->get_edid callback audio detection

From: Jani Nikula <jani.nikula@intel.com>

commit dab12fa8d2bd3868cf2de485ed15a3feef28a13d upstream.

The sads returned by drm_edid_to_sad() needs to be freed.

Fixes: e71a8ebbe086 ("drm/mediatek: dp: Audio support for MT8195")
Cc: Guillaume Ranquet <granquet@baylibre.com>
Cc: Bo-Chen Chen <rex-bc.chen@mediatek.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-mediatek@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: <stable@vger.kernel.org> # v6.1+
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Link: https://patchwork.kernel.org/project/dri-devel/patch/20230914155317.2511876-1-jani.nikula@intel.com/
Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/mediatek/mtk_dp.c |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -2034,7 +2034,6 @@ static struct edid *mtk_dp_get_edid(stru
 	bool enabled = mtk_dp->enabled;
 	struct edid *new_edid = NULL;
 	struct mtk_dp_audio_cfg *audio_caps = &mtk_dp->info.audio_cur_cfg;
-	struct cea_sad *sads;
 
 	if (!enabled) {
 		drm_atomic_bridge_chain_pre_enable(bridge, connector->state->state);
@@ -2053,7 +2052,11 @@ static struct edid *mtk_dp_get_edid(stru
 	}
 
 	if (new_edid) {
+		struct cea_sad *sads;
+
 		audio_caps->sad_count = drm_edid_to_sad(new_edid, &sads);
+		kfree(sads);
+
 		audio_caps->detect_monitor = drm_detect_monitor_audio(new_edid);
 	}
 


Patches currently in stable-queue which might be from jani.nikula@intel.com are

queue-6.6/drm-msm-dp-skip-validity-check-for-dp-cts-edid-check.patch
queue-6.6/i915-perf-fix-null-deref-bugs-with-drm_dbg-calls.patch
queue-6.6/drm-mediatek-dp-fix-memory-leak-on-get_edid-callback-error-path.patch
queue-6.6/drm-edid-fixup-h-vsync_end-instead-of-h-vtotal.patch
queue-6.6/drm-mediatek-dp-fix-memory-leak-on-get_edid-callback-audio-detection.patch
queue-6.6/drm-i915-mtl-avoid-stringop-overflow-warning.patch
queue-6.6/drm-i915-tc-fix-wformat-truncation-in-intel_tc_port_.patch

