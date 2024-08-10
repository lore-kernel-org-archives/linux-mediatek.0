Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94FF2C3DA4A
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Aug 2024 08:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hX9hDPK9Q/qydVdIJE2DsOqORNz4YEnWk8PbLdw5pUo=; b=M5uF2+WeTgHRB1dGEf3v7cwLYA
	AFnIoyOVYvGt7UVnlRc0G7h6ZZS9GLS4IjYZDL7t6znT4oqLCv98im5mWCOrDCFF6l9k1/2bgUVwE
	nN4QLjAqpH7eXce6n4+dOIgCGpA/+TP7Ib6FRGUYRzSa/1Td6G1CfSb/OESOq6jzKyvCLmslQUlgk
	5ivttQSRruu+FQogqJXv2GFkcJIML/M5ek2V8a+cRHLQnX2O8ELSAMzBL5+qrXPokqUq2Ycp34pv8
	3zM7G4NwEgKSm40sor+ezE3bnWYP5WlglP1U74I1K1bmJZNf/0xT7wLpILJyPEFZ0E0Qq1BvttbIJ
	5qfj9jTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1schjs-0000000Dgd4-2Fng;
	Sat, 10 Aug 2024 08:46:16 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1schjp-0000000Dgap-44o6
	for linux-mediatek@lists.infradead.org;
	Sat, 10 Aug 2024 08:46:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4C854CE0187;
	Sat, 10 Aug 2024 08:46:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25D43C4AF0B;
	Sat, 10 Aug 2024 08:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723279569;
	bh=uuGEKR0BKRSgVDib/MHJw9Zq0t+U20X3OrWUZeKAIIU=;
	h=From:To:Subject:Date:From;
	b=AmHpmIjuA6iOICMQNYDH2mgjmUkcvJR3POw7IOTy9WEVxiI44WQGL8JqL7rqwEaXu
	 gqrgY1QYH6hcwlW4i7V0b0uWM/DblZ4I0tMk+Tyu43+uXE5V/AsT0IzHSxcB0Gobd7
	 p9iNQHguLpqGTtY5S08AHo/z4oCCRbxyaCYXKM1PDwUhDcRt1TDUtXviqUd2xsl98i
	 vROkVmxGtLaIC1xwlG7JBfcGZsk6NVqYz26spPI6al32dqYh4V6Qpyk7kChfRsR0Fm
	 okMPnoGpH81/QNI6Gpmm+lD5vHQb2FOWYO43XzwqyxeJGzj0JvzVYqpqt7Y4oESla5
	 uJwamBJtFIuWA==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [GIT PULL] mediatek drm fixes 20240805
Date: Sat, 10 Aug 2024 08:46:05 +0000
Message-Id: <20240810084605.3435-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240810_014614_190248_E40DA4EE 
X-CRM114-Status: UNSURE (   5.80  )
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

1. Set sensible cursor width/height values to fix crash

Regards,
Chun-Kuang.

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-fixes-20240805

for you to fetch changes up to 042b8711a0beafb2c3b888bebe3c300ab4c817fa:

  drm/mediatek: Set sensible cursor width/height values to fix crash (2024-08-05 13:06:20 +0000)

----------------------------------------------------------------
Mediatek DRM Fixes - 20240805

1. Set sensible cursor width/height values to fix crash

----------------------------------------------------------------
AngeloGioacchino Del Regno (1):
      drm/mediatek: Set sensible cursor width/height values to fix crash

 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

