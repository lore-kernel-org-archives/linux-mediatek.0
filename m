Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C852F589B3
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Apr 2026 12:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7qCN6fA46LhWWbVU/958hHw2V513lfnGpAmb4yh0Leg=; b=Z1JILOkwsUQvedsNToJ8vc/ZCQ
	c9xDGb1zfhoX/L8hNKsjH8MgXUq+whR9VGEgzuGJWKy+Y3Ibklb/H69xNdtH88R9ARjkPe7VTOj+O
	MJhdMc5es23rVNHxD7yY4rqWTUhT9bsjYHc5wHa3Wr6GKifsl2Ihd26TZ5KG846+nsY3v+Wwf2ghZ
	cfAJ/5yBGWVL1NHfJi1TRLNGrq1YEQixSw+P7xHRxMI3jaP3a3pVmqr19XaALRYDjxUMl51gm1x7v
	exitZfgsyeM/gKVmmeJP1Rce9J3vBNkWwbW2bicZwtdX3ly1+ZhUlFtHsQbXUTZIkVnGTLyOoGJ5S
	Hk2tQVTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFtON-0000000Bdf7-1UQ3;
	Thu, 23 Apr 2026 12:42:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFtOA-0000000BdWo-232R
	for linux-mediatek@lists.infradead.org;
	Thu, 23 Apr 2026 12:42:50 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8u2Vu366232
	for <linux-mediatek@lists.infradead.org>; Thu, 23 Apr 2026 12:42:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7qCN6fA46LhWWbVU/958hHw2
	V513lfnGpAmb4yh0Leg=; b=fFCmdbSfyR4XRLkYWI7N0Tk+PjH+OUN5AhQQ62C1
	NejbCSHDJFuHdR9JsGONxsS2qNPi8uecZxrL5IALiMQxx+wQiNuphOJcfp5E8q9S
	fF/a4MG4M0jRNGEiAR8yWqA+IK3BZ9XAnUM2O7nHmiHv67WIFxlWGCcNYdaR9JyG
	nzaSHAyLLVuyd7ErqfQPNLn5fcEU2pkJybXPxN1K1ekb8qm9/LfmyLhltoKVJKyb
	+4bnEIEu2cSE4RDXfCzHHo8BnEhXG7ue92bfANCDf7pki1CvO7/Q8Pqy8y7BYNfA
	8hk/fetWEbNmajZGVeNgXM/fIq48KlUrsYscWVnczkm09Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq35rbgbe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Thu, 23 Apr 2026 12:42:37 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d58bed44aso127353661cf.3
        for <linux-mediatek@lists.infradead.org>; Thu, 23 Apr 2026 05:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776948156; x=1777552956; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7qCN6fA46LhWWbVU/958hHw2V513lfnGpAmb4yh0Leg=;
        b=defDidricISY+QMzlMF97jASt24zV/i5t5xOtmsO5jgBnbXtBkjr9cVChClXmsA169
         23GBEg2M1luSZso3l1bn4z8a0VqNBEhRiJWNVqHEfOiQcZ1b/HNuQJh7FkKecInHmJlB
         d/bFvOoKxvaAPckvmNZuy5Tg/AMDSOMhuhM/9gIiQXet5t01XfJaGKFVdqubO2g9/FI/
         k1vxpXxboI0qoWrZQextWMcRawNNL/46h/coD3yvAg1j6ZwPSM4L1doehgttJbYIQTC+
         O+RcTfc30EeJ//BNF8TzWgP+ZK9DXbd2O06KElrbz6HHdfLpjZRRZt5MvNdfJF8eK9X+
         3+pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776948156; x=1777552956;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7qCN6fA46LhWWbVU/958hHw2V513lfnGpAmb4yh0Leg=;
        b=E+I2taLV9AdqWtM13aUNQBFEVaJQTj0vg3Mkqn/R9E4eDYRkg96vDpBxLsb5z4kLPT
         /6cKAmy2vFfybkX7hqqBzlV/z5LluL1A69WHcaKAtXHsa90z/0oJGPNlYVpwX0nYwxfd
         xsKjeivA6oalxR8yc1A3CTKRK/nWUbgpFDHm2Oip2yVT+5d9WJklL+mrVt+3qZqrNIDo
         SlAXKwQyivjb6WOP5av3T+XooPRTf8S/r0EIM4C6m+q4Mkse2OK7lvg67FP7v/ZaLBZA
         DnPQXRyyVgNv4pydVbDN8b38YzbovAvsPRqIxL+Y2+HbQ7TlULksr7TMfLABq8Fb9x+l
         Dy2w==
X-Forwarded-Encrypted: i=1; AFNElJ/AW5kqOSFjAveuj6S0jUfeKTNyNsQXkiKxhceNn5xFuRRnR8yIi9MgYo7zAW0opLTXNYyqNZXubBmYZGwcfw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5ev7Lq8dKv7rjnGc/kI1KVgC3rY4ooLWKm2w4mA4uuOW1/Frt
	IFhTHQf/y/pKRv/hI70obam+as3mGBuBol2xO6fqYWzphIHsKAnlW80E24EVroirnfYL8SIa5X9
	vua/Pq5YV5sHLPlPm1xFbt5c4puwC8Js2DmMTSdB0/RZ/K/DylR7IN8Vi6j5eQ+M2Yco1+s1ev5
	I=
X-Gm-Gg: AeBDieuiOdL+WK3+vaOZUhHC1MiQ8wfOqUpHC8c75HX4BUBWClrV35u1VnnBXPjHWSB
	xPtisgxOiVEDqHWfDTnlzGPw/CfL4Z/rvi/Kib+9CrpK7m0ntQdXVGr9Y8GfWntg3aWJslArfQL
	xQkh8rSbzRMxMVZFnwYN0wuN0xvZwbOI9L2/2X3QIAcduLpHJrX8P8XpetZnlN4t2y6sHnlu59y
	L/xHkmzA3lrNySJmRw6b2CwVzR0J4TWOWozCu55t1k1xjTnsk/XrJiQY9Z1fPmQv9aCO46bywnC
	oy/62A4EwK5RlnaK+HDi9OTVHOe0lsTcUvdS2pDswRUGedRqWV2/XWmf+Dx7g0PlIOjZ4MUCu1w
	YiuxcOkr8DTA4Z/Mpq0FkPKuNsRO9/49lq8/njdSzcntI8JfgThIBdcwDxmMacpgvC9lmCYRgCf
	A8ub+gASbGAfJm8Wq+roXPxHly0qSx2fOchbkRl9sTdRTIMw==
X-Received: by 2002:a05:622a:1496:b0:50f:c2f8:406e with SMTP id d75a77b69052e-50fc2f8479dmr91073251cf.48.1776948156429;
        Thu, 23 Apr 2026 05:42:36 -0700 (PDT)
X-Received: by 2002:a05:622a:1496:b0:50f:c2f8:406e with SMTP id d75a77b69052e-50fc2f8479dmr91072081cf.48.1776948155831;
        Thu, 23 Apr 2026 05:42:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187e147bsm5123482e87.52.2026.04.23.05.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 05:42:34 -0700 (PDT)
Date: Thu, 23 Apr 2026 15:42:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sasha Finkelstein <fnkl.kernel@gmail.com>, Janne Grunau <j@jannau.net>,
        Liu Ying <victor.liu@nxp.com>,
        Douglas Anderson <dianders@chromium.org>,
        Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Paul Cercueil <paul@crapouillou.net>,
        Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Sandy Huang <hjc@rock-chips.com>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Icenowy Zheng <zhengxingda@iscas.ac.cn>,
        Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>, Marek Vasut <marex@denx.de>,
        Stefan Agner <stefan@agner.ch>, Jyri Sarha <jyri.sarha@iki.fi>,
        Michal Simek <michal.simek@amd.com>, Hui Pu <Hui.Pu@gehealthcare.com>,
        Ian Ray <ian.ray@gehealthcare.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        asahi@lists.linux.dev, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 35/41] drm/rockchip: lvds: remove now-redundant call to
 drm_connector_attach_encoder()
Message-ID: <wapbiwxou64emxlt6oz5slst3nvcgvs35hvhpz7v3wmwp33bzc@mvdog4t7un6m>
References: <20260423-drm-bridge-connector-attach_encoder-v2-0-2ae6ca69b390@bootlin.com>
 <20260423115334.444750-1-luca.ceresoli@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423115334.444750-1-luca.ceresoli@bootlin.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDEyNiBTYWx0ZWRfX5Ivh/g9vRJla
 Sei4XNtem/JcJ+MAuL4nLY0gh3wFT2qV9ARQ7J6OGUJc/X5YWI021ou9AsOfjXbtXCfqon0t37F
 xlBWY6jvm/RznRwnlJdYeZOa0LxzSLdehlv8UQMNRF0ETHR8o8pdhImPKCqMDCKneKfnapY4vkW
 Vno5I4QHlYtr4DowhKBaJKQ5vLzICeRCfPDp03EEA8xB6oPxBaznKpkHin7CRsDKal5tw+n3YnE
 p9zUSOZz3Wh69CWfVuWWPd+k3B+I9aiu7LXKXtvDcLhS5RYc001kg9xIgDYXCSPRBI1V/c6dOJo
 WVsizQILrkIdEETMjP22mAk8h4xTu48/FRUbESFnvoAKSWw1mP3iy1layWLATsm+iSsTPYPC4qq
 TA1FsCo5H7EY4qFLbDIMhGsKY2IkBM5LHN2SLwH4/631uaTYoTLnWBWnVD5OFJ05Ez/wkTJ3RPf
 Mn4iAkJVdKSPAouMkkg==
X-Proofpoint-ORIG-GUID: 5hUu80_m6zeT5v06uod2a1GRiBjDp5cR
X-Proofpoint-GUID: 5hUu80_m6zeT5v06uod2a1GRiBjDp5cR
X-Authority-Analysis: v=2.4 cv=f5J4wuyM c=1 sm=1 tr=0 ts=69ea13bd cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=P-IC7800AAAA:8
 a=Gxjqsh2QC4DOxsvvGYoA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 spamscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_054238_957012_8CFD553D 
X-CRM114-Status: GOOD (  13.32  )
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

On Thu, Apr 23, 2026 at 01:53:28PM +0200, Luca Ceresoli wrote:
> drm_connector_attach_encoder() is now called by
> drm_bridge_connector_init().
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/rockchip/rockchip_lvds.c | 6 ------
>  1 file changed, 6 deletions(-)
> 

stray duplicate

-- 
With best wishes
Dmitry

