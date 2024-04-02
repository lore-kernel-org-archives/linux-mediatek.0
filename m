Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AFC7C6FD1F
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Apr 2024 04:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zcZ1XvZurJIxI4ZQKWbpR4Ga1nSS5VfGi/vCmA0KJsY=; b=qqRLJoYlmq5ulbxlulzSeiJLNS
	ZzSSEfMGS8U3AByLXZRkLl2cpftnrR4WRUT8m/VBVoXwH3wThhrQs+M57Rla0DY18beRNnhIks1Dv
	xwmLWra9xCp6/ralXic+OWNQUOwxIIDWckqBhfQ7tOE/o1Xk8Ua+SppGn0NBgmD/NRqhkUpWvi/MC
	pC40G6N3WbVkRlTxiGZk4OJkZ2Iff394I9p6+pfMgt1eubM06aKDpntRqKEPyViEH0FMbNuacHrzW
	cjJNu5RTcI+XamNMGsII/UkLebPJw3wa0RSTUxumywndsVunSZhG5Qg3wgiXtyK/eDd+1z7gc46gd
	wgGZMAiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrW4D-00000009i8E-2wbg;
	Tue, 02 Apr 2024 04:48:13 +0000
Received: from pb-smtp1.pobox.com ([64.147.108.70])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrUun-00000009aTy-0Xte
	for linux-mediatek@lists.infradead.org;
	Tue, 02 Apr 2024 03:34:27 +0000
Received: from pb-smtp1.pobox.com (unknown [127.0.0.1])
	by pb-smtp1.pobox.com (Postfix) with ESMTP id 3A49B1EC042;
	Mon,  1 Apr 2024 23:34:24 -0400 (EDT)
	(envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=fbzduesfoi7WBSbK48nDNOKNv
	y0Xx2fWyeNfaOxED4U=; b=qSVSMIuLeyhuHwd47Wyd/V2tOikGs7RP0kAtezgcN
	W+0AFfXWOYWrfiKIiYhpBI0qRdKnwnlesUGLloWUxWh+m9+9ibguNj0esnPsINPv
	NW/gZhgCrFSWixZ+M893r177Vk642lpkkCsjy6R3xh9dQ0TajE/LTe6fSQjInqw8
	bU=
Received: from pb-smtp1.nyi.icgroup.com (unknown [127.0.0.1])
	by pb-smtp1.pobox.com (Postfix) with ESMTP id 31E091EC041;
	Mon,  1 Apr 2024 23:34:24 -0400 (EDT)
	(envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=from:to:cc:subject:date:message-id:in-reply-to:references:mime-version:content-transfer-encoding; s=2016-12.pbsmtp; bh=O5G071kShCO6ZVBcYtGhvwuX7G84AfatCEHH9aQAkJQ=; b=iktrO/+jKbdkIJSxpdkVueJydOevmqwQzytw3XWutnt7itCcOwaROWzhBu57tkrzAMPJg1lopRYzLEovg0nxPJWUWo+fhYzoYkYev0fmDYtUfrL8OeL5Di7gWVunHOXfcBnv0dGKxIqLiorx5t4r84c00yupOQxsWcK7Ety+Pe0=
Received: from yoda.fluxnic.net (unknown [24.201.101.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by pb-smtp1.pobox.com (Postfix) with ESMTPSA id 8A6391EC040;
	Mon,  1 Apr 2024 23:34:23 -0400 (EDT)
	(envelope-from nico@fluxnic.net)
Received: from xanadu.lan (OpenWrt.lan [192.168.1.1])
	by yoda.fluxnic.net (Postfix) with ESMTPSA id 75E65C1CED5;
	Mon,  1 Apr 2024 23:27:45 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	linux-pm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: Nicolas Pitre <npitre@baylibre.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 11/15] thermal/drivers/mediatek/lvts_thermal: allow early empty sensor slots
Date: Mon,  1 Apr 2024 23:25:45 -0400
Message-ID: <20240402032729.2736685-12-nico@fluxnic.net>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240402032729.2736685-1-nico@fluxnic.net>
References: <20240402032729.2736685-1-nico@fluxnic.net>
MIME-Version: 1.0
X-Pobox-Relay-ID: E618C734-F0A1-11EE-8F40-78DCEB2EC81B-78420484!pb-smtp1.pobox.com
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240401_203425_282632_76F627E2 
X-CRM114-Status: GOOD (  18.45  )
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

Some systems don't always populate sensor controller slots starting
at slot 0. Use a bitmap instead of a count to indicate valid sensor
slots. Also create a pretty iterator for that.

About that iterator: it causes checkpatch to complain with "ERROR:
Macros with multiple statements should be enclosed in a do - while
loop". However this is not possible here. And many similar iterators
do exist using the same form in the tree already.

Signed-off-by: Nicolas Pitre <npitre@baylibre.com>
---
 drivers/thermal/mediatek/lvts_thermal.c | 63 +++++++++++++++----------
 1 file changed, 37 insertions(+), 26 deletions(-)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/me=
diatek/lvts_thermal.c
index 00649483bb..ae0c8f265b 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -107,10 +107,23 @@ struct lvts_ctrl_data {
 	struct lvts_sensor_data lvts_sensor[LVTS_SENSOR_MAX];
 	int cal_offset[LVTS_SENSOR_MAX];
 	int num_lvts_sensor;
+	u8 valid_sensor_mask;
 	int offset;
 	int mode;
 };
=20
+#define VALID_SENSOR_MAP(s0, s1, s2, s3) \
+	.valid_sensor_mask =3D (((s0) ? BIT(0) : 0) | \
+			      ((s1) ? BIT(1) : 0) | \
+			      ((s2) ? BIT(2) : 0) | \
+			      ((s3) ? BIT(3) : 0))
+
+#define lvts_for_each_valid_sensor(i, lvts_ctrl_data) \
+	for ((i) =3D 0; (i) < LVTS_SENSOR_MAX; (i)++) \
+		if (!((lvts_ctrl_data)->valid_sensor_mask & BIT(i))) \
+			continue; \
+		else
+
 struct lvts_data {
 	const struct lvts_ctrl_data *lvts_ctrl;
 	int num_lvts_ctrl;
@@ -134,7 +147,6 @@ struct lvts_ctrl {
 	const struct lvts_data *lvts_data;
 	u32 calibration[LVTS_SENSOR_MAX];
 	u32 hw_tshut_raw_temp;
-	int num_lvts_sensor;
 	int mode;
 	void __iomem *base;
 	int low_thresh;
@@ -346,7 +358,7 @@ static bool lvts_should_update_thresh(struct lvts_ctr=
l *lvts_ctrl, int high)
 	if (high > lvts_ctrl->high_thresh)
 		return true;
=20
-	for (i =3D 0; i < lvts_ctrl->num_lvts_sensor; i++)
+	lvts_for_each_valid_sensor(i, lvts_ctrl->lvts_data->lvts_ctrl)
 		if (lvts_ctrl->sensors[i].high_thresh =3D=3D lvts_ctrl->high_thresh
 		    && lvts_ctrl->sensors[i].low_thresh =3D=3D lvts_ctrl->low_thresh)
 			return false;
@@ -550,6 +562,7 @@ static int lvts_sensor_init(struct device *dev, struc=
t lvts_ctrl *lvts_ctrl,
 					const struct lvts_ctrl_data *lvts_ctrl_data)
 {
 	struct lvts_sensor *lvts_sensor =3D lvts_ctrl->sensors;
+
 	void __iomem *msr_regs[] =3D {
 		LVTS_MSR0(lvts_ctrl->base),
 		LVTS_MSR1(lvts_ctrl->base),
@@ -566,7 +579,7 @@ static int lvts_sensor_init(struct device *dev, struc=
t lvts_ctrl *lvts_ctrl,
=20
 	int i;
=20
-	for (i =3D 0; i < lvts_ctrl_data->num_lvts_sensor; i++) {
+	lvts_for_each_valid_sensor(i, lvts_ctrl_data) {
=20
 		int dt_id =3D lvts_ctrl_data->lvts_sensor[i].dt_id;
=20
@@ -606,8 +619,6 @@ static int lvts_sensor_init(struct device *dev, struc=
t lvts_ctrl *lvts_ctrl,
 		lvts_sensor[i].high_thresh =3D INT_MIN;
 	};
=20
-	lvts_ctrl->num_lvts_sensor =3D lvts_ctrl_data->num_lvts_sensor;
-
 	return 0;
 }
=20
@@ -678,7 +689,7 @@ static int lvts_calibration_init(struct device *dev, =
struct lvts_ctrl *lvts_ctrl
 {
 	int i;
=20
-	for (i =3D 0; i < lvts_ctrl_data->num_lvts_sensor; i++) {
+	lvts_for_each_valid_sensor(i, lvts_ctrl_data) {
 		const struct lvts_sensor_data *sensor =3D
 					&lvts_ctrl_data->lvts_sensor[i];
=20
@@ -1101,7 +1112,7 @@ static int lvts_ctrl_start(struct device *dev, stru=
ct lvts_ctrl *lvts_ctrl)
 	u32 *sensor_bitmap =3D lvts_ctrl->mode =3D=3D LVTS_MSR_IMMEDIATE_MODE ?
 			     sensor_imm_bitmap : sensor_filt_bitmap;
=20
-	for (i =3D 0; i < lvts_ctrl->num_lvts_sensor; i++) {
+	lvts_for_each_valid_sensor(i, lvts_ctrl->lvts_data->lvts_ctrl) {
=20
 		int dt_id =3D lvts_sensors[i].dt_id;
=20
@@ -1324,7 +1335,7 @@ static const struct lvts_ctrl_data mt7988_lvts_ap_d=
ata_ctrl[] =3D {
 			{ .dt_id =3D MT7988_ETH2P5G_1,
 			  .cal_offsets =3D { 0x0c, 0x0d, 0x0e } }
 		},
-		.num_lvts_sensor =3D 4,
+		VALID_SENSOR_MAP(1, 1, 1, 1),
 		.offset =3D 0x0,
 	},
 	{
@@ -1338,7 +1349,7 @@ static const struct lvts_ctrl_data mt7988_lvts_ap_d=
ata_ctrl[] =3D {
 			{ .dt_id =3D MT7988_ETHWARP_1,
 			   .cal_offsets =3D { 0x20, 0x21, 0x22 } }
 		},
-		.num_lvts_sensor =3D 4,
+		VALID_SENSOR_MAP(1, 1, 1, 1),
 		.offset =3D 0x100,
 	}
 };
@@ -1401,7 +1412,7 @@ static const struct lvts_ctrl_data mt8186_lvts_data=
_ctrl[] =3D {
 			{ .dt_id =3D MT8186_CAM,
 			  .cal_offsets =3D { 12, 13, 14 } }
 		},
-		.num_lvts_sensor =3D 4,
+		VALID_SENSOR_MAP(1, 1, 1, 1),
 		.offset =3D 0x0,
 	},
 	{
@@ -1411,7 +1422,7 @@ static const struct lvts_ctrl_data mt8186_lvts_data=
_ctrl[] =3D {
 			{ .dt_id =3D MT8186_BIG_CPU1,
 			  .cal_offsets =3D { 27, 20, 21 } }
 		},
-		.num_lvts_sensor =3D 2,
+		VALID_SENSOR_MAP(1, 1, 0, 0),
 		.offset =3D 0x100,
 	},
 	{
@@ -1423,7 +1434,7 @@ static const struct lvts_ctrl_data mt8186_lvts_data=
_ctrl[] =3D {
 			{ .dt_id =3D MT8186_MFG,
 			  .cal_offsets =3D { 39, 32, 33 } }
 		},
-		.num_lvts_sensor =3D 3,
+		VALID_SENSOR_MAP(1, 1, 1, 0),
 		.offset =3D 0x200,
 	}
 };
@@ -1436,7 +1447,7 @@ static const struct lvts_ctrl_data mt8192_lvts_mcu_=
data_ctrl[] =3D {
 			{ .dt_id =3D MT8192_MCU_BIG_CPU1,
 			  .cal_offsets =3D { 0x08, 0x09, 0x0a } }
 		},
-		.num_lvts_sensor =3D 2,
+		VALID_SENSOR_MAP(1, 1, 0, 0),
 		.offset =3D 0x0,
 		.mode =3D LVTS_MSR_FILTERED_MODE,
 	},
@@ -1447,7 +1458,7 @@ static const struct lvts_ctrl_data mt8192_lvts_mcu_=
data_ctrl[] =3D {
 			{ .dt_id =3D MT8192_MCU_BIG_CPU3,
 			  .cal_offsets =3D { 0x10, 0x11, 0x12 } }
 		},
-		.num_lvts_sensor =3D 2,
+		VALID_SENSOR_MAP(1, 1, 0, 0),
 		.offset =3D 0x100,
 		.mode =3D LVTS_MSR_FILTERED_MODE,
 	},
@@ -1462,7 +1473,7 @@ static const struct lvts_ctrl_data mt8192_lvts_mcu_=
data_ctrl[] =3D {
 			{ .dt_id =3D MT8192_MCU_LITTLE_CPU3,
 			  .cal_offsets =3D { 0x20, 0x21, 0x22 } }
 		},
-		.num_lvts_sensor =3D 4,
+		VALID_SENSOR_MAP(1, 1, 1, 1),
 		.offset =3D 0x200,
 		.mode =3D LVTS_MSR_FILTERED_MODE,
 	}
@@ -1476,7 +1487,7 @@ static const struct lvts_ctrl_data mt8192_lvts_ap_d=
ata_ctrl[] =3D {
 			{ .dt_id =3D MT8192_AP_VPU1,
 			  .cal_offsets =3D { 0x28, 0x29, 0x2a } }
 		},
-		.num_lvts_sensor =3D 2,
+		VALID_SENSOR_MAP(1, 1, 0, 0),
 		.offset =3D 0x0,
 	},
 	{
@@ -1486,7 +1497,7 @@ static const struct lvts_ctrl_data mt8192_lvts_ap_d=
ata_ctrl[] =3D {
 			{ .dt_id =3D MT8192_AP_GPU1,
 			  .cal_offsets =3D { 0x30, 0x31, 0x32 } }
 		},
-		.num_lvts_sensor =3D 2,
+		VALID_SENSOR_MAP(1, 1, 0, 0),
 		.offset =3D 0x100,
 	},
 	{
@@ -1496,7 +1507,7 @@ static const struct lvts_ctrl_data mt8192_lvts_ap_d=
ata_ctrl[] =3D {
 			{ .dt_id =3D MT8192_AP_CAM,
 			  .cal_offsets =3D { 0x38, 0x39, 0x3a } },
 		},
-		.num_lvts_sensor =3D 2,
+		VALID_SENSOR_MAP(1, 1, 0, 0),
 		.offset =3D 0x200,
 	},
 	{
@@ -1508,7 +1519,7 @@ static const struct lvts_ctrl_data mt8192_lvts_ap_d=
ata_ctrl[] =3D {
 			{ .dt_id =3D MT8192_AP_MD2,
 			  .cal_offsets =3D { 0x44, 0x45, 0x46 } }
 		},
-		.num_lvts_sensor =3D 3,
+		VALID_SENSOR_MAP(1, 1, 1, 0),
 		.offset =3D 0x300,
 	}
 };
@@ -1521,7 +1532,7 @@ static const struct lvts_ctrl_data mt8195_lvts_mcu_=
data_ctrl[] =3D {
 			{ .dt_id =3D MT8195_MCU_BIG_CPU1,
 			  .cal_offsets =3D { 0x07, 0x08, 0x09 } }
 		},
-		.num_lvts_sensor =3D 2,
+		VALID_SENSOR_MAP(1, 1, 0, 0),
 		.offset =3D 0x0,
 	},
 	{
@@ -1531,7 +1542,7 @@ static const struct lvts_ctrl_data mt8195_lvts_mcu_=
data_ctrl[] =3D {
 			{ .dt_id =3D MT8195_MCU_BIG_CPU3,
 			  .cal_offsets =3D { 0x10, 0x11, 0x12 } }
 		},
-		.num_lvts_sensor =3D 2,
+		VALID_SENSOR_MAP(1, 1, 0, 0),
 		.offset =3D 0x100,
 	},
 	{
@@ -1545,7 +1556,7 @@ static const struct lvts_ctrl_data mt8195_lvts_mcu_=
data_ctrl[] =3D {
 			{ .dt_id =3D MT8195_MCU_LITTLE_CPU3,
 			  .cal_offsets =3D { 0x1f, 0x20, 0x21 } }
 		},
-		.num_lvts_sensor =3D 4,
+		VALID_SENSOR_MAP(1, 1, 1, 1),
 		.offset =3D 0x200,
 	}
 };
@@ -1558,7 +1569,7 @@ static const struct lvts_ctrl_data mt8195_lvts_ap_d=
ata_ctrl[] =3D {
 			{ .dt_id =3D MT8195_AP_VPU1,
 			  .cal_offsets =3D { 0x28, 0x29, 0x2a } }
 		},
-		.num_lvts_sensor =3D 2,
+		VALID_SENSOR_MAP(1, 1, 0, 0),
 		.offset =3D 0x0,
 	},
 	{
@@ -1568,7 +1579,7 @@ static const struct lvts_ctrl_data mt8195_lvts_ap_d=
ata_ctrl[] =3D {
 			{ .dt_id =3D MT8195_AP_GPU1,
 			  .cal_offsets =3D { 0x31, 0x32, 0x33 } }
 		},
-		.num_lvts_sensor =3D 2,
+		VALID_SENSOR_MAP(1, 1, 0, 0),
 		.offset =3D 0x100,
 	},
 	{
@@ -1580,7 +1591,7 @@ static const struct lvts_ctrl_data mt8195_lvts_ap_d=
ata_ctrl[] =3D {
 			{ .dt_id =3D MT8195_AP_INFRA,
 			  .cal_offsets =3D { 0x3d, 0x3e, 0x3f } }
 		},
-		.num_lvts_sensor =3D 3,
+		VALID_SENSOR_MAP(1, 1, 1, 0),
 		.offset =3D 0x200,
 	},
 	{
@@ -1590,7 +1601,7 @@ static const struct lvts_ctrl_data mt8195_lvts_ap_d=
ata_ctrl[] =3D {
 			{ .dt_id =3D MT8195_AP_CAM1,
 			  .cal_offsets =3D { 0x46, 0x47, 0x48 } }
 		},
-		.num_lvts_sensor =3D 2,
+		VALID_SENSOR_MAP(1, 1, 0, 0),
 		.offset =3D 0x300,
 	}
 };
--=20
2.44.0


