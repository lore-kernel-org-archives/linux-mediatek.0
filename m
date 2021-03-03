Return-Path: <SRS0=dK9R=IB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03B58C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Mar 2021 20:01:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3032B60240
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Mar 2021 20:01:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3032B60240
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rbtobf/rsWwYy2MvbUdNBzknZBZ4F3oIujR++0FB7Eg=; b=S72vsrw8HFHZO7ifZH8ZeOfktp
	rej3TXlvmAjyQsnHPZvriQ574zwmCS4SCOu8hPKeBeqsw7I4ckZcVisF7QNvoEmqFCs9qr2eWdoEw
	bN6bpf2fmFSqmTZRucjwBIEwDhPfdS6a9rNZvacFXEZZISlB63C1f8+I/aCbpO0WOnAkc1WTn8Dgk
	RMxk+z43fAe7ql4Iy7z2/W2jtFUV8FKQvHuSpFUbn2ods2qRbnmGDa7JIt2amgQWRiHuTlM6pbLjb
	7JjkLa+IIrEDbHfO1TVw+jjJ9XZFXM8QCi7fdxEOlSvFE4vE3OCoZtODWSxNUhha/JfRkHJKifOyz
	1f0u1Cnw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHXgL-006KuR-5X; Wed, 03 Mar 2021 20:01:17 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHT4k-005IVQ-Tx; Wed, 03 Mar 2021 15:06:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=+q4uYJHfyxwCO8f/bReDJJznTVku0I43i4BfMHIsxyI=; b=Yscw01EEuvXGJHZ73DB73l9rwC
 WJGYKiQ3rPKZAeUPGQhrUvWa9M/JXBptEUxwfRynj/z52BqnjpffXNV1UtZWbqUVWmtsYL+39bFwi
 RrEjGM1g6l5dyzjIs1BFEBDho9W9z0S6I9mLzQYELdqCwGoscAN3+genbUhxni8WmrayoCQyhpggb
 7PPY7NMuU+y4saakfyL72n2Wkj3KK/ufYorknPsJry+IN/AG88te7fTxtHcwcpUn0yfBS0apJQcMe
 H/0k7AAZCdOqgfAjSkzNxS97tWFO1+5i7IQScvXvOh8l670BLiccKF7Sd9Sa/YJ762nEocGlzPOy6
 xEcw0nsw==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHHiU-0013Kh-KK; Wed, 03 Mar 2021 02:58:27 +0000
X-UUID: 012588c03f2d4bcf9b09d6bc27ad51be-20210302
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=+q4uYJHfyxwCO8f/bReDJJznTVku0I43i4BfMHIsxyI=; 
 b=uv0wtqg1RuU0T5MEAajAw95NqkxQBrhTZpWVBUbDBqQyMIUQNIxeAFMaNCOhWzm5oMaPdohs59W9cr2tEPJW3DoFQDg7C4cTV5Xq9vNZnNUwp5lRgKRXHrQ97QV0RLS0HkRAVI6azqDkibY4YUbMeyJLqjbJRFqPhBES27e6eGA=;
X-UUID: 012588c03f2d4bcf9b09d6bc27ad51be-20210302
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <leilk.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 695560044; Tue, 02 Mar 2021 18:58:13 -0800
Received: from MTKMBS32N1.mediatek.inc (172.27.4.71) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 2 Mar 2021 18:57:01 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS32N1.mediatek.inc (172.27.4.71) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 3 Mar 2021 10:56:44 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 3 Mar 2021 10:56:43 +0800
From: Leilk Liu <leilk.liu@mediatek.com>
To: Mark Brown <broonie@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>, 
 "luhua . xu" <luhua.xu@mediatek.com>, Wei Yongjun <weiyj.lk@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Stephen Boyd <swboyd@chromium.org>,
 Pi-Hsun Shih <pihsun@chromium.org>, Markus Elfring
 <elfring@users.sourceforge.net>, Javier Martinez Canillas
 <javier@osg.samsung.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Fengguang Wu <fengguang.wu@intel.com>, Daniel Kurtz <djkurtz@chromium.org>,
 Axel Lin <axel.lin@ingics.com>
CC: Mark Rutland <mark.rutland@arm.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-spi@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <fparent@baylibre.com>, leilk.liu
 <leilk.liu@mediatek.com>
Subject: [PATCH] spi: mediatek: Re-license MTK SPI driver as Dual MIT/GPL
Date: Wed, 3 Mar 2021 10:56:36 +0800
Message-ID: <20210303025636.795-1-leilk.liu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: CFB470F6D72B682C71CD7856807A46D25E7A89CFA0FD9487BA5B52F89AC338792000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210303_025827_929164_1E1F19D3 
X-CRM114-Status: GOOD (  11.93  )
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

From: "leilk.liu" <leilk.liu@mediatek.com>

It is wanted to use MTK spi bus driver with GPL-2.0 or MIT license.
But now it is only licensed as GPL-2.0, so re-license it as dual
MIT/GPL.

Signed-off-by: leilk.liu <leilk.liu@mediatek.com>
---
 drivers/spi/spi-mt65xx.c                 | 4 ++--
 include/linux/platform_data/spi-mt65xx.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-mt65xx.c b/drivers/spi/spi-mt65xx.c
index 976f73b9e299..d8a8fb0e8aa4 100644
--- a/drivers/spi/spi-mt65xx.c
+++ b/drivers/spi/spi-mt65xx.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0-only
+// SPDX-License-Identifier: GPL-2.0 OR MIT
 /*
  * Copyright (c) 2015 MediaTek Inc.
  * Author: Leilk Liu <leilk.liu@mediatek.com>
@@ -946,5 +946,5 @@ module_platform_driver(mtk_spi_driver);
 
 MODULE_DESCRIPTION("MTK SPI Controller driver");
 MODULE_AUTHOR("Leilk Liu <leilk.liu@mediatek.com>");
-MODULE_LICENSE("GPL v2");
+MODULE_LICENSE("Dual MIT/GPL");
 MODULE_ALIAS("platform:mtk-spi");
diff --git a/include/linux/platform_data/spi-mt65xx.h b/include/linux/platform_data/spi-mt65xx.h
index 65fd5ffd257c..b6dcd70c4c49 100644
--- a/include/linux/platform_data/spi-mt65xx.h
+++ b/include/linux/platform_data/spi-mt65xx.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
+// SPDX-License-Identifier: GPL-2.0 OR MIT
 /*
  *  MTK SPI bus driver definitions
  *
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
