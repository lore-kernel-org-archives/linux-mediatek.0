Return-Path: <SRS0=C/QR=NB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8CBFC432BE
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Aug 2021 08:12:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA71561073
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Aug 2021 08:12:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AA71561073
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zXUIKvpTQBAzCPkSELZF7QPE1vIr9kdKPH2tNQOSg9A=; b=dt/okTmcaSVv4o
	zs7+FL5TW7WK6qUv8jPN4CL/Mr2FGLZoXap5oymuSxjNz7ovR++aIrnYlrVC/J4eqQNDe0F6ikKBn
	/Kl8HJIchwynYiwDRp42XUa5XDx6SU9XK4I8Hs2AMGaJc/AYMzXb7KZfc5cKc1eh9lSfzFaYgPibm
	+R2DN8h9td6bVQYfthZyrh7+soDHcuu0eGc7k5A2jhwq4drCxeX7HprJn9B813ACbj28DtnS1kRCx
	F9CYkQEWqHE8RH5nwcFGG+Ufam+pbUfEJRyzr5lHPaaOQCR40pea0FAgZWkQNGAMU/J9NXjYyb2Qw
	uCpMnfoRxHeJ2rLKSeEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDMry-002uxY-7n; Tue, 10 Aug 2021 08:12:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDMqL-002tyv-VR; Tue, 10 Aug 2021 08:10:41 +0000
X-UUID: 2161cacc21004e81a2cb1cb5509360d4-20210810
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=VpGmwPx/dsR/3HC/Fg4S7ZrJCwiC5Bv05etVkw9UBdc=; 
 b=GQl5Ny1rM1R5fSMkiF5w+UpGKi+SMPGR8jiQMfu0EpYR3TgEhV/12HBs7wmcai7gRJGrwoOD7VSZH2D4uDovKHT7Wf3Y5yVoXA7umwGpsyqqMi7XNFuq6MsLGrC6NqcBZeMbd6ssBkMx/YU7PbH6Ii0r+Fu1NgzHA1AX5zIUcMc=;
X-UUID: 2161cacc21004e81a2cb1cb5509360d4-20210810
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 100458126; Tue, 10 Aug 2021 01:10:36 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 10 Aug 2021 01:10:34 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 10 Aug 2021 16:10:33 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 10 Aug 2021 16:10:32 +0800
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
 <anthony.huang@mediatek.com>, Ikjoon Jang <ikjn@chromium.org>
Subject: [PATCH v3 10/13] memory: mtk-smi: mt8195: Add smi support
Date: Tue, 10 Aug 2021 16:08:56 +0800
Message-ID: <20210810080859.29511-11-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210810080859.29511-1-yong.wu@mediatek.com>
References: <20210810080859.29511-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210810_011038_088370_377CAFB6 
X-CRM114-Status: GOOD (  11.41  )
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
Reviewed-by: Ikjoon Jang <ikjn@chromium.org>
---
 drivers/memory/mtk-smi.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
index a001e41f5074..35853ba980c9 100644
--- a/drivers/memory/mtk-smi.c
+++ b/drivers/memory/mtk-smi.c
@@ -261,6 +261,10 @@ static const struct mtk_smi_larb_gen mtk_smi_larb_mt8192 = {
 	.config_port                = mtk_smi_larb_config_port_gen2_general,
 };
 
+static const struct mtk_smi_larb_gen mtk_smi_larb_mt8195 = {
+	.config_port                = mtk_smi_larb_config_port_gen2_general,
+};
+
 static const struct of_device_id mtk_smi_larb_of_ids[] = {
 	{.compatible = "mediatek,mt2701-smi-larb", .data = &mtk_smi_larb_mt2701},
 	{.compatible = "mediatek,mt2712-smi-larb", .data = &mtk_smi_larb_mt2712},
@@ -269,6 +273,7 @@ static const struct of_device_id mtk_smi_larb_of_ids[] = {
 	{.compatible = "mediatek,mt8173-smi-larb", .data = &mtk_smi_larb_mt8173},
 	{.compatible = "mediatek,mt8183-smi-larb", .data = &mtk_smi_larb_mt8183},
 	{.compatible = "mediatek,mt8192-smi-larb", .data = &mtk_smi_larb_mt8192},
+	{.compatible = "mediatek,mt8195-smi-larb", .data = &mtk_smi_larb_mt8195},
 	{}
 };
 
@@ -443,6 +448,24 @@ static const struct mtk_smi_common_plat mtk_smi_common_mt8192 = {
 		    F_MMU1_LARB(6),
 };
 
+static const struct mtk_smi_common_plat mtk_smi_common_mt8195_vdo = {
+	.type     = MTK_SMI_GEN2,
+	.has_gals = true,
+	.bus_sel  = F_MMU1_LARB(1) | F_MMU1_LARB(3) | F_MMU1_LARB(5) |
+		    F_MMU1_LARB(7),
+};
+
+static const struct mtk_smi_common_plat mtk_smi_common_mt8195_vpp = {
+	.type     = MTK_SMI_GEN2,
+	.has_gals = true,
+	.bus_sel  = F_MMU1_LARB(1) | F_MMU1_LARB(2) | F_MMU1_LARB(7),
+};
+
+static const struct mtk_smi_common_plat mtk_smi_sub_common_mt8195 = {
+	.type     = MTK_SMI_GEN2_SUB_COMM,
+	.has_gals = true,
+};
+
 static const struct of_device_id mtk_smi_common_of_ids[] = {
 	{.compatible = "mediatek,mt2701-smi-common", .data = &mtk_smi_common_gen1},
 	{.compatible = "mediatek,mt2712-smi-common", .data = &mtk_smi_common_gen2},
@@ -451,6 +474,9 @@ static const struct of_device_id mtk_smi_common_of_ids[] = {
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
