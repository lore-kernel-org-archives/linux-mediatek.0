Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8C1CD0D15A
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jan 2026 18:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ecVHGdcKUGcf1BVa43vSmPZjJ3ubI7MYeuQBBNyE8CA=; b=lnhZvXACgFYldRofuZgJrpzDBs
	8Ob4GvimIbBySZuwCF7eyfgAX2L755+iVSl/3nxO/mQyq0lmCWrVS1azG3FY+P1bcmVNV2fdw+DsB
	7s8CSMt7acu4mEPDAL2KOmRk+FWLzjRgOH+pUye5YRfM6994Txo8DMETi1BbNoI9Ledqpb4zgY615
	jJKPaktgBdwQTgGTutT1jT9OnRokqwYD4cMaOKLz8Rt+j2WuVSN/v7S2HBqeKa4sZag88qZPcrCdh
	VP4vCo/HbXloT0TNmCUmNLmViEPmiZ3HZhrMoNINbt8weXTTiMwPi1S8ieUCbxJA6FDfHVFMa3Pb1
	t0cNRCEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdY4e-0000000FRrr-45OJ;
	Wed, 07 Jan 2026 18:16:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdY3w-0000000FRPu-1Kte
	for linux-mediatek@lists.infradead.org;
	Wed, 07 Jan 2026 18:15:25 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 607H7cJY3672925
	for <linux-mediatek@lists.infradead.org>; Wed, 7 Jan 2026 18:15:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ecVHGdcKUGcf1BVa43vSmPZjJ3ubI7MYeuQBBNyE8CA=; b=KyrngcOKBiSTWSSY
	izNCCazNvrE8uikK72XmK+Vv0T/Usx1TJnGEi7FoeFr+BCAWxFn5GM7sB7rkw2+R
	xnkxDU2giwWfYxFgRXZm77sSilAwW+XQfLEnbHeNL5YkgC2bF8pOS/2zY6D1p8zU
	ibMfQnY8buGFHBKi37HBa7fzog69JpxFX/4NuXpuhM5+I5jdzJdUKlQP3QuW94x3
	bA1Uys7tKjWqj4sgvnKSkAfyCHp53cZhkuDxbTa5PCwLUHtNBOuNyxLNwnzd34Ed
	j7PZBZxB2W5SxkdUVH/o8ptaf5HAjEgqZZJHE5EDaujMhMdI9SLzwqRb2mU52Aea
	CfoW6A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhum507y9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 07 Jan 2026 18:15:15 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b9fa6f808cso698728785a.1
        for <linux-mediatek@lists.infradead.org>; Wed, 07 Jan 2026 10:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767809715; x=1768414515; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ecVHGdcKUGcf1BVa43vSmPZjJ3ubI7MYeuQBBNyE8CA=;
        b=RxYzEtFPfKExQ5qCq2cMptgBbD+9Dc7L7VwdM+6WbABmpjXvlQvkbRX29Q6mn4QNug
         DFk7AKRp54SYREqcv14J5Mf+M6zmf5APPi+nv4UmbOZmqVV09q+m/FpHebR6crJ+F6uG
         VorezakvTl/jaQBoU66ee4cGWMW/hsr5hEOQmTVtIo52PssNZRsRkZ0xsDRY7HLv0/b9
         AlZfE7OSzFAFL3XbZ1vPMM+hfWgrkYc5o00Xfmhw+JWkjzfhuFfiwy6+osv/xMFXuuWL
         rYZB8vuyV9dCosSxaomxAP9VvtMPEm3V1NcHKcQ6PWfBfgAnXKj7YZcqTBRmDnX53d7S
         uj1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767809715; x=1768414515;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ecVHGdcKUGcf1BVa43vSmPZjJ3ubI7MYeuQBBNyE8CA=;
        b=CuSvP6x3AVgpKV0fw7b+VO9tPRQ1Ului+2LR9DWISArvfzW1e2cWqZBVeWDA0oRiw1
         rx+8cJ+C4xvk4/E/5sVS0eUE8gFla4fpjogmPp9EYu8p8gmFCGPgS9zvYWvkClefK1KK
         E4mOc+i5egb6sI83OVXBmzGh8UgH7BHcFi9F4+6sMnAuVkF+v8mE3Z0Wga+oOwDzPq7A
         8nXX6uFmk3ntGjhwU5BN8HOT8L3Aq4BBp0gZji40mHhhJoBQb/HUe4KmIHDy64GhT0T1
         fuc78BIcP4wmiTfqrwpgq5D8k4vQmGR/b4EVWk3VK50nUxuK6JXng6ntjqG+HtK4TgsP
         25+g==
X-Forwarded-Encrypted: i=1; AJvYcCWrMeb0QZ4WB9YlGvoWvkVLJGRXEh4AuLkcfaGspwr97dshtNhxhKu4IaoUkxtCSBPa2fb+SCqJcyFPPmVIpQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzRi6GbhGMldocSfdCSsBzCupjP5Z/xRGJk3fq8R2C5AMhCE6OB
	3Z4C503EzbwkS/l7qpeknmw7GtojGAwIzloOZrXJxByn7JR1dxEBvCM1AAMeKQCShV1rlhY8jDb
	MTf6k1cvmjSxGV2ZNhxhgkS2bAfnaQz9BLUYlLZMccYTYjx+7KTR6b1jyZKD9W3LkNVjhXf/Cvq
	k=
X-Gm-Gg: AY/fxX7DD4Fo2gTxXPjbid4zw+Cz9g6ctxse21bj3zHR8KtFKfqamTcFdo6k7H/FjxD
	J/n2VhatNBXN98MWJ8koupd1UnNM1VlwCVkrAAM8/pv9m704qPXBtIRopOvkL/vV5NI5WJ9aZX+
	f/7iMLVl8F0j+hUJbkEpZbHuGoaWXgsjz0PrGLz/kSU+9g2A0QA4JWycmf/ITrc1XzVdODDZ+/2
	bCAE4QFpyzDF5AFTbCyu0XTD0iLqxBBqtTw0N3UqD7DbziBv+ybVkDWkiWOrm1FhfJeNJBdMYrf
	HV8TIzKHEs82cryWAA3qoNMMA75O2xdxYnZQbk85bfKmSJOLtCtWRIqWWMa+fGiuC/4omanQD1+
	hMetG/g/FpqyORr+dW1KSPlh9gZrFQ5TxMiHZlUY5M5W8fealRaXFyQvF+JVMovEGtu9k1vN+SI
	fF8BknljgiN614SojxRen5+6M=
X-Received: by 2002:a05:620a:3941:b0:8b2:ed01:b65b with SMTP id af79cd13be357-8c38940dd0dmr456876485a.83.1767809714706;
        Wed, 07 Jan 2026 10:15:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE+D5mrG5EJMb00tLGXnGg/5a3iMwygbvY5+APGv4MWQpPpWnlnvrx9Hf8phdL6F9vP8GwsHw==
X-Received: by 2002:a05:620a:3941:b0:8b2:ed01:b65b with SMTP id af79cd13be357-8c38940dd0dmr456865885a.83.1767809713987;
        Wed, 07 Jan 2026 10:15:13 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65d6988asm1436884e87.80.2026.01.07.10.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 10:15:13 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 07 Jan 2026 20:15:04 +0200
Subject: [PATCH v4 07/10] drm/display: hdmi_state_helper: reject Audio IF
 updates if it's not supported
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-limit-infoframes-2-v4-7-213d0d3bd490@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1357;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=oV58YVZ6PqGUocr9XjdKTVXla4jnp1WcJhUj/fGMzJo=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ2bcoqVOypf3nnz7ysbV1SEu2HFL4awvN5mTrKSPbj51+
 +HNQtvQTkZjFgZGLgZZMUUWn4KWqTGbksM+7JhaDzOIlQlkCgMXpwBMZFMHB8MEnRhDz5j7S+s7
 33/wuCq3e4f0x0ZX/s8/n15gMap103T9tH1VXsdtoTyjK0HrN38MWXF5zjXm73UHjVK8GY/M2v3
 SSqTuxuMI+9iXSq+6WG7sOSCfWmNi1tjVpBC7Sa7Atcb1jx7rMa1jP9dN6+f1uO6p0F7NLHKs7X
 vYqkff23seqZc1hh1t9rINOs58UiHnRuAviVCTrfz7b1QtiT5vyfh3Et+uU3On8c8PKMyJ6V1Wl
 Mzvy3zdzdrznXCNGIfM95Jm3xs73nrUaDuLFp77wabg8FSVhyN77+u9LzM4bD6zrSxoyyi2in6V
 c7dLMv/d453GTG+Kbj738GAInXdKPufnrbyYBYbuh6TUAQ==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: iBoCVlXYkyo2V-Xl7SP-l_r_tJG5C0ne
X-Proofpoint-ORIG-GUID: iBoCVlXYkyo2V-Xl7SP-l_r_tJG5C0ne
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDE0NCBTYWx0ZWRfXwC2y7/2p/gop
 w3CLCcJUMrhTTVweAtltUvujsF2dy70qq8PMIoiBRn1QBvtSN/TwQzwryswzTu1jpeFbaHMXUtW
 LM5hrvXSQW/nlvZnis5FRORv4Uiam72c8ETRza4Sgj3Ach4iH/vlyQuvZsgskJR3U/cO545xbbO
 O2aLqT1ohi0m8KwOrBWY6jon/KLk7snh2bnqXESqSctfXXiaNSL0UT7fF6tfGCVEVKlduKdtkn9
 idRyUPfLt6aRmv1/Vy3Vvo8NyJQ39YpWDCBo/bb4vM4bZWULW5R3jY2On0l8cqdXyo8uFirxiLF
 AAOamq01LqfpmM55HuaCfUAuJDkMjXumDoKIEQFxpc5NscTiBtR/iCa2cUkpvYeB4s6Fdv0iXp8
 TVCv0k0eesGwWmfo6ovAUHtdiBzi6V/ZP8My5lxlDlT4vtLU+3TF1zFq96zMLZMMgHC/QwARGrn
 Dua168/IYdBXFPjpcYw==
X-Authority-Analysis: v=2.4 cv=KNZXzVFo c=1 sm=1 tr=0 ts=695ea2b3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=FWtRXCEnrA9oX9MUO7wA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 phishscore=0 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_101523_389824_BFD1AD90 
X-CRM114-Status: GOOD (  14.81  )
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

Updating the InfoFrame if it can not be sent over the wire makes no
sense. Change drm_atomic_helper_connector_hdmi_update_audio_infoframe()
and drm_atomic_helper_connector_hdmi_clear_audio_infoframe() to return
an error if Audio InfoFrame callbacks are not implemented.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index 5a3817271d91..e8556bf9e1da 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -1061,7 +1061,7 @@ drm_atomic_helper_connector_hdmi_update_audio_infoframe(struct drm_connector *co
 	if (!info->is_hdmi)
 		return 0;
 
-	if (!funcs) {
+	if (!funcs || !funcs->audio.write_infoframe) {
 		drm_dbg_kms(connector->dev, "Function not implemented, bailing.\n");
 		return -EINVAL;
 	}
@@ -1102,7 +1102,7 @@ drm_atomic_helper_connector_hdmi_clear_audio_infoframe(struct drm_connector *con
 	if (!info->is_hdmi)
 		return 0;
 
-	if (!funcs) {
+	if (!funcs || !funcs->audio.write_infoframe) {
 		drm_dbg_kms(connector->dev, "Function not implemented, bailing.\n");
 		return -EINVAL;
 	}

-- 
2.47.3


