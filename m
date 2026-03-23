Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0834BD58CD1
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Mar 2026 04:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0ieE8/etbiGBriPXk9aLuLM0adGVcwwwVV2c9dNbcDA=; b=0vtlOKHs/XJeUSed8KeIJasE88
	/jxCdBMU/cZ3eyZGzJ79cdtjELg6W92Jdy7T6gozVdrjKC8n+zIWW0lDJj+Ew7iX3uTp3Bk0zVQK5
	oNWy9Ap3Y2HlTVPDYFhDZkBEz4OcJ7Ny71Z4U97dDIy4xjy6tr3xxEyRbnEvqrFgnQeoiiBdIDTEx
	hKfIAIoLwA56Bxk9SJ7hNbyPIsbFShiuKhVRb2YhR1fbQXRWInYK48k8m2uS163d6bSwIaYJ5S3PJ
	Oc0Ww7TNZ7Em/9Z0/IrVRjDuSgcR9kJ3IK3HJ0xBAMeM9VXWPSm2E5WEkCmMCuoN7hySMD/hHLFtv
	71KUl0Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4WaD-0000000Fz7N-0PSQ;
	Mon, 23 Mar 2026 04:08:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4Wa7-0000000Fz2C-19bW
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Mar 2026 04:08:02 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62MNrCOG443182
	for <linux-mediatek@lists.infradead.org>; Mon, 23 Mar 2026 04:07:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0ieE8/etbiGBriPXk9aLuLM0
	adGVcwwwVV2c9dNbcDA=; b=QgFuGqQYpMk/v6+sTtS2E6AyyL6NO3xR8buOH2KD
	I3JgL+cLyjr3rD+QRimtloHVuf84G7DYRVfjZc/Qxf9yfzASQhU9ZBd16DDsgBO6
	vaFOhHq3zID9O+Ha5ORB1e9/Wua7BqsCXQHRipSHX4TG1eXT+w9VP/d1upa2ziJP
	ddhAHSVS3NzQAcUyIA0yvDZM019E1fuTODHJUMC2DRD23C4ba90Gx/VhTxXEv8cP
	Ji0TYJVfBHZR6KCpef/ctsORGlbMTjsWeK4J3pEai57inymGl2dJRY3fK5149XRu
	AA2Xsdw0/jLjQIpUTSqF+CyzbyH1vkyaESJ3DaUDrWCBxA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1h1e3st0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Mon, 23 Mar 2026 04:07:58 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b380cd5e3so247459721cf.2
        for <linux-mediatek@lists.infradead.org>; Sun, 22 Mar 2026 21:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774238878; x=1774843678; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0ieE8/etbiGBriPXk9aLuLM0adGVcwwwVV2c9dNbcDA=;
        b=KXFq4X2E3TezUziayvlwVV/5ylTYo1LFmcmST1SZwWyWcGZ6dIz6igZG50atdi8iHz
         LG18pLMl0hitrnsR1Y9BlGImsgwy85EqvJZEJVtQ5TGCSGC2d95YErh8GgA4/nsB1vvC
         35rjm4XrbmZDXSXIPtuSOdNCpWl+vg0i647osa/uVDcHmx5LNzwJqgJgzyMiLWJfLGgB
         WFI9Z7R11M4tWSmVOeBaVRi24QqQQF2geN9tQq93KKI8vusOKirqDOYN+e2W6/Yp7mDc
         uU/JSI4Vfi0fEtWLWnPmL3peE75DlrBfjrTU1/iuQzb8S1iFdNDbv6GzLih6xmSX+4un
         hhMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774238878; x=1774843678;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ieE8/etbiGBriPXk9aLuLM0adGVcwwwVV2c9dNbcDA=;
        b=W7KkK5xIeTzwdOTBj4fwMjj1oc1u+cWWXrODdm/w/x5TzHiHbZCfT7PSsWZ5jm4Pj6
         ZavoNnK384bEwkUKWtJLR7IMvwsb12W+KF7yXXt3AH9gI3c/RpA6EZ8/GlrXw1y9G8it
         hc01YjcSbm4aTC7hdHIeYzZvfF7YKWJZFGYucqZreRMT6D5Uwnahl2R9yw5ceBCUWCSE
         U4XSvRO/BvuR4Jzp/AICB24Y+kapVubmM7Z80Fc+0LYYCW6PilppaOixCUQ5y8G/buF4
         AiX20T93lfqkZvUhdMlIlbH5Z0gGQS26Uv9PQBw1TW8cVHXsR6GKVcxXRWOFXR9hyhHA
         cI/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXZv7aU5cd6okM0fgJ/VsxoYoPJsLJR0mchMDRfqjS7e/4m+hyBEdivPupnzAD7UIpMgerrsz9G60pZqHp+QQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3xlcZC+3Xr3n8683MENrSWJxbnLSOxTV7q/E9u3BMjosCqxZA
	fv53UkPUtIreioZGrEdXiGEyEC6SMzkopRcacbRz/QrdpfdXbWkRNdAP8iaal4KgpRCySTC5IcQ
	PssBeq01dUapNxCO4AAkYqtcmxwciPT5YtYpt4mwu7H/6IMkq1aOo9YQ7QNkfMfmjzRoz9pGbfZ
	I=
X-Gm-Gg: ATEYQzykQJhh8Zo9lbkWl9GBaIUXW+y8jic7upZ13uF5aCt5Y8SKL2/eNfTsss2oAyu
	wk/kGD2r9htvea+KvKLdBuu3WeKXL/GwjZnhxftETD9pGn/VwqBZQmAfgIe9b77NcROHyWsyNGO
	0g0IqkOjlALYnzerT7mWp4iXSBlyNqKFfYoNMP18Ftn4J0si96981r9+EJf/TLx4kEL+XHIlZvt
	Wd+bHh2O4wDtX8hwShHuv3VU1v09eQFRNaO//VYsCm8gjOYjvZKGJqpxQ66TF3hrJVc83pGSOBh
	CV6ZIhUq0N6De/hvh1PQye1MACeByWtg/ASE/sOD95F6ojMLJYACjMkeIY9EjZKMy0kPeiYTyvV
	NpzTfTR1t0YmcNiVloYcWiNSalBBX/Rz20cUhaIEZTLs6jraXgEgzQCuxo9vk34GtG0Dm5n2war
	LF5hgpwbUzZMGedbfca15Bft0+puH7IXdfvUI=
X-Received: by 2002:ac8:5813:0:b0:50b:4e65:95d9 with SMTP id d75a77b69052e-50b4e6598f9mr88670871cf.64.1774238877901;
        Sun, 22 Mar 2026 21:07:57 -0700 (PDT)
X-Received: by 2002:ac8:5813:0:b0:50b:4e65:95d9 with SMTP id d75a77b69052e-50b4e6598f9mr88670581cf.64.1774238877393;
        Sun, 22 Mar 2026 21:07:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285192b5esm2239889e87.16.2026.03.22.21.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 21:07:56 -0700 (PDT)
Date: Mon, 23 Mar 2026 06:07:53 +0200
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
Subject: Re: [PATCH v3 05/14] drm/bridge: adv7511: Convert to
 drm_output_color_format
Message-ID: <orzixmg2drbnkygv4wz77ddlvbfbkmhg3hydt67b6xittdx3qf@2hghjym3ggon>
References: <20260305-drm-rework-color-formats-v3-0-f3935f6db579@kernel.org>
 <20260305-drm-rework-color-formats-v3-5-f3935f6db579@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305-drm-rework-color-formats-v3-5-f3935f6db579@kernel.org>
X-Proofpoint-ORIG-GUID: Erloqbta2fXJ5Pm45HDFuUFVRPKq_ZYW
X-Authority-Analysis: v=2.4 cv=epXSD4pX c=1 sm=1 tr=0 ts=69c0bc9e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=QyXUC8HyAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=O2P03feSXV0Fh_yUmGcA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDAyOCBTYWx0ZWRfXy7ALeEue/dQG
 cr+AbId3gzPnrv7iLzPg3SGHpTJDmg9Jg4Q6Wwco/yeHD62nGNcyFv0T6ugU+5DD/OgqOta1f17
 tQpEEzNLUy5PW0j2dZuVqbOeTth91ffJ1Oj8F//WQv+LTjly6I/ZA7SYpT5H48mVkaWXhR7j5/3
 utMxodj0engkB1hTUtwkv7A6mKUwtMTdlbgsay3mYGfT7T4AK8WpsK+fCvnSULEKXBunqIQMXf8
 JRtcwK5aoFDUCoDf1yL6jpDHQ39X4jrOlyEUPMRlo/xrWi+6C9bKq8jl/IEr3ZEmWF6dphT/DUz
 SpHtWUQj5seM490mOkj77h9/nOpHv4Vo+3wJCBinz2MWBMTUBmI2Ox/nexrpxrdvkHo2JKgI3wH
 rRThSVc4klakOKZoPJIAH7yN7nqiUFPw5mxIWB7wqwpWnQscefJiXUgjAMimf2aMT2pNmBvv4oD
 s+sR8sI0tTteFt1yN9Q==
X-Proofpoint-GUID: Erloqbta2fXJ5Pm45HDFuUFVRPKq_ZYW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_01,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230028
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260322_210759_343494_05C05C4F 
X-CRM114-Status: GOOD (  20.75  )
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

On Thu, Mar 05, 2026 at 10:04:57AM +0100, Maxime Ripard wrote:
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
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

