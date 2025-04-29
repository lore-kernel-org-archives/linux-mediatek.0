Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5C23C3ABB0
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Apr 2025 14:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yAp0LdgXVQkJihbVytViUFNyVYiIbcoCGNDRQ8jMoF4=; b=JuqLN9slH9a2tWbeZbu0CVq45L
	/xQOALJuONiHAMbkYmxEUneuZRvmz480n8sKfNqI+1fTnPujuhShGLNSe9OIhP116HqJStTJEKxA8
	AcciU35tI2zmEvn9vBGqJNwhNtasa5q6QPoPoN/DmVxenpELDENiPgPssIMcFcQwYVnzyr9oYqBe6
	gudoAcBhu5yea31ycWyIz5F5pJTNQBN26juUrtjfOg1vLDTooZTXV72088puEIZWVJmly8sQtN6ZE
	qR4lSYUAbwDr+cARyOLk8fsCYqUgZ6ArcwTvWIYZ1qdxd3dOhbST/Qg0Q8QyXEBlak+btBA6SHaZP
	9cHx8EKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9lhr-00000009rxT-0BVN;
	Tue, 29 Apr 2025 14:13:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9jmU-00000009cCA-08jh
	for linux-mediatek@bombadil.infradead.org;
	Tue, 29 Apr 2025 12:09:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=yAp0LdgXVQkJihbVytViUFNyVYiIbcoCGNDRQ8jMoF4=; b=qs2zS1YOosXsExvOOmS378/Ded
	13vlj348iOrfp1SaA5Cl9rt0tNukCMXEH+ZwRPbWDjMM+KUZHUVTe5mk8qbKg6gpUL5AWDhbIph3o
	FjpDcgQ7tp3ejcmZ1t08x3ba5TglVQD2L0nau7GAn+78v/tNPQ1jy3Ti1z5eO4euPs2wha/wdduo9
	AmeELZKpf+f9ABF1jxHT1rjIQdHr23nT/goe26RQkQThkkBzfVkI/LdqdcQSOyxozz8Y0u66rqRmL
	Zr1yDCukucUe7dPRNZyQLGOJ01ePjfg3o/ZgY/K5n4JEMqTp8kbA+OgD21Yz9maBlZ894atOGpOBX
	U45E0RVg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9jmQ-0000000DJeV-3MJr
	for linux-mediatek@lists.infradead.org;
	Tue, 29 Apr 2025 12:09:44 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53T9sAgK000768
	for <linux-mediatek@lists.infradead.org>; Tue, 29 Apr 2025 12:09:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yAp0LdgXVQkJihbVytViUFNy
	VYiIbcoCGNDRQ8jMoF4=; b=KkGLmgB1DUQVYWqXwzauECf/oT8pq4VmjVHlEunk
	60PS2gs7/H0DESvhb9ZkWdajJVWYBc8XZJ6+r3VBlX/PrWCpiVFsMOKOjWwsLZ4t
	sXQTvabHEZhXvFjTVeV6ojv0tXyQyMf+4VwIdfW/+cvhKbD2+Cptb0qLFNbYBKOV
	kCgjxc0jZnxjzNKDyp8jynZy9R89u8Wrt01rbIVpNTIlJHDyWm9hQWyDs49ffJbI
	SEEtVDUFdikzuWOxvPwun+mTwUweeuxz304qGFE9FgTXReqbnwaHZSozHf/PX2XC
	DS17DjEVCDPYU9BhBSG7uHOMyzzuv/3KfNKxuKl89G/dGA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468qv9mf7e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Tue, 29 Apr 2025 12:09:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5c82c6d72so962324685a.2
        for <linux-mediatek@lists.infradead.org>; Tue, 29 Apr 2025 05:09:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745928577; x=1746533377;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yAp0LdgXVQkJihbVytViUFNyVYiIbcoCGNDRQ8jMoF4=;
        b=LMQdjNY9wy6XWE7+6p98Dktv6/4BEUrPutszWzp6TSwHR0bmjU+4i0iqRp30hGYb+8
         X4nCwe5pTf7ZgfMCCh3LSvjURMu12nKRSM5UOEoeFtfdCxbcZOzgT6z7bNzZJIQg930B
         rAiSjaTHkQxIYglW5aN6xSxtrwcOxGbBdxeS4JjNaADevCG4CPn07TE10VkXBsGyJPG8
         OAfb0ehE7YOCHZ4swRPO/2QQCEpTc7eC5mhhdcbHCPaq6fv9qiOfTi5b6BgLkX6E1WtA
         5Pb3eZaT0kGhG2XXcJAWoLoUCKhFLtqTWkHcHT5INGCNam94nMjrz9tosb/6onPUY2LX
         RvqA==
X-Forwarded-Encrypted: i=1; AJvYcCVOH3qDpiU0Nk87zHBwFJKqyScMpOVkJoEtMo9l+s7gWg5VmM/1kh66J0/upUYjwxd+GvgrCIQNrt4mdPbqXw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxm5mB3AurAGUlVUJF7oeIixW7jVp8Mt8X0OZFIb7U2fTmvJRto
	IRroe3k6SNIEUkIo2HUYSgcNR7RbeVGweMgV2XXvaO44GrlRp90uAe7Lw9l1FdSp9PzuPf+lzRJ
	gn+4t3tRsPwlgYZX3PM9FCE3+tYlXgy5SuT/iW1zMpl76YT2CTirVVuiJqMw8tudTXa3caDI=
X-Gm-Gg: ASbGnctK5rxAx5xJaj+0dSToLbtrv5j/S+SDAtonwVhZci7LfXwzPXQsultoOnoPmYS
	a87zhGA96KyqANdGmLNKEQRX5mVWEkQnp6tEMKtqKYiXjxCAWju6i14ZOdNef/PhSJSqDlUfJmr
	YTif1deA3kfmx1zWPrEU6eyJv1mMPcLvjVtdcDG9FoO4Y2mur2dmTKLNqYDcg+eMDip+Zem64wm
	/G2w+Ak5QHlrPengSLUw+htNp4Kj5eszjxx5HfvdNdwgNvL1sfzz9hsz1NcjVklBcPIUVpZ2NFl
	PlnVRuZ+pFv8LD6G6GkJ2FWgsY4Z9ZALcbumwsi1D1yMCHwHisUWiI+GNUsIcuukI0/ydD1W9oo
	=
X-Received: by 2002:a05:620a:8802:b0:7c7:93c7:83b8 with SMTP id af79cd13be357-7cabdd8fac8mr556721185a.31.1745928576988;
        Tue, 29 Apr 2025 05:09:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+WiBW2dMdMKjL5rCtckyag5tI3q0y87zTTMxYAoMUgZTNEX197tRyQ4loVEQ9A423pNGqNQ==
X-Received: by 2002:a05:620a:8802:b0:7c7:93c7:83b8 with SMTP id af79cd13be357-7cabdd8fac8mr556713685a.31.1745928576612;
        Tue, 29 Apr 2025 05:09:36 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d16a85ecsm24278761fa.72.2025.04.29.05.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 05:09:35 -0700 (PDT)
Date: Tue, 29 Apr 2025 15:09:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Douglas Anderson <dianders@chromium.org>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Anusha Srivatsa <asrivats@redhat.com>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Dmitry Baryshkov <lumag@kernel.org>, Hui Pu <Hui.Pu@gehealthcare.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
        linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 07/34] drm/bridge: lt9611uxc: convert to
 devm_drm_bridge_alloc() API
Message-ID: <lg5hhtncppqy2vreut2z7h36mmnuzn2xhw7asrjmftqg7koaqh@as6jetr3pw3b>
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <20250424-drm-bridge-convert-to-alloc-api-v2-7-8f91a404d86b@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424-drm-bridge-convert-to-alloc-api-v2-7-8f91a404d86b@bootlin.com>
X-Authority-Analysis: v=2.4 cv=AO34vM+d c=1 sm=1 tr=0 ts=6810c181 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=P-IC7800AAAA:8 a=iF-wyJFYdUVxq7VKmwgA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: tJ49j7SK7r0Iu5wnL_263wYnKD2Ra2JV
X-Proofpoint-ORIG-GUID: tJ49j7SK7r0Iu5wnL_263wYnKD2Ra2JV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA5MCBTYWx0ZWRfX1GbTJoRon5jQ l7+3/6uNQD1aDYj9OQFGHY+aSKOuz6anvShXT2LjBmf++IUaNyWpXOWOAD/Za6dgoxxY3953Bhv FhOosyMMElDwfG7tWFWKg+TlOSN4KKOLXqsofNLrhxxwrMqRSMyyR0dNvIQyzeTWIOcXQgOTHIP
 tDreazUUkIz/q0SMa/qM6DtpwTPNfPsyYzOSYGR6MRo1fT8OwYmLtJrbixiBF1zEqV6gG2JtJBk ak5pxPy+41SRyoyGKQsbWGDK0lj/8Z6oYvF9r/d98RNNtsgLUVcHC7xo5lur65dzrxb/vQ9bP99 CLVz2fRH1d0hsSqvi9Bfr6qEqTIDKMhpdHvnb/IznsqZr2nKJBibo04sLAMJVf4eUCLT3UL3uEu
 YFONAal7PXox+vA4mPWR3YgX7yeLXSCygDYvvZpSTkdPuDCAoqRCj9u5YHac9qaK2AyiIkmu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 mlxlogscore=868 mlxscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_130943_190179_8A2471E0 
X-CRM114-Status: GOOD (  14.44  )
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

On Thu, Apr 24, 2025 at 08:59:14PM +0200, Luca Ceresoli wrote:
> This is the new API for allocating DRM bridges.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

