Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A95F2109C034
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Mar 2026 16:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZHA+0OGqEjtrHs72cGxtTXwLUKt91/R2APASGRTWv/M=; b=PquhDnx7U8vnHF3uTPz4Tsvnud
	dfU0uR5nVzyUa6Z/h8deUHklQSX4MeT/RMmkESuipMymx/fbZnIAgvQuZyx+fNOpae5gH2jIyLLec
	cg7xemzJ0jY+fvujld23liou9ozuHAtymNLbJCAMFT30IYSyJTt+cUduNfMraxViunMN/qCWg1u+u
	eB/YEDE/iCKMfV1gnb8+acPHL37tiyjYufZNPxRFaGnQGe7qfydn8yYaGIgQU2KRuACRxa8l2hjxp
	Z28Hffa2DAotK/BP1a9WVlJtF2GOIGYEZZZHmC9HzWITwOl8u2N3vb8Z0fIEsiOdEZLJyutUhThkK
	QFBBrnAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5QlU-00000003qzL-40Uy;
	Wed, 25 Mar 2026 16:07:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5QlS-00000003qyy-12aV
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Mar 2026 16:07:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1129E43235;
	Wed, 25 Mar 2026 16:07:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89E5EC2BCB0;
	Wed, 25 Mar 2026 16:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774454844;
	bh=/AHUrVzXCnu4f902UPkYpNtP+3R1E5iLG47eo3IZY98=;
	h=From:To:Subject:Date:From;
	b=oDmEBC67JPEMWuP26khATKj8aDvL6Okkjwi5Khog2+4rymrUUHK++SZpKHbikMpYe
	 1kshOKEMMmpZlb7qesfX2v0lhx69i5K5P+JsSZBnhbXyA/p5g7xnlLC/2IaOaC4AZQ
	 amzl6IGiCERAdg+1r6pPVBYJ3gXAW2gVX2zhZ8kZ3fcC7gF5Pz0trcDVpcCva2OTUo
	 Q9Y3y1ovm6XiHoG94BgcmWvEipXPq9bboHRwr7TExZ32W+mWbPdtMQ1y1fFvXELgT3
	 nl6lcwL6ShNyY+N6CbMc1oqsfkKV1Y4ln/6JUd+NyvxOtklYPlUxaHDWq04tjj8uil
	 iAifVKssWUcIQ==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	Gary Bisson <bisson.gary@gmail.com>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Val Packett <val@packett.cool>
Subject: [GIT PULL] mediatek drm next - 20260325
Date: Wed, 25 Mar 2026 16:07:21 +0000
Message-Id: <20260325160721.4891-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_090726_333598_07E31BA2 
X-CRM114-Status: UNSURE (   6.38  )
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
1. mtk_dsi: enable hs clock during pre-enable
2. Remove all conflicting aperture devices during probe
3. Add support for mt8167 display blocks

Regards,
Chun-Kuang.

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-next-20260325

for you to fetch changes up to e1c3bc324407e82a616228ff70027408b2e26f91:

  drm/mediatek: ovl: Add specific entry for mt8167 (2026-03-22 13:35:07 +0000)

----------------------------------------------------------------
Mediatek DRM Next - 20260325

1. mtk_dsi: enable hs clock during pre-enable
2. Remove all conflicting aperture devices during probe
3. Add support for mt8167 display blocks

----------------------------------------------------------------
Gary Bisson (1):
      drm/mediatek: mtk_dsi: enable hs clock during pre-enable

Luca Leonardo Scorcia (3):
      drm/mediatek: Remove all conflicting aperture devices during probe
      dt-bindings: display: mediatek: Add compatibles for MediaTek mt8167
      dt-bindings: phy: mediatek, dsi-phy: Add support for mt8167

Val Packett (1):
      drm/mediatek: ovl: Add specific entry for mt8167

 .../bindings/display/mediatek/mediatek,aal.yaml    |  1 +
 .../bindings/display/mediatek/mediatek,ccorr.yaml  |  4 ++-
 .../bindings/display/mediatek/mediatek,dither.yaml |  1 +
 .../bindings/display/mediatek/mediatek,gamma.yaml  |  1 +
 .../bindings/display/mediatek/mediatek,ovl.yaml    |  1 +
 .../bindings/display/mediatek/mediatek,rdma.yaml   |  1 +
 .../bindings/display/mediatek/mediatek,wdma.yaml   |  4 ++-
 .../devicetree/bindings/phy/mediatek,dsi-phy.yaml  |  1 +
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c            | 12 ++++++++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |  5 ++++
 drivers/gpu/drm/mediatek/mtk_dsi.c                 | 35 +++++++++++-----------
 11 files changed, 46 insertions(+), 20 deletions(-)

