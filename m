Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ED48EDEC71
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Sep 2023 15:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DMmTuX4BUuWS71fg2UcymHdYuzTLXzic08tXaQHFJkE=; b=yiZySfwp/29V5TVB4Jc9kVFr6i
	0QdrnUTUG24gTtEu/AYY+c+/DVeiBwjcBze3fsBAmC8+eBnD/geA3i43cEaZ2jjh6W/z0sCaunXtr
	dRFpBY2OV1DGduKwT661Kua2h8wjcCqfskIstPnR4bPXNT7Pc+7cTsMimF1gqm3EIehk7jLYJ4mgw
	NRdCGcK4C3InZsnLiOW8BtgE9ebEHpMYlISwBTtHEvkNy9UaX0CmKB+9mfWEUEUz5UFqZtyzQhjaP
	N5Q0spWj+PtXf7qXoBOJazepkpOXqKQny+ogS9AV2RZDHF95kbXX5Ljywg7DXWv1jNSgT+PqTj+R9
	7rjjX+JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgReH-006Cl5-0J;
	Wed, 13 Sep 2023 15:19:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgReE-006Ckg-0I;
	Wed, 13 Sep 2023 15:19:23 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38DEnsnh019322;
	Wed, 13 Sep 2023 15:18:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=DMmTuX4BUuWS71fg2UcymHdYuzTLXzic08tXaQHFJkE=;
 b=WKJFL+yVdMYVyWo+0mT5jzwKC14sNMa8xFF3QB8uIZkVOTAGBV+pYc+IHz4T4Ajr+s9R
 E9qSIkMrLyFXn860cgrx2nqnUJlKlg+UXGukFB7EZQsSYx56AmrdqoB7OKaJC5UPrmcR
 FVRVPYtVn3uv/34PIPn6qi6tSnZDv++gJnxThPAyw1UAghSI2Qn/VkH9UjK6Gu1CPsFf
 nRmM9XrE178nMeybkQmS17kclJ4soqJItMluEuit8poP2DsU6xjm9BdD2I1mJNqsyACE
 EA/kKAkXO6KAYZDhCAu2pi42eC9AEa1IGCoudSHHHEyKrtPozIlWXp16fCbVQucJUyCu PQ== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t2y8q1xfp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Sep 2023 15:18:48 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38DFIlhM025985
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Sep 2023 15:18:47 GMT
Received: from [10.216.62.56] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Wed, 13 Sep
 2023 08:18:34 -0700
Message-ID: <5e5359d0-6f32-7312-b344-2d84be63d03d@quicinc.com>
Date: Wed, 13 Sep 2023 20:48:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v5 06/17] soc: qcom: Add Qualcomm APSS minidump kernel
 driver
Content-Language: en-US
To: Jeff Johnson <quic_jjohnson@quicinc.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        <corbet@lwn.net>, <agross@kernel.org>, <andersson@kernel.org>,
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
 <36d9bd32-7ea4-4d84-b1e9-3cfcc3bec85c@quicinc.com>
From: Mukesh Ojha <quic_mojha@quicinc.com>
In-Reply-To: <36d9bd32-7ea4-4d84-b1e9-3cfcc3bec85c@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: fZxGkFPM9RluezOm5Frm40HM8FUFEa5k
X-Proofpoint-GUID: fZxGkFPM9RluezOm5Frm40HM8FUFEa5k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-13_08,2023-09-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 adultscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 spamscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309130124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_081922_249174_E287314C 
X-CRM114-Status: GOOD (  14.61  )
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



On 9/12/2023 12:39 AM, Jeff Johnson wrote:
> On 9/11/2023 4:07 AM, Krzysztof Kozlowski wrote:
>> On 09/09/2023 22:16, Mukesh Ojha wrote:
>>> +/**
>>> + * qcom_minidump_region_register() - Register region in APSS 
>>> Minidump table.
>>> + * @region: minidump region.
>>> + *
>>> + * Return: On success, it returns 0 and negative error value on 
>>> failure.
>>> + */
>>> +int qcom_minidump_region_register(const struct qcom_minidump_region 
>>> *region)
>>> +{
>>> +    struct minidump *md;
>>> +    int ret;
>>> +
>>> +    md = qcom_smem_minidump_ready();
>>> +    if (!md)
>>> +        return -EPROBE_DEFER;
>>> +
>>> +    if (!qcom_minidump_valid_region(region))
>>> +        return -EINVAL;
>>> +
>>> +    mutex_lock(&md->md_lock);
>>> +    ret = qcom_md_region_register(md, region);
>>> +    if (ret)
>>> +        goto unlock;
>>> +
>>> +    qcom_md_update_elfheader(md, region);
>>> +unlock:
>>> +    mutex_unlock(&md->md_lock);
>>> +    return ret;
>>> +}
>>> +EXPORT_SYMBOL_GPL(qcom_minidump_region_register);
>>
>> NAK, there is no user for this.
>>
>> Drop all exports from minidump drivers. Your upstream driver *must not*
>> expose stuff to your vendor drivers.
> 
> Do we not expect that upstream drivers would want to register?

As of current version of patch, there is no user. Let's avoid till
any upstream QCOM driver uses it .


> Mind you, in the downstream code the following was a bad limitation:
> #define MAX_NUM_OF_SS           10

I don't think, there is any problem with above macro, instead there is
restriction on total number of APSS region can be registered.

#define MAX_NUM_ENTRIES	  201

-Mukesh
> 
> 

