Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C05DC54E78
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Mar 2024 21:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L1K23FuuTV5VHeaTt42MhGsnLBiJuIpT6xgc7PQyM4c=; b=yrNHcSggdw6IYqMN9QSs7fKiE9
	qXaj3KCdkYSdkFWQQoWsZ90+5JLSeQ67buOL2vz7Ul+pcxTSjcY8a5jeFFcpq4h7gtRwpWkkcXgwB
	8SblLOGnNmINJHmVqvRzFj/c+LQ5Ahd9k2pXAWhZJemh87DiHx19Rf8/ziCjAvFlzfdzLM6U8ikW2
	Kt9NgcXT/K8z0SstG5ewS2j6TwXHdbF0SAafzEFMsol02ZqnLniyjUSVGKRMibwUMbl5wlUqd2Axf
	m7aOi0S4FxMmg0V+73Mpek4i2c9gFdjCx0oswK1ftfsyZDVNWODifDnmEnhsLD3fAM0UYxiqjldFe
	E1BmkX9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmKTh-0000000ACZ5-3vAn;
	Mon, 18 Mar 2024 21:25:05 +0000
Received: from pb-smtp20.pobox.com ([173.228.157.52])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmKTa-0000000ACTT-0ZiY
	for linux-mediatek@lists.infradead.org;
	Mon, 18 Mar 2024 21:25:00 +0000
Received: from pb-smtp20.pobox.com (unknown [127.0.0.1])
	by pb-smtp20.pobox.com (Postfix) with ESMTP id 61DB8234E0;
	Mon, 18 Mar 2024 17:24:56 -0400 (EDT)
	(envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=Bjv2P+61XQPEqT6lVf4eRxVx7
	9OzsAj5yTNR+sS4hrg=; b=dgPA6KcQXoR+ae7VlKlSIHTpdy93mXhXFgFm6CNCj
	DXxAcOwCZUOVnb/N+2OM2DXEfnKvg2t06s3aCCk3778lFRze4FcNZQvn6fuvywil
	IgaE3LxN/BIG9I/i4WkNF6zEcVmEdP+tMVgPy7MzCM+QF3bXpiuMst71tMCUpUuM
	kI=
Received: from pb-smtp20.sea.icgroup.com (unknown [127.0.0.1])
	by pb-smtp20.pobox.com (Postfix) with ESMTP id 5AFE3234DF;
	Mon, 18 Mar 2024 17:24:56 -0400 (EDT)
	(envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=from:to:cc:subject:date:message-id:in-reply-to:references:mime-version:content-transfer-encoding; s=2016-12.pbsmtp; bh=/RrO7s7tsRXTPBWfOSB1biNj4HF7T7Aw2q9sB1QcWE4=; b=gkonbgLeLhi0NeChhoSdIEm2clxyW8Pb17td+M/wZDp2T5W/K6pqXo7esx4AQpfjYURHr01kNzLBjM7/WRoK9kxCIj5uGvqBdU/zQXdduf2cVU76VhBKSeWjcAEuAFaLO+rasezwaEMgimRWLRDu/njGRuZLAImx67H27fpCBXM=
Received: from yoda.fluxnic.net (unknown [24.201.101.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by pb-smtp20.pobox.com (Postfix) with ESMTPSA id 52E21234DA;
	Mon, 18 Mar 2024 17:24:52 -0400 (EDT)
	(envelope-from nico@fluxnic.net)
Received: from xanadu.lan (OpenWrt.lan [192.168.1.1])
	by yoda.fluxnic.net (Postfix) with ESMTPSA id 24601BE2BA4;
	Mon, 18 Mar 2024 17:24:50 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	linux-pm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: Nicolas Pitre <npitre@baylibre.com>
Subject: [PATCH v2 04/13] thermal/drivers/mediatek/lvts_thermal: guard against efuse data buffer overflow
Date: Mon, 18 Mar 2024 17:22:06 -0400
Message-ID: <20240318212428.3843952-5-nico@fluxnic.net>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240318212428.3843952-1-nico@fluxnic.net>
References: <20240318212428.3843952-1-nico@fluxnic.net>
MIME-Version: 1.0
X-Pobox-Relay-ID: F53B131E-E56D-11EE-B64A-F515D2CDFF5E-78420484!pb-smtp20.pobox.com
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_142458_452099_1A4AC959 
X-CRM114-Status: GOOD (  12.81  )
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

We don't want to silently fetch garbage past the actual buffer.

Signed-off-by: Nicolas Pitre <npitre@baylibre.com>
---
 drivers/thermal/mediatek/lvts_thermal.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/me=
diatek/lvts_thermal.c
index 2c346ea7c6..ed1888fb24 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -674,7 +674,8 @@ static int lvts_sensor_init(struct device *dev, struc=
t lvts_ctrl *lvts_ctrl,
  */
 static int lvts_calibration_init(struct device *dev, struct lvts_ctrl *l=
vts_ctrl,
 					const struct lvts_ctrl_data *lvts_ctrl_data,
-					u8 *efuse_calibration)
+					u8 *efuse_calibration,
+					size_t calib_len)
 {
 	int i;
=20
@@ -682,6 +683,11 @@ static int lvts_calibration_init(struct device *dev,=
 struct lvts_ctrl *lvts_ctrl
 		const struct lvts_sensor_data *sensor =3D
 					&lvts_ctrl_data->lvts_sensor[i];
=20
+		if (sensor->cal_offsets[0] >=3D calib_len ||
+		    sensor->cal_offsets[1] >=3D calib_len ||
+		    sensor->cal_offsets[2] >=3D calib_len)
+			return -EINVAL;
+
 		lvts_ctrl->calibration[i] =3D
 			(efuse_calibration[sensor->cal_offsets[0]] << 0) +
 			(efuse_calibration[sensor->cal_offsets[1]] << 8) +
@@ -791,7 +797,8 @@ static int lvts_ctrl_init(struct device *dev, struct =
lvts_domain *lvts_td,
=20
 		ret =3D lvts_calibration_init(dev, &lvts_ctrl[i],
 					    &lvts_data->lvts_ctrl[i],
-					    lvts_td->calib);
+					    lvts_td->calib,
+					    lvts_td->calib_len);
 		if (ret)
 			return ret;
=20
--=20
2.44.0


