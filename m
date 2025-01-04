Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 949EBE77199
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 Jan 2025 12:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=c96/qMcaguFOqpEpQRpXNcmohwNtwoxSAp/RmjxD2ts=; b=cwPyz1BfjWGsnB+eTkw0bff3Fg
	DJdokvTioFvm8HMm88MVPethxeBLEjV5mAxrJ5u9XimKUQyVx1wes2ONhHErRGxtFsvKBpwO+7Mfm
	h8MbQhOHqYZGtOa2K1/x1NKtO4B0ldmSP7n96QonEbDl35aKfc/8Qi817S2wJu2Fspy+IL+3JWQ0c
	PLjN0vmEsTZunF5kTpwgPRtWUpJclF1NQteE5laXoafdkgLF4Q4ajFBums3P19YiOy4WKOSJF3mwf
	uGF1WKxpLdxvAFBvzU2qJ7FQJc93qXWx0fN8QtpucVVxz+2oHcAdKanCjFdsqEKhRrj6jAcj+1qNG
	ncbzokyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tU3gw-0000000F0FQ-0gex;
	Sat, 04 Jan 2025 12:55:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tU3gt-0000000F0EK-1cpe
	for linux-mediatek@lists.infradead.org;
	Sat, 04 Jan 2025 12:55:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 630F25C1070;
	Sat,  4 Jan 2025 12:55:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB745C4CED1;
	Sat,  4 Jan 2025 12:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735995342;
	bh=Tu3NYANR6Oo7OR/1mO5e3lqnkaZz9yyNdWjaERTRz3o=;
	h=From:To:Subject:Date:From;
	b=S9vOzstx01Y11Vf85It2BXKVSsLawr3v3FXT1AS6g+EBKdf39CxF4spU1WjNr1BvX
	 61avFaZK1wyrp0nQtKad8NzxmGXrC8pwEmUTWEtcGFWykaAAmZmUDl/+55Lesu9jpi
	 +NTRJQqrgSxZk7LwcDxqjFrgK48G+iqX+jCmIMTbausqVQtPyhdM+k6OTyonb4vYtQ
	 dmcdTylDW19LzyRq3NLNuk79tE8LsxBueFrzewNtdOkpnGdaAFNATur16p8HrepEQo
	 rOpblB5kvtQX3N/ucvSduNwHw8z/AWa6FRIUkK6uYNckk6cLorm35J5DXNMNY7UJZ1
	 9pxooJn8PpOYQ==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	Liankun Yang <liankun.yang@mediatek.com>,
	Fei Shao <fshao@chromium.org>
Subject: [GIT PULL] mediatek drm next for 6.14
Date: Sat,  4 Jan 2025 12:55:38 +0000
Message-Id: <20250104125538.111118-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250104_045543_471892_ABBAAD82 
X-CRM114-Status: UNSURE (   6.25  )
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

1. dp: Add sdp path reset
2. dp: Support flexible length of DP calibration data

Regards,
Chun-Kuang.

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-next-6.14

for you to fetch changes up to ba5811562988652d88de7503b3bd12da063ae729:

  drm/mediatek: dp: Support flexible length of DP calibration data (2025-01-02 13:40:27 +0000)

----------------------------------------------------------------
Mediatek DRM Next for Linux 6.14

1. dp: Add sdp path reset
2. dp: Support flexible length of DP calibration data

----------------------------------------------------------------
Fei Shao (1):
      drm/mediatek: dp: Support flexible length of DP calibration data

Liankun Yang (1):
      drm/mediatek: dp: Add sdp path reset

 drivers/gpu/drm/mediatek/mtk_dp.c     | 33 ++++++++++++++++++++++++++++-----
 drivers/gpu/drm/mediatek/mtk_dp_reg.h |  1 +
 2 files changed, 29 insertions(+), 5 deletions(-)

