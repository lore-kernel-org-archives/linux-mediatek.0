Return-Path: <SRS0=02OB=GO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A4BDC433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 11:34:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6EA6224B0
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 11:34:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6EA6224B0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=osUAzbr5Q+CAKRBzUTGPg3KPqMFTiGXWNXcSnpOSRKY=; b=24b1PY9gFXcNT2D9W/nuU5ZZQ
	GEGvU7LGLfZce83rqSIT+CSyO5dGQAFD2lEISuNNcb/2l1HCxx78D+5dqY+KWwTNrPrJJM6UQ1r5z
	w+pSp4JpzuysxHZ1zLGDRaK1kFzJX1hF/NK7RZKrhcgdJAQxbPOrxLcikIVtQ1QduOXbxTUBg/2Tb
	B0qsIEJAhUMKVsKAGj+xbZhPR8BEkCRHQAhEfFDD6ZzBJCOTUqYIp5xKH8kNQogJCZ+k9etEzWD2u
	B7FKImZrRCPIHuNb8xQZh02DAYUVb8O/SkrPYcyh0efk8Qs85bi3P2Xws7aITFj4XYpI2URCsdjpZ
	/i0DRfOfQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kyvSH-00079q-6E; Mon, 11 Jan 2021 11:33:49 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kyvPD-0005FM-OH; Mon, 11 Jan 2021 11:30:46 +0000
X-UUID: e6716969a3c0423fb331cf133cfdb6d9-20210111
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=bG+/lm8VSWd9Irz54XGHYCU2eg1B11rTUhibTNsz57g=; 
 b=HJg1/gfA6VpJAWvOtRscYRd7ls9D0S0n3n/5YG6NcN2lQ7/U2qlRvgIitz/1HGs8REzv37FzUNyzplE/5g00V+lFfHLGSFE6kUa1LSJGRMFrrAebnRJzyo+xM8JfbhcKXGoXqDcyFlnfMWrZLCd5ayb9Ver8hoE0vOTsSyXyuok=;
X-UUID: e6716969a3c0423fb331cf133cfdb6d9-20210111
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1199288415; Mon, 11 Jan 2021 03:30:34 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 11 Jan 2021 03:21:21 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 11 Jan 2021 19:21:19 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 11 Jan 2021 19:21:19 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v6 11/33] iommu/io-pgtable-arm-v7s: Clarify LVL_SHIFT/BITS
 macro
Date: Mon, 11 Jan 2021 19:18:52 +0800
Message-ID: <20210111111914.22211-12-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210111111914.22211-1-yong.wu@mediatek.com>
References: <20210111111914.22211-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_063040_036949_1B468B20 
X-CRM114-Status: GOOD (  12.50  )
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
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 chao.hao@mediatek.com, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, yong.wu@mediatek.com,
 Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>,
 anan.sun@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The current _ARM_V7S_LVL_BITS/ARM_V7S_LVL_SHIFT use a formula to calculate
the corresponding value for level1 and level2 to pretend the code sane.
Actually their level1 and level2 values are different from each other.
This patch only clarify the two macro. No functional change.

Suggested-by: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Yong Wu <yong.wu@mediatek.com>
Reviewed-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/iommu/io-pgtable-arm-v7s.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm-v7s.c b/drivers/iommu/io-pgtable-arm-v7s.c
index acfdb0163af8..0ce9a14300e9 100644
--- a/drivers/iommu/io-pgtable-arm-v7s.c
+++ b/drivers/iommu/io-pgtable-arm-v7s.c
@@ -44,13 +44,11 @@
 
 /*
  * We have 32 bits total; 12 bits resolved at level 1, 8 bits at level 2,
- * and 12 bits in a page. With some carefully-chosen coefficients we can
- * hide the ugly inconsistencies behind these macros and at least let the
- * rest of the code pretend to be somewhat sane.
+ * and 12 bits in a page.
  */
 #define ARM_V7S_ADDR_BITS		32
-#define _ARM_V7S_LVL_BITS(lvl)		(16 - (lvl) * 4)
-#define ARM_V7S_LVL_SHIFT(lvl)		(ARM_V7S_ADDR_BITS - (4 + 8 * (lvl)))
+#define _ARM_V7S_LVL_BITS(lvl)		((lvl) == 1 ? 12 : 8)
+#define ARM_V7S_LVL_SHIFT(lvl)		((lvl) == 1 ? 20 : 12)
 #define ARM_V7S_TABLE_SHIFT		10
 
 #define ARM_V7S_PTES_PER_LVL(lvl)	(1 << _ARM_V7S_LVL_BITS(lvl))
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
