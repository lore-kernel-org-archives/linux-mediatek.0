Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71C13D58CBE
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Mar 2026 04:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BxISgP/fl36GplI+JqnlrwsEhA6Bu39iBYyi3QEp08k=; b=aMBx9XKs/bNtPih7Noxm0js/y5
	fsuqDa39cNZHevwwwPuFhSnNgq1r9n6UZOfw6vLEuK9+nmF4908wO45GYfO7OD/htR5OZKHEMgB8X
	quCq7ENi7liVdiQVmVl2dUkLbV0xI8B2QyvCUPuPl04oV4//Fs341C2EOZbDtDF48YazZZgO+qH5U
	2KI0X0LruaXJvtusickoyBl5icTtiTCBMsabgydcQjmKeZulZ4H2GWFlxVRCWEqPd2gis2c5FbpZF
	1aVwC4tCwv+OMjOuiSS6RRAU33JOzCJksMKnVVdTKT9l76Ce+robRbj2VHposbm0kPE2HUYPMxmSW
	5VXl++9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4WaB-0000000Fz5O-0uNM;
	Mon, 23 Mar 2026 04:08:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4WZt-0000000Fywi-3rO9
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Mar 2026 04:07:48 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N3oX7x744272
	for <linux-mediatek@lists.infradead.org>; Mon, 23 Mar 2026 04:07:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BxISgP/fl36GplI+JqnlrwsE
	hA6Bu39iBYyi3QEp08k=; b=YwKTM3sZOJdgT3TAFMPt9LNyf5/D4M6suM8CSNMz
	BYaBOWI6dfGkap/oTUuKXyHdTV76LQO+9/j0vAZQ0jswoAyN+MEvvvLrMyl0BQ34
	rnzQUQ8L9DpbxmTPRdcUV/2nWH5zyvxSxuM9D/36mwIzddifH1wH3axnG8ak2HiZ
	1hagwh+eOOrVVoWluYEbH9ssQiyUwKI2Y4YQ7gjbNiieW1uFcgjBv2EKwnC8zZIC
	NWDuxi4fdO4w/70RMll+U0fRHhJrl3n+AwdViEiCZjbssrUd2kLXTXBxf//VrTXY
	1Nlif3WY1gBVNQgZnuiCrQznq6IuNnSYjdYCxjR8ySPuCw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1jb5krp3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Mon, 23 Mar 2026 04:07:44 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5091327215dso75717131cf.1
        for <linux-mediatek@lists.infradead.org>; Sun, 22 Mar 2026 21:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774238864; x=1774843664; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BxISgP/fl36GplI+JqnlrwsEhA6Bu39iBYyi3QEp08k=;
        b=DJKYTzaIlomfCEdy7KxVd4Z1y8fDy49SuHiAfwIVhCYT0ftfAIldM893TGTjGgmdKt
         2N0rcfeViywhQnb4DhE5WWS51lCXy2ilTnSRtCmNLGmbWsgY9ltUu8lt/rZ35RHOLVVV
         eSFqjH9sVpynoscphLp81etuC+Ohfrm62FTFHZ6sREeV7I8tJpiYB75VmIerq6z0OZDT
         NMGOWQuHOQh4Fn9UUKfVtRUUZMMnV43C7jmXpUQp3i5pe8ZJdcMl735YO7SZyO+mnP3F
         h/q+DAYyh8yvk8l+ToVQPYy7KYtpLZJv/RV9L3P84B70SI3DFDVu8GFDguMRQyVRo4o3
         6NSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774238864; x=1774843664;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BxISgP/fl36GplI+JqnlrwsEhA6Bu39iBYyi3QEp08k=;
        b=DqLUrdY0gAYd04gLksdwCIs0KwWNg8duiRM3SJH23gFh44pZ8eVoy55YKld8DJ6sao
         6yRSBPlhkniQzgKOQQfEhbBPTIiMZRkj8t1ShcqVaKZkLYjmE+7EdFPjSfl9Hgw3x6zO
         YMav0/gK1eCVR7qxNbP2W3ECXL/nCstjCQyzoUljFdlopNE9KsYCdrY685s2BbybejCC
         qflgs5gQapdo2C9uFsNEJegHQ6S9Pzc5K7VOJ9IoQA0C+UGpWiVL8t8OGfWnLYibKHJh
         Z5Vb1UKw8T+avH2aBHvSQ0Iu63gGWpGKdZ5wypZDGOwVjCGnMesEYplZve1nO4e5ibFq
         rlSQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7MfM67gWdUOYpObEnUH52TZKyRH3UhvQYqA2nSIObhCLBd8N6EpY3BdLpTBJJWr0rxWgR/18JOPHeVk/icQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyDYVJRWXgw5Q4tLZBEjxnycvFvmEa5hUqy+E6Zy5LKUtaNqD4B
	UfCVKfHtp3os32egHkQdAH2l7bNA1psrkofzXHW5tyywmnK5ZbYEqTfLPlLEYrPW8ZyoF7dDYVl
	QZAw7z8VgrBg/qYS4hYgAaPjpGPA/poq7XF5qAyAXEr9gaa0q9moV5l7RATg1cHQ0oKabRi9x2P
	0=
X-Gm-Gg: ATEYQzwNqrkfoius0ZnHc9Jnw9dl2BcwqW0ojuSoY8mU7Egf6xZKsRomK0i/HVyWtoZ
	uyJHDkIQBHL898MWDIq3H+BDjOGv7m/4tBrz+YgfiIWEZyJFrf8nWu80JwxFMzXZgvv7L4cFtAW
	B8fCK8rFmkV3wE2ZPr0nYCMFG0z9uIyURQPfKC1ejMVSWiUDM8Y3wBRrxpL0TE0w7Uo6AHjpIn1
	KYxo/2D8q3PN1aoyMF3KQ1UasVleqqldyxmtZvwUdn6ON9hofObURqO7F9XCekLzr+AB2alzJbW
	rqaZ3RXolpWUqTLTfctGWSx88hLus1rhAtekebW/pWe9yMRIpMZf/GEdAMTJdGigvdk+6tjiMKD
	Snq+i+UPqmVeqdsWo3LzSPy3nSXCDtLXJ+T9h8HK72E9w3WwXmi1unbVRRJsZd+ufgKzI8+AYWt
	tiKlfVc2FghSzMjlDksbmiY9qjTRYoBJCM9tM=
X-Received: by 2002:ac8:7f0c:0:b0:50b:48e3:47a7 with SMTP id d75a77b69052e-50b48e34b2amr101887131cf.18.1774238864371;
        Sun, 22 Mar 2026 21:07:44 -0700 (PDT)
X-Received: by 2002:ac8:7f0c:0:b0:50b:48e3:47a7 with SMTP id d75a77b69052e-50b48e34b2amr101886631cf.18.1774238863896;
        Sun, 22 Mar 2026 21:07:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285206f73sm2204203e87.54.2026.03.22.21.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 21:07:42 -0700 (PDT)
Date: Mon, 23 Mar 2026 06:07:39 +0200
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
Subject: Re: [PATCH v3 03/14] drm/display: hdmi: Convert to
 drm_output_color_format
Message-ID: <7duzhocpjyhpvoiw4xy2wlxmrld3sj74rqhozbnlpv2magmbta@c4rlwitio7p6>
References: <20260305-drm-rework-color-formats-v3-0-f3935f6db579@kernel.org>
 <20260305-drm-rework-color-formats-v3-3-f3935f6db579@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305-drm-rework-color-formats-v3-3-f3935f6db579@kernel.org>
X-Authority-Analysis: v=2.4 cv=aJv9aL9m c=1 sm=1 tr=0 ts=69c0bc90 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=QyXUC8HyAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=f-rPyQLBH6VTMeScU9cA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: HhNqWvLy85EGvdU3Q3sGVPnc9Vy2FnUP
X-Proofpoint-ORIG-GUID: HhNqWvLy85EGvdU3Q3sGVPnc9Vy2FnUP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDAyOCBTYWx0ZWRfX4/Hy9/vwKPNw
 Z2cuUeemRu5RT8BeD+qytIm28rM4e3L8BBvWgk/+3rqCNb4zNLdmPu9vMWmiJoZYP9UHTMP0Eiz
 VxpBpB305eKVTTFSUw9j9BOtj/WrAKOqKyUQQP6+44AMcxs+O+uJaOIjzk/ni5WVp4x3/J8AhIT
 UmnwF/riokLjUiJlPFa+zX83LJN4I2Fm8C2KrQFiVh0DwRM9pt7RdME1tqydpZgVCi4z3ylTcOE
 HS7T0kbcxrYi/ccShLHI2WXCRPY258Af8DEJonLzZqXIB6y9CnCcX1GVvuY8vRh1Kmd9jlbGtY8
 9PzHrqfGg9iI2L6svwWzsvp5pn8ch4zFALb96p1hNrMQH8r36Ci9BbgMn/pydx3mFGNh31Melxw
 aze2NHf3ErhGZHQRSX5gmdAilkhlxea4qbYNZ2elidI8PpTOR5bQLCf96blFt32fW43jwpnEWHD
 iMpsbhHbn1H1r12bZsQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_01,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230028
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260322_210746_093170_72540371 
X-CRM114-Status: GOOD (  20.25  )
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

On Thu, Mar 05, 2026 at 10:04:55AM +0100, Maxime Ripard wrote:
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
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

