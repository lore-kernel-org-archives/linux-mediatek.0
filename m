Return-Path: <SRS0=XU5C=LU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2130AC49EA7
	for <linux-mediatek@archiver.kernel.org>; Sat, 26 Jun 2021 10:10:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E009661920
	for <linux-mediatek@archiver.kernel.org>; Sat, 26 Jun 2021 10:10:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E009661920
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0RLgV93nXpe7XpUAymskHd2Bc88sUwis9qwPHqOokwQ=; b=tbX97eBOqrP6yH
	4Qmp7tlnhPuFBkmV6C8JS9bYHMNIJkK9cjKxWOjuGpWafbWiDhn+JnJrW3P0fYh0GpK499ifaPjf+
	8zTtbwhLSn+4MLTHVm9h+oRO20N1gC499KSDZn04Dryffm7EQxlur7h6I90dghqk+BniujZvSQD2o
	pNHxS1vConZX0LbHAVg0tKAN3mUs6EDnDJSumeHnOB67ijHOIZtJDCQMfA9i9bVH1yltRLgMmlHhz
	TO7ccxlw7dss2l/gp5reJOVuBmy+veNbPbxfTqXKboiwFUL9vJAR7hJ8g6EFdVap7vDYjvSEjVGpP
	d02Zexf/d5RRZ7x+jMdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lx5GM-003pOI-Su; Sat, 26 Jun 2021 10:10:10 +0000
Received: from [216.200.240.185] (helo=mailgw02.mediatek.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lx5Fx-003pIh-I9; Sat, 26 Jun 2021 10:09:48 +0000
X-UUID: b1fde24c1fd64ae682fbe79aa52718ba-20210626
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=x8BTyACVehC4YC0R7Ee40AY/tvOvCQKq8/1wf23Ro8w=; 
 b=OvpMYwkaW/mbusjKscIyq1jjvKTSLOHMxwybf196Favdhx5Lb3IWJpMKiVTvxmAhy6IixcD/FeWcPZj0bzV3+5tDVMwdji/pEYl/8wNBzGKeKpc1eTf/0Rd/CMGri5gYtZLi7REe+O6YzGr+VYiOUyaSZJxwZspbGGlyU/Qm6Yc=;
X-UUID: b1fde24c1fd64ae682fbe79aa52718ba-20210626
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <kuan-ying.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 793065210; Sat, 26 Jun 2021 03:09:37 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 26 Jun 2021 03:09:35 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 26 Jun 2021 18:09:33 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 26 Jun 2021 18:09:33 +0800
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
Subject: [PATCH v4 0/3] kasan: add memory corruption identification support
 for hw tag-based kasan
Date: Sat, 26 Jun 2021 18:09:28 +0800
Message-ID: <20210626100931.22794-1-Kuan-Ying.Lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210626_030947_071130_869D4340 
X-CRM114-Status: GOOD (  10.75  )
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

Changes since v4:
 - Change report_tags.h to report_tags.c
 - Refine the commit message
 - Test lib/test_kasan module with SW_TAGS mode
 - Test lib/test_kasan module with HW_TAGS mode
 - Rebase to latest linux-next

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
 mm/kasan/report_hw_tags.c |  5 ----
 mm/kasan/report_sw_tags.c | 43 ----------------------------
 mm/kasan/report_tags.c    | 51 +++++++++++++++++++++++++++++++++
 mm/kasan/sw_tags.c        | 41 ---------------------------
 mm/kasan/tags.c           | 59 +++++++++++++++++++++++++++++++++++++++
 9 files changed, 116 insertions(+), 117 deletions(-)
 create mode 100644 mm/kasan/report_tags.c
 create mode 100644 mm/kasan/tags.c

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
