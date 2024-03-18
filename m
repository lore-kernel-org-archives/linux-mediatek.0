Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16A04C54E69
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Mar 2024 21:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=khNyPzdzUwxJT9r+BjBAZWWR71jDW41R6nZDuV2NAOA=; b=MAXxTJPpgX5AIciVe8xMjSNVIS
	XRdVFY9pY0w0Vv88etp/MhezKg3GVcym4BS94d5Y6EKy6cKUrHlVdTvXNgjzE4m+T6Gzk/Is19cCa
	CPWsf0c+MqDFJhqSWZjM6rbXia+pYWOysJCglo7AaTp5bqxMmTfX4/34VdqMMw1FFW4zeRWtHe/+n
	SDpxUp8Nk64IKTiYrpMVbxBkoil6gx1KeCGV2FlOLt62PouV5odk9NBX6bLb/MP/i+VJx8XX6+BDk
	JA8xCGPcvjwZ/3e9fZZmJU0/GwNsLPH4znIeGHWFxOawO0R5gXPNBNEgPf125gVvadFBdzgUyAKnL
	kY32nRNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmKTc-0000000ACVW-3idQ;
	Mon, 18 Mar 2024 21:25:00 +0000
Received: from pb-smtp2.pobox.com ([64.147.108.71])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmKTY-0000000ACRz-2Kcq
	for linux-mediatek@lists.infradead.org;
	Mon, 18 Mar 2024 21:24:58 +0000
Received: from pb-smtp2.pobox.com (unknown [127.0.0.1])
	by pb-smtp2.pobox.com (Postfix) with ESMTP id DF5841EA51B;
	Mon, 18 Mar 2024 17:24:52 -0400 (EDT)
	(envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=PF4F+WZxQguweGUDyJuo+DxyL
	q1Bma2dXu/r9mtnJzc=; b=OL4BpX+ipXpbuJzuMqmyK9CKWLbkvUMBKkKKEV4R7
	jD6kYE7jXH5D2wyvSIDTNgOobYjxnBvGnQUOIReOBZ2MBFgqd3fyJAPbclhq72Kp
	ZcmqYL5lAB3CLqiUZ6fiUJkKY9ipnYOHPnMpEbGBj0LT6NrrKHSjZy1RwmlLagtO
	bQ=
Received: from pb-smtp2.nyi.icgroup.com (unknown [127.0.0.1])
	by pb-smtp2.pobox.com (Postfix) with ESMTP id D78461EA51A;
	Mon, 18 Mar 2024 17:24:52 -0400 (EDT)
	(envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=from:to:cc:subject:date:message-id:in-reply-to:references:mime-version:content-transfer-encoding; s=2016-12.pbsmtp; bh=GqLLEauH127/GbjEIjqH3xblMmqoKZilokx5Leofrqo=; b=XFTfbDTsjue6uqlmAcdtJfKWefvoDI3Q0CxB8wUbA0K+20w6YtJM5H7XpyVdQET5kX1EhTdVpUabOdUj2uF/3oJv3g0x84vix1ps1MqpD2nyTLSm6t3L99pYUc271DONR/6AEZ7b+AEwUry/EYmafj5nqZRNBjvaXkjPU0Y0qsI=
Received: from yoda.fluxnic.net (unknown [24.201.101.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by pb-smtp2.pobox.com (Postfix) with ESMTPSA id 489361EA517;
	Mon, 18 Mar 2024 17:24:52 -0400 (EDT)
	(envelope-from nico@fluxnic.net)
Received: from xanadu.lan (OpenWrt.lan [192.168.1.1])
	by yoda.fluxnic.net (Postfix) with ESMTPSA id 645F2BE2BA8;
	Mon, 18 Mar 2024 17:24:50 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	linux-pm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: Nicolas Pitre <npitre@baylibre.com>
Subject: [PATCH v2 07/13] thermal/drivers/mediatek/lvts_thermal: add MT8186 support
Date: Mon, 18 Mar 2024 17:22:09 -0400
Message-ID: <20240318212428.3843952-8-nico@fluxnic.net>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240318212428.3843952-1-nico@fluxnic.net>
References: <20240318212428.3843952-1-nico@fluxnic.net>
MIME-Version: 1.0
X-Pobox-Relay-ID: F5357760-E56D-11EE-B362-25B3960A682E-78420484!pb-smtp2.pobox.com
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_142456_706702_C0BE76C6 
X-CRM114-Status: GOOD (  15.52  )
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
 drivers/thermal/mediatek/lvts_thermal.c | 67 +++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/me=
diatek/lvts_thermal.c
index ed1888fb24..e923d22c17 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -80,6 +80,8 @@
 #define LVTS_SENSOR_MAX				4
 #define LVTS_GOLDEN_TEMP_MAX		62
 #define LVTS_GOLDEN_TEMP_DEFAULT	50
+#define LVTS_COEFF_A_MT8186			-204650
+#define LVTS_COEFF_B_MT8186			204650
 #define LVTS_COEFF_A_MT8195			-250460
 #define LVTS_COEFF_B_MT8195			250460
 #define LVTS_COEFF_A_MT7988			-204650
@@ -92,6 +94,7 @@
 #define LVTS_MSR_READ_WAIT_US		(LVTS_MSR_READ_TIMEOUT_US / 2)
=20
 #define LVTS_HW_SHUTDOWN_MT7988		105000
+#define LVTS_HW_SHUTDOWN_MT8186		105000
 #define LVTS_HW_SHUTDOWN_MT8192		105000
 #define LVTS_HW_SHUTDOWN_MT8195		105000
=20
@@ -1377,6 +1380,62 @@ static int lvts_resume(struct device *dev)
 	return 0;
 }
=20
+/*
+ * The MT8186 calibration data is stored as packed 3-byte little-endian
+ * values using a weird layout that makes sense only when viewed as a 32=
-bit
+ * hexadecimal word dump. Let's suppose SxBy where x =3D sensor number a=
nd
+ * y =3D byte number where the LSB is y=3D0. We then have:
+ *
+ *   [S0B2-S0B1-S0B0-S1B2] [S1B1-S1B0-S2B2-S2B1] [S2B0-S3B2-S3B1-S3B0]
+ *
+ * However, when considering a byte stream, those appear as follows:
+ *
+ *   [S1B2] [S0B0[ [S0B1] [S0B2] [S2B1] [S2B2] [S1B0] [S1B1] [S3B0] [S3B=
1] [S3B2] [S2B0]
+ *
+ * Hence the rather confusing offsets provided below.
+ */
+static const struct lvts_ctrl_data mt8186_lvts_data_ctrl[] =3D {
+	{
+		.lvts_sensor =3D {
+			{ .dt_id =3D MT8186_TS1_0,
+			  .cal_offsets =3D { 5, 6, 7 } },
+			{ .dt_id =3D MT8186_TS1_1,
+			  .cal_offsets =3D { 10, 11, 4 } },
+			{ .dt_id =3D MT8186_TS1_2,
+			  .cal_offsets =3D { 15, 8, 9 } },
+			{ .dt_id =3D MT8186_TS1_3,
+			  .cal_offsets =3D { 12, 13, 14 } }
+		},
+		.num_lvts_sensor =3D 4,
+		.offset =3D 0x0,
+		.hw_tshut_temp =3D LVTS_HW_SHUTDOWN_MT8186,
+	},
+	{
+		.lvts_sensor =3D {
+			{ .dt_id =3D MT8186_TS2_0,
+			  .cal_offsets =3D { 22, 23, 16 } },
+			{ .dt_id =3D MT8186_TS2_1,
+			  .cal_offsets =3D { 27, 20, 21 } }
+		},
+		.num_lvts_sensor =3D 2,
+		.offset =3D 0x100,
+		.hw_tshut_temp =3D LVTS_HW_SHUTDOWN_MT8186,
+	},
+	{
+		.lvts_sensor =3D {
+			{ .dt_id =3D MT8186_TS3_0,
+			  .cal_offsets =3D { 29, 30, 31 } },
+			{ .dt_id =3D MT8186_TS3_1,
+			  .cal_offsets =3D { 34, 35, 28 } },
+			{ .dt_id =3D MT8186_TS3_2,
+			  .cal_offsets =3D { 39, 32, 33 } }
+		},
+		.num_lvts_sensor =3D 3,
+		.offset =3D 0x200,
+		.hw_tshut_temp =3D LVTS_HW_SHUTDOWN_MT8186,
+	}
+};
+
 static const struct lvts_ctrl_data mt8192_lvts_mcu_data_ctrl[] =3D {
 	{
 		.lvts_sensor =3D {
@@ -1565,6 +1624,13 @@ static const struct lvts_data mt7988_lvts_ap_data =
=3D {
 	.temp_offset	=3D LVTS_COEFF_B_MT7988,
 };
=20
+static const struct lvts_data mt8186_lvts_data =3D {
+	.lvts_ctrl	=3D mt8186_lvts_data_ctrl,
+	.num_lvts_ctrl	=3D ARRAY_SIZE(mt8186_lvts_data_ctrl),
+	.temp_factor	=3D LVTS_COEFF_A_MT8186,
+	.temp_offset	=3D LVTS_COEFF_B_MT8186,
+};
+
 static const struct lvts_data mt8192_lvts_mcu_data =3D {
 	.lvts_ctrl	=3D mt8192_lvts_mcu_data_ctrl,
 	.num_lvts_ctrl	=3D ARRAY_SIZE(mt8192_lvts_mcu_data_ctrl),
@@ -1591,6 +1657,7 @@ static const struct lvts_data mt8195_lvts_ap_data =3D=
 {
=20
 static const struct of_device_id lvts_of_match[] =3D {
 	{ .compatible =3D "mediatek,mt7988-lvts-ap", .data =3D &mt7988_lvts_ap_=
data },
+	{ .compatible =3D "mediatek,mt8186-lvts", .data =3D &mt8186_lvts_data }=
,
 	{ .compatible =3D "mediatek,mt8192-lvts-mcu", .data =3D &mt8192_lvts_mc=
u_data },
 	{ .compatible =3D "mediatek,mt8192-lvts-ap", .data =3D &mt8192_lvts_ap_=
data },
 	{ .compatible =3D "mediatek,mt8195-lvts-mcu", .data =3D &mt8195_lvts_mc=
u_data },
--=20
2.44.0


