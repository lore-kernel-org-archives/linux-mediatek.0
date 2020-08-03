Return-Path: <SRS0=TVmU=BN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB2D3C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 15:40:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79A2B20578
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 15:40:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="y1QnZZRU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="FSH/bkb0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79A2B20578
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DB0o1VxK9WGL8MO/SdxyO1KgS8aTT6BubcyLIYzFZrQ=; b=y1QnZZRU+dn+OOD3RP5PkkSwqU
	K+KJaG/KyqR0fGtnXoafENnSA+UfWeY8uBED/R3yNKTvfUvr4wJ2XZ2YJsMCLr1okinbX1Z/9rTgd
	LCejdN02trmZFzHeKs/cex/HayA13YG7b2HBDWyo4csHIebz5alDjTUtDUi0XBPxSo6wMzrgwCsce
	q3J14KYBSHyArDVVWXaJI5PzRcONhZBfvLHb7AT1NWeajZBKxFwAwEgDR7IE3CGxcKzF0ri43xkEM
	dp7SoBWKmHzJxxzzxIkgRJ3zHHhdTzok6v/taTm/NJJMks/3KDJCEAIW0pXDXnrVNILxzT11Hsljq
	hIqylKMQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2cZc-0002ss-UU; Mon, 03 Aug 2020 15:40:25 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2cZX-0002q4-0T; Mon, 03 Aug 2020 15:40:20 +0000
X-UUID: 73c3fc968597484ea789302eaa73063f-20200803
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=+W1pY9M613RDdoabjfIUPYlQHHrDntAsNM3ob88BJcY=; 
 b=FSH/bkb0al/Q/U1KFmTzV8wUdTYCVrIFH7gtZ7abVZnGk1OH2iU5JXPWo3D45OfR9EfJ/em7Sg+A8NrMUaYD2ifpwikz8f7hETR0acvjj5jl7gI5VolLwwugouvnTjJ5tRRelkbfOb/1P33PRPNldattyA+wX5fGhNC1TjWbOf4=;
X-UUID: 73c3fc968597484ea789302eaa73063f-20200803
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1113573135; Mon, 03 Aug 2020 07:40:02 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 3 Aug 2020 08:40:04 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 3 Aug 2020 23:39:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 3 Aug 2020 23:39:52 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: Alexey Dobriyan <adobriyan@gmail.com>
Subject: [PATCH] proc: use untagged_addr() for pagemap_read addresses
Date: Mon, 3 Aug 2020 23:39:53 +0800
Message-ID: <20200803153953.20364-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_114019_180771_776C1F91 
X-CRM114-Status: GOOD (  13.70  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 Miles Chen <miles.chen@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

When we try to visit the pagemap of a tagged userspace pointer, we find
that the start_vaddr is not correct because of the tag.
To fix it, we should untag the usespace pointers in pagemap_read().

Signed-off-by: Miles Chen <miles.chen@mediatek.com>
---
 fs/proc/task_mmu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index dbda4499a859..d0c6e8e0cf37 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -1541,11 +1541,11 @@ static ssize_t pagemap_read(struct file *file, char __user *buf,
 
 	src = *ppos;
 	svpfn = src / PM_ENTRY_BYTES;
-	start_vaddr = svpfn << PAGE_SHIFT;
+	start_vaddr = untagged_addr(svpfn << PAGE_SHIFT);
 	end_vaddr = mm->task_size;
 
 	/* watch out for wraparound */
-	if (svpfn > mm->task_size >> PAGE_SHIFT)
+	if (start_vaddr > mm->task_size)
 		start_vaddr = end_vaddr;
 
 	/*
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
