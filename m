Return-Path: <SRS0=dHEP=CZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C50EAC43461
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2020 23:17:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4EBA822208
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2020 23:17:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sSpcdp7G";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="RzdpXDWx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4EBA822208
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=akLof9UR6FNRMbKM3jrySUAgdHhvYhQO1HfLCOl6ujg=; b=sSpcdp7G7UAmFxI5emwfD6oMa5
	XH7Mer1uu7+q2ABZiAog+yBdRfl+J6RLnvRRG7NtLjujcN3yqZU8nZBI0aUKkoJipmlyOXfDQhCHe
	d3zhsVlKiDBea/PhKnOJjqDRfcT0+U3GwznC+YoB3mZ4XUJpCFcOdfuep1fUbgYiOVG6eNc2VjsT+
	okE8GnLC+4yPDNgBnyo/eb8im2OLWku+8CtbYDdH+UyCq6Wklbefg1XltLJU/T5w9bO4Pm3+7PXvu
	b2Rd9bpN6YUUqhspIhKpMsPQ13d+RGorBOSSjhpgMRnr40/TYIkNXKxRTTADqUCB1vQHnzlRHlVwB
	3/Aouq/g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIgg8-0003FO-Gx; Wed, 16 Sep 2020 23:17:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIgg5-0003El-Qy
 for linux-mediatek@lists.infradead.org; Wed, 16 Sep 2020 23:17:30 +0000
Received: from DESKTOP-GFFITBK.localdomain (218-161-90-76.HINET-IP.hinet.net
 [218.161.90.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 910FB22208;
 Wed, 16 Sep 2020 23:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600298248;
 bh=MULisps7yVfJ/xqQ6XWdCeNRfg6H21sF8dYOVURz8d0=;
 h=From:To:Cc:Subject:Date:From;
 b=RzdpXDWxw9Fs6hd1/sEikYKPwgPaLXXGAF5xDyodcsdQOwi64L9yNEqYFzA1fKWv4
 vfpy+hc9Y33/KNkjMCHP28SQCwZ7MzpjF5T0glpUNoIMYBKiuODznTafenjCDpumqG
 +/kvVG5N0YFjgh23Yj0p1/fqZWLFHJaFVXKA8Llw=
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org
Subject: [GIT PULL] mediatek drm fixes for 5.9
Date: Thu, 17 Sep 2020 07:17:24 +0800
Message-Id: <20200916231724.30571-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200916_191729_930598_99D8C165 
X-CRM114-Status: UNSURE (   8.91  )
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
Cc: Yu Kuai <yukuai3@huawei.com>, Wang Hai <wanghai38@huawei.com>,
 Jitao Shi <jitao.shi@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Dave & Daniel:

This includes:

1. Fix scrolling of panel
2. Remove duplicated include
3. Use CPU when fail to get cmdq event
4. Add missing put_device() call

Regards,
Chun-Kuang.

The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5:

  Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-fixes-5.9

for you to fetch changes up to 0680a622318b8d657323b94082f4b9a44038dfee:

  drm/mediatek: Add missing put_device() call in mtk_hdmi_dt_parse_pdata() (2020-09-17 06:58:01 +0800)

----------------------------------------------------------------
Mediatek DRM Fixes for Linux 5.9

1. Fix scrolling of panel
2. Remove duplicated include
3. Use CPU when fail to get cmdq event
4. Add missing put_device() call

----------------------------------------------------------------
Chun-Kuang Hu (1):
      drm/mediatek: Use CPU when fail to get cmdq event

Jitao Shi (1):
      drm/mediatek: dsi: Fix scrolling of panel with small hfp or hbp

Wang Hai (1):
      drm/mediatek: Remove duplicated include

Yu Kuai (4):
      drm/mediatek: Add missing put_device() call in mtk_ddp_comp_init()
      drm/mediatek: Add exception handing in mtk_drm_probe() if component init fail
      drm/mediatek: Add missing put_device() call in mtk_drm_kms_init()
      drm/mediatek: Add missing put_device() call in mtk_hdmi_dt_parse_pdata()

 drivers/gpu/drm/mediatek/mtk_drm_crtc.c     | 20 +++++++++++++-------
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |  1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c      | 19 +++++++++++++------
 drivers/gpu/drm/mediatek/mtk_dsi.c          |  9 ++++-----
 drivers/gpu/drm/mediatek/mtk_hdmi.c         | 26 ++++++++++++++++++--------
 5 files changed, 49 insertions(+), 26 deletions(-)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
