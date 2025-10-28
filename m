Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EFB6CCF9E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Oct 2025 15:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=N4aHRyQHhigud80je2IK4sStbCwXpHwYuT8zSuwoBSc=; b=D7KqqxjkWxUQoz3yh6rECYMWAU
	45MQjucyVTQEaY6QTHvFte7aDdd/zp8iu0EP9xiMUkELkbP4iZROcE4WXHIupW0MJ7XTb+WT82ApG
	3nQwEBrn2Duvtvr6EJ/ouZu1Jqiojp1GqYh0mDAq1hwbOj4a1j7AMS1FuXM0u0Rq24EB+OyssJ1a1
	0S8Z08ZSqGv3ndbFVKLhu4hCsgwLJ9xQz3TmPD+qElxERwyg+cEni/m0N7A8mv7EkH8o92Cb8VNVS
	1bkJt4pHILbe+68j6gieLTOZMHeioP76Jj60PTuo2UUloKNhkQV6RfKv+Xkw6nlMLm4ycMtbyz0Rx
	FoU2WgZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDlQR-0000000G9uY-2XQH;
	Tue, 28 Oct 2025 15:15:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDlQO-0000000G9tv-2dMY
	for linux-mediatek@lists.infradead.org;
	Tue, 28 Oct 2025 15:15:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EE4E8488DA;
	Tue, 28 Oct 2025 15:15:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98E51C4CEE7;
	Tue, 28 Oct 2025 15:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761664551;
	bh=goD0CigqBRYX8ULfEFtywW6O3borlTpYBzrks6pK4t4=;
	h=From:To:Subject:Date:From;
	b=n+lg9AMsc5NeGcR/8LdtOfvFSm3eCSzXjS8tPTuEpM0EVb4pgSYR9tpkZMD8JPk30
	 zsp0gUF5fA6a4fZIGIaKEhUU0BEWhGW+4xRL91bQ4cKMYc5q8AL2JJuDFNll8cwOWh
	 //7pvz6thEtoU91YAFPJYMA6kZj93BFEBV8Xk0s5whj8lEm0JGKL+MZG3fCmXuRBvD
	 fnnyXANIy+FIeJV2YammHmZEn5wf6URFYf0IMSCSFfZXUuwLFTdjSz0lC6P+Mv93OE
	 T27aRgXyV5idFrDxlWJ0VIbCIUBsEKcGxNR0bZaY/AZ6Q89ZQM9GFTRBNrnKzpnC3G
	 oogwQRJFCjZxg==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	Johan Hovold <johan@kernel.org>
Subject: [GIT PULL] mediatek drm fixes - 20251028
Date: Tue, 28 Oct 2025 15:15:48 +0000
Message-Id: <20251028151548.3944-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_081552_707241_1B23D3A6 
X-CRM114-Status: UNSURE (   4.35  )
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
1. Fix device use-after-free on unbind

Regards,
Chun-Kuang.

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-fixes-20251028

for you to fetch changes up to 926d002e6d7e2f1fd5c1b53cf6208153ee7d380d:

  drm/mediatek: Fix device use-after-free on unbind (2025-10-28 14:56:16 +0000)

----------------------------------------------------------------
Mediatek DRM Fixes - 20251028

1. Fix device use-after-free on unbind

----------------------------------------------------------------
Johan Hovold (1):
      drm/mediatek: Fix device use-after-free on unbind

 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 10 ----------
 1 file changed, 10 deletions(-)

