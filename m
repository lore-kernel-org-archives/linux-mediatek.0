Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A586CD4F3D
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 May 2026 13:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fgDyaoAaBVlG/7hkYJNhJI1L8SvN21kpP91Qx0GqPWQ=; b=yf64mr8uiIqooX6/bcKiKfmuf1
	4CyMigc0qgnpRp0TbZ8fnw+OuLDLAkXHH4Q8gBD/iT7xLRJwcrUAx6fzkNh4JkDeHPAYSEvEvlhTz
	QZXSsrOkxmh/4562puixGl28I7aYWOyzb0+ovV/Itbw2p9UmAGetDubIh7s5dsGauG1kH4vw97ua4
	wdQkGjqNu6VE33H442YxdQJFc5uQ7JDmzyXcn/Ymu4ee1m9ZF4D1FyCHp4EDbmk/ipN7TcnYD05yg
	05hbYgesPDTQAO07uh9evg1G9vS5fFtrGjonr1pjMbcHKUKKLhU9d1hzt9gaLF2q9WYhRftKYLJOg
	Aw7+RZZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ3tQ-00000007y3t-05d8;
	Thu, 21 May 2026 13:56:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ3tO-00000007y2n-1j4S
	for linux-mediatek@lists.infradead.org;
	Thu, 21 May 2026 13:56:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6C45D43463;
	Thu, 21 May 2026 13:56:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ADD11F000E9;
	Thu, 21 May 2026 13:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779371813;
	bh=fgDyaoAaBVlG/7hkYJNhJI1L8SvN21kpP91Qx0GqPWQ=;
	h=From:To:Subject:Date;
	b=RKNoJ0KVGU9UO7B23Xm8sIkN5/Y5fiZz+DIOdurPZvERBCck8y+ak3+9fuH+HS0PU
	 +C9s22ZtUliEhxbhausQ4Rem//CFD3PpoqKDQdo6zc/i+vacxfQMo0F2K0CBN6+xIy
	 PEF4kKJQPeXPchfXBOu7P+I4Vx0YGcAvUyg1nqBYgHOgM/W56v8dbs5zdvtZuqjzmT
	 jyVpypcx3+BAOemK/4ISQVZSx5NAlA8ATBDcwaBbLbRnJGbny6Pov2Y8hV/sfxT4Ru
	 pNMa+EKLdJtLxEknHQqexh8EOZszUjsxyGYenqKzOpvEeVUMFnJXhhmkfAR85PEkQ0
	 9jxWSHjTvM2tA==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Subject: [GIT PULL] mediatek drm fixes - 20260521
Date: Thu, 21 May 2026 13:56:49 +0000
Message-Id: <20260521135649.4681-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_065654_469847_74A0BA15 
X-CRM114-Status: UNSURE (   5.85  )
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
1. fix sparse warnings

Regards,
Chun-Kuang.

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-fixes-20260521

for you to fetch changes up to 87ed4e845d5a90bba1a56c0a5c580a13982e8648:

  drm/mediatek: mtk_hdmi_ddc: Fix non-static global variable (2026-05-18 14:21:39 +0000)

----------------------------------------------------------------
Mediatek DRM Fixes - 20260521

1. fix sparse warnings

----------------------------------------------------------------
Louis-Alexis Eyraud (4):
      drm/mediatek: mtk_hdmi_ddc_v2: Fix non-static global variable
      drm/mediatek: mtk_hdmi_v2: Fix non-static global variable
      drm/mediatek: mtk_cec: Fix non-static global variable
      drm/mediatek: mtk_hdmi_ddc: Fix non-static global variable

 drivers/gpu/drm/mediatek/mtk_cec.c         | 2 +-
 drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c    | 2 +-
 drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c | 2 +-
 drivers/gpu/drm/mediatek/mtk_hdmi_v2.c     | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

