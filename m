Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CE8BC88E66
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Sep 2026 22:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=btDF+i2KLcySKsRDG04ke9EXGqLGBKkYRlkEl3KSsbc=; b=IwB7hOF0qEj5SGEsebMwSc1FVy
	d/Cr8ART1gZYFkotnXVzew/eidsKeapFhC+Hy2lCF0wIgas8vBWq1Opx15gue+Hf48/5VABMYf9SV
	ZDjtD6be3yCW73WBK/gN9B5WuvRHnxe1ezqpuL+DyetmmzsjOnlwuAY4VrXduPM4k2amX0jMb7yRW
	V2fpGI9rg7A1RmENRSEZranVJGg2LBAp9YEm7LJ95EIOhQnyYaJ5Sy541rzL/QIp37THv7BYHftEE
	XH06S2pLL45SJLCqdiVoT5F3RMPt5bNFxfp72KQ+FoQTYb5izueyLR7vkGADKFJRv+dvqNYZI3pWT
	Nvss5Wuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5t2m-000000025XI-2F3Y;
	Sun, 13 Sep 2026 22:51:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5t2h-000000025Wi-3QXO
	for linux-mediatek@lists.infradead.org;
	Sun, 13 Sep 2026 22:51:24 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DJxQb72685710
	for <linux-mediatek@lists.infradead.org>; Sun, 13 Sep 2026 22:51:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=btDF+i2KLcySKsRDG04ke9EX
	GqLGBKkYRlkEl3KSsbc=; b=cSN3ULp/jmbD+RpqhvAi7G4b8xI5NHqzdYnUZhQk
	pqRdi8OFg4yp6abdziJVVvNQxLPekTUoi2qzD+Hf6CUBJY52mICx0i+Ild//Ou35
	cv3WwDThVV+NN299SEV0hpMYpHSNwQ+6XYCpWNzK4diPVU90zzLYiejU8LUXjatK
	ocOuYsNom8HvdaXAbadzhrtybdJLnz2OcOF3OP2UVbplsG85bTwkdndc1wOrUOsi
	22pcbkOiL3fe+wZJUqic9K/G/UBZx7yiNiVjQhvqDoPqLjxph6Z24wMWk4g2d559
	0vUESeSvhT7fybc3nCMhBJN4uPKQrfSJ3Ye7FY765JOdIg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9d4975-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Sun, 13 Sep 2026 22:51:23 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-79129463b7cso2436460137.1
        for <linux-mediatek@lists.infradead.org>; Sun, 13 Sep 2026 15:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789339882; x=1789944682; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=btDF+i2KLcySKsRDG04ke9EXGqLGBKkYRlkEl3KSsbc=;
        b=OGjRX7LyccSwNWEkZrWSx6uINUCIATzxKtO2Z2lO6i3dnz2auN/y+bfg5RdsVrRx+L
         neGhOdJbm8sVcAJUpmBDUEw7hH9SSO6QnA+6Dd9Yo/dpD0d8MPlaV4VJjGDHwu+2U71r
         jVAzWQdMClMW5xXp9ra/6DsD4O4sbhp9nOHT0Fdj3qmY1TfP0v5tAQyXSOkJBg2Cfp4q
         k4jZI+ZtxkUHjpNZt1vJH/N0x0JZgRvI/yECmYXQNUSZckdfvUQ4rEg2cjYGkIcvnmnm
         NUskc9JVwNr+UEO5kfTUnxQjJ4BcFaQXm79HcOEF/dya1v91LXYinMO8Xa5VL6Kyr+It
         Fmig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789339882; x=1789944682;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=btDF+i2KLcySKsRDG04ke9EXGqLGBKkYRlkEl3KSsbc=;
        b=FzmQeVY2gO37lcXqIFHyUXho42YEB7Y5JNTzhsgDBuljYOZVNcUvd/6GMwFwbD+jQA
         7Oudz6qVEEBkUa9dArxnlB4K64BoQIBzt1h14CxDD5el6qeDyFViZnz9fWFCIYZtg5Lc
         Lo8A5XL3tCBiFyjgfj7PN/Kl56yDGReHb/mFqr32xSxj3xPNJD7SlOj0eGR+sAmjeJRq
         pzTp+PYsHI26unhfNScnTfcICp+/Z/yKWFc/vUtM0a5U8aQ882aWD0bnBIwsA68gQXqc
         GGSChHjsUKq5mRpDjMTBaG93pscUGo3iACgu/CPPBNPavjG7dDiHKgfMhcPhh2stGnWB
         YQOA==
X-Forwarded-Encrypted: i=1; AKwUvByEJKkebm7rQFE7WjNWq8UlYGn6ujflqo43Rrp3riulI7q2/6KtTakxyKppbO9qNY+WcAC76RndwNmyjoCnQQ==@lists.infradead.org
X-Gm-Message-State: AFuF++nUsgepw2girPeeCIsRw3f11tB4z503mFxe8OhvCcgGPkR1AJ1e
	HaS3peoWqta0Doqd7saDOoMMSB207sOvYmwHq0BuHHYCz4m5g4iEevOKNOQeNf7c2LGalmpHtTs
	c47HaEADQTZp1HDzBqAme/WQfbwk8HI7dpxVok3nQ7LFIYvEASRPwrk424+EgOwgjTRpm+i0AOl
	k=
X-Gm-Gg: AYBFou3H/qMZCvhaOYR9Fw38JmC06YlLJ/biosSYlBFo/BxWhwtCNr4uoEXucgaJ6V9
	7SCFVjjueSKm5uH01O/jtLrtlwKrkphu/fFtwEgaYxhJbb1kWimucVqm/be3sMieNLyk+tv3p6q
	S5iqLfBma1xqPjfcMlQos/jgj5sG4w5uX1MitMQVX+kTF3BC4GaNcaXGnWQlDtywYY9Pin/aiVn
	zOgFTCyvXzZdqUNFbT2v+XnRrUYMDSSmD/B9e5aZoYwZkzw68aw9B+kfMZpYQke2hR6gaJri0kB
	2FzBMLHsyP+cXXdmQdHp7GWUkp12tnp0j06qO9mRsxlNGWySppSse3G3rQaP5YjGTvfCJBw9OtZ
	Z1oBRPLQ/u0XxRmWL+TlGr7yCcrdFFzmDIDMKuRcnnhmuQTmbdXmEkg3D9fHT9BfjCa2aaG6aHT
	crwllCP67LA0Yx
X-Received: by 2002:a67:e08a:0:b0:792:94bd:9be7 with SMTP id ada2fe7eead31-792a675d7e0mr11888867137.2.1789339882096;
        Sun, 13 Sep 2026 15:51:22 -0700 (PDT)
X-Received: by 2002:a67:e08a:0:b0:792:94bd:9be7 with SMTP id ada2fe7eead31-792a675d7e0mr11888827137.2.1789339881698;
        Sun, 13 Sep 2026 15:51:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a047d1d1sm2086254e87.80.2026.09.13.15.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 15:51:19 -0700 (PDT)
Date: Mon, 14 Sep 2026 01:51:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>, Liu Ying <victor.liu@nxp.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Francesco Dolcini <francesco@dolcini.it>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Marcus Folkesson <marcus.folkesson@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Yannick Fertre <yannick.fertre@foss.st.com>,
        Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
        Philippe Cornu <philippe.cornu@foss.st.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Adrien Grassein <adrien.grassein@gmail.com>,
        Russell King <linux@armlinux.org.uk>, Simha BN <simhavcs@gmail.com>,
        CK Hu <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Chris Morgan <macromorgan@hotmail.com>,
        Martinez Canillas <javierm@redhat.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 2/2] dt-bindings: display/msm: Use consistent indentation
 in the example
Message-ID: <acryik4zjxxt76ldqk46a3wymgettocilimua4tlm7wl3tvfo7@yrh36odg6fju>
References: <20260913123331.100293-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260913123331.100293-4-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260913123331.100293-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDMyNyBTYWx0ZWRfX2OiYTxMpQ1HL
 YTjNyjrcudCsI1LWGJR+Es5MrGyabIx30k9YJQ1Bt0wQ8okvRIp1xY2EI8v3IULohgbzoWgWnPN
 HTyf/YUAD8qYjhRfaGS2l0a25dzzaRw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDMyNyBTYWx0ZWRfX9vswQRfaH3V+
 iGzoMgjaDQAqNBZtq3PZ4N9gWyvx8nOhcjbCGNo7qAKF5LB9AKf/cxTxzn+4jSTgqRM9lddR+xc
 nHyJPy7BfO2vd4k81m6q30UOyX0GdL3CcqEGMjki2xGXt++v9s/T+Q0CKo1kaA9nYBXV/i7mj7H
 opCODvNrprcGHLEq4B/AmKPGe34sNEw83wvFsxz056B5TLNKCY1WRAtH/t+4VHzLpkRFnc66Mk2
 NWARmK6WfkvGPx9DSt7zj0ydmVRMJ2B1NYxcukd4lfpzcBWPws8gRUb9G07rfXTrWMeFLCkmE8c
 E2KpeZfYh+FrQ/hcXiDXzwnNbi/wO61M7wWflt9e8SDXWPDq76MmBfd/XbPRnX0dz8NQZOBz+e7
 hmjtpdfLkCRevXAGZBTLVzE7LxDmE18MUiPGaNag/dUHD2g4NvU8HFSHfYevtHg9FRJs0XtV0Gd
 8JRCrbtObffjxbTSZhg==
X-Authority-Analysis: v=2.4 cv=IOSXmQvG c=1 sm=1 tr=0 ts=6aa728eb cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=6MNK4Np0iOagQr2kdRsA:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: tW_hj4FJRs_D7EJnegeuhVTAbB8Q4BhH
X-Proofpoint-GUID: tW_hj4FJRs_D7EJnegeuhVTAbB8Q4BhH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_07,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609130327
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_155123_872671_EC2CECC2 
X-CRM114-Status: GOOD (  15.73  )
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

On Sun, Sep 13, 2026 at 02:33:33PM +0200, Krzysztof Kozlowski wrote:
> Correct indentation in the examples to consistent 2- or 4-spaces
> indentation to fix dt-check-style warnings ("example 0
> [indent-consistent] indent mismatch ...").  Preferred is 4-spaces, but
> re-indenting entire example just for that is too much churn.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../display/msm/qcom,qcs8300-mdss.yaml        |  6 +-
>  .../display/msm/qcom,sar2130p-mdss.yaml       |  4 +-
>  .../bindings/display/msm/qcom,sm6150-dpu.yaml | 14 ++---
>  .../display/msm/qcom,sm8350-mdss.yaml         |  2 +-
>  .../display/msm/qcom,x1e80100-mdss.yaml       | 60 +++++++++----------
>  5 files changed, 43 insertions(+), 43 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

