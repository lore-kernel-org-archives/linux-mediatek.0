Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A7C5C05027
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Feb 2023 12:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f+xt4bcbFiz4Lh0mpdZVAB1dKu8+XdSuSho8xqSktpI=; b=hh74xDbEo32fq2N1CKVJOqOwKe
	0/nIg7Y4zu38tkxeFbhKJTj/1Uc0dNceG+lF7l8l8+mDFGOlA5daTAKdXBg5vpzqYqV5ZsaJN7Ohf
	eJ8YoWQuGj9Lc4aGtxVbsfZiEt1JulPbkgL/D5zI/BWwqpVAJacasQNlzo/lagqdttHkWgQI0Uv2+
	QePg7jwAQK/x5NX1QgW5FSV8znylYtf0hANAZoM3GaGgwZZpHotAAljyzrcUYqtRgn6UaXvmPwJKQ
	pXTgF/4azWQZ1WpFeHj1WiL2Gc+q8BhvA7nb6i5OOhV4l3kCcHlZP8sfS1FhKawZwMhqnI2PZeaFr
	DJ3ArLRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNYuX-00Fpyc-63; Thu, 02 Feb 2023 12:41:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNYuQ-00Fpsc-50; Thu, 02 Feb 2023 12:41:47 +0000
X-UUID: f0137c7ea2f611edbbe3f76fe852e059-20230202
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=f+xt4bcbFiz4Lh0mpdZVAB1dKu8+XdSuSho8xqSktpI=;
	b=hddLKCzykIibfzu6QJ0HjLH+JHZbVDAqrbVzxaNfv6gD375T9ccub0QanqinD9tTv/O3zmOD2kAJOZZOojLfPpt2QMN1cw/c/olY5ZYcrix5McmRK66gv2PVGapMBDx3FMpNgJ9WU09gzz274FqEGEMSNvohZWz19DtjcaJzOgo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.18,REQID:80494cac-7913-4c2a-8600-3641f1074984,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:3ca2d6b,CLOUDID:c4d245f7-ff42-4fb0-b929-626456a83c14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: f0137c7ea2f611edbbe3f76fe852e059-20230202
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <roger.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1539135377; Thu, 02 Feb 2023 05:41:39 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 2 Feb 2023 20:41:06 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 2 Feb 2023 20:41:06 +0800
From: Roger Lu <roger.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Enric Balletbo Serra
	<eballetbo@gmail.com>, Kevin Hilman <khilman@kernel.org>, Nicolas Boichat
	<drinkcat@google.com>
CC: Fan Chen <fan.chen@mediatek.com>, Roger Lu <roger.lu@mediatek.com>,
	Jia-wei Chang <jia-wei.chang@mediatek.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v5 3/3] soc: mediatek: mtk-svs: add thermal voltage compensation if needed
Date: Thu, 2 Feb 2023 20:41:04 +0800
Message-ID: <20230202124104.16504-4-roger.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230202124104.16504-1-roger.lu@mediatek.com>
References: <20230202124104.16504-1-roger.lu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_044146_230084_9D71F1DE 
X-CRM114-Status: GOOD (  13.51  )
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

Some extreme test environment may keep IC temperature very low or very high
during system boot stage. For stability concern, we add thermal voltage
compenstation if needed no matter svs bank phase is in init02 or mon mode.

Signed-off-by: Roger Lu <roger.lu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-svs.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
index 299f580847bd..e104866d1ab5 100644
--- a/drivers/soc/mediatek/mtk-svs.c
+++ b/drivers/soc/mediatek/mtk-svs.c
@@ -558,7 +558,7 @@ static int svs_adjust_pm_opp_volts(struct svs_bank *svsb)
 	}
 
 	/* Get thermal effect */
-	if (svsb->phase == SVSB_PHASE_MON) {
+	if (!IS_ERR_OR_NULL(svsb->tzd)) {
 		ret = thermal_zone_get_temp(svsb->tzd, &tzone_temp);
 		if (ret || (svsb->temp > SVSB_TEMP_UPPER_BOUND &&
 			    svsb->temp < SVSB_TEMP_LOWER_BOUND)) {
@@ -573,7 +573,8 @@ static int svs_adjust_pm_opp_volts(struct svs_bank *svsb)
 			temp_voffset += svsb->tzone_ltemp_voffset;
 
 		/* 2-line bank update all opp volts when running mon mode */
-		if (svsb->type == SVSB_HIGH || svsb->type == SVSB_LOW) {
+		if (svsb->phase == SVSB_PHASE_MON && (svsb->type == SVSB_HIGH ||
+						      svsb->type == SVSB_LOW)) {
 			opp_start = 0;
 			opp_stop = svsb->opp_count;
 		}
@@ -589,11 +590,6 @@ static int svs_adjust_pm_opp_volts(struct svs_bank *svsb)
 			/* do nothing */
 			goto unlock_mutex;
 		case SVSB_PHASE_INIT02:
-			svsb_volt = max(svsb->volt[i], svsb->vmin);
-			opp_volt = svs_bank_volt_to_opp_volt(svsb_volt,
-							     svsb->volt_step,
-							     svsb->volt_base);
-			break;
 		case SVSB_PHASE_MON:
 			svsb_volt = max(svsb->volt[i] + temp_voffset, svsb->vmin);
 			opp_volt = svs_bank_volt_to_opp_volt(svsb_volt,
@@ -1683,7 +1679,7 @@ static int svs_bank_resource_setup(struct svs_platform *svsp)
 			}
 		}
 
-		if (svsb->mode_support & SVSB_MODE_MON) {
+		if (!IS_ERR_OR_NULL(svsb->tzone_name)) {
 			svsb->tzd = thermal_zone_get_zone_by_name(svsb->tzone_name);
 			if (IS_ERR(svsb->tzd)) {
 				dev_err(svsb->dev, "cannot get \"%s\" thermal zone\n",
@@ -2127,6 +2123,7 @@ static struct svs_bank svs_mt8192_banks[] = {
 		.type			= SVSB_LOW,
 		.set_freq_pct		= svs_set_bank_freq_pct_v3,
 		.get_volts		= svs_get_bank_volts_v3,
+		.tzone_name		= "gpu1",
 		.volt_flags		= SVSB_REMOVE_DVTFIXED_VOLT,
 		.mode_support		= SVSB_MODE_INIT02,
 		.opp_count		= MAX_OPP_ENTRIES,
@@ -2144,6 +2141,10 @@ static struct svs_bank svs_mt8192_banks[] = {
 		.core_sel		= 0x0fff0100,
 		.int_st			= BIT(0),
 		.ctl0			= 0x00540003,
+		.tzone_htemp		= 85000,
+		.tzone_htemp_voffset	= 0,
+		.tzone_ltemp		= 25000,
+		.tzone_ltemp_voffset	= 7,
 	},
 	{
 		.sw_id			= SVSB_GPU,
-- 
2.18.0


