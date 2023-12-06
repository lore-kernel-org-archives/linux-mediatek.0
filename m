Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE587C4167B
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Dec 2023 14:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QG7okk0DW5cV2WX4FjsH7Jm7c1uVFG7K9CMd5t4kVqM=; b=dJF4/loI5fTWKrJe37VkHlpZ2X
	D5aX3CkO4x1ImCsBVHm97lPeLF17UepCUfWJB1Li8Gergyvz1YY0cGmixaw7CmRSRXr0v4OLUNbNC
	Ot+d1dbP8zHRb5j9VE0J6SbNVqDWBKWJmBD4z0/sydglhVtSevFOlws3zr5iNS4myfUfqvMWxxkJj
	vhcEdS3cqubFuTNwZX3FKQGE+LwBJN3VgFrCooPiQjLYgTFMv5VmP2hfGcJQvmAA8hg1RWKrFupry
	VCTjtxgZWlge3WbxGwJl1xg+vlDOBZ+YPOdhRTLxw++ov9vZWzi8Mo8cRicjT73VT1vJDw87m9+K1
	TfkdI+IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAsW4-00AS63-2N;
	Wed, 06 Dec 2023 14:04:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAsW0-00AS5f-3C;
	Wed, 06 Dec 2023 14:04:42 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B68bbfK026852;
	Wed, 6 Dec 2023 14:04:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=QG7okk0DW5cV2WX4FjsH7Jm7c1uVFG7K9CMd5t4kVqM=;
 b=R/EGB0VQNpyP9G8YGeD+aYjHJrPIZ87QLxDYt9FULf6eovzWHcl2GY1i0n2VDA/1UTjs
 1QlfpucLmuR7ky+kKyqdCLOgeN0l2LZ2oFZIXMEFyrmxop3EgFqgGoma/dT+WiAlbKYR
 Ek2Yh33hMuvU4PiYFkhVAea0D2r2+hpI0f03DLa8AbIJzb/O50TsHHK/cym9sCFvVaT9
 l5/+wSqbXa9Gonryq3rz5CUuOYGUeE1ycfUIG4OoY3lXpgzfG6LQYcvD8MVcvGT3NTSl
 UK4NyeTiwh/F/4wYDz0DncNzI/xrxNqBzoUCmBzgH33Ez/aE/GVXoP/nowRQLXuZyLDv xw== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3utd1n1yy2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Dec 2023 14:04:19 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B6E4HoZ025004
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 6 Dec 2023 14:04:18 GMT
Received: from [10.218.37.200] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 6 Dec
 2023 06:02:57 -0800
Message-ID: <b9373252-710c-4a54-95cc-046314796960@quicinc.com>
Date: Wed, 6 Dec 2023 19:32:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/3] ufs: core: Add CPU latency QoS support for ufs
 driver
Content-Language: en-US
To: Bart Van Assche <bvanassche@acm.org>,
        "James E.J. Bottomley"
	<jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Peter Wang <peter.wang@mediatek.com>,
        Manivannan Sadhasivam
	<mani@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "Matthias
 Brugger" <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
        <chu.stanley@gmail.com>
CC: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
        <linux-scsi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <quic_cang@quicinc.com>,
        <quic_nguyenb@quicinc.com>, Nitin Rawat <quic_nitirawa@quicinc.com>
References: <20231204143101.64163-1-quic_mnaresh@quicinc.com>
 <20231204143101.64163-2-quic_mnaresh@quicinc.com>
 <590ade27-b4da-49be-933b-e9959aa0cd4c@acm.org>
 <692cd503-5b14-4be6-831d-d8e9c282a95e@quicinc.com>
 <5e7c5c75-cb5f-4afe-9d57-b0cab01a6f26@acm.org>
From: Naresh Maramaina <quic_mnaresh@quicinc.com>
In-Reply-To: <5e7c5c75-cb5f-4afe-9d57-b0cab01a6f26@acm.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: jNdJXZIgOmEwSo1frEafsf1-O-ipzEFK
X-Proofpoint-GUID: jNdJXZIgOmEwSo1frEafsf1-O-ipzEFK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-06_10,2023-12-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999
 phishscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311290000 definitions=main-2312060113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_060441_186125_1E8D42B2 
X-CRM114-Status: GOOD (  16.37  )
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



On 12/5/2023 10:41 PM, Bart Van Assche wrote:
> On 12/4/23 21:58, Naresh Maramaina wrote:
>> On 12/5/2023 12:30 AM, Bart Van Assche wrote:
>>> On 12/4/23 06:30, Maramaina Naresh wrote:
>>>> +    /* This capability allows the host controller driver to use the 
>>>> PM QoS
>>>> +     * feature.
>>>> +     */
>>>> +    UFSHCD_CAP_PM_QOS                = 1 << 13,
>>>>   };
>>>
>>> Why does it depend on the host driver whether or not PM QoS is
>>> enabled? Why isn't it enabled unconditionally?
>>
>> For some platform vendors power KPI might be more important than 
>> random io KPI. Hence this flag is disabled by default and can be 
>> enabled based on platform requirement.
> 
> How about leaving this flag out unless if a host vendor asks explicitly
> for this flag?

IMHO, instead of completely removing this flag, how about having
flag like "UFSHCD_CAP_DISABLE_PM_QOS" which will make PMQOS enable
by default and if some host vendor wants to disable it explicitly,
they can enable that flag.
Please let me know your opinion.

>>>
>>>> + * @pm_qos_req: PM QoS request handle
>>>> + * @pm_qos_init: flag to check if pm qos init completed
>>>>    */
>>>
>>> Documentation for pm_qos_init is missing.
>>>
>> Sorry, i didn't get your comment, i have already added documentation 
>> for @pm_qos_init, @pm_qos_req variable as above. Do you want me to add 
>> this information some where else as well?
> 
> Oops, I meant 'qos_vote'.

Sure. I'll take of this in next patchset.

> 
> Thanks,
> 
> Bart.
> 

Thanks,
Naresh

