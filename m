Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84269CD1284
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Apr 2024 03:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CZPyvfkY2HahbLv/xUVs4jtm5LJzrZcp2Nuzp5+b34I=; b=vrtK2igpIYmUdVZSyvvIfEY9TE
	+BAoOPskSfRymGljz1DxJx+spZJuDHo+8r50DblEbuTS3SkuNlou+1Q+hCDD9zbNFLbJWYCarR8Wd
	H6TOBYty0UXxndiHdgU2mDFHJvtrQssGycErD9YZW9n5wos7t0OAjF8bYQdX6Vk0dUMXKdlPNy2nk
	TKfiZrDRmjU991UUgQcSPqYi8ql8EmClVH77i0G1SzTrW2w5bebaawr46g+9KrDCJJoZDBXrS/EGe
	CxJGe3hH5MPolmMuZivay3PnC+rOA6KVWzyxZMhOZfm7SXKh/ldNBWikD6IZyl/Lc79ddqPJcWpZk
	gqJJwLDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrUut-00000009aXg-0QwG;
	Tue, 02 Apr 2024 03:34:31 +0000
Received: from pb-smtp21.pobox.com ([173.228.157.53])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrUuq-00000009aUm-1Ufo
	for linux-mediatek@lists.infradead.org;
	Tue, 02 Apr 2024 03:34:29 +0000
Received: from pb-smtp21.pobox.com (unknown [127.0.0.1])
	by pb-smtp21.pobox.com (Postfix) with ESMTP id 77BB321C15;
	Mon,  1 Apr 2024 23:34:27 -0400 (EDT)
	(envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=IqJiLrulYlpNtCg8mChAf2NBO
	YoJ0RGtcmUyL8xOrHQ=; b=R7P1YvFjFx3660XkbQ/L7d2xjyIML0k1CmumDrYqk
	clktTH2Dp4mUk4a1DaVLNMzbjdCEa1BGgQO4C8YMRAVPDHCDtz9JuQfvPwBo/mJa
	2F3NVEeZJbEZHj+3W6cf7AA8D9rHe6SJNAsrjN4k/MOgGzeDYw9MX+K22lU6YV5N
	vc=
Received: from pb-smtp21.sea.icgroup.com (unknown [127.0.0.1])
	by pb-smtp21.pobox.com (Postfix) with ESMTP id 70F8421C14;
	Mon,  1 Apr 2024 23:34:27 -0400 (EDT)
	(envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=from:to:cc:subject:date:message-id:in-reply-to:references:mime-version:content-transfer-encoding; s=2016-12.pbsmtp; bh=Zm343rmGZF/3SJuRC/MyQdESFF3eyLbHCgLzOuQXjJg=; b=cObrKU8aVRwKhInivyVQYp3Wvzial3limUTYXD+Xa31JXwyTLcXV2FOk9LvHH6Rt3STPXn9a1/70itYIUymdtcgajrP3y5x0N19Ici/HnTG9Au7yrcOYDWWGcfc14Z7Ch5+L+lwLt2fFzXwd6Ld5wXNHOYRBPTuijtmz9crPAOM=
Received: from yoda.fluxnic.net (unknown [24.201.101.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by pb-smtp21.pobox.com (Postfix) with ESMTPSA id 7230221C12;
	Mon,  1 Apr 2024 23:34:23 -0400 (EDT)
	(envelope-from nico@fluxnic.net)
Received: from xanadu.lan (OpenWrt.lan [192.168.1.1])
	by yoda.fluxnic.net (Postfix) with ESMTPSA id 2F711C1CED1;
	Mon,  1 Apr 2024 23:27:45 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	linux-pm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: Nicolas Pitre <npitre@baylibre.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 08/15] thermal/drivers/mediatek/lvts_thermal: add MT8186 support
Date: Mon,  1 Apr 2024 23:25:42 -0400
Message-ID: <20240402032729.2736685-9-nico@fluxnic.net>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240402032729.2736685-1-nico@fluxnic.net>
References: <20240402032729.2736685-1-nico@fluxnic.net>
MIME-Version: 1.0
X-Pobox-Relay-ID: E6096D98-F0A1-11EE-95BD-A19503B9AAD1-78420484!pb-smtp21.pobox.com
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240401_203428_453131_32E0A981 
X-CRM114-Status: GOOD (  14.03  )
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
 drivers/thermal/mediatek/lvts_thermal.c | 61 +++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/me=
diatek/lvts_thermal.c
index 03ef5b627c..506d52d6ef 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -1373,6 +1373,59 @@ static int lvts_resume(struct device *dev)
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
+			{ .dt_id =3D MT8186_LITTLE_CPU0,
+			  .cal_offsets =3D { 5, 6, 7 } },
+			{ .dt_id =3D MT8186_LITTLE_CPU1,
+			  .cal_offsets =3D { 10, 11, 4 } },
+			{ .dt_id =3D MT8186_LITTLE_CPU2,
+			  .cal_offsets =3D { 15, 8, 9 } },
+			{ .dt_id =3D MT8186_CAM,
+			  .cal_offsets =3D { 12, 13, 14 } }
+		},
+		.num_lvts_sensor =3D 4,
+		.offset =3D 0x0,
+	},
+	{
+		.lvts_sensor =3D {
+			{ .dt_id =3D MT8186_BIG_CPU0,
+			  .cal_offsets =3D { 22, 23, 16 } },
+			{ .dt_id =3D MT8186_BIG_CPU1,
+			  .cal_offsets =3D { 27, 20, 21 } }
+		},
+		.num_lvts_sensor =3D 2,
+		.offset =3D 0x100,
+	},
+	{
+		.lvts_sensor =3D {
+			{ .dt_id =3D MT8186_NNA,
+			  .cal_offsets =3D { 29, 30, 31 } },
+			{ .dt_id =3D MT8186_ADSP,
+			  .cal_offsets =3D { 34, 35, 28 } },
+			{ .dt_id =3D MT8186_MFG,
+			  .cal_offsets =3D { 39, 32, 33 } }
+		},
+		.num_lvts_sensor =3D 3,
+		.offset =3D 0x200,
+	}
+};
+
 static const struct lvts_ctrl_data mt8192_lvts_mcu_data_ctrl[] =3D {
 	{
 		.lvts_sensor =3D {
@@ -1547,6 +1600,13 @@ static const struct lvts_data mt7988_lvts_ap_data =
=3D {
 	.temp_offset	=3D LVTS_COEFF_B_MT7988,
 };
=20
+static const struct lvts_data mt8186_lvts_data =3D {
+	.lvts_ctrl	=3D mt8186_lvts_data_ctrl,
+	.num_lvts_ctrl	=3D ARRAY_SIZE(mt8186_lvts_data_ctrl),
+	.temp_factor	=3D LVTS_COEFF_A_MT7988,
+	.temp_offset	=3D LVTS_COEFF_B_MT7988,
+};
+
 static const struct lvts_data mt8192_lvts_mcu_data =3D {
 	.lvts_ctrl	=3D mt8192_lvts_mcu_data_ctrl,
 	.num_lvts_ctrl	=3D ARRAY_SIZE(mt8192_lvts_mcu_data_ctrl),
@@ -1573,6 +1633,7 @@ static const struct lvts_data mt8195_lvts_ap_data =3D=
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


