Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38B80C98304
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2026 20:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uyRungl+NqmtYNgL/8dH71XCYpq6TtSAT/snP5PAQEU=; b=dVXTJ+u7YQFFgI5dKCF29kT/C/
	kYrkKGJxEWL62H7SnjqtTNTJ8o5G5vD2DHrLXzQ1VSRcASgq+AvvDpRs8Hsb0O4EfEKmLrYxWn1vP
	Pv7mE6F6wS3rVEBPOdHtPzzsPGkc6W40ijayijPmjHkj8Rc2WgigdzqCmzb01AVX3aaqVeRGQnOmw
	+CB32/yR6FfHTnWJDw2KK/8wO3Z6EqELLxV7rVCey8mXHHt9TFYP0qpm7vTLFNRAy+MQElFgh70An
	9xqP3D6ax9nYxTdwJdfxr7OOPGgarQdBTopObiZYKGB5vCLzv0rrzj5WVZDiYPrveF+XxVQ7IpZbK
	4FUZimHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x96k2-00000006V4r-0jTk;
	Tue, 22 Sep 2026 20:05:28 +0000
Received: from mail-dl2-x10.google.com ([2607:f8b0:4864:38::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x96jl-00000006Une-3OoR
	for linux-mediatek@lists.infradead.org;
	Tue, 22 Sep 2026 20:05:12 +0000
Received: by mail-dl2-x10.google.com with SMTP id a92af1059eb24-142dd05d97dso179155c88.0
        for <linux-mediatek@lists.infradead.org>; Tue, 22 Sep 2026 13:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1790107508; x=1790712308; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uyRungl+NqmtYNgL/8dH71XCYpq6TtSAT/snP5PAQEU=;
        b=hcQaSX67O8nRS3JXCED74tYvX1W7lLijlCijipDjCQa9qjpDIQ4OvGXB7ZU+IxgWq8
         17qulAy1PrsGH2xlu3ZQkjTlItA/rWFBuuhJ/xkEp1iFi3ADJYr3+EysuNG4oixQ2RsX
         89a5f4EAs/sJwnvcDcPgsqfDcDDwpGJKbLhz+D6IFFkTYHyMfAwPtriwTDDEJlBb5tVP
         l79n0PqKsY8rVJCKs8XgnKwfO94+MYSDb7RAS+gLKKtLh8XjaGaQiS8ARfoQxF23riVc
         2IfpuDGVcDc8UdJG39cYtlPWv+EKA4moHEjuzK0vDgStBJHN4GqAPwOmd67GxfaGoWAO
         YE7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790107508; x=1790712308;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uyRungl+NqmtYNgL/8dH71XCYpq6TtSAT/snP5PAQEU=;
        b=MIOQYLuMCNVt+U0rrwc9ix/0RBd5sYS/XACG6GYq9iEpdNANI0DRO5LaT0alX61WwA
         zV6pZCi8ejJkVR9QJpAteieKuW8wVgX6XTuzfh4VqpvMcRDRnyErI85RMe/mvmBksZbA
         /ZNTDbddDRNPeWDJzjEJvnVEoUAHIJRfCB+3qLa/CQUwtQtaaKYbZA6jDE9wn+RRElPV
         dTgqKLaFUXQEGatp1T24s/0Drhu4beJDwZuesATSnfnAnv5wDU5nUzVTfPOaagWTLK0Q
         wIChevBOiduZ2aQ8eHiEhmphjoRfrw/9l2GoNK9HgJUVNTNvm1Zd2g0pXNiWw4nMCOM8
         yeHA==
X-Forwarded-Encrypted: i=1; AKwUvByXUmZ5phL2ZOEK5DB41tFMxNQnxyuxEucwacPJSjaFASdUMjqu0RCu2ffBt+n71QgeVLVJlBRLnj/J1aM+yw==@lists.infradead.org
X-Gm-Message-State: AFuF++kCLRPsiTB28ADthAlLbMhyY/jm0E0aUa2NIKHfTT7JeghEqxuK
	JxTN1+63xCMQwTizCNfOgc0QdFiwMt4R4kTEM37ydPksH1NC3tXq00CwwrG+qxyg6QQ=
X-Gm-Gg: AYBFou3vRgk+2jlZ5uAfrJB8UewBU+HTw5Fk0EwG3FjbkZG1/96zC5k2BSYRnTmcH+j
	oHl+tEjlYcu3Bh1UfTmjCivq8f3Jaa7/iB4WKbphtbtDNbbmAroOxJMykSpCPT6l9uFmpjYbda5
	dpIXRyiJJJD0/JjnwMNzW6/6JHQddsu/QMQw/YE/g6c/2Nk/9c0Lah6M9sMPEucVmMHJNuWRFv6
	8HnAxpIzSEn5E09JiUrkB0fg33M675s9RRW7iKbozsZEeiwatuRSOll+IG05PYTK3npyDRlp1gP
	dkH33O6kbBUzLbnYPadhrW5yviF+ceZ6/fJuWZi1QPjUaIt2aqDpTG/YWBxI/QyEaBr8jHBPb8v
	wvY3XU51kzm9LGV4dnfg8iQGAbpxsCDzRXzFm4mmPotwfsJbnOIB3CDjLl24b8bKzBmX2pQxBTR
	cfzzCqqlKxO+W0OL151Prw5qhgtopSVcZ+kgrq+uzb4QM2GIyq1p7hdJx2foO6X/i2J6GWDRd6n
	oue8X1WBW7eP7iyfTb/RKWQfD6VYheT6AxTc3zLOwlL1dBHrqe5BtD2STHm5WDJdfZNe5c=
X-Received: by 2002:a05:7022:3a08:b0:143:4710:a84e with SMTP id a92af1059eb24-144f9186b23mr505519c88.15.1790107493262;
        Tue, 22 Sep 2026 13:04:53 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:c016:77a6:d382:7611])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f983c5a1sm852614c88.7.2026.09.22.13.04.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 22 Sep 2026 13:04:52 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: Artem Dinaburg <artem@trailofbits.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Gao Xiang <xiang@kernel.org>,
	Chao Yu <chao@kernel.org>,
	Yue Hu <huyue2@coolpad.com>,
	Jeffle Xu <jefflexu@linux.alibaba.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-erofs@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Sandeep Dhavale <dhavale@google.com>,
	Will Shiu <will.shiu@mediatek.com>,
	Gao Xiang <hsiangkao@linux.alibaba.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Will Shiu <Will.Shiu@mediatek.com>
Subject: [PATCH 6.1.y] erofs: Fix detection of atomic context
Date: Tue, 22 Sep 2026 16:04:36 -0400
Message-ID: <20260922200448.27724-1-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_130509_983652_B0F55A6C 
X-CRM114-Status: GOOD (  17.85  )
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

From: Sandeep Dhavale <dhavale@google.com>

[ Upstream commit 12d0a24afd9ea58e581ea64d64e066f2027b28d9 ]

Current check for atomic context is not sufficient as
z_erofs_decompressqueue_endio can be called under rcu lock
from blk_mq_flush_plug_list(). See the stacktrace [1]

In such case we should hand off the decompression work for async
processing rather than trying to do sync decompression in current
context. Patch fixes the detection by checking for
rcu_read_lock_any_held() and while at it use more appropriate
!in_task() check than in_atomic().

Background: Historically erofs would always schedule a kworker for
decompression which would incur the scheduling cost regardless of
the context. But z_erofs_decompressqueue_endio() may not always
be in atomic context and we could actually benefit from doing the
decompression in z_erofs_decompressqueue_endio() if we are in
thread context, for example when running with dm-verity.
This optimization was later added in patch [2] which has shown
improvement in performance benchmarks.

==============================================
[1] Problem stacktrace
[name:core&]BUG: sleeping function called from invalid context at kernel/locking/mutex.c:291
[name:core&]in_atomic(): 0, irqs_disabled(): 0, non_block: 0, pid: 1615, name: CpuMonitorServi
[name:core&]preempt_count: 0, expected: 0
[name:core&]RCU nest depth: 1, expected: 0
CPU: 7 PID: 1615 Comm: CpuMonitorServi Tainted: G S      W  OE      6.1.25-android14-5-maybe-dirty-mainline #1
Hardware name: MT6897 (DT)
Call trace:
 dump_backtrace+0x108/0x15c
 show_stack+0x20/0x30
 dump_stack_lvl+0x6c/0x8c
 dump_stack+0x20/0x48
 __might_resched+0x1fc/0x308
 __might_sleep+0x50/0x88
 mutex_lock+0x2c/0x110
 z_erofs_decompress_queue+0x11c/0xc10
 z_erofs_decompress_kickoff+0x110/0x1a4
 z_erofs_decompressqueue_endio+0x154/0x180
 bio_endio+0x1b0/0x1d8
 __dm_io_complete+0x22c/0x280
 clone_endio+0xe4/0x280
 bio_endio+0x1b0/0x1d8
 blk_update_request+0x138/0x3a4
 blk_mq_plug_issue_direct+0xd4/0x19c
 blk_mq_flush_plug_list+0x2b0/0x354
 __blk_flush_plug+0x110/0x160
 blk_finish_plug+0x30/0x4c
 read_pages+0x2fc/0x370
 page_cache_ra_unbounded+0xa4/0x23c
 page_cache_ra_order+0x290/0x320
 do_sync_mmap_readahead+0x108/0x2c0
 filemap_fault+0x19c/0x52c
 __do_fault+0xc4/0x114
 handle_mm_fault+0x5b4/0x1168
 do_page_fault+0x338/0x4b4
 do_translation_fault+0x40/0x60
 do_mem_abort+0x60/0xc8
 el0_da+0x4c/0xe0
 el0t_64_sync_handler+0xd4/0xfc
 el0t_64_sync+0x1a0/0x1a4

[2] Link: https://lore.kernel.org/all/20210317035448.13921-1-huangjianan@oppo.com/

Reported-by: Will Shiu <Will.Shiu@mediatek.com>
Suggested-by: Gao Xiang <xiang@kernel.org>
Signed-off-by: Sandeep Dhavale <dhavale@google.com>
Reviewed-by: Gao Xiang <hsiangkao@linux.alibaba.com>
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
Link: https://lore.kernel.org/r/20230621220848.3379029-1-dhavale@google.com
Signed-off-by: Gao Xiang <hsiangkao@linux.alibaba.com>

[ Backport to 6.1.y: the source change is unchanged; only its location
  in z_erofs_decompress_kickoff() differs. ]
Assisted-by: LLM
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
Hi Greg, Sasha, and EROFS maintainers,

I am continuing backporting CVE fixes still missing from 6.1.y.
This fix is inherited by v6.6 and every later mainline release, but 6.1.y
still has the affected code. The target-specific adjustment is described
in the bracketed note above.

Could you please queue it for 6.1.y?

Thanks,
Artem Dinaburg

CVE: CVE-2023-53231

Build: This patch was included in an x86_64 allmodconfig and
CONFIG_WERROR=y build.
It produced vmlinux and modules with no new warnings or errors.

AI assistance: An LLM helped find, adapt, and validate this
backport; I reviewed the patch and test output.

 fs/erofs/zdata.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/erofs/zdata.c b/fs/erofs/zdata.c
index 66c323cbdd73e1..49b7c77488415a 100644
--- a/fs/erofs/zdata.c
+++ b/fs/erofs/zdata.c
@@ -1271,7 +1271,7 @@ static void z_erofs_decompress_kickoff(struct z_erofs_decompressqueue *io,
 	if (atomic_add_return(bios, &io->pending_bios))
 		return;
 	/* Use workqueue and sync decompression for atomic contexts only */
-	if (in_atomic() || irqs_disabled()) {
+	if (!in_task() || irqs_disabled() || rcu_read_lock_any_held()) {
 		queue_work(z_erofs_workqueue, &io->u.work);
 		/* enable sync decompression for readahead */
 		if (sbi->opt.sync_decompress == EROFS_SYNC_DECOMPRESS_AUTO)
-- 
2.39.5


