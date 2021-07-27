Return-Path: <SRS0=KH1D=MT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 199EDC4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 04:03:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA31F60F51
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 04:03:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DA31F60F51
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jCborVvlHrNo4k0s+X/OJ8f0ZWyGi7U6NF3RN0cU0tQ=; b=eAmWPsfOjxc0iQ
	5v8KC6P2P3r8b8U31iNON3fZHDQqFNMvQDZzCvh3A2CAyj79rKzVBj4YONJUJV7Ko38MFdia1fzjO
	QiQGpYXTeDB3UBNSQSjtA9Z4D3TlizjsmtGWaiU0rvpl14/C5nQTHNnbKwM1lRmrwVTK6dzt3caEE
	WY6wGo8r27Y9AU6g4dAHtYHKa7ptgyWXAsQzCYO3fPg7D21NluPSnrwtp3Cq58ebkIvVT4S/CxlGT
	hKQIoiHGBWmawMkK1L++EKIEt36lxOSuIIit06OA1Di8cqljy5KuNfS0Ul6q7tif8KOInS8DYc9Bj
	CKUyIfvuZV6mE7CcqdCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8EIx-00D6V1-2Y; Tue, 27 Jul 2021 04:02:55 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8EIu-00D6UM-7J; Tue, 27 Jul 2021 04:02:53 +0000
X-UUID: 7706bdad2a25469b8877707134244d39-20210726
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=8euonuqJZE1tiELx9PT+VVuAswWdfNvySMSjppEjCAU=; 
 b=PnoNsp4+W/0SXlNaPP8O5xnSJweZUjBIQY9i0NGVlc3zHe71li6Nq7BQ/MSleWRMHHWSp2+CD6cu47B4/ifsE8XyQcPJzgCLvKctJnPQ/4pljEnZiJN2gr25/sPcc1AIBi4IFh9fhXyZvFaQYZaipElHooi/PZFJdb0ngk3fiEY=;
X-UUID: 7706bdad2a25469b8877707134244d39-20210726
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <kuan-ying.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 829512817; Mon, 26 Jul 2021 21:02:50 -0700
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 26 Jul 2021 21:00:42 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 27 Jul 2021 12:00:40 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 27 Jul 2021 12:00:40 +0800
From: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
To: Nicholas Tang <nicholas.tang@mediatek.com>, Andrew Yang
 <andrew.yang@mediatek.com>, Andrey Konovalov <andreyknvl@gmail.com>, "Andrey
 Ryabinin" <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>,
 Marco Elver <elver@google.com>, Chinwen Chang <chinwen.chang@mediatek.com>,
 Andrew Morton <akpm@linux-foundation.org>
CC: <kasan-dev@googlegroups.com>, <linux-mm@kvack.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, Kuan-Ying Lee
 <Kuan-Ying.Lee@mediatek.com>
Subject: [PATCH 0/2] kasan, mm: reset tag when access metadata
Date: Tue, 27 Jul 2021 12:00:19 +0800
Message-ID: <20210727040021.21371-1-Kuan-Ying.Lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_210252_313992_CBC7F9CA 
X-CRM114-Status: UNSURE (   8.13  )
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

With hardware tag-based kasan enabled, we reset the tag
when we access metadata to avoid from false alarm.

Kuan-Ying Lee (2):
  kasan, mm: reset tag when access metadata
  kasan, mm: reset tag for hex dump address

 mm/kmemleak.c | 6 +++---
 mm/slub.c     | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
