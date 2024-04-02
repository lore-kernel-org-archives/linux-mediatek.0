Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F9DCD1297
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Apr 2024 03:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AbkTyhnEnboL5Ya7xWlvLq+BWt44iPSzyRbXpBbZ5iU=; b=ae12iP7PK0x6L/5k6HmLGH664H
	k8b2DuWSuS7zwY+VjSb/K/YlDIyPoPkEZFA/9sFRrceD2zTG6rvzoSDlRAo7kHpFtGUdU4DiHyPJH
	6dEmmvwGfMEugSE315sBtLnXJZptdGkWfn259+m3uKzdRGQMu2x/n78HYnIMdnfbT+2eJKDn5YbDu
	TEh6YjvoRCFh1GsN6rcxbaV/HFtp7uUPyph9/yx4F6/5SqPtkQqa8/fH+4nuIVQswiTGojhYM0spp
	sylMJ/mDzmrgRq/CkDrCS5eR1zYkF7mr4GlNLMnIrlIVpYqjb39F5WVdRBnyUYHEWCLoEXF8wUv2k
	Dx3TpOHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrUoj-00000009ZYz-01y4;
	Tue, 02 Apr 2024 03:28:09 +0000
Received: from pb-smtp21.pobox.com ([173.228.157.53])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrUod-00000009ZQ2-1lFp
	for linux-mediatek@lists.infradead.org;
	Tue, 02 Apr 2024 03:28:06 +0000
Received: from pb-smtp21.pobox.com (unknown [127.0.0.1])
	by pb-smtp21.pobox.com (Postfix) with ESMTP id 31573219E4;
	Mon,  1 Apr 2024 23:27:55 -0400 (EDT)
	(envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=LDX0rqkLLVP9V/sDmVl/fCI94
	iqNeaqPZhDHNWQCN4c=; b=Y8AWlnihw4ASRCyKuVRdAv9kZSFLJ65ROF+WQN9TT
	Pz/g79CavpAU8qYou9+avXAGCkC1L6U4VD/YEz1ac+KKfDURoQfZfPySQvnLOhxj
	3X7W9vq1O0UkDXaYk1BnbEuuECZMBmClTPJPDoQ7WHB0B3A06ts2ggp5APt/9xBp
	3Y=
Received: from pb-smtp21.sea.icgroup.com (unknown [127.0.0.1])
	by pb-smtp21.pobox.com (Postfix) with ESMTP id 28166219E3;
	Mon,  1 Apr 2024 23:27:55 -0400 (EDT)
	(envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=from:to:cc:subject:date:message-id:in-reply-to:references:mime-version:content-transfer-encoding; s=2016-12.pbsmtp; bh=zKfWCe1Z/qKYc7AfNNNNh/gcTI3D9+3V/4Lyp8NTrys=; b=io8qi8FulZV8R04HVJYyHHKYNJcknNakWF3hYphyQpRLIHjsJIqyJe6lLrq6bPwx96y2NWbX/NczVQJ0PSQW9PlUFcg/ixFDilody4lpUydyaoCJc9VtakjOtYrSbfULP82wdSNa/6C2DuybI8y5I4DvEmQ42d6+kx7iI6EAqwA=
Received: from yoda.fluxnic.net (unknown [24.201.101.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by pb-smtp21.pobox.com (Postfix) with ESMTPSA id F34F6219D5;
	Mon,  1 Apr 2024 23:27:47 -0400 (EDT)
	(envelope-from nico@fluxnic.net)
Received: from xanadu.lan (OpenWrt.lan [192.168.1.1])
	by yoda.fluxnic.net (Postfix) with ESMTPSA id CF354C1CECD;
	Mon,  1 Apr 2024 23:27:44 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	linux-pm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: Nicolas Pitre <npitre@baylibre.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 05/15] thermal/drivers/mediatek/lvts_thermal: guard against efuse data buffer overflow
Date: Mon,  1 Apr 2024 23:25:39 -0400
Message-ID: <20240402032729.2736685-6-nico@fluxnic.net>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240402032729.2736685-1-nico@fluxnic.net>
References: <20240402032729.2736685-1-nico@fluxnic.net>
MIME-Version: 1.0
X-Pobox-Relay-ID: FA51920E-F0A0-11EE-A8F0-A19503B9AAD1-78420484!pb-smtp21.pobox.com
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240401_202803_640999_E12AA410 
X-CRM114-Status: GOOD (  11.94  )
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
index 6edb858acf..03ef5b627c 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -672,7 +672,8 @@ static int lvts_sensor_init(struct device *dev, struc=
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
@@ -680,6 +681,11 @@ static int lvts_calibration_init(struct device *dev,=
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
@@ -789,7 +795,8 @@ static int lvts_ctrl_init(struct device *dev, struct =
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


