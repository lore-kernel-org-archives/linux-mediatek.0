Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94117C369A4
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Apr 2025 13:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vFThqq7ILooH+RLGqVKM/XdZcU6OAYhPWLK/0HqsQ6M=; b=IgCfG5j7MuNKWP+BnhbiRuSriW
	c4Ul/wceQ1xzB9p0LV16MCSVwDpalZ+SJah6Z1lL8HTcZ11hHLsBP6/xLh3aL/iDF+Ai3S1zYDRoC
	RVxsdCHsgwerMLw8i8NZR2RVOt0sBNn2gH/mGWcxm3ksguBA5d7sAKt0OGmVKiTugY+bKhfXmoQFt
	UkhHCIIe3BJGQTAFPXXOHEQx+Kb7EYMVVCZgT7R00pfrMW7U49+4362T6wF0wlEZFl746J2H6mr0C
	Z61aA48LjnxBd4Kni7jmsWsAqD6Hqk9bngvQkm8Bom6ATCvp8cDZ6VsXxOdkE102xOmoVkyBSwURl
	qFGYNuhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u28mw-0000000489n-2gJU;
	Tue, 08 Apr 2025 13:14:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u27k8-00000003wbb-3wmV
	for linux-mediatek@lists.infradead.org;
	Tue, 08 Apr 2025 12:07:55 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538BHWA9018771
	for <linux-mediatek@lists.infradead.org>; Tue, 8 Apr 2025 12:07:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vFThqq7ILooH+RLGqVKM/XdZ
	cU6OAYhPWLK/0HqsQ6M=; b=XCnJ3igmR+clyI6eG7KCsy4++SCt3rnvgEcoddjz
	hb7g1vwListu13hpLmJk5ufeGmsBt0Qdu0SnQ/QRAtTZfdE5QShMPt8TbeY7A41l
	VFsCbPyorFtJTrjqkySeyNxr8C8CHT5PZGvanfmxNv66Cvbl1PDci8yRDawVnuAd
	Zc+YHj3bC/Vgx9sgZzbgdUB9JZPfXjP9ra1wzTgm9rPrPVNGFkET1SosGzdGwTbV
	67RFqwbcoSc3ZUYaJ5uURcPI7zK7KMC/shGPG8BM8iXpre0Ofe5yGNZJ8QhOtwDN
	ZO3Q//fI/7LjIqCriXeZ+MbfbK+sqhgGbmnKIv263WLRtQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twdgfq12-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Tue, 08 Apr 2025 12:07:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c760637fe5so971192485a.0
        for <linux-mediatek@lists.infradead.org>; Tue, 08 Apr 2025 05:07:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744114071; x=1744718871;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vFThqq7ILooH+RLGqVKM/XdZcU6OAYhPWLK/0HqsQ6M=;
        b=QiCqrJy7sxXHIT61B33cs8XkZ/awOYjsiEP+chFbVjrp6r4ZAt03fnXZ6fdNQnU4no
         AleA7HMQ9hTcBaSxucKKCUnErUjYfNHBkdRILgPnLOR3Ct0/xy1lKZbGNFAshx4rczFw
         VMejmQZyPDx816IXwvErkEG3em2n5M0fxXgFSLlsc/nRjfZewfPBqqgY79Vm9EydEZOq
         Zpg6tPcwsaHlF/eThbNECJiZsbofgIBU7btGTSrX9hBukR/gMM7piUO9Lq5Us1S8dBIT
         0viTHD0NNIGimflNZtv0iAmDXgrt1EgmETZYobqsw9o1/gJAjjV9XIIvXTj2WT26zgbG
         go0w==
X-Forwarded-Encrypted: i=1; AJvYcCXZcGAlMDKQbImp5l2MXiN/EIwkHaq9VIkmXfXgfKvMR8FFJV0XVU1mKDsiZkYjs69qEM2D+UjfJoiFOewUVA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwIMA51oKBut8xRXMLEShQSLWDTe0DlmDtG/8InEdGttgBnotfK
	bsBb0HP5zoI4jy2m31VeocuDkdPYF6TFN1luX5l5mT/tp+LCtiDoslZarLSmAClLin1zeLIpuzy
	OuN3tBKfbuCBxCvnH736MqJ5o5xKdcROw5UXrU+Kl46860K3AIdnvhpZbwhqLQZdcuiWGxBA=
X-Gm-Gg: ASbGncv9V81NX3BQLz9Xzh4R9AhQAD7DK/NsKfydCZ81t4XvlDAmG+YAMnC8YN9Toa2
	vJEf3i/LwYsfDt/Wc/1pncFS7eROPnIHmKoNpsB6mwUnaIp8hlTM6nkSEU5vVwWspB/JXqHR585
	h3hzTUp5NBKtPAPF59B8GeqFLR53gxFW74gW5yMWAR9sRvpt0nBmIXol9VtyAs6Hye1cR/7kT8M
	3Btn4XakZQy0TQnwcR8COMHVFOfuNIbMbmHSlyeFHgRxD2MQmJ6yUKeRC0pen7RgkBLhMxKdjev
	35aKTRmfXi8zFt9lp//JLHw/RsIsgmRlFldOKtCgb/TY/DjZTj4o6JTJJozz/36Gm5VDl+I7wHl
	Pepc=
X-Received: by 2002:a05:620a:17a7:b0:7c0:bb3f:e285 with SMTP id af79cd13be357-7c77dd62725mr1589590185a.24.1744114071318;
        Tue, 08 Apr 2025 05:07:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEi/xFz1Y/FUnJgwy2p/a82dsZcDfNqrlyFtWekzBv5M8uIRg3fMoN8KW/g0lGhJUXSQz8Eyg==
X-Received: by 2002:a05:620a:17a7:b0:7c0:bb3f:e285 with SMTP id af79cd13be357-7c77dd62725mr1589584485a.24.1744114070904;
        Tue, 08 Apr 2025 05:07:50 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e66377esm1493668e87.209.2025.04.08.05.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 05:07:50 -0700 (PDT)
Date: Tue, 8 Apr 2025 15:07:48 +0300
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
        Russell King <linux@armlinux.org.uk>
Subject: Re: [PATCH 12/34] drm/bridge: tda998x: convert to
 devm_drm_bridge_alloc() API
Message-ID: <kgobwv6zldlyb7vxyy4fyhe73krnsjr6aczpwl6agompne3tiw@vyk4m65vaqul>
References: <20250407-drm-bridge-convert-to-alloc-api-v1-0-42113ff8d9c0@bootlin.com>
 <20250407-drm-bridge-convert-to-alloc-api-v1-12-42113ff8d9c0@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407-drm-bridge-convert-to-alloc-api-v1-12-42113ff8d9c0@bootlin.com>
X-Authority-Analysis: v=2.4 cv=PJgP+eqC c=1 sm=1 tr=0 ts=67f51198 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=P-IC7800AAAA:8 a=PHq6YzTAAAAA:8 a=EUspDBNiAAAA:8 a=hcs5bi09U0a-O7-gtRoA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=d3PnA9EDa4IxuAV0gXij:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-ORIG-GUID: o1YpxHL9lo0LoPi6nGlv99KT4HbL4-oY
X-Proofpoint-GUID: o1YpxHL9lo0LoPi6nGlv99KT4HbL4-oY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_04,2025-04-08_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 clxscore=1011 adultscore=0 malwarescore=0 spamscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=934 bulkscore=0 mlxscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_050753_110229_B2C9E18F 
X-CRM114-Status: GOOD (  14.87  )
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

On Mon, Apr 07, 2025 at 04:23:27PM +0200, Luca Ceresoli wrote:
> This is the new API for allocating DRM bridges.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> Cc: Russell King <linux@armlinux.org.uk>
> ---
>  drivers/gpu/drm/bridge/tda998x_drv.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

