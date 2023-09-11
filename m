Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C651C71153
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Sep 2023 19:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yhQj70atmgvOsT2e/TS2qijd+F031F5vj/yr5hSo3NI=; b=JkiJbVufFcGPFvsRz76bhy/e3c
	GJGUViq6T62c3N6KSoXN+vkCvrmZT0hGg6iOq80Iip3jbv2JIy4mvaOW+QUfM4gVc/hHbMY5uUpzK
	gciatLryOji7PWh0ha/YUdF8XoSe3pmEI8Iv3IzZMweQEKtjmYBKe0r+bBzdd7rQQPs0FICxmxa0h
	X0MkkEaTR96Wj+WgZg5aBMUgKVSIGn37pc0DksQaD8Z0o33D/ZSCvfEpw5mWWAurm4H4W6NNiIMIa
	lAU7KcVXt7P4KLXdtHQJdzSYY2NYAFbfKwxkBTzBX+MxLjI9zg3qAnAODNi7oqYDWO7HSTQZob1m/
	QInPo2Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfmIX-001Az1-14;
	Mon, 11 Sep 2023 19:10:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfmIT-001AyS-2s;
	Mon, 11 Sep 2023 19:10:11 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38BGsgtC012385;
	Mon, 11 Sep 2023 19:09:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=yhQj70atmgvOsT2e/TS2qijd+F031F5vj/yr5hSo3NI=;
 b=PMq83McfwsxSX5TjgyapKf9sl6HiVFHrY8Ua0OU0LGSwlf8dDct/0Rf72FodkvRzLYJG
 jdOrbn9zzhlIKX57BFLI/nDFIsvCSLEpFFEi6YlKKPTB6PP/6yAsEbfClZ5nlj1CFq4Z
 8m2N2X+5cUUfzhg+ozceCIl2A2I6Y2/uHHYbgVfT/gHfO9E9A1n/1hOT00yyRg8VZfBJ
 vLZiUpMMWf9vJTcXVEgdxwagMk1+K//S9E/doUQosffx+VyvCsLlHvqBiPcBGhqpCGRv
 d48SRjFEWXsxR0oH4DTJHhhcafze2l36DXy2XQOSwGOgyGQxMHPc7HMMSy/3F51BK9Mq sw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t24ra8r01-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Sep 2023 19:09:37 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38BJ9axL023805
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Sep 2023 19:09:36 GMT
Received: from [10.111.183.71] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Mon, 11 Sep
 2023 12:09:32 -0700
Message-ID: <36d9bd32-7ea4-4d84-b1e9-3cfcc3bec85c@quicinc.com>
Date: Mon, 11 Sep 2023 12:09:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/17] soc: qcom: Add Qualcomm APSS minidump kernel
 driver
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Mukesh Ojha
	<quic_mojha@quicinc.com>, <corbet@lwn.net>,
        <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <keescook@chromium.org>, <tony.luck@intel.com>, <gpiccoli@igalia.com>,
        <mathieu.poirier@linaro.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>, <linus.walleij@linaro.org>,
        <andy.shevchenko@gmail.com>, <vigneshr@ti.com>, <nm@ti.com>,
        <matthias.bgg@gmail.com>, <kgene@kernel.org>,
        <alim.akhtar@samsung.com>, <bmasney@redhat.com>,
        <quic_tsoni@quicinc.com>
CC: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-hardening@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>, <kernel@quicinc.com>
References: <1694290578-17733-1-git-send-email-quic_mojha@quicinc.com>
 <1694290578-17733-7-git-send-email-quic_mojha@quicinc.com>
 <e35a8b4f-ba1a-514e-9c59-a74442f0cb1f@linaro.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <e35a8b4f-ba1a-514e-9c59-a74442f0cb1f@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 7KeKQW4RhvHCzdB5VM5NQ_6O6ebGKDeO
X-Proofpoint-ORIG-GUID: 7KeKQW4RhvHCzdB5VM5NQ_6O6ebGKDeO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-11_14,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 clxscore=1015 mlxscore=0 bulkscore=0 suspectscore=0 phishscore=0
 impostorscore=0 mlxlogscore=999 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309110175
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_121009_935579_2CD07B09 
X-CRM114-Status: GOOD (  15.57  )
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

On 9/11/2023 4:07 AM, Krzysztof Kozlowski wrote:
> On 09/09/2023 22:16, Mukesh Ojha wrote:
>> +/**
>> + * qcom_minidump_region_register() - Register region in APSS Minidump table.
>> + * @region: minidump region.
>> + *
>> + * Return: On success, it returns 0 and negative error value on failure.
>> + */
>> +int qcom_minidump_region_register(const struct qcom_minidump_region *region)
>> +{
>> +	struct minidump *md;
>> +	int ret;
>> +
>> +	md = qcom_smem_minidump_ready();
>> +	if (!md)
>> +		return -EPROBE_DEFER;
>> +
>> +	if (!qcom_minidump_valid_region(region))
>> +		return -EINVAL;
>> +
>> +	mutex_lock(&md->md_lock);
>> +	ret = qcom_md_region_register(md, region);
>> +	if (ret)
>> +		goto unlock;
>> +
>> +	qcom_md_update_elfheader(md, region);
>> +unlock:
>> +	mutex_unlock(&md->md_lock);
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL_GPL(qcom_minidump_region_register);
> 
> NAK, there is no user for this.
> 
> Drop all exports from minidump drivers. Your upstream driver *must not*
> expose stuff to your vendor drivers.

Do we not expect that upstream drivers would want to register?
Mind you, in the downstream code the following was a bad limitation:
#define MAX_NUM_OF_SS           10



