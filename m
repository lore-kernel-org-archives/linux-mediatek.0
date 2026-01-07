Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A347BD0D15A
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jan 2026 18:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ayeKTjgf6jc54pfgcQupo3DnEV3KmeCjaAg9qNbh2E=; b=izFmqqx/Sya4nKoZIp0vZS+vrT
	l6+a2O40zT8IwLeR4qVSc/R+zmhKHrd6kCbHPWfq5FDwc/QI4XChCAxNb4vrRlfTvLFwql+SmqXYH
	VjzS2f6KTIRJJafSprZgsSJLRRwl/0MJSx9E/fGwsRPPe3TLDNnKyshwa8ioLhJUGOxiqLR9SOmqQ
	jbIcDZ8yxsPhbFR3SqVaarqKUNmnkwF/u6Xq76TSGQxWVyVNXcZIAjAQCrpWOzkHb8zKb9dQDB/ZI
	Z/0MQg8CzgVBzt0Z+JHtaaV7PlbiUnDuWilvauPPNGaCo0UJ/afA62auzOqbfYJRcHNsPztZ5NqZH
	d9iorCig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdY4a-0000000FRkc-25CB;
	Wed, 07 Jan 2026 18:15:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdY42-0000000FRQc-27SU
	for linux-mediatek@bombadil.infradead.org;
	Wed, 07 Jan 2026 18:15:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=6ayeKTjgf6jc54pfgcQupo3DnEV3KmeCjaAg9qNbh2E=; b=pRzMnATyGE5jQivLXjhuG+SXC2
	5yNYy7zscBA+o8ZRtIm8AUpUogL2CWGzCA9FP7Iyx0Pts9v0WezWn9A7DuJcq+AsfAfrZb1GjUjcz
	RvGgNfZ81NsBqffw2OVnMO38bTiiH+DvkYkSfuaQmPDsrJajVoUUaS4LKf70SfGQXmVGRmmXEnV/z
	U90/otSlgMit36hjurVVFvJfJqThd7897e7YBCBYZFLCzVD0KkbyELRnHetefnIA5mz80aQiFOc+O
	hn1DOWGz0p1FFmH5qtdpTHpOPEmiop6q5DqvM/zZmN5BibXnXV4tCgOHXe68yHGzUZPXxKaRjp76S
	JDu9F/0w==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdY3z-0000000BtFw-0DSM
	for linux-mediatek@lists.infradead.org;
	Wed, 07 Jan 2026 18:15:21 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 607Brr9h1643104
	for <linux-mediatek@lists.infradead.org>; Wed, 7 Jan 2026 18:15:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6ayeKTjgf6jc54pfgcQupo3DnEV3KmeCjaAg9qNbh2E=; b=YT98JyW5oGIce4yx
	t62vyUO8gfpzGSWjao8mBdPTYJjg9dpxi69OPT+flXHjY6zvvx9HgiN5VBgBBE3z
	aP7KS2Ai0vJ/lJpU1dpDd0Wxd3AfpuO+r5VqXRzqZpaUaKyoi0LPozqGRblpfFtK
	8FFeJxxsq+wpaKuwqGiSnUZWk/S1M+hmWmUCx+hBTMfSwr6J6aj2V5QFdUUVf0kj
	CHLH4uqz3dyg/R1Bh8EhaSUJI/DxjitNH/wMuHLMhRLagS+uW1jOa4CUCDBGeaVy
	RdCTC2bWeHtpXMzHIcJEE6pFwJOYIGnHu5DTmubFL5Kv1LjS0Qoq4BlhHH+zqmpU
	l0KWkw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhgsfjhsa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 07 Jan 2026 18:15:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b9fa6f808cso698745085a.1
        for <linux-mediatek@lists.infradead.org>; Wed, 07 Jan 2026 10:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767809717; x=1768414517; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6ayeKTjgf6jc54pfgcQupo3DnEV3KmeCjaAg9qNbh2E=;
        b=B1gWDZrRd7S3b7AlGqdkndIHX0/l/HH7K6qF5J23u9UlEpGd7SWTEVAG4K1siNf4Kd
         62D/iQDn3CL6wQj/AwTLQqf+M0M9yCAN1Ww2mMZim9ld6C3erEf3BQFgY1d8X4dxNDBF
         /ljVRS0V5Ilz8z8WZeNubF55TlfTYJecVWRGL+0ggFuRQXGTw2Op2neoQ05XM4gRC31i
         Yl/p9ONa8C1psyRDwCy76ip/Pq6wLmkhCd/1qfYZXBmwn2Oo2ojJM0CaHJrJTLT2QAe1
         c+BH9usBxuhGCP3YAeEb4sRo5ADjb8bP3LbXmYpf2NHr/EZE8gWBzQxmKlzJroX+U7Ae
         tDQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767809717; x=1768414517;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6ayeKTjgf6jc54pfgcQupo3DnEV3KmeCjaAg9qNbh2E=;
        b=gyXytBKYFd4xADRq1vQQJESD5OQj81FXVAPb16TzMo1Qb/dHp5rXEyhjmHop+DvJMk
         QCE1992MGziRnsMJ7+PKlhJhQzWmBBSW5EMsEkz5p75/qzN+B5ETeLg1GnGyKT2RVmbF
         JzIl5iUmEQ4QxRqo3cf4aRWgxDWEQMqZfXpACKG50mmKPEeGV8a7wubYMRACgB+iu+ui
         tE6zbOhtZhq6Gh2naU0B3OwLIfp660rWh5F3UA6v4ziNjSvp0VMpQUJJHkVV6RD1Uk24
         MUIHSM08T+ucxTxxyMwKYI9AvOkMFzgB0csDlgqFphu+BnTqLSktvMQKb7K8vGERmOPn
         emNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtW9NV4CiDGfWCiZXnukJvVeJ6CVknA8vBepR5LswppUefpBRSCWal2JnfJQYMPXOhwJNvhkWOkGL2jMoz2Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxatYEC+Jhi7m00CgSeXWLyufrS9c92BJrrauRta2PExZdRVyH2
	fQ1oRp1mYd9O3lXYOs9/Fun2CI/qRse15xOszc1CAJcLpEN6qKW7CjqlO7NrHeH5TEUuJa+EM2O
	yghiDEYt9pIXJRI0H8Q1MhVJuCOYPpz9rumYc3ud+g1YvS1Ga8dmQaHfiC3RdhH35SeYBRmx5pb
	Y=
X-Gm-Gg: AY/fxX6tpEiEH8gPn8BHNCC1clLmZlpQ9/JyBRNV+NkQ32L5jAh/in68/0YxDDS5FNJ
	3/eWNKQU0ZE7H4qidLD8RZkrSGqVH1gsFjJ+WNl4LaqppejshgNrPAdQsGeigG81fD+3NUZUDxa
	VkVVyfbi9R1u/OeM4IrTZJn5V4nyiyFymNxpIaekcyx3TksjNkg2rvy/i0JEt/dt7TTA+Wdc2WC
	Q3/s4x0dKYE+esrk2+LmUHlAaXS1Srz5fZau3VrWF5wZxoQ/XeAmFN7YADQwr83Dkpkzt+yqgDq
	hitEdw3wlD3pf3N4zgzxo4Tw05xp3gs/Kehs3fZLX7xvO7zXlVB/vF9DFgWtFTpdt+mkJp001z+
	qnrGZ/7zKxPfOMkK0h22SRju9RmrsoLGEY6INFIoAr+4XhuvRLikTPfWkNwxmdcb4ato2yzu72c
	0N2a3yf+VoPOyIq4ePGbPhgMQ=
X-Received: by 2002:a05:620a:2952:b0:89f:5a59:bf30 with SMTP id af79cd13be357-8c38940cc79mr440814085a.78.1767809716488;
        Wed, 07 Jan 2026 10:15:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFzR6/I/M+rb+0CfWg9B2pwtmy0BCZ0528ZAW/PtSMTyk3JvUKmiud8K1hEOQV156GKBDOZmQ==
X-Received: by 2002:a05:620a:2952:b0:89f:5a59:bf30 with SMTP id af79cd13be357-8c38940cc79mr440807085a.78.1767809715974;
        Wed, 07 Jan 2026 10:15:15 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65d6988asm1436884e87.80.2026.01.07.10.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 10:15:14 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 07 Jan 2026 20:15:05 +0200
Subject: [PATCH v4 08/10] drm/display: hdmi_state_helper: don't generate
 unsupported InfoFrames
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-limit-infoframes-2-v4-8-213d0d3bd490@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2066;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=/ZrVCxC2ORTh/25tcpqTF3QUmYMkLYWP2fYAuUO25LA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpXqKlLQRVN1fiNfBhJSnlQQ8yf8TEYh+A8edCs
 YWTlH3Bcj+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaV6ipQAKCRCLPIo+Aiko
 1QOVB/oDjydk2pqigYtLHtwvNWcAKXJbbdPGQ26WTURthKMHJhz9rPZZV04J2QY5hTtypEXd//d
 nw5Vbwc0So6ysL8Tv/jIxpWqiL+ciHmVHitK6qOCEBS+i8W0MtTLVx1YAdnQ2gp8v5gmqGooPIj
 URRZkW/XopRmGOqd8hftr59SVEpUvh5HH5NGGNoX/Wx2rngOV+KmUfwE0HXApJlGUvk5kZ/fwRb
 bGSKspZn9xiu+96xWnVTNQqum/Ct/2q61VCFkl/XqCm0lDpae50DBapNsWOPBMIWt03yTjsHslN
 UvAY1W9Roxw/F/vls4Ff8wqqmvewupBjJYfykiyeu5Y2vHLK
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDE0NCBTYWx0ZWRfX1mPsvi99j5L3
 OQepJLQGIgLhJrBQDyAQhuZUw+cLvZb0XmCA6G8HkQA508+TzoBiVlLp6B+y/mPOjdONLR/kT8h
 NkbA4nr5uNxpvEzYsSStbn+33Q4j/AXXtYwmoqbjX0K1AcYynCCGMxI2oUvpl17SdRiBFmVgSjr
 810lGCVHnf3199e6vqnZ6hF+BFA6M0d6VgWVL6rzyyrV+a+HhZsWxvEbbdZVsKddvmEqV9p6mmq
 bAXK3/VUM4TmP1X5yx2hdEcFh+RmEVDY3AN43SjxDVg1Wkl1sJ+hBXF/lID+AonQ4Vv1tPuXBnX
 n9XNS6IPaHGXto417EqzE8jQnolsrB+kiJCEY+J5WCBMcS2TI8gxef8ZYo1yCE4O72ek/IQ9hej
 TV6rfZY4dnUF2ybQocVuvenqEe+5z9plSF47Qtnjy26CGk3kVIPHchNdbxYxQ6YUt09OsDkG5mm
 qjWYQnCXZ/hBc7em1pA==
X-Proofpoint-GUID: s-uoaLbo9r8vT3oVdWLnrtD9zSNUtbBA
X-Proofpoint-ORIG-GUID: s-uoaLbo9r8vT3oVdWLnrtD9zSNUtbBA
X-Authority-Analysis: v=2.4 cv=Abi83nXG c=1 sm=1 tr=0 ts=695ea2b5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=58UsvUJqJn8fpqk6aeUA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601070144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_181519_433263_2E169AAC 
X-CRM114-Status: GOOD (  17.46  )
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

There is little point in generating InfoFrames which are not supported
by the driver. Skip generating the unsupported InfoFrames, making sure
that the kernel never tries to write the unsupported frame. As there are
no remaining usecases, change write_infoframe / clear_infoframe helpers
return an error if the corresponding callback is NULL.

Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index e8556bf9e1da..a1d16762ac7a 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -718,6 +718,9 @@ static int hdmi_generate_spd_infoframe(const struct drm_connector *connector,
 
 	infoframe->set = false;
 
+	if (!connector->hdmi.funcs->spd.write_infoframe)
+		return 0;
+
 	ret = hdmi_spd_infoframe_init(frame,
 				      connector->hdmi.vendor,
 				      connector->hdmi.product);
@@ -742,6 +745,9 @@ static int hdmi_generate_hdr_infoframe(const struct drm_connector *connector,
 
 	infoframe->set = false;
 
+	if (!connector->hdmi.funcs->hdr_drm.write_infoframe)
+		return 0;
+
 	if (connector->max_bpc < 10)
 		return 0;
 
@@ -902,7 +908,7 @@ static int clear_infoframe(struct drm_connector *connector,
 
 	if (!funcs->clear_infoframe) {
 		drm_dbg_kms(dev, "Function not implemented, bailing.\n");
-		return 0;
+		return -EOPNOTSUPP;
 	}
 
 	ret = funcs->clear_infoframe(connector);
@@ -928,7 +934,7 @@ static int write_infoframe(struct drm_connector *connector,
 
 	if (!funcs->write_infoframe) {
 		drm_dbg_kms(dev, "Function not implemented, bailing.\n");
-		return 0; /* XXX: temporal until we stop generating unsupported frames */
+		return -EOPNOTSUPP;
 	}
 
 	len = hdmi_infoframe_pack(&new_frame->data, buffer, sizeof(buffer));

-- 
2.47.3


