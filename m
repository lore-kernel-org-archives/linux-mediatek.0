Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C783CAC5A7
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Sep 2025 15:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VMYVlC5cVd9hEBHrdCgxKFGg+HIzb/TsuUzaSl4+W+4=; b=NM3gOYVS9HHJK0hjpv8VBKgH33
	PBah/k/8YLPw8Eb8tcv2RlDRLB11MhLqYIM1CBnBKLkiwdzrj7ybUzT5cj40LaZZKNphu8V0uqlXK
	pyKxFz8CYV/xzeRxNwLxGHa5RwkmlIdJm6D5BNdhnA37q3F6A8u8DXOML2CNM2+FDWx07k0GK9dV+
	U3HALDn+MLfJaQJXfIn4M3SHjBnsqqoGdiFq+aEZWa13+nfwXrZx7HHjhyCoReDfHRD19kTbj1kVy
	zUwi6Nzsd+naWPO1YmkyBqebaIAC95SZfF57wAbD5F5IhlJGrER59VbExLZ9BBoF4oQU77LoSp2nG
	/T7HJPEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v14uF-0000000E2OC-17wE;
	Tue, 23 Sep 2025 15:26:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v14uC-0000000E2LL-3xZz
	for linux-mediatek@lists.infradead.org;
	Tue, 23 Sep 2025 15:26:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9CB70440F9;
	Tue, 23 Sep 2025 15:26:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79FE3C4CEF5;
	Tue, 23 Sep 2025 15:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758641172;
	bh=A7kQ6dm5aKh3HyJvuod+6ppwPxKHu8JboA2fiUwRno4=;
	h=From:To:Cc:Subject:Date:From;
	b=B57zID4v4TFh+gpUwpajXLQgpBXB1iu/d8v3NJAqo/1QvtRn3neNTJjSQmLiQvkso
	 7ySS6DQuUaUPfCvrlx0GubJmS65Xe+tAFXDMRbgwjGSZZAiEsrV3KaBu6L/euIm5GS
	 tZ+HxaIV0VHYO1T3CwYt74J9uTQifWoraZezeBV+OwlUYvOsTni3/BxbrSxOl6mg9C
	 89XNBtbyr4pBeS9Gtgdk/Uv2RyfT4PgSj4xtSpgH+Pk2LL0nMWKV+TszlJokEGtEtG
	 a2Y0OW8rgSD/2AZayiNDt1Zm+PGoODK95ceHq8VL/c3GP4Ku+qCWAwpkZiOVCOPvGT
	 6RXPpvh6nvK6A==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1v14u6-000000004mm-0MeD;
	Tue, 23 Sep 2025 17:26:06 +0200
From: Johan Hovold <johan@kernel.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 0/5] drm/mediatek: fix probe resource leaks
Date: Tue, 23 Sep 2025 17:23:35 +0200
Message-ID: <20250923152340.18234-1-johan@kernel.org>
X-Mailer: git-send-email 2.49.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_082613_002401_A05D9C70 
X-CRM114-Status: UNSURE (   7.17  )
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

This series fixes various probe resource leaks in the mediatek drm
drivers that were found through inspection.

Johan


Johan Hovold (5):
  drm/mediatek: fix probe resource leaks
  drm/mediatek: fix probe memory leak
  drm/mediatek: fix probe device leaks
  drm/mediatek: mtk_hdmi: fix probe device leaks
  drm/mediatek: ovl_adaptor: fix probe device leaks

 drivers/gpu/drm/mediatek/mtk_ddp_comp.c       | 33 ++++++++++++++++---
 drivers/gpu/drm/mediatek/mtk_ddp_comp.h       |  2 +-
 .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   | 12 +++++++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  4 +--
 drivers/gpu/drm/mediatek/mtk_hdmi.c           | 15 +++++++++
 5 files changed, 58 insertions(+), 8 deletions(-)

-- 
2.49.1


