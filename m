Return-Path: <SRS0=hSNv=LK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 870C3C48BE5
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Jun 2021 11:54:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F4936128B
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Jun 2021 11:54:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F4936128B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+eNM70qy3yg0B7hDSaEqWJQOkLuTlyP5RMqSVCzz9lg=; b=mVFdxzwqmzfw9t
	I99PBjmklSIsyto+4OPjv4YcVtFIBDNbDWz5fVdT9/UJLkwJ7OSQRpmS6K4mohSsFSwQU+u72UezM
	vuJI2OG7ebVoIDQOGy3P4rIhcb1lIbneNPWNJ3akoIi4xbWjEzy9Ik7z71EKxwfRkKJ1NyJ2+RApB
	vAvzDnDqPak04i3ZMnrZNPPUI0q8GpWT7OteCb0q03sXLnTEiJafh/dgXObbh0NsRMqBoMCN4Tb7K
	K5F9CzoCNGQKfBSILwY824Eo95/sEhRxih0FNNfqLu+WJQBUSex+qPBlL+A7LDcJTra9XiJ8dxXWC
	3QFQGY7JRqjdos7IIamw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltU89-0069NO-3t; Wed, 16 Jun 2021 11:54:49 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltU86-0069Lk-Ai; Wed, 16 Jun 2021 11:54:48 +0000
X-UUID: 71f1d39104304a6984225705da0be863-20210616
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=ia0GefXHKJKBoXFKNX8puapjxKNCCJF70979QzxkUMA=; 
 b=NN9lGJl8ryT3C42FvaflH8cqtCkrxDTmqJeYVYLSs9IfoOMAaYqNmt8l2qVnaTnb4CW7s4ICmVG5jsmYFz11aGV8b2Nr+Ay8C3CncUTA0Ih00PajRQQrlsg6AUcQk+94BNMDIqGHmJhgTtiXw/h9gLD6FcVhSFYlcJnYXr0wbt0=;
X-UUID: 71f1d39104304a6984225705da0be863-20210616
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 305007903; Wed, 16 Jun 2021 04:54:39 -0700
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Jun 2021 04:44:37 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Jun 2021 19:44:35 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 16 Jun 2021 19:44:34 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, "Tomasz
 Figa" <tfiga@chromium.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux-foundation.org>,
 <yong.wu@mediatek.com>, <youlin.pei@mediatek.com>, <anan.sun@mediatek.com>,
 <ming-fan.chen@mediatek.com>, <yi.kuo@mediatek.com>,
 <anthony.huang@mediatek.com>
Subject: [PATCH 4/9] memory: mtk-smi: Rename smi_gen to smi_type
Date: Wed, 16 Jun 2021 19:43:41 +0800
Message-ID: <20210616114346.18812-5-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210616114346.18812-1-yong.wu@mediatek.com>
References: <20210616114346.18812-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210616_045446_735667_595FA396 
X-CRM114-Status: GOOD (  18.75  )
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

This is a preparing patch for adding smi sub common.

About the previou smi_gen, we have gen1/gen2 that stand for the generation
number for HW. I plan to add a new type(sub_common), then the "gen" is not
prober. this patch only change it to "type", No functional change.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/memory/mtk-smi.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
index bcd2bf130655..8eb39b46a6c8 100644
--- a/drivers/memory/mtk-smi.c
+++ b/drivers/memory/mtk-smi.c
@@ -55,7 +55,7 @@
 /* All are MMU0 defaultly. Only specialize mmu1 here. */
 #define F_MMU1_LARB(larbid)		(0x1 << SMI_BUS_LARB_SHIFT(larbid))
 
-enum mtk_smi_gen {
+enum mtk_smi_type {
 	MTK_SMI_GEN1,
 	MTK_SMI_GEN2
 };
@@ -71,8 +71,8 @@ static const char * const mtk_smi_larb_clocks[] = {
 };
 
 struct mtk_smi_common_plat {
-	enum mtk_smi_gen gen;
-	u32              bus_sel; /* Balance some larbs to enter mmu0 or mmu1 */
+	enum mtk_smi_type	type;
+	u32			bus_sel; /* Balance some larbs to enter mmu0 or mmu1 */
 };
 
 struct mtk_smi_larb_gen {
@@ -387,27 +387,27 @@ static struct platform_driver mtk_smi_larb_driver = {
 };
 
 static const struct mtk_smi_common_plat mtk_smi_common_gen1 = {
-	.gen = MTK_SMI_GEN1,
+	.type     = MTK_SMI_GEN1,
 };
 
 static const struct mtk_smi_common_plat mtk_smi_common_gen2 = {
-	.gen = MTK_SMI_GEN2,
+	.type	  = MTK_SMI_GEN2,
 };
 
 static const struct mtk_smi_common_plat mtk_smi_common_mt6779 = {
-	.gen		= MTK_SMI_GEN2,
-	.bus_sel	= F_MMU1_LARB(1) | F_MMU1_LARB(2) | F_MMU1_LARB(4) |
-			  F_MMU1_LARB(5) | F_MMU1_LARB(6) | F_MMU1_LARB(7),
+	.type	  = MTK_SMI_GEN2,
+	.bus_sel  = F_MMU1_LARB(1) | F_MMU1_LARB(2) | F_MMU1_LARB(4) |
+		    F_MMU1_LARB(5) | F_MMU1_LARB(6) | F_MMU1_LARB(7),
 };
 
 static const struct mtk_smi_common_plat mtk_smi_common_mt8183 = {
-	.gen      = MTK_SMI_GEN2,
+	.type     = MTK_SMI_GEN2,
 	.bus_sel  = F_MMU1_LARB(1) | F_MMU1_LARB(2) | F_MMU1_LARB(5) |
 		    F_MMU1_LARB(7),
 };
 
 static const struct mtk_smi_common_plat mtk_smi_common_mt8192 = {
-	.gen      = MTK_SMI_GEN2,
+	.type     = MTK_SMI_GEN2,
 	.bus_sel  = F_MMU1_LARB(1) | F_MMU1_LARB(2) | F_MMU1_LARB(5) |
 		    F_MMU1_LARB(6),
 };
@@ -471,7 +471,7 @@ static int mtk_smi_common_probe(struct platform_device *pdev)
 	 * clock into emi clock domain, but for mtk smi gen2, there's no smi ao
 	 * base.
 	 */
-	if (common->plat->gen == MTK_SMI_GEN1) {
+	if (common->plat->type == MTK_SMI_GEN1) {
 		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 		common->smi_ao_base = devm_ioremap_resource(dev, res);
 		if (IS_ERR(common->smi_ao_base))
@@ -511,7 +511,7 @@ static int __maybe_unused mtk_smi_common_resume(struct device *dev)
 	if (ret)
 		return ret;
 
-	if (common->plat->gen == MTK_SMI_GEN2 && bus_sel)
+	if (common->plat->type == MTK_SMI_GEN2 && bus_sel)
 		writel(bus_sel, common->base + SMI_BUS_SEL);
 	return 0;
 }
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
