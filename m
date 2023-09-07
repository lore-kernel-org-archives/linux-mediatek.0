Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 460C5EC873A
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Sep 2023 15:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dwN5hhOuqhZ+tLwk+JorpaZXT9fScgicMoGtQIzSMz4=; b=Gy5T9Is1wAWuZSN8+L439HOOqO
	xvu/irp9eoJOwcSAT49NOVcIXtFhgz2ixx9S6QaADakV2vQxlkTg8cC3pHdjjtBWLQHgEpgtxi2Hs
	7lXTYfKuCtCEe7fOxr3uORk6ga7Fw6tvqtEAzBchfVCNvz1/MMP7rVzijHSi790NbwOA1Xt1W7YBI
	WVU8xiRZBn8cG41fhy4Ov2d4P9oerDofJty61zDO9MZvopWZ2dCmd8/ZsuAma7EkkqmE5wKFy8Xur
	nr4zRmdzXh1B58qLyJN8dtWuySmAuGzesUAG7OMVNNjBKVcw37CjDRQiWyKzlY6T4kfpu/Tea8+Ip
	y3y89JpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeHAp-00CJVO-0n;
	Thu, 07 Sep 2023 15:44:03 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeHAm-00CJUI-10;
	Thu, 07 Sep 2023 15:44:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AF24360C13;
	Thu,  7 Sep 2023 15:43:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDFDCC4AF7D;
	Thu,  7 Sep 2023 15:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694101439;
	bh=LIsG/Rx/6J57d7MY7TqjzdpQe+H8ANtxeJkYiEbt5zk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kgtMw334MLGu8ZoCCdYZuDGf0iMy7q7+R3QH4pBEHgic9Zuzuk8xmIorxmFEFHkWG
	 vubfknu2hrzu82vFnQycsrD2lGq7JO+J/lhm1EvqOFg7FzVF8X8uyhAyniLzj17BNv
	 xVxOz56tKbKwdnLbGIEXbJlZ6VSYD6Udx2jiMF2QMc3mXsb+ySHlRJSVqL9VyHpDgV
	 Toa2VhH1KTbrCiWg5tL6vGGg6wvTqrBCIU+dehxxGFwWtj8kAOk/Pnwe/ZNZkbsRci
	 8/lw+0COH6lb0MrczbEgk9GF+sKw5r8YQwSxLw5LToebg0mXCUwdi/0x5UDGtw/7xj
	 21QSPr1IeDJlw==
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
Subject: [PATCH AUTOSEL 6.4 5/5] locks: fix KASAN: use-after-free in trace_event_raw_event_filelock_lock
Date: Thu,  7 Sep 2023 11:43:49 -0400
Message-Id: <20230907154349.3421707-5-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230907154349.3421707-1-sashal@kernel.org>
References: <20230907154349.3421707-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.4.15
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230907_084400_434334_B308AA73 
X-CRM114-Status: GOOD (  12.43  )
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
index df8b26a425248..a552bdb6badc0 100644
--- a/fs/locks.c
+++ b/fs/locks.c
@@ -1301,6 +1301,7 @@ static int posix_lock_inode(struct inode *inode, struct file_lock *request,
  out:
 	spin_unlock(&ctx->flc_lock);
 	percpu_up_read(&file_rwsem);
+	trace_posix_lock_inode(inode, request, error);
 	/*
 	 * Free any unused locks.
 	 */
@@ -1309,7 +1310,6 @@ static int posix_lock_inode(struct inode *inode, struct file_lock *request,
 	if (new_fl2)
 		locks_free_lock(new_fl2);
 	locks_dispose_list(&dispose);
-	trace_posix_lock_inode(inode, request, error);
 
 	return error;
 }
-- 
2.40.1


