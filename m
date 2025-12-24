Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F0E8E6FE51
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Dec 2025 01:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j2BT4ALqtU5AjsTQozcF6Tmng8niaFOYcGnl/GxzzY8=; b=eW85cGufMHjPJ+D+8AtYmRi/U1
	6Qa3N22elEWGc5fHCC+ofMRfiXTK3OLG90dZd4yyKAslbihbDEFgROvC1dFsrvao5u6HRI4oE6S7/
	t5j9rNco5mj2esTFK9l4iLzYQXllXGMlYxHHgz/wh6x52MhIpDuFcb3zeCzSA07a9BKXNeujP96Gk
	07dcJRKvPN+5dLqmPl8A30WOZueQXE8eFIMDM31PFjVP0RfWuVEcjhXjQPAo71Nr9FTGE76cLpy6K
	eW8M9i7sdASbGcrtB0MLWidXML7QTJqgJ+v8rkGTP4+HkBZjnS6l5YH3yns2VjLS9PyWivGsPEbqx
	P2Z7ndJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYDI2-0000000GF1W-139Z;
	Wed, 24 Dec 2025 01:03:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYDHx-0000000GEur-24zm
	for linux-mediatek@lists.infradead.org;
	Wed, 24 Dec 2025 01:03:43 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNGOMfV1018443
	for <linux-mediatek@lists.infradead.org>; Wed, 24 Dec 2025 01:03:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j2BT4ALqtU5AjsTQozcF6Tmng8niaFOYcGnl/GxzzY8=; b=Bl0jOJV24JiFPMET
	xHzSY4DSukQHLXYvaS+j8AC2V1B7oTwCX/V4HE3eWFTq5cS6OcPRyrAqVDY+qCpe
	qrFYm27AFt8KkxgawPYL/Fe0FaD7KkT9u3yDdi2AmiHPp++bl3E8ECzsLRIu88Jo
	PvaOMF1dSP4/LJTXL81dgO0Pa9pdcH+1O6q1pRDc4tlgrNHbr87ywG+rGaofvEBZ
	XzUlymhYYoz5ryyo4G9IluagRkMxMBkjTodNRJQv/iSAW66J69otOk5hjpFyATm+
	s9XUpm9Lf9XcyKMP9SFUa7aIWGdeBNgNefrwznwxC+Mhh+cGxaMqYAk14PEYEr89
	IcsumQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7xjs9ahs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 24 Dec 2025 01:03:40 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88883a2cabbso188834956d6.0
        for <linux-mediatek@lists.infradead.org>; Tue, 23 Dec 2025 17:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766538220; x=1767143020; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j2BT4ALqtU5AjsTQozcF6Tmng8niaFOYcGnl/GxzzY8=;
        b=HeZIBWP+uuS4iyZKZuemWSdOsoDaAM9Az90XUKANfddHGCY7vkiwffGMJgAkwBr5zU
         bfUlqcclKpF2Utwyl/chHmxWqsSeqwZNAKSnOR9Y4v6pJW8Llt1T+IZ8bBykrhHQp+oj
         egbkZna3MgLPjIemE0fxNagH2OVH1H25UgHp5RV1eVjzLptbVhwoQQulHOKsbm9auZhW
         IxP2UU5Enh3/ZgDiALhB+12f0ob8yK9hRMrx5NFPGLemUQZlX1maoaodjTlziVnRHcYg
         lf+0qkOBHJ6JYSE+3nG2Rc968B1UA03mZlYN9w/Opcm+hsjIV5FF8fAzMzzzq3kQktcc
         94fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766538220; x=1767143020;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j2BT4ALqtU5AjsTQozcF6Tmng8niaFOYcGnl/GxzzY8=;
        b=XYsHdPGbXCLO/WzonO/15gnsDGb2fwOKH7uogDl4vIEWwL2b6JFS1wRm5+QOhD2pZL
         4WRQAdyZqCWTvQS6LtTeGOt93qrnSe486i0uFXWNUTXsyNub8WFepdnT7h6VriEASg8A
         gVzBhEj+WBCF62GhH22f9ANeUcTdhWsVmqOsPG6sx94frzLpv7SIcXhJBPvzQsxhcMG6
         5hzlB+fqdgwza0ucHW8rvZxYhRWChTkHcH2BGFX386XRFIotYTcx4Tt7nrVoD3mFM+FT
         ZLTzTukLTd4umpwLOzTEQBLcUTxm3DjPdeesxY6mqTMkEMuCj24Vm9V7EoGy3V0y6tge
         Ksxg==
X-Forwarded-Encrypted: i=1; AJvYcCX1Z6LUBvCk9L/Wi7RB3JJxKERgQcHajxbdeNjcvBd7NkDxgma51NcEW0CdlJZlJAyRYfRKvZifeo1btasB/Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwKIX2yScUIr0x8oMhdhOZdpq8pZ76ztvdhbxY7fU/yRsJaHrXy
	fsrKQBOsQo2lDYzdcDjoVXnrH8sr950MbyQVYAaESFSG+lS85VoWwHwlwBPmbTOjfijaQGrEvxx
	nf+3/cUn6usPcq8q4HfKCLt/nZKd+/ZWwFl99LOmsYhk5kbUM/pFzuUSZmacaC8bQk2e0yiZuyT
	sS0xKVEdk=
X-Gm-Gg: AY/fxX5KrS/VwvecfFr1wA7Iga+1fLqdoIm9cFyBl4I6Jfq7dYbq/4/ZWGuexFTzvqP
	GpDSyCVWuscKRtWp8Tgty+iFXoqZqLb1hkVg/iQsUsvlW6G14zZxdBwOXoPJu9np/q8P6/pLxcp
	sra2QjQ6X9bh7WN3oeHmL4TwNNz1FiCIfV7M/yc/78/NjVxIr2+OU6G/PF6UfQxDL9eOEo2P2Sp
	8bMgTsevNMO+xgnOPcQkuXFlrPLN0YJoNaC0yHZkJQmba0dHNLhrssEOecSV7EC/S1a25cDriLa
	4qR5y6yBBQ9Qqw25cL+86AlnsfP1mI1LCBFwGw7kWQuT0DZswQFSgj47mBB9SOvhAdkYPBNGKj4
	FwN/uKZVnfHzDlfXyJANL6kgl7D+Pd2bvUUD0b8Xczmh9DAWDPBYriPLhBvBf6dFfn+Ti2bcQP9
	nMvBZGyvYZkI7Mwxa2txdcPNo=
X-Received: by 2002:a05:622a:5983:b0:4ed:aa7b:e1a6 with SMTP id d75a77b69052e-4f4abdca79fmr229406081cf.81.1766538219493;
        Tue, 23 Dec 2025 17:03:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEwvXGbOT6oW55CWvGFCaGI9Z8vq9+dFl2bwrw/ngJaHdkAtC4PTePtFImzvZoy9oibBhKF7A==
X-Received: by 2002:a05:622a:5983:b0:4ed:aa7b:e1a6 with SMTP id d75a77b69052e-4f4abdca79fmr229405351cf.81.1766538218943;
        Tue, 23 Dec 2025 17:03:38 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18628284sm4545268e87.93.2025.12.23.17.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 17:03:36 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 03:02:52 +0200
Subject: [PATCH v3 03/10] drm/sun4i: hdmi_enc: implement clear_infoframe
 stub
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-limit-infoframes-2-v3-3-7fd3cacfefed@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1354;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=i9/GyfQ7oCfW1uA2EJ42B3bpRaDaBcnVtDJI1DBQZYU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpSzvY+d+DN6B8oFFIbxWN6Mv+qvpFGNgFj0Zg9
 429cFCSW4uJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaUs72AAKCRCLPIo+Aiko
 1U0DB/9O5L3yXk2jLLqOmN8V6q8wWbokThIMSYo9wxIHSgy0M5PT1YvNv+IkCrajuHc7rLm0/Wy
 cAHvtRKaeF+QVunb5Ui4hiZx4SEbTrbizizbDcBXrW4jWiZ1w4OIEFSo9Ca2FBA/eLbTNfYILzi
 HQCpFhDfzos5m2svcelBiHZqryy14l9P2FF1hFVv73xKqoG79GEfcN56cxOyCxeLVVkSb5izUXV
 /Qi7gDaaGNrZhhP1D1d2VscJWoEi/L1VJ1MTZPr1mxGEaDugo8tx8aKiQtr2Q++hnZkOcfFfbZ7
 adTRg5h65Vh9hNP2Kvva0EBQb2XULPOZjxhcE0hxDNYLkX4A
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDAwNyBTYWx0ZWRfX/I6OVCCchx6K
 QwIY5zNZGUC0g8KBDyvEz7BBm8LqeKiMZFjgVqib29J9pOxmuthAJcTquCxkHnP1YPkFihU219z
 pRnBycjEIIDiZCj0tNcbo8nT9QQHjUyBCgZgvv6voSFhX3eu1G3lKj69liiWisOsS+g7e+sXj2T
 z8rrAou8Hd1IYbaBwmWTrY0zN1+vbjXsVgez7oJjl5i7fgnQSEusCbx/S7Kyy67TAD7KeOn0UGx
 ytGVfJ/oipflBeunjA7mqX+09SMVHpNUAn+AMVYTs5skTn7cEqdmxs3VKg2JqOT2vPLkWQEifdB
 7egvKOvgVnr9dIdZZ5qqOd4b+G4Qj6CWy5xzRu7ROp2CqL1LrlrI5TzCLyv0FqEgzF7dPcPYWzf
 Gr/lPZZz6egIDLHw+Cv0zZ1clRbGiY/z7przSwEOuRgkK/aEz96u6FxnKEO6MpNQIVcO07zBvDx
 G/Gan3eW/LkYJAy63GA==
X-Proofpoint-ORIG-GUID: wHpy6sX402faXHNQkbHc5lqe3kJoyTrD
X-Authority-Analysis: v=2.4 cv=YcqwJgRf c=1 sm=1 tr=0 ts=694b3bec cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=J8re_t9gDAGCMx8MSDUA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: wHpy6sX402faXHNQkbHc5lqe3kJoyTrD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_05,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240007
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_170341_676163_DA64FC25 
X-CRM114-Status: GOOD (  13.46  )
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

In preparation to making clear_infoframes callbacks required, add a stub
to the sun4i driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
index ab0938ba61f7..6263ee15880a 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
@@ -40,6 +40,14 @@
 #define drm_connector_to_sun4i_hdmi(c)		\
 	container_of_const(c, struct sun4i_hdmi, connector)
 
+static int sun4i_hdmi_clear_infoframe(struct drm_connector *connector,
+				      enum hdmi_infoframe_type type)
+{
+	drm_warn_once(connector->dev, "clearing of AVI infoframe is not implemented\n");
+
+	return 0;
+}
+
 static int sun4i_hdmi_write_infoframe(struct drm_connector *connector,
 				      enum hdmi_infoframe_type type,
 				      const u8 *buffer, size_t len)
@@ -236,6 +244,7 @@ static struct i2c_adapter *sun4i_hdmi_get_ddc(struct device *dev)
 
 static const struct drm_connector_hdmi_funcs sun4i_hdmi_hdmi_connector_funcs = {
 	.tmds_char_rate_valid	= sun4i_hdmi_connector_clock_valid,
+	.clear_infoframe	= sun4i_hdmi_clear_infoframe,
 	.write_infoframe	= sun4i_hdmi_write_infoframe,
 };
 

-- 
2.47.3


