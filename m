Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3B90F589B2
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Apr 2026 12:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nPbpkNj9ABhjGDGvKynwI0MfHPrmaa9hsgMYHe0+7+Y=; b=H2bQPilcK/bYKqfB1iukPy/hEQ
	aHctSKMAUuM6dr2TLj+yK/aLtJL46b2GGSlDAXYZvB2e9gs8IqX99yX6KOr0vuYDe5T20oylWtHh5
	6xwvLxkMzVSlIR43hznw3kK6/HXCxb6o7zTm3h3U5xkmqBtjziVddjJ4bphiaw1NEstjyjNpv4vVW
	J24moWaSw345aC7djmJMuXmzymZR5YHQqQAaFno4kutT1reFWlBY/9ltSFaBPtsYzucwZ+cAzJYSO
	UrDQ2kbGPZREGWUvk+9F2aiJnSNWonnDh6cuJtCnRN0h7RAvJcqtuTHXhghGrHgu7fB69AmMAxBnS
	qKc5yByA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFtNf-0000000BdLx-2V1c;
	Thu, 23 Apr 2026 12:42:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFtNc-0000000BdKi-1qR8
	for linux-mediatek@lists.infradead.org;
	Thu, 23 Apr 2026 12:42:06 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8uYPd3413636
	for <linux-mediatek@lists.infradead.org>; Thu, 23 Apr 2026 12:42:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nPbpkNj9ABhjGDGvKynwI0Mf
	HPrmaa9hsgMYHe0+7+Y=; b=eC09PN2i24nCZriljMh8JR/1ApJQAbNzTeI0q3AJ
	ecYJiOJZrZDmKs0KMclx5mM5sSs8rMozaTP5vcHDvT6EfMr8LxW+x5nNByuVX5p7
	0uUBmLUzk6EA4s/nXj7aqxxQ1tinWuC2x1wOaVAMZq1Sa2VVoYq1weIuCjZxa3tu
	rhcKGUnyeKVxQZozsBCCOeMugfw36mfVVMH3UPQW1yW5HYB/X+81gylFHiXPKmkd
	tsh9Aj5mT3OOS8YrlxbAJ+oZ/Hnm54MGwRs0gB/1MQOxg9xz6RvZyFyFinuqNOR9
	QAshNI31RpsjkNwnbsfUoVnHp16VxLx0svestX6bUeFzVg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1h6bywm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Thu, 23 Apr 2026 12:42:03 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50faf575af4so89823051cf.0
        for <linux-mediatek@lists.infradead.org>; Thu, 23 Apr 2026 05:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776948123; x=1777552923; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nPbpkNj9ABhjGDGvKynwI0MfHPrmaa9hsgMYHe0+7+Y=;
        b=RTOvW+Mak02nmAf39Od32jcWSKwgoGO9O3BkVoEZFTsic4hqpVVyxfI7emmkpK9AEj
         Hu7HQsLx5sYBk+vBuYDGZ0odScX5AdfXQTJWWXgHAimaseR1j16xf9P/ud9GtBadfzII
         fk2OvQ/H3PfEO1FMntD26gAnzes+Fs/4w2xzuEdgExZHzRpCJPJhrWGvZ/8m3oo/hoMp
         PVs85TMZIAx5QlmR9AjvyXYUyhJNEY+Vn3eBgE1i5m8L6KMgz+i3qfI2i1hbSJqcfipV
         vVGeWh4mIlP8bJZeFz0ArsmfhHkJkLuhXrBJC631TSS/1hQNfOMwhQEAZMHQyyijurWj
         3NVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776948123; x=1777552923;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nPbpkNj9ABhjGDGvKynwI0MfHPrmaa9hsgMYHe0+7+Y=;
        b=gMsMbvi6bRk3ztr+2TWt88LdtvteMtT3NxeB61/dowGdRRNlSdY6QRl2y6FLf7d0Ke
         smI/qUIE49eW/vST/n9CMDWwyzGupVWH9MvDhiOCNuHdEyaUgDYCJnEpA3w9daRxhbFj
         7LpyPON02FnpcFGtaz7OxvwEvMi3kRv5orWcWFu1GWbfjekJjEjz+Xca54ipW80nqfbQ
         KDVqtfjKDF8yO3E9Pk6dDiHZ8yIVq5LihuZ2yL0s8KCGTozOsiqhVAOPMCsJgm2aqbZ9
         GnRClPSmrmubXA40D9HJsT8VChbPYqvO9dGpyW/YaKiBjFxyPMj2h7OE7zZRPU8+pdNw
         ri8w==
X-Forwarded-Encrypted: i=1; AFNElJ9USoJYMPhy2qBAk6VVUas0E63BUmw62c25ghd16cV7Xb2hKniQsJI+d6Sw0+WkpHZ+tUHg2H4LeBTyZhU6tA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyGwoX7IHfRJjzaB7Dqx40/JBhylBuzmFzJVe3k6q6JA7DB4h7a
	OxnUBpxkQzoAjkcIF9EvpT+Bb4b7PgYVLLS97K5JBRqMSyfVQqvSp71N0R9F0e6koOvftS3oH6Q
	AfSOlqKY85HMqPbExwRQjhUh5iAO4WL56NotzQAh5/G3FIHt2bi4gffsQSwbW6XG25I9cUgnhSc
	Q=
X-Gm-Gg: AeBDiest7stMEWk4d9YAkotv2yU7RthJZbkiwXYuqNjpAdggqiFdlFx5k/QlmOPBVX+
	aOyKXN4TWYXUC1A2dviFtybmfUJYoicaCKSQ5HkEKY3qyiPbLtJxldHhRuI4T2l64tqwz9RvAME
	uaE4Q0IxPfoX8QexEPR/fnotjS3aaI3byNDC2L7joF8czERNJn0LhhfGfLNPvnc4jt2RdoUCLva
	q7I4xrfhy/B33kPD6mGrQ9r6aQLAw1oZZ2vuH2x4OtRoJj/3KHUEXqP0UEzTeyWwltKYRlXxiDJ
	CJzyyapBqqAnE6eOHAlMef55Dn2nYZbO5TsmdUyVYsIK/qoaapdzKSO8tdj0kwUHsZmrrd4Feuk
	bzLTUvMz9T+uHdpCG79kt53FNQL6NNSZk6dpHecpi3E8XyTjXP0PPmblAXZxI4W23BQE2KOWxU/
	ZTS2tmSegZLHoLjH9O1jHQMH+KXsctYuTRwMS8sSHvmyG1hw==
X-Received: by 2002:a05:622a:17c7:b0:50e:89e9:271c with SMTP id d75a77b69052e-50e89e92b67mr230996721cf.17.1776948122971;
        Thu, 23 Apr 2026 05:42:02 -0700 (PDT)
X-Received: by 2002:a05:622a:17c7:b0:50e:89e9:271c with SMTP id d75a77b69052e-50e89e92b67mr230995701cf.17.1776948122428;
        Thu, 23 Apr 2026 05:42:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc240sm5134146e87.23.2026.04.23.05.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 05:42:01 -0700 (PDT)
Date: Thu, 23 Apr 2026 15:41:59 +0300
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
Subject: Re: [PATCH v2 19/41] rm/rockchip: cdn-dp: remove now-redundant call
 to drm_connector_attach_encoder()
Message-ID: <lxwchrttkseoqo4e2njsyvpgingwymabvgoqh7xmwd5ysie2dv@v7t5q4qelqen>
References: <20260423-drm-bridge-connector-attach_encoder-v2-0-2ae6ca69b390@bootlin.com>
 <20260423-drm-bridge-connector-attach_encoder-v2-19-2ae6ca69b390@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423-drm-bridge-connector-attach_encoder-v2-19-2ae6ca69b390@bootlin.com>
X-Authority-Analysis: v=2.4 cv=f4Z4wuyM c=1 sm=1 tr=0 ts=69ea139c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=P-IC7800AAAA:8
 a=Gxjqsh2QC4DOxsvvGYoA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDEyNiBTYWx0ZWRfX3mXkOlPbSSrW
 rxbf8pLj53x4Rj3n9NqAi/0Wl1L+fWG2rdjmefRI1ZUsKZrhGUlUTy2v3jCy3r19h5RTL16Yaii
 lpSPWMATge+kFEuZpuY32ypWtLlQ3SKsg8SRDKMSd97w/zf5kYGwaTiRhvy4+kmquBSXKE3/EGa
 1KXM/c9FM4fKG5PrOlzxeWjwstAEvYoFyrlIotZxt6jzlTnHTJaLx3IOK/tBwdGOZWP8//DPBds
 G3KtYFL6gZYEzGc5ofKgOgGjGKZQy4cFC+WIKkf5IeXF2FliTlQKpGPHl1hjyeAh0xRgJqQh/nm
 fAlPtPf9Nlbk4civy6VwidsBWpyuxOSTE5rHGw/ImG+F0JGfNMLl4nIQR8qrsDkv16Yn74QPPex
 2mFtokVkq6YlBFgv+aECt7qcdYg2xuzs71IwLXXDlWHKUSikDlDmhLxoS+SgWr3TLmwg6JbAavW
 b1C9eXYxkWi9bFfUjIA==
X-Proofpoint-GUID: 9OM9QZVY0_Kp1T1B3p5VZIr_Y5xFvmxl
X-Proofpoint-ORIG-GUID: 9OM9QZVY0_Kp1T1B3p5VZIr_Y5xFvmxl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 spamscore=0 suspectscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_054204_490439_354BAA37 
X-CRM114-Status: GOOD (  14.83  )
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

On Thu, Apr 23, 2026 at 11:17:13AM +0200, Luca Ceresoli wrote:
> drm_connector_attach_encoder() is now called by
> drm_bridge_connector_init().

Nit: there is a tiny typo in the subject, but it can be fixed when
applying.

> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/rockchip/cdn-dp-core.c | 2 --
>  1 file changed, 2 deletions(-)

-- 
With best wishes
Dmitry

