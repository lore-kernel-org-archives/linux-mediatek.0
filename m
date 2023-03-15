Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FD66C61DA4
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Mar 2023 11:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8pVoHzcnVsdUKSRmD7CFv1XjbBsBrHZrxHjiGf+h8UI=; b=n6G9aN9uk7SZPlkcJ8+m9BxJmd
	NKxm1u16vfF4epS3SXyelCQkILLD50k/FITjbG3rMHmb9eez57EBmWRFL73Z0fHu1/V0STxyJYMc8
	vg/Paux/gPbFJWmnNrW1/Q46M6FtUIhR9c5s1pZW83St/hUWRd+FRMjGCR8+odTIYX7JEXMVhXcL7
	+R+kViszlJI8KcZapp/pfsJzrTOj/K3p/OihaBiYCJ7UyVsjXVqNumP4dUyUfwBkHzgi+NuRsih9q
	z0fO//sHJuseLWtyYbJvhdDOnpN8sPyQQJE897sqj5OTOkfSnsCX2mnLlLlIlybvE0HbP4StF6Qp8
	784ClM/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcPZR-00DDiS-1R;
	Wed, 15 Mar 2023 11:45:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcPZO-00DDhi-1M;
	Wed, 15 Mar 2023 11:45:27 +0000
X-UUID: dbfc5616c32611ed86fbcd8805c7ac66-20230315
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=8pVoHzcnVsdUKSRmD7CFv1XjbBsBrHZrxHjiGf+h8UI=;
	b=nykKKgERG2vVHmJ7KtUybaAPcrwikTvsfWMgwFnsyvZHbFQbz4G49gSqMbiOAmkzpgm0xhReZhXzh5As8S6s8XoLHvTkQJwrTkf6LVxfE7lANIIjKoHW2eWhA33+ipyL7Gan3zhnsGSG+A7wSzpfrBsKIDQhvkZQ6V8YO+Hui5c=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.21,REQID:be4bf320-bd35-4cd2-9cd1-51f23d8d5415,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:83295aa,CLOUDID:e74b56b3-beed-4dfc-bd9c-e1b22fa6ccc4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: dbfc5616c32611ed86fbcd8805c7ac66-20230315
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <johnson.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1324747190; Wed, 15 Mar 2023 04:45:18 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Wed, 15 Mar 2023 19:45:15 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Wed, 15 Mar 2023 19:45:15 +0800
From: Johnson Wang <johnson.wang@mediatek.com>
To: <matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Johnson Wang
	<johnson.wang@mediatek.com>
Subject: [PATCH] soc: mediatek: pm-domains: Add buck isolation setting for MT8188
Date: Wed, 15 Mar 2023 19:45:05 +0800
Message-ID: <20230315114505.25144-1-johnson.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_044526_466998_F86B8849 
X-CRM114-Status: GOOD (  12.31  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

For ADSP_AO, CAM_VCORE and IMG_VCORE power domains in MT8188,
we have to add the buck isolation setting to make them work properly.

Signed-off-by: Johnson Wang <johnson.wang@mediatek.com>
---
 drivers/soc/mediatek/mt8188-pm-domains.h | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/mediatek/mt8188-pm-domains.h b/drivers/soc/mediatek/mt8188-pm-domains.h
index 0692cb444ed0..e6dbdc0aa684 100644
--- a/drivers/soc/mediatek/mt8188-pm-domains.h
+++ b/drivers/soc/mediatek/mt8188-pm-domains.h
@@ -165,6 +165,8 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8188[] = {
 		.ctl_offs = 0x35C,
 		.pwr_sta_offs = 0x16C,
 		.pwr_sta2nd_offs = 0x170,
+		.ext_buck_iso_offs = 0x3EC,
+		.ext_buck_iso_mask = BIT(10),
 		.bp_infracfg = {
 			BUS_PROT_WR(MT8188_TOP_AXI_PROT_EN_2_ADSP_AO_STEP1,
 				    MT8188_TOP_AXI_PROT_EN_2_SET,
@@ -175,7 +177,7 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8188[] = {
 				    MT8188_TOP_AXI_PROT_EN_2_CLR,
 				    MT8188_TOP_AXI_PROT_EN_2_STA),
 		},
-		.caps = MTK_SCPD_ALWAYS_ON,
+		.caps = MTK_SCPD_ALWAYS_ON | MTK_SCPD_EXT_BUCK_ISO,
 	},
 	[MT8188_POWER_DOMAIN_ADSP_INFRA] = {
 		.name = "adsp_infra",
@@ -479,6 +481,8 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8188[] = {
 		.ctl_offs = 0x3A4,
 		.pwr_sta_offs = 0x16C,
 		.pwr_sta2nd_offs = 0x170,
+		.ext_buck_iso_offs = 0x3EC,
+		.ext_buck_iso_mask = BIT(12),
 		.bp_infracfg = {
 			BUS_PROT_WR(MT8188_TOP_AXI_PROT_EN_MM_IMG_VCORE_STEP1,
 				    MT8188_TOP_AXI_PROT_EN_MM_SET,
@@ -493,7 +497,8 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8188[] = {
 				    MT8188_TOP_AXI_PROT_EN_MM_2_CLR,
 				    MT8188_TOP_AXI_PROT_EN_MM_2_STA),
 		},
-		.caps = MTK_SCPD_KEEP_DEFAULT_OFF | MTK_SCPD_DOMAIN_SUPPLY,
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF | MTK_SCPD_DOMAIN_SUPPLY |
+			MTK_SCPD_EXT_BUCK_ISO,
 	},
 	[MT8188_POWER_DOMAIN_IMG_MAIN] = {
 		.name = "img_main",
@@ -541,6 +546,8 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8188[] = {
 		.ctl_offs = 0x3A0,
 		.pwr_sta_offs = 0x16C,
 		.pwr_sta2nd_offs = 0x170,
+		.ext_buck_iso_offs = 0x3EC,
+		.ext_buck_iso_mask = BIT(11),
 		.bp_infracfg = {
 			BUS_PROT_WR(MT8188_TOP_AXI_PROT_EN_MM_CAM_VCORE_STEP1,
 				    MT8188_TOP_AXI_PROT_EN_MM_SET,
@@ -563,7 +570,8 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8188[] = {
 				    MT8188_TOP_AXI_PROT_EN_MM_2_CLR,
 				    MT8188_TOP_AXI_PROT_EN_MM_2_STA),
 		},
-		.caps = MTK_SCPD_KEEP_DEFAULT_OFF | MTK_SCPD_DOMAIN_SUPPLY,
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF | MTK_SCPD_DOMAIN_SUPPLY |
+			MTK_SCPD_EXT_BUCK_ISO,
 	},
 	[MT8188_POWER_DOMAIN_CAM_MAIN] = {
 		.name = "cam_main",
-- 
2.18.0


