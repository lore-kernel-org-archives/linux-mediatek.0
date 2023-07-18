Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDA92EB64DA
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 08:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=botXgHX6lvKxI//MS5qCm7ZrIXLhTHjIntqkzLlfZ7E=; b=4VRnrc1cgAtoagTJucyMSIM8uZ
	AiR6ZPB6seCU4hoizkDpVxIWWO6nRSry77Nj6aMa03WT7PeBkOXiRAECRWPnBQrHzUWtA/ymPU+e/
	hwImwNZUqmN6wsNTJCwyXyhOdZbvuKTGl2fXyfg9QhPhWq9TrmYspivB7n37z7Zx0jLCgTIfLrNlE
	Z4ClfUXqTjWXJzQkL5uIYOraUmpnrvBZKRNmAlvVRraOjNRrLTJeEv53yS1Cfua9aQycfeRMcesGI
	D8CCrF9yiUG9IhwKE6yFHuIcJKlKbaoD6bi5viwodPpDx6aWYugxaDlrXbDVy1YNQsOKOc4H2STXB
	cR08ibsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM2GN-006FI9-29;
	Wed, 19 Jul 2023 08:10:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM2GM-006FGm-06;
	Wed, 19 Jul 2023 08:10:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=botXgHX6lvKxI//MS5qCm7ZrIXLhTHjIntqkzLlfZ7E=; b=Sq8nUttjpdpn/odb3v02zII1p9
	kwQ0Nn7uhJ8MTr3QwLCpObk8xcCFhXLke8Gif0cgm+bqzww1HJIfFnvBaL7nsEpIKyRF23Jzlrxn4
	N5pqmLEDW0BUhNMgIOfxLJQu9KtZLXWWxVhaFWA+tNnMb7zelW5aPdDOZp5cG6W2Lybzb35OaSSGe
	wbT8N3vT2myezytFEefBazKzIuf358xMLCyCodaIgG0cKVeDuh1BHMf0K1mhKUCMmEFbaiTUyg5Rw
	1oaZjiFU2j0wftt2sWucm6N/CCPHLfIq7jvvLCAywYqgwmC31ZO4s7bdv2oVCh68Ts9pzrqDegn2w
	Tfl09c2Q==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLdZv-00BBtb-0l;
	Tue, 18 Jul 2023 05:48:58 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36I5eYYS008122;
	Tue, 18 Jul 2023 05:47:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=botXgHX6lvKxI//MS5qCm7ZrIXLhTHjIntqkzLlfZ7E=;
 b=J+4F8hVZ9+BwXwycxS77FsGp/9CE9z+niHIhfkHXTTN1u1B5I4Gz8RZIfz2g9YRSZyaQ
 5IiMd2Ea9PRZk6tya8+iagYVyPCKHdbDI2z83Gs9Ba+CD76fhvJylaXLGJnCqNeBfKQJ
 TMFPlfaII/AgZHC2l1sB5BXV/3ltQJs5X6IaC+VqPDuLi6bz8Q8VeDlXA/woLuHyfixM
 jrPmvjMPTJxYoLQCz8PZH0LHT5JpIGFLF7xPcpHJj9wHDK0+kg44VLM0N1yPA8Sd+jrY
 H5i+W5aKvBQ66myjQAIbg/pvcTFLjzepU0hhJEb+ERLTXctjzZFJdewjSntr9XPMHNkl sA== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rwfj78jh8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jul 2023 05:47:29 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36I5lSOk009126
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jul 2023 05:47:28 GMT
Received: from [10.216.47.173] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Mon, 17 Jul
 2023 22:47:20 -0700
Message-ID: <e4784d1c-73da-9cda-6aef-d02625e8efd2@quicinc.com>
Date: Tue, 18 Jul 2023 11:17:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 00/21] Add Qualcomm Minidump kernel driver related
 support
To: <linux-samsung-soc@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
CC: Greg KH <gregkh@linuxfoundation.org>, <corbet@lwn.net>,
        <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>, <keescook@chromium.org>, <tony.luck@intel.com>,
        <gpiccoli@igalia.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
        <andy.shevchenko@gmail.com>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-hardening@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
        "Trilok
 Soni" <quic_tsoni@quicinc.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Rob Herring" <robh+dt@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>
References: <1687955688-20809-1-git-send-email-quic_mojha@quicinc.com>
 <2023062814-chance-flounder-f002@gregkh>
 <CAL_JsqLO9yey2-4FcWsaGxijiS6hGL0SH9VoMuiyei-u9=Cv=w@mail.gmail.com>
 <CACRpkda3CJ7G4-wDPkWmzg6nyCoEfG+u2cQH6KXWNjbftd90ow@mail.gmail.com>
 <355de4c7-180d-4edd-b6fd-9c8e29e40e42@quicinc.com>
 <52650970-de78-764f-28e2-ee0115b7d5c6@quicinc.com>
Content-Language: en-US
From: Mukesh Ojha <quic_mojha@quicinc.com>
In-Reply-To: <52650970-de78-764f-28e2-ee0115b7d5c6@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 4MQCr3V3jn7NkD1q7loLspC5CvNWJFhH
X-Proofpoint-ORIG-GUID: 4MQCr3V3jn7NkD1q7loLspC5CvNWJFhH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-17_15,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 mlxlogscore=999 impostorscore=0 clxscore=1011 phishscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307180053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_064856_256133_AC09CAAA 
X-CRM114-Status: GOOD (  18.12  )
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

+ linux-samsung-soc@vger.kernel.org
+ linux-mediatek@lists.infradead.org



On 7/15/2023 5:15 AM, Trilok Soni wrote:
> On 7/5/2023 10:29 AM, Trilok Soni wrote:
>> On 7/4/2023 2:27 AM, Linus Walleij wrote:
>>> On Thu, Jun 29, 2023 at 1:12 AM Rob Herring <robh+dt@kernel.org> wrote:
>>>
>>>> My bigger issue with this whole series is what would this all look
>>>> like if every SoC vendor upstreamed their own custom dumping
>>>> mechanism. That would be a mess. (I have similar opinions on the
>>>> $soc-vendor hypervisors.)
>>>
>>> I agree with Rob's stance.
>>>
>>> I think it would be useful to get input from the hwtracing developers
>>> (Alexander and Mathieu) who faced this "necessarily different" issue
>>> with all the hwtrace mechanisms and found a way out of it. I suspect
>>> they can have an idea of how this should be abstracted.
>>
>> Any mailing list you suggest we expand to so that we get inputs from 
>> the hwtracing developers and maintainers or just look into the 
>> MAINTAINERS file and start an email thread?
>>
>> We are fine to submit the abstract for the LPC in next two weeks, but 
>> prefer to have lot of good discussion before it on the mailing list, 
>> so that we have code to talk about in LPC.
> 
> We have submitted abstract at LPC MC. Let's continue the discussion here 
> though.
> 
> Mukesh, do you want to expand the lists as necessary to see if other 
> soc-vendors are having any inputs here? May be add Exynos or MTK kernel 
> mailing lists + linux-kernel? I don't know if anyone will respond or 
> not, but let's try.

Sure.

-Mukesh
> 
> ---Trilok Soni
> 

