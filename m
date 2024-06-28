Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD22CC3064D
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jun 2024 09:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BLfnEVaumEL6Gwm7Mu7iExkjcxWUf+36uznipLh6Mvg=; b=GWXRi2TGkaw7G5VVmh8Q90BJp0
	aVnUVm3mNlw1+d6MOIq/6cvYuEIUTAIDEDcVMaUY9Foeu2nI565bf2nJpzLjsZcuO0bgUl8L9uJ7M
	S2xtuWYGQFcvUed0wk1SgjwuIm50y7woa8BvsEQcMmYpcg/pOHlUJGah5/+6kGzQXuG6/bglIbkPi
	MNA9az3ZeAN5yCQ7fUbA3X0PgZjvd4IeLMFxwkospdvDIwDxSSPOdRH9pPQBGTegTI+EV6vdFGnD5
	2quXzBwi8H2gmkyIsK4u0V8KZPTo9MRoJ3HnZa6K9zl5bvQdhPVBCYDqjFmQ9Ca1PnauQ0JeN6zFs
	8Njf7MaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN83o-0000000DHgJ-11JH;
	Fri, 28 Jun 2024 09:38:28 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN83T-0000000DHSH-2IbM;
	Fri, 28 Jun 2024 09:38:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1719567484;
	bh=HWXWQGMN6XK1cULlsC0zviWvUKjRyKwx7itg8l1XpCs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e5HL0fSN3Q3NPEajOCDv3cjG5Dru58dgb0P/Yk7IA76JRT6UrG9o80+bvdEgN0Lkx
	 73J3J36A+MfFAon1UR0Oyo42xDfvSvadrbhHAvSIWgAbIionlBEbA6hr1z7R3L9ePm
	 ZBQmuJ54UnYiyZi9ZOHyWMmdQ5aQicu0Dsyt6fCET4SKFtXqmlkKt3NHzf8nxdpAwl
	 RztzGO2aGo0th0d+dhozDCojGqlF5l59JvKUhuS60+pqW6FntlBqc/DoMjNlNntNhC
	 /roA33HDEve7pkex4ZgfSMAXID0A4R8BQnm4yJXKzYltDT+f7Wm7rbYgpcbp+RRQfo
	 LBN1hdGGHEDdg==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 0F5E837821F6;
	Fri, 28 Jun 2024 09:38:04 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [GIT,PULL,2/3] MediaTek ARM32 DTS updates for v6.11
Date: Fri, 28 Jun 2024 11:37:58 +0200
Message-ID: <20240628093801.126013-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240628093801.126013-1-angelogioacchino.delregno@collabora.com>
References: <20240628093801.126013-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_023807_990791_D0F9A937 
X-CRM114-Status: UNSURE (   6.43  )
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

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git tags/mtk-dts32-for-v6.11

for you to fetch changes up to c04774af7ae392322e204dd20117e6c5162e0fe4:

  arm: dts: mediatek: Declare drive-strength numerically (2024-06-24 12:49:30 +0200)

----------------------------------------------------------------
MediaTek ARM32 DTS updates for v6.11

This adds a single commit that cleans up the drive-strength
value assignment on all devicetrees using the deprecated
MTK_DRIVE_(x)mA definition.

----------------------------------------------------------------
AngeloGioacchino Del Regno (1):
      arm: dts: mediatek: Declare drive-strength numerically

 arch/arm/boot/dts/mediatek/mt2701-evb.dts |  2 +-
 arch/arm/boot/dts/mediatek/mt7623.dtsi    | 18 +++++++++---------
 2 files changed, 10 insertions(+), 10 deletions(-)


