Return-Path: <SRS0=Kazo=DH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8991CC2D0A8
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Sep 2020 07:24:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25A2E2075F
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Sep 2020 07:24:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LRZci0Ii";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="dUD+TmmF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 25A2E2075F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dDazU0T2UbcmMTM1AIShYjTOtSS8sfMyJyleBiJ9xlY=; b=LRZci0IiprOaK8CQ/vKAV1h3W
	m0hVbRsAX3CqzVfwF+j5blAdO5BMk/K8AaiuX3aVyW9/iLFxk7H71RmKL7PQyMSrpKF5OZcmoEb80
	fQ9SghU9nYkupYFlIi9HQF+OpEDVgwksHXbiM4a0/ztkhY6JsbQSsSeR2E8E4/Dfl7Kk3Ncth+7dS
	O0halczknTgc+N4uX17D8qz78c4MKzv8/6BR3kg0X0OtFguCcyK2BRgTktAwgxggTy5eC/ooegAUB
	A3F0J/LYKfEpcUiEhRuqF0sQNQFKjHxtmEgCYfkPEWQqtyTPNMU9cPegYCiB3Pg5gEj5PmX6F3OMx
	4KR6IwhOw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNWTY-0004i6-Rt; Wed, 30 Sep 2020 07:24:33 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNWO7-0002Fn-7a; Wed, 30 Sep 2020 07:19:11 +0000
X-UUID: bcfa4af0cc5d4548822ec5fb38ea5b41-20200929
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=IcHcY2GTxRqXGr2c5Od/IbtILzjIIei29lysc2o5kuY=; 
 b=dUD+TmmFGxb2ZO8RuYX4nK8I28jgLxvLQLJxllOQ8+mCIbx1/qCcySMg98eapFj8Nt8sJnBvFleeJZ+9GC2qPyBSHT912IqEm5JJ1/1vQFsBqCtXt0bXCz0g6ugfRWe22dAMO1mco5M+RqW1xw2PHoPfIf62dLfn2GL3s3gXjQA=;
X-UUID: bcfa4af0cc5d4548822ec5fb38ea5b41-20200929
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1146701443; Tue, 29 Sep 2020 23:18:34 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Sep 2020 00:09:16 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Sep 2020 15:09:14 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 30 Sep 2020 15:09:15 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Will Deacon <will@kernel.org>
Subject: [PATCH v3 11/24] iommu/io-pgtable-arm-v7s: Quad lvl1 pgtable for
 MediaTek
Date: Wed, 30 Sep 2020 15:06:34 +0800
Message-ID: <20200930070647.10188-12-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200930070647.10188-1-yong.wu@mediatek.com>
References: <20200930070647.10188-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_031855_556897_4195B6E0 
X-CRM114-Status: GOOD (  14.85  )
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
 chao.hao@mediatek.com, kernel-team@android.com, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, Tomasz Figa <tfiga@google.com>,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 yong.wu@mediatek.com, ming-fan.chen@mediatek.com, anan.sun@mediatek.com,
 Greg Kroah-Hartman <gregkh@google.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The standard input iova bits is 32. MediaTek quad the lvl1 pagetable
(4 * lvl1). No change for lvl2 pagetable. Then the iova bits can reach
34bit.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/iommu/io-pgtable-arm-v7s.c | 13 ++++++++++---
 drivers/iommu/mtk_iommu.c          |  2 +-
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm-v7s.c b/drivers/iommu/io-pgtable-arm-v7s.c
index 8362fdf76657..306bae2755ed 100644
--- a/drivers/iommu/io-pgtable-arm-v7s.c
+++ b/drivers/iommu/io-pgtable-arm-v7s.c
@@ -50,10 +50,17 @@
  */
 #define ARM_V7S_ADDR_BITS		32
 #define _ARM_V7S_LVL_BITS(lvl)		(16 - (lvl) * 4)
+/* MediaTek: totally 34bits, 14bits at lvl1 and 8bits at lvl2. */
+#define _ARM_V7S_LVL_BITS_MTK(lvl)	(20 - (lvl) * 6)
 #define ARM_V7S_LVL_SHIFT(lvl)		(ARM_V7S_ADDR_BITS - (4 + 8 * (lvl)))
 #define ARM_V7S_TABLE_SHIFT		10
 
-#define ARM_V7S_PTES_PER_LVL(lvl, cfg)	(1 << _ARM_V7S_LVL_BITS(lvl))
+#define ARM_V7S_PTES_PER_LVL(lvl, cfg)	({				\
+	int _lvl = lvl;							\
+	!arm_v7s_is_mtk_enabled(cfg) ?					\
+	 (1 << _ARM_V7S_LVL_BITS(_lvl)) : (1 << _ARM_V7S_LVL_BITS_MTK(_lvl));\
+})
+
 #define ARM_V7S_TABLE_SIZE(lvl, cfg)					\
 	(ARM_V7S_PTES_PER_LVL(lvl, cfg) * sizeof(arm_v7s_iopte))
 
@@ -63,7 +70,7 @@
 #define _ARM_V7S_IDX_MASK(lvl, cfg)	(ARM_V7S_PTES_PER_LVL(lvl, cfg) - 1)
 #define ARM_V7S_LVL_IDX(addr, lvl, cfg)	({			\
 	int _l = lvl;							\
-	((u32)(addr) >> ARM_V7S_LVL_SHIFT(_l)) & _ARM_V7S_IDX_MASK(_l, cfg); \
+	((addr) >> ARM_V7S_LVL_SHIFT(_l)) & _ARM_V7S_IDX_MASK(_l, cfg); \
 })
 
 /*
@@ -755,7 +762,7 @@ static struct io_pgtable *arm_v7s_alloc_pgtable(struct io_pgtable_cfg *cfg,
 {
 	struct arm_v7s_io_pgtable *data;
 
-	if (cfg->ias > ARM_V7S_ADDR_BITS)
+	if (cfg->ias > (arm_v7s_is_mtk_enabled(cfg) ? 34 : ARM_V7S_ADDR_BITS))
 		return NULL;
 
 	if (cfg->oas > (arm_v7s_is_mtk_enabled(cfg) ? 35 : ARM_V7S_ADDR_BITS))
diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index f6a2e3eb59d2..6e85c9976a33 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -316,7 +316,7 @@ static int mtk_iommu_domain_finalise(struct mtk_iommu_domain *dom)
 			IO_PGTABLE_QUIRK_TLBI_ON_MAP |
 			IO_PGTABLE_QUIRK_ARM_MTK_EXT,
 		.pgsize_bitmap = mtk_iommu_ops.pgsize_bitmap,
-		.ias = 32,
+		.ias = 34,
 		.oas = 35,
 		.tlb = &mtk_iommu_flush_ops,
 		.iommu_dev = data->dev,
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
