Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2674DF589B0
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Apr 2026 12:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dRf9flM23evHV+dCjZ11/3wAeY0NjlVmUaCb2MHl7Rc=; b=2J9WIjzCVDkER+NdsBGrgPqj2k
	fQpxEsCF4ITMJCPUqna6gLZZhAypjR5Uj29kRckURXDkpvFsdUCaiqSZCnGhnLzqAQADuZEqXUypu
	Zz5gL99u5f35GR9lG9Ve3xmUg0/xcxW5P+yXdGrzrHcyw/DBCD36Llx9TU6hatpKpVeO0WxzmfiII
	yC4nFaKTGA7g0v5DpmhXvlYKbu6Fu7LPjP/5hoc0wM143rOm4F7B51Zq8p9IX5fnHjXrV6besMadQ
	fRUlykmdhP92OadHm+QPADQ7+88+1458gGbrejb0yKzG+kychx5Y8ew1og/KsQgAy8Z4Iw4DCnRKd
	u9LXbD2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFtQy-0000000Bfyp-1Eo6;
	Thu, 23 Apr 2026 12:45:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFtQx-0000000Bfxe-0wgk
	for linux-mediatek@bombadil.infradead.org;
	Thu, 23 Apr 2026 12:45:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=dRf9flM23evHV+dCjZ11/3wAeY0NjlVmUaCb2MHl7Rc=; b=fkf3K1d4ydUvYdlRVQBy5S9r+V
	IowSEzbHMucbR6KdVJ9FmXvwqOap5nnQUYlrB4cHY4+Hmp3OJSifdioTNXx3dkuFzQ6FIV1xKHVYd
	f7D7SdECyxbRDyrVbZYVzN+Wmtk+Fe+X0BPJKqZYdh+SGutnyRq/NDi2O7NPgWDi4Kg7YuFXXc3+U
	FKQOi3ksXP0PgYpGEQwLjwhkEFfgMQkV5J17vTYg22cq4cu6gjL1YE6w88l1gTIq2gdZSEsW8wVIn
	fVMbghvQfaxqbKZvkJWzAKLz40h7QpEpZKDzqBNIFWyJtYU2FEeTpoycqdmmnMDEVv5On/ySdFNcE
	d+DB5Kvw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFtQm-0000000D3f7-1X3S
	for linux-mediatek@lists.infradead.org;
	Thu, 23 Apr 2026 12:45:30 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8trCm028822
	for <linux-mediatek@lists.infradead.org>; Thu, 23 Apr 2026 12:45:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dRf9flM23evHV+dCjZ11/3wA
	eY0NjlVmUaCb2MHl7Rc=; b=f4KeQ6v7smM+6vkjRyPOX9wXEYAtm4U3Svh9O4LA
	F+Ut9ODMjODxPNbgXzx8vYsDdabudfLWLc0zHnFv+oEKiz89nUOO2sQPOHS/+ZM3
	zQT6oMIVkCq5Wp4R3VTgnkYwX6xePFRT1MC0rIMz32csoNRax4q/mT6Yr/+zL+9C
	7OuvYNvRF7g+TmXzCH7lNo60EkNeNnDFHwVPY44uYX+2fEK1axSGxBuE/TKbVwb/
	fm24A7Rzdi8ERqvvgbrmTj90vCgNjVgjSS7A0elPrw1hQn9gGEzfn8Ty8iz4A8An
	nqvE0T5Xjg8h9sNYtk4IJbU+TIpW+LIBNd98FbPRTRXSOQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqdjm1jna-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Thu, 23 Apr 2026 12:45:18 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-612ef4e6c54so10940948137.2
        for <linux-mediatek@lists.infradead.org>; Thu, 23 Apr 2026 05:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776948317; x=1777553117; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dRf9flM23evHV+dCjZ11/3wAeY0NjlVmUaCb2MHl7Rc=;
        b=BkFNMR3ZF1oscSg6Lh8HDxjO/tOgFLs3NArYG2QJZJKEUm6VjhIqacWDYeQMzhPAAV
         bVhSFZxJCbWLE381Edj1C1Mc053MoT0cqAxO+aPoZ/VRKEZGGtGpNaf4IswctwTJFFt5
         LfFU8lRaNpcl1Xq1oXMsWoxJzD2CPl0DMXhQRYtvD+0qQTxloJEUc0Siybi2evNVZJoc
         XoghhoJxzb+uYJ8O8nYz4Akk5S/Z0IeWkG5ARywQu5Mhjyvg4K+x02LFC3UDH9HrY6JI
         HPffqn96XlJ7Fm2EWP2/8KVIrMmIwkyHLXm8FhWIulPs/DNL8hTR0mBhMUmVurb1mOhC
         XMhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776948317; x=1777553117;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dRf9flM23evHV+dCjZ11/3wAeY0NjlVmUaCb2MHl7Rc=;
        b=jWr4DnXSTt4gn2/Gkog4XIfWIv1t4bCPNxlUQsMOF40ptGGLZ6CSEw2kcYuWTn+mII
         ap/que1mJcWJ5PyI0xDVCezK3mCsUOZj8hNEBhS33Yrr/eIb3loHplctwrx8/ySvD09S
         hitYxP1YEQltNJwZmjeB1a3E+VN7zYIVcqZqijurZVyollQSW57M3syd8vqyRiiQePPy
         IiceYAHWVPJL7tMk+e5WoBGp0gx7VQA4Zcq28Wc2fbOo+J7p/MLk4dRWYjhJJGmIVvcH
         hUSz/5q0JI17wH9OML7fDjyQOawvdi/kP0SfkH4LI2L9sScgev7X6N2/qO1TWnAq1Amq
         IW3g==
X-Forwarded-Encrypted: i=1; AFNElJ8r6uNAF8MiiDp3NZf8dWMZsuAryVOMKwcOoIbQD+gNzvdY3v0ohovy+xT42f+vWjox/qOpCAz+vDB+8lumNg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyH1MELpReRakIQpLxAl8cIFPv4feBSD1xGLBiTLPqKskUUKnt0
	OAWFiiFWHZ7E+4E3rtirHAb3BQ4E47QIOuDj54wZPLQpaJw5T7o59qOMemsQovCGj8l6V5tTDq1
	RBSD616Ut8xVaASZTNrZf4JUojiLl6tNl4qLr6CNAMr58XJ93Pot8pJyu2gJyiR9letgcmSJvri
	w=
X-Gm-Gg: AeBDieveBypLhEYqGQM9y9ebZTdkGcYElcMvfiVs0E62MV6lq8bX84KmEBMrOuJeFoV
	MmAlPhQQmwTp0Q/0IaRKjY0CV4ESbesYgSTIYAHDs1KW+UeHE0BWkNSUASr20cOS6yf+q40K7E2
	irqqcJYWwGKMyZUifUvEgWV0ijoM0iNNhlmSz5Lj+gpjkSNovHrJyzo5u/hHTiYopetKtHHzBLY
	+9XdguMlyprKELgBKZMX4UaErW61n6uFNyumbdd35GFCISrivJTv8Qyaqnv/taCks30ZJe76tat
	8VWB9gMwQ/vp9LDJkCmrgwuwKnvc9GneqSbPoFN+LMlY2d8XYU0cmfIYcQ83Z9HQInE3Rav1xiV
	dMpwrSIKndqibOhzi2Y3F4RyJ7NLOFQqfdXlBRZNjp3wWii3+HhscazjjLEUx2CBZKqWNsQX3g+
	LyTYkfxIUDXUKQZSXclhDoChUpdia/KJ6afkUjdgR1ZZPnqg==
X-Received: by 2002:a05:6102:3e0f:b0:605:19ce:9ccf with SMTP id ada2fe7eead31-616f58af7d9mr13838557137.13.1776948317044;
        Thu, 23 Apr 2026 05:45:17 -0700 (PDT)
X-Received: by 2002:a05:6102:3e0f:b0:605:19ce:9ccf with SMTP id ada2fe7eead31-616f58af7d9mr13838537137.13.1776948316554;
        Thu, 23 Apr 2026 05:45:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb75b033sm41855241fa.39.2026.04.23.05.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 05:45:15 -0700 (PDT)
Date: Thu, 23 Apr 2026 15:45:12 +0300
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
Subject: Re: [PATCH v2 00/41] drm/display: bridge-connector: attach encoder
 to the connector
Message-ID: <wanzalswb3lez6kyklprqojcnidab5fkxgu57lfka45w2rt4ic@xdatq5o7yiub>
References: <20260423-drm-bridge-connector-attach_encoder-v2-0-2ae6ca69b390@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423-drm-bridge-connector-attach_encoder-v2-0-2ae6ca69b390@bootlin.com>
X-Authority-Analysis: v=2.4 cv=EZn4hvmC c=1 sm=1 tr=0 ts=69ea145e cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=SkVVgs_SJVxU13IceqMA:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: 8jILywf2DlXdig-YXwV6A751SziF7Wke
X-Proofpoint-ORIG-GUID: 8jILywf2DlXdig-YXwV6A751SziF7Wke
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDEyNyBTYWx0ZWRfX82f4IJVZn3RU
 oQKDtCv48DUj7otQGZHFa5leBVl5f9Jo1Jv7VducHxSBuIqYjAj9BmLtl0FxUXubvDtSbbToseD
 Jxj0OmbtmGB7YV/In3WTbqPIdVjvJN0gdPyNGy9g63ngOf6zZWzdaUlo8Kbyqmw/bGsQ3pw3UO1
 svbbZtcbJgNBGwE7ym5eij9CwgFGbo5GGbBmw7xEFog6M2ZANu7bw+4vRFlJHZtiHetS5M5P7oF
 yzkjLul2wpbVbo+oRBiCHOnHmlNHvSBfmbrFLZHuRKngyeZa5qQJdH/5jMRoeU2DVzjtVbrN+ID
 6Y8zzdsKU8N+lh2j5iVg5IYBdQM3OosyEnmuVHFPBzBm/ReVxSwLIWW99bvbxAGlaZHSZGCla42
 xkEZaxP6wisaCZiJZfC2OO32LWGY1I8G7m2+qUXwyk9Nm0Wx9mXHXKftr7ukaAL3bEirBJMkshq
 3Lv1M1/62R+EIelEPzw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_134520_893617_441C7684 
X-CRM114-Status: GOOD (  16.40  )
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

On Thu, Apr 23, 2026 at 11:16:54AM +0200, Luca Ceresoli wrote:
> This series simplifies using the bridge-connector by removing the need to
> attach the newly created connector to the encoder.
> 
> == Series description
> 
> Currently all users of the bridge-connector must call
> drm_connector_attach_encoder() immediately after a successful
> drm_bridge_connector_init().
> 
> This is an unnecessary burden for users. Move the call to the end of
> drm_bridge_connector_init() so all callers can be simplified.
> 

I don't know which one is more correct in this situation, but let it be
R-B for the series:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Feel free to take the msm patches through drm-misc-next (A-b).

-- 
With best wishes
Dmitry

