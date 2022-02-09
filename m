Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78F2FC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Feb 2022 05:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WxpT9CqZKDaOicKDsTYTdmGPn2uwybHO03ELKB6d/Fk=; b=FzcZpr+8rgNwRS
	JTBJNPu2FoHapWrSoKB2WUbRNQqts6OC46cS48HXapt1NQ77cpR72XlILeZ0Wo7dqMO9Xw8xKalXq
	lkFp+u/zzx3lJTbKL7XSc/BmZuru2E55OnGhjfJREpQ+E9IpFXlHwy4bEXE/GVnkGy0mOR3m1L1Wx
	LCSebIPS3Dutsu4dT1fsg+IfoUDOleG3FuLqUjlk32dXqQGNZ5TIu6HAL8Gy2pR/pHbQFQvkuEKdf
	cKEoklTzpjugOdLzXLkj/T3o+6ZLOMY5eqMX+cWKsTbUTTGIRV+YcVlehpyS1yiivKPls6ouMwjXv
	/4z31mN+cd1w+TvN2hMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHfhm-00GH11-Is; Wed, 09 Feb 2022 05:39:50 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHfhZ-00GGz1-9j; Wed, 09 Feb 2022 05:39:39 +0000
X-UUID: ff588645a54b480fb32f154b7cb21efc-20220208
X-UUID: ff588645a54b480fb32f154b7cb21efc-20220208
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <mark-pk.tsai@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1464316650; Tue, 08 Feb 2022 22:39:34 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Feb 2022 21:33:53 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 9 Feb 2022 13:33:52 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 9 Feb 2022 13:33:51 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: <rostedt@goodmis.org>
CC: <matthias.bgg@gmail.com>, <akpm@linux-foundation.org>,
 <mhiramat@kernel.org>, <vbabka@suse.cz>, <ahalaney@redhat.com>,
 <wangkefeng.wang@huawei.com>, <linux@rasmusvillemoes.dk>,
 <keescook@chromium.org>, <mark-pk.tsai@mediatek.com>,
 <valentin.schneider@arm.com>, <peterz@infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <yj.chiang@mediatek.com>
Subject: [PATCH] init: Use ktime_us_delta() to make initcall_debug log more
 precise
Date: Wed, 9 Feb 2022 13:33:50 +0800
Message-ID: <20220209053350.15771-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_213937_367693_C5AD1E2E 
X-CRM114-Status: UNSURE (   9.16  )
X-CRM114-Notice: Please train this message.
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

Use ktime_us_delta() to make the initcall_debug log more precise than
right shifting the result of ktime_to_ns() by 10 bits.

Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
---
 init/main.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/init/main.c b/init/main.c
index 65fa2e41a9c0..c8edcc3029b1 100644
--- a/init/main.c
+++ b/init/main.c
@@ -1246,15 +1246,11 @@ trace_initcall_start_cb(void *data, initcall_t fn)
 static __init_or_module void
 trace_initcall_finish_cb(void *data, initcall_t fn, int ret)
 {
-	ktime_t *calltime = (ktime_t *)data;
-	ktime_t delta, rettime;
-	unsigned long long duration;
+	ktime_t rettime, *calltime = (ktime_t *)data;
 
 	rettime = ktime_get();
-	delta = ktime_sub(rettime, *calltime);
-	duration = (unsigned long long) ktime_to_ns(delta) >> 10;
 	printk(KERN_DEBUG "initcall %pS returned %d after %lld usecs\n",
-		 fn, ret, duration);
+		 fn, ret, (unsigned long long)ktime_us_delta(rettime, *calltime));
 }
 
 static ktime_t initcall_calltime;
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
