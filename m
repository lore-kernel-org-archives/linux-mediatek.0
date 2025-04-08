Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E108DC369A8
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Apr 2025 13:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J5UKc7ae/UXmKHiunvfff8Ovkaw6Ua5MEgH+S/e5ZyQ=; b=X5jSvjqFvY+ATM7bpfF3NxkeXA
	prkzhxZjBd1RYq+58azh6KYjHmwIAAKo7yP54q8SGR6cWdX6N4QzWa5Ngc6DGeY7YOlHOmr/yvCpE
	vrCwJcK5tT8gqmO1QGlJ2fTPffhSGgHvIwHAAML/GuOiqA2GwKDCkpcLg3pFgvgB36fg2AcXl28Gf
	/kAvsGOCwPJOj0uUFZ433CCKiL0tm88RDmAVXKPjHhPsuWmoGMSQZzj0xaBMk4EprmCpr10NLufPL
	K+JYQIMsGp96b+E1LSzUVIA7AUMKqRQSEj7t51gWTiu+X2GHR8mBJaKeMd9mL8ek+X0gZStcKr3Jd
	e/76mIlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u28mh-000000047gP-2rLK;
	Tue, 08 Apr 2025 13:14:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u27cV-00000003vi1-2GKu
	for linux-mediatek@bombadil.infradead.org;
	Tue, 08 Apr 2025 11:59:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=J5UKc7ae/UXmKHiunvfff8Ovkaw6Ua5MEgH+S/e5ZyQ=; b=clelddlGe8KZiL01j70+Z7pbWn
	+AZn9YD8WBnNTAGIRdRzqDsw/SQTxRcs32IscBsOajJKA+DUVy1ZZ/K9Lj+5VZCdI0Xoj0u2Mmd4F
	iG/Fh4U/luuRB7LpnWf8hw/ViRdIYX028Pp2OZTYzdWH+Trfhl02D5uoJeUfOd+sSt0pfOEd9vYxA
	Zv9RS2ibSCMEVPBoMVqWl9rzfkB17/0psb1WH5x3bR0h5tt22CorhzlrkrdnAaw1LoUhy5O0/zvvX
	c1OXyTVQ5fCqT/ju/6bNG5KtRAJ08SPnF3klgI6DU8Z9TwopG6xoaxK4eHimfSAysL/98H9sq4uH3
	ioeIM25w==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u27cS-00000008HVl-0ToI
	for linux-mediatek@lists.infradead.org;
	Tue, 08 Apr 2025 11:59:58 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538BZfp0020154
	for <linux-mediatek@lists.infradead.org>; Tue, 8 Apr 2025 11:59:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=J5UKc7ae/UXmKHiunvfff8Ov
	kaw6Ua5MEgH+S/e5ZyQ=; b=kAsOPgkPIbWTYpxxLnV2o/tiI/3bdehvaBEoCyZ0
	dKGf+6HEMV+mOXtQg3TKew5ae8DTSn+qdcXvJtxK8ge+EnSr0tx+sCis1veuSQzg
	3edDDEClKZRUG3Frlttq3EXW9eGg6Cq4X/qOzYcAUEzeYFIgmgXGz/jg2tCX0Qeh
	VWNmF31+A/CHv5/qZ4QGp8dwZPB7U8WGPeLlfGkV1qCdeh+Pr9a3vvCkTGjqRHjf
	xF2zmMvSqSQDEiIKdecpulOEdxi8iAwxtfFzVa7K2HvKyiTWyAFBTNH+DWP29d2W
	vg8Y4qTFoI8b2c5ttNqjBRTpAkdNMdU6PF+BTUhr0+c3xA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twd2qn4u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Tue, 08 Apr 2025 11:59:50 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5f3b8b1a1so863100185a.3
        for <linux-mediatek@lists.infradead.org>; Tue, 08 Apr 2025 04:59:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744113589; x=1744718389;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J5UKc7ae/UXmKHiunvfff8Ovkaw6Ua5MEgH+S/e5ZyQ=;
        b=Rnr1wODV6zMMwEmBsHVjuw4AXg6Rg8tw4MPa+acsGrU+g9ZDv8m30rCq+hfciefNI7
         QvLl+2GAFtTtAJlXK0QazU3PJqgwjkOj8Mjj0RtwT6HPpBpSLtQ+mZpnG567+SXeUcnR
         1suDSD+hoEfTnhnn0AL3wsWdrmyUl0ih0IG95J4TYf3u0ZlGiMkpiF8kTRbA0pDX9V5d
         wX36T/Hw/SEOwAkL4RT06xfrQdpK5mt8xl6pRKz+bE4celsYKWTzjTFL9gUvYjzEPy9s
         IhFBp5tGKiMN3KP/g1fnu/qNj4C8iFGZ3A6SMBDd/kkWBFfgv8ZeGhhEjUuQ40XiWq1l
         bINg==
X-Forwarded-Encrypted: i=1; AJvYcCWOXObujIGlQglNGE3hXR4wMRN9K/qBGp898Jl8LPAcu5o6T1s2Tx3cQzLguDuol4bkK78NyIP32ScHu9R88w==@lists.infradead.org
X-Gm-Message-State: AOJu0YyxxOIgmI3SWnZqeD3w1nOCWmLvLd6M9fvtrX+2ybC2y6vxX4t1
	q6nIp7fEGO9+TuRIeVsrsnrxC277RK7Wb7Y7rIaGnBjDGkwkS1Ck3mpwCdiJbXzEp0j3bZRiOGu
	Jn68AaKRDCId2+ck4LBJNCE7jUCwIVuqK/oOteImaETgkUxhQ77n0WUmf2sevZz7lmps/t+U=
X-Gm-Gg: ASbGncsNLxMQqvk0R4ldB77sSxw3YibhMdp1Eg3UK1emZDQNtNP62/RU/cCAR67+iWN
	i6HVNg5qlRvwnQqoFLdSDlNp2y9uPztuN0ceSdnd6zCy8EvoZCjFt9nFA4Z0p2G/NGDkcOHCLpR
	d0VX3HqECC0aKQwn7TbmjwBnDjkgax8jgnSdGMkExhyX+8HGbDotPWrZuFlvFqV1M2VYyckN7ir
	tscXM/LZC6LGc6jAVT4DwgKmmPMCuokDAuecG+9ecmTKSyuw1qKKJRwEOAlF6LeAgaFtfQrxcPw
	o7tAebVHL7ukdRoCp4n32ojOb6/NKYs52BNCRqq1A2lyp0wvhERMlF/PRV1ZJeym/6l0ZXWLcTa
	6j7Y=
X-Received: by 2002:a05:620a:3189:b0:7c5:a513:1fd2 with SMTP id af79cd13be357-7c7759e8788mr2682365685a.6.1744113589029;
        Tue, 08 Apr 2025 04:59:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHLjG0AgWeS1WAQhJR3SCJI5Qh4YJ14xwCKURGmhWqtrP5XHH87RDOupWg+DezPfWGcaUO7og==
X-Received: by 2002:a05:620a:3189:b0:7c5:a513:1fd2 with SMTP id af79cd13be357-7c7759e8788mr2682358785a.6.1744113588696;
        Tue, 08 Apr 2025 04:59:48 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e6370ebsm1479003e87.130.2025.04.08.04.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 04:59:47 -0700 (PDT)
Date: Tue, 8 Apr 2025 14:59:46 +0300
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
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Anusha Srivatsa <asrivats@redhat.com>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Dmitry Baryshkov <lumag@kernel.org>,
        =?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>,
        Hui Pu <Hui.Pu@gehealthcare.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
        linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Subject: Re: [PATCH 16/34] drm/msm/dp: convert to devm_drm_bridge_alloc() API
Message-ID: <s5uvbdcv7pqogwg7gyy42vfxv3ubffj4ww7nili6sd3y67kdf5@byctauuurvwe>
References: <20250407-drm-bridge-convert-to-alloc-api-v1-0-42113ff8d9c0@bootlin.com>
 <20250407-drm-bridge-convert-to-alloc-api-v1-16-42113ff8d9c0@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407-drm-bridge-convert-to-alloc-api-v1-16-42113ff8d9c0@bootlin.com>
X-Proofpoint-ORIG-GUID: 9vmXupT-Os1W8dfEVsl-3Vu1_UqjXysQ
X-Proofpoint-GUID: 9vmXupT-Os1W8dfEVsl-3Vu1_UqjXysQ
X-Authority-Analysis: v=2.4 cv=NaLm13D4 c=1 sm=1 tr=0 ts=67f50fb6 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=P-IC7800AAAA:8 a=COk6AnOGAAAA:8 a=tVI0ZWmoAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=Yq7wtpIrRiHUN6cIw-cA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=d3PnA9EDa4IxuAV0gXij:22 a=TjNXssC_j7lpFel5tvFf:22 a=-BPWgnxRz2uhmvdm1NTO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_04,2025-04-08_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 clxscore=1015 phishscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_125956_608073_B5401A98 
X-CRM114-Status: GOOD (  13.68  )
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

On Mon, Apr 07, 2025 at 04:23:31PM +0200, Luca Ceresoli wrote:
> This is the new API for allocating DRM bridges.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Bjorn Andersson <quic_bjorande@quicinc.com>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> ---
>  drivers/gpu/drm/msm/dp/dp_drm.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

