Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FF4ED58CBE
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Mar 2026 04:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sQGEJXGCGP1VT5nokRdn3QZgaBAAwrlU3lx1pdI7M98=; b=N1f0YwQ6FQ8CGE2KZrpYtWxNCU
	MfWaeN1iABjjyic2zFVoDgwPwkNGqU6No4yxcxijwFEorbV2jaJnpEXEIR4R8wkRL7YuoXwlCRCQJ
	x3NHSgGxv8I5aaXOscnc5bfK6jcygZr2cQ8uTXLiv7fiV4iRRFYvm6S4VE7kytS0lIFZuJj8eU49F
	RankDcqYOHHRD+0PTKf8j0STiHmeMnznLuuBHuEXKwQYzdf6tSNrDLphi+i1WFqunGgyMzZxcir5y
	RIrqoWmmIdEihIl/GP4THwXamsEdMAEcGXx6lVMOn96iHdS1qcNHu8pf9u7VcKZGUCzccDZlRb63I
	160F592g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4Wcc-0000000G09J-2XyZ;
	Mon, 23 Mar 2026 04:10:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4WcX-0000000G07q-0cJt
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Mar 2026 04:10:30 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62MKv2Dt2067828
	for <linux-mediatek@lists.infradead.org>; Mon, 23 Mar 2026 04:10:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sQGEJXGCGP1VT5nokRdn3QZg
	aBAAwrlU3lx1pdI7M98=; b=i7kecrEVBLxO1WNf+l5nmTc2n+Uzo/nysllO0FnQ
	hbeqyVQsO9lmxoRPFiatAESTJXCA8eVSpw5OfaSJbcdhkTF/N1TPrtV/f/q0FEYl
	VlWbN2Ms4pzCJGQp0A4A0hnIfUhYvgig+FROqZ3fKWWu8EjxjsKBg7+fzAaBis03
	GEkWpvszzEevqzO8lVdYQMInB4zOdGLjJgW7M8nsg0VsQnzLtoIKQz9qNccJz67X
	9j0TO8uUebepnxQM4MMlABNs6ApY1DEps+N15UmcVqtj2IaOXoHw/MG8hWlNRAfT
	vOekq4oJi59jpYJwBZnCYkszmNMG9AtJDnL5BsKdqUB9yw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1m3cuhd2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Mon, 23 Mar 2026 04:10:28 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5093a985e21so300905061cf.3
        for <linux-mediatek@lists.infradead.org>; Sun, 22 Mar 2026 21:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774239027; x=1774843827; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sQGEJXGCGP1VT5nokRdn3QZgaBAAwrlU3lx1pdI7M98=;
        b=fwnkibC58Z8ORitsj+dpggn/jPXem98V2GXXwcZbJlC411xI22SutMIwe79eaEGxrM
         3skY9Ez3EGnQ5AfJjnBcdUm8pdCYJKoi3OMADszEFAeSb2cf9Yxw5Dt2sEjU+SvYLvfg
         uE28nC53QW0Lc6AnIP3rbsNWWeCozsbFyiEb/LDnCk7oLgK3b6F8X9MsKbqHjAy/iD6H
         f/S3Gr563b8BS34ci6xM9pB+8eLC3oktSxtZUJjeRB/Eyn5xpnik9xTuw5CfZ0lVjtpK
         AffE9YD9N5Vxm0lw8b8MdJtVQn4q8kFOBf51G99Wk/53LlC77O9CqA4R3zbCHfXQpOYt
         bmgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774239027; x=1774843827;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sQGEJXGCGP1VT5nokRdn3QZgaBAAwrlU3lx1pdI7M98=;
        b=BMnqbwExJFdVdWx4RMCmwzAeKvm4FZdl5BJE0KAyzdBYrRNazGzE3siXmof37beI7l
         tsbPHldiTOn9wn4BcuCuiWK9snHWTmtZ+mvUsembiXrex/PISrRZH15HdSV9wojtA7jz
         1rqha8m68l6qAoSd77YB7T1Vk/XnHk7RiMNzuaHAa1Kdfo99EeAWbLD/2gsNkJ5cqBGA
         dHNmLOzwv1TneJPtk9NH6JkX6aSataTjs/trI9IyvBZ5pG3sR2uNK6UNcELo8/FIQN2r
         McCLiR3El8DQLtXzU73qkSn4bV/ogLmA0laN8xkZ/VlmXKJNbAApQnK4N9thFfkOQC6g
         lzkA==
X-Forwarded-Encrypted: i=1; AJvYcCUEG3fNp1c+USAQOgfJp4RX93ENj5VPvXzQwOqNHE9GKpX/VD9j7nh6Sh5pHuKEPSSfPCbf9ofx63aAjyo7NQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwAut+KAGjD5VcoG/Ya03b0GlKNRRSC1oFGduRjf4j5vF4jRsvC
	44Crq3guCQvKs9tksAcEVAZ17mV5UkKR7MPMvk5Cu3BZIULLZr0K3s4++FNI5tD53oDWfEWAbWP
	QJJ7OxFbAMhtMEifm3lNxvA2X75QO2NllmQdkLeSlFJQNM/LrNZzyMziPc8AS3UJdXuIjDmm7AT
	8=
X-Gm-Gg: ATEYQzxH0Xsstx4IFA2EzngboiIVOrLZ3gDPSywdPYh5uyKsloWkJMjT4cg3nQGj9Pm
	VFrwnqifQP91R92f55djx2fcmxjsRs19qiwLIJc+5DHaG50YxrU6w2SoisznWCx8R5m/42d1OQD
	UgkJEuvfKsiNfIrG6MhHaw09ef9IeUAC02eUWGefn47uYQjd/+HiSrn9KrrUPm2UOpWmJnE0DEU
	KRL1W9tGQD7/lFaEtcq+jTVeyw9Hi+v0zq1c6DYSJrUHJc7hLS3Geaiijg8wKQcQaVgK8vV7K+z
	B6c4oX3yHU+es+7+Ev+PCf6Xgur6izh+yKa3HVrZVGj7BhLYqbWNPO9Y/nMu4d6bDbkt6WreZtl
	o3MsxerUuXIHv/3li+6MHEIc7Ijzs9A4eP5x4pFSQ8Uep/Tbtm2M/r/rcznlqptwZZEGibwafSD
	gHZwQvZgBOwBXpdCYVQLqWgw13xhWzaP1ujkM=
X-Received: by 2002:a05:622a:4287:b0:509:f36:497d with SMTP id d75a77b69052e-50b374a7a76mr157306101cf.30.1774239027571;
        Sun, 22 Mar 2026 21:10:27 -0700 (PDT)
X-Received: by 2002:a05:622a:4287:b0:509:f36:497d with SMTP id d75a77b69052e-50b374a7a76mr157306021cf.30.1774239027086;
        Sun, 22 Mar 2026 21:10:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285192b44sm2215746e87.5.2026.03.22.21.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 21:10:25 -0700 (PDT)
Date: Mon, 23 Mar 2026 06:10:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
        Rodrigo Siqueira <siqueira@igalia.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Andy Yan <andy.yan@rock-chips.com>, Liviu Dudau <liviu.dudau@arm.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Sandy Huang <hjc@rock-chips.com>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Liu Ying <victor.liu@nxp.com>, Chen-Yu Tsai <wens@kernel.org>,
        Samuel Holland <samuel@sholland.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        amd-gfx@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
        Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v3 14/14] drm/display: hdmi: Use drm_output_color_format
 instead of hdmi_colorspace
Message-ID: <gcl34au4vrbew3gtr7z3ui5tpkiehiatiicrawe7ls7ulq5vk4@tecy3vwgihcr>
References: <20260305-drm-rework-color-formats-v3-0-f3935f6db579@kernel.org>
 <20260305-drm-rework-color-formats-v3-14-f3935f6db579@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305-drm-rework-color-formats-v3-14-f3935f6db579@kernel.org>
X-Proofpoint-GUID: MAdy8dHsGv5RaSKntTN-uRCQLXcZnWf5
X-Authority-Analysis: v=2.4 cv=Z5rh3XRA c=1 sm=1 tr=0 ts=69c0bd34 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=QyXUC8HyAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=PZBe32_PtwNt9AllZ3gA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDAyOCBTYWx0ZWRfX+mCTnFmJNCuH
 lFvc4/quUuShT6PqqjCntKt92SOG0b3qSkS7BVB1l3ew4PelwLjytT33aesZaMrPghPTIYBIbMT
 O+8vQC3WGS8CENO1YtpJRe9zXY3C9q1C0sUKV1CpQD/S91AY6kdsePWokKxS7S3fldBSa4AELfi
 ScteXrEvGVm+GPXuTg/ZiuIHkQIxYs4xWfozp9TLJdo26wa10HsJ3vJpse9JL7gEhRtiNe/HjdF
 W/88UJVqePRz1OlJKYuZ+IMMXznyEaHuxp2SBt+gQ+XygZSLtNJwvf76NanTUhsrh7fY/Pqd0yV
 BEr6+r0VFlPgrAAf2GTQ3v9U2FVOsIxxyWLDGQW4BmYKLQ+184y/8LcA1j5tB2bxxVXm+7kBiuA
 omj55rU8DbTKypeFR/4YY5m7LLVFOSwvQfd2jj2SOu1SMpZVBmrUUjAHR2m5/qAMwCKqOCZAGBS
 QsB/NRCz/1OHSHrJ2hg==
X-Proofpoint-ORIG-GUID: MAdy8dHsGv5RaSKntTN-uRCQLXcZnWf5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_01,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0 clxscore=1015
 spamscore=0 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230028
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260322_211029_191677_B219FF87 
X-CRM114-Status: GOOD (  19.85  )
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

On Thu, Mar 05, 2026 at 10:05:06AM +0100, Maxime Ripard wrote:
> The hdmi_colorspace enum was defined to represent the colorspace value
> of the HDMI infoframes. It was later used by some HDMI drivers to
> express the output format they should be setting up.
> 
> During the introduction of the HDMI helpers, it then was used to
> represent it in the drm_connector_hdmi_state structure.
> 
> However, it's always been somewhat redundant with the DRM_COLOR_FORMAT_*
> defines, and now with the drm_output_color_format enum. Let's
> consolidate around drm_output_color_format in drm_connector_hdmi_state
> to facilitate the current effort to provide a global output format
> selection mechanism.
> 
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/bridge/inno-hdmi.c                 |   6 +-
>  drivers/gpu/drm/bridge/ite-it6263.c                |   2 +-
>  drivers/gpu/drm/display/drm_bridge_connector.c     |   4 +-
>  drivers/gpu/drm/display/drm_hdmi_helper.c          |   7 +-
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c    |  52 ++++--
>  drivers/gpu/drm/drm_bridge.c                       |   2 +-
>  drivers/gpu/drm/drm_connector.c                    |  16 +-
>  drivers/gpu/drm/mediatek/mtk_hdmi_v2.c             |   8 +-
>  drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |   2 +-
>  drivers/gpu/drm/tests/drm_connector_test.c         |  80 ++++-----
>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 182 ++++++++++-----------
>  drivers/gpu/drm/vc4/vc4_hdmi.c                     |  18 +-
>  drivers/gpu/drm/vc4/vc4_hdmi.h                     |   2 +-
>  include/drm/bridge/dw_hdmi_qp.h                    |   2 +-
>  include/drm/display/drm_hdmi_helper.h              |   3 +-
>  include/drm/drm_bridge.h                           |   5 +-
>  include/drm/drm_connector.h                        |   9 +-
>  17 files changed, 213 insertions(+), 187 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

