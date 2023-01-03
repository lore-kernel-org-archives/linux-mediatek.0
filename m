Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0246FC3DA7D
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Jan 2023 12:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7JxZraCjpsatLrwbEdBspSH/du0wNhZBJ69NszFYNqA=; b=3ZD/TB55oYLJ1cM0Q1TL3y9kRB
	sHXZ1rhjtUZPOj6g1gj5nT9DZjnYfa84/bwe8+0J0PM/8/9ck3XxIRmuE2MtFXOzAWZk5nIReHbl5
	FejOiNX863ZWdLUmUek7/IVeF3E0YrPaQintsFyHFC5QGyt9hSrZzS/gCAj104ufsj8DpN0KFQHSV
	n7PRZc40bc5Ns8UG9SiwrFIs7NFHEeFt5CyPgPp0PNboxJSvqForKR4m2SvnQ84n+Yr7jtqyt8qV3
	vGXfb3IMd+M4TxMZQRj01TMlIeVy//WNfySzelt1xGV+qZ8WrtfIPnDoplTOyr0f70oOjcEiZ0mhI
	4+AZcCBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCgAL-001AY9-4o; Tue, 03 Jan 2023 12:13:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCfoZ-00140R-0Z; Tue, 03 Jan 2023 11:50:46 +0000
X-UUID: 2b539d0ad6de4ce4839fe343c7529179-20230103
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=7JxZraCjpsatLrwbEdBspSH/du0wNhZBJ69NszFYNqA=;
	b=enFoLHieuFsb/RwsfYRlWaAnZWfE0VI+3gg5zfJL01fazrEX+a5R1e/SFTc2dubJLgL5/GHPO7ecw08DkSgMHfxgfooX6SmtaSaBXSzqCHlDp263Y6trRilGJwj8gO5SbBoj4Tw50xxuxbyPWaxCQbSIr0TeQBreh4r/KaiaEJg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.16,REQID:11dc2053-55ed-437d-9e69-5b4283c19eb7,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:09771b1,CLOUDID:092a1c8b-8530-4eff-9f77-222cf6e2895b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: 2b539d0ad6de4ce4839fe343c7529179-20230103
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <roger.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1854865655; Tue, 03 Jan 2023 04:50:34 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 3 Jan 2023 19:29:28 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 3 Jan 2023 19:29:28 +0800
From: Roger Lu <roger.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Enric Balletbo Serra
	<eballetbo@gmail.com>, Kevin Hilman <khilman@kernel.org>, Nicolas Boichat
	<drinkcat@google.com>
CC: Fan Chen <fan.chen@mediatek.com>, Roger Lu <roger.lu@mediatek.com>,
	Jia-wei Chang <jia-wei.chang@mediatek.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v3 13/14] soc: mediatek: mtk-svs: add thermal voltage compensation if needed
Date: Tue, 3 Jan 2023 19:29:24 +0800
Message-ID: <20230103112925.16554-14-roger.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230103112925.16554-1-roger.lu@mediatek.com>
References: <20230103112925.16554-1-roger.lu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_035043_114667_1ED83C4A 
X-CRM114-Status: GOOD (  14.32  )
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
index 1b4798a9101c..581bb8373b0c 100644
--- a/drivers/soc/mediatek/mtk-svs.c
+++ b/drivers/soc/mediatek/mtk-svs.c
@@ -585,7 +585,7 @@ static int svs_adjust_pm_opp_volts(struct svs_bank *svsb)
 	}
 
 	/* Get thermal effect */
-	if (svsb->phase == SVSB_PHASE_MON) {
+	if (!IS_ERR_OR_NULL(svsb->tzd)) {
 		ret = thermal_zone_get_temp(svsb->tzd, &tzone_temp);
 		if (ret || (svsb->temp > SVSB_TEMP_UPPER_BOUND &&
 			    svsb->temp < SVSB_TEMP_LOWER_BOUND)) {
@@ -600,7 +600,8 @@ static int svs_adjust_pm_opp_volts(struct svs_bank *svsb)
 			temp_voffset += svsb->tzone_ltemp_voffset;
 
 		/* 2-line bank update all opp volts when running mon mode */
-		if (svsb->type == SVSB_HIGH || svsb->type == SVSB_LOW) {
+		if (svsb->phase == SVSB_PHASE_MON && (svsb->type == SVSB_HIGH ||
+						      svsb->type == SVSB_LOW)) {
 			opp_start = 0;
 			opp_stop = svsb->opp_count;
 		}
@@ -616,11 +617,6 @@ static int svs_adjust_pm_opp_volts(struct svs_bank *svsb)
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
@@ -1714,7 +1710,7 @@ static int svs_bank_resource_setup(struct svs_platform *svsp)
 			}
 		}
 
-		if (svsb->mode_support & SVSB_MODE_MON) {
+		if (!IS_ERR_OR_NULL(svsb->tzone_name)) {
 			svsb->tzd = thermal_zone_get_zone_by_name(svsb->tzone_name);
 			if (IS_ERR(svsb->tzd)) {
 				dev_err(svsb->dev, "cannot get \"%s\" thermal zone\n",
@@ -2158,6 +2154,7 @@ static struct svs_bank svs_mt8192_banks[] = {
 		.type			= SVSB_LOW,
 		.set_freq_pct		= svs_set_bank_freq_pct_v3,
 		.get_volts		= svs_get_bank_volts_v3,
+		.tzone_name		= "gpu1",
 		.volt_flags		= SVSB_REMOVE_DVTFIXED_VOLT,
 		.mode_support		= SVSB_MODE_INIT02,
 		.opp_count		= MAX_OPP_ENTRIES,
@@ -2175,6 +2172,10 @@ static struct svs_bank svs_mt8192_banks[] = {
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


