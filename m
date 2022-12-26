Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69710C4167B
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Dec 2022 09:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q48BiG3GA6a/FVMi7I3tyjbzYJB8krFyaDYoiGSPB4U=; b=wdyb+DSW5nOWFxwV+Pr1/ncx+m
	l9bqIYGZ06UX2osy/NWthsefDcDtmczZGvlyXyTh3bE1AXeKKq/2qNL4r444Mqst+1AsJ6gncE43N
	hsLzk0+m61rULDcM2QjJSrxaqtNAXbAdcFdA3Sk8OcmV4alk5m6yNBa27blddC3wgN7jDnZgUZ/YA
	9bV18Y+nq+FwpU8cYqrsdeuHiUCeB9L5ItS2CFs2OJkGsyIrFDgFnr3ylD1Kd6se5sB1zOsHNijr/
	vPHFSrPic4c0GOYyXh/5MgjpdH2CGWM/lNnK0df/Di+U+WbgceG+i8jiLdLqsvokNrQmYRrZIc5zV
	MAaximYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9k2l-002vPt-Ie; Mon, 26 Dec 2022 09:45:15 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9k19-002uJT-3q; Mon, 26 Dec 2022 09:43:37 +0000
X-UUID: d8b70e902635441fb5b9782ff12791dc-20221226
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=q48BiG3GA6a/FVMi7I3tyjbzYJB8krFyaDYoiGSPB4U=;
	b=WUcS2FXt9PShfesWS9q1/xYqkgIFUZQxgTm43PZMPH6l7r0gLKG5ADhfvh5wojskWOp57KN79GSz1M+ADzsn7TnyKrCWeOd7q9wu9j82lRUdcGqJgoJdNosqbXeL2kfxbcNh4qpGRPviut/Ksz5Z6ObBLR1pm2AO/sZR0BSxJhc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:fd2aa1a0-4077-4c9e-8e60-8628b7d48f81,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:dcaaed0,CLOUDID:301b6a8a-8530-4eff-9f77-222cf6e2895b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: d8b70e902635441fb5b9782ff12791dc-20221226
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <roger.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 863986999; Mon, 26 Dec 2022 02:43:28 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Mon, 26 Dec 2022 17:42:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Mon, 26 Dec 2022 17:42:51 +0800
From: Roger Lu <roger.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Enric Balletbo Serra
	<eballetbo@gmail.com>, Kevin Hilman <khilman@kernel.org>, Nicolas Boichat
	<drinkcat@google.com>
CC: Fan Chen <fan.chen@mediatek.com>, Roger Lu <roger.lu@mediatek.com>,
	Jia-wei Chang <jia-wei.chang@mediatek.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v1 11/13] soc: mediatek: mtk-svs: add thermal voltage compensation if needed
Date: Mon, 26 Dec 2022 17:42:46 +0800
Message-ID: <20221226094248.4506-12-roger.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221226094248.4506-1-roger.lu@mediatek.com>
References: <20221226094248.4506-1-roger.lu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221226_014335_225993_A09F5AC6 
X-CRM114-Status: GOOD (  12.91  )
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
---
 drivers/soc/mediatek/mtk-svs.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
index 3a2be5ced8e6..dacfee4a0b32 100644
--- a/drivers/soc/mediatek/mtk-svs.c
+++ b/drivers/soc/mediatek/mtk-svs.c
@@ -557,7 +557,7 @@ static int svs_adjust_pm_opp_volts(struct svs_bank *svsb)
 	}
 
 	/* Get thermal effect */
-	if (svsb->phase == SVSB_PHASE_MON) {
+	if (!IS_ERR_OR_NULL(svsb->tzd)) {
 		ret = thermal_zone_get_temp(svsb->tzd, &tzone_temp);
 		if (ret || (svsb->temp > SVSB_TEMP_UPPER_BOUND &&
 			    svsb->temp < SVSB_TEMP_LOWER_BOUND)) {
@@ -572,7 +572,8 @@ static int svs_adjust_pm_opp_volts(struct svs_bank *svsb)
 			temp_voffset += svsb->tzone_ltemp_voffset;
 
 		/* 2-line bank update all opp volts when running mon mode */
-		if (svsb->type == SVSB_HIGH || svsb->type == SVSB_LOW) {
+		if (svsb->phase == SVSB_PHASE_MON && (svsb->type == SVSB_HIGH ||
+						      svsb->type == SVSB_LOW)) {
 			opp_start = 0;
 			opp_stop = svsb->opp_count;
 		}
@@ -588,11 +589,6 @@ static int svs_adjust_pm_opp_volts(struct svs_bank *svsb)
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
@@ -1680,7 +1676,7 @@ static int svs_bank_resource_setup(struct svs_platform *svsp)
 			}
 		}
 
-		if (svsb->mode_support & SVSB_MODE_MON) {
+		if (!IS_ERR_OR_NULL(svsb->tzone_name)) {
 			svsb->tzd = thermal_zone_get_zone_by_name(svsb->tzone_name);
 			if (IS_ERR(svsb->tzd)) {
 				dev_err(svsb->dev, "cannot get \"%s\" thermal zone\n",
@@ -2124,6 +2120,7 @@ static struct svs_bank svs_mt8192_banks[] = {
 		.type			= SVSB_LOW,
 		.set_freq_pct		= svs_set_bank_freq_pct_v3,
 		.get_volts		= svs_get_bank_volts_v3,
+		.tzone_name		= "gpu1",
 		.volt_flags		= SVSB_REMOVE_DVTFIXED_VOLT,
 		.mode_support		= SVSB_MODE_INIT02,
 		.opp_count		= MAX_OPP_ENTRIES,
@@ -2141,6 +2138,10 @@ static struct svs_bank svs_mt8192_banks[] = {
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


