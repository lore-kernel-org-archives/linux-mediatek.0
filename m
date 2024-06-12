Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 703BFC41513
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jun 2024 13:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n560daCLgpz3ZdOfX2LEmXn4QpxtVUnQWqyqxxLmb8M=; b=a+csllM5RgPkkwKWx2uJhzYcDW
	S/JPObmR9w/dGBfBEZEgc7g8gl7LRsNG4iWSUHE4Zaed6tcxoNz+9SvbBMZx76H1+FxckTEtbSAB8
	mB5Q0mBXVCAUe7xG+XYsaO3jUbpuNXxDHUE4grW4kXsWQO7x+F2/RXdXCP8b7LRvz7KmKCT7ECnQp
	ae75nMHqEhYvU/kMTTVk2FSnh450oWnET+ik9h3K8KJJRk+vvdzsBoIyP0kOz8ymQ8p/ntZckdUvX
	Lo1I1juD9qps/ZBTihkegmIlDJEo4in84qJo+yjVSHqOmOWPKALt9L0Wzt/usJbFJTBw3hRlbZnl4
	uQyLGOvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHOSx-0000000CqPS-1Ct4;
	Wed, 12 Jun 2024 13:56:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHOSi-0000000CqGM-0cV7;
	Wed, 12 Jun 2024 13:56:30 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45CCD4U1017787;
	Wed, 12 Jun 2024 13:56:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n560daCLgpz3ZdOfX2LEmXn4QpxtVUnQWqyqxxLmb8M=; b=jhUWgUj/nwoABnkO
	ioLPdiZ6IND3JQMUZOn56ktSDoc0nOSyHjZ2Vr2pi5xpPqbE5H+OKIZV4ICeiwH/
	NEJwMvsGLjV/vAmFeOCZ0sk7gYd6wQRj7+hcMRtnn7ZNMrW623sJsVwSBB3R1q8Y
	KPbbR4Yp1NT6ubFPe8fPfbjXhIJw2PIcDnGTZJnY42UVZ1pjn6lSsn0T2ajdgDUO
	eqCkcPyTO76A5m0uuXwrLTmLViyzY9n3Bt32pXdSAy9XMrpf/BHaN9ya1+nsz6Hh
	tL5fTgh2QGoKAUk2p8vamEV5rTy2Q9EtOLo8v1EPihVneLQy91inpsVWcHq8jhjL
	e8MXaw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yqbfq87h5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 13:56:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45CDuEs5001427
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 13:56:14 GMT
Received: from [10.48.243.20] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 12 Jun
 2024 06:56:13 -0700
Message-ID: <0a67ada3-a030-466d-8110-c665940a5785@quicinc.com>
Date: Wed, 12 Jun 2024 06:56:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: add missing MODULE_DESCRIPTION() macros
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>,
        AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome
 Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha
 Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team
	<kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Linus Walleij
	<linusw@kernel.org>,
        Imre Kaloz <kaloz@openwrt.org>,
        Matthias Brugger
	<matthias.bgg@gmail.com>
CC: <linux-arm-kernel@lists.infradead.org>,
        <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <imx@lists.linux.dev>, <linux-mediatek@lists.infradead.org>,
        <kernel-janitors@vger.kernel.org>
References: <20240611-md-drivers-soc-v1-1-8f0fc9fff234@quicinc.com>
 <a314c676-3dbd-46f8-826a-2e59367d30ce@linaro.org>
 <ea604d75-e571-4d63-a7e2-aa1393588c75@collabora.com>
 <cfad60ae-3dee-4c03-84c0-734f1fa59ff2@app.fastmail.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <cfad60ae-3dee-4c03-84c0-734f1fa59ff2@app.fastmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Ftek-8sc2XhAb2_WElZ_ZTVzalQijyoT
X-Proofpoint-ORIG-GUID: Ftek-8sc2XhAb2_WElZ_ZTVzalQijyoT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_07,2024-06-12_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxlogscore=936 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406120097
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_065628_427430_8BDB0422 
X-CRM114-Status: GOOD (  15.87  )
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

On 6/12/2024 1:18 AM, Arnd Bergmann wrote:
> On Wed, Jun 12, 2024, at 10:12, AngeloGioacchino Del Regno wrote:
> 
>> MediaTek:
>> Reviewed-by: AngeloGioacchino Del Regno 
>> <angelogioacchino.delregno@collabora.com>
>>
>> ...but I'm not sure how we should apply this? :-)
>>
>> Either Arnd takes it directly, or you split it per-soc... and I don't have any
>> preference anyway.
>>
>> (P.S.: Added Arnd to the loop)
> 
> I think in this case it makes sense to keep it as a single
> patch, no need to clutter up the git log with identical
> one-line changes.
> 
> Jeff, can you send this to soc@kernel.org (cc:lakml)
> once you feel you have enough Acks? That will put it
> into my patchwork queue.
> 
>       Arnd
Will do, thanks Arnd


