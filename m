Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 342A8CA0FF6
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Aug 2025 23:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aO564Xlzh5AULpdoBsMEZOiEQswvzDJfuAXOdGpfo3c=; b=MKDAjgW4W1crDH6Y91R72FLGqb
	XfdBocT4ef6oisYc6nydn0nEnG4ZNqQBH2u8+whyhxzlYOcumYI/gkJp7Rbb9BrkiuBR3Xmlx3e3f
	ymRCUp02x6wKGa2+WsQ3fZhKUFNJNx+AICF6v8QcZze3gjSSZZekrOOrIs3cnpWVvk209ofy53sUj
	+Id+Hor/r2CZ7gqDkQrs2XdC3dGswooEBDUZ4IwTyTEXefYhf7hs6bFDbo7Z79ivCJTN+n++KauEo
	C2FmXUGgpNqgT+CPqSjhM9Ech7pL/1UeG3uX30ZA0DC+r8cfm9ITEzbraQN1SluUBWzAnpZT1F3OG
	x7bqp7sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urmFE-00000003iRp-3JDV;
	Thu, 28 Aug 2025 23:41:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urmFD-00000003iRc-3T5s
	for linux-mediatek@bombadil.infradead.org;
	Thu, 28 Aug 2025 23:41:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=aO564Xlzh5AULpdoBsMEZOiEQswvzDJfuAXOdGpfo3c=; b=NySRaukjJhd78BZMNn5vBykfsX
	GpH1+eJ6uEvEfyhUszw1CErLbzrIBz1OA0JmrOeDCTkcey1ddju6QIcGmzmckObexMo+Ln0ffyd/A
	BPhNfdy1RwZKkm4x0rocVmEvol2ErU2pla76Pjcca/3g55UusEIKeYYwrMU6ft/CfXrVEmLvcidjA
	uiZG4AaIIG1wIS2NRGtkaBGWSo7C2TmdzPoSw73shKk+mDj1TYD35MDQfF7v1n344l35vy5TE76We
	2/vxglrRAO+iEVKr3q96wTnK144raoSwsfbz28G7MwEuIh6DCW7Y4mXt0o7JMZHQMXxFCdP2fD5s6
	1H6cit+A==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urmFA-00000002yEW-1rar
	for linux-mediatek@lists.infradead.org;
	Thu, 28 Aug 2025 23:41:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9B6904321B;
	Thu, 28 Aug 2025 23:41:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B92EC4CEEB;
	Thu, 28 Aug 2025 23:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756424480;
	bh=ZLu9tZcWvvcmKB7kw0Esc7NfcQ27jePkLEoWMSeiIEU=;
	h=From:To:Subject:Date:From;
	b=hxxdvnU0XJSNVwjb+1+/K0DGtYnf6dO7B9XIBdEb9xiW8B1DZ+uM+F3QvmX3Gc4gG
	 begEIarXAlpTgNXRPgv0DMDvH1CZNJQy3Hvv1oLBTbagF8hm83K2UG5o9U3d2H5k1T
	 wwvu6Kdhi5AN+Depr4y2k9DAeNZ3xOgRjZtAQF/PHuvCVXdSxJjQZdaE7bBNHgjaLH
	 hJSjd0zDiNnlBq9Aavy4VghB6sl+41LsblVcPR1gWZPTiPF9rKI4c3nDTdTOI7uQe7
	 z/F+IwKmIgIfMHCDj9p4gHAqRg6eYQK/THjTlZNV8Q3OWmwWKReyCQFNLzqvYncPpP
	 HuyZmdUY5UMfw==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	Jason-JH Lin <jason-jh.lin@mediatek.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Ma Ke <make24@iscas.ac.cn>
Subject: [GIT PULL] mediatek drm fixes - 20250829
Date: Thu, 28 Aug 2025 23:41:16 +0000
Message-Id: <20250828234116.4960-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_004124_806146_FCE2870D 
X-CRM114-Status: UNSURE (   6.52  )
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
1. Add error handling for old state CRTC in atomic_disable
2. Fix DSI host and panel bridge pre-enable order
3. Fix device/node reference count leaks in mtk_drm_get_all_drm_priv
4. mtk_hdmi: Fix inverted parameters in some regmap_update_bits calls

Regards,
Chun-Kuang.

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-fixes-20250829

for you to fetch changes up to c34414883f773412964404d77cd2fea04c6f7d60:

  drm/mediatek: mtk_hdmi: Fix inverted parameters in some regmap_update_bits calls (2025-08-28 23:15:41 +0000)

----------------------------------------------------------------
Mediatek DRM Fixes - 20250829

1. Add error handling for old state CRTC in atomic_disable
2. Fix DSI host and panel bridge pre-enable order
3. Fix device/node reference count leaks in mtk_drm_get_all_drm_priv
4. mtk_hdmi: Fix inverted parameters in some regmap_update_bits calls

----------------------------------------------------------------
Jason-JH Lin (1):
      drm/mediatek: Add error handling for old state CRTC in atomic_disable

Louis-Alexis Eyraud (2):
      drm/mediatek: dsi: Fix DSI host and panel bridge pre-enable order
      drm/mediatek: mtk_hdmi: Fix inverted parameters in some regmap_update_bits calls

Ma Ke (1):
      drm/mediatek: Fix device/node reference count leaks in mtk_drm_get_all_drm_priv

 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 21 ++++++++++++++-------
 drivers/gpu/drm/mediatek/mtk_dsi.c     |  6 ++++++
 drivers/gpu/drm/mediatek/mtk_hdmi.c    |  8 ++++----
 drivers/gpu/drm/mediatek/mtk_plane.c   |  3 ++-
 4 files changed, 26 insertions(+), 12 deletions(-)

