Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 126EEC3600C
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Apr 2025 13:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SfYGShmqcwDU8m6aPQIeDmLfR7GexvsEqe4YAvcqLMU=; b=g0chYEDVqbZIoVd09WI/+aXzve
	/h/AEsjTsIkwArLCACicRhazu+0aK5XYHlKi/tjz8zz1QihWPVj/y9XUZ1ehkiIcE4XuqR1k3xsax
	GKrGZyfYjcPfOx/3QhiJmFWrx6H3YExaN0maZAE9ajyNJkR6m/TBIBnU/Tbnu9n5Z3AeSzeF2FDEI
	I6hQFk33fCPLd6mxY59cxNMYz+gENlPKsRUIFr+nyRkfPK00TLZCpeCr/IxZ8bJBgbMAuZ+Bi/t+W
	xm92682R/5hD89xOQW4TAZelSpjzoEZCCw4ULJP0MffKOIM6IPTzMRbqOXaKjq61uGafAuPR0Mvk7
	8txKdWew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u28mc-000000047Wp-3yc7;
	Tue, 08 Apr 2025 13:14:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u27bt-00000003vWc-17jI
	for linux-mediatek@lists.infradead.org;
	Tue, 08 Apr 2025 11:59:27 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538BUqnn020354
	for <linux-mediatek@lists.infradead.org>; Tue, 8 Apr 2025 11:59:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SfYGShmqcwDU8m6aPQIeDmLf
	R7GexvsEqe4YAvcqLMU=; b=Qq0eafblor3qJaHW7n07AL9wxfveW1I8JCHLiC+H
	V9piv80KGismzTB5g0giCp2vGl5NiuE7MPsCrHob7HF3WBxcbnvH4rsyfI7Yblve
	d4oodt5CF5fF6IXEi0rv6AqzVcmFMl7ZC1dboI/ZcG+wydrdymBzznPgskQc4DA9
	ljYD+HmmufXng68S2WBHECRg873kfgxI9H9JUsg+hUbihvlrKD0WuyVt6Hhc6Ri7
	1wYLucM3v118dxFdb/2QCDt2lAEYCyF/CfSofY0qFHsugaZE7mRqZyjO8xHL1Adt
	QF3D+iZw6JMSAiSbMUhcFQk3AO/1eQvB+vYKhBfJfKx4Ew==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twd2qn3g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Tue, 08 Apr 2025 11:59:19 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e8fae3e448so118638466d6.2
        for <linux-mediatek@lists.infradead.org>; Tue, 08 Apr 2025 04:59:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744113558; x=1744718358;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SfYGShmqcwDU8m6aPQIeDmLfR7GexvsEqe4YAvcqLMU=;
        b=A6bDScMhfFEQVxVneU1HwJ3ovZbI4D1Keoy7oSGjH5iNefT/500df1jGMlKUNBdY5z
         W2TWkbSNoi/MBruJTegJtuo/ID/dJ3FMfUALJRFXgK8JaFmCm9Z7FyCKY3hvPRvU5LC3
         H+Ea0MYwNfDhmkIhZ2nu0/NAaqYDc9k+/oGdmLH5sTcoJRBoA/Flty3jf83vmxnSv24s
         qMkkyzF8xkem5VqV+Rnvhsm9NSWHJTll1NwgoOFM51GMkaiW4GcdVpvcfYCgApLmkPfE
         uWOj5D46Gv3q8d07kM4d/ZLKdcn99cWotTtzuZkJTcpG7PEd4okJLYTeg/4DhwRJ9WCQ
         UH7w==
X-Forwarded-Encrypted: i=1; AJvYcCV9ZtA0FbKLz9Z6zexbBLfhf6+14pk3AFzLi+ptAuIfeXWKKLMNUX04fj/iNhq3PYGXuVX0MUKJ9tl82gRyyg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/i8Ig3dkKcUz9EHG4RijpJVeyzYMdaA/Qcf44irRm7+WmM4Fs
	OvXu48CR9Tbr6P6/Zf4Tur7DLL7OIPZF3UFhHGvWaqa+mk1K1ezmeUDXMr+dNskJuDLZiNCMEeQ
	kDBGZ5vDfnBjN8AImO4P9HlFZ0ZxgJmqYEeVcLz++HSGh78CAXQj2adK+lQzMEeV8Io6M6Sw=
X-Gm-Gg: ASbGncscRpMICGT2T4ZYwYB7ONHfUumBJFHom/M8RSUKAuejuFkZyhxQLwOsdDXLMy3
	ZvqOoqSy2OHN2c00CR42M4DwgM3+cRJy/QvpZ5C6kmr+oE7pOKEgXZSv8aTBGteiHWQwp1xmoRe
	kSuvSmu0u6UF6QPQf0nJ4J8jG7bzYtRU/fbdWRxCPAzc7QMN5mt0PuzRrxF0BHumypFUHNZgSCp
	2E+USRGd0oLj1NfALye3kzgmlrKbpsPAbFALzx8hEg91NlkyxzEymUBx2tqTNvUFK9bcvuOAx+n
	lRt0LOe3wdA2ppScCSyZWMqZJjQ5ay3A7dbLpuCqLCAs9nbxD+yoB2hVIRQIZy1vSZ+tCp4tiPC
	KJl4=
X-Received: by 2002:a05:6214:20a1:b0:6ea:d629:f48b with SMTP id 6a1803df08f44-6f0b7471828mr249821356d6.19.1744113558050;
        Tue, 08 Apr 2025 04:59:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUpzBYgQ78WcZ+1SeialBgHtwM9sX7c9zUkOnk8QyfR5MRu/+7FIzLJ9zYjIy/Tt3IVQbLfw==
X-Received: by 2002:a05:6214:20a1:b0:6ea:d629:f48b with SMTP id 6a1803df08f44-6f0b7471828mr249820476d6.19.1744113557475;
        Tue, 08 Apr 2025 04:59:17 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e65cc04sm1517615e87.164.2025.04.08.04.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 04:59:14 -0700 (PDT)
Date: Tue, 8 Apr 2025 14:59:12 +0300
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
        Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Subject: Re: [PATCH 18/34] drm/msm/hdmi: convert to devm_drm_bridge_alloc()
 API
Message-ID: <6aeiyzkrjgq44lhdjsh6o6rzibwmpcgxjwwx4vefoyk5n3p7h6@uipdbbcxwsbn>
References: <20250407-drm-bridge-convert-to-alloc-api-v1-0-42113ff8d9c0@bootlin.com>
 <20250407-drm-bridge-convert-to-alloc-api-v1-18-42113ff8d9c0@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407-drm-bridge-convert-to-alloc-api-v1-18-42113ff8d9c0@bootlin.com>
X-Proofpoint-ORIG-GUID: pr78JCwQkmwpVTOna7yHKgT6-TuHtQoA
X-Proofpoint-GUID: pr78JCwQkmwpVTOna7yHKgT6-TuHtQoA
X-Authority-Analysis: v=2.4 cv=NaLm13D4 c=1 sm=1 tr=0 ts=67f50f97 cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=P-IC7800AAAA:8 a=COk6AnOGAAAA:8 a=tVI0ZWmoAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=MqdoT2xZwiyagvIbdbwA:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=d3PnA9EDa4IxuAV0gXij:22 a=TjNXssC_j7lpFel5tvFf:22 a=-BPWgnxRz2uhmvdm1NTO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_04,2025-04-08_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 clxscore=1011 phishscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_045921_305588_9DD4AAAB 
X-CRM114-Status: GOOD (  14.36  )
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

On Mon, Apr 07, 2025 at 04:23:33PM +0200, Luca Ceresoli wrote:
> This is the new API for allocating DRM bridges.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> ---
>  drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

