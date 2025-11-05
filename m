Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD337CCFA0D
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Nov 2025 15:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=erXmqa5FBNjbQGaFyT4yQYedPdleKSyDsUcld9PCnjk=; b=vd7wzxTzKQHr3YXkDIbVizkvqz
	7Cchgct3nSskUm3FZqMWd199YPnmaYp+AFJMNOgc32mEahgm6IuJLgIPXdW5gV+rvI3N+xYu6fE71
	ZNyG8MiZDThwWtKFgqYdDe6iN1Bd7/AJaDvez0MMkjKTKN/KYpdDecsOI7iDT4ZdpCbv5Oa91v1Bn
	5Y4d07wdXacQp6jdefKx/5gXUP8XFcShqeRdsL5dPeONc64BVBoLtqlKgoQdiCxlvyMg7q7XG5vul
	F0SwYEqgifwfl+vpWk6hhh5PQjEi5SFYtdXxgiJj6WAotKlgXT5y3UeJV00fsVmH2SrZPNuIhV2JZ
	HXiPfJ4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGfDn-0000000Dtz7-1oXG;
	Wed, 05 Nov 2025 15:14:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGfDk-0000000DtyM-0H6l
	for linux-mediatek@lists.infradead.org;
	Wed, 05 Nov 2025 15:14:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E123943B1A;
	Wed,  5 Nov 2025 15:14:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89B16C4CEF5;
	Wed,  5 Nov 2025 15:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762355686;
	bh=HYVpFtsrL70sCWh2RaktCI0uNYyfmiBbMi220gJPpCA=;
	h=From:To:Subject:Date:From;
	b=QvRM0gJIYOVNPjClWKkfr9PYou4BQaAkFYl8xlj5pUNLjEsIkeUNGYZfYKgjK+AS7
	 GUWq628ir6BIbz9EYRoDY/01jSayoNBY9c05tAf5U/lvpS11gdHI9cp7daXywKY46E
	 mXqbb/M41KtMIQQdbmcXmlR/yYO9ua6A0cTiSRa53ISduM4+rdILzYuQ5m61SVPP5d
	 2qI9yiBI6YOsk+9dI6Pu79Zb7PncCCYpl8pUyPKQ2vkN76JFnPLYc3x9EO5ftcidvL
	 6ZMpZMZfvqR5caffphuru89VN19H5x8CqoNYMcmM+ZUGJAWOnHVS7+N4hOxBXfiyhE
	 e6Ltm9PDOrpLA==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
	Jason-JH Lin <jason-jh.lin@mediatek.com>
Subject: [GIT PULL] mediatek drm fixes - 20251105
Date: Wed,  5 Nov 2025 15:14:43 +0000
Message-Id: <20251105151443.3909-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_071448_146457_B10C2F09 
X-CRM114-Status: UNSURE (   5.32  )
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
1. Disable AFBC support on Mediatek DRM driver
2. Add pm_runtime support for GCE power control

Regards,
Chun-Kuang.

The following changes since commit 926d002e6d7e2f1fd5c1b53cf6208153ee7d380d:

  drm/mediatek: Fix device use-after-free on unbind (2025-10-28 14:56:16 +0000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-fixes-20251105

for you to fetch changes up to afcfb6c8474d9e750880aaa77952cc588f859613:

  drm/mediatek: Add pm_runtime support for GCE power control (2025-11-01 14:14:56 +0000)

----------------------------------------------------------------
Mediatek DRM Fixes - 20251105

1. Disable AFBC support on Mediatek DRM driver
2. Add pm_runtime support for GCE power control

----------------------------------------------------------------
Ariel D'Alessandro (1):
      drm/mediatek: Disable AFBC support on Mediatek DRM driver

Jason-JH Lin (1):
      drm/mediatek: Add pm_runtime support for GCE power control

 drivers/gpu/drm/mediatek/mtk_crtc.c  |  7 +++++++
 drivers/gpu/drm/mediatek/mtk_plane.c | 24 +-----------------------
 2 files changed, 8 insertions(+), 23 deletions(-)

