Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E7F3C4345F
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Apr 2024 15:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=haD8srUSA/7piIQcBMU+jz1u8jwrb7rUW232cvqEx3s=; b=WLu/QyZEmvtpag7Ohyp4o39Px/
	drIS6Y0yxGJYYLs6DBmYSW2o+xJDeHU6FcmsOZ96kxw9hGHvMsQaqyZ9cbGT2jkf8Diu16KKPF30n
	H6mAJTN2QVPNAfKgmDeSFgh50gg16Oi+ZtX4JDO4W79kYQQ/Ax/TnNYRRa3rW+p5benDqfNc6Gq/s
	EZUymXIP/ILd+4AzsixrvxQ4l0GkwzlVyo8PnA16e3ATLkodWvJebg0HMDPPWBN1YtI79tZwMiuxT
	+e9axwK/LpzUG4fVav+2foflU/nNdUbRC/IeXmd0/1plUQrtNjH34e+D7sKTUJ2vQU0mhzmSZEXvV
	im+tsBYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruwbg-0000000CoqL-37gG;
	Thu, 11 Apr 2024 15:44:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruwbd-0000000CopH-07xq;
	Thu, 11 Apr 2024 15:44:54 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43BDG7bV024388;
	Thu, 11 Apr 2024 15:44:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=qcppdkim1; bh=haD8srUSA/7piIQcBMU+j
	z1u8jwrb7rUW232cvqEx3s=; b=Hh1T/l8AZXIPiuPJqEb+2xEhcwSozimpdVr7/
	ABvip+E1Wk/J/Zj8agqdbWyJOXCUiT7kxIstytMkXA+Kr/EioGE0k1drFabachGG
	e/twcqTZYzv9/ZuLmnPN3qe1clHinSdawWe/XA3nIErgRDeW4uRtXUcQGNH/g5LB
	rnwWMlOrXRIsrFHYwNEFgG5AxakO2YYA/gPwVGw0SJvV8jq4U85e4u4sjAhUfnBv
	psRlDjeOV5LSTGoaaOr+7fn2w0mbIocdr5edRg/SDi57nOvFQPmti6rJF1yvUb50
	dcbDTpIE+iyP7jKi+xqrz3TUbZFyfzUAR9PjsEMo8l8BCqSDQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xebqx9mg6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Apr 2024 15:44:46 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43BFijB4032349
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Apr 2024 15:44:45 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 11 Apr 2024 08:44:45 -0700
Date: Thu, 11 Apr 2024 08:44:44 -0700
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
Subject: Re: [PATCH v2 4/5] pinctrl: qcom: sm7150: fix module autoloading
Message-ID: <ZhgFbKg8DPBsRrac@hu-bjorande-lv.qualcomm.com>
References: <20240411064614.7409-1-krzk@kernel.org>
 <20240411064614.7409-4-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240411064614.7409-4-krzk@kernel.org>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: KU4mU--SOy6t8CFhdoXd3JVsuCKtrbVx
X-Proofpoint-ORIG-GUID: KU4mU--SOy6t8CFhdoXd3JVsuCKtrbVx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-11_08,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 mlxlogscore=999 malwarescore=0 phishscore=0 suspectscore=0
 adultscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404110115
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_084453_097843_4FC4EECB 
X-CRM114-Status: GOOD (  19.89  )
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

On Thu, Apr 11, 2024 at 08:46:13AM +0200, Krzysztof Kozlowski wrote:
> Add MODULE_DEVICE_TABLE(), so the module could be properly autoloaded
> based on the alias from of_device_id table.  Pin controllers are
> considered core components, so usually they are built-in, however these
> can be built and used as modules on some generic kernel.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 

Reviewed-by: Bjorn Andersson <quic_bjorande@quicinc.com>

Regards,
Bjorn

> ---
> 
> Changes in v2:
> 1. Add ack
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

