Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EC11CFD62B
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jan 2026 13:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=js9vOdGwDOtrz/HNGFuhKMtQ9O5QjU14j2FRmChcdtk=; b=4pm343lwMk5HoYpA40PfPcopYb
	6wEnW9FKPA866WYYKzYa6PlEddWaArwPGkXhYbHy9zxxhFinvCZiS7agPf+bZoXHkjtFwhAmxxiEy
	ueVRalQUZQb+AEzO5/k+fJgAPT5BkScWrTmrw8/2Z87jnv8GNUJ50aQswoO5eww5DgnkGfKnAY1eW
	7mY8vtPiU7cgIBrpDWYBEigf4/Q4+mKAxByZWr5SYXCzJtajNrc7ltV2XPWSS0YbHg+zyrOODBDoY
	Pq5xvhIIu555yRabwGdXlEjRJTF8Wapyaipjo07JsjAzwq3bCF/QYoG3kvlvYV6x2L2N+hLsWdVwF
	0zopqaxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdTTx-0000000Ezs4-2Ulf;
	Wed, 07 Jan 2026 13:21:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdTTu-0000000Ezqy-1zNR
	for linux-mediatek@lists.infradead.org;
	Wed, 07 Jan 2026 13:21:47 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6076tIis2378933
	for <linux-mediatek@lists.infradead.org>; Wed, 7 Jan 2026 13:21:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=js9vOdGwDOtrz/HNGFuhKMtQ
	9O5QjU14j2FRmChcdtk=; b=kG3/1cJ1P7ELpcYi4U9ELqLxZVjt72LrO+o8b368
	fi93VpPDiEfi+45Q2CtKwzWuPFKqWY+Mh2EiPw5vd8Vpm2XRAuWkxK31fv+YNbrk
	OSJ4rpTVpu9hHJ7SkXwiYFRpfkTeY9luQTuQ2KYP2RGa+UHizmcikgcC/Zs/WuwF
	kfShAdfmGYD4ImRzKeBScibWpKKQLsGDz07GG52n2IAAbm5UrKb3Ois9v/A5PYBF
	mcHPsICzCwQTnNNr+3AxzepT3h5cb29NlRt3Z5jjNDBDNULEmobYyiKrsOtWKWt+
	IOpcqT84fcn771H2LtNgspTmUV0Pw4g90RXS66kMNU24Dg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhjn4s5kw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 07 Jan 2026 13:21:46 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-93f648b3f60so2767128241.0
        for <linux-mediatek@lists.infradead.org>; Wed, 07 Jan 2026 05:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767792105; x=1768396905; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=js9vOdGwDOtrz/HNGFuhKMtQ9O5QjU14j2FRmChcdtk=;
        b=XgXTWMq2lk3i8uaLqWDdhprRuFqJoPX8Py8ZNqSY3jPJTtfNEI4X7M8eky62T428oZ
         EDV9MEbxQxLLdR4Eu94rhh3MQfXdzTnXosfKvVZOw1OxhWeSiypYwXxu9s3wRz88z3Dm
         gl2/X74psF53ZoUi/5Y7KGxmvtbSKs2cx1lAixODj0HbHPdiqjOfVDKkimkuqtstIvpM
         Um7LWQoD8s7ro0sXfWUox+r7jgfi1F0oAhUWhULko74JanmWBd8YzKFNBlPW6vw2LWDs
         XNJocFcW27XnT654R598Gai5AgNYb9XWQ3mwbAdC+7Qy2nPB9P2JgBf26ITAAjhXVYk4
         gLjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767792105; x=1768396905;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=js9vOdGwDOtrz/HNGFuhKMtQ9O5QjU14j2FRmChcdtk=;
        b=l2k4CK9cIA4mYCXKyXoFC4obXyKtKGYu9zjbA2mGiY02NuGHd+Z/ks5f62/v190iOV
         fea08xX6sfNgF4mqmqswSRrIExLB+G8aFvjla2oegC9GHu4Bm5eJqMgyd/ur1SzlA9DQ
         y1Ce/x0rsrELAeHhSujheyKEEzZan6Chb6uj6oLu0YW8tfh50jqS3vV25Iqq+I40k3p8
         eiRciCmqWfWc0ZHPFBF4+EQKjDwxMABAD9PeNjgw5gPo2gXTRN7fTvWJ0zGZEx6RGmoS
         XTqdebXvTgTlZcoeOFOVaaJRH65/El0iHS0owml4ogj1NzxJGcF2KkWLed2xMjI5LTS2
         ZCmw==
X-Forwarded-Encrypted: i=1; AJvYcCWP9oIogaUxpV8UELn4d30Kg9328/A9mGgN3KcekuA6Z8KHKw8AG4pn0pBngoXve38yjmiWWiaU2xkQ7owH/g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzwswJEhByz7j05BuI4mvgemswinV4QQogZ3PjB04/1HQWn4Q98
	59Zjgws0HJL/GSfq20Tej7NO3L/ozGPRRPZXd1jhnVkKNXcZ7t6Zx3tEUL14pWHjBzNxUhXlcSN
	5rE7eJ1iUKNUFle6a/Cb5dib+uh/rleVpVq49fCD3arkn0umWRX3IuTH4/uF1OO2UmXIJcblnQ/
	A=
X-Gm-Gg: AY/fxX66e7lUsz/u+MMIei5hraIu97wJW/FJ7gC75UIXaZSRsS0k8RiIE+JIDatLN9K
	J0swlYieqyuASvS0Kq1Trja/0B7GXZ3+PfJDLEkJvMRYa1/i9dRYg6zzJp9U2kSkGU6xi8seFhC
	P07ylSeb7qTwbnLDzauD1hxIMRud75uImEoSpUKq8vGrCynWVadyuInShPnFvnzT6qJTGCEN7Gn
	4heiR6ZIZWwoqA4EaIL/9z4rYgI8lUv9Cx3SyV3kAuF58mvixBn6h4dZkOD10TXOFexDzh7CyMx
	5zNC8XdgMcxm6szOsCVb2LU5lJOQZPSohpOEkaBPbBJvET8frYGB+wmWq4DPph8wKOwvplherml
	zXMA/rT2tcvZ2wPNcwXMY2GvQgGDguEUxmp4f2ldtx5fICxkPtjR1+PT/TZRmy5hyakc4FfZXGG
	TW8R6gBZi43wVazQJulqteYCQ=
X-Received: by 2002:a05:6102:32d3:b0:5de:a2d2:8076 with SMTP id ada2fe7eead31-5ec752dbfd5mr2097431137.0.1767792104899;
        Wed, 07 Jan 2026 05:21:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF2NXBDg7wVXP/zTsrowEn5NsyiVqeMK7cDHudpgAqGMWRN5e4UR1GPSBvYkE7wBgLCTq0Y4g==
X-Received: by 2002:a05:6102:32d3:b0:5de:a2d2:8076 with SMTP id ada2fe7eead31-5ec752dbfd5mr2097376137.0.1767792102812;
        Wed, 07 Jan 2026 05:21:42 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382eb8dadd1sm10295211fa.34.2026.01.07.05.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 05:21:40 -0800 (PST)
Date: Wed, 7 Jan 2026 15:21:38 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>, Liu Ying <victor.liu@nxp.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sandy Huang <hjc@rock-chips.com>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-mediatek@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3 07/10] drm/display: hdmi_state_helper: reject Audio IF
 updates if it's not supported
Message-ID: <mccxwmemwxp4fcyjiu3zofuydk5ahmhnluqucwau5a6aiw67xr@52gynmrblml3>
References: <20251224-limit-infoframes-2-v3-0-7fd3cacfefed@oss.qualcomm.com>
 <20251224-limit-infoframes-2-v3-7-7fd3cacfefed@oss.qualcomm.com>
 <20260107-fascinating-boa-of-fertility-1886a0@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107-fascinating-boa-of-fertility-1886a0@houat>
X-Authority-Analysis: v=2.4 cv=LJhrgZW9 c=1 sm=1 tr=0 ts=695e5dea cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=3wq6KaL0rsEoTcXXugkA:9 a=CjuIK1q_8ugA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDEwMiBTYWx0ZWRfXy7mV/7KoQMzY
 a9jFVdp3uN6/MFTTqhzLEwlP/nx/5TwhGke/L0rfblCSFcHu0clRCfXuVCLhQxeWkRBtCwzSSmu
 KPzG+2l/0EMaTwLVG8f+D5WzFq1oyk8+rKjFU3Oc9cOKrcafkCT9VLC3nvDm6UYGNG4sdMfTIf1
 C6TUHKf+8pQ8lwUaGWyZvPXsdXz0YqQ9LCfB5gb7yT3Kc4D3PfX6n4od6fTbg/fTDj/e4lJOQWD
 GBdwoFXHfK0D0lwWDEHoVskUzxj+QnZnnE5gSdSu83ZuURkFfR9K3LX3YjPAjJZbnDTP8ANBU4H
 496N6aDLX88eIj9HE1YaarZfc+oBQIUCunZbZuc+39NiQB6BDTKKjXm4PSS8njbyhDLapQIpi2s
 Wc7HIKqRSMeOs6eIywGlhFN31a52pfrRXzEM1e5cwXPXcy6UqUEshUciCbH4BNC0X5TqhBFR+A8
 +nYcNtkaxdaQjOclpMg==
X-Proofpoint-GUID: PtqSa9_6Z0MbX84y1IPmiW7DHXqid5Za
X-Proofpoint-ORIG-GUID: PtqSa9_6Z0MbX84y1IPmiW7DHXqid5Za
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070102
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_052146_522361_BA5EBB35 
X-CRM114-Status: GOOD (  19.21  )
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

On Wed, Jan 07, 2026 at 01:50:51PM +0100, Maxime Ripard wrote:
> Hi,
> 
> On Wed, Dec 24, 2025 at 03:02:56AM +0200, Dmitry Baryshkov wrote:
> > Updating the InfoFrame if it can not be sent over the wire makes no
> > sense. Change drm_atomic_helper_connector_hdmi_update_audio_infoframe()
> > and drm_atomic_helper_connector_hdmi_clear_audio_infoframe() to return
> > an error if Audio InfoFrame callbacks are not implemented.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> IIRC, audio infoframes are mandatory if you send audio over the cable,
> so maybe we should do like you did for drmm_connector_hdmi_init and
> error in drm_connector_hdmi_audio_init if we don't have the proper
> write_infoframe hook set?

HDMI hosts can be sending Audio InfoFrames in some other way (think
about LT9611UXC, which manages infoframes on its own).

-- 
With best wishes
Dmitry

