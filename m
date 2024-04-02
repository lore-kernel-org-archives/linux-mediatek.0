Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19339CD128D
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Apr 2024 03:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bR5tY7X24i9BYeRSkdJcC9l5cXMG5DMj98uwP/CFYRU=; b=FwQuwrRrlf09YKG/sThzNegS8W
	BEbxg9wcoPuFoCdohVk7HvrrAirAqernGllIPJhD00SF4tXP97thX8wi1KbZqQX/2ZkzN1h2LfDBa
	06+iXq2uI6vm/MrnBN/+sGkoBdD5esrLUvOHucLgogE4gbnACR0FbBXqKPqRhaeuJUUAr2yY3R0si
	4v473vvx2+iqNZQ61CVv0MHvM2ms4bfEmr7wRjFYs6QgjagpAGQVa54fjJ3u0OZKiGaRTuCS4EArU
	C1faxEb/SLMDIuoai0ZrTA2IzUpRRtNiYEMzjgHJJkm6uQcLAweljn80G8rNwxa/L+cd9fkttz0cN
	K8+EThVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrUup-00000009aUl-2SKF;
	Tue, 02 Apr 2024 03:34:27 +0000
Received: from pb-smtp2.pobox.com ([64.147.108.71])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrUul-00000009aTN-3Wrg
	for linux-mediatek@lists.infradead.org;
	Tue, 02 Apr 2024 03:34:25 +0000
Received: from pb-smtp2.pobox.com (unknown [127.0.0.1])
	by pb-smtp2.pobox.com (Postfix) with ESMTP id DA6AF1DBE48;
	Mon,  1 Apr 2024 23:34:22 -0400 (EDT)
	(envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=QMOwqjxnZseTdo4gaCCD68XT9
	06ZpR/cOYPc5z1rVOc=; b=DIwk83uf276YMgVgLkNnV4qepOkOS0oMndYURUxdR
	p808nquf3OglmslwhU82lnrNkcgoU+zyehBBChBMHieR3gD+vmeEAcZbxDFCTMGD
	JqT2A94sijIKmTaFnFGn1c0PsZ8XtNASQeXA1VLKb/8nbfTgbDNewq0Z/hiI530H
	rg=
Received: from pb-smtp2.nyi.icgroup.com (unknown [127.0.0.1])
	by pb-smtp2.pobox.com (Postfix) with ESMTP id D2B3F1DBE47;
	Mon,  1 Apr 2024 23:34:22 -0400 (EDT)
	(envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=from:to:cc:subject:date:message-id:in-reply-to:references:mime-version:content-transfer-encoding; s=2016-12.pbsmtp; bh=z9sLPxyc4NMA8XRGQCFGghPoIcaO7E+YbcLd4Xx7mVs=; b=P1Xe8lrRVtgeyzXwv0kaSDJVmX1JFnvgHi8hsEWhytZPguKTbPiiLcHiLsYL6dlzjEt4oegOLVeJ+ZMwXPxLDnLRKNE1bKYX1MPkw7VfWkcSfnkHhmsbbSGoAPje/QYpccnYdVMgAn++xNHki7tAtjexzJ45gT2klENvl+5rev4=
Received: from yoda.fluxnic.net (unknown [24.201.101.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by pb-smtp2.pobox.com (Postfix) with ESMTPSA id 34EA01DBE44;
	Mon,  1 Apr 2024 23:34:22 -0400 (EDT)
	(envelope-from nico@fluxnic.net)
Received: from xanadu.lan (OpenWrt.lan [192.168.1.1])
	by yoda.fluxnic.net (Postfix) with ESMTPSA id 145F4C1CEDA;
	Mon,  1 Apr 2024 23:27:46 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	linux-pm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: Nicolas Pitre <npitre@baylibre.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 14/15] thermal/drivers/mediatek/lvts_thermal: add MT8188 support
Date: Mon,  1 Apr 2024 23:25:48 -0400
Message-ID: <20240402032729.2736685-15-nico@fluxnic.net>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240402032729.2736685-1-nico@fluxnic.net>
References: <20240402032729.2736685-1-nico@fluxnic.net>
MIME-Version: 1.0
X-Pobox-Relay-ID: E54B4084-F0A1-11EE-9BBD-25B3960A682E-78420484!pb-smtp2.pobox.com
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240401_203424_059607_6969780F 
X-CRM114-Status: GOOD (  12.26  )
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

From: Nicolas Pitre <npitre@baylibre.com>

Various values extracted from the vendor's kernel driver.

Signed-off-by: Nicolas Pitre <npitre@baylibre.com>
---
 drivers/thermal/mediatek/lvts_thermal.c | 96 +++++++++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/me=
diatek/lvts_thermal.c
index ae0c8f265b..03ff5d12e5 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -1439,6 +1439,84 @@ static const struct lvts_ctrl_data mt8186_lvts_dat=
a_ctrl[] =3D {
 	}
 };
=20
+static const struct lvts_ctrl_data mt8188_lvts_mcu_data_ctrl[] =3D {
+	{
+		.lvts_sensor =3D {
+			{ .dt_id =3D MT8188_MCU_LITTLE_CPU0,
+			  .cal_offsets =3D { 22, 23, 24 } },
+			{ .dt_id =3D MT8188_MCU_LITTLE_CPU1,
+			  .cal_offsets =3D { 25, 26, 27 } },
+			{ .dt_id =3D MT8188_MCU_LITTLE_CPU2,
+			  .cal_offsets =3D { 28, 29, 30 } },
+			{ .dt_id =3D MT8188_MCU_LITTLE_CPU3,
+			  .cal_offsets =3D { 31, 32, 33 } },
+		},
+		VALID_SENSOR_MAP(1, 1, 1, 1),
+		.offset =3D 0x0,
+		.mode =3D LVTS_MSR_FILTERED_MODE,
+	},
+	{
+		.lvts_sensor =3D {
+			{ .dt_id =3D MT8188_MCU_BIG_CPU0,
+			  .cal_offsets =3D { 34, 35, 36 } },
+			{ .dt_id =3D MT8188_MCU_BIG_CPU1,
+			  .cal_offsets =3D { 37, 38, 39 } },
+		},
+		VALID_SENSOR_MAP(1, 1, 0, 0),
+		.offset =3D 0x100,
+		.mode =3D LVTS_MSR_FILTERED_MODE,
+	}
+};
+
+static const struct lvts_ctrl_data mt8188_lvts_ap_data_ctrl[] =3D {
+	{
+		.lvts_sensor =3D {
+
+			{ /* unused */ },
+			{ .dt_id =3D MT8188_AP_APU,
+			  .cal_offsets =3D { 40, 41, 42 } },
+		},
+		VALID_SENSOR_MAP(0, 1, 0, 0),
+		.offset =3D 0x0,
+		.mode =3D LVTS_MSR_FILTERED_MODE,
+	},
+	{
+		.lvts_sensor =3D {
+			{ .dt_id =3D MT8188_AP_GPU1,
+			  .cal_offsets =3D { 43, 44, 45 } },
+			{ .dt_id =3D MT8188_AP_GPU2,
+			  .cal_offsets =3D { 46, 47, 48 } },
+			{ .dt_id =3D MT8188_AP_SOC1,
+			  .cal_offsets =3D { 49, 50, 51 } },
+		},
+		VALID_SENSOR_MAP(1, 1, 1, 0),
+		.offset =3D 0x100,
+		.mode =3D LVTS_MSR_FILTERED_MODE,
+	},
+	{
+		.lvts_sensor =3D {
+			{ .dt_id =3D MT8188_AP_SOC2,
+			  .cal_offsets =3D { 52, 53, 54 } },
+			{ .dt_id =3D MT8188_AP_SOC3,
+			  .cal_offsets =3D { 55, 56, 57 } },
+		},
+		VALID_SENSOR_MAP(1, 1, 0, 0),
+		.offset =3D 0x200,
+		.mode =3D LVTS_MSR_FILTERED_MODE,
+	},
+	{
+		.lvts_sensor =3D {
+			{ .dt_id =3D MT8188_AP_CAM1,
+			  .cal_offsets =3D { 58, 59, 60 } },
+			{ .dt_id =3D MT8188_AP_CAM2,
+			  .cal_offsets =3D { 61, 62, 63 } },
+		},
+		VALID_SENSOR_MAP(1, 1, 0, 0),
+		.offset =3D 0x300,
+		.mode =3D LVTS_MSR_FILTERED_MODE,
+	}
+};
+
 static const struct lvts_ctrl_data mt8192_lvts_mcu_data_ctrl[] =3D {
 	{
 		.lvts_sensor =3D {
@@ -1622,6 +1700,22 @@ static const struct lvts_data mt8186_lvts_data =3D=
 {
 	.gt_calib_bit_offset =3D 24,
 };
=20
+static const struct lvts_data mt8188_lvts_mcu_data =3D {
+	.lvts_ctrl	=3D mt8188_lvts_mcu_data_ctrl,
+	.num_lvts_ctrl	=3D ARRAY_SIZE(mt8188_lvts_mcu_data_ctrl),
+	.temp_factor	=3D LVTS_COEFF_A_MT8195,
+	.temp_offset	=3D LVTS_COEFF_B_MT8195,
+	.gt_calib_bit_offset =3D 20,
+};
+
+static const struct lvts_data mt8188_lvts_ap_data =3D {
+	.lvts_ctrl	=3D mt8188_lvts_ap_data_ctrl,
+	.num_lvts_ctrl	=3D ARRAY_SIZE(mt8188_lvts_ap_data_ctrl),
+	.temp_factor	=3D LVTS_COEFF_A_MT8195,
+	.temp_offset	=3D LVTS_COEFF_B_MT8195,
+	.gt_calib_bit_offset =3D 20,
+};
+
 static const struct lvts_data mt8192_lvts_mcu_data =3D {
 	.lvts_ctrl	=3D mt8192_lvts_mcu_data_ctrl,
 	.num_lvts_ctrl	=3D ARRAY_SIZE(mt8192_lvts_mcu_data_ctrl),
@@ -1653,6 +1747,8 @@ static const struct lvts_data mt8195_lvts_ap_data =3D=
 {
 static const struct of_device_id lvts_of_match[] =3D {
 	{ .compatible =3D "mediatek,mt7988-lvts-ap", .data =3D &mt7988_lvts_ap_=
data },
 	{ .compatible =3D "mediatek,mt8186-lvts", .data =3D &mt8186_lvts_data }=
,
+	{ .compatible =3D "mediatek,mt8188-lvts-mcu", .data =3D &mt8188_lvts_mc=
u_data },
+	{ .compatible =3D "mediatek,mt8188-lvts-ap", .data =3D &mt8188_lvts_ap_=
data },
 	{ .compatible =3D "mediatek,mt8192-lvts-mcu", .data =3D &mt8192_lvts_mc=
u_data },
 	{ .compatible =3D "mediatek,mt8192-lvts-ap", .data =3D &mt8192_lvts_ap_=
data },
 	{ .compatible =3D "mediatek,mt8195-lvts-mcu", .data =3D &mt8195_lvts_mc=
u_data },
--=20
2.44.0


