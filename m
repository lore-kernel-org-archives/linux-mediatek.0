Return-Path: <SRS0=cZv3=AS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92D4DC433DF
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jul 2020 15:40:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BC3B20738
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jul 2020 15:40:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ulboplIx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="VQia3i8b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BC3B20738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kkNM4SDSimQarB+PwKPFYRFTDKaFJ7Snw3vfHNBkicM=; b=ulboplIx1HhkF9ZSRjgh+iR3Nm
	AuCxYDr+Wspdqi8aAU/CCn9sQm6W863lVL7oEwm5Qu/xqDjEk/fesrnIHw/sbKbWUr56/NDgIIij3
	iyPzexN4GjGhX2WPN4XXdQ1Al9NejnZxfHN1SbyuBAsw3we7B8f5a+JCM1RIMELcZQ0wFwwvSmWJM
	aeDH52AItd/c1RRXnfk9FWfI2pTN3phA1GC4EdazBXHd+9h+e4fl5PcXk1FHxfuJwhvpFRDX7Ehup
	TgyFy5wlmEu/LQx8L3fMr+uwcNbXvqxaHS5d97QvPeDlI5h5nrjnGl2r2Oza1UyBV+dWaZ//5rgDB
	PGYrdbnw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jsphH-0001X1-2e; Tue, 07 Jul 2020 15:39:51 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jsphE-0001WX-F6
 for linux-mediatek@lists.infradead.org; Tue, 07 Jul 2020 15:39:49 +0000
Received: from DESKTOP-GFFITBK.localdomain (218-161-90-76.HINET-IP.hinet.net
 [218.161.90.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3FF5820738;
 Tue,  7 Jul 2020 15:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594136387;
 bh=OZxhBwXl2+QGrWctHl4G4FGR1qQy4iBCcbBcWDMw3c4=;
 h=From:To:Cc:Subject:Date:From;
 b=VQia3i8bZUIW9VG6hmLIgWUJlXRdoVqQqU2rsd7dDHd+xQuGvvLy5Cl0N7FsjAurG
 kSLTEzdvAPE9daZzROpZVsUOb0ZyIzuE7lX+bV6zyktMg+4GqSbh4LBSzc2TqpXDZG
 q+kQkcThjaIbXXkm7UROqKbYbz+EoEaZ0yunJjak=
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org
Subject: [GIT PULL] mediatek drm fixes for 5.8
Date: Tue,  7 Jul 2020 23:39:44 +0800
Message-Id: <20200707153944.604-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200707_113948_564964_C2E6B4DF 
X-CRM114-Status: UNSURE (   7.00  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Bernard Zhao <bernard@vivo.com>, YueHaibing <yuehaibing@huawei.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Hsin-Yi Wang <hsinyi@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Dave & David:

This include fixup for cmdq, mmsys, visibility checking and some refinement.

Regards,
Chun-Kuang.


The following changes since commit b3a9e3b9622ae10064826dccb4f7a52bd88c7407:

  Linux 5.8-rc1 (2020-06-14 12:45:04 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-fixes-5.8

for you to fetch changes up to 5ab546f5e6309373aef01a8d398e163ab7a78431:

  drm/mediatek: mtk_hdmi: Remove debug messages for function calls (2020-07-05 06:39:21 +0800)

----------------------------------------------------------------
Mediatek DRM Fixes for Linux 5.8

----------------------------------------------------------------
Bernard Zhao (1):
      drm/mediatek: Remove unnecessary conversion to bool

Enric Balletbo i Serra (3):
      drm/mediatek: Remove debug messages for function calls
      drm/mediatek: mtk_mt8173_hdmi_phy: Remove unnused const variables
      drm/mediatek: mtk_hdmi: Remove debug messages for function calls

Hsin-Yi Wang (2):
      drm/mediatek: Fix device passed to cmdq
      drm/mediatek: Check plane visibility in atomic_update

Matthias Brugger (1):
      drm/mediatek: Delete not used of_device_get_match_data

YueHaibing (1):
      drm/mediatek: Fix Kconfig warning

 drivers/gpu/drm/mediatek/Kconfig               |  2 +-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c        |  8 +---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c         |  6 +--
 drivers/gpu/drm/mediatek/mtk_drm_plane.c       | 25 ++++++++-----
 drivers/gpu/drm/mediatek/mtk_dsi.c             |  5 +--
 drivers/gpu/drm/mediatek/mtk_hdmi.c            | 12 +-----
 drivers/gpu/drm/mediatek/mtk_mt8173_hdmi_phy.c | 52 --------------------------
 7 files changed, 22 insertions(+), 88 deletions(-)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
