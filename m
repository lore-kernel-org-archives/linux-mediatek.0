Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 958E2C25B76
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Jun 2024 11:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S3rlsrdKV4ITdG7iMD1R+1ofxMlJ7yERBSCG/FDiD/o=; b=wmjDlIbTdLHpQ4wj9dI0h9cNGw
	y/QM7hjXzd1+RchnOgB6vBNc8uunwlLonjs2S/2jjoeIVTvjG8prb2LT1O8tRf6Qx4EiuZ70w9n9O
	d1TosdqJ1Kybj7W2UyMigqiECb9kT+v0li2g3OFV11PRVGDFPCD4p7sF45Kz8Cti3B2Tf83EQybiP
	KU2nUOTWOoAys4jmEBUT1Swk2bYKpNj1HF+vIUmL1GtYSZ8a+1Pi7fzqLZip6QK7VMYZYQi5hgzmB
	gdhqaSW0diAoBWCJy+xGBKkSbB4Lv08tQ84zo0Otf/0aJNQ5YGOYR9+Bjr8aEpoFU17niScUf2nuf
	bmwgm0+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEpCB-00000005nau-12UH;
	Wed, 05 Jun 2024 11:52:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEpC7-00000005nYk-0mkG;
	Wed, 05 Jun 2024 11:52:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A1C73617FE;
	Wed,  5 Jun 2024 11:52:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F483C32781;
	Wed,  5 Jun 2024 11:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717588362;
	bh=g3iRvxT62XnaNPCsvLlGtLyXzGD5qCPrw+stjFgQ0lY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UZKwb6v55vs/XbVMZfgVqHO6V1D+0YFZt9lgpLTuI5/gXDdiPfjuaA9pdS8WwLjmR
	 5Gm+YifG1CivhJoiTst0C1RfzTLFDKJYm6sTm0YvIOeygciD8kYIaXtwtHNjSklHxy
	 8ZxMjUDvKHNjboczOwqreRYsm95KbSUaIVRQHzabGPRS5q/Mk1YdrpcPtrSdSQmRVI
	 csjhdkM5DCBgRHMkVPqiiNAXAPS/KS6plggC4XmsFVv+m0mh2P+oStLqar7pIN70Vp
	 ej6AzFFDzxMQQhcBqv7BRmVVDvGYMTacgqIwJ8d+QYeCosyg4h+0rM20ls1wqWmUbz
	 l8vAm4e2KSw0w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jaegeuk Kim <jaegeuk@kernel.org>,
	=?UTF-8?q?Light=20Hsieh=20=28=E8=AC=9D=E6=98=8E=E7=87=88=29?= <Light.Hsieh@mediatek.com>,
	Daeho Jeong <daehojeong@google.com>,
	Chao Yu <chao@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.6 09/20] f2fs: don't set RO when shutting down f2fs
Date: Wed,  5 Jun 2024 07:51:52 -0400
Message-ID: <20240605115225.2963242-9-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240605115225.2963242-1-sashal@kernel.org>
References: <20240605115225.2963242-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.32
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_045243_295243_E5050A2D 
X-CRM114-Status: GOOD (  11.28  )
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

From: Jaegeuk Kim <jaegeuk@kernel.org>

[ Upstream commit 3bdb7f161697e2d5123b89fe1778ef17a44858e7 ]

Shutdown does not check the error of thaw_super due to readonly, which
causes a deadlock like below.

f2fs_ioc_shutdown(F2FS_GOING_DOWN_FULLSYNC)        issue_discard_thread
 - bdev_freeze
  - freeze_super
 - f2fs_stop_checkpoint()
  - f2fs_handle_critical_error                     - sb_start_write
    - set RO                                         - waiting
 - bdev_thaw
  - thaw_super_locked
    - return -EINVAL, if sb_rdonly()
 - f2fs_stop_discard_thread
  -> wait for kthread_stop(discard_thread);

Reported-by: "Light Hsieh (謝明燈)" <Light.Hsieh@mediatek.com>
Reviewed-by: Daeho Jeong <daehojeong@google.com>
Reviewed-by: Chao Yu <chao@kernel.org>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/super.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 5d294c8a025ca..ec3f4a5ed2172 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4178,9 +4178,15 @@ void f2fs_handle_critical_error(struct f2fs_sb_info *sbi, unsigned char reason,
 	if (shutdown)
 		set_sbi_flag(sbi, SBI_IS_SHUTDOWN);
 
-	/* continue filesystem operators if errors=continue */
-	if (continue_fs || f2fs_readonly(sb))
+	/*
+	 * Continue filesystem operators if errors=continue. Should not set
+	 * RO by shutdown, since RO bypasses thaw_super which can hang the
+	 * system.
+	 */
+	if (continue_fs || f2fs_readonly(sb) || shutdown) {
+		f2fs_warn(sbi, "Stopped filesystem due to reason: %d", reason);
 		return;
+	}
 
 	f2fs_warn(sbi, "Remounting filesystem read-only");
 	/*
-- 
2.43.0


