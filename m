Return-Path: <SRS0=ccVP=NK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63021C4338F
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Aug 2021 00:16:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 057B0610A6
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Aug 2021 00:16:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 057B0610A6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=grqCwVEw4LN+zyrwuivVASOP3kVW+s7bzGuz8zqcbTo=; b=dynyizRKqRjXse
	K7eTFuhK7diEfzoQrEGHum7eYP3uB0x4Pngx8RiSuBLrcNLnx6/JZ8u54BaHhPsLUh9IeGTuDt8uv
	2VqcoM5L6VihLGbxuZlq+pzMpToS4kDrt1/85kTNcO7Qo7dpBmI9ElWnnsV/NG/z4qh++NdEuzwdJ
	Qz7CCHv/9Kr+JHNF8lyGDelR/oLD4QHXv3HrExJ+CrmYSZ9C1yFrMU1uafwam4/QGFNi69d7F/Jlq
	dqMzPeVqb21S+4AZhyxB0s184bIvC3QbwOjTBNEbmR8Q9VBsAY2FGt86MM/cJoO8OLimD8sAAVq8o
	xQ6sG1PzIEX0X7MYfHig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGVjd-006rZy-T2; Thu, 19 Aug 2021 00:16:41 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGVjb-006rZd-MU
 for linux-mediatek@lists.infradead.org; Thu, 19 Aug 2021 00:16:41 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id AB6876108E;
 Thu, 19 Aug 2021 00:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629332198;
 bh=zZft6P060s9BnxZt1kX87KRPlg3Gc3gLaiETgzf3xgI=;
 h=From:To:Cc:Subject:Date:From;
 b=Ys0pbb+OWDWuDLO5J97eZjdaqlzDdZrb2c1uXlc9idzKmJZPliOYwg1S1VJ+VwP5U
 6V0bMJuTCWJIWELS1gEz6VnmwZy4ZGd+aGXLHnZw+BUvZVllt9dx3ETT7x28Tn8oC5
 /uCxZtSxqwuo6odvUYWoat/5VMN/ONwn8hzLMCcUV+rGT4xdDsBsYD8PAc7g4zml2k
 BVJF8LnP2YBmMp3tbDZ3j1deRG6IKONq9ixHJErLeYWgv8yTrYazSIeQNhfdssXS0L
 vWCJEVatVyhMaMskdAXYaPNDyOuAazpDoI45Bi6sf59TrFGcLT9dqMuYVo+lJ9+js0
 BcAWtnzmKrJXg==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org
Cc: "jason-jh . lin" <jason-jh.lin@mediatek.com>
Subject: [GIT PULL] mediatek drm fixes for 5.14-2
Date: Thu, 19 Aug 2021 08:16:35 +0800
Message-Id: <20210819001635.14803-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210818_171639_796185_9CD84904 
X-CRM114-Status: UNSURE (   4.94  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Dave & Daniel:

This includes:

1. Fix AAL output size setting.
2. Delete component in remove function.

Regards,
Chun-Kuang.

The following changes since commit 1a64a7aff8da352c9419de3d5c34343682916411:

  drm/mediatek: Fix cursor plane no update (2021-07-22 22:57:52 +0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-fixes-5.14-2

for you to fetch changes up to da4d4517ba70216799e3eb3b9bd71aa9dca065da:

  drm/mediatek: Add component_del in OVL and COLOR remove function (2021-08-12 07:00:50 +0800)

----------------------------------------------------------------
Mediatek DRM Fixes for Linux 5.14-2

1. Fix AAL output size setting.
2. Delete component in remove function.

----------------------------------------------------------------
jason-jh.lin (2):
      drm/mediatek: Add AAL output size configuration
      drm/mediatek: Add component_del in OVL and COLOR remove function

 drivers/gpu/drm/mediatek/mtk_disp_color.c   | 2 ++
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c     | 2 ++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 2 ++
 3 files changed, 6 insertions(+)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
