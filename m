Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A54E9F589B2
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Apr 2026 12:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BWsj0dSc6URl6GzhKqtvvsA5lvMVdCA8oRPUY5tXRI4=; b=HmuKqE07OSQMvzr6bmv8zJsH50
	P578L2+I1VlEaum8O0gLxtwsXJ7MRKnJd8zyCHtSoEK7agUZUOTpykHRImnbt8MrkfcPt5RYVJlTl
	9t5kfONcCLRtaaSAutmBYYYIEHoH/pXL65DoGUmXRalzTAyYN/tgnK0WsRCp2zdTQoOMBANxxAZzX
	iqhzt2SaEJGpD0TOtNjR8zBcrazpYSNNU+mTYddd/Sn5MuN/CCslaqv7JYMWmxVe6aEpPmY7+mTus
	IUzCYZ35gRGC+YdYVsyDBHBvunJmEApltojdgBF6KIhcd5CNO9y8LXHw8/rZxl9RJXEZ1NgQlBtHa
	qhx0YUTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFtP4-0000000BeJ8-39bK;
	Thu, 23 Apr 2026 12:43:34 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFtP2-0000000BeHF-4849
	for linux-mediatek@bombadil.infradead.org;
	Thu, 23 Apr 2026 12:43:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=BWsj0dSc6URl6GzhKqtvvsA5lvMVdCA8oRPUY5tXRI4=; b=XiG35WbG1a+O2BKodaWRKHcMO6
	9zBrg36t3I1rbDkKbsfJRv917BCOqzlJxHqrKAlxDMA30Gp42okLMFqc7sXYyLBEBci5Ws/PMxVtX
	KlebOicGevifopBZjzTubct06acs1t3L5jAUHDyirILs0rmALbOQMpPoGEMsOCFloyeZVP2ebAK5o
	gfXqimUYxgpE+Wcex+NdrTf8XRk2j0B+9lVNdvm67Y/GMLmZcld48tFiGAIFkc9Ah1qRdEVyiujkf
	qC/ECrXwNKoNs7Jda7lb1YfFtX7RdPl6fL3Q0f9jZgH/4tEo+SJqOCNr9xs3SEHz9upXWdR3rZEIM
	Kp00PDOw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFtOw-0000000DRwW-2KrY
	for linux-mediatek@lists.infradead.org;
	Thu, 23 Apr 2026 12:43:31 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8toYJ179237
	for <linux-mediatek@lists.infradead.org>; Thu, 23 Apr 2026 12:43:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BWsj0dSc6URl6GzhKqtvvsA5
	lvMVdCA8oRPUY5tXRI4=; b=kz7jLeBzJhutORDVFx2iCKLx6BbKBMv6ZD/OAzXy
	A0y9fL8VJ5azBC4WAyY4ur8i751/Cb6BI3cUXuKQsmwXwY34+fQJImLA7H/88D4v
	1BG5/aKfbFE/R3yiLswxqHx22LbWVldKcz8Z7n+9vvLF6H0umWX04940IYnC18qK
	tqpEoazA4Gx/aTQtT+TClBki1rUGdP2FhQ9RJS7+TJ/lTUY5IZeO+dCzFtwCvg78
	NWGFar9sZDj1b7ftpz2facMTIbdcJTW1sSKycWLMr7MmGIEbOm3qQC3OGbd5TyaF
	4WBlrARrtwmAMfi0rdEMVIqZqVfGqYskKA29CbPTq0GlIQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqe62hg2x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Thu, 23 Apr 2026 12:43:20 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8eaaf673eb4so922737785a.2
        for <linux-mediatek@lists.infradead.org>; Thu, 23 Apr 2026 05:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776948200; x=1777553000; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BWsj0dSc6URl6GzhKqtvvsA5lvMVdCA8oRPUY5tXRI4=;
        b=MaZb8/bB2SUzG2Y7ZExdyQub5DLmpBlsWvPy62VQQPLsjDb6YnZS9XomBHbIRllsjg
         +ewqbwBJ++ytvYtkktmumvivfrbyKrjsRxb0mnPmnbzZQHJw/duvsZpq0V7Q9axC+J82
         9v3GeiDX25u8tN9J+bP0+79/nJEzIVtDDy2kMLBNJbSuSWNHJW1dcvUkeL3oWF94nFgI
         MmDGbXMXV8YnzhRttBgUPPKV7q7Ddz1UyX+Wjrsr/td/D35xhbxwnaz6EML1m7dxI+Ba
         bxBTDbNi96Ph/VciCPBP7ztReffh9rqSKuVfd3j2RzVO2/gtuYvBJWtEbwhCg3d5fcU5
         NWag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776948200; x=1777553000;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BWsj0dSc6URl6GzhKqtvvsA5lvMVdCA8oRPUY5tXRI4=;
        b=KGJ1rK//hBAXpOro1H3HGlGYes6CZStC7KcGkXKHygaBIx3QhIPHOiV12Ta2osgJSN
         agqTyG+XJocNvyk01gz34UjUaX8hCPDvziIsbpukgix/yFWu60cvxsGkAP9S3cmDvnqI
         sl9xEyk3yQ6Bdw0exx8QUX3WU8TCIS+6kwlhG/5sKkp1gvzoQZ7RUl6LioPBGJplbF0S
         GgVrad4lz4ku5Xc0uv2c3j2yJ+xdakjdxOqvN4cukVi/5XDvMec5IL+aRcbdO5cljve4
         6oJ0LUcc5QmNLx7GheAU6sI0G+ZzsRsuixO/T9itv81ji0agC5n9IqXTUl5TV/tFMKxg
         NROQ==
X-Forwarded-Encrypted: i=1; AFNElJ+DAYadizMWvO261nMP7ggAxFUZeagPCDUvMeczjo7Rfp5U9WGTuQhQTrk7df3fBzjMPcJP4U3OENjIJCYyxw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzzdng88gtEiHB2RlP8E+mdgMVFiNJj+fNoYDlj9gp/kBfXVqih
	M7CHYKbi6y22+YF/FAa2GSyx6rPTeqf5P6Qno7LZebBmcf/USkrYikhFo9VRmUfmaNrsgbSJW0R
	8bf1lud1/r1JVvb82Gtuk4unw+aFeA4/QXQN7bD3bRYCnOAt4HOnDVxAy/cs4RVdk2vm3VhisNb
	s=
X-Gm-Gg: AeBDietiManY/oDgM1hShIAQvehwJnjbZmNJF9huyUzsWLNbfPL8JRqNh2Bb0kcMaqe
	hwnc9RlSnL3cLeMX88vAWDGkhsd5nj6oLeN9daRsDmceBVr/NlN4StTAcQGeTLGmJ2PtlsQpC8N
	nrhBI29ReltJeSUEbJ1zDp/hqgu/Z4XuyPGxj3VX4cmm62lt0nPq4GJIfJtnH4Y8/3NrdtTzSOG
	mJpNOHtWRtTOGpyD1TuR5vLD2Ig7GMlOw/ml8LiklqO+N1A3NhsLROy5KcnJPXmqp3k9QGJZ170
	rq5OtcgzBauyTyzaaW3vEYJQGUEAZnE1ZF2dxuWM0fKhhPZkeNwcHiHhJ3uhpPwH55wxW2oYMRi
	Sc7dFGJyiHIGcZbyin0A2w1W5DfykH43oDI/Gc+eihzll45qgtIWFfKPk3bkl1BEh+z494WWnMs
	uzTKyn3ARDAmq/reK/WFu5L10kMew8Phn7KFEbkblD2Orgmw==
X-Received: by 2002:ac8:57c1:0:b0:50f:b6ef:e10b with SMTP id d75a77b69052e-50fb6f016cemr157722301cf.27.1776948199571;
        Thu, 23 Apr 2026 05:43:19 -0700 (PDT)
X-Received: by 2002:ac8:57c1:0:b0:50f:b6ef:e10b with SMTP id d75a77b69052e-50fb6f016cemr157720991cf.27.1776948198942;
        Thu, 23 Apr 2026 05:43:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187e12d5sm5133222e87.41.2026.04.23.05.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 05:43:17 -0700 (PDT)
Date: Thu, 23 Apr 2026 15:43:15 +0300
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
Subject: Re: [PATCH v2 41/41] drm: renesas: shmobile: remove now-redundant
 call to drm_connector_attach_encoder()
Message-ID: <kxltg2wx2zwuliguszipn3hldalok36finlqwxe4qh3e2mr3hv@ymc7gwkozlzo>
References: <20260423-drm-bridge-connector-attach_encoder-v2-0-2ae6ca69b390@bootlin.com>
 <20260423115550.444930-7-luca.ceresoli@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423115550.444930-7-luca.ceresoli@bootlin.com>
X-Proofpoint-GUID: FR-j0eL8H_gTSpYthQPULAZO16qJiTyB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDEyNiBTYWx0ZWRfX5KiQOmE1jQoL
 YV4N5AxsZ90CY51NEqUKBZvTB71kmETT82UND5BUfa9vFW7n4XkEJPlQ0VIiP0MpwPtBsHi0LQh
 GhpCa1cz+DOUbXcx82fF5yk0UgxjmE+1LjgLRV3wQLnkOg7rgxO3jrpFC/ezAn3SEQFe6P823cQ
 86dJ8ixAa6djfkIn6J/d518r9BdhSo4IuF3w/sJIKGbWnn14ye7789yZIgTInetjVPQBzlJRAdk
 zHRaQF3ClI3UqPBiTsI4coBJTvlKJS4ymnoctvviOQViUzBvlwBV7PmP7wt+j/FDk5JSpTfc+2m
 HSdaGrUfayRf+11te3Q62zXFpHhuD599EK9eUtp2I5TM3Zu1qkN5svTqVbHhZWbKMu6TxbBSzV8
 T41dGyWh7OvwLw3T4CeCOQ5HlDcrWX8c7sme8/301rN5saiqStp2xB9Jdi6tFyugmQK/ZlfXZjf
 sLts8/pu2n5RY++V1ZQ==
X-Proofpoint-ORIG-GUID: FR-j0eL8H_gTSpYthQPULAZO16qJiTyB
X-Authority-Analysis: v=2.4 cv=Nv7htcdJ c=1 sm=1 tr=0 ts=69ea13e8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=P-IC7800AAAA:8
 a=W9-MdjkIhrGOmg5mk6gA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_134326_928229_9E9D0008 
X-CRM114-Status: GOOD (  19.69  )
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

On Thu, Apr 23, 2026 at 01:55:50PM +0200, Luca Ceresoli wrote:
> shmob_drm_connector_create() can init the connector in two ways, based on
> the 'if (sdev->pdata)':
> 
>  1. manually in shmob_drm_connector_create(), or
>  2. delegating to drm_bridge_connector_init()
> 
> Whichever branch is taken, drm_connector_attach_encoder() is called
> immediately after to attach the connector to the encoder.
> 
> Now drm_bridge_connector_init() calls drm_connector_attach_encoder() on the
> connector so it is not needed anymore in case 2 and should be removed, but
> it is still needed in case 1. Move drm_connector_attach_encoder() from the
> common path to inside shmob_drm_connector_create() in order to get back to
> a single drm_connector_attach_encoder() in both cases.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> Changes in v2:
> - rewrote completely, fixing potential ERR_PTR deref and ending up with
>   a cleaner patch
> - also wrote more extensive commit message
> ---
>  .../gpu/drm/renesas/shmobile/shmob_drm_crtc.c    | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)

LGTM now.

-- 
With best wishes
Dmitry

