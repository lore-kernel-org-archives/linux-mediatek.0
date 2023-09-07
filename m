Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F14B4EC873D
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Sep 2023 15:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+QqWQqlHpOfjuKiO9hGk57mQbhUOn1rkYIebCvobCQU=; b=y8xnHYmdxUHbPTrMmjq65Rblzj
	8HB0Iwd20yo8XRQ//bc4PCM59EN13YdpzKYSDp6HRSY36JIPWy0rVN6+suvtT5WdSLdMnsHH/Bnzr
	TjaIQfIdjNfiGaq301YDBltirYPnyy4cX85T1BvbmG0PnSoDysLP+OpDTOeEI0G5y5yTQgruAwxo6
	1i7Q5/W8Zj9LgUx0GOinsyXs2D8AMTYV6+iQus9dHAMwxZDZtRsmw9yp3ndJbF7m2eqcNpZKKr0Yh
	bYepFtsg2nnzZWo7DgEjtHzUFKtyyePu6IGddYrWPifU3V8Bm74Y86ORxJY7rnXdKcScBtm2Q/Ha0
	kQnlvm+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeHB5-00CJcQ-31;
	Thu, 07 Sep 2023 15:44:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeHB2-00CJaf-0V;
	Thu, 07 Sep 2023 15:44:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 919AB61251;
	Thu,  7 Sep 2023 15:44:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CA45C4E663;
	Thu,  7 Sep 2023 15:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694101455;
	bh=5UamJ9ke8+7Uvtdu9TDUqApCfgI2GisAxIGGy4At/hI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SHNJtSIJlr8nRhN6424p6M1z36bwSCy/n6t+8Sd3Xj5nXy+lclogWlkhUSD8w2x5C
	 o9GVP7pVh0ZAGTcF+Efo7toK7NvX9VIg+luGDwEy5c1VDSnpWBtyW3MbZiBuBXwY1T
	 d7srHyLnnDbpLydGwwlaoAu5ebOIbJIYHHuwKzf/SU2YVeBiXbiHpX6qSRC1KkxPpz
	 34/aJnEOVovQ84Cd3uB9cNZ7xzeXDzF6KivAqhUHkiT6Y5MZ3x38vvfg14qJnHnK4T
	 kw56ZhTSohMQnMtuDDjHXMKT0LrEmMxupKvz6Oaq0k76gMOEBEBLobOBsxpYqN1KPU
	 IHjdZt4Oc9D0g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Will Shiu <Will.Shiu@mediatek.com>,
	Jeff Layton <jlayton@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	chuck.lever@oracle.com,
	viro@zeniv.linux.org.uk,
	brauner@kernel.org,
	matthias.bgg@gmail.com,
	linux-fsdevel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.15 3/3] locks: fix KASAN: use-after-free in trace_event_raw_event_filelock_lock
Date: Thu,  7 Sep 2023 11:44:08 -0400
Message-Id: <20230907154408.3421918-3-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230907154408.3421918-1-sashal@kernel.org>
References: <20230907154408.3421918-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.131
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230907_084416_274167_3487FE2D 
X-CRM114-Status: GOOD (  12.53  )
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

From: Will Shiu <Will.Shiu@mediatek.com>

[ Upstream commit 74f6f5912693ce454384eaeec48705646a21c74f ]

As following backtrace, the struct file_lock request , in posix_lock_inode
is free before ftrace function using.
Replace the ftrace function ahead free flow could fix the use-after-free
issue.

[name:report&]===============================================
BUG:KASAN: use-after-free in trace_event_raw_event_filelock_lock+0x80/0x12c
[name:report&]Read at addr f6ffff8025622620 by task NativeThread/16753
[name:report_hw_tags&]Pointer tag: [f6], memory tag: [fe]
[name:report&]
BT:
Hardware name: MT6897 (DT)
Call trace:
 dump_backtrace+0xf8/0x148
 show_stack+0x18/0x24
 dump_stack_lvl+0x60/0x7c
 print_report+0x2c8/0xa08
 kasan_report+0xb0/0x120
 __do_kernel_fault+0xc8/0x248
 do_bad_area+0x30/0xdc
 do_tag_check_fault+0x1c/0x30
 do_mem_abort+0x58/0xbc
 el1_abort+0x3c/0x5c
 el1h_64_sync_handler+0x54/0x90
 el1h_64_sync+0x68/0x6c
 trace_event_raw_event_filelock_lock+0x80/0x12c
 posix_lock_inode+0xd0c/0xd60
 do_lock_file_wait+0xb8/0x190
 fcntl_setlk+0x2d8/0x440
...
[name:report&]
[name:report&]Allocated by task 16752:
...
 slab_post_alloc_hook+0x74/0x340
 kmem_cache_alloc+0x1b0/0x2f0
 posix_lock_inode+0xb0/0xd60
...
 [name:report&]
 [name:report&]Freed by task 16752:
...
  kmem_cache_free+0x274/0x5b0
  locks_dispose_list+0x3c/0x148
  posix_lock_inode+0xc40/0xd60
  do_lock_file_wait+0xb8/0x190
  fcntl_setlk+0x2d8/0x440
  do_fcntl+0x150/0xc18
...

Signed-off-by: Will Shiu <Will.Shiu@mediatek.com>
Signed-off-by: Jeff Layton <jlayton@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/locks.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/locks.c b/fs/locks.c
index 881fd16905c61..4899a4666f24d 100644
--- a/fs/locks.c
+++ b/fs/locks.c
@@ -1339,6 +1339,7 @@ static int posix_lock_inode(struct inode *inode, struct file_lock *request,
  out:
 	spin_unlock(&ctx->flc_lock);
 	percpu_up_read(&file_rwsem);
+	trace_posix_lock_inode(inode, request, error);
 	/*
 	 * Free any unused locks.
 	 */
@@ -1347,7 +1348,6 @@ static int posix_lock_inode(struct inode *inode, struct file_lock *request,
 	if (new_fl2)
 		locks_free_lock(new_fl2);
 	locks_dispose_list(&dispose);
-	trace_posix_lock_inode(inode, request, error);
 
 	return error;
 }
-- 
2.40.1


