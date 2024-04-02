Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6494EC6FD1F
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Apr 2024 03:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0vBahwWBKxm9Zqi/4U7s0wgLmEOJpIkxD6LO1gqtS3s=; b=yG6eZe2P4hAOPsuD9x0OmJWvmN
	HnYnbNe3E8DCgg4yy+9qBqiBU4pgvvgl9Ey/tZqu3Cxnl2S8c+JHViQnR41IsIkBktjLpwqKNtkHk
	sTVglnQOXSayOvYdSrLeOHVGvQ3E2pJffzltHzghctTiE0VTaMUIGHDv2KIvTZ5QK2gguLSYLDkdq
	DW7Gc9SrNvBt/CqMlwV7WlIluZM3L/aMqHpjqTt/t60x0yiHlRUM0tyTq1ooiCHluUmEDWH25Yeew
	rTAUyu9JVpdiAaeP6nbyYDqBGMP964O+GWN+CR1/gqJSa1mh85mu3pH4aiRYi+5V6Pyng3qYietqA
	5feEWFbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrUv6-00000009aeH-3YYv;
	Tue, 02 Apr 2024 03:34:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrUv3-00000009acP-1swO
	for linux-mediatek@bombadil.infradead.org;
	Tue, 02 Apr 2024 03:34:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=0vBahwWBKxm9Zqi/4U7s0wgLmEOJpIkxD6LO1gqtS3s=; b=C+P+xocpnUntSPi5bH1eSq/H2a
	NVNB/qIOYbwvd97MayKkrmf9A5Ooww8OLPvi8d18bFE+cQbPg+J7TjdrE4A8/6ZHUv9/nKxNPPuVP
	hzLWzJB+YZQtWth3tZPVYaRXjYc2MmvM/+fN1qbByhuBYIpFp6y4NUOKFk4w1/qYLek2x8qSVcl2a
	xaZRTsBPb4bscpTSVuYHGA6GBL6Lp2b2NGB/9dt8l/qnc1lyeDRTgPbPX6OCqMYmFggynb8Jf20AT
	5ZzyCAPNr2FN+9uVwSGRrQbvDTSiDcRorh3kTuqEQSktFaiG+YggpCs0jAbADQGcDhtnrUWGPqvXT
	yjDj/qjg==;
Received: from pb-smtp21.pobox.com ([173.228.157.53])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrUuy-00000003POt-0FyD
	for linux-mediatek@lists.infradead.org;
	Tue, 02 Apr 2024 03:34:39 +0000
Received: from pb-smtp21.pobox.com (unknown [127.0.0.1])
	by pb-smtp21.pobox.com (Postfix) with ESMTP id 9EE5321C17;
	Mon,  1 Apr 2024 23:34:27 -0400 (EDT)
	(envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=TMvJLmaQdAXchP52T16QOZkVe
	093s0cyskBiSWdZPys=; b=CUfEyYnBIR1xD0+AKi7wF3HzOfzGWgDvu5smKJAW0
	YzvEgej4zHT/RDVeQCAtGgI97V3kO9AT+kYdksuOS97psBeAvFWBQLxWP3fg/rwi
	EI7ijPfpkILZWaZ0KkP0BID4lT9JwKcdr8LUNTtJWFV4UNWwSGF9emUPt8n/RCW/
	ZE=
Received: from pb-smtp21.sea.icgroup.com (unknown [127.0.0.1])
	by pb-smtp21.pobox.com (Postfix) with ESMTP id 985A721C16;
	Mon,  1 Apr 2024 23:34:27 -0400 (EDT)
	(envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=from:to:cc:subject:date:message-id:in-reply-to:references:mime-version:content-transfer-encoding; s=2016-12.pbsmtp; bh=Uw4s4xwpnw8fBDGMxKEdVacnfouyDQvb2i7AHCBaQls=; b=p6HDfxCWK+RJYFvlTg+yTa6K/e6EEGCK29aDEK7RGPIRXwx9VFotIdA+eULcKpQDps9vYrHgJuYaDIfVGzd1RJcelZPUFjC+GIUZgUFJ5ub5UdjUfhcfCq7+kwn6o+hLbrcoHu13YLTP4vYL1T+rAxKqgizQlI1ylYvhOp4AmMc=
Received: from yoda.fluxnic.net (unknown [24.201.101.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by pb-smtp21.pobox.com (Postfix) with ESMTPSA id 8D73F21C13;
	Mon,  1 Apr 2024 23:34:23 -0400 (EDT)
	(envelope-from nico@fluxnic.net)
Received: from xanadu.lan (OpenWrt.lan [192.168.1.1])
	by yoda.fluxnic.net (Postfix) with ESMTPSA id 57D92C1CED3;
	Mon,  1 Apr 2024 23:27:45 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	linux-pm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: Nicolas Pitre <npitre@baylibre.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 10/15] thermal/drivers/mediatek/lvts_thermal: provision for gt variable location
Date: Mon,  1 Apr 2024 23:25:44 -0400
Message-ID: <20240402032729.2736685-11-nico@fluxnic.net>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240402032729.2736685-1-nico@fluxnic.net>
References: <20240402032729.2736685-1-nico@fluxnic.net>
MIME-Version: 1.0
X-Pobox-Relay-ID: E61A8452-F0A1-11EE-887D-A19503B9AAD1-78420484!pb-smtp21.pobox.com
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_043437_247477_E5A05982 
X-CRM114-Status: GOOD (  14.47  )
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

The golden temperature calibration value in nvram is not always the
3rd byte. A future commit will prove this assumption wrong.

Signed-off-by: Nicolas Pitre <npitre@baylibre.com>
---
 drivers/thermal/mediatek/lvts_thermal.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/me=
diatek/lvts_thermal.c
index 506d52d6ef..00649483bb 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -116,6 +116,7 @@ struct lvts_data {
 	int num_lvts_ctrl;
 	int temp_factor;
 	int temp_offset;
+	int gt_calib_bit_offset;
 };
=20
 struct lvts_sensor {
@@ -743,20 +744,21 @@ static int lvts_calibration_read(struct device *dev=
, struct lvts_domain *lvts_td
 	return 0;
 }
=20
-static int lvts_golden_temp_init(struct device *dev, u8 *calib, int temp=
_offset)
+static int lvts_golden_temp_init(struct device *dev, u8 *calib,
+				 const struct lvts_data *lvts_data)
 {
 	u32 gt;
=20
 	/*
-	 * The golden temp information is contained in the 4th byte (index =3D =
3)
-	 * of efuse data.
+	 * The golden temp information is contained in the first 32-bit
+	 * word  of efuse data at a specific bit offset.
 	 */
-	gt =3D calib[3];
+	gt =3D (((u32 *)calib)[0] >> lvts_data->gt_calib_bit_offset) & 0xff;
=20
 	if (gt && gt < LVTS_GOLDEN_TEMP_MAX)
 		golden_temp =3D gt;
=20
-	golden_temp_offset =3D golden_temp * 500 + temp_offset;
+	golden_temp_offset =3D golden_temp * 500 + lvts_data->temp_offset;
=20
 	return 0;
 }
@@ -775,7 +777,7 @@ static int lvts_ctrl_init(struct device *dev, struct =
lvts_domain *lvts_td,
 	if (ret)
 		return ret;
=20
-	ret =3D lvts_golden_temp_init(dev, lvts_td->calib, lvts_data->temp_offs=
et);
+	ret =3D lvts_golden_temp_init(dev, lvts_td->calib, lvts_data);
 	if (ret)
 		return ret;
=20
@@ -1598,6 +1600,7 @@ static const struct lvts_data mt7988_lvts_ap_data =3D=
 {
 	.num_lvts_ctrl	=3D ARRAY_SIZE(mt7988_lvts_ap_data_ctrl),
 	.temp_factor	=3D LVTS_COEFF_A_MT7988,
 	.temp_offset	=3D LVTS_COEFF_B_MT7988,
+	.gt_calib_bit_offset =3D 24,
 };
=20
 static const struct lvts_data mt8186_lvts_data =3D {
@@ -1605,16 +1608,19 @@ static const struct lvts_data mt8186_lvts_data =3D=
 {
 	.num_lvts_ctrl	=3D ARRAY_SIZE(mt8186_lvts_data_ctrl),
 	.temp_factor	=3D LVTS_COEFF_A_MT7988,
 	.temp_offset	=3D LVTS_COEFF_B_MT7988,
+	.gt_calib_bit_offset =3D 24,
 };
=20
 static const struct lvts_data mt8192_lvts_mcu_data =3D {
 	.lvts_ctrl	=3D mt8192_lvts_mcu_data_ctrl,
 	.num_lvts_ctrl	=3D ARRAY_SIZE(mt8192_lvts_mcu_data_ctrl),
+	.gt_calib_bit_offset =3D 24,
 };
=20
 static const struct lvts_data mt8192_lvts_ap_data =3D {
 	.lvts_ctrl	=3D mt8192_lvts_ap_data_ctrl,
 	.num_lvts_ctrl	=3D ARRAY_SIZE(mt8192_lvts_ap_data_ctrl),
+	.gt_calib_bit_offset =3D 24,
 };
=20
 static const struct lvts_data mt8195_lvts_mcu_data =3D {
@@ -1622,6 +1628,7 @@ static const struct lvts_data mt8195_lvts_mcu_data =
=3D {
 	.num_lvts_ctrl	=3D ARRAY_SIZE(mt8195_lvts_mcu_data_ctrl),
 	.temp_factor	=3D LVTS_COEFF_A_MT8195,
 	.temp_offset	=3D LVTS_COEFF_B_MT8195,
+	.gt_calib_bit_offset =3D 24,
 };
=20
 static const struct lvts_data mt8195_lvts_ap_data =3D {
@@ -1629,6 +1636,7 @@ static const struct lvts_data mt8195_lvts_ap_data =3D=
 {
 	.num_lvts_ctrl	=3D ARRAY_SIZE(mt8195_lvts_ap_data_ctrl),
 	.temp_factor	=3D LVTS_COEFF_A_MT8195,
 	.temp_offset	=3D LVTS_COEFF_B_MT8195,
+	.gt_calib_bit_offset =3D 24,
 };
=20
 static const struct of_device_id lvts_of_match[] =3D {
--=20
2.44.0


