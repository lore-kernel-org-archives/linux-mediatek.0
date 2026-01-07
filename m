Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E449D0D161
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jan 2026 18:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rhn7f75cBzRSaSyNIXu2sGOU3jGwzD9Mh33JQAcGM6E=; b=l6z0Z0rYFBLWe3S303AW0EgDuu
	SHzaHTKZo5ipaXbJYJAcs5D1S0bSBgjq7Wp1HYCO4K1nxUq+9mxaGweuTOnrcLdr0GETBlqIAXbf9
	WcUbGqxu7ritGnbiwF4F5Q2Htnx0+RYK6/ut/aM1qTcImrg5U4Vn5nZM2lNJ83KnlBo33dKISRx07
	+QmHC938HwRE7SP63VIkyggbvIL8EGvcIm3lZnZR/cTnPUP+2GokQ+SYh8TfumPs/wdnraUBeLBw6
	EPG6MuUtEHM0suUmdF0DhY8w/zBtFnxZWrR4ZexwV5wsEawcLm7q/4izklKuTpKPiNn0ztr7VRyqz
	4YCUX7rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdY4x-0000000FSD8-1EnG;
	Wed, 07 Jan 2026 18:16:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdY4A-0000000FRYi-2ThS
	for linux-mediatek@bombadil.infradead.org;
	Wed, 07 Jan 2026 18:15:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Rhn7f75cBzRSaSyNIXu2sGOU3jGwzD9Mh33JQAcGM6E=; b=eHxVm3DotDyEJLTo992eRS21l8
	JN2UptPTNqiME5xQHbG8i7MTc/A0q5YimnZm+sBLhIXlsY2cnOnZvbH9Ka5Y0H5JGJZbcB1JUrspG
	K99fSaIKOMJihQ3Q4V2Hnf5HmifvgE2cVa+mtsXQX1DMB0EE9Z7OQU8V+oSsIGahfNij6avWavleL
	2U5qHY1PIzuBo2LOWi42uqOFbfaW6CllX9WpOYtMGLEW8Am9X4lAr0uR82XYkFS9eT06dTxRzEnRs
	/ejHRDsV/Xw0av6SZ4/EMJDEt2OHvKiEy9gWFfpBnXHfC12yxzFtwZcE/0uPA21ac0hZjiPKDgb17
	BjtxzJ6Q==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdY45-0000000BtLG-2yHT
	for linux-mediatek@lists.infradead.org;
	Wed, 07 Jan 2026 18:15:29 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 607HWku52988925
	for <linux-mediatek@lists.infradead.org>; Wed, 7 Jan 2026 18:15:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rhn7f75cBzRSaSyNIXu2sGOU3jGwzD9Mh33JQAcGM6E=; b=KbCTIULR+UQD/OAh
	U1rI7/tfl1/ayoTyuMELUcglhFt/QcCGv9YR7isr79DbYNFS++Nm24Mu8T+F/ns5
	Nb46watlWR+VJAYBlUKos9mkuWeL6NeBUNVZUj98sMVDYn2GjcOiUdMMpXb5ieYU
	GiBSz7AdGoLuCVNMugOoQB39e48Zo0tN0w05xOS1T9zXpjBM7thGm9bfybGIuNeB
	xcjjgL2nWqLLasPKHDHVkvqInzjqR3T9K6aYC3POkBBlzly+8qYDAHlsSxywEQ+O
	taP/Fnm6reneRix/8aOooj18dqvaHgLUcSXdljAPsXO95mEpzCjvaJPHJ2mTKXoA
	UVL9rQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhn2nsmk9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 07 Jan 2026 18:15:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b2e235d4d2so911730285a.3
        for <linux-mediatek@lists.infradead.org>; Wed, 07 Jan 2026 10:15:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767809724; x=1768414524; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rhn7f75cBzRSaSyNIXu2sGOU3jGwzD9Mh33JQAcGM6E=;
        b=hhxM//ZzWD0PhmwbJdVIjkuFyjhiH8YRBiuv0ncGbmojXp1CF3gNbWotk5lRS/m6dw
         VKL6bz/chgJywafIXSdmCKNFd+e0xOkP0gP8uQJwpYE5w0nY3GZ71hRK6Vy2DC1SLNN/
         KOc0Wc8bBg+RNIQxj2INB1GSR+ASToonVfRBl4ROwHHCJ0qRtaxCwAxnxMvlrsUg4Q0M
         zRht26vB0qliN/YGY9XUo3X9U71tTZplMQBGD8W7O81Tdq8iAhIpKTVrP9l488A5jja+
         Z3T2kgt829R1M66WHnn/xsqdBcGr7IQ/N7hrdt5gMXN2LyWqY+9E604TR1QPtlTO52CY
         Mu+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767809724; x=1768414524;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Rhn7f75cBzRSaSyNIXu2sGOU3jGwzD9Mh33JQAcGM6E=;
        b=sjKuGaH4yCAa0uESkbdbfo+v6FvWkaEW6y8p1kZYnlrx4bGewx8S5irpYkW15c5OiB
         Y4fgtOQ4Kr6a3mXXeIT7fs+aRN3zss+llLrUmEzdOsStZa9qunXg15UW61gB7qOuBiaw
         keXYMqlTVaxf/CUT4IrpSjiys72P9EuZ/8b7MBP4D8O3w+eK88Dscs7MG8T/WjQemSgw
         JxS2/rQy1nSgf/r8qiS8XntRaSP0yuhTxtzQ8bEAU9sKgpfhsBCsr1KV8n+xGbXyf6Sv
         gI8RBlTeIzoHrEFUcNnCExVNaM2O+7fFpLPmmTHAySKFMx/IqFnOUj1o82NMvT0KTrcR
         QAeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSvvmy2dSJSJhwcCVPHboKuwiSdm3McMKTXXoBslvHGEJDGxq8Sy5F1NtS1IHwnvx9yHR0GkJHHhOW346dHQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyStS3onHmIv7XSwK2C2Suym3/d/+sx8rQkjni2oIO3QfNWLRFK
	pd8/FhbqblMpFCuLxkSLP2DoPBQxEY92P+R6bGStkoRpZfS7ikwkaoxt1qOLVVtAD2TPqP8DxAp
	HEUyrpS5Bs0JJ3/esKDgZQdUArXk8JRiINlJhglB7G0+7pzT77PqHQaElm2QSML3tjktrgTso83
	4=
X-Gm-Gg: AY/fxX4l+GRPnEabVyo5oosJq9R+EYiQop47kE4akXDO/fRq0bDKPBaIGuO2EArXbr4
	A/wfxr6QxKjIu1Zj3fN1KrnjmB3SIup1m6vxDjTkIbKSFP3hYD0BOSCFT5Ca6UTMITEkLE6XNSZ
	gqrBS7LOSO5WpGqMQs9ft2ALQbF0P+Q3L8uqOJWphikb0HIQTXlm51JeLiNBYuV9R255aRhjpMC
	jnWzvbEXizDlgVfLKtjnt3Cj3E7gAK2dY4qrd+8AdaZuWLbxQHd1ZXecZc8Ft4jO5tTBD3q9apb
	0wMorUcp5vag+aFDRbthAv+6QLrPfpwLUc8lgCWITR5t0duepMNgRQExDdfgMaXNCAVUEQLCaVU
	dMN17OvmcZvflBdxemsMAQmQaOH7pJF9Dzw8dHbtw9gagFZS/m+unB69/FXpvgXSd1eSGwR3Tat
	lBFF51hlaPTMcgCcK02Aiw3kU=
X-Received: by 2002:a05:620a:19a5:b0:892:10cb:b427 with SMTP id af79cd13be357-8c38940bc70mr456800985a.67.1767809722011;
        Wed, 07 Jan 2026 10:15:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEDhZprVBsv7NrDl4r7/stHLp9ske0/9w25bokRbHgFqXeEm1zUot0CQkb+02Aes2IA+aZv+g==
X-Received: by 2002:a05:620a:19a5:b0:892:10cb:b427 with SMTP id af79cd13be357-8c38940bc70mr456790785a.67.1767809721391;
        Wed, 07 Jan 2026 10:15:21 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65d6988asm1436884e87.80.2026.01.07.10.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 10:15:19 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 07 Jan 2026 20:15:07 +0200
Subject: [PATCH v4 10/10] drm/debug: don't register files for unsupported
 HDMI InfoFrames
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-limit-infoframes-2-v4-10-213d0d3bd490@oss.qualcomm.com>
References: <20260107-limit-infoframes-2-v4-0-213d0d3bd490@oss.qualcomm.com>
In-Reply-To: <20260107-limit-infoframes-2-v4-0-213d0d3bd490@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1290;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Fqja7nqMdmSMtGtKfnnZaHovKcc+8jCwgpdYFW7dJBE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpXqKldBKXXeIUEl9VKknThFajiJ4bv/Z+Y6zlU
 AwqJpH32O6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaV6ipQAKCRCLPIo+Aiko
 1SajB/4k5q4SEw24CrrWC3HEsLlY/uKXgpKUIWzeXnMMyXHDWo7v5tevjX/ai/KZzmbo1NC5fGU
 jhVIocLd7kwuiCUjpW/yVaQGBTAKyovOJsTbYp+V9wBPDqh8cp3VXyONhN+s/zhRGG9gAF2YEzG
 cgchTc/+0JVBdAMG16Sxc4mMOkZGU+Lxks7qJlyhN6XsUcj8iRQG+d9hUkNlBAgdTcMJpMEn0kd
 dkJOKbe+FFOrO2OOH4BNawMbMIU0982lxSIPgb5Q/RKX8LhTdWcg7s3XNn8GfdQLMft8fGlKdXt
 B1XWOTyoPib7k0/IiAyVFTJ9DpbDTMyzhznF9TrmGgOPszSr
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDE0NCBTYWx0ZWRfX4s5fNSKDMxTv
 WclaE4KIcrJBLkA/2QMAO1QFgkN+a9m/p/fi8toHP3YKn0iGWNFbkyJbik1bw1yxZRP19DowXAQ
 tiy11Argp5qmQLuTxbzgelcEIhwkx0B1Wenl3bPdWvG2GcBREnrhWh9eZrGkGDkFvoyKg24GJ0I
 IcwBI+9entik0xnYjqoL+cDpQHAqlUpGNErb9sIKKi1XIegOhIuQQJJm89lHi9rK3J9NKoVAS6z
 Lo6G5lOQoHASWKRdsZ0iDtLU/1zZS6BrCaM9riTKLpA5sijSkL/mKp0XiOI5L5hhkl9vFXBIIF6
 uchVYql9CoFNNIqZLtvahtPWyKGpHuz3i8M72LUJdQ0y5IPHIhPzIaxFxBqalZc9TNyJe6MfKc8
 Tu3mc9HSjdN1ClkA77Th0sgzz/8ZZmWe5RH+9QRWsmcWpqU4ggPd4nBQcmjU42oaVlAdqA7c0Bc
 IYqQ0CNf+LMEFAyOIxg==
X-Authority-Analysis: v=2.4 cv=CYEFJbrl c=1 sm=1 tr=0 ts=695ea2bc cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tIAOKlZC_mo2NaXw_9IA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: D-ecdWT-oadRKAZ34FNiditIK-yu3XZe
X-Proofpoint-ORIG-GUID: D-ecdWT-oadRKAZ34FNiditIK-yu3XZe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601070144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_181526_148911_AC99807B 
X-CRM114-Status: GOOD (  14.07  )
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

Acked-by: Maxime Ripard <mripard@kernel.org>
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


