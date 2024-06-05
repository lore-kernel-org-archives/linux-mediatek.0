Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18468C27C53
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Jun 2024 11:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9wpB8uBoFcNvTCs9+15aoJrzUn0UD65S8Pfc4N4m1ps=; b=BzHNBWR3HHdht/e2loqGnLy6XA
	oUE7re/vpLndWJINSqLQisVCXckuTIB8ryZtWv3XNmYgbVYwd7u30jVuKHP2YzrSkNZihZYsOCiW3
	Z6dR3SJnjGhMQ6wAy35AFn9bTVJFbwHUyzygpiNRlN08iznaZo/p16naTdEr6anJ/zjqowG/npYrP
	6Tlt1t4cS8fRgBUjtDksZ5bImW7elN2lCsHMe5yY+tLdXclHpSciURaoDiYZIFwHHEkMtb4GfZSYX
	Y68X1apCW3wOZ4PT4j7jMs5/mHeiYJLn94OoLiWHJ6PlszUVL2DAMDYAi642aVxHl2qD384TQAFMk
	N37M3m+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEp9O-00000005mM1-2Sv7;
	Wed, 05 Jun 2024 11:49:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEp9K-00000005mK9-1KZF;
	Wed, 05 Jun 2024 11:49:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 26BC961657;
	Wed,  5 Jun 2024 11:49:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9231FC32781;
	Wed,  5 Jun 2024 11:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717588188;
	bh=YXLht4DMVx9D4bBLqSYfEGN9zRr4REGZhY2ixp5EipA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QQupnB3Hf1a2wkwqP6i9Dj8ZKVYPlgB6t5QdZrMVpGa2i29e98edU/Ojt1c0XBkWr
	 DriPAFvLdXG13ib3DGFjVM07f3pSpil0Wzv8INE202/t0mq6oeG2aZ/aJHv4gsTLTW
	 fXJEsZn1Og/6c/vKis3jJoorsOOY3e+/AOWpk3ox6oK9QkRW3oln5ur4AHVQwF1/l5
	 111HpOZILKnYgVbl/squlMHPVEyGWm7zov+s8xlzw+G9TROF7UbD4G0vnIx5ovsvov
	 jetUcQ+QF24o7GQAcV55Hf2cHiRCsblK1VIrb4o1bmqQpVD2yQIePF2NYYiUdFDvyX
	 wG1XsRLdOkjsg==
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
Subject: [PATCH AUTOSEL 6.9 11/28] f2fs: don't set RO when shutting down f2fs
Date: Wed,  5 Jun 2024 07:48:40 -0400
Message-ID: <20240605114927.2961639-11-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240605114927.2961639-1-sashal@kernel.org>
References: <20240605114927.2961639-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.9.3
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_044950_420098_B73F9FBC 
X-CRM114-Status: GOOD (  11.38  )
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
index e4c795a711f0f..2f75a7dfc311d 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4129,9 +4129,15 @@ void f2fs_handle_critical_error(struct f2fs_sb_info *sbi, unsigned char reason,
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


