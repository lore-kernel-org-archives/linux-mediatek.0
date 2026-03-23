Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9DF3D58CCE
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Mar 2026 04:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZjTWTO9LGKbNJnCdQR2t56GaqKq39XkGtlvuZ5fybUY=; b=Lj3XkYOyeia+GVoXRegabHAWwS
	7boe1F6N4fuqa8F/+6bmuDi4rE5jdm7y8Z0hZ4z1ntfWRfdl3Ks7HEpUm8lkzRnfijZqQ04fisIZt
	oB8IjO/2tJjqZdc4CvF941mKNjVikVfxqPQTV+rWkSisUsITmpoPo57l6HIfSwWJEe1J54lzsD+ZU
	qslKHyftx6Xm/0LoGx2aahmVOZLb+qxw8FDsgO6Hf9A2/HAWsMAFgJXclUwiI595V+mBZw2xkKoHn
	eAizig4gnPFGRAJZGiXjomzwJPPhiqhSU+F4mvFzhy5lri+ZmlxTA7ee0FK1gNUh85PlLlE/xU65G
	Uhe+5ZIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4WVW-0000000FySY-3kUH;
	Mon, 23 Mar 2026 04:03:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4WVV-0000000FyRF-1AdD
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Mar 2026 04:03:14 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62MNTmGn2370531
	for <linux-mediatek@lists.infradead.org>; Mon, 23 Mar 2026 04:03:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZjTWTO9LGKbNJnCdQR2t56Ga
	qKq39XkGtlvuZ5fybUY=; b=Ozc6CeFD6p1fCbrn7gsfAUtdjoYHKvbceDQNVeNL
	gdGiq572M53A7ankXVia7Q9sS7TX+Qu5iMKQjqtSw93u/AJzb2beekF0AydNlzh9
	W2SbJM4tROlHH2oUhRrdishXFoYahYu3BPMjSSHJca+vwzSbKmC8inVkmD/zcq05
	8inmKT5xjBX66/Pda5BYtqNzP0gLZMC5NlCLIt5NcEDdAnmabFiyp/YBPUQCcdDE
	rgWB1SvrJ9EsA9J3Mxy70Du2SDeI6qLM0fgsIUWErTgvZ0zp7FmeMkxRnbPrHW/H
	OCkQ/cwWHQ11kLfWcLankx3x2yH2KW6w4Kjo+PzgcEcMNQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1m3cugvf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Mon, 23 Mar 2026 04:03:12 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50917996cfaso36295811cf.0
        for <linux-mediatek@lists.infradead.org>; Sun, 22 Mar 2026 21:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774238591; x=1774843391; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZjTWTO9LGKbNJnCdQR2t56GaqKq39XkGtlvuZ5fybUY=;
        b=YYNhO6CW/VDZJdJyQsK9vA0qB8XvEIMtnIbrzz/71inuDlvmnP3q7TX/6xYv5zldL2
         bn8zrkdIzxR955Rupr+G1SaS8OIukpCWeAP6k4xBf7DJ4v+rgA1bYqfsCez19KapuqD4
         74LzKuTt338lKIGyUl3wNINT23XLXJHMAubit1oEFlIQd/Z/gJwXoRYcrPo5hdkntIaf
         1LkgQADGHNtWIcn9MqiJRqn9o8Ygny5wcgEqDOkLZjwV5M7gYd7oUD/A8H2Kj8kF9F06
         8vRYZepqsDqHLudq106BCxP3VzptA4kd/HZpU4daXu+N+MAvmEN70yEZ1NMKhpLxxYKt
         llEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774238591; x=1774843391;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZjTWTO9LGKbNJnCdQR2t56GaqKq39XkGtlvuZ5fybUY=;
        b=YaXBD7mPIkJSVlb5xn5zy8oPZL1yijc2BQTnq/8U06aM8g9sxqXfu82PhY+ZzcHsOy
         l3m/m45tn/GeB+aNxfxeo7asSSsjieR5hPx10gHeVJeGG2VpLtSYXrFSGCPgpAf7DNKm
         +hWDHKOt9NqIIBUMGYK7QzegUDzNf9OnJVAfM1yvKi5LonNMU1ReueAvftQ0yBl0sZBQ
         FL5noPYlEu1lWOR6Y45HDdiFbsd1V1bwSJLKlc/r7vc1hRHv1Turvzl2RwhIfAGVmzrS
         JB6NLttgpzvziXXh0Yia5v9iiTg0MUIqCYcFF4N8tlW3ufm5FOndeIxS70mTz7IVMGZt
         jc4A==
X-Forwarded-Encrypted: i=1; AJvYcCW6KbckP/4NhnAri5PXlakbXh1X78lN6A7QChkIeZKeRn/V7l6Akxc05oifGTbEpDsDWVQnE6DCYuceKW1M9Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YypNFGVXE0fZN81agooMjQHf8H1Kj45ICmEJEpGYXoQd1oCqTwe
	xPDZldiGd345mS+PtZ92TqCZroxAbZQjk58mprDUYdOCFHQj8q0Cy2JR0DPeX/Nzvqoo2B4ukLN
	DxA8DGXeSuH5DZCCy+E+YmZWqmpR41O873mQBystDn02YAygsICmZbiAbwDuU2GJ/2ZO0iGv2xq
	E=
X-Gm-Gg: ATEYQzxpggwhtX6KW7Mk2Oh2ECq8uew/JkkC4XEJkxNIts15mmMbyD9Q0dO1LQCfDx5
	tj4/CuXKc2Up1v61F6f8e349DLILMUZK+DXmG+BDnChtPFlEkcT2wVRqWL2T+ak9BYtZJO8yxUN
	cuGoBj5vJ9NlUA+tlp0xG/Yz41S2+ACwxBJXIiK7M8UODGK7oEtUaRr3T+aT+p5tOitFjOwJ+tu
	SgEH7m8ZuBNBRsxjS8BFhiE7xW62vuJa0FuiHJdb+azcP1Xn8vSWpwr758h6tpSf/yJY+t/OZ6P
	Hn1WbIrTS8divzmbBOWdKa2t66pCDFMMYgpBjzf7YH5ruERbScCNoDIR0m3AsvlQ5g9os0oEsuW
	kifGtBZCYttX4AQaWIKniSdcJt9QN47oX1JABpwbBNi7KHqex53z24Pom2MOFJi65nCr3Q/rDP9
	VOSZnKha1Vdlx+Fv57swujAO7w+9i/5L+R33s=
X-Received: by 2002:a05:622a:7c0f:b0:509:3c8c:2405 with SMTP id d75a77b69052e-50b3744f6a9mr130275721cf.28.1774238591424;
        Sun, 22 Mar 2026 21:03:11 -0700 (PDT)
X-Received: by 2002:a05:622a:7c0f:b0:509:3c8c:2405 with SMTP id d75a77b69052e-50b3744f6a9mr130275571cf.28.1774238590919;
        Sun, 22 Mar 2026 21:03:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2853055bbsm2240569e87.60.2026.03.22.21.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 21:03:08 -0700 (PDT)
Date: Mon, 23 Mar 2026 06:03:06 +0200
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
Subject: Re: [PATCH v3 07/14] drm/bridge: cadence: Convert to
 drm_output_color_format
Message-ID: <h5giabamrwbtuumue52iu45d2jiybcwbbw3r53modge2pfe5k4@ijprwzi2qx4f>
References: <20260305-drm-rework-color-formats-v3-0-f3935f6db579@kernel.org>
 <20260305-drm-rework-color-formats-v3-7-f3935f6db579@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305-drm-rework-color-formats-v3-7-f3935f6db579@kernel.org>
X-Proofpoint-GUID: MeaGWfnR38JIPGTW0l9i7Y3HbkDHL4u-
X-Authority-Analysis: v=2.4 cv=Z5rh3XRA c=1 sm=1 tr=0 ts=69c0bb80 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=QyXUC8HyAAAA:8
 a=VwQbUJbxAAAA:8 a=CFmvC39ClzzmkW9Sp_QA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDAyNyBTYWx0ZWRfX0Z77Y5X9IlkA
 OTu1UTob7xjrMvXo9xgXVBk4fRwkNRIhIJtMXWnxPeiR2VLW34WBLYg4S7B9UqwqAesHzr54BZT
 km5lKhhCHyg7whbfI7nFlrBn3Z4Eo1hlMOUeDU9k32rNzhoFuCX8XzxvXVrxlDevAMPCgROyOpe
 QKK5ACFCO53BKzgs5B9hgbGmBgrNXt4+ZNvlN3LlVOxhqC4HjtZp7g2rc15cpiS9yMa9VpErZEa
 vXZ2qDzXyr3xgO/IHQ4SO+G9b1Xv8mcNhXujqF/6hCDaZJ+nWhHKYIq4QsMwWUgrVYutGPbxNQK
 EzZuuU+3Sh5XjxeWgSs82gKa6+6AHtbqjfzv2Y5ZE7r0+KBAlo+n2DfmLSlBI+GB26pSZycY7QS
 4L0tSArou+PBN7hXm9vPiR+BrotpZ02Mh+3UeYmMxGMqRDxHIywLFT937AqE0IR7dtRK74WS4eH
 5bh639G3jwC7rEUjScw==
X-Proofpoint-ORIG-GUID: MeaGWfnR38JIPGTW0l9i7Y3HbkDHL4u-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_01,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0 clxscore=1015
 spamscore=0 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260322_210313_350934_6002DF90 
X-CRM114-Status: GOOD (  25.06  )
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

On Thu, Mar 05, 2026 at 10:04:59AM +0100, Maxime Ripard wrote:
> Now that we introduced a new drm_output_color_format enum to represent
> what DRM_COLOR_FORMAT_* bits were representing, we can switch to the new
> enum.
> 
> The main difference is that while DRM_COLOR_FORMAT_ was a bitmask,
> drm_output_color_format is a proper enum. However, the enum was done is
> such a way than DRM_COLOR_FORMAT_X = BIT(DRM_OUTPUT_COLOR_FORMAT_X) so
> the transitition is easier.
> 
> The only thing we need to consider is if the original code meant to use
> that value as a bitmask, in which case we do need to keep the bit shift,
> or as a discriminant in which case we don't.
> 
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.c    | 24 +++++++++++-----------
>  .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.h    |  2 +-
>  2 files changed, 13 insertions(+), 13 deletions(-)
> 
>  	switch (fmt->color_format) {
> -	case DRM_COLOR_FORMAT_RGB444:
> -	case DRM_COLOR_FORMAT_YCBCR444:
> +	case DRM_OUTPUT_COLOR_FORMAT_RGB444:
> +	case DRM_OUTPUT_COLOR_FORMAT_YCBCR444:
>  		bpp = fmt->bpc * 3;
>  		break;
> -	case DRM_COLOR_FORMAT_YCBCR422:
> +	case DRM_OUTPUT_COLOR_FORMAT_YCBCR422:
>  		bpp = fmt->bpc * 2;
>  		break;
> -	case DRM_COLOR_FORMAT_YCBCR420:
> +	case DRM_OUTPUT_COLOR_FORMAT_YCBCR420:

Nit: where are those values being set? I see only the RGB444 being set
in the probe function.

>  		bpp = fmt->bpc * 3 / 2;
>  		break;
>  	default:
>  		bpp = fmt->bpc * 3;
>  		WARN_ON(1);
> @@ -2479,11 +2479,11 @@ static int cdns_mhdp_probe(struct platform_device *pdev)
>  	mhdp->link.rate = mhdp->host.link_rate;
>  	mhdp->link.num_lanes = mhdp->host.lanes_cnt;
>  
>  	/* The only currently supported format */
>  	mhdp->display_fmt.y_only = false;
> -	mhdp->display_fmt.color_format = DRM_COLOR_FORMAT_RGB444;
> +	mhdp->display_fmt.color_format = DRM_OUTPUT_COLOR_FORMAT_RGB444;
>  	mhdp->display_fmt.bpc = 8;
>  
>  	mhdp->bridge.of_node = pdev->dev.of_node;
>  	mhdp->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID |
>  			   DRM_BRIDGE_OP_HPD;

-- 
With best wishes
Dmitry

