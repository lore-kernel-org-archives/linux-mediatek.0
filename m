Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A6DBF4613B
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Mar 2026 16:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NlOLajaC8V7xGELsJEa0gZlAeP8pyH4+vTXNG0BwlFo=; b=VA8KnOzOSOPvK6Wzx2uT77smov
	3YvbrNz7k8daG19AdtNmWCllyY6Irv5KvjbO3edejuHHUG6q6r6u6FzYF23JeYrDsFtSflbGWZas/
	EkZ4ElZYlZlI+jAa/5xUf4Q+Q1B400Ka2kqWXiAiMjxhj+HAMzxjBIlyTfLVkhLq1E6EwSTw1O71x
	zgZam8q0l7kmkar4PPS1FYyCR6RDUqc5z+R+ynOUYUxBLMTn7p4lTg9iok4btgtjp41zIDGenuu/X
	T4beu0flm/T8ms77YHcRlcKKrSQHAs0Fvnag4F5pgVBFNURLbzSW68NCvbPbgGPRqL8wciziiVDPq
	ss3XcHjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4hip-0000000H5Bo-3GXN;
	Mon, 23 Mar 2026 16:01:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4hin-0000000H5BH-3dxk
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Mar 2026 16:01:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C852542AC8;
	Mon, 23 Mar 2026 16:01:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DC68C2BC9E;
	Mon, 23 Mar 2026 16:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774281698;
	bh=RFQsXbP247wVx26DFBXtP1Ex3otSybRZaG6QqYnjRrg=;
	h=From:To:Subject:Date:From;
	b=nydTAJC4ZplaqEyA+orC2kGx+dGT8b+CkLN1/MEuyGZT8HGVb7gtLLJfV3QO1r8ED
	 wBdfNgwfq3uYzZJ8LyHpwPEADTXjVc67wxi1m4Gk1cG/APyXGd3NtmKTP8ru3xj1cH
	 T0k5ABv3Yb6aBGuytwYmh6ppydWcG2Z532fg60jJPfHbMhHsiOGRD6tg7Kd2O9roEy
	 cM7051vBbrwpnTnhFxm2Fwb5q7qSrCmSTsfNZ30bPsuyAjRxowPJRxGtAYvvL8c6dk
	 thyEM9z7+yLtshXFR9DlEucak53jMY+mxzKylOpdAjXO2oEfSNKtSkZwAjh9S7simj
	 PXiq35gt7W9Ug==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>
Subject: [GIT PULL] mediatek drm fixes - 20260323
Date: Mon, 23 Mar 2026 16:01:35 +0000
Message-Id: <20260323160135.39609-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_090141_928285_34694818 
X-CRM114-Status: UNSURE (   4.73  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Dave & Sima:

This includes:
1. dsi: Store driver data before invoking mipi_dsi_host_register

Regards,
Chun-Kuang.

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-fixes-20260323

for you to fetch changes up to 4cfdfeb6ac06079f92fccd977fa742d6c5b8dd3a:

  drm/mediatek: dsi: Store driver data before invoking mipi_dsi_host_register (2026-03-22 14:15:44 +0000)

----------------------------------------------------------------
Mediatek DRM Fixes - 20260323

1. dsi: Store driver data before invoking mipi_dsi_host_register

----------------------------------------------------------------
Luca Leonardo Scorcia (1):
      drm/mediatek: dsi: Store driver data before invoking mipi_dsi_host_register

 drivers/gpu/drm/mediatek/mtk_dsi.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

