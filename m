Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12241C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Dec 2022 12:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FxQw7bHLyA5vKeEmlF/GvXF0yb0AjLvtCurZOZUuMoM=; b=VaK2L+lIk0s+Z/7L4wv46nUqLc
	3NtU2Di1N/P2HL1V2SDwvft1+AU1IbwhEp6OiBbq8q2RRYFlM6D0LbYZfEzH70E5Pt3IjI7oqxNB8
	ilvLSAGJFKtDXngSDPEu/4vuwdg0m1l2UFZL4HnVzrLYqfqz5W7O8d2QMfNb2fcEtmZr0+zT6V/1B
	A4bT/nNbXBRv2/tuEp2pDeCMZ+1lANZN1dolk7BijoI6v0GLUVx+AN2jdGDq6HKYtfhfbEd055865
	5xND4UDsYaW+/4cUR8MfDRw6wU83FdsZ6/e58UdGFlNNRTgayUkR0MtSm8VDCgRf5S1eWtSrvv/Lv
	p4O0pVCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5n4q-009FbV-NL; Thu, 15 Dec 2022 12:11:04 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5n4m-009FZh-Qu; Thu, 15 Dec 2022 12:11:03 +0000
X-UUID: 52bedd8a397f4583962fb77d007434da-20221215
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=FxQw7bHLyA5vKeEmlF/GvXF0yb0AjLvtCurZOZUuMoM=;
	b=nx+NOYZciDWe4I3Rv3GJE54p3oJ2nBUhK3vRbCHaQ8Q5coVSuvD9gBn8Ujzp3XgC3qwiz49BnEVlbytMgsU7rRObOKkwcOzaFF0VOkbXeQjd3L4Z9dNbpHPVm4FMT24kjDLiJXMbVTP6lv6UkEM34ISjOI7sy391HKMH7JgpeZM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:31660f2e-941e-47e2-8a87-2d1e57f3a79f,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:dcaaed0,CLOUDID:cc33bcaf-9f02-4d44-9c44-6e4bb4e4f412,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 52bedd8a397f4583962fb77d007434da-20221215
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 901810877; Thu, 15 Dec 2022 05:10:55 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 15 Dec 2022 20:00:19 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 15 Dec 2022 20:00:19 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	"Stephen Boyd" <sboyd@kernel.org>, Ikjoon Jang <ikjn@chromium.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<angelogioacchino.delregno@collabora.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Chen-Yu Tsai <wenst@chromium.org>,
	Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: [PATCH 2/4] soc: mediatek: pm-domains: Add ADSP power domain data for MT8192
Date: Thu, 15 Dec 2022 20:00:14 +0800
Message-ID: <20221215120016.26611-3-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221215120016.26611-1-allen-kh.cheng@mediatek.com>
References: <20221215120016.26611-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221215_041100_898621_C38E5AD4 
X-CRM114-Status: UNSURE (   9.96  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add ADSP pm-domains (mtcmos) data for MT8192 SoC.

Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
---
 drivers/soc/mediatek/mt8192-pm-domains.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/soc/mediatek/mt8192-pm-domains.h b/drivers/soc/mediatek/mt8192-pm-domains.h
index b97b2051920f..19e58f0ca1df 100644
--- a/drivers/soc/mediatek/mt8192-pm-domains.h
+++ b/drivers/soc/mediatek/mt8192-pm-domains.h
@@ -287,6 +287,22 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8192[] = {
 		.sram_pdn_bits = GENMASK(8, 8),
 		.sram_pdn_ack_bits = GENMASK(12, 12),
 	},
+	[MT8192_POWER_DOMAIN_ADSP] = {
+		.name = "adsp",
+		.sta_mask = BIT(22),
+		.ctl_offs = 0x0358,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.ext_buck_iso_offs = 0x039C,
+		.ext_buck_iso_mask = BIT(2),
+		.bp_infracfg = {
+			BUS_PROT_WR(MT8192_TOP_AXI_PROT_EN_2_ADSP,
+				    MT8192_TOP_AXI_PROT_EN_2_SET,
+				    MT8192_TOP_AXI_PROT_EN_2_CLR,
+				    MT8192_TOP_AXI_PROT_EN_2_STA1),
+		},
+		.caps = MTK_SCPD_SRAM_ISO | MTK_SCPD_EXT_BUCK_ISO,
+	},
 	[MT8192_POWER_DOMAIN_CAM] = {
 		.name = "cam",
 		.sta_mask = BIT(23),
-- 
2.18.0


