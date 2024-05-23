Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CE10C25B75
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 May 2024 11:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BMiyz5iUdNSJDfbPTHgKO+oOHd+vDD99lj6IHQQx1VY=; b=LStyQvehb4l4x6Au/e0XyY8CL7
	68/ocv0jD4k+2F925lrIQT1Io0RqUOcq0AmY0CgypiUQJuoUcW0N9o8mDfDbcOzKYryyTGhpvg0O0
	V7qoMwei4CT6kNZhNzOzuYNtJ8kEs2H9WLnGPFwgI9edtZSX5pwpcpijJzpTXZzfM6iybkkHn9FUk
	9mI0JVNQrbhckVJcQm9rFT5hfRcrrBKWXfcPQtsQbpXDP/ydfmH6h+5DHxBoBp8QKetd0LLVcd+2U
	JuT1XJS7Lk/fV1f+mjgdolR7i/AWCop32hmjiNYoo9xAwuQbs5r2BcUBCkxsdkBGgiSQXnw2Ey/RJ
	0Ulfx8pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA6nl-0000000649j-2NWZ;
	Thu, 23 May 2024 11:40:05 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA6ni-0000000648k-1onX;
	Thu, 23 May 2024 11:40:03 +0000
X-UUID: 2d83c03618f911ef82c84f6416ccf2f3-20240523
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=BMiyz5iUdNSJDfbPTHgKO+oOHd+vDD99lj6IHQQx1VY=;
	b=ABRFT+h2WVwPcJH6gSeQKCl9N9j9PDClDi3zsaZiTv5W3VnzbjjH6IHYVK5mZb+FE1EtJpgI69z5r4H4T31DfFbLzBq+9CeR7kpu5jVBWlam1sCXOOh1Mg/+K+0qhZN2k843ZZtyhULHdGTrpGB0SwZO0t9Y0f+uzy6HoBW6XqY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38,REQID:89f3b543-fce2-45be-a508-9c3da2c8b3db,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:82c5f88,CLOUDID:d5972093-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 2d83c03618f911ef82c84f6416ccf2f3-20240523
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <dicken.ding@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1699593063; Thu, 23 May 2024 04:39:56 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 23 May 2024 19:39:51 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 23 May 2024 19:39:51 +0800
From: dicken.ding <dicken.ding@mediatek.com>
To: Thomas Gleixner <tglx@linutronix.de>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <wsd_upstream@mediatek.com>, <hanks.chen@mediatek.com>,
	<ivan.tseng@mediatek.com>, <cheng-jui.wang@mediatek.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, dicken.ding <dicken.ding@mediatek.com>
Subject: [PATCH 1/1] irq: Fix uaf issue in irq_find_at_or_after
Date: Thu, 23 May 2024 19:39:49 +0800
Message-ID: <20240523113949.10444-1-dicken.ding@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10-4.177400-8.000000
X-TMASE-MatchedRID: 2aTVZGXuTB8ff24atxvqbrMjW/sniEQKuoYFb0nRiqNx1e3NhjX9AiX5
	3Srl2nNUxo7ed0Rl0pgsXpgfc4uq3GF9INTZ2jjMSHCU59h5KrGkWoMjFfK3XtSVUkz9BPXe7j8
	sAI9BuGov53aacJHWeJ+Db2Vym711hCZu5goHpcabYgXsVVm7zEJfxXUWJFGS31GU/N5W5BB3Hs
	0YS1IA83Apm8RB2n0t42WC8ffme7UfE8yM4pjsD23U7j2vVURrxEHRux+uk8jQ9TRN0mhS13wZJ
	S/5YqMnXVKv7/WG8TXYQnlb38PjIG0VCOqEk9p23uBhPc05NEF4Zvr17pnQUPueCzBmgUWhUuPw
	TjND/xoICtGLeyfJS46H7DI0GsVcMmI24qiENwrMpIbcl3IoA+q1XYAYw09quxzcuGDedhg=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10-4.177400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: FE9282E63577086F736FFDFCA4986544633F2DCF74F2105A3F1396C83B7110892000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240523_044002_552236_D2B3265C 
X-CRM114-Status: GOOD (  11.59  )
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

The function "irq_find_at_or_after" is at the risk of use-after-free
due to the race condition between the functions "delayer_free_desc"
and "irq_desc_get_irq". The function "delayer_free_desc" could be
called between "mt_find" and "irq_desc_get_irq" due to the absence
of any locks to ensure atomic operations on the "irq_desc" structure.

In this patch, we introduce a pair of locks, namely "rcu_read_lock"
and "rcu_read_unlock" to prevent the occurrence of use-after-free in
"irq_find_at_or_after".

Call trace:
 dump_backtrace+0xec/0x138
 show_stack+0x18/0x24
 dump_stack_lvl+0x50/0x6c
 print_report+0x1b0/0x714
 kasan_report+0xc4/0x124
 __do_kernel_fault+0xc0/0x368
 do_bad_area+0x30/0xdc
 do_tag_check_fault+0x20/0x34
 do_mem_abort+0x58/0x118
 el1_abort+0x3c/0x5c
 el1h_64_sync_handler+0x54/0x90
 el1h_64_sync+0x68/0x6c
 irq_get_next_irq+0x58/0x84
 show_stat+0x638/0x824
 seq_read_iter+0x158/0x4ec
 proc_reg_read_iter+0x94/0x12c
 vfs_read+0x1e0/0x2c8
 __arm64_sys_pread64+0x84/0xcc
 invoke_syscall+0x58/0x114
 el0_svc_common+0x80/0xe0
 do_el0_svc+0x1c/0x28
 el0_svc+0x38/0x68
 el0t_64_sync_handler+0x68/0xbc
 el0t_64_sync+0x1a8/0x1ac

Freed by task 4471:
 kasan_save_stack+0x40/0x70
 save_stack_info+0x34/0x128
 kasan_save_free_info+0x18/0x28
 ____kasan_slab_free+0x254/0x25c
 __kasan_slab_free+0x10/0x20
 slab_free_freelist_hook+0x174/0x1e0
 __kmem_cache_free+0xa4/0x1dc
 kfree+0x64/0x128
 irq_kobj_release+0x28/0x3c
 kobject_put+0xcc/0x1e0
 delayed_free_desc+0x14/0x2c
 rcu_do_batch+0x214/0x720
 rcu_core+0x1b0/0x408
 rcu_core_si+0x10/0x20
 __do_softirq+0x154/0x470

Signed-off-by: dicken.ding <dicken.ding@mediatek.com>
---
 kernel/irq/irqdesc.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/kernel/irq/irqdesc.c b/kernel/irq/irqdesc.c
index 88ac3652fcf2..14124e1bcb03 100644
--- a/kernel/irq/irqdesc.c
+++ b/kernel/irq/irqdesc.c
@@ -160,9 +160,15 @@ static int irq_find_free_area(unsigned int from, unsigned int cnt)
 static unsigned int irq_find_at_or_after(unsigned int offset)
 {
 	unsigned long index = offset;
+	unsigned int irq = nr_irqs;
+
+	rcu_read_lock();
 	struct irq_desc *desc = mt_find(&sparse_irqs, &index, nr_irqs);
+	if (desc)
+		irq = irq_desc_get_irq(desc);
+	rcu_read_unlock();
 
-	return desc ? irq_desc_get_irq(desc) : nr_irqs;
+	return irq;
 }
 
 static void irq_insert_desc(unsigned int irq, struct irq_desc *desc)
-- 
2.18.0


