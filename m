Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6305D58CBE
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Mar 2026 04:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5mLU7+MItDUu5Kth0lmGo6bEIH05p2nnnuPD4hW7xVo=; b=Rdbt5S6afZQqq8sFMru0HM/XKi
	JfZMZp2jBW0O+mN9ooEqav8jM+8UGUkRlzpKMQhlmWn9ARJu4DKzyPsk2AUVkHZdnBAvKRh7Ea0LM
	pu5gcFSRLvIcSWZwPZ3fRFfcwbODWM+qIj8ls+QiGC8vUsAyKiW/wTDJvPZ7m6x0/hYXKWdoX/uv8
	iIiOTHhh2TrOLPRgDSGt+eqb7zzZaaMCmcV/UROJbPCmmo33o388eIGPjOoVr1jxY27+UEUiAY6CA
	YeBqlvDMQDX/x4U2YAt3R+Ma4zD8SN3acO6ghcmQqtqe0aYfYernGz1MPRvU/KKC3Sfwhx59EOyGd
	MWOzk7RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4WbG-0000000Fzjs-3yxX;
	Mon, 23 Mar 2026 04:09:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4Wb6-0000000Fzf1-3gaG
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Mar 2026 04:09:10 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62MNKII01175173
	for <linux-mediatek@lists.infradead.org>; Mon, 23 Mar 2026 04:09:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5mLU7+MItDUu5Kth0lmGo6bE
	IH05p2nnnuPD4hW7xVo=; b=PJM5pA+8Rt+CP033st/WkGLskaoVd4kJ2BweO5Sh
	6RXUql+pqIyx8wo7KPHvogwy6ApWsQP1j0BPMjHgC1FBuyJnWnDgW2r2qI7TsUqi
	lqzMi6Ml1Ye0E10VE5n9jF9747H3vVQdENdPz5e1lV/gR0rao9xzqK82jWN3s8zY
	C+68PvP7iz/GbY1epbq9ej2RUlYmh+SJRFqMpVgU56cyWBwYsxkWmqfOrwhwjY3i
	yPCb5/wgJW3JLgpswMvct5EcWgxjtBFZLI9fRkVcdwy034NKz7D/cgD+XC6BYRHz
	bujwB1nCbXbN7gV/TlGRRsS6Fwg4gNHT1Tg+H3k8z7G3yA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1j9rbp7s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Mon, 23 Mar 2026 04:09:00 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b3544bc7bso34274001cf.2
        for <linux-mediatek@lists.infradead.org>; Sun, 22 Mar 2026 21:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774238939; x=1774843739; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5mLU7+MItDUu5Kth0lmGo6bEIH05p2nnnuPD4hW7xVo=;
        b=acfbF4xk4N2ymXOGxHzpM80MC6hexBtGt4UL3ae6LzOUNXNeVNaOr8ZbieHeEAhFpr
         Wij3aCN+B8i3UCUgbYDgab7ZcncLGHPop2qgHdKBgRMy62vXShn1h26SCzUiBRnAQyvl
         d7j/hj4/Otv1NC64oIH6I9MickP5984SOFQrT2ka8vCQKkQsNWRoMaJSbTMn8VImQElA
         pUb9ZBmU9oV4Aq06Xk6FmUGsBOAqC+t0+ZAJchunvnyluUmOWCsdcc68CpaxC4sKDs/k
         aHaKKQCcqLfniy66JIGiDPFJVWGbtoq8vwrQuUYj0IgueR1k5eDIP5IR7Jt9LwIp79MW
         z9uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774238939; x=1774843739;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5mLU7+MItDUu5Kth0lmGo6bEIH05p2nnnuPD4hW7xVo=;
        b=a5LnUBZMUaZrWL+keA1PiDdaqwvKI87k31oS00SPZBO8cZhEFl+6aHwBrTMnGkkf4r
         KanS2A+KJoIENW09kTs0n+YfYaP4tI6SelsT7xn+sGjypXOiNGwseBthopU/K6d7Sgg1
         jbFI3lH3R53XbsHgTbK5gVdDv82PrXm61PhzrYFzbIwxBfbzasUStl0xqlA7tFvs6ozr
         Rh03U4m51gUateyXFpl4DO+iA/Uxq0VXqVLAEe2+++1kfvZFqco6edpcNpE71DxNDzrE
         uLex2sCpxrBXMIpPzulK99j+LBKaUDXVWOrjlCczP/Y/QYDRfZcppBmP1ldDS1mVCNj7
         ZFOw==
X-Forwarded-Encrypted: i=1; AJvYcCW394HNZj+BDeRUonkWPatjW219L+IjuUgZvF87CYusU+s0rwabc/SJzGCc7MO9TQLklnoYhZVzwtjMmF51aA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyfwzAUNMC8NhIk6V3xENEx1/sEDd+TCV++4uyP98TrG3KSKRpr
	mup5kaR/FaNHliNxAA05ySalTqJybrj20JJT+2yprXyRWp/zOv9vI3S1t7lli+Yy+ioY0XQdOwM
	jC/P8gTwh49nlAkaCFMZB992eg7cGT7epoYaPyNQMNbHz/aAhxaV4UP8qrvtnGXtTbODkaUO10r
	I=
X-Gm-Gg: ATEYQzzKHwCJdnkDGZdlIa0AC9P63hFx+xqgRJ/z5nwo+VUXn8mEwGszUOyj0h1Krc/
	7jLIIoyznztr6PL5jCdbzdkovc3LcO/r64zj0IaUCMZId1tBJwSeHnjJuyQ6Hz06QM4uBapbcd/
	v1nboXToXh6u4K9xSno9ZmEoxKCzP6UwhVVI529UmhkDNG8q7wyBXl+DOKGobEvKgIQmIDdWBqY
	ABGEHyyGAfmH4L0l6EwkMlkL3LZ3aeQYdnlnyG4VJjKsVCCVeYLClqt0lQfHOXEEwJlf4GSKhDu
	7fHTmfdwury1ie26cbikOFmpkQr8TzmaCKVD59NxaDOTej2BAtq+ABfCppMgAXx27PHJMuMoLBF
	hlS6CCGOa9Pw23EG8/Z7vAd+FONI4yxAdbd6rw0jqpimc2Sw2osSSh9qnmenk4w38g3qKB+r+yC
	S2lYah1DEKR/W2rKWLSkL4gf9H/xx7wewyk1w=
X-Received: by 2002:a05:622a:2288:b0:50b:55fb:1c87 with SMTP id d75a77b69052e-50b55fb20admr59358831cf.5.1774238939265;
        Sun, 22 Mar 2026 21:08:59 -0700 (PDT)
X-Received: by 2002:a05:622a:2288:b0:50b:55fb:1c87 with SMTP id d75a77b69052e-50b55fb20admr59358441cf.5.1774238938791;
        Sun, 22 Mar 2026 21:08:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a288268a0bsm1994449e87.14.2026.03.22.21.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 21:08:57 -0700 (PDT)
Date: Mon, 23 Mar 2026 06:08:55 +0200
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
Subject: Re: [PATCH v3 13/14] drm/connector: Remove DRM_COLOR_FORMAT defines
Message-ID: <lfq2myl6gnzog33md2madm3qky2x4sasbrqkthhvdvgtfigrjf@dc5ccj7iq444>
References: <20260305-drm-rework-color-formats-v3-0-f3935f6db579@kernel.org>
 <20260305-drm-rework-color-formats-v3-13-f3935f6db579@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305-drm-rework-color-formats-v3-13-f3935f6db579@kernel.org>
X-Proofpoint-ORIG-GUID: 4G-Hd96QUfQPY9aGtrgVPhhjQDjP7yNm
X-Authority-Analysis: v=2.4 cv=ZPDaWH7b c=1 sm=1 tr=0 ts=69c0bcdc cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=QyXUC8HyAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=z8SGupnk27XsGNPOeu8A:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDAyOCBTYWx0ZWRfXwsimedECkMGN
 XgcQuP35cAC39GK2gdUgD+axQ0Z+XcF5Gt06BfxJfCyX4h6PN9cJQM9MIlkGBWLmPTYamU1LwFy
 uqNSwHMxR6QC0NURtz6rQTOM4jRgn9JHswfZy2gL24xo+qkD9D58hiI4PELsWKfVHp7Qlww6ssf
 eRkIqmMbq6FfuXFA8JxO4EiQ8urZ9XlpMyl4JkVtX9F2IwQu/we1gFub+iTVDR+aH6QjkuxkA7s
 8Py1E8xN3pNiKKeFA9qZjqsFT6V1GhQPm6ChabPTzc6uieMAGWHRGT5IB0SUdL9yrCCntf9HLoh
 1sx8VBsLf7n7vOmAM/HHDIyh/GP3cMErnvAYK0J4xodCvwxDmYkTHqsQIpJk0CGU/MH3T5dg9US
 qBKNJL2bK4KGBojBCBkAvNbHyIx6Dp0Ot1N2na0Jf+rOeaXOtUXu0OxdMri9c+gij5oIjtGAu99
 +SxjidXEtlZsQh4hL5g==
X-Proofpoint-GUID: 4G-Hd96QUfQPY9aGtrgVPhhjQDjP7yNm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_01,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230028
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260322_210908_029556_21CE2BF9 
X-CRM114-Status: GOOD (  14.13  )
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

On Thu, Mar 05, 2026 at 10:05:05AM +0100, Maxime Ripard wrote:
> Now that all users of DRM_COLOR_FORMAT_* defines have been converted to
> the new enum, we can get rid of those defines.
> 
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  include/drm/drm_connector.h | 5 -----
>  1 file changed, 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

