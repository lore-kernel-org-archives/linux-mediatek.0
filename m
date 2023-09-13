Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA853EDEC72
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Sep 2023 15:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hhvs/8xK+JuOLpQApokzSBRuLPc6gpd16QdQyq90tXo=; b=TgkKduy0QH+x+59COwPma/HJ5n
	YQiRJmW10wAGYWGB0wEjyOWS6j+F0UsHKiLkog8CbNSMTp3ooBtqKGHvhK0myGth1aS2WdLAdm6Rw
	B3b+YDtOCiOrQ9UFCMtHSBWlFzkVlULESYXQofLdr7BaJQhqJ08RAdju30FthFXw4I+0jj7vD8GNR
	TXzyTQMHMHlTrK5Qc/5k5bD85+RvlEdU1NXNaRpbh9ERfW/roUlTQZaxlBFZBfQsYrWQJltjfVjfo
	S5xbEgg3Q7pCY5qAhHQt+c1sNg/xKNfqpXWdptVOhHMfVlCBgma87gmOJVKN24GUxwE6ineDTq2yN
	VIo1vo2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgRgZ-006D4g-37;
	Wed, 13 Sep 2023 15:21:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgRgX-006D3a-1O;
	Wed, 13 Sep 2023 15:21:47 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38DEv7D2000527;
	Wed, 13 Sep 2023 15:21:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Hhvs/8xK+JuOLpQApokzSBRuLPc6gpd16QdQyq90tXo=;
 b=inpRhqRQ9iyqoDLb+SCeLj3L80j0aaxA65DOSL7deucsFrMyWVH6lBgERO3aaUWgcYQT
 2112QHLgeuGawvyqX+Js7tdyjT7BWofiU0vCQdw/Vnk/pmwQx0p7scH6qqpdv1m60g7Q
 K1ddfsd7ApfcSXfvWhMLMEgZMEywsAXFDpVQ1E7ldVmrMdQz+F5OqYF+agVOUT+yjYrR
 XTytpQcjhOwrUEfYAf0PaFgk/CDf2twRg7CfIG/lmmHXs1vIIlRvf9Njbdw9e5l/7FvR
 fp4z0UxPfifYXOCrFhroXwvlKnBQVUhqltoHKkqlw4+lruXoRAXvlIZvhfjRwi5o1ikL Rg== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t2y7qa59j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Sep 2023 15:21:03 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38DFL2bc031246
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Sep 2023 15:21:02 GMT
Received: from [10.216.62.56] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Wed, 13 Sep
 2023 08:20:49 -0700
Message-ID: <56c0328c-9744-4c69-b0a3-c36cc497fe31@quicinc.com>
Date: Wed, 13 Sep 2023 20:50:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [REBASE PATCH v5 01/17] docs: qcom: Add qualcomm minidump guide
Content-Language: en-US
To: Bagas Sanjaya <bagasdotme@gmail.com>, <corbet@lwn.net>,
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
References: <1694429639-21484-1-git-send-email-quic_mojha@quicinc.com>
 <1694429639-21484-2-git-send-email-quic_mojha@quicinc.com>
 <ZQF_9-nX47QUCycO@debian.me>
From: Mukesh Ojha <quic_mojha@quicinc.com>
In-Reply-To: <ZQF_9-nX47QUCycO@debian.me>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 2gAwxDuhuJ3-P7vtmlbV-ftKdk4OelF4
X-Proofpoint-ORIG-GUID: 2gAwxDuhuJ3-P7vtmlbV-ftKdk4OelF4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-13_09,2023-09-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 malwarescore=0 clxscore=1015 spamscore=0 priorityscore=1501
 mlxlogscore=977 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309130126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_082145_480575_993E42D1 
X-CRM114-Status: GOOD (  16.44  )
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



On 9/13/2023 2:55 PM, Bagas Sanjaya wrote:
> On Mon, Sep 11, 2023 at 04:23:43PM +0530, Mukesh Ojha wrote:
>> +Qualcomm APSS Minidump kernel driver concept
>> +--------------------------------------------
>> +::
>> +
>> <snipped>...
>> +Dump collection
>> +---------------
>> +
>> +	+-----------+
>> +	|           |
>> +	|           |         +------+
>> +	|           |         |      |
>> +	|           |         +--+---+ Product(Qualcomm SoC)
>> +	+-----------+             |
>> +	|+++++++++++|<------------+
>> +	|+++++++++++|    usb cable
>> +	+-----------+
>> +            x86_64 PC
>> +
> 
> Sphinx reports htmldocs warnings:
> 
> /home/bagas/repo/linux-kernel/Documentation/admin-guide/qcom_minidump.rst:100: WARNING: Literal block expected; none found.
> /home/bagas/repo/linux-kernel/Documentation/admin-guide/qcom_minidump.rst:243: WARNING: Unexpected indentation.
> /home/bagas/repo/linux-kernel/Documentation/admin-guide/qcom_minidump.rst:234: WARNING: Malformed table.
> 
> +-----------+
> |           |
> |           |         +------+
> |           |         |      |
> |           |         +--+---+ Product(Qualcomm SoC)
> +-----------+             |
> |+++++++++++|<------------+
> |+++++++++++|    usb cable
> +-----------+
> /home/bagas/repo/linux-kernel/Documentation/admin-guide/qcom_minidump.rst:243: WARNING: Blank line required after table.
> 
> I have to apply the fixup:
> 
> ---- >8 ----
> diff --git a/Documentation/admin-guide/qcom_minidump.rst b/Documentation/admin-guide/qcom_minidump.rst
> index 20202da8ca40b9..5709a3853ae7ea 100644
> --- a/Documentation/admin-guide/qcom_minidump.rst
> +++ b/Documentation/admin-guide/qcom_minidump.rst
> @@ -95,7 +95,6 @@ could be anywhere scattered in the DDR.
>   
>   Qualcomm APSS Minidump kernel driver concept
>   --------------------------------------------
> -::
>   
>   Qualcomm APSS minidump kernel driver adds the capability to add Linux
>   region to be dumped as part of RAM dump collection. At the moment,
> @@ -231,6 +230,8 @@ respective dump as per set download mode.
>   Dump collection
>   ---------------
>   
> +::
> +
>   	+-----------+
>   	|           |
>   	|           |         +------+
> 

Thanks, will take care.


> Thanks.
> 

