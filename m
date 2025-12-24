Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F48E6FE51
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Dec 2025 01:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CHgg9IL7FE026ch0/W9DThBQX+0QxyHh6wbnCQb/hR4=; b=EScN7UzjfCmKPQkerErfViS0qN
	Jt92k81BTd14egjO+TYklkMlowHOuEBRJNBDeoFkTEwJ+5OYIq62qsN+YKNuYY3CshQai+4PHbFeF
	lUUjU4BxwG2tKa+CAL4PQ8Mk446UxTZBLCgqYL++3OrtACEb+EXQTuzGxkvtnkQZdXmAC187A4VeO
	fP69oCcinWOJQU4eqEmGn60L/rbCTWQBU9VddSV0agukHim12UoEKeCt22BztsrKvVsnCLK52LiDN
	NpzLoMPRhGNlyV9aNMshUAcP4sJMtByw42lreWlllW2S1mR3CR9LGnJC5Wc1BcQyzISSCzIEXu+mz
	9FQCECPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYDIl-0000000GFsK-19iF;
	Wed, 24 Dec 2025 01:04:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYDIV-0000000GFaG-0Fww
	for linux-mediatek@bombadil.infradead.org;
	Wed, 24 Dec 2025 01:04:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=CHgg9IL7FE026ch0/W9DThBQX+0QxyHh6wbnCQb/hR4=; b=lAZlElQVFE0F/Lipu2rR+dkgB+
	5j/PwZchK2EBo/ssQDfdawxVCVGMv+n1QcLc+QZNeRnWJwa+ooA3nY6NPYZyTYCdADcTbLfq7rvGf
	rkJ5m9xRnV4neTehU/QbMUmS84Eb2CEqI2zCq9ca6PUUuhQBEni3p6hA5KG9DaTPuELyq7UVsI2hC
	Ao+oTMAGQNuxu/UNC4otnxgN0kzkCAqGrV04s9dKGsvEh/nNGjiH4Fl6trhtJWL1Z4QwMtTh8ztth
	9TCcbslX69MWXuY0hBrnCDcp6PjZ9MRKltgsf94f33IssTDXrqSL7WiDognGlXRkf/G7kTr5daOWT
	pH4DAhBQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYCQy-000000002GB-0mwF
	for linux-mediatek@lists.infradead.org;
	Wed, 24 Dec 2025 00:08:59 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNHrZAp678224
	for <linux-mediatek@lists.infradead.org>; Wed, 24 Dec 2025 01:04:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CHgg9IL7FE026ch0/W9DThBQX+0QxyHh6wbnCQb/hR4=; b=jlqhWfoSus3AvDYQ
	rNg9bNMgYw3zocQdvrdxXy5zd9+nVPnYik3umQeq7Mmy5TnJxJsd+oTkcbSg02YL
	tJRoDy8grzJPGgruw6Maxu+YfHm6coLBuXuwydQGMU91gsjihn+disnYvNpaiYxJ
	ykGhPxjB8pKv76xpOyCwQX9Jwr5wSrHlYaXtQRIGxIyXo3f7NLyRqyhx4oI+pjR+
	k7YNcJdVZdT/hUIB2ZMPZ0Tj1SbWVvQ677CmJNXRRGCrosb8XlOFzSxJs4jjCygl
	uLcRnnKQV0wPWFIkJtQoSnI3IhTy89qHQ5TuDEMuzVZsBV+ghOHxSGDhxLmU5Uk2
	wzPqvQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7yvq11ak-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 24 Dec 2025 01:04:05 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88a2ea47fa5so149348506d6.0
        for <linux-mediatek@lists.infradead.org>; Tue, 23 Dec 2025 17:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766538244; x=1767143044; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CHgg9IL7FE026ch0/W9DThBQX+0QxyHh6wbnCQb/hR4=;
        b=Jtypv+ejvXLxnVXS4NWqMELgQXZFdyDOB9IXjgmU5js99bbDNIHsfymn3jXnhWP5ST
         KHjuK9WQWHksebYTiqRLcUJTWXQdK9qN8PSNmBCIpPgTWc5ZeP/J78CBO62vdJgosEKz
         O94rruQC00f58d1nPywzzct372UqGHDJr/mr0qD68OoM/8ZEC2xeHXGXdWjJtFGXzruR
         EBlILXvNg0EjlihdWSv5vw/cpy84oxMNRMgVOCCDIVVRoxdnbMjKulHhxkykIhQYbtEu
         58hRYBS7eJxZZQ/AsqgiiJk9TMRKsJsInzYpPyvY+vra64Kwr5cYRgkla+C/hAg8lpy1
         wBhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766538244; x=1767143044;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CHgg9IL7FE026ch0/W9DThBQX+0QxyHh6wbnCQb/hR4=;
        b=ZqTe+RYDpMdYKlHd+kY9Yhxg0H4waWJTL31YONWYPaJjW7OJL3lgtAEcx9rHqBYjwY
         5motCCpsFTsfj54rV3QMmRvvhyEfZeV9cmX6I0r0dazFekCstJPIwjJqu2wQQq9qYiGn
         Ki7sQORpyezNkVfj6w31z4Gc+UZRPZS7unkTPGRV47gF46tmW6gGwClIuLCWkFqchKkM
         B/ffEx7QRBz7KZfU/U4hI+spF8BzhB/+wPgHPknNAYjdUELVWsPiwnKn2+WvDMw7Py4r
         OvQFX72FTSCwHyeZyTkvu/Cz2cVHjH6aexKLwGNHu1CC/MzCzcmj68W+HeGrLWXo8Rz6
         5fbg==
X-Forwarded-Encrypted: i=1; AJvYcCWc755uVbEGbYQZ/QaaO6o4CwySehzdt/vIemsyMkuWyuUa2EMrWuebvvyq+vkEuz2m5hgb1Brz7ImZv149vQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YymFniz8qDLStLqDig1uzCPysbz36gPOtNFLVYuIZkcxb1g2CSy
	ainiDJLmMgocOvpO/HgAm+WzWBY5fTDVXfghL1Z48e7Hko9s8zkdEoHauJkCRd0JUO3HvGEqWUE
	avKY5C1FVdS/Eai+HgRs9431aunYs2QgCCWiNgnyw39qeVnhap6UV5nHbtWm9Egy40DOaZAAfVZ
	U=
X-Gm-Gg: AY/fxX7+bw7v0cfZ7eXPvAhji3MaFi6lg/BPukoRm+N7z5Q3eH2+oTRqOsBf2p6eXtf
	AzYpiUtwMD1YU4Yo1nTDfIzhbb6Z2jAGqbcOxQ/GIN+tqO6MjEO3UttmLxdk2hdpJNJqsKAJ/1m
	5rVPpa+G8nvvyxvTX1Fw1A2+eWppHUN4jDN3SLT8cFzHIn1bYDPWIlFaw4cGimV5TxxWIJMKpOD
	xz3IkJ1r0A9vxfonuUhgQM/+JuM9XmHkpsdeMFR64M7uRQ0kvtyAK5lQ1mgDqQVKFQEqQef1uRu
	6Ff2QpDpbHDUK5kpFdlU0MNedsQHB2zGdylOE/4qUD+J7OLYKPtF9/fFZmkqLBTse+8oaOSp7ak
	Q0s3yaNv0/yPblX7ziPtmVB5Y96Ue/W1W8bKiasohdxElhWQLnEpJ66fhrL68/+SnQl6VFwK47h
	k60nOcESbSB0QdPfmwlA1yDeQ=
X-Received: by 2002:ad4:4e8f:0:b0:888:7d61:b218 with SMTP id 6a1803df08f44-88d81d47b5fmr175846776d6.11.1766538244310;
        Tue, 23 Dec 2025 17:04:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFu7+HH145K//WnhennzRUAZ/qC4YMZkCHH5OOgkflOfdjzzhnjIk8vQXkFQam/FvXO84smjQ==
X-Received: by 2002:ad4:4e8f:0:b0:888:7d61:b218 with SMTP id 6a1803df08f44-88d81d47b5fmr175846286d6.11.1766538243819;
        Tue, 23 Dec 2025 17:04:03 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18628284sm4545268e87.93.2025.12.23.17.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 17:04:03 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 03:02:59 +0200
Subject: [PATCH v3 10/10] drm/debug: don't register files for unsupported
 HDMI InfoFrames
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-limit-infoframes-2-v3-10-7fd3cacfefed@oss.qualcomm.com>
References: <20251224-limit-infoframes-2-v3-0-7fd3cacfefed@oss.qualcomm.com>
In-Reply-To: <20251224-limit-infoframes-2-v3-0-7fd3cacfefed@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>, Liu Ying <victor.liu@nxp.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sandy Huang <hjc@rock-chips.com>,
        =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1244;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=e83riHemz7jmVSC1s86WzW2uTf0LnBtD9CtSbMUNt3o=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpSzvaPmw40jATyUWTrYBTNEusZxIc+obHstv5S
 b4iElplUN6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaUs72gAKCRCLPIo+Aiko
 1di3B/95raEOH5VDkaGoqgK45/yZh46TpjSkI0p4xAQ5QWmsMaaCn7Newqpeo25B8E3VpDS52aa
 up3rolkowr24CN+AOTFNP4qaLU+wQ5ufsLePmUId4/Sf7f/3uLCmTjU2bAAc7WkBJDBOUgESVoE
 VPOds3GCRBLX3X0qEONZ6Q6pJmz9433H5cMK5o5GZz3dTS0dZZqphPcLWyxJSLEmmZrEn2G8Wyx
 MZQXEWNaui7oT4aHMyYoZX0z2RTqrLwJAAmkkLQISa4jHnSF5bBJb4YQauizaBu+BJqV1TOmbVf
 WZtZHkfsakdCoN6Xjk8QGpdcOMYzMgS1IQv2DEwSOdtfE7Y8
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 5tWwrBqWl4DNGu1TAoUo-FX5afnCUECk
X-Authority-Analysis: v=2.4 cv=abZsXBot c=1 sm=1 tr=0 ts=694b3c05 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=tIAOKlZC_mo2NaXw_9IA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: 5tWwrBqWl4DNGu1TAoUo-FX5afnCUECk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDAwNyBTYWx0ZWRfXzXVdRvov7L3R
 gJztCAa5jgC+ugZKadT+XVljFQdg9SwDJ5upQPxPZlZDRgmYE0ULr6DFP9IZqc+uvgyUIJxzhzc
 3QfZ9RDOtgJuofy8rUhlY75w9psO65PUFM7g/Y8EfBIIcyh6FGJT/KPANGy/UXkgIZSY18+VXax
 spdCd2x6qDILurvmqsFqoCVZk3QU+sNy8pNq191xB+Ch0reTvoR4p1AHtzAqEhpR5+8hCuPZ8Ng
 cBnTJwjEuU7yU3Fh6tOl0G1wKziO62TtB8gpGJmulOTjUXgSrpuvEf6DO+czsxIqLlzR5BgAPPJ
 WZJYhVFkX5uE/FiH0qDymz+JkVkCst75w2db3Ty+Zu/qVb1vqyRrmPt2ccTVt29BRt9T9alRTSp
 aDymVimsVIBzx6jhhquJG3wfobM9EpifuNr5Qv9x/mauj47Xjrf+ajsZzHmv3lQ0ibNuwUpbQxI
 aA6hia6u3j21/z0tstw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_05,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0
 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240007
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_000856_915215_B7401264 
X-CRM114-Status: GOOD (  14.27  )
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

Having debugfs files for the InfoFrames that are not supported by the
driver is confusing, stop registering those in the debugfs.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_debugfs.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index 365cf337529f..ae1c6126c2c5 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -672,6 +672,10 @@ static int create_hdmi_audio_infoframe_file(struct drm_connector *connector,
 {
 	struct dentry *file;
 
+	if (!connector->hdmi.funcs ||
+	    !connector->hdmi.funcs->audio.write_infoframe)
+		return 0;
+
 	file = debugfs_create_file("audio", 0400, parent, connector, &audio_infoframe_fops);
 	if (IS_ERR(file))
 		return PTR_ERR(file);
@@ -726,6 +730,9 @@ static int create_hdmi_## _f ## _infoframe_file(struct drm_connector *connector,
 { \
 	struct dentry *file; \
 	\
+	if (!connector->hdmi.funcs || \
+	    !connector->hdmi.funcs->_f.write_infoframe) \
+		return 0; \
 	file = debugfs_create_file(#_f, 0400, parent, connector, &_f ## _infoframe_fops); \
 	if (IS_ERR(file)) \
 		return PTR_ERR(file); \

-- 
2.47.3


