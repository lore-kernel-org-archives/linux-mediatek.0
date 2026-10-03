Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96453CA5FC1
	for <linux-mediatek@archiver.kernel.org>; Sat,  3 Oct 2026 12:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0ZbbJm+lfh2Wh0Z0ij1lckp1wazeBCFcbooFUg1LvwM=; b=gJZxzX84MQGzs/qULIdmNryjaI
	iRGF+5Ox2R9xtyqO/+LUQX/zVbKp7J3F3RtvJmZ/DNbQ9NtqEHAA84sg4h3IQY/x1owcdqHWnrJB2
	u6w2YR0EouaFM5HzzJB1YqOxRISlvnuS1YsMBTCg4JviKXi/gq7mcTQe3Ynh873QNukpFHECESX19
	RF+8QM/siric5+tk7d3nm3v0dqCPmlSo1l8GtYCq/hPwnyJMRD7VJ4g4ilK71vYVn5POR3fNjnStx
	CY7kQrut20ENtj/wkUh4P7ABYoTqfWNkOYbDykmUc9ssjZ1CYioNJCjYUKZJZHhcMfD7OOqVDulGT
	0PlHbQHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCynw-0000000DUUA-3OZq;
	Sat, 03 Oct 2026 12:25:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCynw-0000000DUU4-0lRN
	for linux-mediatek@lists.infradead.org;
	Sat, 03 Oct 2026 12:25:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 89A0743A97;
	Sat,  3 Oct 2026 12:25:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6891F1F0089B;
	Sat,  3 Oct 2026 12:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791030327;
	bh=0ZbbJm+lfh2Wh0Z0ij1lckp1wazeBCFcbooFUg1LvwM=;
	h=From:To:Subject:Date;
	b=ZyPDR5UmXxIZmEE9B2Te6W09Lcua4g6UAbX1SQ/0zCY1WC2yaNq4IgWwQw0VKJtVz
	 h+dM2ruxa1YSD14zBhtC3WJ8zrICShY4O0aJOZ5InfUiOEt74kgucHvUnRbsJ9YpLq
	 ETldFs8KfXEuZJJZzwesycdyS8XBrGvzT/+vZh3rWI20R+4d4DXfvaWA6OTzaa0ZIq
	 BDbHcZfiA9ZZIaMkjUIqflTQWAeez05Tvea8nj3D8sItA6VrKqtfRprUqma0506hCD
	 BLoB80zGlV07OX7wNs13JkDOddMV+ueGQ2EWKR+GAxGK6E9TolCNz1E7Li+ateb50U
	 OX3Bd8PUVs2Hw==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>
Subject: [GIT PULL] mediatek drm next - 20261003
Date: Sat,  3 Oct 2026 12:25:24 +0000
Message-ID: <20261003122524.12578-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.53.0
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
1. Add support for the mt8167 display pipeline

Regards,
Chun-Kuang.

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-next-20261003

for you to fetch changes up to 265b9bea1a2f4c3361da82e922f9f08982d43978:

  drm/mediatek: Add support for mt8167 Digital Parallel Interface (2026-10-03 12:08:26 +0000)

----------------------------------------------------------------
Mediatek DRM Next - 20261003

1. Add support for the mt8167 display pipeline

----------------------------------------------------------------
Luca Leonardo Scorcia (2):
      dt-bindings: display: mediatek: dpi: Add compatible for mt8167
      drm/mediatek: Add support for mt8167 Digital Parallel Interface

 .../bindings/display/mediatek/mediatek,dpi.yaml    |  1 +
 drivers/gpu/drm/mediatek/mtk_dpi.c                 | 23 ++++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |  2 ++
 3 files changed, 26 insertions(+)

