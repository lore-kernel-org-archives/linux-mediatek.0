Return-Path: <SRS0=UlKT=LY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C279C11F65
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 14:09:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A49261418
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 14:09:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A49261418
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=W2GMD0oua/EwKzubWRABpvJAF8kjdwFZ6MKbJ3LhE70=; b=saVAvRaThXrEDK
	sdsI28PcS1ZcTMcPPpsLCtFdnMmKN+4KlNOnf9OGTRji3JqltMNAW7w0Sj+KqNQh6QtU4uTUfSLKT
	09XR0fSpCYTOBY/Pnro5Gb4Ob5q++SJ4jaWQV5stSMLqDz74r8RFU5Onv9EYvMdYcRZLO/n+yBUTO
	ffZbtqGGl4u1dY2X+xGAAToEnUQaBBXlEfLfBGqSO1tQGsBLsfs1oEUpUxeS2Xtcq3GrpjL9cVwP9
	rVRlBq9LubyByuFnGHAx0ytC0c5YnhJNx7XH6ED4QLu2hp6Y+M40lDKR2XRSWZXzHJ+sIiMhG6PGt
	GqWSNxWZBGksqG/0wAaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyatc-00EHaa-C4; Wed, 30 Jun 2021 14:08:56 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyabB-00EB0G-5v; Wed, 30 Jun 2021 13:49:55 +0000
X-UUID: 20ced371e7fc481194a8baa2a62418bf-20210630
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=W70Y9lwv0TdA82sz8YzsU10LJt1952GQdkqNXoV60oM=; 
 b=QU2z60BmCF5eD8NovCUSvh1LXhJQEAVQB9/daiLONgSzxBEvRTFWLiUxQRfqeL/0FrW299DkjzJY61nP0s+WcEbH2b34R95A65PACtHyWT7Ok7Ekwsm6UA6sTtmMiARt4cmi29NggPjh9YyR8PJic5+GjBhX0oLsKjVYh7VuKEw=;
X-UUID: 20ced371e7fc481194a8baa2a62418bf-20210630
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <yee.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1171529055; Wed, 30 Jun 2021 06:49:48 -0700
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Jun 2021 06:49:47 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Jun 2021 21:49:45 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 30 Jun 2021 21:49:45 +0800
From: <yee.lee@mediatek.com>
To: <andreyknvl@gmail.com>
CC: <wsd_upstream@mediatek.com>, Yee Lee <yee.lee@mediatek.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>
Subject: [PATCH v3 0/1] kasan: fix redzone overwritten issue under SLUB debug
Date: Wed, 30 Jun 2021 21:49:39 +0800
Message-ID: <20210630134943.20781-1-yee.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210630_064953_267605_D2098301 
X-CRM114-Status: UNSURE (   9.42  )
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

From: Yee Lee <yee.lee@mediatek.com>

Issue: In SLUB debug, hwtag kasan_unpoison() would overwrite the redzone
 in those objects with unaligned size.

This patch Adds memzero_explict() to separate the initialization for
such condition. The new code path is executed about 1.1% during nromal
booting process. The penalty is acceptable since it only works in debug mode.


=============
Exp: QEMUv5.2(+mte)/SLUB_debug mode
code path exec : 941/80854 (1.1%)
---
Changed since v2:
 - Use if-statement to refine the condition block instead of preprocessor #if
 - Add comment block about this new code path in source code.

---
Changed since v1:
 - Apply IS_ENABLED to wrap codes under SLUB debug mode.
 - Replace memset() by memzero_explict().

---

Yee Lee (1):
  kasan: Add memzero init for unaligned size under SLUB debug

 mm/kasan/kasan.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
