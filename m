Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 461CDC369DC
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Apr 2025 15:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=95T6lUWWSMvDyPMIc22M5eNKHqFKHq2wCTghZ6/oaJE=; b=CSs0RikCr4SWu8vvnGKn2JT1D3
	IXu81aLU/Yx9NteSJAFBMEdMs3RAz7I6u3TYLd6XSCNozcdq3x/dW+7wIxzmiW8n2I4k9oHEincX/
	0G9fs8aMyUx9U/EOWoSY5tpCK3MGCTlguOldnWQ3IP0xTU7eEDLilixpMcLhi00nAEw4QYVBMFH+n
	Uw/uWWhg/Bu12BANpaJ25Tsi2nxhwFPF0Jo3G0q0PnWUCz9A0tMjrCWw4ppxKNz8jRJ6yzkgybZ8G
	kiqXYXVDl3vI8oMplEffZrt+FhBx2AgVBKOimN9inUFDBycGsT915opU/OcqCBASVT5gBlFt+Dumy
	k260KzOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9mYC-0000000A3hR-0qsd;
	Tue, 29 Apr 2025 15:07:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9mAV-00000009zWh-2RfY
	for linux-mediatek@lists.infradead.org;
	Tue, 29 Apr 2025 14:42:45 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TA1Bp2015407
	for <linux-mediatek@lists.infradead.org>; Tue, 29 Apr 2025 14:42:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=95T6lUWWSMvDyPMIc22M5eNK
	HqFKHq2wCTghZ6/oaJE=; b=WaLLtT5C8FQJcBDimbkuPt6TTht/cqWy5fKvWqMW
	ILpQ4FF1A55IxDrswWlIclW1piFJUsnCWdTYFUGmuQysFPqImmV7yUh6xBE/ilPR
	bb2G6myBogFm4RPgPQrk+conHuGunajECg0n9cIdzK9XsFIwHOvJ5mFV1RUDGjbs
	ZNqm9qaxetcA0D+BTMmzHMm8am9RMW5W5xHeAzwGubxvVQ5DwqDd/2+Mf+3fMfTg
	YZ47bkm9K/StMh6cpwHU8/Epk21WTDsx2zpEdRJiFUZw5CT6/OzmtbcaRFmkse0p
	jVHxBm/tqOBWWPBV3MuZV4aGW4uImQHirEavkGqJTHITLQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468qjwvvpc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Tue, 29 Apr 2025 14:42:42 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c7c30d8986so768290385a.2
        for <linux-mediatek@lists.infradead.org>; Tue, 29 Apr 2025 07:42:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745937762; x=1746542562;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=95T6lUWWSMvDyPMIc22M5eNKHqFKHq2wCTghZ6/oaJE=;
        b=Nnd+IsA8nW4s8LxfYor0oYBVcBn/2rDTxsbVx9Rtnt85yzmoFUsGYmeD2gcdSRPjfZ
         +r2Q2bu3ARecMuTBu3V2S30Gv3HeybFPqdX7f8SU5nsjHVhL4EaxlxCf1/oLgz6UTFQQ
         gp4qyRdPCEl74yd9qx3q+t0PAxdjoLUYAZCbnIondGtDrHlssquyOPClXHH/TDeO47PI
         xkbnx7su3Os4MnaIuI49VnxYStp752m9E5l0yMGF81xyb9n2XDbOKUswdQ0kZqw3febj
         7A3gJltCt1YOy7XQVbpkoSKRREOGUpMqtDIUHsVn0/ICcnL+28Yer6t+o2EQ/gOnEqee
         qqoA==
X-Forwarded-Encrypted: i=1; AJvYcCXJ5295jPiy71Tec2FUDiYlfEemrYJg2MkyQaK9s8D+kD0K7fpSEda95wxoeqQRk5hQJCPvrHGsrAP8+DlI3Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzj2CY47/pqLCKzKH9+DJ4iZFj1IOxmekMq2K4oKuPixo7p4eia
	SFCUA1OezZRY/2f4TfUxf40SWoBfw4NQJccu6JlI0nDzFCF087qb1Hh25TFrVjBgoXjyM0Ch+mW
	rq5pkn7wHctRm81bqVcg75Dgzl/t9uIKKHl2N/PYj+d7UY1WdKncZpXCGQutuCs6Hkv/DnSg=
X-Gm-Gg: ASbGncvhtnqAUt6TpqZEiKZhZ/3bo0sy4htYBPeRYwNyc47icQOGGCsqAyhxAI7cJ1R
	6F9C1u8GSy8qIWznq9x6ogOClpVZpLg2Kx90kmYQec+nbvw76N5Pd4pmH3IVAmlXSo/TWlnXHsL
	8f4PGVCmrXLg0ciT3aIh8AWe4UpYL+T9Gbsun59LwmxJUxBYoVFNbnp98kW5GfaobQNPFGt+ODO
	UcaW1xW8CRcUU+/RrXF1vmX59PN4rRYsWcfOys6tPd3PP5xF0Jb2ryjcQZ43iJDTUtoXi3yEW8M
	l8spkjwfwQmr4kvEiDDSwki2y3dH5+rsqBQyztznCp5NQ2H9QY5N8Cw03VBkZZzSt8WXdX03ZzM
	=
X-Received: by 2002:a05:620a:4609:b0:7c5:6a66:5c1e with SMTP id af79cd13be357-7c9668cdc37mr2109271985a.58.1745937761568;
        Tue, 29 Apr 2025 07:42:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDNJAkS5MxDnNhkLq8y60Bm1ZZecLba9P4Zw5IB7TV0UsyjpIf9foZNs6LWwIvq9tQDTlZsQ==
X-Received: by 2002:a05:620a:4609:b0:7c5:6a66:5c1e with SMTP id af79cd13be357-7c9668cdc37mr2109266985a.58.1745937761023;
        Tue, 29 Apr 2025 07:42:41 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb26258sm1895708e87.17.2025.04.29.07.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 07:42:40 -0700 (PDT)
Date: Tue, 29 Apr 2025 17:42:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Jagan Teki <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Douglas Anderson <dianders@chromium.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Luca Ceresoli <luca.ceresoli@bootlin.com>, Anusha Srivatsa <asrivats@redhat.com>, Paul Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>, Hui Pu <Hui.Pu@gehealthcare.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org, asahi@lists.linux.dev, linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, Adam Ford <aford173@gmail.com>, Adrien Grassein <adrien.grassein@gmail.com>, Aleksandr Mishin <amishin@t-argos.ru>, Andy Yan <andy.yan@rock-chips.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Benson Leung <bleung@chromium.org>, Biju Das <biju.das.jz@bp.renesas.com>, Christoph Fritz <chf.fritz@googlemail.com>, Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Detlev Casanova <detlev.casanova@collabora.com>, Dharma Balasubiramani <dharma.b@microchip.com>, Guenter Roeck <groeck@chromium.org>, Heiko Stuebner <heiko@sntech.de>, Jani Nikula <jani.nikula@intel.com>, Janne Grunau <j@jannau.net>, Jerome Brunet <jbrunet@baylibre.com>, Jesse Van Gavere <jesseevg@gmail.com>, Kevin Hilman <khilman@baylibre.com>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Liu Ying <victor.liu@nxp.com>, Manikandan Muralidharan <manikandan.m@microchip.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Phong LE <ple@baylibre.com>, Sasha Finkelstein <fnkl.kernel@gmail.com>, Sugar Zhang <sugar.zhang@rock-chips.com>, Sui Jingfeng <sui.jingfeng@linux.dev>, Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, Vitalii Mordan <mordan@ispras.ru>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Hans de Goede <hdegoede@redhat.com>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, "Rob Herring (Arm)" <robh@kernel.org>, Hsin-Te Yuan <yuanhsinte@chromium.org>, Pin-yen Lin <treapking@chromium.org>, Xin Ji <xji@analogixsemi.com>, Aradhya Bhatia <a-bhatia1@ti.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Ian Ray <ian.ray@ge.com>, Martyn Welch <martyn.welch@collabora.co.uk>, Peter Senna Tschudin <peter.senna@gmail.com>, Russell King <linux@armlinux.org.uk>, Herve Codina <herve.codina@bootlin.com>, Alim Akhtar <alim.akhtar@samsung.com>, Inki Dae <inki.dae@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, Bjorn Andersson <quic_bjorande@quicinc.com>, Marijn Suijten <marijn.suijten@somainline.org>, Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Helge Deller <deller@gmx.de>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: (subset) [PATCH v2 00/34] drm: convert all bridges to
 devm_drm_bridge_alloc()
Message-ID: <sdiwpe7nnhud3fvkgijjbfyenlwpchbxgehyxmsy7c5loo257h@hkfcawkjrlhd>
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <174591887152.961603.7706063017853945511.b4-ty@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174591887152.961603.7706063017853945511.b4-ty@bootlin.com>
X-Proofpoint-ORIG-GUID: gwUznVz-XNMOYbIVNf5k6cvPncIYHf9H
X-Proofpoint-GUID: gwUznVz-XNMOYbIVNf5k6cvPncIYHf9H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDExMCBTYWx0ZWRfX7aj/KHTP/W0a sSRCqzG9MSxPXoN7Ugc0TmLDJPa3F2epXd22iLzrghZ70oCbedZtiQYcxS/qEPo8deeCPnYVi2D MWOaoFgJHtPaaHPlgKvg8wGVaNz74Eg6tdPhv12S65N4j8OHxS36BhlhOacZpxI4W5uFs/oq5PE
 v1tISRN/YLaxpqtRTqutbSDkcrxVoI8LcesQ1VdlzpwBGl37CO9VKIERKIYnGiXZvreScAdgk9a XCWE+V1K9EQb8nBxTvHELIlLXStJTTYgS5lcmH075T5owhKUyUHLEoRWAm5kY56dVfXCyx0/8SA R+fpSkrmrqs9MzaahYd2a8SkYpxRAu5H+kb134wHF8N3Bw5J1vfaCXeO6tL/AvYIIv3p9uGtxO6
 Pbn8mcABMtqtaDNu2VHY9HsOOaaUXEwabzerYrIgDC0IzQDAA2kxw2P3aLn2d7vAQ4BAo4ur
X-Authority-Analysis: v=2.4 cv=c/urQQ9l c=1 sm=1 tr=0 ts=6810e562 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=1X4oNAvfgwtBicUf-4YA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 phishscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0 malwarescore=0
 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_074243_749198_29B28E38 
X-CRM114-Status: GOOD (  18.84  )
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

On Tue, Apr 29, 2025 at 11:27:51AM +0200, Louis Chauvet wrote:
> 
> On Thu, 24 Apr 2025 20:59:07 +0200, Luca Ceresoli wrote:
> > devm_drm_bridge_alloc() [0] is the new API to allocate and initialize a DRM
> > bridge, and the only one supported from now on. It is also necessary for
> > implementing reference counting and thus needed to support removal of
> > bridges from a still existing DRM pipeline without use-after-free.
> > 
> > This series converts all DRM bridges to the new API.
> > 
> > [...]
> 
> Applied, thanks!
> 

[...]

> [16/34] drm/msm/dp: convert to devm_drm_bridge_alloc() API
>         commit: b2aabe5c6b65516d88214aba4b12ce2ca78bac6c
> [17/34] drm/msm/dsi: convert to devm_drm_bridge_alloc() API
>         commit: fffc8847743e45604c4478f554d628481b985556
> [18/34] drm/msm/hdmi: convert to devm_drm_bridge_alloc() API
>         commit: e11532be87e437648521a8ed5358c56df11933b4

Why? These drivers are explicitly handled outside of drm-misc. Please be
more careful next time.

-- 
With best wishes
Dmitry

