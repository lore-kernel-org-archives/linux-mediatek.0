Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12ED1CD4955
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Sep 2023 05:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DRztt0dJ9A8RuVogfdKc7sUF5lM6Wl4xKNWsz2Kfiyg=; b=XcttICqtP6123yDU29QjAs1EXO
	IREYe8jitphaivthRWBFEfSC8NYGlkITzOdXlAb4b+al+XMdzIj1tBlhdlZ6ybyGA7B4huY7hTMsb
	jKENQaj7W3ugc/m1hgi55UoWlsmiSjjtljq24LgacVQeN5vc9QDu1ImfLv1J67SrCUSQWL8Dp6d8C
	wI+7urbm5eQEl/2W1NQ8cggPvz+kS3ymX6SxYbz2Cwi890q9W3mjMpwIbHR0gdKUPpqPbasP5LcwE
	nYV+oNtdcG64qiohpd2c/is9GbVQtlyOT3VNDbWdDtIz41oOC0FHD1xcgzQC5PzEoPj7Zz4B5vZNU
	mCIB9/rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjCDQ-005AMQ-1W;
	Thu, 21 Sep 2023 05:27:04 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjCDM-005AKC-2r;
	Thu, 21 Sep 2023 05:27:02 +0000
X-UUID: 77cf00cc583f11ee86758d4a7c00f3a0-20230920
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=DRztt0dJ9A8RuVogfdKc7sUF5lM6Wl4xKNWsz2Kfiyg=;
	b=liyU2c1m1JGM9xyNitmraY90RxNHdU0KIxwpFnanHA9Pe6461QCBM61+oryzTLv8ZLlKBjAbTkyuUXgvQFpRtzOjV3GW3kTDdIjRcEPX9rFZoLIfazrOQ1NSIMEhUumXDt/+x1T0uAMKzy2IecnSaivf8zleASm9Ic/qfW3aFhk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:baa871cc-2b90-4788-80fa-b970225653ce,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:d31d48c3-1e57-4345-9d31-31ad9818b39f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 77cf00cc583f11ee86758d4a7c00f3a0-20230920
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <chun-jen.tseng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 196309076; Wed, 20 Sep 2023 22:26:51 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
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
Subject: [PATCH v4 2/3] soc: mediatek: svs: Add support for MT8188 SoC
Date: Thu, 21 Sep 2023 13:26:36 +0800
Message-ID: <20230921052637.30444-3-chun-jen.tseng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230921052637.30444-1-chun-jen.tseng@mediatek.com>
References: <20230921052637.30444-1-chun-jen.tseng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--9.945800-8.000000
X-TMASE-MatchedRID: GwmKcylEtt8Z+je+8a5/a38c8oKMbgYY0pVrZbbfikgTF8tEGMn0ovlY
	oV6p/cSxdlrF5BK8CswKDee6oJ8ihU9dh3PRYVY14RtSDjG+z7ChQhstwJ9G4L/A+0D1to6PxVi
	gu5lFVb73Asd/8PeGdX/OPC6s46aMdC+kmKoukpze0loolklf9acJxWZ5/lR8FLXUWU5hGiFynC
	+RoYX/O+LzNWBegCW2xl8lw85EaVQLbigRnpKlKSPzRlrdFGDwlS+LS7CPc8Y4ovxnM3kXzUM56
	5Vek2hG1zkMaxsirfaLl/7MeQ305w==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--9.945800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 25074B410BDE680DF9FA0796F53ACECC46C4AB80961A7723E3214BCA3E42981F2000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_222700_923216_D609CC83 
X-CRM114-Status: GOOD (  18.18  )
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

MT8188 svs gpu uses 2-line high bank and low bank to optimize the
voltage of opp table for higher and lower frequency respectively.

Signed-off-by: Mark Tseng <chun-jen.tseng@mediatek.com>
---
 drivers/soc/mediatek/mtk-svs.c | 127 +++++++++++++++++++++++++++++++++
 1 file changed, 127 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
index 3a2f97cd5272..d2ae0b0cf95a 100644
--- a/drivers/soc/mediatek/mtk-svs.c
+++ b/drivers/soc/mediatek/mtk-svs.c
@@ -1808,6 +1808,66 @@ static bool svs_mt8192_efuse_parsing(struct svs_platform *svsp)
 	return true;
 }
 
+static bool svs_mt8188_efuse_parsing(struct svs_platform *svsp)
+{
+	struct svs_bank *svsb;
+	u32 idx, i, golden_temp;
+	int ret;
+
+	for (i = 0; i < svsp->efuse_max; i++)
+		if (svsp->efuse[i])
+			dev_info(svsp->dev, "M_HW_RES%d: 0x%08x\n",
+				 i, svsp->efuse[i]);
+
+	if (!svsp->efuse[5]) {
+		dev_notice(svsp->dev, "svs_efuse[5] = 0x0?\n");
+		return false;
+	}
+
+	/* Svs efuse parsing */
+	for (idx = 0; idx < svsp->bank_max; idx++) {
+		svsb = &svsp->banks[idx];
+
+		if (svsb->type == SVSB_LOW) {
+			svsb->mtdes = svsp->efuse[5] & GENMASK(7, 0);
+			svsb->bdes = (svsp->efuse[5] >> 16) & GENMASK(7, 0);
+			svsb->mdes = (svsp->efuse[5] >> 24) & GENMASK(7, 0);
+			svsb->dcbdet = (svsp->efuse[15] >> 16) & GENMASK(7, 0);
+			svsb->dcmdet = (svsp->efuse[15] >> 24) & GENMASK(7, 0);
+		} else if (svsb->type == SVSB_HIGH) {
+			svsb->mtdes = svsp->efuse[4] & GENMASK(7, 0);
+			svsb->bdes = (svsp->efuse[4] >> 16) & GENMASK(7, 0);
+			svsb->mdes = (svsp->efuse[4] >> 24) & GENMASK(7, 0);
+			svsb->dcbdet = svsp->efuse[14] & GENMASK(7, 0);
+			svsb->dcmdet = (svsp->efuse[14] >> 8) & GENMASK(7, 0);
+		}
+
+		svsb->vmax += svsb->dvt_fixed;
+	}
+
+	ret = svs_get_efuse_data(svsp, "t-calibration-data",
+				 &svsp->tefuse, &svsp->tefuse_max);
+	if (ret)
+		return false;
+
+	for (i = 0; i < svsp->tefuse_max; i++)
+		if (svsp->tefuse[i] != 0)
+			break;
+
+	if (i == svsp->tefuse_max)
+		golden_temp = 50; /* All thermal efuse data are 0 */
+	else
+		golden_temp = (svsp->tefuse[0] >> 24) & GENMASK(7, 0);
+
+	for (idx = 0; idx < svsp->bank_max; idx++) {
+		svsb = &svsp->banks[idx];
+		svsb->mts = 500;
+		svsb->bts = (((500 * golden_temp + 250460) / 1000) - 25) * 4;
+	}
+
+	return true;
+}
+
 static bool svs_mt8183_efuse_parsing(struct svs_platform *svsp)
 {
 	struct svs_bank *svsb;
@@ -2173,6 +2233,61 @@ static struct svs_bank svs_mt8192_banks[] = {
 	},
 };
 
+static struct svs_bank svs_mt8188_banks[] = {
+	{
+		.sw_id			= SVSB_GPU,
+		.type			= SVSB_LOW,
+		.set_freq_pct		= svs_set_bank_freq_pct_v3,
+		.get_volts		= svs_get_bank_volts_v3,
+		.volt_flags		= SVSB_REMOVE_DVTFIXED_VOLT,
+		.mode_support		= SVSB_MODE_INIT02,
+		.opp_count		= MAX_OPP_ENTRIES,
+		.freq_base		= 640000000,
+		.turn_freq_base		= 640000000,
+		.volt_step		= 6250,
+		.volt_base		= 400000,
+		.vmax			= 0x38,
+		.vmin			= 0x1c,
+		.age_config		= 0x555555,
+		.dc_config		= 0x555555,
+		.dvt_fixed		= 0x1,
+		.vco			= 0x10,
+		.chk_shift		= 0x87,
+		.core_sel		= 0x0fff0000,
+		.int_st			= BIT(0),
+		.ctl0			= 0x00100003,
+	},
+	{
+		.sw_id			= SVSB_GPU,
+		.type			= SVSB_HIGH,
+		.set_freq_pct		= svs_set_bank_freq_pct_v3,
+		.get_volts		= svs_get_bank_volts_v3,
+		.tzone_name		= "gpu1",
+		.volt_flags		= SVSB_REMOVE_DVTFIXED_VOLT |
+					  SVSB_MON_VOLT_IGNORE,
+		.mode_support		= SVSB_MODE_INIT02 | SVSB_MODE_MON,
+		.opp_count		= MAX_OPP_ENTRIES,
+		.freq_base		= 880000000,
+		.turn_freq_base		= 640000000,
+		.volt_step		= 6250,
+		.volt_base		= 400000,
+		.vmax			= 0x38,
+		.vmin			= 0x1c,
+		.age_config		= 0x555555,
+		.dc_config		= 0x555555,
+		.dvt_fixed		= 0x4,
+		.vco			= 0x10,
+		.chk_shift		= 0x87,
+		.core_sel		= 0x0fff0001,
+		.int_st			= BIT(1),
+		.ctl0			= 0x00100003,
+		.tzone_htemp		= 85000,
+		.tzone_htemp_voffset	= 0,
+		.tzone_ltemp		= 25000,
+		.tzone_ltemp_voffset	= 7,
+	},
+};
+
 static struct svs_bank svs_mt8183_banks[] = {
 	{
 		.sw_id			= SVSB_CPU_LITTLE,
@@ -2286,6 +2401,15 @@ static const struct svs_platform_data svs_mt8192_platform_data = {
 	.bank_max = ARRAY_SIZE(svs_mt8192_banks),
 };
 
+static const struct svs_platform_data svs_mt8188_platform_data = {
+	.name = "mt8188-svs",
+	.banks = svs_mt8188_banks,
+	.efuse_parsing = svs_mt8188_efuse_parsing,
+	.probe = svs_mt8192_platform_probe,
+	.regs = svs_regs_v2,
+	.bank_max = ARRAY_SIZE(svs_mt8188_banks),
+};
+
 static const struct svs_platform_data svs_mt8183_platform_data = {
 	.name = "mt8183-svs",
 	.banks = svs_mt8183_banks,
@@ -2299,6 +2423,9 @@ static const struct of_device_id svs_of_match[] = {
 	{
 		.compatible = "mediatek,mt8192-svs",
 		.data = &svs_mt8192_platform_data,
+	}, {
+		.compatible = "mediatek,mt8188-svs",
+		.data = &svs_mt8188_platform_data,
 	}, {
 		.compatible = "mediatek,mt8183-svs",
 		.data = &svs_mt8183_platform_data,
-- 
2.18.0


