Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFCDFE74904
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Dec 2025 01:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wLWwE3+OeE/g9lVfst6cEgHRxD/v4AAQeIf29KzVQzU=; b=SLz89SXoQsfLPiiNH8RgdZVcJZ
	UZk6mk5EaNqd1v6Gktg1Z30jpPrqA8cUVtK1igJtzPDkAoRhZb5ufJB9LfFXTPbs1ulpfu6e1zar0
	tcOtoeDHBM3LCWtICYQfs6sI20y5vHmIVk+6/hsOsOx2QMfpHO9RlcKxQOlOyrYkigGWirzn7tHRT
	hrWrkZuU4qhQHEK+h9/hwylR9bWwVaCnQXTWXQfvb7ouxdMmsrP3rQXDKutleCDRYdrpZCKIcfd5f
	ksD5N4Oz8ElntDwnK2W36Me59l12EB0yK7wi7D4e4lAwkhsZZwSheqhse4N6/EUJ6UdrQZmygKccb
	FGvybxGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYDIm-0000000GFtA-04ex;
	Wed, 24 Dec 2025 01:04:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYDIV-0000000GFaO-1RHv
	for linux-mediatek@bombadil.infradead.org;
	Wed, 24 Dec 2025 01:04:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=wLWwE3+OeE/g9lVfst6cEgHRxD/v4AAQeIf29KzVQzU=; b=qvMWQUNepQOIyR+Vwec8oiGe/v
	H1/+4OlALococFO9B2lF1omn4kVMJia8Kt+KzHxO9VjMDgGeBpjOH5WNSOKkMNv4uF6zqpE/+hrYQ
	/c/EATh6Tnsejb78iMkdctbzwi5BtSzpPBuuaFs/bjlbp6nzbN6VBUpq4+7esFavxzdowHVNpFzl9
	qvSq0U0sWkT7IrLxzbKiy4gr1YWXhdqiMLPy94HDbatGFkJQAiJkCvKwVSF7zZuf4+Bf+QURycAdv
	UIhHp6zEv8HfosYCXr4nCqWnqzHAUahLtJKBlTJG0yy01HdQut1jsS9NXAGnDYgoBr2713IE1nIom
	JwGIP8IQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYCQv-000000002Ee-1dDt
	for linux-mediatek@lists.infradead.org;
	Wed, 24 Dec 2025 00:09:01 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNFnUgF4044456
	for <linux-mediatek@lists.infradead.org>; Wed, 24 Dec 2025 01:04:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wLWwE3+OeE/g9lVfst6cEgHRxD/v4AAQeIf29KzVQzU=; b=ocinDGINcuRyGvWv
	qgltR7lMm4frTJ+aSKEOdPX0aqzZyqJpD0PaCxOFOPgiQGr8laYQxH2lb7R7e7GV
	StCQHC4ToUZakKAcrVPgk8iBJI3GUxmqXWxjHc+jc0ITFaURqs/zzdephK0ypwMg
	c9+RTYdv7+i4SA5bdkwOcom1HHKM1OVl1zHW2rjDg3VtGG2mZKer/0Xt9/vzIZ1t
	QBiyCjKVR0pAYq4M5lmdEu+yxeZgw7/mFMGtCknAggjID0J53oUXjiHrgmUm4kD9
	QOuCLmI0lP5EuXkuauAhK0eSR+kY8bj4evofy818VH7lrm0NXy5OxS9h7ifZrQCi
	9qeA+w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7cuhcka6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 24 Dec 2025 01:04:02 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed6ff3de05so153865001cf.3
        for <linux-mediatek@lists.infradead.org>; Tue, 23 Dec 2025 17:04:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766538242; x=1767143042; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wLWwE3+OeE/g9lVfst6cEgHRxD/v4AAQeIf29KzVQzU=;
        b=OElkNveIAwuyCo1rCcD8/+oLivyxShhiWskOAt+8WQR6ub6kd0/p1hOqb11dCTIXlv
         4OeLcRUWaTTU+ed4yIbWxvFaWSumOSjffxx5OB6eazPQD3RWV5+ML2dbKBIIew7nhHUf
         +WUs10Wd9qEPVMyowf9mQ9ACjhg1e4bjSfILxQbDHxP2p7YcTIQ80KBgFHx4QeYnpBOa
         0Y0C5ZSd76GKehNmm6AbgXXuOXYkhAzjA6a+w7XkeAn1OINaSTSBcSjBftNrXUXkopNG
         /Pa+Puyc8ZA/87sbaEwfyZMmuLg1Lh6zaLy/aHYN7KwHzKhZhKnMel1uN/OI/e2Ebu/7
         6uJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766538242; x=1767143042;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wLWwE3+OeE/g9lVfst6cEgHRxD/v4AAQeIf29KzVQzU=;
        b=sgextHHqWJCqQmhU0URuj6G0hGk9hIAiuozz2K7AMatk6NsTtJhBGyR5Bf1z0QQ9EE
         kF8ea/CVJmgoxhweyPD+rNL/YsS/q1cKt6zdxzaXttD0lWwrbSTPgyQ4ZwDEZwOUDF/u
         EXyrjtgb0p4gXv1Hdh8lhppVJbi9hS3fa5R8ikV/MH0Q3ppvb5J7GG6Ey1kO7YcnCwSD
         2ZSa1eEx/TCbT3EHg0V68P0Z3vyRbJTfHSePnajJXLffzPv7OXZVFDxijfjk3nb2Jdsr
         vS2amTlZZM6PNAp6vo+WD004hMVB9PQKj1QZ3Fyak+Pf+57zAh5ELQgml7tqUFLjRa0a
         zUsw==
X-Forwarded-Encrypted: i=1; AJvYcCUeMNXS1kZMvC+NvF5AoN/JNAVh0Hp5I0FXF11KkpbEHRxY/PaYAeuGpTG5+ap2FayMptjSdIP/tN634/qg1A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxfiP8Uno9ALE71nUNAkziNJilOqsZCrngUsaWK+1bClgMWpgpE
	wjSvF2oWBwgtyfWBpTOzuLZ1QSGy+aDM6oEfy4ggxrMa/px3OWsuA9t81lykst9h76ys9zstqvx
	rO4Y0OQA5Qb9NUhID9W8EUR6C8SQBTwVv6XhMkPAncP0SgAsx+etc+YrN3nnA4/6s88UZ6k97il
	k=
X-Gm-Gg: AY/fxX7B0TFPWliBqUgIHUTJeUESYYLPxtQFI/+nOS/dozV8ajxTJwQW72P2Jw0VtJM
	bQqGZ3A1GnmnPJMl5z15kcU+kf2MnLFEsx4wAiftKuH/iOXbtLHYMVI4p7gaTTLUhqJzyNbFSTD
	ZvP/Zc8Q8JjzChTSnPJa/N+YQZyr7UDMjWDQkyBrAA5dDy7jaBNdPeBspm0TyK5/fuGcbGqzPV4
	JJk6gu10CwjIpAzR1ijZaLNzMEORWlg3Io8ggHAhI/V5Y2gUKgJfa/dPKuRlsCU36ANBJlQ5QBw
	HF7H++cws4B82rg0t1J5d2WcmTo0gUIfC/RFeLQkDAQRmT6E6Z7kZQ1wvVWIB+xlnr+nhWHtZ10
	HSsBOIK13vmNakwXXkHQLPqgVzaYkKpWe9Bv/UhuoXiW8HhLxk6+ICKaEfN2hLlQ6M56K0u5wXc
	O9WlytOomat3phmPtTSmOHq2I=
X-Received: by 2002:a05:622a:1248:b0:4ec:ef62:8c81 with SMTP id d75a77b69052e-4f4abd8c6bdmr206266901cf.47.1766538241859;
        Tue, 23 Dec 2025 17:04:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFjEL6KpdvGkaIQESqzuIk0ruXwS4QCPmI+GKo0q+FP+/3F3vrZO4vptQGCTX9RSoNL/0h9gg==
X-Received: by 2002:a05:622a:1248:b0:4ec:ef62:8c81 with SMTP id d75a77b69052e-4f4abd8c6bdmr206266431cf.47.1766538241402;
        Tue, 23 Dec 2025 17:04:01 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18628284sm4545268e87.93.2025.12.23.17.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 17:03:59 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 03:02:58 +0200
Subject: [PATCH v3 09/10] drm/display: bridge_connector: dynamically
 generate HDMI callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-limit-infoframes-2-v3-9-7fd3cacfefed@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6848;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=wjvfsQWX2SPvZmtfq/QDNeAsj27LvHfOsz915cSO54Q=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpSzvaCm570BXj+xIjC/HsGcDtU3JpA7khf+YXS
 u9a7QR7RCeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaUs72gAKCRCLPIo+Aiko
 1RcNCACKsTzltXBEDv5JA74NluYiKEOT2sk5yj6c9PVolhP6Av6n3Nd8/t+6XB3cYSb5w1io960
 9wqlW7vqJLAveCu+3Z7ebSvwfcaFyBSv3WTPBayBsfMzB6AqlUWornDKj76LVqhdKVSt7WBuDXD
 vatVEwKidWBUCYmkZVY6bgw3MHh1IavrIwmGwccrpBiOcKQX1569bdMvX2V/vrBdoY8npN/Vf3i
 9xPNMTYOWUmhlvG0QOffuyOf6enZ52Ukumfye5R7tjm0nOHqVQZqBI8rEAzGWq6Pp4W1J9M14XP
 oQc7kGcYfsQuNjirDnckyZJ7oCPqQPN1z3b/dJVZs+CcxwPT
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: BeQBuXLhBPwmrKlP4HLfPyBvVImZmt1Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDAwNyBTYWx0ZWRfXwMUaWqw745lJ
 dqY6NXmoT8O2vjMfLwgGlb6QNQ/fWjH316cRMGVA/lsJmC5dtmQr1QDpsetCyOiR2igY/NNn6L1
 Jb+vBAYMKOqcKtglk/BDjPA70HoZ2FcnLoD20Vd47B+o4iof82aiF62tBhR+ue1KxtCYxsI1pC9
 JI4ERkjoiNZtjm4a0XL9jCfCEHQ1cZGuTDyXeDAdbdWY/nHBbplV79MX6hCI8CU6sc87TiIoj/g
 heNv7VxkFmlHDucEcLypglf9Ds6YdKcWHR3Z5BTyCp+FxXZDcnqoWnMyUPl3MF1TrUngFF321nf
 3jo5SQIT2mw/bt70tN6X6g+2VotQFhWvMVGTGMDBYV+c2kHCnko84cuMyo8E+vMIjJbyQinEEHp
 w3gRTHEk/5UMc8J28Fk6LrdJRB7NyV7oUuT3vX1A0FqQ9uJI4cGiwo1oxRmA4FqBH2ULB70dWvu
 jbx0MaomukhFKPqQo6w==
X-Proofpoint-GUID: BeQBuXLhBPwmrKlP4HLfPyBvVImZmt1Y
X-Authority-Analysis: v=2.4 cv=NZDrFmD4 c=1 sm=1 tr=0 ts=694b3c03 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=SmQ2dRXw9u10PpR7_9MA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_05,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240007
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_000856_667088_8C443E9F 
X-CRM114-Status: GOOD (  16.77  )
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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 94 ++++++++++++--------------
 1 file changed, 45 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index c8858d48199c..2a8f586c6d13 100644
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


