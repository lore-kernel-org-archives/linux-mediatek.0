Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A2AED0D15A
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jan 2026 18:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JPs6IVrvHQYSHaamgUjrxzM3vyFi8BapYIQ1hzBD3c8=; b=2KYQvShFcsy59ezbvlPx/69rux
	GcYbupMB07vxVCvuPxxOJ6BDfNjV7dm6b9V4S+JYFXnZTAALYswc7i1tZMJJfCvjAggofL3YMgmzf
	bCrDWBuo2Ec1kgzqxHMltmawzF5VTbyNIp/NRpAOnNe5WH+QZNrpWwsh1W31Yz5FsUp78O0+lbbDG
	8t6CRqBwn9t0FaFLH+R+h8NosYXjFm6BJQwOZCznO4qwqJpHZKpjpDEKfAVlsJACSk0D6PDspKI/v
	LafD+vPq0IDydc2z8e6177KxHDKZa18m+mcp48YPOzS/SwcN00fe66lz4+M+GiGhvIjq//cRP9RuL
	WV11Duog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdY4s-0000000FS51-1Lq9;
	Wed, 07 Jan 2026 18:16:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdY47-0000000FRWA-0sbF
	for linux-mediatek@bombadil.infradead.org;
	Wed, 07 Jan 2026 18:15:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=JPs6IVrvHQYSHaamgUjrxzM3vyFi8BapYIQ1hzBD3c8=; b=JdJMM+h/9wSi/q3FfogJ+qc21S
	hd8LFsMRmyiAhBnlGothvGRpO9x17JTM4x/Dtmvf5subwS3N1sR2BzzXNDSD1VDHohlkG8OO/1NFv
	as1jIbX0w53o7HXTEnwAqDUdLTgLvNeXJuztyfb4lOkNhH2i4nlfQZPDiD7O9ISqRhQuDxvD/vHaP
	L2fjV0aoh+yHCJyXWa+wC4WYEyyI02G1RVmiJ0js5jEhxA2w6GI0/zDV0CgQjP2sMk9nUvrQ9NYTn
	J8N61cMsP5TZY72lbWl1WogPE7N8cblyhfLFVp+dYQ7fmD9moNl2z5REKx0NP8roU0o7+t8PB4/Iy
	bTAvdEgA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdY42-0000000BtJ2-0i1C
	for linux-mediatek@lists.infradead.org;
	Wed, 07 Jan 2026 18:15:24 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 607BMTGa3152713
	for <linux-mediatek@lists.infradead.org>; Wed, 7 Jan 2026 18:15:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JPs6IVrvHQYSHaamgUjrxzM3vyFi8BapYIQ1hzBD3c8=; b=OpUmQbYb1j/NSFYk
	Xft3zpHcpuFEAv3CwOsCEDm8TTZut6f7fktTiYhP1reTavXR/x0cZtP0e3AsQjk2
	Kd4d6fr83beQDg7xLfrwhBhAE1TfPfdQLKTzu0NA99ht3KT3l1jDTgchxxzV/8nA
	msygtyBCiUhJg4YwVhjC0/Yw4oEbkJVb5gT29FunL44ATkzFsPDvFDPjYgCoR5ls
	J6Ghe+PxRcaqeJPPU3PMEpgkcVIcCIzeIl2l+M80+JIOz89logld2RC4jfJ53ZQm
	YKlxv/l+pU+RIUbbZPSXmCUkNA3IpMNQ3klIl0c0i1wuE62sfSsCVDo1NuIrb25t
	HacGAg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhpjasaa6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 07 Jan 2026 18:15:20 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b24a25cff5so722228985a.2
        for <linux-mediatek@lists.infradead.org>; Wed, 07 Jan 2026 10:15:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767809719; x=1768414519; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JPs6IVrvHQYSHaamgUjrxzM3vyFi8BapYIQ1hzBD3c8=;
        b=hzmqpVq+PYc7FeT0Tq/Ssxat1hGg9+MlogrHWrrOfQvhaWYoVBdl8nUcFWCQu/rLnA
         OrOHXxQdJgnZvvog8KyUkbOlIINSFK8TFzBpRFq6OQevamBwHaLzujnByNBhgcNYYxLL
         2wkQmyQkjCeUeLD/tFRWfD0a2CsAVpt1HtKxLsqISFRE1+pLVtFDiMhdiVq4EC3HnDVS
         T0d4N8GeSn7A31VVzMVHE9R/EHSJGrKLGsJxZHVb6PfyVQqSx++/5r/U9xTqKIcdYf3q
         5oxVuOF9bjSFo5F6gj8zFYjpCl4g0PLmsXemzL2tr8We91YMlcI6foZuDgCd3Vm7Xdn8
         DGBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767809719; x=1768414519;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JPs6IVrvHQYSHaamgUjrxzM3vyFi8BapYIQ1hzBD3c8=;
        b=dANAB2naGVNfjS5PWJxbQrm8Q1Wz7HEYSIlAE09cCJ6EaWEaKBoWV0t2ytu/Q9iYWG
         pfy0c50GVXVQRExN/NzGx8N0q6san4ZyBFIp20Uyu6WgCd5FnXqmzWW+GF75kBSDPVyr
         Pa6AJeuthcsEB2AkmtASbPqZDQ8MM9LOYY//Ozo6YAKq0xIAw7SHzRLgocgN36xIjlpD
         foBvT7hKph+Wz1vff11YUK5PyrQMNUMD1HQcWR7sCRFFnar8RlJlyHCctPuBIPMt+fDQ
         PHANP9HRJuB48FkMQ89/aVA2Kt46m3pqq4bdoJwj15400a10J99TsnN7rNtgouNO+L/l
         ZN3g==
X-Forwarded-Encrypted: i=1; AJvYcCW5MY/4OYOD9u3fdycubn02SBrVWJkbAn52iBJct9N06MLftnu5JlbXjrmaoMuIEATu+iZsugFeIHEYrXmVlQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8H2SLpJyaR5xgHw+oUZscfmd9B9bvFe2ZkY75uL0O7yle5qtM
	MoucTXk7b/ksXDrkZ6azle4cYuObA3t45vpHLMDh1ZRzDnBZaZhBfxarKw21HxwjeaFpf8oW8QL
	0jwlYOUOASCAT/fH+UTaj8L6RHoVtA3BFmCfPFSPS57QF9ZLKedN4hU5IbDG76/Q12txyxNhsdN
	4=
X-Gm-Gg: AY/fxX6DGPpGUoKLpebVZIunpPmOxc50wo01zjxZE+lDlIqMHfToMvT75VNXXu1Xy0q
	v3ajIL4TG5HleFXmZiHetiFHnG3gH8IXIaGL+L0crrc+wgPD46x2emSGsbnrUAnOL1ToaaZVgc5
	ANS7K7GKGuzL+TffKRhcZjtzm2U17XhvoR6z5vWbxd+XoK6MxX1EmhdYJh/aGItDotJuZmMgJrq
	50cS4UtjtF47bsPgPsE08beJ5UzpWmzBLNycQBWsevzI2zP4U8oC/4W5WZS33cJCPXqT5p0auSy
	Uth29XYr5r1s6ttdupiXKdatI0WtsPOCtKs9BG/3RzHHy5kt+U1PhxFeKD6pWT9Itp0DO0ycY5f
	6gTOvGUzKAopisRV6mbyl00TdH70ju0nDalvej9GnnDo5Ff7HgEJ/mOvu7esiv7S2KLvwFuyaQn
	J6/K4OwVKyGo+OEv53rFWweeM=
X-Received: by 2002:a05:620a:2a0e:b0:8b2:f145:7f28 with SMTP id af79cd13be357-8c3893a26a4mr408411785a.33.1767809719371;
        Wed, 07 Jan 2026 10:15:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFUjHXe7uuYeZEqUMuBR5K2kia77K+Kj14ZWPxBppIzS2JiKcdZruRDku2629OMG4LVhagWmw==
X-Received: by 2002:a05:620a:2a0e:b0:8b2:f145:7f28 with SMTP id af79cd13be357-8c3893a26a4mr408404785a.33.1767809718716;
        Wed, 07 Jan 2026 10:15:18 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65d6988asm1436884e87.80.2026.01.07.10.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 10:15:17 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 07 Jan 2026 20:15:06 +0200
Subject: [PATCH v4 09/10] drm/display: bridge_connector: dynamically
 generate HDMI callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-limit-infoframes-2-v4-9-213d0d3bd490@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6894;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=j/nplc82Uc8n6ck55GeREmF67vUj6ZFIListkklkuXo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpXqKlQWZc4/P6jahK/bWP1w2B50/o9TLzfzbdf
 aaZXx2QNIaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaV6ipQAKCRCLPIo+Aiko
 1f1FCACoKLk12kYaWdypMvDCzHmH9N8HbMOWbXMZlbluaF79NkCtoNgDonKnKHxYLa9pjqgX17e
 Rvd8pmDpdv2MOg3WP/GMXH5pZGxRG01FGl7SBtEPw2/YXYEskTFSEq6fG4I+tv8X5Ly85MqO9Lj
 9cHsDJOJq0hBFlwxVPg4mvAka59hwWsW69lgA6euCJbibpFCioBMCghtCslqHcxkjZWM/PUGgNE
 Zgf3lcR3ZdkGqSnlQlrowNKspjiwnAe/Q7/uXCEP9N6R5jyGzXlQUqTGFKBPnuzMfXGuvLMm4dg
 RY6CU12eS8wodgZ5W3Ilm0fcBuf2GFwlR9F7fNEmqQh95vO+
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=efMwvrEH c=1 sm=1 tr=0 ts=695ea2b8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=SmQ2dRXw9u10PpR7_9MA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 4CQFOPomRvj7w7r8urzR-97e1LkaUxXA
X-Proofpoint-GUID: 4CQFOPomRvj7w7r8urzR-97e1LkaUxXA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDE0NCBTYWx0ZWRfX0oaKr3quJBVQ
 Os8gT3aw7N6VXXmlRcwz1ajTCNIAG3IRmnXlaAs2GlG2wuU0fXgoWl+EIPk0y45TebdFG3Su68/
 gXPwiMC3DLoJJ+NtaTem0IFWI/gFccqPYRbJJYwIaqAttUjDN16/c6WCXQ3cdd4+ZsbUqQKbvQj
 FNitgQ5X38kf1H4WefSnCoUD15hk5BufzO6Gl1fOZgKs25A5GdfAGwdTCMdtcxw31Pfr62CVlqR
 3+l6tNCV7Lh4QqylyWFLT5KckIscz9Q5A1Mtrw+VtZpZ7vGj1m/iiiYpiQQYHHXC98Yc07YGAOe
 6XzH8mURXa3ytFlR3v8fwfVy7KRERPyUnnp8noU861pIkT9D4sLWFt8bmTOcdHj14FTJeU5ORyQ
 2NKQsL7fHXYS858yc30UUqQF8qlglMxacss4vWwUcf9T3TXML8taycxp2sK0cal2e7NIBQTNsGE
 TmRet9okD6iYi44hLAA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 adultscore=0 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_181522_596488_523FA5D2 
X-CRM114-Status: GOOD (  17.13  )
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

The rest of the DRM framework uses presence of the callbacks to check if
the particular infoframe is supported. Register HDMI callbacks
dynamically, basing on the corresponding drm_bridge ops.

Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 94 ++++++++++++--------------
 1 file changed, 45 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index ca6a72a4cf80..ba8ff113cff1 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -123,6 +123,14 @@ struct drm_bridge_connector {
 	 * DRM_BRIDGE_OP_HDMI_CEC_NOTIFIER).
 	 */
 	struct drm_bridge *bridge_hdmi_cec;
+
+	/**
+	 * @hdmi_funcs:
+	 *
+	 * The particular &drm_connector_hdmi_funcs implementation for this
+	 * bridge connector.
+	 */
+	struct drm_connector_hdmi_funcs hdmi_funcs;
 };
 
 #define to_drm_bridge_connector(x) \
@@ -465,12 +473,7 @@ static int drm_bridge_connector_clear_audio_infoframe(struct drm_connector *conn
 	if (!bridge)
 		return -EINVAL;
 
-	if (bridge->ops & DRM_BRIDGE_OP_HDMI_AUDIO)
-		return bridge->funcs->hdmi_clear_audio_infoframe(bridge);
-
-	drm_dbg_driver(connector->dev, "Unsupported HDMI Audio InfoFrame\n");
-
-	return 0;
+	return bridge->funcs->hdmi_clear_audio_infoframe(bridge);
 }
 
 static int drm_bridge_connector_write_audio_infoframe(struct drm_connector *connector,
@@ -484,12 +487,7 @@ static int drm_bridge_connector_write_audio_infoframe(struct drm_connector *conn
 	if (!bridge)
 		return -EINVAL;
 
-	if (bridge->ops & DRM_BRIDGE_OP_HDMI_AUDIO)
-		return bridge->funcs->hdmi_write_audio_infoframe(bridge, buffer, len);
-
-	drm_dbg_driver(connector->dev, "Unsupported HDMI Audio InfoFrame\n");
-
-	return 0;
+	return bridge->funcs->hdmi_write_audio_infoframe(bridge, buffer, len);
 }
 
 static int drm_bridge_connector_clear_hdr_drm_infoframe(struct drm_connector *connector)
@@ -502,12 +500,7 @@ static int drm_bridge_connector_clear_hdr_drm_infoframe(struct drm_connector *co
 	if (!bridge)
 		return -EINVAL;
 
-	if (bridge->ops & DRM_BRIDGE_OP_HDMI_HDR_DRM_INFOFRAME)
-		return bridge->funcs->hdmi_clear_hdr_drm_infoframe(bridge);
-
-	drm_dbg_driver(connector->dev, "Unsupported HDMI HDR DRM InfoFrame\n");
-
-	return 0;
+	return bridge->funcs->hdmi_clear_hdr_drm_infoframe(bridge);
 }
 
 static int drm_bridge_connector_write_hdr_drm_infoframe(struct drm_connector *connector,
@@ -521,12 +514,7 @@ static int drm_bridge_connector_write_hdr_drm_infoframe(struct drm_connector *co
 	if (!bridge)
 		return -EINVAL;
 
-	if (bridge->ops & DRM_BRIDGE_OP_HDMI_HDR_DRM_INFOFRAME)
-		return bridge->funcs->hdmi_write_hdr_drm_infoframe(bridge, buffer, len);
-
-	drm_dbg_driver(connector->dev, "Unsupported HDMI HDR DRM InfoFrame\n");
-
-	return 0;
+	return bridge->funcs->hdmi_write_hdr_drm_infoframe(bridge, buffer, len);
 }
 
 static int drm_bridge_connector_clear_spd_infoframe(struct drm_connector *connector)
@@ -539,12 +527,7 @@ static int drm_bridge_connector_clear_spd_infoframe(struct drm_connector *connec
 	if (!bridge)
 		return -EINVAL;
 
-	if (bridge->ops & DRM_BRIDGE_OP_HDMI_SPD_INFOFRAME)
-		return bridge->funcs->hdmi_clear_spd_infoframe(bridge);
-
-	drm_dbg_driver(connector->dev, "Unsupported HDMI SPD InfoFrame\n");
-
-	return 0;
+	return bridge->funcs->hdmi_clear_spd_infoframe(bridge);
 }
 
 static int drm_bridge_connector_write_spd_infoframe(struct drm_connector *connector,
@@ -558,12 +541,7 @@ static int drm_bridge_connector_write_spd_infoframe(struct drm_connector *connec
 	if (!bridge)
 		return -EINVAL;
 
-	if (bridge->ops & DRM_BRIDGE_OP_HDMI_SPD_INFOFRAME)
-		return bridge->funcs->hdmi_write_spd_infoframe(bridge, buffer, len);
-
-	drm_dbg_driver(connector->dev, "Unsupported HDMI SPD InfoFrame\n");
-
-	return 0;
+	return bridge->funcs->hdmi_write_spd_infoframe(bridge, buffer, len);
 }
 
 static const struct drm_edid *
@@ -591,18 +569,22 @@ static const struct drm_connector_hdmi_funcs drm_bridge_connector_hdmi_funcs = {
 		.clear_infoframe = drm_bridge_connector_clear_hdmi_infoframe,
 		.write_infoframe = drm_bridge_connector_write_hdmi_infoframe,
 	},
-	.audio = {
-		.clear_infoframe = drm_bridge_connector_clear_audio_infoframe,
-		.write_infoframe = drm_bridge_connector_write_audio_infoframe,
-	},
-	.hdr_drm = {
-		.clear_infoframe = drm_bridge_connector_clear_hdr_drm_infoframe,
-		.write_infoframe = drm_bridge_connector_write_hdr_drm_infoframe,
-	},
-	.spd = {
-		.clear_infoframe = drm_bridge_connector_clear_spd_infoframe,
-		.write_infoframe = drm_bridge_connector_write_spd_infoframe,
-	},
+	/* audio, hdr_drm and spd are set dynamically during init */
+};
+
+static const struct drm_connector_infoframe_funcs drm_bridge_connector_hdmi_audio_infoframe = {
+	.clear_infoframe = drm_bridge_connector_clear_audio_infoframe,
+	.write_infoframe = drm_bridge_connector_write_audio_infoframe,
+};
+
+static const struct drm_connector_infoframe_funcs drm_bridge_connector_hdmi_hdr_drm_infoframe = {
+	.clear_infoframe = drm_bridge_connector_clear_hdr_drm_infoframe,
+	.write_infoframe = drm_bridge_connector_write_hdr_drm_infoframe,
+};
+
+static const struct drm_connector_infoframe_funcs drm_bridge_connector_hdmi_spd_infoframe = {
+	.clear_infoframe = drm_bridge_connector_clear_spd_infoframe,
+	.write_infoframe = drm_bridge_connector_write_spd_infoframe,
 };
 
 static int drm_bridge_connector_audio_startup(struct drm_connector *connector)
@@ -971,11 +953,25 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 		if (!connector->ycbcr_420_allowed)
 			supported_formats &= ~BIT(HDMI_COLORSPACE_YUV420);
 
+		bridge_connector->hdmi_funcs = drm_bridge_connector_hdmi_funcs;
+
+		if (bridge_connector->bridge_hdmi->ops & DRM_BRIDGE_OP_HDMI_AUDIO)
+			bridge_connector->hdmi_funcs.audio =
+				drm_bridge_connector_hdmi_audio_infoframe;
+
+		if (bridge_connector->bridge_hdmi->ops & DRM_BRIDGE_OP_HDMI_HDR_DRM_INFOFRAME)
+			bridge_connector->hdmi_funcs.hdr_drm =
+				drm_bridge_connector_hdmi_hdr_drm_infoframe;
+
+		if (bridge_connector->bridge_hdmi->ops & DRM_BRIDGE_OP_HDMI_SPD_INFOFRAME)
+			bridge_connector->hdmi_funcs.spd =
+				drm_bridge_connector_hdmi_spd_infoframe;
+
 		ret = drmm_connector_hdmi_init(drm, connector,
 					       bridge_connector->bridge_hdmi->vendor,
 					       bridge_connector->bridge_hdmi->product,
 					       &drm_bridge_connector_funcs,
-					       &drm_bridge_connector_hdmi_funcs,
+					       &bridge_connector->hdmi_funcs,
 					       connector_type, ddc,
 					       supported_formats,
 					       max_bpc);

-- 
2.47.3


