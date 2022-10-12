Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04307C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Oct 2022 08:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XPVpe+Og9tsOKwpk+GO3Cxy95U6brI62hoEBipMd8iE=; b=FuskVftWBMHRQMfsVe4nqUDyP3
	+dEZ1oRXTl4rTRvpkoiHV+8Tvf29cfo9pQS0RGAicIhOQtgp9yb1HPUSnJwsehBAb4I6oBM9I3nSv
	INEKKElAWbXoXwJd0lBhVsgjlBhJKTDiwGc5vLGUod3Hzjh+uWwnDTVHP26jDhsm0EubdSI/nP92+
	8aDIOT2otpKxmA/ws2rzDM6R0E5/d3nGT36YIB1iZFfoHXlyRWgCiSKyp2Y5C61k3E+O9X04Y9Lt4
	pWdTrNlTLAhslTsHm84jRMOP9mWVC6qGZnWEzUOrTS45QIMLkJoTksurbIALG9TIj3ME2lkV54VDy
	nVvykIXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiXMq-007Oqk-EZ; Wed, 12 Oct 2022 08:45:32 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiXMl-007OnL-6k; Wed, 12 Oct 2022 08:45:29 +0000
X-UUID: bc93644f248547e4a190641e1014efcd-20221012
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=XPVpe+Og9tsOKwpk+GO3Cxy95U6brI62hoEBipMd8iE=;
	b=apsUzcc5m/Zf/j7rTNNlbgBO94CEiTObIgtI4a2S6vKIsqwjKaG5frDH9dBMpoQEO7tjgegPZLIjuD2mH7QS4iCoL+qB8563knnjPLEudB5vH4EyXyiTa7YNRDHfB9MVyCHN3eqladZyUBgmCt3tKq4Eo7El4X5NmbMh3X9kQhw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:36849529-125f-4d94-b141-86b7b771394f,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:39a5ff1,CLOUDID:d5533e01-cdeb-479d-93af-53f947adce9d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: bc93644f248547e4a190641e1014efcd-20221012
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2080916166; Wed, 12 Oct 2022 01:45:15 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 12 Oct 2022 15:54:38 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 12 Oct 2022 15:54:38 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
CC: <allen-kh.cheng@mediatek.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Tinghan Shen
	<tinghan.shen@mediatek.com>
Subject: [PATCH v1] soc: mediatek: mtk-pm-domains: Allow mt8186 ADSP default power on
Date: Wed, 12 Oct 2022 15:54:34 +0800
Message-ID: <20221012075434.30009-1-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_014528_352489_B2869DA3 
X-CRM114-Status: GOOD (  11.61  )
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

In the use case of configuring the access permissions of the ADSP core,
the mt8186 SoC ADSP power will be switched on in the bootloader because
the permission control registers are located in the ADSP subsys.

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
---
 drivers/soc/mediatek/mt8186-pm-domains.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/soc/mediatek/mt8186-pm-domains.h b/drivers/soc/mediatek/mt8186-pm-domains.h
index 108af61854a3..fce86f79c505 100644
--- a/drivers/soc/mediatek/mt8186-pm-domains.h
+++ b/drivers/soc/mediatek/mt8186-pm-domains.h
@@ -304,7 +304,6 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8186[] = {
 		.ctl_offs = 0x9FC,
 		.pwr_sta_offs = 0x16C,
 		.pwr_sta2nd_offs = 0x170,
-		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
 	},
 	[MT8186_POWER_DOMAIN_ADSP_INFRA] = {
 		.name = "adsp_infra",
@@ -312,7 +311,6 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8186[] = {
 		.ctl_offs = 0x9F8,
 		.pwr_sta_offs = 0x16C,
 		.pwr_sta2nd_offs = 0x170,
-		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
 	},
 	[MT8186_POWER_DOMAIN_ADSP_TOP] = {
 		.name = "adsp_top",
@@ -332,7 +330,7 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8186[] = {
 				MT8186_TOP_AXI_PROT_EN_3_CLR,
 				MT8186_TOP_AXI_PROT_EN_3_STA),
 		},
-		.caps = MTK_SCPD_SRAM_ISO | MTK_SCPD_KEEP_DEFAULT_OFF | MTK_SCPD_ACTIVE_WAKEUP,
+		.caps = MTK_SCPD_SRAM_ISO | MTK_SCPD_ACTIVE_WAKEUP,
 	},
 };
 
-- 
2.18.0


