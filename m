Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD010CD1296
	for <linux-mediatek@archiver.kernel.org>; Sat,  6 Apr 2024 01:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pJIDmkv+nhCUT5XuKD+cJ5b+mKtAThVKkZ2VMYhos5E=; b=H70IBxRk49j5b2reCYxbogJnNi
	18hffFMtD7TcIOzofNhKr0xEx1UFy2IV8wl+WZHUxyIwYyPztVzAY2ceoRQkSVXKDTd24OvDy5C5a
	YlT/zdNP5bb8N6OQ/2Ar4gxGbhhyeH2+Hu/QkSwEFHb4AzSO49YNW3IYcjDJDd1YEtQcTYzZUQhIv
	B+gnHsv9Hj+8MMJm/5QX0VKheepEAe7tiWeHau+2aA7PO02LLftBgqdJtOrelCq8IlChQUsvRMEc8
	NnCrq5n9avoV6jWG8hRyHWBSJGswEbGTDsBrDmiWjpAFFgidlaCDHk0XvHIGn9uN58mjQWY9X+zLU
	M/atfd5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsus6-00000009RgS-1w5k;
	Sat, 06 Apr 2024 01:29:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsus2-00000009Re8-2rGs;
	Sat, 06 Apr 2024 01:29:28 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43617a3r001838;
	Sat, 6 Apr 2024 01:29:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=pJIDmkv+nhCUT5XuKD+cJ5b+mKtAThVKkZ2VMYhos5E=; b=ax
	xW+JqhDFXcCxciKu1S22bmTez61Rvasi9HNzsMr1iic9i8P9j5ohL+PC0GD2t132
	lnN+H93KF83FuO/iWBDQ/j/4zZSSnhLm0kUiIebfwgQPu9v03AdLx+9gXEs5VYwe
	U00R3t18o1/X7v94s6zhneqZzVgBClHwL42qVr9UQodJLgd36OtDosEHXV/hiN5Y
	THt456pFneZ6UPCMp4Z110L4YXXDhuWiQ/S+qo2RupiJUipK5uCjHHfIjMS88k28
	LKsd+1oCsUEBmrjkp5e+A/BbjEmAsBhY+JynzlKRXGbKJ+Hy9x1noL5JX+LqiCFz
	rKTz6SbbAr7ycAwqU5Xg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xaver813p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 06 Apr 2024 01:29:19 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4361T4Q4029823
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 6 Apr 2024 01:29:04 GMT
Received: from [10.47.206.1] (10.49.16.6) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 5 Apr 2024
 18:29:03 -0700
Message-ID: <e1a9f751-8431-4cc0-a65d-f00b184da09e@quicinc.com>
Date: Fri, 5 Apr 2024 18:29:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 6/7] spmi: pmic-arb: Register controller for bus
 instead of arbiter
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
 <20240402-spmi-multi-master-support-v8-6-ce6f2d14a058@linaro.org>
From: David Collins <quic_collinsd@quicinc.com>
In-Reply-To: <20240402-spmi-multi-master-support-v8-6-ce6f2d14a058@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: VTMQSKwVhBh_InbA8xBhyFtuvnMohNnY
X-Proofpoint-GUID: VTMQSKwVhBh_InbA8xBhyFtuvnMohNnY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-05_31,2024-04-05_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 impostorscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 mlxscore=0 mlxlogscore=967 malwarescore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404060010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240405_182926_787605_F026C6FD 
X-CRM114-Status: UNSURE (   8.84  )
X-CRM114-Notice: Please train this message.
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
> +struct spmi_pmic_arb_bus {
> +	struct spmi_pmic_arb	*pmic_arb;
> +	struct irq_domain	*domain;
> +	void __iomem		*intr;
> +	void __iomem		*cnfg;
> +	struct spmi_controller	*spmic;
> +	u16			base_apid;
> +	int			apid_count;
> +	u32			*mapping_table;
> +	DECLARE_BITMAP(mapping_table_valid, PMIC_ARB_MAX_PERIPHS);
> +	u16			*ppid_to_apid;
> +	u16			last_apid;
> +	struct apid_data	*apid_data;
> +	u16			min_apid;
> +	u16			max_apid;
> +	int			irq;
> +};
...
>  struct spmi_pmic_arb {
>  	void __iomem		*rd_base;
>  	void __iomem		*wr_base;
> -	void __iomem		*intr;
> -	void __iomem		*cnfg;
>  	void __iomem		*core;
>  	resource_size_t		core_size;
>  	raw_spinlock_t		lock;

Can you please move "lock" from "struct spmi_pmic_arb" into "struct
spmi_pmic_arb_bus" and update its usage in the functions below?  The two
SPMI buses within PMIC Arbiter v7 operate entirely independently and
write to separate sets of registers.  As-is, transactions on one bus
would unnecessarily block transactions on the other, leading to a
performance penalty.

>  	u8			channel;
> -	int			irq;
>  	u8			ee;
> -	u32			bus_instance;
> -	u16			min_apid;
> -	u16			max_apid;
> -	u16			base_apid;
> -	int			apid_count;
> -	u32			*mapping_table;
> -	DECLARE_BITMAP(mapping_table_valid, PMIC_ARB_MAX_PERIPHS);
> -	struct irq_domain	*domain;
> -	struct spmi_controller	*spmic;
>  	const struct pmic_arb_ver_ops *ver_ops;
> -	u16			*ppid_to_apid;
> -	u16			last_apid;
> -	struct apid_data	*apid_data;
>  	int			max_periphs;
> +	struct spmi_pmic_arb_bus *bus;
>  };

Thanks,
David Collins


