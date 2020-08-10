Return-Path: <SRS0=/jeW=BU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6BD1C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Aug 2020 07:37:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A44632073A
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Aug 2020 07:37:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JE0ZDPnL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="E71a/yQY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A44632073A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yFpH0h0+t/CnVxuXNHfrZWfhM/CvvdEXaYiTnpi7otM=; b=JE0ZDPnL2kYM2PbP2XRsscgM2+
	iXy159GC7Kr9nk1yON/xkkp7gayQpJwloJtGX5cSZReSo3x3UbYdPNrsFEphTQXAoQlWN9l/FkuiQ
	FhFmkRIQ8o4XdVJdiadriF6IcPe+Sr9iqmpu25dYbpsCj8sgQAqU0z62i2Hlq0p3wvlZEG0xQQdT/
	PJlaJufM+qjeuIUmjQoVb5IethEt6UmsGFeWwQp8V5ZBSB6auVhnagbPksjOuzTO9hhGc+jcJJIt6
	L6tnzdX86MXAniu1VPUjNDEJCV/PTL4G0lyE3VVUwNCFHwUTfwxy6m0LlAM5C+VFawHCmQBwOtgER
	11WA0P7Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k52N1-0006Bx-D3; Mon, 10 Aug 2020 07:37:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k52Mu-000696-TO; Mon, 10 Aug 2020 07:37:18 +0000
X-UUID: 12ef027733d04e66881991cffd213251-20200809
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=jm5/2VLDnPvpsF4CTFjMyvNKvdSPsuQ1Vi/sP3a85vU=; 
 b=E71a/yQY3qtyRP5dzROkjRwN7WQdPs8t6K1K9fYtV2zFKtv4TCB0lRleLiJq2534KAfRL+mscEtelg0No7xbg4eb730kvYOA2pkqWu7olLSt4+MWc4HOJEmsoAh3qu5Z3XwZ3m7CJXgP6wvquovtIxH5KhQdgN7uM2YPins+aG4=;
X-UUID: 12ef027733d04e66881991cffd213251-20200809
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <walter-zh.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 630333848; Sun, 09 Aug 2020 23:37:10 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 10 Aug 2020 00:27:11 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 10 Aug 2020 15:27:09 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 10 Aug 2020 15:27:09 +0800
From: Walter Wu <walter-zh.wu@mediatek.com>
To: Andrey Ryabinin <aryabinin@virtuozzo.com>, Alexander Potapenko
 <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, Matthias Brugger
 <matthias.bgg@gmail.com>
Subject: [PATCH 4/5] lib/test_kasan.c: add workqueue test case
Date: Mon, 10 Aug 2020 15:27:09 +0800
Message-ID: <20200810072709.827-1-walter-zh.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200810_033717_138653_0B9FFC62 
X-CRM114-Status: GOOD (  12.68  )
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
Cc: Walter Wu <walter-zh.wu@mediatek.com>,
 wsd_upstream <wsd_upstream@mediatek.com>, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-mm@kvack.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Adds a test case to verify workqueue stack recording
and print the last workqueue stack in KASAN report.

The KASAN report was as follows(cleaned up slightly):

 BUG: KASAN: use-after-free in kasan_workqueue_uaf

 Freed by task 54:
  kasan_save_stack+0x24/0x50
  kasan_set_track+0x24/0x38
  kasan_set_free_info+0x20/0x40
  __kasan_slab_free+0x10c/0x170
  kasan_slab_free+0x10/0x18
  kfree+0x98/0x270
  kasan_workqueue_work+0xc/0x18

 Last workqueue stack:
  kasan_save_stack+0x24/0x50
  kasan_record_wq_stack+0xa8/0xb8
  insert_work+0x48/0x288
  __queue_work+0x3e8/0xc40
  queue_work_on+0xf4/0x118
  kasan_workqueue_uaf+0xfc/0x190

Signed-off-by: Walter Wu <walter-zh.wu@mediatek.com>
Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>
Cc: Dmitry Vyukov <dvyukov@google.com>
Cc: Alexander Potapenko <glider@google.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
---
 lib/test_kasan.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/lib/test_kasan.c b/lib/test_kasan.c
index c3c6e22ec959..2c6c20cd154b 100644
--- a/lib/test_kasan.c
+++ b/lib/test_kasan.c
@@ -869,6 +869,35 @@ static noinline void __init kasan_timer_uaf(void)
 	((volatile struct timer_list *)timer)->expires;
 }
 
+static noinline void __init kasan_workqueue_work(struct work_struct *work)
+{
+	kfree(work);
+}
+
+static noinline void __init kasan_workqueue_uaf(void)
+{
+	struct workqueue_struct *workqueue;
+	struct work_struct *work;
+
+	workqueue = create_workqueue("kasan_wq_test");
+	if (!workqueue) {
+		pr_err("Allocation failed\n");
+		return;
+	}
+	work = kmalloc(sizeof(struct work_struct), GFP_KERNEL);
+	if (!work) {
+		pr_err("Allocation failed\n");
+		return;
+	}
+
+	INIT_WORK(work, kasan_workqueue_work);
+	queue_work(workqueue, work);
+	destroy_workqueue(workqueue);
+
+	pr_info("use-after-free on workqueue\n");
+	((volatile struct work_struct *)work)->data;
+}
+
 static int __init kmalloc_tests_init(void)
 {
 	/*
@@ -918,6 +947,7 @@ static int __init kmalloc_tests_init(void)
 	vmalloc_oob();
 	kasan_rcu_uaf();
 	kasan_timer_uaf();
+	kasan_workqueue_uaf();
 
 	kasan_restore_multi_shot(multishot);
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
