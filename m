Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58A88C54E72
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Mar 2024 21:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0AbzRLsu5133ngdBfgYkJLuS9xExxWXqoL0oy5FtJhk=; b=03yNUAKZrZM1xbNIWks+sjkNrM
	cvVD40DJ4xJ9BJLFdpEQKn/JQyrrTPHSVNzK/+iZQ5aDyVOwHFymksMNKClX2F4LRDKcbmxCrG0Up
	/ck2zWjoKgBsfiCFyOowzTK/l7DpP8vlRGHM1tFuvuMJwFT1a435BKgidHvcBK6i8OUWG4kjynnuy
	qH0b11qxtDB1w9uoyrwroyf7n6nPnFfBulpbSwOr+O4tSVysEUF9A2p2dMNzlZUCQVqNUk7KDXdeM
	ViG92XZZcSYQxIKVFWmp8SV0KFLmduIvaX3UDoiFHu9jnTNpEzMEbQda6adL4xrUHkFq8SXv9SOVB
	Q+PvahEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmKTf-0000000ACX7-3Yp4;
	Mon, 18 Mar 2024 21:25:03 +0000
Received: from pb-smtp1.pobox.com ([64.147.108.70])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmKTY-0000000ACS2-3Ej5
	for linux-mediatek@lists.infradead.org;
	Mon, 18 Mar 2024 21:24:59 +0000
Received: from pb-smtp1.pobox.com (unknown [127.0.0.1])
	by pb-smtp1.pobox.com (Postfix) with ESMTP id 3FD031D0E44;
	Mon, 18 Mar 2024 17:24:54 -0400 (EDT)
	(envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=NRwo9Vln+9L3AYcfdiS9/reHq
	DeX3l0K6R/lYc7v1ik=; b=aQFgprxngC/Rn/10nhlw1oVch6Dn0mRM5o4o7xgyj
	+ee5d8YWrLB8+is2ho0IzUO4OBDHOUpA5feQooRy0FZGYo4vD8kUSEQJdwj1KP9L
	YR3MKz8ImiEXCSA75QP8rs1NV6ewD2+fG3c0iNC34kdFkRQobYRfWUJWbUPW16CI
	6Y=
Received: from pb-smtp1.nyi.icgroup.com (unknown [127.0.0.1])
	by pb-smtp1.pobox.com (Postfix) with ESMTP id 36B791D0E42;
	Mon, 18 Mar 2024 17:24:54 -0400 (EDT)
	(envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=from:to:cc:subject:date:message-id:in-reply-to:references:mime-version:content-transfer-encoding; s=2016-12.pbsmtp; bh=N0Nl6TLUEQI4e98b3Ctp81RTv3wlY+4A3uV4RXxt404=; b=ZTQut1rv3FR1K8TB0we8xuPK6hsi2IJgaZqvZ+d2u94VJXMboyPWos7NJdzJAhWRmaqDBGv5qVD49UoQD6+zv3GxNBnT0TKQw3vJp0cz4fr+W0UIDQ5W+S2p3quusZcLaAdkMvWONffkFkD8qC9Ly1YAkDyHZ1NUxUTH0iw8EWw=
Received: from yoda.fluxnic.net (unknown [24.201.101.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by pb-smtp1.pobox.com (Postfix) with ESMTPSA id 8F5401D0E40;
	Mon, 18 Mar 2024 17:24:53 -0400 (EDT)
	(envelope-from nico@fluxnic.net)
Received: from xanadu.lan (OpenWrt.lan [192.168.1.1])
	by yoda.fluxnic.net (Postfix) with ESMTPSA id B1A66BE2BAC;
	Mon, 18 Mar 2024 17:24:50 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	linux-pm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: Nicolas Pitre <npitre@baylibre.com>
Subject: [PATCH v2 10/13] thermal/drivers/mediatek/lvts_thermal: allow early empty sensor slots
Date: Mon, 18 Mar 2024 17:22:12 -0400
Message-ID: <20240318212428.3843952-11-nico@fluxnic.net>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240318212428.3843952-1-nico@fluxnic.net>
References: <20240318212428.3843952-1-nico@fluxnic.net>
MIME-Version: 1.0
X-Pobox-Relay-ID: F5F9CC32-E56D-11EE-903B-78DCEB2EC81B-78420484!pb-smtp1.pobox.com
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_142457_030331_7851C072 
X-CRM114-Status: GOOD (  18.87  )
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
 drivers/thermal/mediatek/lvts_thermal.c | 64 ++++++++++++++-----------
 1 file changed, 37 insertions(+), 27 deletions(-)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/me=
diatek/lvts_thermal.c
index b20b70fd36..a23a93fc82 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -110,12 +110,24 @@ struct lvts_sensor_data {
=20
 struct lvts_ctrl_data {
 	struct lvts_sensor_data lvts_sensor[LVTS_SENSOR_MAX];
+	u8 valid_sensor_mask;
 	int hw_tshut_temp;
-	int num_lvts_sensor;
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
@@ -139,7 +151,6 @@ struct lvts_ctrl {
 	const struct lvts_data *lvts_data;
 	u32 calibration[LVTS_SENSOR_MAX];
 	u32 hw_tshut_raw_temp;
-	int num_lvts_sensor;
 	int mode;
 	void __iomem *base;
 	int low_thresh;
@@ -351,7 +362,7 @@ static bool lvts_should_update_thresh(struct lvts_ctr=
l *lvts_ctrl, int high)
 	if (high > lvts_ctrl->high_thresh)
 		return true;
=20
-	for (i =3D 0; i < lvts_ctrl->num_lvts_sensor; i++)
+	lvts_for_each_valid_sensor(i, lvts_ctrl->lvts_data->lvts_ctrl)
 		if (lvts_ctrl->sensors[i].high_thresh =3D=3D lvts_ctrl->high_thresh
 		    && lvts_ctrl->sensors[i].low_thresh =3D=3D lvts_ctrl->low_thresh)
 			return false;
@@ -555,6 +566,7 @@ static int lvts_sensor_init(struct device *dev, struc=
t lvts_ctrl *lvts_ctrl,
 					const struct lvts_ctrl_data *lvts_ctrl_data)
 {
 	struct lvts_sensor *lvts_sensor =3D lvts_ctrl->sensors;
+
 	void __iomem *msr_regs[] =3D {
 		LVTS_MSR0(lvts_ctrl->base),
 		LVTS_MSR1(lvts_ctrl->base),
@@ -571,7 +583,7 @@ static int lvts_sensor_init(struct device *dev, struc=
t lvts_ctrl *lvts_ctrl,
=20
 	int i;
=20
-	for (i =3D 0; i < lvts_ctrl_data->num_lvts_sensor; i++) {
+	lvts_for_each_valid_sensor(i, lvts_ctrl_data) {
=20
 		int dt_id =3D lvts_ctrl_data->lvts_sensor[i].dt_id;
=20
@@ -611,8 +623,6 @@ static int lvts_sensor_init(struct device *dev, struc=
t lvts_ctrl *lvts_ctrl,
 		lvts_sensor[i].high_thresh =3D INT_MIN;
 	};
=20
-	lvts_ctrl->num_lvts_sensor =3D lvts_ctrl_data->num_lvts_sensor;
-
 	return 0;
 }
=20
@@ -683,7 +693,7 @@ static int lvts_calibration_init(struct device *dev, =
struct lvts_ctrl *lvts_ctrl
 {
 	int i;
=20
-	for (i =3D 0; i < lvts_ctrl_data->num_lvts_sensor; i++) {
+	lvts_for_each_valid_sensor(i, lvts_ctrl_data) {
 		const struct lvts_sensor_data *sensor =3D
 					&lvts_ctrl_data->lvts_sensor[i];
=20
@@ -1106,7 +1116,7 @@ static int lvts_ctrl_start(struct device *dev, stru=
ct lvts_ctrl *lvts_ctrl)
 	u32 *sensor_bitmap =3D lvts_ctrl->mode =3D=3D LVTS_MSR_IMMEDIATE_MODE ?
 			     sensor_imm_bitmap : sensor_filt_bitmap;
=20
-	for (i =3D 0; i < lvts_ctrl->num_lvts_sensor; i++) {
+	lvts_for_each_valid_sensor(i, lvts_ctrl->lvts_data->lvts_ctrl) {
=20
 		int dt_id =3D lvts_sensors[i].dt_id;
=20
@@ -1329,7 +1339,7 @@ static const struct lvts_ctrl_data mt7988_lvts_ap_d=
ata_ctrl[] =3D {
 			{ .dt_id =3D MT7988_ETH2P5G_1,
 			  .cal_offsets =3D { 0x0c, 0x0d, 0x0e } }
 		},
-		.num_lvts_sensor =3D 4,
+		VALID_SENSOR_MAP(1, 1, 1, 1),
 		.offset =3D 0x0,
 		.hw_tshut_temp =3D LVTS_HW_SHUTDOWN_MT7988,
 	},
@@ -1344,7 +1354,7 @@ static const struct lvts_ctrl_data mt7988_lvts_ap_d=
ata_ctrl[] =3D {
 			{ .dt_id =3D MT7988_ETHWARP_1,
 			   .cal_offsets =3D { 0x20, 0x21, 0x22 } }
 		},
-		.num_lvts_sensor =3D 4,
+		VALID_SENSOR_MAP(1, 1, 1, 1),
 		.offset =3D 0x100,
 		.hw_tshut_temp =3D LVTS_HW_SHUTDOWN_MT7988,
 	}
@@ -1408,7 +1418,7 @@ static const struct lvts_ctrl_data mt8186_lvts_data=
_ctrl[] =3D {
 			{ .dt_id =3D MT8186_TS1_3,
 			  .cal_offsets =3D { 12, 13, 14 } }
 		},
-		.num_lvts_sensor =3D 4,
+		VALID_SENSOR_MAP(1, 1, 1, 1),
 		.offset =3D 0x0,
 		.hw_tshut_temp =3D LVTS_HW_SHUTDOWN_MT8186,
 	},
@@ -1419,7 +1429,7 @@ static const struct lvts_ctrl_data mt8186_lvts_data=
_ctrl[] =3D {
 			{ .dt_id =3D MT8186_TS2_1,
 			  .cal_offsets =3D { 27, 20, 21 } }
 		},
-		.num_lvts_sensor =3D 2,
+		VALID_SENSOR_MAP(1, 1, 0, 0),
 		.offset =3D 0x100,
 		.hw_tshut_temp =3D LVTS_HW_SHUTDOWN_MT8186,
 	},
@@ -1432,7 +1442,7 @@ static const struct lvts_ctrl_data mt8186_lvts_data=
_ctrl[] =3D {
 			{ .dt_id =3D MT8186_TS3_2,
 			  .cal_offsets =3D { 39, 32, 33 } }
 		},
-		.num_lvts_sensor =3D 3,
+		VALID_SENSOR_MAP(1, 1, 1, 0),
 		.offset =3D 0x200,
 		.hw_tshut_temp =3D LVTS_HW_SHUTDOWN_MT8186,
 	}
@@ -1446,7 +1456,7 @@ static const struct lvts_ctrl_data mt8192_lvts_mcu_=
data_ctrl[] =3D {
 			{ .dt_id =3D MT8192_MCU_BIG_CPU1,
 			  .cal_offsets =3D { 0x08, 0x09, 0x0a } }
 		},
-		.num_lvts_sensor =3D 2,
+		VALID_SENSOR_MAP(1, 1, 0, 0),
 		.offset =3D 0x0,
 		.hw_tshut_temp =3D LVTS_HW_SHUTDOWN_MT8192,
 		.mode =3D LVTS_MSR_FILTERED_MODE,
@@ -1458,7 +1468,7 @@ static const struct lvts_ctrl_data mt8192_lvts_mcu_=
data_ctrl[] =3D {
 			{ .dt_id =3D MT8192_MCU_BIG_CPU3,
 			  .cal_offsets =3D { 0x10, 0x11, 0x12 } }
 		},
-		.num_lvts_sensor =3D 2,
+		VALID_SENSOR_MAP(1, 1, 0, 0),
 		.offset =3D 0x100,
 		.hw_tshut_temp =3D LVTS_HW_SHUTDOWN_MT8192,
 		.mode =3D LVTS_MSR_FILTERED_MODE,
@@ -1474,7 +1484,7 @@ static const struct lvts_ctrl_data mt8192_lvts_mcu_=
data_ctrl[] =3D {
 			{ .dt_id =3D MT8192_MCU_LITTLE_CPU3,
 			  .cal_offsets =3D { 0x20, 0x21, 0x22 } }
 		},
-		.num_lvts_sensor =3D 4,
+		VALID_SENSOR_MAP(1, 1, 1, 1),
 		.offset =3D 0x200,
 		.hw_tshut_temp =3D LVTS_HW_SHUTDOWN_MT8192,
 		.mode =3D LVTS_MSR_FILTERED_MODE,
@@ -1489,7 +1499,7 @@ static const struct lvts_ctrl_data mt8192_lvts_ap_d=
ata_ctrl[] =3D {
 			{ .dt_id =3D MT8192_AP_VPU1,
 			  .cal_offsets =3D { 0x28, 0x29, 0x2a } }
 		},
-		.num_lvts_sensor =3D 2,
+		VALID_SENSOR_MAP(1, 1, 0, 0),
 		.offset =3D 0x0,
 		.hw_tshut_temp =3D LVTS_HW_SHUTDOWN_MT8192,
 	},
@@ -1500,7 +1510,7 @@ static const struct lvts_ctrl_data mt8192_lvts_ap_d=
ata_ctrl[] =3D {
 			{ .dt_id =3D MT8192_AP_GPU1,
 			  .cal_offsets =3D { 0x30, 0x31, 0x32 } }
 		},
-		.num_lvts_sensor =3D 2,
+		VALID_SENSOR_MAP(1, 1, 0, 0),
 		.offset =3D 0x100,
 		.hw_tshut_temp =3D LVTS_HW_SHUTDOWN_MT8192,
 	},
@@ -1511,7 +1521,7 @@ static const struct lvts_ctrl_data mt8192_lvts_ap_d=
ata_ctrl[] =3D {
 			{ .dt_id =3D MT8192_AP_CAM,
 			  .cal_offsets =3D { 0x38, 0x39, 0x3a } },
 		},
-		.num_lvts_sensor =3D 2,
+		VALID_SENSOR_MAP(1, 1, 0, 0),
 		.offset =3D 0x200,
 		.hw_tshut_temp =3D LVTS_HW_SHUTDOWN_MT8192,
 	},
@@ -1524,7 +1534,7 @@ static const struct lvts_ctrl_data mt8192_lvts_ap_d=
ata_ctrl[] =3D {
 			{ .dt_id =3D MT8192_AP_MD2,
 			  .cal_offsets =3D { 0x44, 0x45, 0x46 } }
 		},
-		.num_lvts_sensor =3D 3,
+		VALID_SENSOR_MAP(1, 1, 1, 0),
 		.offset =3D 0x300,
 		.hw_tshut_temp =3D LVTS_HW_SHUTDOWN_MT8192,
 	}
@@ -1538,7 +1548,7 @@ static const struct lvts_ctrl_data mt8195_lvts_mcu_=
data_ctrl[] =3D {
 			{ .dt_id =3D MT8195_MCU_BIG_CPU1,
 			  .cal_offsets =3D { 0x07, 0x08, 0x09 } }
 		},
-		.num_lvts_sensor =3D 2,
+		VALID_SENSOR_MAP(1, 1, 0, 0),
 		.offset =3D 0x0,
 		.hw_tshut_temp =3D LVTS_HW_SHUTDOWN_MT8195,
 	},
@@ -1549,7 +1559,7 @@ static const struct lvts_ctrl_data mt8195_lvts_mcu_=
data_ctrl[] =3D {
 			{ .dt_id =3D MT8195_MCU_BIG_CPU3,
 			  .cal_offsets =3D { 0x10, 0x11, 0x12 } }
 		},
-		.num_lvts_sensor =3D 2,
+		VALID_SENSOR_MAP(1, 1, 0, 0),
 		.offset =3D 0x100,
 		.hw_tshut_temp =3D LVTS_HW_SHUTDOWN_MT8195,
 	},
@@ -1564,7 +1574,7 @@ static const struct lvts_ctrl_data mt8195_lvts_mcu_=
data_ctrl[] =3D {
 			{ .dt_id =3D MT8195_MCU_LITTLE_CPU3,
 			  .cal_offsets =3D { 0x1f, 0x20, 0x21 } }
 		},
-		.num_lvts_sensor =3D 4,
+		VALID_SENSOR_MAP(1, 1, 1, 1),
 		.offset =3D 0x200,
 		.hw_tshut_temp =3D LVTS_HW_SHUTDOWN_MT8195,
 	}
@@ -1578,7 +1588,7 @@ static const struct lvts_ctrl_data mt8195_lvts_ap_d=
ata_ctrl[] =3D {
 			{ .dt_id =3D MT8195_AP_VPU1,
 			  .cal_offsets =3D { 0x28, 0x29, 0x2a } }
 		},
-		.num_lvts_sensor =3D 2,
+		VALID_SENSOR_MAP(1, 1, 0, 0),
 		.offset =3D 0x0,
 		.hw_tshut_temp =3D LVTS_HW_SHUTDOWN_MT8195,
 	},
@@ -1589,7 +1599,7 @@ static const struct lvts_ctrl_data mt8195_lvts_ap_d=
ata_ctrl[] =3D {
 			{ .dt_id =3D MT8195_AP_GPU1,
 			  .cal_offsets =3D { 0x31, 0x32, 0x33 } }
 		},
-		.num_lvts_sensor =3D 2,
+		VALID_SENSOR_MAP(1, 1, 0, 0),
 		.offset =3D 0x100,
 		.hw_tshut_temp =3D LVTS_HW_SHUTDOWN_MT8195,
 	},
@@ -1602,7 +1612,7 @@ static const struct lvts_ctrl_data mt8195_lvts_ap_d=
ata_ctrl[] =3D {
 			{ .dt_id =3D MT8195_AP_INFRA,
 			  .cal_offsets =3D { 0x3d, 0x3e, 0x3f } }
 		},
-		.num_lvts_sensor =3D 3,
+		VALID_SENSOR_MAP(1, 1, 1, 0),
 		.offset =3D 0x200,
 		.hw_tshut_temp =3D LVTS_HW_SHUTDOWN_MT8195,
 	},
@@ -1613,7 +1623,7 @@ static const struct lvts_ctrl_data mt8195_lvts_ap_d=
ata_ctrl[] =3D {
 			{ .dt_id =3D MT8195_AP_CAM1,
 			  .cal_offsets =3D { 0x46, 0x47, 0x48 } }
 		},
-		.num_lvts_sensor =3D 2,
+		VALID_SENSOR_MAP(1, 1, 0, 0),
 		.offset =3D 0x300,
 		.hw_tshut_temp =3D LVTS_HW_SHUTDOWN_MT8195,
 	}
--=20
2.44.0


