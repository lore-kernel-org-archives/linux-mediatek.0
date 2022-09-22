Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F85AC54EE9
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Sep 2022 23:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=spdI0SCiy/Jt+602aY1m+b3AQgIMg0jgwcWrimeBbiY=; b=11Qz6H7t4rvoZ3LD4jrqdbnF+E
	pJeOMhgT41a0KkmjchEJ3MjwRkJvDF6pbPjSOIzQVczMU0qYwZUjCgV+lm1IsdEe41XdT0rYtMHaK
	iHZe5wtIj32tq63jYhnK98VR/0cQUB7FJEFFejH5zzF/ElUocHksr09qaznl8IJi56g+wq7mRoc5h
	7c5a7G/Th2aBqMa5fP8O91OTYp1vR+rSL5Mv8Et3qAyybKC2jSLl6kEPVdwkcQhvgMrCt0zd3GIkM
	OYNtmpOP9DLm7GoQ3wPleara0eDrfDq3XtL6M3P/G2T+G7s6FJcbYHwGZ9ozMRSOOTZmPUzO/sTy+
	A1i7XbwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obVvW-000dWS-0O; Thu, 22 Sep 2022 23:48:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obVvS-000dUt-Mo
	for linux-mediatek@lists.infradead.org; Thu, 22 Sep 2022 23:48:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1CE2D60A51;
	Thu, 22 Sep 2022 23:48:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D3C3C433D6;
	Thu, 22 Sep 2022 23:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663890492;
	bh=Kj04nfY3atIZrwzcWjlm7VKsHPyxhSkwGh3b0ZuXMuE=;
	h=From:To:Cc:Subject:Date:From;
	b=cnxHwJFY3PDpJwjfpnPGFuaigNfPL5/QZsB/o2UsnGGYRIa5I1ViGHbOxD5iBIDUh
	 1/FOIyjMXZBcQN40esKCkxpN3bdbSeRmfFs6rdgg124WxJ3GBMag4IsStxQj/sSlmx
	 raPy6QalAgbYTSTLwrixeoWVBO9S4dHqOORMXie9Y/FEObuIeA7EJxfxSXqGdgZhfm
	 wq02GYnJaE17e3g2coV9771+QuZa5Od1ym6c2pLTBYhW4K/km6gUvRfknsqht6KkT6
	 e8x/k+5JNOabsXGjs+mkwF40doVkO67Tf9eZ6yDMjp6/4e52bKS0Ks2vNAyQLf+hPx
	 ZMjHnx615vnEA==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
	ye xingchen <ye.xingchen@zte.com.cn>
Subject: [GIT PULL] mediatek drm next for 6.1
Date: Fri, 23 Sep 2022 07:48:04 +0800
Message-Id: <20220922234804.18557-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_164814_816788_1500776A 
X-CRM114-Status: UNSURE (   8.21  )
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

1. Drop of_gpio header
2. Remove the unneeded result

Regards,
Chun-Kuang.

The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-next-6.1

for you to fetch changes up to 9d3feb63339520462583a4c7ee5130046ab515ad:

  drm/mediatek: Remove the unneeded result (2022-08-26 07:34:49 +0800)

----------------------------------------------------------------
Mediatek DRM Next for Linux 6.1

1. Drop of_gpio header
2. Remove the unneeded result

----------------------------------------------------------------
Maíra Canal (1):
      drm/mediatek: Drop of_gpio header

ye xingchen (1):
      drm/mediatek: Remove the unneeded result

 drivers/gpu/drm/mediatek/mtk_dpi.c     | 1 -
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 5 +----
 drivers/gpu/drm/mediatek/mtk_hdmi.c    | 1 -
 3 files changed, 1 insertion(+), 6 deletions(-)

