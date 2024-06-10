Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C8CAC27C55
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jun 2024 14:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=773pQf40WEFcUjWibw27sM8RmGgqxd1j76oenfdCpJQ=; b=q6ORIIc395BX0LzjigbvUxIACF
	LjfLxonuXOYa0PYboS/X3+EcAGq2cLm/LMTXKfW+zacQnqXlm5HdUisJ/h1YTZx+bagMUVx7G1W0r
	1BjhukeQS5P775SipccpohjoPzSEdB1bowI1a2hk37/NgPXwqwywlnejFRLvYgtdbhTdS+R+mNT39
	7+r6Z/FLyrADJQaKfh+JQPK8RKqbbyIg5K+EQfbqvu9+IdpK1R22QiXuXkDuQKhA/3YbySLo/OEwg
	i0H3tk2nOL5QrZc9SP/1+zmdslKILpy49IsRo9gz1vAQOaDDD3VU4DuECTS+wskkggs1Hw7KRo07b
	ZYmt2PKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGgND-00000005VxE-0xNm;
	Mon, 10 Jun 2024 14:51:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGgN9-00000005VvD-2kCj;
	Mon, 10 Jun 2024 14:51:48 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45A1k2N1014061;
	Mon, 10 Jun 2024 14:51:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	773pQf40WEFcUjWibw27sM8RmGgqxd1j76oenfdCpJQ=; b=FJASzE0i3yei5LWQ
	FhK4tTd6kJFDiPloLmDqUniEEBQ3MJ3HQLgMVGw9slJkTEgNvFSbY0os5SSFyVj0
	cEPX1IhxR3jitqveKagXYEa2EGR/zHi/4GoozIbIJGAZUqREU9g3sQpTM+TS8//g
	abE9EtMwtgDDUtF6cCrBaIFsFoTnPmUTSzpqRWLBwafkDviRDAILf0mHO9dbhKOz
	RZ3iaPgNPUHUFjZ4LPdXArkAJ1a9b4cRqO8sA0ko3rU2pn/lZ74h1/syJPTRCtvc
	LLYnbhcWCXGA91x6oaG2bJ/zUcIXYv9P65BLzyOOMxFNqb+G+mp6yn+UEVOKEES1
	Fm4JUg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ymg2ekxv7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jun 2024 14:51:42 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45AEpfLP006698
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jun 2024 14:51:41 GMT
Received: from [10.48.242.196] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 10 Jun
 2024 07:51:40 -0700
Message-ID: <e730c786-86b9-4362-986d-cfe37ef33753@quicinc.com>
Date: Mon, 10 Jun 2024 07:51:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pwm: add missing MODULE_DESCRIPTION() macros
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam
	<festevam@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar
	<alim.akhtar@samsung.com>,
        Nobuhiro Iwamatsu
	<nobuhiro1.iwamatsu@toshiba.co.jp>,
        Matthias Brugger
	<matthias.bgg@gmail.com>,
        <linux-pwm@vger.kernel.org>, <imx@lists.linux.dev>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-samsung-soc@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <kernel-janitors@vger.kernel.org>
References: <20240607-md-drivers-pwm-v1-1-27237a2bec6a@quicinc.com>
 <ca6b4ce2-4ebf-409d-b87d-2024445b9392@collabora.com>
 <g5u7xk2l625vu6dxleonlmshnwqoge5fiaigbqlcedayu2rate@o4vgz7g27vlv>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <g5u7xk2l625vu6dxleonlmshnwqoge5fiaigbqlcedayu2rate@o4vgz7g27vlv>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: _rEb0ZrrPJdfv-EUvA8XxWBacA4VddRP
X-Proofpoint-GUID: _rEb0ZrrPJdfv-EUvA8XxWBacA4VddRP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-10_02,2024-06-10_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 clxscore=1011 adultscore=0 lowpriorityscore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406100113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_075147_728267_6DEF98DC 
X-CRM114-Status: GOOD (  18.05  )
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

On 6/10/2024 2:05 AM, Uwe Kleine-König wrote:
> Hello,
> 
> On Mon, Jun 10, 2024 at 10:06:49AM +0200, AngeloGioacchino Del Regno wrote:
>> Il 07/06/24 18:02, Jeff Johnson ha scritto:
>>> [...]
>>> diff --git a/drivers/pwm/pwm-mediatek.c b/drivers/pwm/pwm-mediatek.c
>>> index 19a87873ad60..0b5d68a90e83 100644
>>> --- a/drivers/pwm/pwm-mediatek.c
>>> +++ b/drivers/pwm/pwm-mediatek.c
>>> @@ -395,4 +395,5 @@ static struct platform_driver pwm_mediatek_driver = {
>>>   module_platform_driver(pwm_mediatek_driver);
>>>   MODULE_AUTHOR("John Crispin <blogic@openwrt.org>");
>>> +MODULE_DESCRIPTION("MediaTek Pulse Width Modulator driver");
>>
>> MediaTek SoCs have got two different PWM IPs, one of which is used exclusively
>> for the Display PWM, and it is located in the DDP block.
>>
>> So, there are two PWM IPs in one SoC:
>>  - A general purpose PWM IP
>>  - A DDP PWM IP
>>
>> This driver is for the general purpose PWM IP.. so, please, can we change this
>> to "MediaTek general purpose Pulse Width Modulator driver"?
>>
>> After which,
>>
>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> Looks like a reasonable request.
> 
> @Jeff: Can you please resend with the suggested change, I dropped the
> patch from for-next now.

No problem, v2 sent.

/jeff


