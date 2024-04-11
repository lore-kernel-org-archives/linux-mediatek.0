Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 811E9C4345F
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Apr 2024 15:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RFHrFkfwcQrgxQdoj1RVHqtwLottyVNWq/7Jdndbpsc=; b=uegOU3DkUaqVH/xPFEDqa6uU5Z
	ZzLHw5fhpaWxmcbvKfMeQimIxAbXmUkzXznz7QUEnCKLAqLSVTGOs8phwl4iuWinH0az7cSYNigwY
	Xj9jzIsw6pGjxFkN1HsIASVfpaIOIBnBqVD+m7yIlIeHX5Eam6ZeaTI9A+YETj5DrAM+AFEPV2Ege
	/JeKshM7OXUbeFOGni4cn91rEq2tcRNGzwPjpVzLmJPa47jxVmHZaYfufsC6zSusdNgJr5xym+/TJ
	a2kGO/4ghbDWCN5Yz3tN5FqboBj0VTtZm1M8rAyQatSZNT8onD+iNy/jmCXL3Vmdz4UvsKs+IOP8i
	rj5sx+AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruwX1-0000000CnOa-03ZW;
	Thu, 11 Apr 2024 15:40:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruwWx-0000000CnLm-272s;
	Thu, 11 Apr 2024 15:40:04 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43BBKYEc022854;
	Thu, 11 Apr 2024 15:39:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=qcppdkim1; bh=RFHrFkfwcQrgxQdoj1RVH
	qtwLottyVNWq/7Jdndbpsc=; b=irYc3LU9Uc+DlT4ymOnGhcMVzq43CGTucGJSd
	i21KmCSCnITu6Vo++gLvklaPtB3gO8opZuGA3o+n/Wz2qQ6f+Xpj6wjTRGrbjvEO
	naCfid4zJ7ISb2TIioD9PX0BRnwW4VdD/65usS30OjHQayIFadedgnk5K8OraJ/1
	Twqg7waPV2+ii/L1RKkC0JMWlYkbFo58qDRw8uS97TPcUdnd3fUUx0tUwtpvdbrL
	J0FTt975FbFhadZ33BzJ25XMBP3g16rck0S1zNIq+/bTDIvrxodP/SQqwOp6+q/J
	NEzx3/QDsMkUoOsDWJPzYpsT4c6P4hHHfOmhX+6g6uvOujjgQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xec6vsgks-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Apr 2024 15:39:57 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43BFdr3E029269
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Apr 2024 15:39:53 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 11 Apr 2024 08:39:53 -0700
Date: Thu, 11 Apr 2024 08:39:52 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
        Pengutronix
 Kernel Team <kernel@pengutronix.de>,
        Linus Walleij
	<linus.walleij@linaro.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Sean Wang
	<sean.wang@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        zhanghongchen <zhanghongchen@loongson.cn>,
        Yinbo Zhu <zhuyinbo@loongson.cn>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        <linux-gpio@vger.kernel.org>, <imx@lists.linux.dev>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH 4/5] pinctrl: qcom: sm7150: fix module autoloading
Message-ID: <ZhgESEq+9jRuta2B@hu-bjorande-lv.qualcomm.com>
References: <20240410170150.248428-1-krzk@kernel.org>
 <20240410170150.248428-4-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240410170150.248428-4-krzk@kernel.org>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Q4hixGIkEX4CJwtmeiJ4oFt_FKE4yeeM
X-Proofpoint-GUID: Q4hixGIkEX4CJwtmeiJ4oFt_FKE4yeeM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-11_08,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 clxscore=1011 adultscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0
 mlxlogscore=999 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2404010003 definitions=main-2404110115
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_084003_696807_BF1241C3 
X-CRM114-Status: GOOD (  18.39  )
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

On Wed, Apr 10, 2024 at 07:01:49PM +0200, Krzysztof Kozlowski wrote:
> Add MODULE_DEVICE_TABLE(), so the module could be properly autoloaded
> based on the alias from of_device_id table.  Pin controllers are
> considered core components, so usually they are built-in, however these
> can be built and used as modules on some generic kernel.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Bjorn Andersson <quic_bjorande@quicinc.com>

Regards,
Bjorn

> ---
>  drivers/pinctrl/qcom/pinctrl-sm7150.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-sm7150.c b/drivers/pinctrl/qcom/pinctrl-sm7150.c
> index c25357ca1963..c542f9bc6bcd 100644
> --- a/drivers/pinctrl/qcom/pinctrl-sm7150.c
> +++ b/drivers/pinctrl/qcom/pinctrl-sm7150.c
> @@ -1246,6 +1246,7 @@ static const struct of_device_id sm7150_tlmm_of_match[] = {
>  	{ .compatible = "qcom,sm7150-tlmm", },
>  	{ },
>  };
> +MODULE_DEVICE_TABLE(of, sm7150_tlmm_of_match);
>  
>  static struct platform_driver sm7150_tlmm_driver = {
>  	.driver = {
> -- 
> 2.34.1
> 

