Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65CD8D0D15A
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jan 2026 18:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CvOBqRWntd3xVSUEtMwnv/Rm6Go596skSwj2MkU+rb8=; b=n26NSPn67zFN4CKiF/ov6ApuNf
	43YmaKbzRr5ljeeOlV/UBUC/9QC8EDnK/AFrld6fS7+Cg2tuFwezCjXitxMyIL1zhyjqPfdOpVUdT
	IBiZGJ4xFlHie8WSujw4rs8n5gPJMISOzSVPDHq92UYtiSx3EDVTwNdmLVtcbRB5EanD8jB1LeAc8
	hf4wgfVsasCqZACF+Lu8HqzTeJvUvYFVJnxvFf4W8KuTorO9f1G1YeSKxOd4zdpfSKvpklc8569YP
	phZdNnOhIO9Ile73l1+ATCYo02kO+kjtmz66WCcKTzlRw3iald/3UDJ2RhsnZj1XCiEc+vaOeGT0z
	fiQtH9jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdY45-0000000FRVB-2h62;
	Wed, 07 Jan 2026 18:15:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdY3n-0000000FRJ3-3avU
	for linux-mediatek@lists.infradead.org;
	Wed, 07 Jan 2026 18:15:12 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 607H6eQ72454263
	for <linux-mediatek@lists.infradead.org>; Wed, 7 Jan 2026 18:15:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CvOBqRWntd3xVSUEtMwnv/Rm6Go596skSwj2MkU+rb8=; b=LcvKs90co5qyoc2Z
	d/DIjr6T4wp6peOapih1HLy3dVAbvLTC7P2Kndnry/iEomJs8OzmIVngr3ixTOg4
	tVc0xZ0DdmPlAIFS82JO8PKad+Hq37EPFHDDYa0GXy6zgBOnPD7vJ+6HgBeCQiT+
	G8XV72EZ8iahnPwLPnscVkw1z9E1UZMXnq1dgZHv7GYsWAjoLBiC4TN5mTDh6g/J
	6uEGqMsEJNdB6obsu3FYwEUHg8rQ/O4SdEcPEIwhJuQIkWpFmUB31BYP1mcGpKNr
	8ZksV4agCherUaArKSC/9gV6QqRKNRz+GmwyFyV4PyNrFAU9PP6VNmmcPKTYAFYo
	Lf4E3A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhmnbhpt0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 07 Jan 2026 18:15:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2de6600c0so611863785a.1
        for <linux-mediatek@lists.infradead.org>; Wed, 07 Jan 2026 10:15:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767809706; x=1768414506; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CvOBqRWntd3xVSUEtMwnv/Rm6Go596skSwj2MkU+rb8=;
        b=P7QzqBhkqofOFuQUZNVFfX6OrSMtcQLXr+pujaSe+db3s3snHJMtXk56G9ItxNl9Sd
         JNQU4ssjkEeutwctXRRmw8AjGewd675FYfFl0gxUEYlsSCTfIcH6nQZzX5O0NSjWy5Jy
         1QGK19FKme6h+XR9ukYu6Tcf8q33cDP6l7ASgNLxRr7C5WoaO4J5qxQdnBBBSb1Ytv0Q
         wWCyVrwbTOiGHo7q7BaJNFtA8NfDui3RUxZ2E5wvK8WYbR/+d7de256K654Y/yIGKyS/
         AnKESczjc5Et+4SYUeUd8iOGZXX2wvAmsQJUrx/CJ2NEX8lAFi7tBpIW6JBsj+KW5rD2
         G0Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767809706; x=1768414506;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CvOBqRWntd3xVSUEtMwnv/Rm6Go596skSwj2MkU+rb8=;
        b=FHKOjE8RIAHcVzJt8MTupazZdQoHdwaJeV1/wBz3GoN9gYr687vRglfijTwLQoftDw
         aehn4MxWD7shexvUSw+eT7mSl9Sq9F6rFo3DLCBvlKt4kHTdG4qvtZaM33qZVcHGZFUU
         u2TKmmL2z5teE/wkGry2DY3iWk5vMG4OnBx59b1TvgfP33Cujc8c06uTwYbJ097w4vqQ
         rtS28z85i53ZrS6zAQZ2UHhTLYeQWiNbVkrYwNMNjYpe1el+f+3hg7r7NtZ20mvPb2zw
         eHIRkDX06wNXcSOOvC/0r5RwqnRhpkSx8xsIiPsJa93N4X0kdoOoL6v4sDr24V6uNV6P
         K4XQ==
X-Forwarded-Encrypted: i=1; AJvYcCVILy9NULS3ftuSR5Zwz1sgIk48E1vfEZOXnbPrJN6CS3CB6kmML2AZPhzp1fFBfqKCI8VJyYWPbBlDaNrx8A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxMcCZt0eTlkRsVWnNV4Ho7ownkeL9vFC9L4GUv6TiC9kaeOt/j
	QA9oMqdktJIZpceSztOBAgDkRZVHiY4Ip4jjwsmWC1kaS+AVt0n8VvxEP15kNJvqLbHIvkLtufr
	PrUBd2jaGBUj5FITNnYLspB9LJQNn4eQ7MgZdVrQXan6QNG7eAUPJl/o/Obcx2fCWwA0lvkddaP
	Q=
X-Gm-Gg: AY/fxX7oOyYlF+rYG0TkC/fUZ0QLZwHSibyUS/tl/29+WxIssM1JfB2kXSDKHNy0b54
	7HZm0CBJqQqN/gTcAyuxT6guiJveNKC6whzmluczNGw8kHYnwGrA0pE0eOeJVauDs2Pqpq/71n+
	xDeyQzTZyzthGvXSCUDWOKZYUlrOcrNyGAv0WJ2vF/aFFtogLU0lEzPCU3FJSEhSC2ByeehTUU9
	5jH7NnwOG7L24BUVa3D1C+RUNKNS0Bi23CSiKez2k3YmmPyWlBGFd5isAce+cvNyKRCCFGRDiGI
	BSl7YX+gooTDVAJk/voz91OKjnQicXhI21/vggMNQGf4K+BaJfGmhaba8SxQbcpt7ngr5pXAKHE
	h6UNt16W5/bG9ero/5upeEtFhdZdNkQm+vA3LxkVKTfPVD9/e6nz9UYulu8NSTex8hkUcj2uRlK
	gjPhHqUSs49nDlfs1bKo6MPjo=
X-Received: by 2002:a05:620a:298c:b0:89f:5541:b5f5 with SMTP id af79cd13be357-8c3893751a1mr451570185a.17.1767809706366;
        Wed, 07 Jan 2026 10:15:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IErco6iIlONdm8FoPmBoVGT4sMle7p6Daei/gbTGJZ8AsHe90PS3UuyAzSsRgYRNtmFv/UWZQ==
X-Received: by 2002:a05:620a:298c:b0:89f:5541:b5f5 with SMTP id af79cd13be357-8c3893751a1mr451564685a.17.1767809705824;
        Wed, 07 Jan 2026 10:15:05 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65d6988asm1436884e87.80.2026.01.07.10.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 10:15:05 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 07 Jan 2026 20:14:59 +0200
Subject: [PATCH v4 02/10] drm/vc4: hdmi: implement clear_infoframe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-limit-infoframes-2-v4-2-213d0d3bd490@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1749;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=YjRxdH2GhgCXavyWIwCH6N3bsC345EISvDP2gtesFFg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpXqKkcDiQpwhgi0U0jf8JGOrxJBwtl/l5GypPK
 coPxI4tELuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaV6ipAAKCRCLPIo+Aiko
 1fRWB/92FTnBMUcYj37wwL0tkj2+9WhnXCNr6YaqOXhJHzBvMN3Ric79sLxWIk6V2x3r2jYCRTc
 BkdlD9X0pnL+Hq2degXIglnJH2gA1p7PGCVq8s0gm0v1ELu41JL4luLf8f6sJieWu1QXoaJk5qP
 79zPwaA5N2vB9hfx5p+R6t4e8pTVe1kMeFaRCUvqmAe1Kovi1sIZ1KaVq04n6rv6Vhjro5yFiFn
 LyRakv9HjVWBfthh1kbm1YCWTU0Rh+rmb3pMmr07+I6SSf6xRRJ0Yq6B0EcopvIhZhVA3ayoLhz
 savBzIEyxFTHux8IDyABCGHnOtOfh5srllF0nQkfQKf8sNtQ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDE0NCBTYWx0ZWRfXykVqcik9kR9Z
 ihRWEIdR6SWoO9aB/pJkKHeqpxDqF63cvVm0N/2pLGA+Bd9D9vVYYZM06DZM67S3K/FD9nJTrzZ
 wypkmj46Welb7iMjIbACxwzkZD2o7RIs1l+uyKlFqYPxd1xaO32eFa+4wiGXp7+fmbAMxj/u6ps
 ftQkVj52so0IljXNYuyJhjUXxu7PcCSGGGnFZE3LhAPkgDRJpyuSmCxfIuLUIDTGFMHl/ih9xgo
 GUBU5ISMuvRdwq0jtInovwvC9RF/jDyhOghN2uDGEt6FBhu5zp38L1kzlvSSdUm7UOap6nF17l/
 FyFA/lDSXTsnrKVxdOfegtDV1alC8N3GrYHZtd9pvAUninfAgcLM4NZ2uuaqIY/Jiv9LbFurZ/j
 02CNhvm7qFXYAhX9QvCu5xdTu3nBsFJB6pR0K52NxfeRQ/LN1FobbaqYT8hjuavWPf+guEZZh9C
 xeldsxN2cxtBI+OOSTQ==
X-Proofpoint-GUID: HxUtFdoE_8ook07GV06mKv4WYklp6UJ0
X-Authority-Analysis: v=2.4 cv=eIkeTXp1 c=1 sm=1 tr=0 ts=695ea2ab cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=gsP-wGJUQ9tQerkYUh8A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: HxUtFdoE_8ook07GV06mKv4WYklp6UJ0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_101507_896930_329677FA 
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

Implement the clear_infoframe callback, disabling corresponding
InfoFrame type.

Acked-by: Maxime Ripard <mripard@kernel.org>
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


