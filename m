Return-Path: <SRS0=ob7z=MH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A739EC07E96
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jul 2021 12:22:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7086E6136E
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jul 2021 12:22:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7086E6136E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m65U9cBTTV86NLH/ZIBWcX0QZ8hH3ZGJnxp3o+XpRrk=; b=RDp3MIhKVGS600
	/YKYsnymlxxp9Zg9hnBL833yHkKCBZgqyP2Vhy+1vRy8Yfrc1wHP0/N6d/h7iq7f0THosI+05cBd3
	tHQiDaEJ94ddlOws+Ka/QPlkSh784mJW5T5ecxGL58I+ocMjM+pnpwStbbges/O1l+p+dg5fi4D9h
	q0Id0guHzbAEM9TOqcNN8BJmTp3kVq7WXoxbr93PwZKnuWr/ufjZD/Xo5Tl7/CdrGbZgbMZRySvI0
	yJma2GnAp8Zd7UVygFdodJfCjkyAIlX85qeaArPrVmleskwetFwIyEoLpnXuZmat137TukXOx08wn
	LR9BexzZNJK8hbdFc2fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m40O1-000lT8-If; Thu, 15 Jul 2021 12:22:41 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m40Nt-000lRE-UZ; Thu, 15 Jul 2021 12:22:39 +0000
X-UUID: 5cc3e406d1454eeb864cae48d9d4ef1d-20210715
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=MhjDyxP1A9oJJ3afKx1m4JIEpU71oZsHaRxE9TgGfQA=; 
 b=aMIQscTwwmjP8qTBji2BwA5hZJCO+x18vpNClrNQzcEq+i1H6cYi/+W+IIK1zrjJQsmSQ5m3yj5/PPTq5DT7sG4VnFVffI/7JnBjP+SAFWBmg7GWG1qffH8+Tq7epSgcQo3BK4acnA+N71gt7EGC9r0dgfdBM9K5VCLe7L99w6c=;
X-UUID: 5cc3e406d1454eeb864cae48d9d4ef1d-20210715
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 888094733; Thu, 15 Jul 2021 05:22:30 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 15 Jul 2021 05:13:39 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 15 Jul 2021 20:13:38 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 15 Jul 2021 20:13:37 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, "Tomasz
 Figa" <tfiga@chromium.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <iommu@lists.linux-foundation.org>, <yong.wu@mediatek.com>,
 <youlin.pei@mediatek.com>, <anan.sun@mediatek.com>,
 <ming-fan.chen@mediatek.com>, <yi.kuo@mediatek.com>,
 <anthony.huang@mediatek.com>
Subject: [PATCH v2 09/11] memory: mtk-smi: mt8195: Add smi support
Date: Thu, 15 Jul 2021 20:12:07 +0800
Message-ID: <20210715121209.31024-10-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210715121209.31024-1-yong.wu@mediatek.com>
References: <20210715121209.31024-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210715_052234_095768_C943565C 
X-CRM114-Status: GOOD (  10.95  )
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

MT8195 has two smi-common, their IP are the same. Only the larbs that
connect with the smi-common are different. thus the bus_sel are different
for the two smi-common.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/memory/mtk-smi.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
index e5a34b3952a0..3c288716a378 100644
--- a/drivers/memory/mtk-smi.c
+++ b/drivers/memory/mtk-smi.c
@@ -250,6 +250,10 @@ static const struct mtk_smi_larb_gen mtk_smi_larb_mt8192 = {
 	.config_port                = mtk_smi_larb_config_port_gen2_general,
 };
 
+static const struct mtk_smi_larb_gen mtk_smi_larb_mt8195 = {
+	.config_port                = mtk_smi_larb_config_port_gen2_general,
+};
+
 static const struct of_device_id mtk_smi_larb_of_ids[] = {
 	{.compatible = "mediatek,mt2701-smi-larb", .data = &mtk_smi_larb_mt2701},
 	{.compatible = "mediatek,mt2712-smi-larb", .data = &mtk_smi_larb_mt2712},
@@ -258,6 +262,7 @@ static const struct of_device_id mtk_smi_larb_of_ids[] = {
 	{.compatible = "mediatek,mt8173-smi-larb", .data = &mtk_smi_larb_mt8173},
 	{.compatible = "mediatek,mt8183-smi-larb", .data = &mtk_smi_larb_mt8183},
 	{.compatible = "mediatek,mt8192-smi-larb", .data = &mtk_smi_larb_mt8192},
+	{.compatible = "mediatek,mt8195-smi-larb", .data = &mtk_smi_larb_mt8195},
 	{}
 };
 
@@ -430,6 +435,21 @@ static const struct mtk_smi_common_plat mtk_smi_common_mt8192 = {
 		    F_MMU1_LARB(6),
 };
 
+static const struct mtk_smi_common_plat mtk_smi_common_mt8195_vdo = {
+	.type     = MTK_SMI_GEN2,
+	.bus_sel  = F_MMU1_LARB(1) | F_MMU1_LARB(3) | F_MMU1_LARB(5) |
+		    F_MMU1_LARB(7),
+};
+
+static const struct mtk_smi_common_plat mtk_smi_common_mt8195_vpp = {
+	.type     = MTK_SMI_GEN2,
+	.bus_sel  = F_MMU1_LARB(1) | F_MMU1_LARB(2) | F_MMU1_LARB(7),
+};
+
+static const struct mtk_smi_common_plat mtk_smi_sub_common_mt8195 = {
+	.type     = MTK_SMI_GEN2_SUB_COMM,
+};
+
 static const struct of_device_id mtk_smi_common_of_ids[] = {
 	{.compatible = "mediatek,mt2701-smi-common", .data = &mtk_smi_common_gen1},
 	{.compatible = "mediatek,mt2712-smi-common", .data = &mtk_smi_common_gen2},
@@ -438,6 +458,9 @@ static const struct of_device_id mtk_smi_common_of_ids[] = {
 	{.compatible = "mediatek,mt8173-smi-common", .data = &mtk_smi_common_gen2},
 	{.compatible = "mediatek,mt8183-smi-common", .data = &mtk_smi_common_mt8183},
 	{.compatible = "mediatek,mt8192-smi-common", .data = &mtk_smi_common_mt8192},
+	{.compatible = "mediatek,mt8195-smi-common-vdo", .data = &mtk_smi_common_mt8195_vdo},
+	{.compatible = "mediatek,mt8195-smi-common-vpp", .data = &mtk_smi_common_mt8195_vpp},
+	{.compatible = "mediatek,mt8195-smi-sub-common", .data = &mtk_smi_sub_common_mt8195},
 	{}
 };
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
