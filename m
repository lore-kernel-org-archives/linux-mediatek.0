Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10103C27C55
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jun 2024 14:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YerxaNiDrqT++v3tBHV72ahDavLdzSNSM69xaGAmvMA=; b=FYFK+JAlnsOAClpBbql3tOPOIy
	9isf6ZDhXEh4tMgCFKsIEza07iOd9kAuEiN6Ot6mplaLBO/dpX1Lri+xrELCNyXCN4HkbIymODfHL
	5vn5W+KjOAafqGyzr4oMfy3Cs/R6vXfR+UC6zMDCh38/oWWKoHzeQtq5OPh97BJ2xcUP/Q5RhW0+/
	D9rcn4dfk3rTCzPMjrYiMhWbkDJvTNA145gy4mTIgSBegyRQeluOHQA/ZN7BRt//smT5J/iPEh+xY
	XVg0Vqk+ql6zHcZAli8RLHouT6ox78kr4tUQcj9OzOpUXPT9Skf8mJ5cXAP8/+BEjJYYrnfukSIXu
	fpbJTiTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGgG6-00000005TRW-34nl;
	Mon, 10 Jun 2024 14:44:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGgG2-00000005TPR-1e5D;
	Mon, 10 Jun 2024 14:44:28 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45ADUbtR029624;
	Mon, 10 Jun 2024 14:44:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YerxaNiDrqT++v3tBHV72ahDavLdzSNSM69xaGAmvMA=; b=Pw43uUedZ8KuOXS1
	/oNwR7m0GP/Kt6W/0Fbq9TGDv3JR19mDb2ibvMKGY/lln1YHY8iKFdt9Az9Fm1fx
	X74gWD12Mrm9hbEcYMbHaXQ9X8f0jJ4EVr/jRZt6PGKDmRT6Y1XHSWCmDuv5RAzV
	6UKlt3qxurrWT5PnoMtb4ilDlQbOd1qlsl+c5QYuILroXvvpFfX6YlOQbxDYNMG/
	c/VJyVK03aBcQJ5TzjAwsQLtZOsHdCRX/45XmaNPNpmHKqzYOGfpx6hGF086Ubk6
	fzeb6Oo5PMLhriIJaXJXzaY7Tz1mJgFl38jHVD4XPY8IPEi0up4hWlGBmc4qVLqv
	KoOsgg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ymea6kwcu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jun 2024 14:44:20 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45AEiIwZ012751
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jun 2024 14:44:18 GMT
Received: from [10.48.242.196] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 10 Jun
 2024 07:44:17 -0700
Message-ID: <ea5c6e03-3821-4808-9681-ea5576c65391@quicinc.com>
Date: Mon, 10 Jun 2024 07:44:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pwm: add missing MODULE_DESCRIPTION() macros
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
        Shawn Guo
	<shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix
 Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        Matthias Brugger
	<matthias.bgg@gmail.com>
CC: <linux-pwm@vger.kernel.org>, <imx@lists.linux.dev>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-samsung-soc@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <kernel-janitors@vger.kernel.org>
References: <20240607-md-drivers-pwm-v1-1-27237a2bec6a@quicinc.com>
 <ca6b4ce2-4ebf-409d-b87d-2024445b9392@collabora.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <ca6b4ce2-4ebf-409d-b87d-2024445b9392@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: BZzjFM6FFRhPIg51RXBqh8PoY2xZ714Q
X-Proofpoint-ORIG-GUID: BZzjFM6FFRhPIg51RXBqh8PoY2xZ714Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-10_02,2024-06-10_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 spamscore=0 phishscore=0 mlxlogscore=999 clxscore=1015 lowpriorityscore=0
 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406100112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_074426_631599_C661E95D 
X-CRM114-Status: GOOD (  18.86  )
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

On 6/10/2024 1:06 AM, AngeloGioacchino Del Regno wrote:
> Il 07/06/24 18:02, Jeff Johnson ha scritto:
>> make allmodconfig && make W=1 C=1 reports:
>> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pwm/pwm-imx1.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pwm/pwm-imx27.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pwm/pwm-intel-lgm.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pwm/pwm-mediatek.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pwm/pwm-pxa.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pwm/pwm-samsung.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pwm/pwm-spear.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pwm/pwm-visconti.o
>>
>> Add the missing invocations of the MODULE_DESCRIPTION() macro.
>>
>> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
>> ---
>> This addresses all of the issues in driver/pwm
>>
>> Let me know if you want any of the individual module changes
>> segregated into separate patches.
>> ---
>>   drivers/pwm/pwm-imx1.c      | 1 +
>>   drivers/pwm/pwm-imx27.c     | 1 +
>>   drivers/pwm/pwm-intel-lgm.c | 1 +
>>   drivers/pwm/pwm-mediatek.c  | 1 +
>>   drivers/pwm/pwm-pxa.c       | 1 +
>>   drivers/pwm/pwm-samsung.c   | 1 +
>>   drivers/pwm/pwm-spear.c     | 1 +
>>   drivers/pwm/pwm-visconti.c  | 1 +
>>   8 files changed, 8 insertions(+)
>>
> 
> ..snip..
> 
>> diff --git a/drivers/pwm/pwm-mediatek.c b/drivers/pwm/pwm-mediatek.c
>> index 19a87873ad60..0b5d68a90e83 100644
>> --- a/drivers/pwm/pwm-mediatek.c
>> +++ b/drivers/pwm/pwm-mediatek.c
>> @@ -395,4 +395,5 @@ static struct platform_driver pwm_mediatek_driver = {
>>   module_platform_driver(pwm_mediatek_driver);
>>   
>>   MODULE_AUTHOR("John Crispin <blogic@openwrt.org>");
>> +MODULE_DESCRIPTION("MediaTek Pulse Width Modulator driver");
> 
> MediaTek SoCs have got two different PWM IPs, one of which is used exclusively
> for the Display PWM, and it is located in the DDP block.
> 
> So, there are two PWM IPs in one SoC:
>   - A general purpose PWM IP
>   - A DDP PWM IP
> 
> This driver is for the general purpose PWM IP.. so, please, can we change this
> to "MediaTek general purpose Pulse Width Modulator driver"?
> 
> After which,
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
>>   MODULE_LICENSE("GPL v2");
> 
Sure, I'll update these in v2

