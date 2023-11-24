Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59A6FC61DF7
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Nov 2023 13:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:From:Cc:To:Subject:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8Rtyqo6Q0wXy9qUKJ11L70si4F73JAZCoCj03HX/vXU=; b=z+SfFSe4hKg8WkQU6mI9N+e/Ya
	wjnwd0+CW2qIvT0ruxxT6gXSVWNrfs0Utn5G6ZV5dgia8ksX7rDCDd5AW0KGPr1MqlRQYnjZB4NAW
	Z3TECqICCFzJ3tR+rDikx6lInMUYgLGC3FpcfpXh04/3a2FwWgES6Ai63fPoS0+XklAGPDpyvfeIa
	6dBFz5lHuWjOyIhY8bVWMCXiGCi3PqtS7YKhnMeD1DKS+ihOfTDOBLdcGVjHAeZ1fRnsfSNgN4lJF
	Sodhef6CLu6pQh9yGjMJp7L7V+4MSw51SvaH+swyr0RqiPLtMXZUTYJ57NAYa0Op3eD6D20/beqUS
	Twe0PtDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6W5y-007I1R-0t;
	Fri, 24 Nov 2023 13:19:46 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6W5p-007Hx7-1r;
	Fri, 24 Nov 2023 13:19:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7ACD4CE296E;
	Fri, 24 Nov 2023 13:19:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E4DFC433C9;
	Fri, 24 Nov 2023 13:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700831971;
	bh=Z6oGvUUwjjwZM0U5/xSGH1kTcXraqzbQ/YC1loagjVM=;
	h=Subject:To:Cc:From:Date:From;
	b=oFWiJ+meyfFQq6uNvNQCZhMHQNo7KppZtnBVrB42TjQbwbRSPzKKQk6XMGhQp/ecP
	 E4dDQ5LflrAq7kiDKqKI/ZgIx6NR6ejPHyOBrhwRbuX4mi7mrFIdM/3wd/mlntxH9B
	 dsgBhY0rFdKBn/XduQGimay1kOs8XgGIzeFlyOk8=
Subject: Patch "drm/mediatek/dp: fix memory leak on ->get_edid callback audio detection" has been added to the 6.5-stable tree
To: angelogioacchino.delregno@collabora.com,chunkuang.hu@kernel.org,dmitry.osipenko@collabora.com,dri-devel@lists.freedesktop.org,granquet@baylibre.com,gregkh@linuxfoundation.org,jani.nikula@intel.com,linux-arm-kernel@lists.infradead.org,linux-mediatek@lists.infradead.org,matthias.bgg@gmail.com,p.zabel@pengutronix.de,rex-bc.chen@mediatek.com,wenst@chromium.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Fri, 24 Nov 2023 13:18:42 +0000
Message-ID: <2023112442-fondness-unshaven-c495@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_051938_079254_DC8A07DF 
X-CRM114-Status: GOOD (  15.41  )
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

to the 6.5-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-mediatek-dp-fix-memory-leak-on-get_edid-callback-audio-detection.patch
and it can be found in the queue-6.5 subdirectory.

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
@@ -1983,7 +1983,6 @@ static struct edid *mtk_dp_get_edid(stru
 	bool enabled = mtk_dp->enabled;
 	struct edid *new_edid = NULL;
 	struct mtk_dp_audio_cfg *audio_caps = &mtk_dp->info.audio_cur_cfg;
-	struct cea_sad *sads;
 
 	if (!enabled) {
 		drm_atomic_bridge_chain_pre_enable(bridge, connector->state->state);
@@ -2010,7 +2009,11 @@ static struct edid *mtk_dp_get_edid(stru
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

queue-6.5/drm-msm-dp-skip-validity-check-for-dp-cts-edid-check.patch
queue-6.5/i915-perf-fix-null-deref-bugs-with-drm_dbg-calls.patch
queue-6.5/drm-mediatek-dp-fix-memory-leak-on-get_edid-callback-error-path.patch
queue-6.5/drm-edid-fixup-h-vsync_end-instead-of-h-vtotal.patch
queue-6.5/drm-mediatek-dp-fix-memory-leak-on-get_edid-callback-audio-detection.patch
queue-6.5/drm-i915-mtl-avoid-stringop-overflow-warning.patch
queue-6.5/drm-i915-tc-fix-wformat-truncation-in-intel_tc_port_.patch

