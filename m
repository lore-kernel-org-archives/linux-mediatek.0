Return-Path: <SRS0=7Zfj=FT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B452C4361B
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Dec 2020 11:28:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E480222258
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Dec 2020 11:28:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E480222258
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HHlvxoW/YALPaBohina1JDk5d9KBXPgexDwk8ZlYdkM=; b=OulOr+RnOxYfSY4Qf9qj+qqbe+
	OD0GtIilF11koyGtxtyCwM3DyYX534DmxP9Pkl5Kv2mBlS+m6nL5Lp8PXzHdUUWWhA7pPlj+u1eiC
	GEDNXjCJzhowMRY2Om94oOuwlSZqdF4esCsMtBD7/Q6WM8fpQsTTj/sDy99ckgvLR87zE2TWW69US
	6hrzxWPRq8zcPvSTXmNvFZuby5KtTiFDz8ByCfvqcBkCGVuBcH4+oy9mlYqqAETJmusJBkQyCtBeZ
	VZ0unClp8rdCgVKRdnvjLNzsvfB4fHYnurtlLcZMAtqL1t8l7YaUeCzUhBYbUt8JhHi/G6H+VGdzr
	M9zY0czg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kp8VK-0006tP-0U; Tue, 15 Dec 2020 11:28:30 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kp8VA-0006qI-8D; Tue, 15 Dec 2020 11:28:23 +0000
X-UUID: a918d65a2f094b66b9f1392aa9facb9a-20201215
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=bfIeikpAxjjt8PO85IRPswLapZKK9B9YH8haFxKTcgQ=; 
 b=jNQO+b/o7XLQwOCehDS4llFLTS9H610lOGSJ/MaAB2+IeVlgAoGnz7yEhqpwKY9g0bpNbAARywgnJWsRlobtDUtS2GGq7SMcVhK5lxucdCfJfgXqFf/hONH6tTzfIxW8t1sTD2jMML1/srXmoRJgkUGT1Hj8aszrx9fzA6zqHn8=;
X-UUID: a918d65a2f094b66b9f1392aa9facb9a-20201215
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <kuan-ying.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2016893366; Tue, 15 Dec 2020 03:28:15 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Dec 2020 03:28:13 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Dec 2020 19:28:05 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 15 Dec 2020 19:28:06 +0800
From: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
To: Andrey Ryabinin <aryabinin@virtuozzo.com>, Alexander Potapenko
 <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, Andrew Morton
 <akpm@linux-foundation.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 0/1] kasan: fix memory leak of kasan quarantine
Date: Tue, 15 Dec 2020 19:28:02 +0800
Message-ID: <1608031683-24967-1-git-send-email-Kuan-Ying.Lee@mediatek.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-TM-SNTS-SMTP: CEAC96A1271FBFF82137D5C0B6036E94D5C347EC715C678B73A9F1D58F9F14102000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201215_062820_480988_846261E7 
X-CRM114-Status: UNSURE (   8.22  )
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

Kuan-Ying Lee (1):
  kasan: fix memory leak of kasan quarantine

 mm/kasan/quarantine.c | 1 +
 1 file changed, 1 insertion(+)

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
