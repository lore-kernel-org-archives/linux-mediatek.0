Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67990D58CD1
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Mar 2026 04:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oLpTgVGxCw1Fj4mzUbzinm41xv8ZtpXmsVNDwDSI2gs=; b=uRVcudxJonThiNt+2EKFANMwh5
	YovSsKHgeAObnEew3dBZf2t3uwX4NTao++sFs3Tl/Ix6nn9ak00usa/qMN9dvGB/tbtxgcbQXEbR1
	jQKGf7hIcfrRz366+i9uuvhz6jFA18ccUt/T3hSRyLM4pebOyGXXfNy+rr2NRoIafUWxVVn4XACuB
	VlLyIjEs/j/YHClKEi4uctq7Uov0o8XBmJBKSv+Iw9zQsP5d9Cfsj68iEuVOtceS9s3qmQcYaUbnk
	1CsDxv65ZRaxMGw3UtDtvLF6uUissRppH9bfWZEW//QnJAOuE8YYUV2AaQ7+lTgxgo0pubLFtFrPN
	lOHuHB/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4Wab-0000000FzOk-2xkr;
	Mon, 23 Mar 2026 04:08:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4WaZ-0000000FzMi-2vpO
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Mar 2026 04:08:29 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62M7D4ue3737826
	for <linux-mediatek@lists.infradead.org>; Mon, 23 Mar 2026 04:08:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oLpTgVGxCw1Fj4mzUbzinm41
	xv8ZtpXmsVNDwDSI2gs=; b=mmp2Iv7U/Lsn8vXrVk4G5/PqevSRVF/GQ2a682mW
	dsh8vBoTGCGHVz0180xz7QZ0lurm+hXLpwOnvgqKISfAeuakv33zx1/3ceqLh1hi
	G99OrHGzLduRuCWT7K6XEKdRpkXIAg50dMueywxC5lWJ6UqU5h+1FiLi1BYOLofB
	S3TPaxrLsqRpdIDXaDKFQwi8kJh7OEv2aG4VBQEypCFf9Zk9KKsEv/CLtbjViA3/
	SnJAZ+Z0rl9geb92WEsYOYVigUb8qA1Tovq3jOt2b8bMS28n7nv6aHKbvR6DxsYD
	FvG1PHdC5ZqJO0Al4684//nTxsN3ojxtYwenxmEFrxcPWw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1mghbh7p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Mon, 23 Mar 2026 04:08:27 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5094ba09affso316674331cf.2
        for <linux-mediatek@lists.infradead.org>; Sun, 22 Mar 2026 21:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774238906; x=1774843706; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oLpTgVGxCw1Fj4mzUbzinm41xv8ZtpXmsVNDwDSI2gs=;
        b=YAjUvM2rrdyKYXtinAWyZpLN1gzwqVCdZCKztH/yn7nkikJE+aI77wmjNc7asjMQwO
         nCLpVGJmCF+ywUzFE87+5uYlwH+9ivHH0mngt2Med6q3F0a156Id6ugd7Xv+T2+oCOia
         oowyYxxgxVM3uC18RxG8hvWTvW8eFyNc0xY6QijRD3pHqXCRA4pPFN8kvNfwz2CLO/xJ
         L5/AB/0RI3ohdw/WkjpazduOAi32JuoQT6D7mAcsNv4gArOAErfxXJFo5t7sXRJk17bE
         /TS3Cb23B+fdBbUvkGoPmwIBk5TUFYnQ+jdgOQszD66ff9Io0HStwLDZ1QaSH/XwrsrW
         iCOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774238906; x=1774843706;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oLpTgVGxCw1Fj4mzUbzinm41xv8ZtpXmsVNDwDSI2gs=;
        b=kKSqNih0D9ff9G5PR7aLYWEHEjU3fKHSPsuodWWJpGvrcr8UkFDSpHG1eDX8LKuHaf
         GtZblar1S9YFaz5xQ5KbF0oy+7H0hGZuM0C2nK3XeRA00FA5vkOQW+cUAqF0Ic2p1//D
         NKOWSyq+zGimXFEGTFVr++uEAeWOnMhFRzLoKv6xpYVmgHeM/XGsQDt4/n+6M2o9qg2v
         ufDeXPZ86NpDKRXxE70nBqO/t7KsCmeATe9Nr1ZSqT1xtSYpbyIk77tILuzK3S/WpfyX
         EVd8cQfjljn2zIJ7QsrbL0ma1bd6FC9q1KXGSuA9HYA8+rFTDBcB4uZQVNA09DHJgfRd
         F1bQ==
X-Forwarded-Encrypted: i=1; AJvYcCWw8hyg+gqVzirxiuKYFG3IEb1+DmUbR74tZkvqCRK72tVkLN4i6VG8wKJgQyqmZbzGA108FcwHffWL8QeIdg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwIi2y6rTFW4mW3gYXHIZzkvq3AERZVDtYLLxjZKBzHYpFO146z
	Nn9XAfyQQKQp3jYW2jxiW+NOr7TVqYX14SZh9xIamkez9yJC6PY4bPpXG9t4f2W1x3jR9e6KrwP
	Pn7kemaUFdstAeawO9qZQFdOr17PhbyoSuKiSLfWmi0scJSSYtxo6widu64xfAryJfDAethcRuE
	o=
X-Gm-Gg: ATEYQzzrc0YvyYXd8/uLY72BeLdPB/l6HxKMg4GXFfLivoo7jzR8BrIedJze2xTRPft
	1HRu95jpLPtOk2xeoli1zm8SOyJLM0YKuirg33k7ZzIBsNlzjmqp4djZBScn/aNyZmgJkX2fuMp
	7Hh+H7+3cHqcVkoASSSvJJewoMNbPImhoKkt5LJup2Ndn94FW843JaCQYGyRoM9PK76GGdFA1Bv
	eZl+n55i1sYx4ohN8lV17xmLawVeQrIpXdDMq8HekpF/YRKfmeUo+2zrjumgU/1n5nxOe+vEmsF
	tHlgPxOAGdOsoEfAj++tPspay52Ue7ahFQoWHHFa07oKy7SDRwqW80YUWUkmx/QJV6Y7dpWSWMa
	Yu+3cIEal42CSMm4+RUuMueGe3NjcuTaz5xgBVo1FYtV6v54dAbV7l02BXUadlJWU100AhTFlNz
	XQMk5/944w1as7K241Qs1orfjakC77f7dpAkE=
X-Received: by 2002:a05:622a:8a:b0:50b:5491:ddd8 with SMTP id d75a77b69052e-50b5491efd2mr63479891cf.58.1774238906033;
        Sun, 22 Mar 2026 21:08:26 -0700 (PDT)
X-Received: by 2002:a05:622a:8a:b0:50b:5491:ddd8 with SMTP id d75a77b69052e-50b5491efd2mr63479501cf.58.1774238905598;
        Sun, 22 Mar 2026 21:08:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285305e07sm2236969e87.66.2026.03.22.21.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 21:08:22 -0700 (PDT)
Date: Mon, 23 Mar 2026 06:08:21 +0200
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
Subject: Re: [PATCH v3 08/14] drm/bridge: synopsys: dw-dp: Convert to
 drm_output_color_format
Message-ID: <a4k7m57gx6gevmip3pkhpoxklzhki2r4ipjwftpiwefmoleomq@2ycnpl55t7ne>
References: <20260305-drm-rework-color-formats-v3-0-f3935f6db579@kernel.org>
 <20260305-drm-rework-color-formats-v3-8-f3935f6db579@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305-drm-rework-color-formats-v3-8-f3935f6db579@kernel.org>
X-Authority-Analysis: v=2.4 cv=HI7O14tv c=1 sm=1 tr=0 ts=69c0bcbb cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=QyXUC8HyAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=CKux1-rmGPvPLlrhUF0A:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: FUSbG-t6hAxkKjh4k12VxUOBJzPWqSrS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDAyOCBTYWx0ZWRfX53PB/5QGcaJJ
 DoeM/koEn9CgCOjsVa4Y/gamMp/XTgL8EwukrgA2M67xk+hkc11sPZpZ7JKD1fFJLGLTWy0dLfK
 RAXM9Wog4qfBl+nbloZ4G3CojgHVnVWwk7NCxbNW+skMYkTG1GgxdS6BBQb2i6JgmJFDfKltG0v
 5YlNrFbePKMDXP3YNIIWgv78q3rLRNaCxA4OAoPky7+6AfdsrKT0HbpdJ6lmu63udp8XYxprHQe
 mZ/O9OyTgfc2DRwyZZL+8rsMuScfHkQ7xv5YmsCP3E5nQtReilu1NPrb4DkFlN0FbhXfx5kW1Bu
 ZHKZfYlWoiaPjRtva9OB7Z/J0UiYKoeKtub0sJjc7+NlsYPNpJXR/me/DF6E63m//GzVMiTBYLr
 KHyCHvcLg3fDQ3NuSx5DU/ChntScg+EyWp41nl/cgFWEwFQHO6hh4bfKYc4637QebSFfUlilPq9
 A6xPM4Y7e/2iN824Sdg==
X-Proofpoint-GUID: FUSbG-t6hAxkKjh4k12VxUOBJzPWqSrS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_01,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230028
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260322_210827_814287_FB0707D5 
X-CRM114-Status: GOOD (  20.27  )
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

On Thu, Mar 05, 2026 at 10:05:00AM +0100, Maxime Ripard wrote:
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
>  drivers/gpu/drm/bridge/synopsys/dw-dp.c | 71 +++++++++++++++++----------------
>  1 file changed, 36 insertions(+), 35 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

