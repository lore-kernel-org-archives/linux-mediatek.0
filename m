Return-Path: <SRS0=e3uk=FV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0575C2BB40
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Dec 2020 12:18:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77627206D5
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Dec 2020 12:18:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 77627206D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=E40XfTDYsAuJ5sDTmCg8/hbcwSi2xM1/hvDYw80XUXw=; b=FYvxvEz+yqzmKeZz2E5coZUJB
	Dtv5ZgIlDmRmi9zqegOBbal+EKet+A9dlLJsRxJU3CXTsVC8PvErdibOvwLaA8PYcpfZTZVy8MvLz
	uldg1dYVC5yRYFzEu3uoJYRRYYx58KtMO5oXS73YURKs760q94Dgi/QO1NGoQu3kPWFBekddeeUMz
	OJ95d+epLSTvGxNFzbc5GlbKA5o/9f74FIKRgcm+pEcqTIXsq5BTmH5v5MaVoqei6f4rprd4ekj7j
	5XMOP6+mHsEu+KwRVgPSlq7kQ3mbIeEp4S8tcBhiknQB1YBN2eslMJ2boc632cNzJRCB5zqLpCYb9
	c7oI56p7A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpsF1-00052S-91; Thu, 17 Dec 2020 12:18:43 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpsEs-0004zU-RR; Thu, 17 Dec 2020 12:18:36 +0000
X-UUID: 698e8d0045b747dd81dd57b65d878bc8-20201217
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=fWc03B9XOOk2+KXP17jTgBlOUejZGUWa86JmAuFP4dk=; 
 b=ieGZKT4lfno1xaLaj6NGqThWhJpKbN1Yen8xAswF770d4ltitqJXMhOHHN8z1TpQBZnjLjPSwplMFaS4xKZU9totsF+oJy6BShBezn7zw3Sm/Oj2sdnmHX15Z0l9NhZtXA6QQE2ho+Nbr1MePVSZM8EQZRPE89yauj8obRFm1eo=;
X-UUID: 698e8d0045b747dd81dd57b65d878bc8-20201217
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <kuan-ying.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 663912482; Thu, 17 Dec 2020 04:18:27 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Dec 2020 04:18:25 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Dec 2020 20:18:23 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 17 Dec 2020 20:18:24 +0800
From: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
To: Andrey Ryabinin <aryabinin@virtuozzo.com>, Alexander Potapenko
 <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, Andrew Morton
 <akpm@linux-foundation.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2 1/1] kasan: fix memory leak of kasan quarantine
Date: Thu, 17 Dec 2020 20:18:07 +0800
Message-ID: <1608207487-30537-2-git-send-email-Kuan-Ying.Lee@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1608207487-30537-1-git-send-email-Kuan-Ying.Lee@mediatek.com>
References: <1608207487-30537-1-git-send-email-Kuan-Ying.Lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201217_071835_074357_B2BA9DBB 
X-CRM114-Status: GOOD (  12.23  )
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
Cc: wsd_upstream@mediatek.com, Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org,
 linux-mediatek@lists.infradead.org, stable@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

When cpu is going offline, set q->offline as true
and interrupt happened. The interrupt may call the
quarantine_put. But quarantine_put do not free the
the object. The object will cause memory leak.

Add qlink_free() to free the object.

Fixes: 6c82d45c7f03 (kasan: fix object remaining in offline per-cpu quarantine)
Signed-off-by: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>
Cc: Alexander Potapenko <glider@google.com>
Cc: Dmitry Vyukov <dvyukov@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: <stable@vger.kernel.org>    [5.10-]
---
 mm/kasan/quarantine.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/kasan/quarantine.c b/mm/kasan/quarantine.c
index 0e3f8494628f..cac7c617df72 100644
--- a/mm/kasan/quarantine.c
+++ b/mm/kasan/quarantine.c
@@ -191,6 +191,7 @@ void quarantine_put(struct kasan_free_meta *info, struct kmem_cache *cache)
 
 	q = this_cpu_ptr(&cpu_quarantine);
 	if (q->offline) {
+		qlink_free(&info->quarantine_link, cache);
 		local_irq_restore(flags);
 		return;
 	}
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
