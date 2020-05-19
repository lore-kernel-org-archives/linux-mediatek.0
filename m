Return-Path: <SRS0=0J5R=7B=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 330A8C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 May 2020 02:26:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0347D20708
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 May 2020 02:26:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mE4jnS50";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="QWOlKfMl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0347D20708
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zGnBgnYgtPuyxt1+UtAGBPV7WGyGNsGBDC34dzI4dQ8=; b=mE4jnS5099RZoT
	wqum0hz5tomKOQshhi3CWlDOBVzXOyBN4dWHqhXKXb9T5MkrXXs+aNuEJstFy7MOYcgE8mvlj7+ql
	27dQhSBFbMnC7Qlk6pw7rw2wQTaPNRgyP+pgClUdaH9NHUCQDDTIDxs5jg733kcwrlJr3SrOSf7pT
	J4dE8cnOeSftP0B/DBzLBOm03VIquNFErZRvvTGLkZYGSuW+6TrkXgB6jDn9rN1MjY6uh1Sduzvsn
	CyITs3L8goCCiizMpAp0BicKchD3aDbQnVvvHTAKff4A8oNtA8btcbUhCKuvs8eq7YTQX25yipgH/
	ITcws1AWyzfCojgdzHlQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jarxV-0006JX-RB; Tue, 19 May 2020 02:26:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jarxL-00066n-4g; Tue, 19 May 2020 02:26:12 +0000
X-UUID: a32596d3a0f94a4eae9a216248e01b33-20200518
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=DbdlJu8vuZUyyQAeAhd6YD50kjTkWp9bEKvDh4VAu5A=; 
 b=QWOlKfMlUH16nT0i1nVifyu0DxyJoU/oUDAkVqfhb0J/oNokWFp2N57U8FhxifApqXBSzZ5H9O5giGPbOm6wAP1P5p2dBScAqlMXbouk3/abNSo76RQXLg2Op2NsHYO9f9abu8PZkowBjOszkoRgXr7UDAL/Eqmi2lNIovKn6tk=;
X-UUID: a32596d3a0f94a4eae9a216248e01b33-20200518
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <walter-zh.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1644115942; Mon, 18 May 2020 18:26:10 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 18 May 2020 19:26:06 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 19 May 2020 10:26:03 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 19 May 2020 10:26:03 +0800
From: Walter Wu <walter-zh.wu@mediatek.com>
To: Andrey Ryabinin <aryabinin@virtuozzo.com>, Alexander Potapenko
 <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, Matthias Brugger
 <matthias.bgg@gmail.com>
Subject: [PATCH v4 3/4] kasan: add tests for call_rcu stack recording
Date: Tue, 19 May 2020 10:26:03 +0800
Message-ID: <20200519022603.24251-1-walter-zh.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200518_192611_187318_BF449B4D 
X-CRM114-Status: UNSURE (   9.01  )
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
Cc: Walter Wu <walter-zh.wu@mediatek.com>,
 wsd_upstream <wsd_upstream@mediatek.com>, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-mm@kvack.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Test call_rcu() call stack recording and verify whether it correctly
is printed in KASAN report.

Signed-off-by: Walter Wu <walter-zh.wu@mediatek.com>
Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>
Cc: Dmitry Vyukov <dvyukov@google.com>
Cc: Alexander Potapenko <glider@google.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
---
 lib/test_kasan.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/lib/test_kasan.c b/lib/test_kasan.c
index e3087d90e00d..6e5fb05d42d8 100644
--- a/lib/test_kasan.c
+++ b/lib/test_kasan.c
@@ -792,6 +792,35 @@ static noinline void __init vmalloc_oob(void)
 static void __init vmalloc_oob(void) {}
 #endif
 
+static struct kasan_rcu_info {
+	int i;
+	struct rcu_head rcu;
+} *global_ptr;
+
+static noinline void __init kasan_rcu_reclaim(struct rcu_head *rp)
+{
+	struct kasan_rcu_info *fp = container_of(rp,
+						struct kasan_rcu_info, rcu);
+
+	kfree(fp);
+	fp->i = 1;
+}
+
+static noinline void __init kasan_rcu_uaf(void)
+{
+	struct kasan_rcu_info *ptr;
+
+	pr_info("use-after-free in kasan_rcu_reclaim\n");
+	ptr = kmalloc(sizeof(struct kasan_rcu_info), GFP_KERNEL);
+	if (!ptr) {
+		pr_err("Allocation failed\n");
+		return;
+	}
+
+	global_ptr = rcu_dereference_protected(ptr, NULL);
+	call_rcu(&global_ptr->rcu, kasan_rcu_reclaim);
+}
+
 static int __init kmalloc_tests_init(void)
 {
 	/*
@@ -839,6 +868,7 @@ static int __init kmalloc_tests_init(void)
 	kasan_bitops();
 	kmalloc_double_kzfree();
 	vmalloc_oob();
+	kasan_rcu_uaf();
 
 	kasan_restore_multi_shot(multishot);
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
