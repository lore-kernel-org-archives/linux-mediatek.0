Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A750ECD4954
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Sep 2023 05:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gq8s2Npu2Vz0jwf1wrspqegc3TXAG46Dv16VsHzTy3g=; b=h0zJ0PTVzn+srWo0pJ2A2DjiR3
	br5F5G1KHdYmVwkXA+3CISPX/AlnMrlriztvFWX7CyfEoBH0swllzw1Q4lzLFH13aGqFDJ2bulvgb
	+wwJPNd11pq3lqVaNvUWnoSV63N+MU+c/fl2i1xZ+2R3JKKTBdHtcMhV9JrRX0s9x0YlaTDLqsjKm
	tRZ7A9bwYHsYyp3d6cjy5MGHaC9kwlAL5/eMxDpWHZb5HsVak4KXFjp3Kaffl+4xPc83TBxn+vzu4
	JNsW/poSky485Ig9u5bMIyN0tr4uYd+f7IfDn8sbP3t/o4i8mt3uitLqHyVgFmE9mF5brShLDI06B
	l9PRgIFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjCDY-005AOs-1i;
	Thu, 21 Sep 2023 05:27:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjCDO-005AKC-1O;
	Thu, 21 Sep 2023 05:27:03 +0000
X-UUID: 7b4b77f8583f11ee86758d4a7c00f3a0-20230920
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=gq8s2Npu2Vz0jwf1wrspqegc3TXAG46Dv16VsHzTy3g=;
	b=KzzZkDuwt0Ry8r+qO1pKqh4ILb4hUyRyvZNIt7g0SGVuRAZLd4qlbQ2pl/s+4pkpue6gylOs36/8xqSR+6n0vPe2g0zrwsRZdMEtDzqnmCDF+5SqO+S6QZtLjfPM/gUx4n1rTuOuvUqMmCwRWwOGCJYBQX7DkYlqIQKga8HVtS8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:1528fb19-84a2-4196-a26b-93d92b766b7a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:fa1d48c3-1e57-4345-9d31-31ad9818b39f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 7b4b77f8583f11ee86758d4a7c00f3a0-20230920
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <chun-jen.tseng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1050388591; Wed, 20 Sep 2023 22:26:56 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 21 Sep 2023 13:26:39 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 21 Sep 2023 13:26:39 +0800
From: Mark Tseng <chun-jen.tseng@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Roger Lu <roger.lu@mediatek.com>,
	Kevin Hilman <khilman@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<chun-jen.tseng@mediatek.com>
Subject: [PATCH v4 3/3] soc: mediatek: svs: Add support for voltage bins
Date: Thu, 21 Sep 2023 13:26:37 +0800
Message-ID: <20230921052637.30444-4-chun-jen.tseng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230921052637.30444-1-chun-jen.tseng@mediatek.com>
References: <20230921052637.30444-1-chun-jen.tseng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_222702_475123_85848A55 
X-CRM114-Status: GOOD (  15.13  )
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

Add support voltage bins turn point

Signed-off-by: Mark Tseng <chun-jen.tseng@mediatek.com>
---
 drivers/soc/mediatek/mtk-svs.c | 57 +++++++++++++++++++++++++++++++---
 1 file changed, 53 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
index d2ae0b0cf95a..f31e3bedff50 100644
--- a/drivers/soc/mediatek/mtk-svs.c
+++ b/drivers/soc/mediatek/mtk-svs.c
@@ -407,6 +407,7 @@ struct svs_platform_data {
  * @dcbdet: svs efuse data
  * @dcmdet: svs efuse data
  * @turn_pt: 2-line turn point tells which opp_volt calculated by high/low bank
+ * @vbin_turn_pt: voltage bin turn point helps know which svsb_volt should be overridden
  * @type: bank type to represent it is 2-line (high/low) bank or 1-line bank
  *
  * Svs bank will generate suitalbe voltages by below general math equation
@@ -469,6 +470,7 @@ struct svs_bank {
 	u32 dcbdet;
 	u32 dcmdet;
 	u32 turn_pt;
+	u32 vbin_turn_pt;
 	u32 type;
 };
 
@@ -751,11 +753,12 @@ static int svs_status_debug_show(struct seq_file *m, void *v)
 
 	ret = thermal_zone_get_temp(svsb->tzd, &tzone_temp);
 	if (ret)
-		seq_printf(m, "%s: temperature ignore, turn_pt = %u\n",
-			   svsb->name, svsb->turn_pt);
+		seq_printf(m, "%s: temperature ignore, vbin_turn_pt = %u, turn_pt = %u\n",
+			   svsb->name, svsb->vbin_turn_pt, svsb->turn_pt);
 	else
-		seq_printf(m, "%s: temperature = %d, turn_pt = %u\n",
-			   svsb->name, tzone_temp, svsb->turn_pt);
+		seq_printf(m, "%s: temperature = %d, vbin_turn_pt = %u, turn_pt = %u\n",
+			   svsb->name, tzone_temp, svsb->vbin_turn_pt,
+			   svsb->turn_pt);
 
 	for (i = 0; i < svsb->opp_count; i++) {
 		opp = dev_pm_opp_find_freq_exact(svsb->opp_dev,
@@ -952,6 +955,29 @@ static void svs_get_bank_volts_v3(struct svs_platform *svsp)
 	for (i = opp_start; i < opp_stop; i++)
 		if (svsb->volt_flags & SVSB_REMOVE_DVTFIXED_VOLT)
 			svsb->volt[i] -= svsb->dvt_fixed;
+
+	/* For voltage bin support */
+	if (svsb->opp_dfreq[0] > svsb->freq_base) {
+		svsb->volt[0] = svs_opp_volt_to_bank_volt(svsb->opp_dvolt[0],
+							  svsb->volt_step,
+							  svsb->volt_base);
+
+		/* Find voltage bin turn point */
+		for (i = 0; i < svsb->opp_count; i++) {
+			if (svsb->opp_dfreq[i] <= svsb->freq_base) {
+				svsb->vbin_turn_pt = i;
+				break;
+			}
+		}
+
+		/* Override svs bank voltages */
+		for (i = 1; i < svsb->vbin_turn_pt; i++)
+			svsb->volt[i] = interpolate(svsb->freq_pct[0],
+						    svsb->freq_pct[svsb->vbin_turn_pt],
+						    svsb->volt[0],
+						    svsb->volt[svsb->vbin_turn_pt],
+						    svsb->freq_pct[i]);
+	}
 }
 
 static void svs_set_bank_freq_pct_v3(struct svs_platform *svsp)
@@ -1069,6 +1095,29 @@ static void svs_get_bank_volts_v2(struct svs_platform *svsp)
 
 	for (i = 0; i < svsb->opp_count; i++)
 		svsb->volt[i] += svsb->volt_od;
+
+	/* For voltage bin support */
+	if (svsb->opp_dfreq[0] > svsb->freq_base) {
+		svsb->volt[0] = svs_opp_volt_to_bank_volt(svsb->opp_dvolt[0],
+							  svsb->volt_step,
+							  svsb->volt_base);
+
+		/* Find voltage bin turn point */
+		for (i = 0; i < svsb->opp_count; i++) {
+			if (svsb->opp_dfreq[i] <= svsb->freq_base) {
+				svsb->vbin_turn_pt = i;
+				break;
+			}
+		}
+
+		/* Override svs bank voltages */
+		for (i = 1; i < svsb->vbin_turn_pt; i++)
+			svsb->volt[i] = interpolate(svsb->freq_pct[0],
+						    svsb->freq_pct[svsb->vbin_turn_pt],
+						    svsb->volt[0],
+						    svsb->volt[svsb->vbin_turn_pt],
+						    svsb->freq_pct[i]);
+	}
 }
 
 static void svs_set_bank_freq_pct_v2(struct svs_platform *svsp)
-- 
2.18.0


