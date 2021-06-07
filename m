Return-Path: <SRS0=qtn6=LB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4A39C4743D
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Jun 2021 03:27:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CE6D610A2
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Jun 2021 03:27:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CE6D610A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Cvf+uT7I6JfE49VlESM0ZzkjZOH2RSq7eZchiy9kX0U=; b=eNUOM1jmGHM+es
	qK2crG0vaMHBqFImYwAaH0WokEZ6xP0cYZwdVth4d8jfLCyJUDTmFtXdXdzDZixDMdIfvQ4VKxdqL
	ti9hNd4oki/Y1IQ6n0ch1U7tZ8jY6Osv7WOymhCmKblF+Wa9APdVRaXFxFxdSUuSakTsD//m7Keic
	H7BQK8L6RMkLJF1Colschwhm+DUbryK8LCuBtWv/rkKgR7nTjSPZgrIXeMSXzx8l6gsiEKDM9qLyG
	Ws4uWJ09qbsJLi6IRquXIZw9/NSAz9d7yttNOTt6J47QKiwd8ms/EoTlLr3PyocCUCKU63m61gVhr
	Fl2eH1yrMEpIR9YjHk5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lq5sq-001MzU-Eu; Mon, 07 Jun 2021 03:25:00 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lq5sZ-001Mx7-4a; Mon, 07 Jun 2021 03:24:48 +0000
X-UUID: 03df8ea27f49414596c4eb3cafb01c5b-20210606
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=21Y0x8qJvtHXQX9Iwq5PhxjpP0TbMEm0yPa0bfZDSJI=; 
 b=dWmRIx8Z7mvzBcMs0n5T4PZ8kmnR6aAKDATHuFe8WPrGc/DbmHfq2tbmgkNnLQphoEseHzzihAGznE0ZcEqG8NJs1mXZ0VyANjIOH4XegCplGlQLbfJALIDbDFmFldfDIDhXYaQcm/aM19WEI5N1mBMDAyi5nZ3dd3McOAcNGNU=;
X-UUID: 03df8ea27f49414596c4eb3cafb01c5b-20210606
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <mark-pk.tsai@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 448820202; Sun, 06 Jun 2021 20:24:39 -0700
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 6 Jun 2021 20:24:37 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 7 Jun 2021 11:24:36 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 7 Jun 2021 11:24:36 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: Steven Rostedt <rostedt@goodmis.org>
CC: Ingo Molnar <mingo@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <mark-pk.tsai@mediatek.com>,
 <yj.chiang@mediatek.com>
Subject: [PATCH] arm64: ftrace: don't dereference a probably invalid address
Date: Mon, 7 Jun 2021 11:23:30 +0800
Message-ID: <20210607032329.28671-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210606_202444_672783_CB498244 
X-CRM114-Status: GOOD (  11.49  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Address in __mcount_loc may be invalid if somthing goes wrong.
On our arm64 platform, the bug in recordmcount make kernel
crash in ftrace_init().

https://lore.kernel.org/lkml/20210607023839.26387-1-mark-pk.tsai@mediatek.com/

Return -EFAULT if we are dealing with out-of-range condition
to prevent dereference the invalid address in ftrace_bug(),
then the kernel can disable ftrace safely for problematic
__mcount_loc.

Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
---
 arch/arm64/kernel/ftrace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/ftrace.c b/arch/arm64/kernel/ftrace.c
index b5d3ddaf69d9..98bec8445a58 100644
--- a/arch/arm64/kernel/ftrace.c
+++ b/arch/arm64/kernel/ftrace.c
@@ -201,7 +201,7 @@ int ftrace_make_nop(struct module *mod, struct dyn_ftrace *rec,
 			preempt_enable();
 
 			if (WARN_ON(!mod))
-				return -EINVAL;
+				return -EFAULT;
 		}
 
 		/*
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
