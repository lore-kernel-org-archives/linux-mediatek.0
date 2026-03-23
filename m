Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 651E1D58CBE
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Mar 2026 04:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AqeC/roitS7lz4atrPMGBHkGfv3MPIQwtd12I+kF8Sw=; b=fLLLAPFjeIczLtmHmrtEsTN690
	StiDVOz5/Jpp/8rUS71nbLIk9/9xDrr5OhR9KgZXkn/XDBWBbZACANgmX/CVErwAwpuoP1libuiMu
	krbb97c++bt/M80jzeY0SpKfmTov+lVVh5yWVzo3hk2/fWrgeqwFOV1bH/zqS7yraOLoGpqXUctDf
	93rdTVOgP6w/4hKrYvhUrLLFifHr7E79bRRYp1ccVOtmXiynx7wMz+gKWQcq/bP7hBHmWb07oZP03
	eruyFA9hLja5MJZjwFgIJRdyYO0jgggpX8x2sv/rsIDweUymAmm05mYstYbCqgsIldnu5uAwBKJxK
	rHGM0cWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4WaV-0000000FzJL-2k5u;
	Mon, 23 Mar 2026 04:08:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4WaJ-0000000FzBn-2I7B
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Mar 2026 04:08:13 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62M7DZIa2770715
	for <linux-mediatek@lists.infradead.org>; Mon, 23 Mar 2026 04:08:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AqeC/roitS7lz4atrPMGBHkG
	fv3MPIQwtd12I+kF8Sw=; b=d1R5o6ScrRpvUSm5twz1BpFPnyTr0nJI+3j9WZjW
	hauYc6RhhGiqd+eNOVlzr7CAZVGa7x8+3pn0dZP+a22f64h1IVM2t7WminprqPl7
	RHOpEQS3XEmmJiZ4Z2+lqufwyhESST5agXuk8EfBE00yytBbnZnQ6k0u09eo/Ic9
	3qVS96LHmLZFbHfSXr5GM6ssgvlgL8Ayw17+6O2sg2GqQN7jVjhYjs8S3NwJYO8h
	BvmS48hH80OR5xzCb7XjLCdOEZUQQgCGVIYKKrTpOREmP2onis8Dz3+/TUkzNarq
	szGpXPPh1RkCsb+Y0Z9k+UKIRga00lpmIy9X+lEYgm0crQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1kj1kjdn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Mon, 23 Mar 2026 04:08:10 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b317c40acso28093551cf.1
        for <linux-mediatek@lists.infradead.org>; Sun, 22 Mar 2026 21:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774238890; x=1774843690; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AqeC/roitS7lz4atrPMGBHkGfv3MPIQwtd12I+kF8Sw=;
        b=AqHR8VWL1Wq44CC3dLNSMk/DxS9tkPtl8xXj3pd8pjcMGo44Sk3APLmBxwn6uWnhPH
         xZOydwVIECXvxsWxLQf+slNEr1DsJ16u7fHFEYFRlbCTGBIRFMg2AWPjX6amCIpzLPmm
         Pq7NXYotavFF5yLfWjLWY/xPhquQHNqxMYEAGEgIfGNhJTrtjB9TK9WzZe/ayYbZp2G5
         N5p74PnC2fOLnl//68bjU3ZklbN0Vt+sfYk/CO0frzILnglt3HQg6Zo4hm51k8HOwUlL
         LhQdig9tg0sK5hDFuHAYAURNgVaA2MnJWWpZGdGtwNpGRZvw7F7Qz29twoatxyHcgRQU
         NAUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774238890; x=1774843690;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AqeC/roitS7lz4atrPMGBHkGfv3MPIQwtd12I+kF8Sw=;
        b=Lb2u+Bu+AVjeqlRqt+mzOvZaU088IQVc6wO/pD9znDpzFd8nspSluU22onpjwLgLI4
         o9Gw9JS3uEswkFcqa3nlbeM4HNhtpIaAugb7uBDv0yuJWT8+OyxowLOSoBVs12q7D0L+
         d5IAL9GB/L4fgViNdilasQIczqFifdYm9/iRSYtriL1jMl+1kUKK/FFCkynTNWLMcnmK
         h3FiSVBUZ+WfcjgGaI4hNqIf4mzuq+uBVwpOkxdZqrB9sylcEJNeZ5Ox100g1GEN4/lE
         F7VtyRwfnAWFd18or+YIEkdl0TrvqTYq4+4bGhHYWRDEP7Y+QwEoRqBhh7dmhdLd72Ji
         OaTg==
X-Forwarded-Encrypted: i=1; AJvYcCVU0YS2ANBAYoZ4h9TQtFpX3c7sONrIqxtZ5Ne3B8w5vwWD2MRVmBENn66qfKhjGl0P42PRvzhuhRnmU4fjSw==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywt5ivYFRO6tkFFv/o9B8Emmp0npLaeYnbfsQbN08ty8lQlPMrF
	+Ry9IETLdJDG99NA5XHXzRz4t8zOFT8YBcliSNJ0ztdrU2Oa3ZnQpb8p02SY2etH6dw9jP5kb0i
	AhfPZUv1XugR9BkRJwF3sS3MyiWYhtTVew+B9SKpf7opdyzXXgjD/Jg+8yFZsaSgRPqo1fYXx0l
	I=
X-Gm-Gg: ATEYQzxiS6vJtt4OW42lzbNtBklPTsw6HbGKV/OsVdk32gHN34c5QUqFbczGYuI7ind
	YfQX0konwq1//NUtAsBhvLTQYL4gJjcjerxVahqrEXk5Kvv46si7rQX2xIaYzdhwFok2LPz8zvJ
	lZEthAmNZp+6X8neD3nHkP1BFrW3R1Yj+TAkxs05QW3VJPbdXd1K+Jp5pqfRSh4C7OwUY4tdhUQ
	q8tZs/pD4ZdEoaPUh4Y1mVmsP2cigm5G8UZtGz3lzsQPTlaTav4A26cHFyWYekUkFG+NDgDZfPr
	LA0PgsvFbYaSW6Nhqfqk2FYLaWva+ih3xZ1c7wuo+sQe7GyXBg88HE2SeJSupKfVSYlG6h5Zs9s
	dtxNwaLeQP21ebNDJRzVaGzQMdWYp+ekY60tEv9Xifp/Ufb7rHZ0Fb892x0o31jmdHeX708bJFZ
	X5i0u4nywl/GuVg82w/7fQKfSo1pHbDtyyfAg=
X-Received: by 2002:ac8:7fc4:0:b0:509:2ef7:7034 with SMTP id d75a77b69052e-50b37538e75mr168613771cf.50.1774238889752;
        Sun, 22 Mar 2026 21:08:09 -0700 (PDT)
X-Received: by 2002:ac8:7fc4:0:b0:509:2ef7:7034 with SMTP id d75a77b69052e-50b37538e75mr168613281cf.50.1774238889243;
        Sun, 22 Mar 2026 21:08:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf99820ebsm21316001fa.20.2026.03.22.21.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 21:08:07 -0700 (PDT)
Date: Mon, 23 Mar 2026 06:08:04 +0200
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
Subject: Re: [PATCH v3 06/14] drm/bridge: analogix: Convert to
 drm_output_color_format
Message-ID: <rf7nfbpyc7ce2t4c23melurn226egzqfhk35wt7q7yaurkgeeg@yu4qhmtblpit>
References: <20260305-drm-rework-color-formats-v3-0-f3935f6db579@kernel.org>
 <20260305-drm-rework-color-formats-v3-6-f3935f6db579@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305-drm-rework-color-formats-v3-6-f3935f6db579@kernel.org>
X-Proofpoint-GUID: EcI1wYjl5XHr_BoyF94wXTqylu1lGpDZ
X-Proofpoint-ORIG-GUID: EcI1wYjl5XHr_BoyF94wXTqylu1lGpDZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDAyOCBTYWx0ZWRfX0sawGONvJ6oZ
 XwpT23DWxAQyC/Q6yJXB6gC7NulF+cFcUQD3woOx77j1o9Jl37t6/1Ttj0zE17MzA9GgluyfUEz
 Bqb/zQ0FciwGjzE0oP+kePqo7QQgnNBDjDCRMcQlW7nnkciK0T2ZaJpK9VY7cDS5TmmIoYJhfZ/
 XPrDmmdtMrjT5bIvKr8ywTMOAi/pvL7ALmM59DMUcK1bAWHLqy7AkgDCI3xt9qFwbH17CHYvJo+
 Hd7yL1FgMsRYc/ytNqebHIRevPdXyYfkyZKiOCD5Gn4ozThFmhJ8nymKLDQB55a/krDaYN5zL1Z
 cpA8Xy5+urYY6eJc1UY/A6KtnEMr/T69ya6AunG605ou1wWc3H+zlWe58VrswbRMhPzkKbs+Dft
 qkmVJUbMcYAgBSTeOxdONGQGTEGUPxKrF4OAK7wmV1F0oCg1FhjKCfhd/pTI9oFLRowzzQjLC0o
 GP/KhJIg86rb0md/Ljw==
X-Authority-Analysis: v=2.4 cv=dYiNHHXe c=1 sm=1 tr=0 ts=69c0bcaa cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=QyXUC8HyAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=O2P03feSXV0Fh_yUmGcA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_01,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230028
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260322_210811_644845_DD2B87E2 
X-CRM114-Status: GOOD (  20.63  )
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

On Thu, Mar 05, 2026 at 10:04:58AM +0100, Maxime Ripard wrote:
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
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

