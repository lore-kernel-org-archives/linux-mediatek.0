Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A78E4CA0FF2
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Aug 2025 01:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0laXQCaNkR8BdkTEIAIjvxkPU6e+xAcI3sMZOZG++40=; b=RwVit7ggrodnIsZ01dY7j4v4C/
	Jak8vYTEYvjhhkkwnq/VFV5DgdfaKZ7YPIDPnNHYfLgLt2+vjQeaX+DR0855WeJzb93uiz96uhf0I
	DJPN0Fb2P3Jbn2KuEfs6/XFdzW/xM5IN0okhSVV2DbMJeYBRQDSKABudG4M0owO/a74JrSVNhcOY0
	pN8bW2viIIre7roiQ5jFyJ1KbS2DaveqW703AcJGyfMnIoD+n2Sa3oIugySbDMhtVbnMyE9alhZZw
	I5EjVaD/ZnAZHGCfwug5OZvMauzMQsPvYvICXsA39hC5ZTD9KzOo+OeycWZG/YXC6WvHh24Sg3II5
	M8Xsv8kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur5Lo-0000000Daqy-0sR5;
	Wed, 27 Aug 2025 01:53:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur5JK-0000000Daeo-2DqM
	for linux-mediatek@lists.infradead.org;
	Wed, 27 Aug 2025 01:50:51 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57QKEkYU011679
	for <linux-mediatek@lists.infradead.org>; Wed, 27 Aug 2025 01:50:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0laXQCaNkR8BdkTEIAIjvxkP
	U6e+xAcI3sMZOZG++40=; b=RtohOwq/mGWF5aMn8hEPDpMx/rZR9xAALF19Kgyn
	ABnotCfpABau8JwSOXOICFi9m0+JYeo5KRmxM7/PZXvfAVZ+xkORF/VXDwTNR3Ph
	HPx+mTISivbCf4otlZINmlEZaKzFvdI6E4ajQHq9yVGAUfZo4nLChDdFD8U1iaE4
	IS1qmtCDKjKe0bte0kvKERccexJ6lHl808lZOQbURByejcjFT3WTBN/nsM8JSd+g
	k1B3AWzsQK6lbv1D9bzTVgUEmdbFOgAkV//+43Xv1+qkGLvzB6NM7Z7dZU1NecZ0
	guNgLQYiFnm+R6mcteg49ubo9IpFgtLwxmbQpqJPkNbHbw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5umb2qy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 27 Aug 2025 01:50:49 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b109bc103bso140681161cf.2
        for <linux-mediatek@lists.infradead.org>; Tue, 26 Aug 2025 18:50:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756259448; x=1756864248;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0laXQCaNkR8BdkTEIAIjvxkPU6e+xAcI3sMZOZG++40=;
        b=tKQ15RV102ljmkAXsM3Z6/Us2AX3i+qornN9FCBXlYbhpla0iiVNjVZWaI1pOA/NCF
         rSKVIEAc7zhcdf3QLQq8s6cPknSH0uSspgS+450LhZnYuvDGZQsLpFKM+g2XhLyXHgzF
         NqAuT40D17KVLgyhEnRGutExH6uBb1gWOmCMIMdAhZJOH0rKflwc5sntRKZX4XJIbDI0
         5yz2P2y3Dswb76KL4FILjndtV+ZOP+PA5nohOafmGgkZGd4MXdr0Irk4IrAUiAB4jahP
         CRcTMmzh0ZIxpEPGt0DxCdxb7jIBR25ZwDM/qUhO1Uf4G92ldqNn2ge2tLeI6aW5IFXr
         9vGg==
X-Forwarded-Encrypted: i=1; AJvYcCXt3wyIcQJ+KPnlTLba3Gcpn0CWXS51p2UHva6SDKSoGkSuQk/l1p/bfGImdZ81XGTGScKibw65u+frNXCW1Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywm4oktld5uMfBzNdJqH8yk/XX6mbmG1xuKpU27FrxEjPcaFnNj
	CG9OLK18rMU2+XsZtJzvqyQA6Aa/Elx8qjeRnMeEJn6wlqlt2hzeIt0jXVGGIVWZt5Wn3j0oOfS
	Ma+a3DXIsuWss0BKzYQyT/mEvg06re/XmtjciMBszAI7SDesT7Sf20sT1ZfVxxEu8ksgivcE1+G
	w=
X-Gm-Gg: ASbGncs91mpYrZJNKcFN0NAgqhC6WSs/zU2lrBP2+Gc7Glivx8KEbaksBh+33IMoI+L
	M8mHpgfKvIu1Uqza8Y5zFRy8rGCYokHR8DRm2PB3x4ls/zrRKq9y8q6MyLZzUbmSXWB4BJ/+82J
	dSVur2Mn4lGqMw35BjSRfZfNjHOk9GAXZ4fus6x0PsB2GutWWaxhLMtIZmygOwa84nQ05ESf7KW
	riHJ3QuC0hgnPWer+5LCoJQB2XXDBaUsRgT0Y7eVp5MG6Tqxo+YmWrsBsNj1EkRp+Q694RbShtQ
	E+m5Gk1En0L323bEF04sk35YA+bhtufJCyxd/Q7rGAfhTJEPHkG2pgMKDSnVvq+WGnyN1mw31Hx
	2E8IBg9TEdnUdm6kN1lSO9L3xB6K9xI3A4MGkodq8aabEJUO8USFp
X-Received: by 2002:ac8:5e12:0:b0:4ae:6b72:2ae2 with SMTP id d75a77b69052e-4b2aaacef55mr186156701cf.40.1756259447989;
        Tue, 26 Aug 2025 18:50:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMxKJaOrtRDBj0yHJf7PhiEmF+htiaol/DYqvG4rG8Xn2tdgOPzsKsBrI5J0XgVP0gDX2TkA==
X-Received: by 2002:ac8:5e12:0:b0:4ae:6b72:2ae2 with SMTP id d75a77b69052e-4b2aaacef55mr186156351cf.40.1756259447377;
        Tue, 26 Aug 2025 18:50:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f4b46d050sm989200e87.150.2025.08.26.18.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 18:50:46 -0700 (PDT)
Date: Wed, 27 Aug 2025 04:50:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Louis Chauvet <louis.chauvet@bootlin.com>,
        Haneen Mohammed <hamohammed.sa@gmail.com>,
        Melissa Wen <melissa.srw@gmail.com>, Jyri Sarha <jyri.sarha@iki.fi>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Manikandan Muralidharan <manikandan.m@microchip.com>,
        Dharma Balasubiramani <dharma.b@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Inki Dae <inki.dae@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>, Liu Ying <victor.liu@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Edmund Dea <edmund.j.dea@intel.com>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Sui Jingfeng <suijingfeng@loongson.cn>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sandy Huang <hjc@rock-chips.com>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Hans de Goede <hansg@kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 26/39] drm/msm/mdp5: Switch to
 drm_atomic_get_new_crtc_state()
Message-ID: <dc2sfo6edj4w3qiwldoglaanbi2h7mmev7x4pklwbl7x6x6rah@kjyc52pv2xqy>
References: <20250825-drm-no-more-existing-state-v1-0-f08ccd9f85c9@kernel.org>
 <20250825-drm-no-more-existing-state-v1-26-f08ccd9f85c9@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-drm-no-more-existing-state-v1-26-f08ccd9f85c9@kernel.org>
X-Authority-Analysis: v=2.4 cv=VtIjA/2n c=1 sm=1 tr=0 ts=68ae6479 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=viL_tbrIvFpnGUkEXy0A:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMiBTYWx0ZWRfX40vGHOk4DTd/
 hEIha3Dofh+k6tR+FeIlYAfxFUKa3+gfNT884uUjAVeKlUhqmpU8WmtLOKKrTeY62LidXxStyoF
 3A1f/n1CnQv+xoouZKzJj1vxjvsihfTLKc12CchtJ5Q1u7thjlZupxygR+EAv6YjS0WweA/t9V6
 tV/ka6kn1jJPGBPj4uSB4COofhiZ8HKOXK1k37CcuxcCGzc4B/GH+CGGCrvK+sMmJk2VBJc0zeh
 yeqgTfYgvvS/DHtOisUtAE4ZFg0ok7IBmq4NKOZsR8+4DQv0Ut/jfjaA/hQSVDTE14kWKc2kOsY
 ZsVHHI+/ZLTLxixSJ3BiEwAOLhG1GKvSMdCX+wsGll2ioHNiuy3ZZKKkoNjbjlxWscBgCLmmduf
 WeslNSgh
X-Proofpoint-GUID: oDb3NkdUqqh63O7cOPnsz4wqWERnK3FG
X-Proofpoint-ORIG-GUID: oDb3NkdUqqh63O7cOPnsz4wqWERnK3FG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_185050_590275_FE45510B 
X-CRM114-Status: GOOD (  18.69  )
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

On Mon, Aug 25, 2025 at 03:43:31PM +0200, Maxime Ripard wrote:
> The msm atomic_check implementation uses the deprecated
> drm_atomic_get_existing_crtc_state() helper.
> 
> This hook is called as part of the global atomic_check, thus before the
> states are swapped. The existing state thus points to the new state, and
> we can use drm_atomic_get_new_crtc_state() instead.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

To merge through drm-misc-next:

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

