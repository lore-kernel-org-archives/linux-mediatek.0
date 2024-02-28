Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3051AC47DD9
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Feb 2024 07:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6ieR/zEKf2T/mkPnmZNu342qzL0+86b6tQM2bieJG+w=; b=B/YEvPZ6O1CRCYtDNSS4hGITXK
	rH4lnFW84diSHtWQizAhZ2A/a2HeGn78l13frxfZw/8P95ElhZK9CMn/H/s1X5/mVQACjasS3mcTC
	0ST5l3VP1N5zn4LNswksu41/rTjlFQfgHLyjAb9jmVJji2gr/jfMZCPxWECKmhraapV2arMgnOCeS
	3i964gQhG7RFJNnE5yOixNBpBAnvSRhh4QC8nS4ILojCiVuRXCHQcPNlG5+iX8mZwLCEOgGaIJlTH
	L2LMnS4Zhetm9gs1QcLPwN4kanLAPBMeMIDty/WEU8wBinMhqoboPnHZZSUNzNZjAr1iTwxCp29os
	OIN9xgMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfEkw-00000008N5K-2FQm;
	Wed, 28 Feb 2024 07:53:34 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfEku-00000008N4T-0osu;
	Wed, 28 Feb 2024 07:53:33 +0000
X-UUID: 7352a844d60e11eea40fa5ac21cdad35-20240228
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=6ieR/zEKf2T/mkPnmZNu342qzL0+86b6tQM2bieJG+w=;
	b=hJrndjlcxOwhSNbn51R2sHlrwXVEWaoDbycUx1xyYTZ7xarHMqjYY+WCG8H2wYLy6lFaLxmw+Pjl7i7p3sT/Xk9rLhb7EWLxn+BKErd8rkdwoyXDBzvjarmQHQywu7qYPp/ydA9Gqj7X/OFk9t9zsS52rJi+HPkrKz6TbMPZxTw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:0eec903d-495b-4473-b8cd-1ce34cbd5394,IP:0,U
	RL:0,TC:0,Content:-25,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:-55
X-CID-META: VersionHash:6f543d0,CLOUDID:46ae4bff-c16b-4159-a099-3b9d0558e447,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:2,IP:nil,UR
	L:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:
	1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 7352a844d60e11eea40fa5ac21cdad35-20240228
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <haibo.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 592862741; Wed, 28 Feb 2024 00:53:24 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 28 Feb 2024 15:32:49 +0800
Received: from mszsdtlt102.gcn.mediatek.inc (10.16.4.142) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 28 Feb 2024 15:32:49 +0800
From: Haibo Li <haibo.li@mediatek.com>
To: Russell King <linux@armlinux.org.uk>, Alexandre Mergnat
	<amergnat@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Haibo Li <haibo.li@mediatek.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <xiaoming.yu@mediatek.com>
Subject: [PATCH] ARM: unwind: fix unwind started from IRQ stack in THUMB2 kernel
Date: Wed, 28 Feb 2024 15:32:47 +0800
Message-ID: <20240228073247.13102-1-haibo.li@mediatek.com>
X-Mailer: git-send-email 2.34.3
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_235332_258822_CDFE4B32 
X-CRM114-Status: GOOD (  13.23  )
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

When unwinds started from IRQ stack,call_with_stack is the only
place to do stack switch.
It need to identify call_with_stack when unwinding.

In thumb2 kernel,it fails to identify call_with_stack.
In practice,(u32)&call_with_stack has bit 0 set.

	prel31_to_addr(&idx->addr_offset) is 0x806ed518,
	while (u32)&call_with_stack is 0x806ed519.
So it is impossible to do stack switch.

dump_stack from IRQ stack gets below result:
...
 call_timer_fn from __run_timers+0x163/0x25c
 __run_timers from run_timer_softirq+0x15/0x24
 run_timer_softirq from __do_softirq+0xe3/0x232
 __do_softirq from __irq_exit_rcu+0x3f/0xac
 __irq_exit_rcu from irq_exit+0x7/0xe
 irq_exit from call_with_stack+0xd/0x10
...
The stacktrace ends with call_with_stack.

Since bit 0 of pc in thumb2 is always 0,skip bit 0 when do compraing.
Then we get expected stacktrace:
...
 call_timer_fn from __run_timers+0x163/0x25c
 __run_timers from run_timer_softirq+0x15/0x24
 run_timer_softirq from __do_softirq+0xe3/0x232
 __do_softirq from __irq_exit_rcu+0x3f/0xac
 __irq_exit_rcu from irq_exit+0x7/0xe
 irq_exit from call_with_stack+0xd/0x10
 call_with_stack from __irq_svc+0x93/0xb6
Exception stack(0xf0875f60 to 0xf0875fa8)
5f60: ****
5f80: ****
5fa0: ****
 __irq_svc from arch_local_irq_enable+0x2/0x4
 arch_local_irq_enable from do_idle+0xad/0x1f6
...

Signed-off-by: Haibo Li <haibo.li@mediatek.com>
---
 arch/arm/kernel/unwind.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/kernel/unwind.c b/arch/arm/kernel/unwind.c
index 9d2192156087..89e1f440082c 100644
--- a/arch/arm/kernel/unwind.c
+++ b/arch/arm/kernel/unwind.c
@@ -482,7 +482,8 @@ int unwind_frame(struct stackframe *frame)
 
 	ctrl.check_each_pop = 0;
 
-	if (prel31_to_addr(&idx->addr_offset) == (u32)&call_with_stack) {
+	if (prel31_to_addr(&idx->addr_offset) ==
+		((u32)&call_with_stack & (~0x01))) {
 		/*
 		 * call_with_stack() is the only place where we permit SP to
 		 * jump from one stack to another, and since we know it is
-- 
2.18.0


