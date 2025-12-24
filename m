Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92449E748FC
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Dec 2025 01:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O0WcJstQEewLBWylyM1yaF1uo6Aq9IevUZuM4w9v8/c=; b=IIJIEgGbC68C10UYJZcvigKc/8
	mZ202HiKdZ5Q4psIAF6hxT1CxI1tUXZJoD871fVC9I/OIx1D7HLlipHP4n8HWmS9CpUqj5yZjuB+W
	FlVuYDq7/0LYMRElzPgQVtWHn0e1qxR+KX1Fqp3vO5/OapXKD9Lhuqe0rgSOIMzlI3hhiW+LcXeuE
	8X3VQklp7sgwkdJ1rk/9eqdEmmW0jewEIWWY/FBX59Wxl8KiqH/iLTGpSsmhY8APUf1OFI0579HZM
	Ezwx7KO9Ohc7bTi6lpcXYG5ER3ip3y+08AZf0NoBoZssnJhZxYDPkBzDICC/5+VBD+V+fBbADzPg0
	KiX9qMxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYDIa-0000000GFhl-39Dr;
	Wed, 24 Dec 2025 01:04:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYDIH-0000000GFJb-1m7h
	for linux-mediatek@lists.infradead.org;
	Wed, 24 Dec 2025 01:04:13 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNFr0Z04133945
	for <linux-mediatek@lists.infradead.org>; Wed, 24 Dec 2025 01:04:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O0WcJstQEewLBWylyM1yaF1uo6Aq9IevUZuM4w9v8/c=; b=B5FzLQH/4hdXvpfe
	zRFH90K8m6qtrg/XEWhQfEiFLYj2sJlborOxSU6Ve5K1V7hKJG6ddM5f5hLHr9O4
	G5FXrg+x2+sZ9U/OXiaNp/wHJ9rRB0Js17h6g8QCgkkdYEEOM682EJmWdkRJSwhK
	kQePbxHNlL6j+a/BpNbMONLysUtobbr5nGvrJmzoA9yB0sF9cVMuIU6eE0kaGPiH
	9zYXOPs5JQjKabNmUxd4fZ+aeTJlgQvTv72a/GeIgJrwdHaN0Dd/bJzy1t13hpI4
	C6ekVf2ER33wY8q3E2wG5W5TveJk+urBH5JoBUQQ2/ZGy/5+7CIj2iJgKbR7pbjn
	GsKuwg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7x46seb9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 24 Dec 2025 01:04:00 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88a3822c06bso148684086d6.2
        for <linux-mediatek@lists.infradead.org>; Tue, 23 Dec 2025 17:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766538239; x=1767143039; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O0WcJstQEewLBWylyM1yaF1uo6Aq9IevUZuM4w9v8/c=;
        b=M7ag1W9vhex6H/tjIdWaCXcNOtjxgYNJvNR/VnKe8DrWAK3ocCJeY/RZTviEe+jEeU
         HHmO/HfzOz0pQJ6EoT4rZZn6ceY2V2pI3DOg5+lNePIzBtzQpcbEO53JTFS9/VuW4ilN
         8bQ16XmcKjg/V77jsF6Vvtl7zXdDALPzBVd9+XylUHpoua5bqNQObC7ubz/VOK29uRhs
         74CJ4Zq6RuApVtIg+abCwmFLkxzRld0ggFVoA3tVWuZVW3nVpTj1PzgVe/Bgxrwv5rw8
         D3k5U2Sa+YmcqvxdtwCVZ61zXIJaDIuEaUMXn98CuEydwXn+fXzvNlecdDwcpPWRhHtk
         c5NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766538239; x=1767143039;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O0WcJstQEewLBWylyM1yaF1uo6Aq9IevUZuM4w9v8/c=;
        b=kIfvBXcI5Fg8fVbuT5HUELt5g/vDW+nympU+EzCcdJPBNgn/KwL+6lgnRphx5gCuft
         ZHaHt5IDs/goZDQ1ATCeiCnpCld2j/U3i0eLhW3Ys1yLaXHf0pYO5eklAg2sLXCEOnR7
         Ro2QMZxsrlJUQ6GlKzP9cQLQZ/SrCbjrHRs+qUNUq6GfDnYDtXxXfBdU2Xm1607UJYtq
         /C/OWGSKtk4Kv2D35DyCGqrSv2vGbJT3qr6sA5kR+QA9jH6BDX/yniSL34USxaAnWMcV
         vKGoXkVayktNYnwRCq0yv1+Bq/maPhmLDBP1LxlTSYU7ytOwhR7AwY+VkAfuVmybobRT
         0Uww==
X-Forwarded-Encrypted: i=1; AJvYcCXnNwi5pAUiLqBUqnO3PqwLFlVon17wTiYmv6DJZckca9U/W7pY2nDmhDxqSHUaPQBgVkLfiKVCGNqSABJTwQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7DLAwS+Pj0mIhAb8b5GmMrE+Vy/SiImhJTQHGd1aGFuvXMSHg
	1B0YkCCRZs9tSN9Tjxo59SHtyFLKdZvXCOl/kYHiPwHTI+QIG5NTRVrYyQf8nSSdNVXkl8Mc0sW
	9Rc4nBFXb1xWWWzEaH715v6uEiFqPwpLs69FhvUj9LiSx6nK9uo1u/mV3hh1jwNMYajdtsQtvgi
	I=
X-Gm-Gg: AY/fxX55v9t+65CygtTGA8pyrSHnOw+3ai4qb6XZM5jL3+lS61VTXDDqhTLQJrawaS6
	lYqDpeE3OblAc831iUyRN3ZeePLsVtvY4XEMmhIDSzYt8KfljFGFVjh94Ln9G5AQlThXslNZYtK
	Bum18y471pbzwyChF9YjLZAuDE7OI7roaOFkXRUXxDkbR6aXXOxcTTELk/C/Bb/w2BR1uxc5siA
	LCYm8AgjU5HAcNZ1v+tdC6glDQ+DB/Sd832NNz0G2Nf7IMudIahJVkjz5d3TK4ATKiTUclV9Vdm
	TlLeFevpRZBJEu+3JG3kofhNMwviQwvHgdSYfqgF8ngazwcEmIo25+J9+kExdRJYIorVF5+oJEg
	wZP9ntjrVpwubCU0xE4ZzZkPJH6sPEm8nO3jQchm3B502VK/cdXG+WzVXQMogbQfZyFGsX3x8uN
	gxsDn72+ERJVmOnTpvp3fGBO0=
X-Received: by 2002:a05:622a:4d0f:b0:4f1:cd72:f22b with SMTP id d75a77b69052e-4f4abd98192mr256225901cf.52.1766538239466;
        Tue, 23 Dec 2025 17:03:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEQGuGT0UI/67dXu411P/e6eStajQsFB8+nCzwFqQBAvO4esgI+rdZ+y7jVSLNcipwTefBy2w==
X-Received: by 2002:a05:622a:4d0f:b0:4f1:cd72:f22b with SMTP id d75a77b69052e-4f4abd98192mr256225241cf.52.1766538238937;
        Tue, 23 Dec 2025 17:03:58 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18628284sm4545268e87.93.2025.12.23.17.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 17:03:57 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 03:02:57 +0200
Subject: [PATCH v3 08/10] drm/display: hdmi_state_helper: don't generate
 unsupported InfoFrames
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-limit-infoframes-2-v3-8-7fd3cacfefed@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2020;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=sxrbcfgP+1lHt6WjBr3iluImnNCx0aJDmiljrTHbhwQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpSzvZLWWWNHwhc00YhsGGHeZN4blSTiSB4fsQ2
 dICD4LJEyWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaUs72QAKCRCLPIo+Aiko
 1TXpB/9MY/IAmp3a91kMBGdYigbcoUHZMxaQmuYtcY1pIt9hLZ/xDG0HyDeKfdb4ZXPmrbxM+Lr
 sZHIZRai5kkZBYBHRbs1UvhqFPaEKWCBVQ2Okq4Z1fFonAOh7dEtqQxrre3ELHCo/ljQz4N4wif
 r83ry1FetVmArWVlTeM2HjwKHkCtccISoiLzXtBF/vjY/mM4/GPwg3Vgf2yuvlfOviragLloVE3
 bKNPzT63BmazQ/jQ/THvNVxTXxfLg7YxC6jPXiOFdD16vj7gkXrw6SeuFK7IBzesw8H/JFK5eGM
 6letmWY47KyLynSka/FTDRJs5TQaxz+pxi/8ZGoJLndSd0+D
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 8ALl67xMOlgXQ-d4CO_SKirzgj87T7G_
X-Proofpoint-GUID: 8ALl67xMOlgXQ-d4CO_SKirzgj87T7G_
X-Authority-Analysis: v=2.4 cv=aOf9aL9m c=1 sm=1 tr=0 ts=694b3c00 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=dmsjDmb_ix4f0IDqKoUA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDAwNyBTYWx0ZWRfX71OEZsznlckk
 mh97Wj7WeFh3UzhI15oz6cFssHfqq0K8YcSvZIWiffmE+sFPNdTM3zofZKBvSXnT+qs38goPvfr
 ztvpp2CB39FHiZF5C60t8Tj3rz36B+1d3CiNzvRSVVOojwr7EdBRMU8xlqaZVUbQWV3dIDf/z/g
 zAyrxfnVpcavCxGx5iQe83YksgAOQtqT5hzoY0p6fr2T6ccVo7SxTjvVnhQhvIdYXjP+htCoElh
 +bKnm4WYC9tRq7zbwRw6AqSTwjWxZcBdKDVsUVqQ83W79EKPLBeDq8pfWqPx1KQaLudY3AI9Z7M
 eikXJkAnYmUTq4avCXmmGqc2WacjntnWTk2zZjqySW3yIiuGWoE8cLA0xxMvOgFrCzai8rpMM/q
 8MvuHxZiGG7mQGk2gGXLP1kidPL5wx3SZV6Uw7s5DWOe96HIV81uNV+fLEom+SAN8gJNjMOGFYK
 YRc5msKaWROT9eUB+MQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_05,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240007
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_170401_548582_3EB2EA71 
X-CRM114-Status: GOOD (  17.34  )
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


