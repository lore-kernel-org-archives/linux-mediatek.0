Return-Path: <SRS0=7UDR=CC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A549C433E3
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Aug 2020 08:14:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA0672075B
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Aug 2020 08:14:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yvaq55PT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="rA/byCzr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA0672075B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FsPSUAPtQCcDaazrZWjfIktr1OTxf3B9a9U3ZbtF5bk=; b=yvaq55PT+e/ocPr5mZxeduZABS
	/MePuOqLeqfbcZG+p2N+H28sW8So0YdIwhcdVhyxZgshJevfn8268Hy2zhm8Eds+gG1JRZyejrlMh
	drFwyArR1/aXRTf+ExTFGCKoD8xEFNCrt2aOZtmbZChfSlQWdkImkEs8PPE1XuJdGZ1Zz65yZdrtu
	8kMP6GOVB02HufKrK+x/bTyoInvNlCg7ZtHB4ZrsX7Sv77xYTTsxnQ+gptLYdXxhNVFdMyk8P2w+m
	drFVrrB3IoQa/pyH/Gn1g9zqaeVlfD4WkUzuYZtcPgFPAZ+98nfIrU4nDN+61d/p/H0LVJ+QamMiR
	Fd80nEFA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kA7ce-0004F4-Sb; Mon, 24 Aug 2020 08:14:32 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kA7cW-0004C4-A2; Mon, 24 Aug 2020 08:14:25 +0000
X-UUID: 11e98ddd1688435e8e11c71b931d1b08-20200824
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=epF31PMWeocflqrG14ZTfXrn/tbNID2roIzjg+E6Ras=; 
 b=rA/byCzrHWm2LRJdWHSOwDe0afU8MzZkAN2l1L4fJRqvdg8axYzDTPBZGPRGXFqQ2gxnvqVvLL7ejE9UEUuJrbWPDRYQzDLO87wizm1tmaGAD564UWPi961UjNISRkhbXeXGOUNXjiN5qy+WtOkL4BHFGX6OsfqtglamYSD6G/4=;
X-UUID: 11e98ddd1688435e8e11c71b931d1b08-20200824
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <walter-zh.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 639525183; Mon, 24 Aug 2020 00:14:19 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 24 Aug 2020 01:13:15 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 24 Aug 2020 16:13:13 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 24 Aug 2020 16:13:13 +0800
From: Walter Wu <walter-zh.wu@mediatek.com>
To: Andrey Ryabinin <aryabinin@virtuozzo.com>, Alexander Potapenko
 <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, Matthias Brugger
 <matthias.bgg@gmail.com>
Subject: [PATCH v2 4/6] kasan: add tests for timer stack recording
Date: Mon, 24 Aug 2020 16:13:12 +0800
Message-ID: <20200824081312.24972-1-walter-zh.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_041424_544703_98A69229 
X-CRM114-Status: GOOD (  12.94  )
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
 wsd_upstream <wsd_upstream@mediatek.com>,
 Andrey Konovalov <andreyknvl@google.com>, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-mm@kvack.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Adds a test to verify timer stack recording and print it
in KASAN report.

The KASAN report was as follows(cleaned up slightly):

 BUG: KASAN: use-after-free in kasan_timer_uaf
 
 Freed by task 0:
  kasan_save_stack+0x24/0x50
  kasan_set_track+0x24/0x38
  kasan_set_free_info+0x20/0x40
  __kasan_slab_free+0x10c/0x170
  kasan_slab_free+0x10/0x18
  kfree+0x98/0x270
  kasan_timer_function+0x1c/0x28
 
 Last potentially related work creation:
  kasan_save_stack+0x24/0x50
  kasan_record_tmr_stack+0xa8/0xb8
  init_timer_key+0xf0/0x248
  kasan_timer_uaf+0x5c/0xd8

Signed-off-by: Walter Wu <walter-zh.wu@mediatek.com>
Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>
Cc: Dmitry Vyukov <dvyukov@google.com>
Cc: Alexander Potapenko <glider@google.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Andrey Konovalov <andreyknvl@google.com>
---
 lib/test_kasan.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/lib/test_kasan.c b/lib/test_kasan.c
index 6e5fb05d42d8..2bd61674c7a3 100644
--- a/lib/test_kasan.c
+++ b/lib/test_kasan.c
@@ -821,6 +821,30 @@ static noinline void __init kasan_rcu_uaf(void)
 	call_rcu(&global_ptr->rcu, kasan_rcu_reclaim);
 }
 
+static noinline void __init kasan_timer_function(struct timer_list *timer)
+{
+	del_timer(timer);
+	kfree(timer);
+}
+
+static noinline void __init kasan_timer_uaf(void)
+{
+	struct timer_list *timer;
+
+	timer = kmalloc(sizeof(struct timer_list), GFP_KERNEL);
+	if (!timer) {
+		pr_err("Allocation failed\n");
+		return;
+	}
+
+	timer_setup(timer, kasan_timer_function, 0);
+	add_timer(timer);
+	msleep(100);
+
+	pr_info("use-after-free on timer\n");
+	((volatile struct timer_list *)timer)->expires;
+}
+
 static int __init kmalloc_tests_init(void)
 {
 	/*
@@ -869,6 +893,7 @@ static int __init kmalloc_tests_init(void)
 	kmalloc_double_kzfree();
 	vmalloc_oob();
 	kasan_rcu_uaf();
+	kasan_timer_uaf();
 
 	kasan_restore_multi_shot(multishot);
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
