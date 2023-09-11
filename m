Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23AD4EE57DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Sep 2023 08:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6rPP/oyLv+DfB2DvzWmhNfrkCcAKlx6hjXYBTO7KNhM=; b=yPiqQTAyMFvwHnNIjBz1smNMUs
	nni09DRidB66GLe71bYpAas6D3PYqrGVB72nbqXaNCEUAe6pSA9cME4kjiBsa/cq+ukN7/yftNJo3
	1BgYLa7EZ4uNJpd72+sBaVcDzACefJiNxssZ/HRVlcZ97qKFfxDVU+vSlBKDCLyjEG1pSPfN4g+3G
	FtzhmLjWaRcUmvOT29E7nZP6MhicpPeGY0z+FwdgOeHvS+Cdn3khx/IWGlcxQo5UGL/HbjNToCS6P
	s+x2N99ZBKq6QUbqSgHNqOEa8ctiiKsF7i92YTCZ/Wd6J52BlwvxTTUnd/vLIaY0LeILHSg/GG8ZD
	d4QSYUSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfc2K-00HWET-0T;
	Mon, 11 Sep 2023 08:12:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfc2H-00HWE0-2P;
	Mon, 11 Sep 2023 08:12:47 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38B7bWL8016890;
	Mon, 11 Sep 2023 08:12:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=6rPP/oyLv+DfB2DvzWmhNfrkCcAKlx6hjXYBTO7KNhM=;
 b=hIc9QCuhz3e5PZMVDH9o73rY833f9J3ijuppLllKwgSocYgnK1Y3lTkHwYFrmfQk06/W
 A9bP/Lr6lZFa/xHl9ZIVw0y/FKyjSPMcasifN74BFnHlbfixPwOm3lKhefqGtemBN37u
 K9FK6l3chePj3+qlHkhJfuLLWXdRWnu6NwSGPTzBcNfaT9n75MvR04crY8rSuwIxtz66
 JpomuzIaQDXdMYnafyafzhws1QgpOk0aLIGENRZeMlMyyR+wz+/uXHu26pN4SYhBSMa+
 EJ8mm1Thtav2bmuMa4O25Nffdli2N+jT+XM33OsRd708MkEMIVfX3BF0ev7fqr0Hvu2I jQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t0ga6jtr5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Sep 2023 08:12:29 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38B8C78X027237
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Sep 2023 08:12:08 GMT
Received: from [10.201.2.96] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Mon, 11 Sep
 2023 01:11:56 -0700
Message-ID: <32c6708d-a5a9-420e-bfb8-08ea11b3eb1e@quicinc.com>
Date: Mon, 11 Sep 2023 13:41:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 13/17] firmware: qcom_scm: provide a read-modify-write
 function
Content-Language: en-US
From: Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>
To: Mukesh Ojha <quic_mojha@quicinc.com>, <corbet@lwn.net>,
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
 <1694290578-17733-14-git-send-email-quic_mojha@quicinc.com>
 <9d9bba92-f92e-469a-b0a5-9ca24f5caaca@quicinc.com>
In-Reply-To: <9d9bba92-f92e-469a-b0a5-9ca24f5caaca@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: PHohQQwa3uKW6oMZQgu4uMjAUIRy2Isi
X-Proofpoint-ORIG-GUID: PHohQQwa3uKW6oMZQgu4uMjAUIRy2Isi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-11_05,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 malwarescore=0 mlxscore=0
 mlxlogscore=999 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309110074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_011245_905229_80C7BCF9 
X-CRM114-Status: GOOD (  20.50  )
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


On 9/11/2023 1:38 PM, Kathiravan Thirumoorthy wrote:
>
> On 9/10/2023 1:46 AM, Mukesh Ojha wrote:
>> It was realized by Srinivas K. that there is a need of
>> read-modify-write scm exported function so that it can
>> be used by multiple clients.
>>
>> Let's introduce qcom_scm_io_update_field() which masks
>> out the bits and write the passed value to that
>> bit-offset. Subsequent patch will use this function.
>>
>> Suggested-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
>> ---
>
>
> Validated this change on IPQ9574 and IPQ53332 and system is entering 
> into the download mode.
>
> Tested-by: Kathiravan Thirumoorthy <quic_kathirav@quicinc.com> # 
> IP9574 and IPQ5332


Couple of typos. Apologize...

Validated this change on IPQ9574 and IPQ5332 and system is entering into 
the download mode.

Tested-by: Kathiravan Thirumoorthy <quic_kathirav@quicinc.com> # IPQ9574 
and IPQ5332


>
>
>>   drivers/firmware/qcom_scm.c            | 20 ++++++++++++++++++++
>>   include/linux/firmware/qcom/qcom_scm.h |  2 ++
>>   2 files changed, 22 insertions(+)
>>
>> diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
>> index fde33acd46b7..5ea8fc4fd4e8 100644
>> --- a/drivers/firmware/qcom_scm.c
>> +++ b/drivers/firmware/qcom_scm.c
>> @@ -78,6 +78,7 @@ static const char * const 
>> qcom_scm_convention_names[] = {
>>   };
>>     static struct qcom_scm *__scm;
>> +static DEFINE_SPINLOCK(lock);
>>     static int qcom_scm_clk_enable(void)
>>   {
>> @@ -407,6 +408,25 @@ int qcom_scm_set_remote_state(u32 state, u32 id)
>>   }
>>   EXPORT_SYMBOL(qcom_scm_set_remote_state);
>>   +int qcom_scm_io_update_field(phys_addr_t addr, unsigned int mask, 
>> unsigned int val)
>> +{
>> +    unsigned int old, new;
>> +    int ret;
>> +
>> +    spin_lock(&lock);
>> +    ret = qcom_scm_io_readl(addr, &old);
>> +    if (ret)
>> +        goto unlock;
>> +
>> +    new = (old & ~mask) | (val & mask);
>> +
>> +    ret = qcom_scm_io_writel(addr, new);
>> +unlock:
>> +    spin_unlock(&lock);
>> +    return ret;
>> +}
>> +EXPORT_SYMBOL_GPL(qcom_scm_io_update_field);
>> +
>>   static int __qcom_scm_set_dload_mode(struct device *dev, bool enable)
>>   {
>>       struct qcom_scm_desc desc = {
>> diff --git a/include/linux/firmware/qcom/qcom_scm.h 
>> b/include/linux/firmware/qcom/qcom_scm.h
>> index 250ea4efb7cb..ca41e4eb33ad 100644
>> --- a/include/linux/firmware/qcom/qcom_scm.h
>> +++ b/include/linux/firmware/qcom/qcom_scm.h
>> @@ -84,6 +84,8 @@ extern bool qcom_scm_pas_supported(u32 peripheral);
>>     extern int qcom_scm_io_readl(phys_addr_t addr, unsigned int *val);
>>   extern int qcom_scm_io_writel(phys_addr_t addr, unsigned int val);
>> +extern int qcom_scm_io_update_field(phys_addr_t addr, unsigned int 
>> mask,
>> +                    unsigned int val);
>>     extern bool qcom_scm_restore_sec_cfg_available(void);
>>   extern int qcom_scm_restore_sec_cfg(u32 device_id, u32 spare);

