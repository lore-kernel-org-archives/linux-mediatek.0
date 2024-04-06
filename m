Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ABA3C3A59D
	for <linux-mediatek@archiver.kernel.org>; Sat,  6 Apr 2024 01:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QojhALS8RST3msugK13RJ0F9CH18lEsP2QIYK2u8P20=; b=hz8CQCAbP/PbEY0OxEVegA/JKQ
	gEwI0VfcEKgH0EJ+yFIm5G2VgOMHURveegns/WFdePuclNhBHXuugDGWMbq6lYZMwsK0/IZguuqDl
	cXJZtW8ehqFf9Qy8tCsjpU4ivrZvj0mYwSbO6vClAyAAzja/DTGbUWqrPs/RfzNPJ/CQhwfl2mtYd
	mf1gy/KZedos+QFQNezHwtnv5TnLPg0/aqS51hvwihQSdooZ4+a+3L5sPlJ/FNkmVVGtWDkoerx+0
	tebXDNN8J3IIp5xhFU2/7W21IGy+3CuwnZCUmecT2qW28BRZZ4gdUx1KJwKqHvjtgBq8qXrUZARv4
	QRcPkQ6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsusD-00000009Rjl-0eAo;
	Sat, 06 Apr 2024 01:29:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsus7-00000009Rh8-0vv1;
	Sat, 06 Apr 2024 01:29:32 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4360oWSF006625;
	Sat, 6 Apr 2024 01:29:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=QojhALS8RST3msugK13RJ0F9CH18lEsP2QIYK2u8P20=; b=nU
	EmvF9kr5kvNbGzSRybcUYWry325OkJvKC1GlycpotIYUh+OhtNBvGA0n6dkqM4eL
	SYwgU7gXuUlmCITFV1xNU/t9XtQjYPkaIUFYxabIJCRinWl3TScU2u1g7vQ2aCEk
	wdhCdNZLfmU9NYM+6rlsXRXd0V01Iowf5hzNSiKWqGF9kV24SoC5ve4SMDJgQlq9
	FulBV4ZJHqm+8TnOoFPxf0eBz3CbbaSNFfTX9YYu7Otmp1XVVceYcuQq8eMNQlIy
	bS/NeghodAUECL1BZyG+H69h5xd/DJ5yQm2DEhz2UXzfzRh9hBLT5wxP8Id/CeWm
	0TzFKBCs5svNLc8DjdBQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xafpksmbp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 06 Apr 2024 01:29:24 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4361T9G3026757
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 6 Apr 2024 01:29:09 GMT
Received: from [10.47.206.1] (10.49.16.6) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 5 Apr 2024
 18:29:07 -0700
Message-ID: <907632cd-ce3e-4868-92c8-8a79d09fa011@quicinc.com>
Date: Fri, 5 Apr 2024 18:29:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 7/7] spmi: pmic-arb: Add multi bus support
Content-Language: en-US
To: Abel Vesa <abel.vesa@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Dmitry
 Baryshkov <dmitry.baryshkov@linaro.org>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        Johan Hovold
	<johan@kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
        <devicetree@vger.kernel.org>
References: <20240402-spmi-multi-master-support-v8-0-ce6f2d14a058@linaro.org>
 <20240402-spmi-multi-master-support-v8-7-ce6f2d14a058@linaro.org>
From: David Collins <quic_collinsd@quicinc.com>
In-Reply-To: <20240402-spmi-multi-master-support-v8-7-ce6f2d14a058@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: DzLzYEJ86RzxmAT8-h-u_ubXkHxLSS4A
X-Proofpoint-ORIG-GUID: DzLzYEJ86RzxmAT8-h-u_ubXkHxLSS4A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-05_31,2024-04-05_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 mlxlogscore=754 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404060010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240405_182931_334524_B9B96617 
X-CRM114-Status: GOOD (  10.29  )
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

On 4/2/24 05:07, Abel Vesa wrote:
> +static void spmi_pmic_arb_deregister_buses(struct spmi_pmic_arb *pmic_arb)
> +{
> +	int i;
> +
> +	for (i = 0; i < PMIC_ARB_MAX_BUSES; i++) {

s/PMIC_ARB_MAX_BUSES/pmic_arb->buses_available/

This is needed to avoid a NULL pointer dereference in the case that a
single SPMI bus is specified in DT and then removed at runtime.

> +		struct spmi_pmic_arb_bus *bus = pmic_arb->buses[i];
> +
> +		irq_set_chained_handler_and_data(bus->irq,
> +						 NULL, NULL);
> +		irq_domain_remove(bus->domain);
> +	}
> +}

Thanks,
David Collins


