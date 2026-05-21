Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 475AACD5BAC
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 May 2026 14:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=v6pz+456eDkr2FQPvFSRR5Zm+2d3QHcIeHy/+F7/GIk=; b=0uoKxF584640KUrZE5uwPhxSD5
	z276QYFiBpErbHnDjxyZjiUrv1XtQlL5PPw9RixpSrEgUdeXdM1v1txn6AVLWHdsEmaa+ZZeFYgnR
	B2aeX9yOYUvbViTKNO2lqwDBwPKPbAC0KuryOw8jr6bzLEZtwxkoV1GHlXTv6RvC1+fwIPWYv0b4X
	6JO14kj1CmlMhbu1F5JHqj6WY6JrZOs9K4v9cpZnXjQIR0V0Tz1wg9Xmx1ZBCz4e56NeQeKOOgN2j
	YZXdwIuv+46jWn3aovl89EJMIu3ZUH38n6yC3GNqJkQAZKeodmRFj37M368jsS14aWe+6bzLXU3yl
	u7gMp+HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ44t-0000000800m-1AoV;
	Thu, 21 May 2026 14:08:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ44s-0000000800c-0gyy
	for linux-mediatek@lists.infradead.org;
	Thu, 21 May 2026 14:08:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8573B601F3;
	Thu, 21 May 2026 14:08:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A5DE1F000E9;
	Thu, 21 May 2026 14:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779372525;
	bh=v6pz+456eDkr2FQPvFSRR5Zm+2d3QHcIeHy/+F7/GIk=;
	h=From:To:Subject:Date;
	b=AXAuN/LHgKQXitJblTejqzfp/TW2s8DKuf1RWxOgwQZdgU5WLsXHEHBvTjXvSt7Qq
	 3/3NrbEdDlcx5LhRr5yIfxQe4KMI8CV0rODZZsBgjXj6PygyavDiRPQDOGPmLBiZG3
	 juuClNd5lCcoF/QAOPpTr7V20yAYFx+9J4y4+EP61KGkPhJY7GwisIiZkr1ZBBokFe
	 6uEgtAOWP0lW0QlL1LKK3Oa0OF7oOAMnniTHeJbCHR+VxGAJhl2qdUbPQh3FQaSLuY
	 /B50IeIdMvbLiqnco3Q1qTpXyy8iGZXOF21mdXLJwvQs8hW/VC3r4KvBvnJmZM//SR
	 KvSA6XxF101ng==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	sai madhu <suryasaimadhu369@gmail.com>,
	Rosen Penev <rosenp@gmail.com>,
	Shivam Kalra <shivamkalra98@zohomail.in>,
	Abhishek Rajput <abhiraj21put@gmail.com>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>
Subject: [GIT PULL] mediatek drm next - 20260521
Date: Thu, 21 May 2026 14:08:41 +0000
Message-Id: <20260521140841.5103-1-chunkuang.hu@kernel.org>
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
1. hdmi: Convert DRM_ERROR() to drm_err()
2. Simplify mtk_crtc allocation
3. mtk_dpi: Open-code drm_simple_encoder_init()
4. Convert legacy DRM logging to drm_* helpers in mtk_dsi.c
5. dsi: Add compatible for mt8167-dsi

Regards,
Chun-Kuang.

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-next-20260521

for you to fetch changes up to 6428eaf0c1f39815b08d57054895c1934d5782f3:

  drm/mediatek: dsi: Add compatible for mt8167-dsi (2026-05-18 13:44:33 +0000)

----------------------------------------------------------------
Mediatek DRM Next - 20260521

1. hdmi: Convert DRM_ERROR() to drm_err()
2. Simplify mtk_crtc allocation
3. mtk_dpi: Open-code drm_simple_encoder_init()
4. Convert legacy DRM logging to drm_* helpers in mtk_dsi.c
5. dsi: Add compatible for mt8167-dsi

----------------------------------------------------------------
Abhishek Rajput (1):
      drm/mediatek: Convert legacy DRM logging to drm_* helpers in mtk_dsi.c

Luca Leonardo Scorcia (1):
      drm/mediatek: dsi: Add compatible for mt8167-dsi

Rosen Penev (1):
      drm/mediatek: Simplify mtk_crtc allocation

Shivam Kalra (1):
      drm/mediatek: mtk_dpi: Open-code drm_simple_encoder_init()

sai madhu (1):
      drm/mediatek: hdmi: Convert DRM_ERROR() to drm_err()

 drivers/gpu/drm/mediatek/mtk_crtc.c | 15 ++++++---------
 drivers/gpu/drm/mediatek/mtk_dpi.c  | 10 +++++++---
 drivers/gpu/drm/mediatek/mtk_dsi.c  | 28 ++++++++++++++++++----------
 drivers/gpu/drm/mediatek/mtk_hdmi.c |  4 ++--
 4 files changed, 33 insertions(+), 24 deletions(-)

