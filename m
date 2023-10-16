Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65E62CDB465
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Oct 2023 23:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=inXWXehLrf42YvGBg611PgHt+n2DhPKJqDiMSRFToig=; b=lQhfrb10nGqk8lKZBvz479whOP
	7wzOMpzJu5agyXtWUwY5cA6syXYZFHTMjRM5/lafZ0JlWL8KochodOu2XeJ7b4rnbVvFvvIu+u1H+
	T3M6UL117btqBIj56RbxEbELAV6/xMAazPySdkmbcW3GPxY22hUYRCHDrCvRxB/cmdwbvlX2AcBtr
	bANzr6Lsxmy8jK5q7qAMeLXYguvwte255xpXxKRYTGX0wiHCw/R/z3yFWva6S5dSblUTPb3+mIZt7
	evwceBpGBz18LeTR5kPZIBdKclebfhILz0izT4RHxoO+AqqMpZEuw412YPZh3BUIpdYYAoxXbdc1U
	lygj4nLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsX92-00ArZs-10;
	Mon, 16 Oct 2023 23:37:08 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsX8z-00ArYw-20
	for linux-mediatek@lists.infradead.org;
	Mon, 16 Oct 2023 23:37:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9C0C861193;
	Mon, 16 Oct 2023 23:37:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48DA9C433C8;
	Mon, 16 Oct 2023 23:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697499423;
	bh=flxy/IWr/8XwqeqSwSf+S0EMXqElTsnCWVl7sX/1ZpA=;
	h=From:To:Subject:Date:From;
	b=lybGVmEtnZqifsco0fh6YhDVq/Kj0xv+rNs8mYNEuqCcx1MFxMm3PsxX8sbu5hLvC
	 bUMdWFNvF28KyyyVBUK46vTE9+Aer2uL0dQQpyx0TLBa37k42cKlCT3mRTma0WRDL2
	 sh/W4IlUFXyZH1B3B6K99PFU3KYr1pJU71uiORXyw1GXMt4jH8YSSLAzgmBbMcIwrJ
	 q2B29c8qxDNw4Ccv8uMc1S0vD0ePSQf7eVK63d8pHXmKXlbHt/r4cUM10DJ/krZ+3n
	 kGuuJkzUbVIXA2wABMbmpNeP1jHD7iRzJlBBDvNMCSZj+4xL1apeR5fhzqJ3Ir0c6e
	 hbg2XwNHXBP+w==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: [GIT PULL] mediatek drm fixes 20231017
Date: Mon, 16 Oct 2023 23:36:59 +0000
Message-Id: <20231016233659.3639-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_163705_720944_ECFF4543 
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Dave & Daniel:

This includes:

1. Correctly free sg_table in gem prime vmap

Regards,
Chun-Kuang.

The following changes since commit 58720809f52779dc0f08e53e54b014209d13eebb:

  Linux 6.6-rc6 (2023-10-15 13:34:39 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-fixes-20231017

for you to fetch changes up to dcc583c225e659d5da34b4ad83914fd6b51e3dbf:

  drm/mediatek: Correctly free sg_table in gem prime vmap (2023-10-16 15:44:03 +0000)

----------------------------------------------------------------
Mediatek DRM Fixes - 20231017

1. Correctly free sg_table in gem prime vmap

----------------------------------------------------------------
Chen-Yu Tsai (1):
      drm/mediatek: Correctly free sg_table in gem prime vmap

 drivers/gpu/drm/mediatek/mtk_drm_gem.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

