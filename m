Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AB91C55167
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jul 2026 23:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hBXkWesllLiSkUR2TQmLiRBA41k3CnI5ZjZMNLWiPso=; b=HftCKy5aLBciyUx4ZjmNcP2ZJJ
	Rqug38Rj8WZ9OInYJVk+lUjKhv0ETVmlHBnrtOUJ4LtLQx0XTzHsPnnTYCP0bZHsP2IAEn+lzN+e7
	BH8Y3Ii6H1eyqHPVi5BDGR3PoZWiizc0HhjodhQhy4C3nXxxkjW9aqCu+RYN36xujjmGlqhg6k/8A
	pvSP873406dyd9bzrABYgrNUOJe+DCaW5I3+FDl2GO+5lUukshlFAnFHt/HhzQhI0dgqbMGnASovU
	RnUKVKrnDrj5y2Nvy8EYXODbmkgCoLa0gMhVuWljJQYlvLoAwhMhF7oDNO1qmVP5ZQCb368AEcva7
	mr8RBgxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpaFh-0000000BVYH-3ndp;
	Thu, 30 Jul 2026 23:33:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpaFg-0000000BVXd-2TPc
	for linux-mediatek@lists.infradead.org;
	Thu, 30 Jul 2026 23:33:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DC25B60254;
	Thu, 30 Jul 2026 23:33:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 855F81F000E9;
	Thu, 30 Jul 2026 23:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785454401;
	bh=hBXkWesllLiSkUR2TQmLiRBA41k3CnI5ZjZMNLWiPso=;
	h=From:To:Subject:Date;
	b=J/Z4DHgA4YKSb8j5VO2EAjb8D2BCiHt7PbE4zMGNjB4d4uDhaHlqnRnEaHdrsHNRl
	 s7YJdy+9Ml4VOUzbSKQhkp0F4wUOC/8K3iPTuFTsLGx+iS/5riWqacysIGHrZ53l/W
	 pfIBGXMS3CQA/ytPUJifObbvdCgjeKC+FpmDcT30XKriInAL1myMQWGJ0Ythacutnd
	 vK67jVGVIz9JT2Y3z9OP/g3vJF+fqFkcgnBdfem7htk7LaWWJuc6/LzudZVi4n8gGV
	 EYuvyPL6+gCROp9ySWImGC2TrgrGClKKoK5naG5r0+u2XrIWap0wTJtTQ8JZ7a+u6P
	 rFZQwirDEx+Yg==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>
Subject: [GIT PULL] mediatek drm next - 20260731
Date: Thu, 30 Jul 2026 23:33:17 +0000
Message-Id: <20260730233317.3222-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
1. cec: Correct the compatibles for mt7623-mt8167

Regards,
Chun-Kuang.

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-next-20260731

for you to fetch changes up to 4c0ca180a386cf72f2bd368557067b0210d61ac3:

  dt-bindings: mediatek: cec: Correct the compatibles for mt7623-mt8167 (2026-07-29 23:21:27 +0000)

----------------------------------------------------------------
Mediatek DRM Next - 20260731

1. cec: Correct the compatibles for mt7623-mt8167

----------------------------------------------------------------
Luca Leonardo Scorcia (1):
      dt-bindings: mediatek: cec: Correct the compatibles for mt7623-mt8167

 .../devicetree/bindings/display/mediatek/mediatek,cec.yaml    | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

