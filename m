Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4B3AC61D97
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Nov 2023 13:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:From:Cc:To:Subject:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ME19yR9ktyykMIsnC8THoPZMSGymC7EFaqjZdDAsCTg=; b=Lr9qdkIEr+3FEMRIF1+kmQyCPD
	GuNTGTKdGf823r8MDLcMTp/xn7WWd6Z6jdrsC9dnJqOHLQr63xkuQ8OakNwDpxYObj3TQmxLYHrCm
	eFXDegbW1UWyeR3x4eFWVEFRkRYEb/s/oUGt47FlvKuYVxqnlEFD3HoauK3G18FS8TtkiVdY6JevR
	m8AMPYz1UcV6d0rYUGdSQo8dTuXAaGFgObClUiy2dBmKAyc3J0MvAlhp54Z0d0j7ezluGmwb+U7wm
	AsZaen4CGCKi5nPp4U1LPXXxATS5auWQA7HFUwmtt922hwU8IIj8c+Df3cQDx7sNoOoSAtGvuGioH
	/1f3LjjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6W4h-007Hjz-1j;
	Fri, 24 Nov 2023 13:18:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6W4e-007HjE-2Z;
	Fri, 24 Nov 2023 13:18:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3E9C362232;
	Fri, 24 Nov 2023 13:18:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96703C43395;
	Fri, 24 Nov 2023 13:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700831903;
	bh=YhaSt4ZUxtT2RicGgxtWm94CumcGwYZCOKY/NPbxr+M=;
	h=Subject:To:Cc:From:Date:From;
	b=Oy75uLUTVzHIZVzOeNv1l6cK0mjZqRbblQqoMU9S49TBCRFZ65HBRpuUr2enN+i36
	 He+V2Osyq5R32z6KCQp/zvbO9HoVDgzSsTJmSlpyRMHhBtBBBp2QEXJ9a8mQL8MlKm
	 Ipu/C1Hz0X1Ph9wOSnjQWJhJhjDl/JvMYs4WomW8=
Subject: Patch "drm/mediatek/dp: fix memory leak on ->get_edid callback error path" has been added to the 6.1-stable tree
To: angelogioacchino.delregno@collabora.com,chunkuang.hu@kernel.org,ck.hu@mediatek.com,dmitry.osipenko@collabora.com,dri-devel@lists.freedesktop.org,granquet@baylibre.com,gregkh@linuxfoundation.org,jani.nikula@intel.com,linux-arm-kernel@lists.infradead.org,linux-mediatek@lists.infradead.org,matthias.bgg@gmail.com,msp@baylibre.com,p.zabel@pengutronix.de,rex-bc.chen@mediatek.com
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Fri, 24 Nov 2023 13:17:55 +0000
Message-ID: <2023112454-defile-acetone-ff7e@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_051824_922585_008CD4B6 
X-CRM114-Status: GOOD (  12.33  )
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

    drm/mediatek/dp: fix memory leak on ->get_edid callback error path

to the 6.1-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-mediatek-dp-fix-memory-leak-on-get_edid-callback-error-path.patch
and it can be found in the queue-6.1 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From fcaf9761fd5884a64eaac48536f8c27ecfd2e6bc Mon Sep 17 00:00:00 2001
From: Jani Nikula <jani.nikula@intel.com>
Date: Thu, 14 Sep 2023 16:10:58 +0300
Subject: drm/mediatek/dp: fix memory leak on ->get_edid callback error path

From: Jani Nikula <jani.nikula@intel.com>

commit fcaf9761fd5884a64eaac48536f8c27ecfd2e6bc upstream.

Setting new_edid to NULL leaks the buffer.

Fixes: f70ac097a2cf ("drm/mediatek: Add MT8195 Embedded DisplayPort driver")
Cc: Markus Schneider-Pargmann <msp@baylibre.com>
Cc: Guillaume Ranquet <granquet@baylibre.com>
Cc: Bo-Chen Chen <rex-bc.chen@mediatek.com>
Cc: CK Hu <ck.hu@mediatek.com>
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
Reviewed-by: Guillaume Ranquet <granquet@baylibre.com>
Link: https://patchwork.kernel.org/project/dri-devel/patch/20230914131058.2472260-1-jani.nikula@intel.com/
Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/mediatek/mtk_dp.c |    1 +
 1 file changed, 1 insertion(+)

--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -2005,6 +2005,7 @@ static struct edid *mtk_dp_get_edid(stru
 	 */
 	if (mtk_dp_parse_capabilities(mtk_dp)) {
 		drm_err(mtk_dp->drm_dev, "Can't parse capabilities\n");
+		kfree(new_edid);
 		new_edid = NULL;
 	}
 


Patches currently in stable-queue which might be from jani.nikula@intel.com are

queue-6.1/drm-msm-dp-skip-validity-check-for-dp-cts-edid-check.patch
queue-6.1/i915-perf-fix-null-deref-bugs-with-drm_dbg-calls.patch
queue-6.1/drm-mediatek-dp-fix-memory-leak-on-get_edid-callback-error-path.patch
queue-6.1/drm-mediatek-dp-fix-memory-leak-on-get_edid-callback-audio-detection.patch

