Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A791E74906
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Dec 2025 01:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xhyidPKELK4mgPty7R89IfFpAnaFS+xQI4oanQexDkI=; b=tFX63c0CohzeeNCT+ExiFRoJ7g
	PRiuT7k6IGxjj69ng8rAvW6J0N3BoCLh/h+yIKYM2s/oI2QcUj7dCxlusyaKSlXndvuKwqAMRXEPh
	FZTkVKgTQ0QZ3rBcFAALdxpzkGrjh4Pgm8JJjI5YEnuryVK1qd4caL2pd/jmkkVMNHq42ux8iDCQd
	SvqHSj19Qi0i7MI/5Su/r/LaL6CTM22s0PC1WmlwU4GOtLR7HJkQgzJG3n8ThNuM0nIH7E1ZAVmz6
	Sxf8URJ/4mdIbLqfN1UPkKv3ulWTfWvXrBSl80GaY7RUfR0z/ajESBX6BkGiYMcSzic77XqFejIhN
	UPutgaTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYDHz-0000000GExg-0upG;
	Wed, 24 Dec 2025 01:03:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYDHs-0000000GEpu-3HSR
	for linux-mediatek@lists.infradead.org;
	Wed, 24 Dec 2025 01:03:39 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNKXiwC1206461
	for <linux-mediatek@lists.infradead.org>; Wed, 24 Dec 2025 01:03:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xhyidPKELK4mgPty7R89IfFpAnaFS+xQI4oanQexDkI=; b=hWR5OjqmTENGCgZk
	I4zXeoe0FG7+9/6SD3mCvvxs8H3pccL8dmb/4n93hTOrhvZH9t3GbcV7sRBlbwqh
	j3vMtO15GjZ43NDH5xDBw1xydalP3nQJoi/cquWmGbTFSO0HIAKy7YEvhLkXqIlb
	dQJ62hwBdIBtDRmwviqI78iNNVhEH7JVIqEWs3P+GhpXvYZbEb2mskJsWiOFpo+9
	0w9HVSCBA6DhMLa9kwIXPMA7/MAnPT6hxcp69upX2RXhvAhyWGDr02JZGhZE7hrC
	/ZRv6AGGoy+yRGIjDtc/ZYrlLleHwBbYd2TR/74vUAOumKhok4evGO2QVUh5wiVI
	wbOeAw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b827r0gpj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 24 Dec 2025 01:03:35 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8887c0d3074so144736286d6.2
        for <linux-mediatek@lists.infradead.org>; Tue, 23 Dec 2025 17:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766538215; x=1767143015; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xhyidPKELK4mgPty7R89IfFpAnaFS+xQI4oanQexDkI=;
        b=GoPzomr5vDiCBxVOvZlGAyZQhOHf1Qm6T13zbsS0ITDhDnLJ3Y8L2CgIfuqkwwR4YS
         8cz/TfRZNEsxg0W/tlQk+0N5/gUm3lRGX2/AVzs57YBYXf661NvD4p8LHMrIKOBT5Ik6
         tzJrcJKwDAgrHmM8nq2em8opYOvlyJdd7eWAzdj2GQD/D1qea0UQ6O6WCMgN8vQjhpZd
         36FxkcYz25BaipQRPFpD+A6ihhVbewLhAm7yl398ryLzP5iAOfJVc/+O5jE538J+htiU
         XpugSId6QHs/309M46WH/xaIuzjP5JMAni92a6ptRha18LpTyL3c9BC1rlHwvGN+k7/V
         F6wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766538215; x=1767143015;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xhyidPKELK4mgPty7R89IfFpAnaFS+xQI4oanQexDkI=;
        b=XPIcY0k3CfZXcqbc9Zx9kx1mg23syrkwK1CBAL/pbR+vzbZDX5JvKCr1oBKl/mF+vn
         22jsOsmUCKPl1SvJyLSHujnOuw9WdNN7nAM+HQZbFLCYYg30Sv6Ck301zx9T8UF1Btpn
         60Q3nkhkddWh/f9B1zWrbMyRUIWyCdm8qrb+qK67zuct5id7PDKDA01oj2YWEz/DkDv3
         45ykUErSgU4x2c9V8xR7bJKiSMSySxntYPKY3kwrO959eLS0PyXzorBjWB47WtlU1PIc
         7VgPe6/g9kKi1WKSiTN1eTZ4Sjd2S5jqIxvtFHWn1HSQrU2SS8IDGeYPI90NQgRh0acJ
         a3KQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhlz6YKboCqK9cKfNhZG/tlJwFjIxI+MBFrfHX3i7f+7RHiKqh3Uwnvn5KwoTYbYPZLOzkuAiorX2hcTUcUg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzW7BLJG+HJ3U1JUadF2jXOr2bwQW8eCrdEeTZZP2Urh3jYSSiw
	XvZ3OlkjhCjNaei1W1K8owABiSuJ3H+IP6gI6Bcu7+nSEq6GYVh4MUdZjFWkaj1/ewN1TdzQC8Z
	qEVWrXdPTQy46mOeKEgK7PrxT4rxEQTwLv7NP3EHJBotixGy5wp5o/aqKGB2ThHu7L+NAHnoGMZ
	8=
X-Gm-Gg: AY/fxX6ctplKhg7VgLHQm9/+lPQQVum1E/FIdzfEuKO9OWtJWNThbqRTZRs3CyIf9oQ
	72C003IalHnOZAKPwOlqfewgA1POV8JRQFH4iQ0UFUDx8K1y7JHWUwXD7gHMcF5Dw6l5TMXI3j+
	zpROlSz6+PgK/Jc1f7k9ACUwRowt9QaFO9p8S3jEfxrDJkCm9HMTVwVQhfi4ncph5fO4SUvdeNZ
	8MTjiH7W9btgVm85Bha82bplMTL37vRO3J9EmcuL2zjKEZMRQ8jXqDS6sHR7uxQ3vJDfs2mv13j
	Zbp2SLJ+mlqzH+lkXsxPiGhYoAwQ8JCokblW7jpAbcXvjq5WZ1CEbQB3c8AWnbuvJPaoZHZX4kY
	b7j0r/ihgUU0D4LxD23lXo/5znManPRv4ukPt229+g8kazo+X2c75Z14CpLkz/nNEJ2UyiHcsH5
	VyEgGOQam2TM/Sr+l4ejghSSA=
X-Received: by 2002:a05:6214:4e07:b0:888:6ea5:a8f2 with SMTP id 6a1803df08f44-88d82234a02mr251738916d6.29.1766538215191;
        Tue, 23 Dec 2025 17:03:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEpKbGgnmym2Mtt5yWxfAHv9iuZOADyKontrek89W07BD34phYJfGyZ7WWcGGMKQLxabxO7ZQ==
X-Received: by 2002:a05:6214:4e07:b0:888:6ea5:a8f2 with SMTP id 6a1803df08f44-88d82234a02mr251738596d6.29.1766538214801;
        Tue, 23 Dec 2025 17:03:34 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18628284sm4545268e87.93.2025.12.23.17.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 17:03:32 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 03:02:51 +0200
Subject: [PATCH v3 02/10] drm/vc4: hdmi: implement clear_infoframe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-limit-infoframes-2-v3-2-7fd3cacfefed@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1703;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=mr8qXjnvYFOwO7KQ17AFNeqHgYNZnWBLYdH41Q2tDUw=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ6a39fX0APvL2yu8D9Rc3hNQrCmR/DDaffohjZWMNm3TW
 qUDX0zvZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBEyqI4GNYH291ht/25OWpN
 +Vnmr+nWTHOc+k9sTsiarlmVcz3+bZnyG76iwxndrZ6Wj9f3RuYEOJzb6B3/blvX/q0ezEeTEnX
 Dnpb5/F56eOYGp4ml9wQ/ivtYRbm8EOP/EM/JY+69MHef7kne9Z5Zt1QKdvxjyT8+5acQa+C//A
 uiTqvfV1f8C7nQJzN7xfT91yIKVmyPb1rrFqV84Zy75YP+wD/rjPT4rZawrlHT9uq6uOhGaxCje
 WWdfpCJ7w9Z9vbZN8tfzJffEHu3lltStTXUXUTlbfaz0MQpGWsbFNULpWVswpb3nP91WtD11Kq4
 VOMQR0brUk6/yjc2PJFtDgf1l07Zor3rOPuy2bdnid8FAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: ndtXrQBXpZUlGOCzbZs71Qnapt-sXQ77
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDAwNyBTYWx0ZWRfX9xs6hXfNTYRd
 cwVzp+cOquj65LtT+0DGAZZQojipD97B/hqUcWWWoc8GKjfUiFI8MrAOvqJasVSfJjrRLgmP5k4
 h4b7YzZ99xQlroPqI6P4kp5EULKJkyuYA2hTQw0XQwwb4D7VzqPt33GqkLCrOd3UYHgGlE1zzLJ
 qmI1iy+XSc6VFu+ygRH9N52+4KZXBBXOjOaYi0YzyGuKlexkYsWU+HOTYCB5SkdE8MHbyvFKjzl
 6CGqeM59lf+trRHgzUcN7n5kXcm9iIlO6+uCY2yhJ83ydWD4imHntajhC8EU+YeYzcoxao4X7cx
 VKv1cOsq/7aovmcOUd2EMFxbyWWu6REFhUt0v0ISN84K52raJo29FGpfbkPaSjJbH7D1wY/46YP
 5W76sulM/gSi+jOkIEXH9UBGOc0EqNL4miVtM7wec4rAk/ByhkEAyym71lj4zODO0S6kyNtfu3E
 zPmuGS8Y2iYBr9oGmDQ==
X-Proofpoint-GUID: ndtXrQBXpZUlGOCzbZs71Qnapt-sXQ77
X-Authority-Analysis: v=2.4 cv=RbSdyltv c=1 sm=1 tr=0 ts=694b3be7 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=gsP-wGJUQ9tQerkYUh8A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_05,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240007
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_170336_942461_E9A38C02 
X-CRM114-Status: GOOD (  15.09  )
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

Implement the clear_infoframe callback, disabling corresponding
InfoFrame type.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 1798d1156d10..4cfb7ebc0c81 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -624,6 +624,30 @@ static int vc4_hdmi_stop_packet(struct vc4_hdmi *vc4_hdmi,
 	return ret;
 }
 
+static int vc4_hdmi_clear_infoframe(struct drm_connector *connector,
+				    enum hdmi_infoframe_type type)
+{
+	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
+	struct drm_device *drm = connector->dev;
+	int ret;
+	int idx;
+
+	if (!drm_dev_enter(drm, &idx))
+		return 0;
+
+	WARN_ONCE(!(HDMI_READ(HDMI_RAM_PACKET_CONFIG) &
+		    VC4_HDMI_RAM_PACKET_ENABLE),
+		  "Packet RAM has to be on to store the packet.");
+
+	ret = vc4_hdmi_stop_packet(vc4_hdmi, type, true);
+	if (ret)
+		drm_err(drm, "Failed to wait for infoframe to go idle: %d\n", ret);
+
+	drm_dev_exit(idx);
+
+	return ret;
+}
+
 static int vc4_hdmi_write_infoframe(struct drm_connector *connector,
 				    enum hdmi_infoframe_type type,
 				    const u8 *infoframe, size_t len)
@@ -1660,6 +1684,7 @@ vc4_hdmi_connector_clock_valid(const struct drm_connector *connector,
 
 static const struct drm_connector_hdmi_funcs vc4_hdmi_hdmi_connector_funcs = {
 	.tmds_char_rate_valid	= vc4_hdmi_connector_clock_valid,
+	.clear_infoframe	= vc4_hdmi_clear_infoframe,
 	.write_infoframe	= vc4_hdmi_write_infoframe,
 };
 

-- 
2.47.3


