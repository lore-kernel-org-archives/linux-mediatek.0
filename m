Return-Path: <SRS0=SDo2=LO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA992C48BDF
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Jun 2021 11:48:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96B8A60D07
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Jun 2021 11:48:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96B8A60D07
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GKRHpY5BqndX4xBuOGkO1MYwAI7JeuaXBmf49l25Z70=; b=w2qSU4ABHMwQP0
	PSDX7ZaF9M9LAT4dBBuGU2sDjhdI17AGjl/6/t+F570ojKOVfPxJsB+hj/RYN1yihHPD08S4uoe9y
	jXJaJ0wlYWAVW4WaQfpxY1dETcjiVb0zQiyqLalxV4zu8DrRiOgyRjdQ6eCcaF2NpK7X/fP8UWfQk
	eUA9YSliuyXBSXmyl3lQsE6YIfLMxTvywtHBStz7TJqnqdPtx50HkWjva8GzzAjFVdwwryT5pp3D3
	+mp3Dcuh7X9H609qT4TrO8Zs99Y4yi9G7kPZvEZxKqm9Zm41pgT2Uhe6j6vw2vzK3DDq6Pz48wdPf
	R8jPuUTlCPH29IM1Sfuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luvw8-000urO-9T; Sun, 20 Jun 2021 11:48:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1luvvu-000up1-NR; Sun, 20 Jun 2021 11:48:12 +0000
X-UUID: def884c0432049bba1c839676a756574-20210620
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=HR9tr4otcAuAOmU4tJAa0TvZFnThgQGC6FsBcWAxVfE=; 
 b=qgwo3SOyPDDNSajlSYRWkExynROgFA3EtDJkafWjKcy04ef5dSLNvGjWx4llw7LYATPaIrImicmLSaEGbrXceIsbjhKZ5RBfnv7vgg7gIYqnPTtL1gJ+r7zcWXWO2IyGCu6XzrVFaLAQMdcBmeQx6QYDnyIhKRdUvjOK0p/AiDE=;
X-UUID: def884c0432049bba1c839676a756574-20210620
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <kuan-ying.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1579966736; Sun, 20 Jun 2021 04:48:08 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 20 Jun 2021 04:48:06 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 20 Jun 2021 19:48:05 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sun, 20 Jun 2021 19:48:05 +0800
From: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
To: Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko
 <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, Marco Elver
 <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, Andrew Morton
 <akpm@linux-foundation.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: <kasan-dev@googlegroups.com>, <linux-kernel@vger.kernel.org>,
 <linux-mm@kvack.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <wsd_upstream@mediatek.com>,
 <chinwen.chang@mediatek.com>, <nicholas.tang@mediatek.com>, Kuan-Ying Lee
 <Kuan-Ying.Lee@mediatek.com>
Subject: [PATCH v3 0/3] kasan: add memory corruption identification support
 for hw tag-based kasan
Date: Sun, 20 Jun 2021 19:47:53 +0800
Message-ID: <20210620114756.31304-1-Kuan-Ying.Lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210620_044810_816803_FEA41392 
X-CRM114-Status: UNSURE (   8.65  )
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

Add memory corruption identification for hardware tag-based KASAN mode.

Changes since v3:
 - Preserve Copyright from hw_tags.c/sw_tags.c and
   report_sw_tags.c/report_hw_tags.c
 - Make non-trivial change in kasan sw tag-based mode

Changes since v2:
 - Thanks for Marco's Suggestion
 - Rename the CONFIG_KASAN_SW_TAGS_IDENTIFY
 - Integrate tag-based kasan common part
 - Rebase to latest linux-next

Kuan-Ying Lee (3):
  kasan: rename CONFIG_KASAN_SW_TAGS_IDENTIFY to
    CONFIG_KASAN_TAGS_IDENTIFY
  kasan: integrate the common part of two KASAN tag-based modes
  kasan: add memory corruption identification support for hardware
    tag-based mode

 lib/Kconfig.kasan         |  4 +--
 mm/kasan/Makefile         |  4 +--
 mm/kasan/hw_tags.c        | 22 ---------------
 mm/kasan/kasan.h          |  4 +--
 mm/kasan/report_hw_tags.c |  6 +---
 mm/kasan/report_sw_tags.c | 46 +-----------------------------
 mm/kasan/report_tags.h    | 55 ++++++++++++++++++++++++++++++++++++
 mm/kasan/sw_tags.c        | 41 ---------------------------
 mm/kasan/tags.c           | 59 +++++++++++++++++++++++++++++++++++++++
 9 files changed, 122 insertions(+), 119 deletions(-)
 create mode 100644 mm/kasan/report_tags.h
 create mode 100644 mm/kasan/tags.c

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
