Return-Path: <SRS0=13eL=E5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95DB9C2D0E4
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2020 23:41:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 155A920717
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2020 23:41:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bScISsY6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="TekI3Ps1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 155A920717
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7i788MvNuRDN24gdHqv7BJMO5k5wDLR8G5WkiXUNNB0=; b=bScISsY6M/AILz+yI/11Ju2ay5
	Qi2cEpKZmp2cqGhlrU1SxOKmdQHFtLkEhVOex7DBo2+6bIhPCfgCJRpCL3f5ypTSlRak1OHR0WrV3
	XcRClNPuVe/I9cPQW55GUWHPApOyKlr03MolXWSY0jpii3f3y5/OlKvTvodKOhv0Mmvd7wSB/n6AV
	KM7xmxRENQdCsV2dhjLgyMAmpaEJhrUq9x9GY/97HOv/euOdsCNmWTro6zumUQcveGbZt9Nf6VMjx
	sQlKM+VFLcs+7HpjI8SuvDD/+G1R/7DrGh6SAutTrX1YiVi2FUy76dj4iXtsz3fSVBo6sJ4e9CiWC
	lVT1s9MA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khLSk-00087p-6G; Mon, 23 Nov 2020 23:41:38 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khLSh-00087V-OX
 for linux-mediatek@lists.infradead.org; Mon, 23 Nov 2020 23:41:36 +0000
Received: from DESKTOP-GFFITBK.localdomain (218-161-90-76.HINET-IP.hinet.net
 [218.161.90.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D5ACE20717;
 Mon, 23 Nov 2020 23:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606174894;
 bh=x50T4/BWkKqQyZJdtEgH9FkPlcfZQCayLZinZfHrUXI=;
 h=From:To:Cc:Subject:Date:From;
 b=TekI3Ps1UVMVo6m4zXPZZ5RaqWJ7ceDtKCwleboPycNYJkP78GmC/Ab0fLnGl7wCz
 MWW4glcQiGwpmfRGfnj5WxhO+WCzauC3ubsYUFAmyLTtVZP5Olr6OSGi5YttcaBa+7
 TE6A+CX40iBgTdqRjvq370F5yt2G8+CdaShHvE1Y=
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org
Subject: [GIT PULL] mediatek drm fixes for 5.10
Date: Tue, 24 Nov 2020 07:41:31 +0800
Message-Id: <20201123234131.387-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201123_184135_904306_236192D6 
X-CRM114-Status: UNSURE (   7.87  )
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
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Dave & Daniel:

This includes:

1. Remove unused variable.
2. Modify horizontal front/back porch byte formula.

Regards,
Chun-Kuang.

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-fixes-5.10

for you to fetch changes up to 487778f8d22fcdebb6436f0a5f96484ffa237b0b:

  drm/mediatek: dsi: Modify horizontal front/back porch byte formula (2020-11-21 18:31:07 +0800)

----------------------------------------------------------------
Mediatek DRM Fixes for Linux 5.10

1. Remove unused variable.
2. Modify horizontal front/back porch byte formula.

----------------------------------------------------------------
CK Hu (1):
      drm/mediatek: dsi: Modify horizontal front/back porch byte formula

Enric Balletbo i Serra (1):
      drm/mediatek: mtk_dpi: Fix unused variable 'mtk_dpi_encoder_funcs'

 drivers/gpu/drm/mediatek/mtk_dpi.c |  9 ------
 drivers/gpu/drm/mediatek/mtk_dsi.c | 61 ++++++++++++++------------------------
 2 files changed, 22 insertions(+), 48 deletions(-)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
