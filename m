Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7654CCA0FED
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Aug 2025 00:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=coI2WbZxINU7lzeYxnfoWTr2sAMMNa2PgUU+5RmzHvA=; b=wBR2USrJ8/3DcfzB6PA0tt5ZSb
	iOCbq09dFr75jjlu1NmZP+LBrWJYLcoSVJedvTvcALv59tUlomZmWKV3ExPGxkueRW/5yXZKUiOLC
	E/vPV7wQfsGLPVKPgndMONbQQvTScBvfUIe1vTip7xxbU2i73qGNhkdU0/6O3b5vDl8VTZaGFl5J7
	F7dZA9hkkoFh4d3wnaTn8NLrrW6qDFb6NdBkEGPyS90q2zMtzSop6tjdUFi5pVAwnyuzV8mrKqkxk
	IgrHZPoTjBtmro96m6Rrl2lew8MPVa3+wvKB7l60Cti6l+Vjuz9vDEU3xD/Ryji0QQsaDC8LR7IeF
	bq8YePtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urQQX-0000000HLdC-01oZ;
	Thu, 28 Aug 2025 00:23:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urOcR-0000000H66R-3um2
	for linux-mediatek@bombadil.infradead.org;
	Wed, 27 Aug 2025 22:27:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=coI2WbZxINU7lzeYxnfoWTr2sAMMNa2PgUU+5RmzHvA=; b=OJDCZbkmdtBi12I4g82bIeu4md
	XG11xVqKJUdtVsJagNbCobDYGvRht1Fk+MAcHayoQmgb8tICnlyKwWUBh8uZBOEd2KiX9nzvJpH8i
	hoKBaIOvNl+JhTqVuMLK/0mgkjU1ONkkmDrnyI/eMYituQoOSHw9I89Jq543gqZakUKf5BLtnBImT
	sP3uI9+N7ug/Sm7ZKfsjMGfLJowQcpTQb0sm3NU55/hAdektn1tA2vJzxVuSm4PdtE4aZ+9+Tys2o
	Xqn/YhOKYuyItB8PpczqpWjoS+FIPiM4urEScJZY0ojpk7ta4cozaFqITkvMpW3yDMH2GVzWB5jrB
	+vwXf1xg==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urOc6-00000002WZG-18Su
	for linux-mediatek@lists.infradead.org;
	Wed, 27 Aug 2025 22:27:33 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57RGgH9S029088
	for <linux-mediatek@lists.infradead.org>; Wed, 27 Aug 2025 22:27:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=coI2WbZxINU7lzeYxnfoWTr2
	sAMMNa2PgUU+5RmzHvA=; b=N3nSP7Gc5TMt+IIn+qZ9uGuYzVafaBp1ac2JStUp
	K7rRbNrItFfkrE4pn3NSwfK3EJKU+G54f3mtlHj6FVmTiyk34UhAcW763bLSlDn6
	lE8nZPvaSrrbDD1z8NV8GMsE+EejI9+PUuTSSHiKEagz9bQN6sfvpB5/sPOKcU3B
	hixfH4Wr/PN3um5++i/3CX9NXOAeLZ9SXBULzqfYPbTbm7cJ0YT0lWqwC5hM7lYu
	l1sOWd/H9mcZguQFv0ANnTeWef+C8qNF9wb0KmfE+GAKuhHp+eDVTrDi1PKjuj3Y
	LyVxJjOjvzkfxEw8ajNN66YMc9YGBbuSSUh3zv0iLcgaEQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5ume8nj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 27 Aug 2025 22:27:25 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b1098f6142so6353781cf.0
        for <linux-mediatek@lists.infradead.org>; Wed, 27 Aug 2025 15:27:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756333644; x=1756938444;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=coI2WbZxINU7lzeYxnfoWTr2sAMMNa2PgUU+5RmzHvA=;
        b=DKYDB5Z9IOj9uj4u5J59zgpsNNhyEGRdJPrPgJET4cGFHUQpz3dxTrO6bQycW/90Pb
         BTtjfKrmhUfnYW61VVMmzsHd7cTD+HKIeBHvJQlicAeFujsa1mlFwLTigSY6FOdjBiPI
         X5dNBhlSt9FmuUOrXH851wisomLv3XvLQVRDihGdnMq/hcz0TNEBv+q5lUNp1Ctatxxi
         6l6RWUK53oNDPgoSoR7UkUndVph7fmOUkl4AMy6TZxtP8/MItXiUDP4HZEyz7QOp0iFA
         CB66VnA7da4GDrIivgJyBT+ne5+V8JtvgYFLbj9IEu4yPNlogXrFTgx3kskL+5tW+mMa
         ymWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFHTH5voQDrmgga/IUD+bZGIW9en6peRgnED4K9IALe081D8D1cyiewxQ6+uuSJn8s7KNbDfmEeVzZXJY3nA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyXSY3c2dkgHsC7bYyGB1fMTMVLzPmZTHjQnpias6GgXSBj2kRE
	pLhi5IpK3OyoBOGfrO2npKX4yn6PCK5PMjo+8w+KabcuF3CHTrjLMaQgvrYU/+O8ap8LyE/qjxm
	Wm3qljORE7RWrpIGbo2r/yVYotZH6yrssUkk+d6zcQVpm/9nqmiGh5DySg/afGQ5q0mzow/rxsU
	8=
X-Gm-Gg: ASbGnctaEl+IIhFWZ8KjLHFiKjA8WroxCsnmEdDfUUUl3s/211DCiufnuk5xCd1YRuB
	E/6SoAZjMEN4P9Y6sA5qoX4T89WXhuYYjLAi/stasM0N2hQ+pwsWxHmvs44y2JaEpO3h1+6KMLM
	g1Zg9Ns0TRLq7KxyJjXSq0vik0WW8WgkYrJBby05iGJP2xwSvXfzm3fSLd8w2eFX0lykzK+AQfy
	u3dqcI80aewjRl7ATdj+me9fNnsbfiLiyO72rCub5mZpMWNyZBhCguEnx5HvkbeiP/7KZZ7A71K
	g7bhS3Q0ZRwstWDavS9Elng0DVkQV85gW7SpaRMs1xOM5jPPBWTgxnCD5Ca4KbOUXpDgYJENDUl
	FM7N3ucBrR1QbxrniBQony0gnXV9DxUjhizJo8hnQ5tdweeMhIPDx
X-Received: by 2002:a05:622a:4c8e:b0:4b0:8f6e:d70a with SMTP id d75a77b69052e-4b2de073d4amr102607481cf.22.1756333644084;
        Wed, 27 Aug 2025 15:27:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfGaJaSCsOEz0+c7R0GpHgMKXCo1cAu/f4pCkJRC2KgnMVotYeSkSM/eNVsc6qfr/OnO8xNw==
X-Received: by 2002:a05:622a:4c8e:b0:4b0:8f6e:d70a with SMTP id d75a77b69052e-4b2de073d4amr102606571cf.22.1756333643552;
        Wed, 27 Aug 2025 15:27:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-336818f1d41sm14139131fa.51.2025.08.27.15.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 15:27:21 -0700 (PDT)
Date: Thu, 28 Aug 2025 01:27:19 +0300
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
Subject: Re: [PATCH 03/39] drm/atomic: Convert
 drm_atomic_get_connector_state() to use new connector state
Message-ID: <hab6s4wyauqiej5ankh3gppdqkm2ymlevhrnklfe76kqjmmjqy@fptmzxpqv5av>
References: <20250825-drm-no-more-existing-state-v1-0-f08ccd9f85c9@kernel.org>
 <20250825-drm-no-more-existing-state-v1-3-f08ccd9f85c9@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-drm-no-more-existing-state-v1-3-f08ccd9f85c9@kernel.org>
X-Authority-Analysis: v=2.4 cv=VtIjA/2n c=1 sm=1 tr=0 ts=68af864d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=wpE8WlYdICmIRzy2dDcA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMiBTYWx0ZWRfXzXH6Ci1Dyjc4
 BmC3SdlVvgAwp7GO/VylYrhpmTx6939oMMJ5QGGUTCn7tTgF2i51JOO2xbNqUlixEPVa3Fg0rGm
 +xCsWs3RBQFF8Tp5jTuLsCePyIKPgPQ9zA2Mz8ODp7BfGF+jSPK+ZbA6lFYd6BwBWIUkCTUBYkp
 PAZF4YuSPG15ARDQKmQibLRh/BcYNe9uSS25J59Ald1tHZDcBt8dS8z8zNZ5qJVX3wpYjFsRfsZ
 6TLle39sB7Z5eSAAHOeIYM4zIZbNi2G+MuCk8433bn4JWDjBvx3g1wIyuzAQReawinu5p/Nkgar
 6SfpiYfqV04xalcUqV/8ogfMKLKWs03BsDwA9Uvpa4E0O6NG9q7Dl+Swn8lZGOk1pQI77iqo1N9
 7WbdbENs
X-Proofpoint-GUID: Hf2MezlhwCtV5TY6XdbM6tTwei1ja04f
X-Proofpoint-ORIG-GUID: Hf2MezlhwCtV5TY6XdbM6tTwei1ja04f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-27_04,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_232731_163458_606A65B0 
X-CRM114-Status: GOOD (  25.54  )
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

On Mon, Aug 25, 2025 at 03:43:08PM +0200, Maxime Ripard wrote:
> The drm_atomic_get_connector_state() function calls the deprecated
> drm_atomic_get_existing_connector_state() helper to get find if a
> connector state had already been allocated and was part of the given
> drm_atomic_state.
> 
> At the point in time where drm_atomic_get_connector_state() can be
> called (ie, during atomic_check), the existing state is the new state
> and drm_atomic_get_existing_connector_state() can thus be replaced by
> drm_atomic_get_new_connector_state().
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_atomic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index 660b081ff5d8c39061cebfb5ea122ac1e51677ad..30b7ec05a1af07075e40cd2822ecfd67df004ba2 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -1128,11 +1128,11 @@ drm_atomic_get_connector_state(struct drm_atomic_state *state,
>  	struct drm_mode_config *config = &connector->dev->mode_config;
>  	struct drm_connector_state *connector_state;
>  
>  	WARN_ON(!state->acquire_ctx);
>  
> -	connector_state = drm_atomic_get_existing_connector_state(state, connector);
> +	connector_state = drm_atomic_get_new_connector_state(state, connector);

I'd say, drop patches 1-2 and use this function directly as is now.

>  	if (connector_state)
>  		return connector_state;
>  
>  	ret = drm_modeset_lock(&config->connection_mutex, state->acquire_ctx);
>  	if (ret)
> 
> -- 
> 2.50.1
> 

-- 
With best wishes
Dmitry

