Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C65F9C369A5
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Apr 2025 13:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NAOBRVsjJlHCM4CdITK2XpsGlU7ZTqgOAiQblGZfMuM=; b=2aiZ7/bEd7s+jpKvprps6yx4gG
	IW+DAJO7IXoGh+AXOvRM/8nG9R2R58cv81Bm7fKbmdnqpeH3DChWdJNBiChFcgE0KR5DoB5DETfh1
	bBcpOJa6eITNJTr5tDocTO2M2HtYPZVw83c+/Fq/tfm+pVhZBdAdcchlv4eqCWBLSxowz/riZ85br
	tNuMZonVqOm3tQiEZVjZchfaMuI6KtwS0nqKunjs2UqD9de/rqPzzR9HEH1CC2nH69LhUitAqY1zm
	kFLmhBEeoHVhblJmYKj7wII57NELYV8NHVLswIhrebqNoFlpJW9vDPc+3gFcjBAnqMl9p4ktS7xuo
	Hn5vhOng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u28mr-000000047zq-30Kr;
	Tue, 08 Apr 2025 13:14:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u27jd-00000003wX1-1D9g
	for linux-mediatek@lists.infradead.org;
	Tue, 08 Apr 2025 12:07:22 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538BKfBJ027668
	for <linux-mediatek@lists.infradead.org>; Tue, 8 Apr 2025 12:07:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NAOBRVsjJlHCM4CdITK2XpsG
	lU7ZTqgOAiQblGZfMuM=; b=lqaKm3UaJkGn/9imxJ44ZTO0g34+ZC0rt9Box9zs
	kbLzG8ygIFFJqC1cGFGMuA7PSRNKTWRi44hoN/Le03qLh8KdaQx2u3ZLbNsnC5Xm
	Ut8RmiyYtVAJUSR790WSHIc8lf6BfdVyI/z7By0j64549PQfHFDGE3Tj3TEY0nvH
	5g47J7MlDY2RNbLUbhvBtkUznFGNTK6uceO/r523upDptkuadMDfBs3NY/zrLj5L
	yXYNAUoztzv9ZcEyNbZqrGdrKpUJEjf7aCbNBvUYFEQY1eFFKfQl2kCfKNxKistO
	hJ4+lMQaygnkkMeMRS7tHBekwbEOF/NJ+DCG+wWY5h6Fpw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twcyypr4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Tue, 08 Apr 2025 12:07:20 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c549ea7166so894869785a.2
        for <linux-mediatek@lists.infradead.org>; Tue, 08 Apr 2025 05:07:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744114039; x=1744718839;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NAOBRVsjJlHCM4CdITK2XpsGlU7ZTqgOAiQblGZfMuM=;
        b=gDzAcWPf+9K/kdJbPa7OAQGKfLhAWuR6Wxt31hqpvQs0SJIMDsAo2rol8eUfFlb6wV
         RbhCL8v4dbs3tZNVqf+6gVoJ7DdcUacXyrJoRYOo4OyHuMM9I9pGuXAOO1ofRzx9sZEE
         cDCusAoh2YpKLbgar8C0QUkrsGm/UNon1u4Kv1okZaLcqMLxP3i0jf4rM9xb2FrYR7Gy
         OXWnHOBn/xyMZX+tcgZVUSyByTNfPdLXznEU27geBFn8Ve03pKSsxJtBqCBM/xB4Cns5
         7viKHJCFkPG4ehXcBhodn6cJDYWmljp4qDQ0PuVVxecncq3hAwGB6UJ7DgE4rUEH8pDn
         Zbug==
X-Forwarded-Encrypted: i=1; AJvYcCWSJrzanF1IdzIpbsqaBskNyVJJzONZ/fCTOaMXk/DGnRcx9V6iETu3JsBXoqwPSh/sI8tlpMQ43p8rlH3sVA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzhAmXN6xSsAdhySgat3LqGDmiytI4SACOSaNvBZlPzGczC7C7N
	55mbzFGZORX0gEJkKbyLM/DYUZ/FeWtRi5fdOiIU9zqkC0nMU7qkG4E0b5smI1WY7dxwgWrwRb4
	qCVk/Ii0SW7N1pqurw4JAc4+ywtUVy8CmpTbSO5KCTZGC24XK3sk2KAYRCnv0nOAbgSMDneo=
X-Gm-Gg: ASbGncu6hyGKw1fqPWtQpsl/EEQAf0/v5dyy6QXDFhb4TAvP/hRwLUOkPtzMYxFwZc/
	6qwMO5LWrlJJaI0gRqnZeCNrjg/JGvmYZ2U6FWDzL2Td9o3m0NIC4CjSsvORswyZFtHSfKkRN3M
	6f/x8nOTcoE+pZLBxnLN9aIAFS/RumU+ul+ymc7J8tv5XGCRV6m+F7HBG8wrqsaxMqygeQsuJBN
	MJJZzkljf6gw13plLZs/hYdI7v3XNJT6UrIvOeRuCTs+Ejt6qpljlBD4yidp7PM1ZJbkNlJvxBx
	25/hGXqTDN1SrTdDlO5AeMovDGl9fpFXxSMrkMRTiP/dk3+6QMVRAFCZiZPc3TsNNrUO4hSnf/M
	Ld3g=
X-Received: by 2002:a05:620a:d8c:b0:7c5:5d9b:b617 with SMTP id af79cd13be357-7c774d531e4mr2062274685a.23.1744114039170;
        Tue, 08 Apr 2025 05:07:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOm+0STm+ulEUG2g1OSycLPEpwZd6FwOx4lE88yO8te3gseQuW/5R7Tv5qddqxIae781y5XQ==
X-Received: by 2002:a05:620a:d8c:b0:7c5:5d9b:b617 with SMTP id af79cd13be357-7c774d531e4mr2062266785a.23.1744114038665;
        Tue, 08 Apr 2025 05:07:18 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f0312454csm19167511fa.14.2025.04.08.05.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 05:07:17 -0700 (PDT)
Date: Tue, 8 Apr 2025 15:07:16 +0300
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
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 07/34] drm/bridge: lt9611uxc: convert to
 devm_drm_bridge_alloc() API
Message-ID: <63airbm25ly5svkym5fuahnlli76kshtq566zjjdswdhoatk2o@wi4uyz5xrnt4>
References: <20250407-drm-bridge-convert-to-alloc-api-v1-0-42113ff8d9c0@bootlin.com>
 <20250407-drm-bridge-convert-to-alloc-api-v1-7-42113ff8d9c0@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407-drm-bridge-convert-to-alloc-api-v1-7-42113ff8d9c0@bootlin.com>
X-Proofpoint-ORIG-GUID: 0OdAfdtcgJJclLDT91U2uVmfEdRRReFs
X-Authority-Analysis: v=2.4 cv=Q4vS452a c=1 sm=1 tr=0 ts=67f51178 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=v-JOCnpjkiGUajTo4vQA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: 0OdAfdtcgJJclLDT91U2uVmfEdRRReFs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_04,2025-04-08_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1011 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 mlxlogscore=830 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_050721_448981_E201C3F2 
X-CRM114-Status: GOOD (  14.94  )
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

On Mon, Apr 07, 2025 at 04:23:22PM +0200, Luca Ceresoli wrote:
> This is the new API for allocating DRM bridges.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

