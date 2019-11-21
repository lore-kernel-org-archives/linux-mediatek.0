Return-Path: <SRS0=pCB/=ZN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDD36C432C0
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Nov 2019 08:13:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8491820855
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Nov 2019 08:13:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lX766hYg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="SJt/F7Sy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8491820855
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Bs2W8F9uhWykmXDINNtHHGRyOC9Xi8lt8muWVPAfHQ8=; b=lX766hYggI05Ol
	XgybMoy2PcQDl9DbCBS4a/CpxLk6FVzzTT/Lyn5QwTk5ahQfDMsOD77UoXk0p/nB+nndYsKoeMGdO
	O7NKCHRhaRd5xBpsXSfgNN4U/WZY4R8Ieo2GQyUlQnkQj3jv+s69KPG/7A6D6G7URr8aJ3Xr1mdo8
	oq9XnLZsU6wMbvflW1Ai17rxnMUmYjzGvhM17FNRuCcqkzgNlvHvSRK8OTnlMb8oQg19sRvr7ExPe
	aI0pjINlr41bRLflrRI2+Lz0MBQCHNgsx9Ju2rFIo6hTXNxqokv6xTNHk/U1J/fiQUo7KPQQdtIdj
	blv7EAEe4xc+G6hG7hyw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iXhag-0002tB-Vt; Thu, 21 Nov 2019 08:13:26 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iXhae-0002sG-Ui; Thu, 21 Nov 2019 08:13:26 +0000
X-UUID: 0c63917b8d284f5380b58643958a4581-20191121
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=U97mKHK8idOeQxpJETaSEs2XLJJYwjnYHMcOchdEF+g=; 
 b=SJt/F7SyKCEqREcvs+FW59AwJMxgQkTUFhIt0sEmSuDcXpPD5l3fzGFmLcZBEpJbM4Trh7w+PYETKFwOw8wbuKTU7BKbZncbOnTgCkFciHAFgkcp61lrP1gxhXdRLOFuWoqX69NpwIZ5MsmekvZlLXRvmC/rPoDhyXD8QRvcHW0=;
X-UUID: 0c63917b8d284f5380b58643958a4581-20191121
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yt.chang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1199080665; Thu, 21 Nov 2019 00:13:18 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 21 Nov 2019 00:13:22 -0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 21 Nov 2019 16:13:13 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Thu, 21 Nov 2019 16:13:37 +0800
From: YT Chang <yt.chang@mediatek.com>
To: YT Chang <yt.chang@mediatek.com>, Peter Zijlstra <peterz@infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 1/1] sched: panic, when call schedule with preemption disable
Date: Thu, 21 Nov 2019 16:13:05 +0800
Message-ID: <1574323985-24193-1-git-send-email-yt.chang@mediatek.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191121_001324_993426_6207080C 
X-CRM114-Status: UNSURE (   9.18  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, wsd_upstream@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

When preemption is disable, call schedule() is incorrect behavior.
Suggest to panic directly rather than depend on panic_on_warn.

Signed-off-by: YT Chang <yt.chang@mediatek.com>
---
 kernel/sched/core.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 7880f4f..214e8d8 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -3861,9 +3861,8 @@ static noinline void __schedule_bug(struct task_struct *prev)
 		print_ip_sym(preempt_disable_ip);
 		pr_cont("\n");
 	}
-	if (panic_on_warn)
-		panic("scheduling while atomic\n");
 
+	panic("scheduling while atomic\n");
 	dump_stack();
 	add_taint(TAINT_WARN, LOCKDEP_STILL_OK);
 }
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
