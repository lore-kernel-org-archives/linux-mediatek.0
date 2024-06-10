Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A290C27C55
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jun 2024 14:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IT8sPCRCYHphIwu7Jr5FVfrM/uRqAW7zaQPKoTJM2lQ=; b=COC1YuVWRxQ4Y6IB47GN5sM6kh
	1ptXC6A3fkpDNZMRtDNKf4d08Um1iCpSgN6pjOzaeWg42CcETw4XuUQvGOJybGfK9rVFLnYXTRIGM
	bg1Mrx48eirlCoC480e0aZfcbvIO6BlxnDt1TU1EKUt7hGJT7upXNNtAPCY51Zj9NMkLUbWUctNr1
	VQQygvSlkjdr/LobZiUg4Nvrh/tNI7fjtpMydZYA2QtSFRZff2G8n6E8k1VBJzoJgu2bAD3zbiJ+m
	S5pC7aoSrDi99APZXIDaYR0LRtMhkp4DY/hvF01Mh/5oWgJNnRVCDqjoK1BPeJwAULvSsTyfcADri
	Pvpk3xrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGfvS-00000005OoO-2qut;
	Mon, 10 Jun 2024 14:23:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGfvL-00000005On6-3oxN;
	Mon, 10 Jun 2024 14:23:05 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45AEDo6D023208;
	Mon, 10 Jun 2024 14:22:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IT8sPCRCYHphIwu7Jr5FVfrM/uRqAW7zaQPKoTJM2lQ=; b=UaqHKqtPW3jvY39j
	JndvfGxIJZFmxlLTgjwDalrrLR0gOfjYvfQIabjSSB1QGXfEMWZ+Eon4O0IogWJi
	Aq+E4Ilg4bOjmZbRC7mWdR353ZFPHrCgPuz2t5fTbQRTM2Na0M4eQxHWp1Ncn+9c
	KtYE8ek7nNA76ql43QaSlZAijvQkLPYG8PIky1/I59xCDmZ27s+22I7Wvt3JCKPv
	OtfQXxL1KBbUI9X1JKCcQQuc9Zo4JyU/M9AFDgMvRKXnWPvFrw7acg4lTWVfnG+B
	tSIMXbWx6KWOEJ0tktImemzq+8W3zjRd6UV0ZaNafco8FVt30iUneyUssk6HipGD
	f/pH7A==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ymfcv3tbk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jun 2024 14:22:53 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45AEMqvx032184
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jun 2024 14:22:52 GMT
Received: from [10.48.242.196] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 10 Jun
 2024 07:22:51 -0700
Message-ID: <fdf878a7-a2c9-431e-a5c2-c7ba328c1fb3@quicinc.com>
Date: Mon, 10 Jun 2024 07:22:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] regulator: add missing MODULE_DESCRIPTION() macro
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Support Opensource <support.opensource@diasemi.com>,
        Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Matthias Brugger
	<matthias.bgg@gmail.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <kernel-janitors@vger.kernel.org>
References: <20240608-md-drivers-regulator-v1-1-da338665db7a@quicinc.com>
 <29cb4283-34ef-4c90-ad53-ea572576d3fa@collabora.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <29cb4283-34ef-4c90-ad53-ea572576d3fa@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: su16xLbBd-LTiqBIk09QJuuGuA-ichmC
X-Proofpoint-GUID: su16xLbBd-LTiqBIk09QJuuGuA-ichmC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-10_02,2024-06-10_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 mlxlogscore=999 phishscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406100109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_072304_123799_8E28FFEE 
X-CRM114-Status: GOOD (  18.04  )
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

On 6/10/2024 1:43 AM, AngeloGioacchino Del Regno wrote:
> Il 09/06/24 06:53, Jeff Johnson ha scritto:
>> On x86, make allmodconfig && make W=1 C=1 reports:
>> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/regulator/da9121-regulator.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/regulator/max20411-regulator.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/regulator/rt4831-regulator.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/regulator/tps6286x-regulator.o
>>
>> Add the missing invocation of the MODULE_DESCRIPTION() macro to all files
>> which have a MODULE_LICENSE(). This includes mtk-dvfsrc-regulator.c, which
>> did not produce a warning with the x86 allmodconfig, since it may cause
>> this warning with other configurations.
>>
>> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
>> ---
>>   drivers/regulator/da9121-regulator.c     | 1 +
>>   drivers/regulator/max20411-regulator.c   | 1 +
>>   drivers/regulator/mtk-dvfsrc-regulator.c | 1 +
>>   drivers/regulator/rt4831-regulator.c     | 1 +
>>   drivers/regulator/tps6286x-regulator.c   | 1 +
>>   5 files changed, 5 insertions(+)
>>
>> diff --git a/drivers/regulator/da9121-regulator.c b/drivers/regulator/da9121-regulator.c
>> index 96257551bb12..3571b6242e3a 100644
>> --- a/drivers/regulator/da9121-regulator.c
>> +++ b/drivers/regulator/da9121-regulator.c
>> @@ -1192,4 +1192,5 @@ static struct i2c_driver da9121_regulator_driver = {
>>   
>>   module_i2c_driver(da9121_regulator_driver);
>>   
>> +MODULE_DESCRIPTION("Dialog Semiconductor DA9121/DA9122/DA9220/DA9217/DA9130/DA9131/DA9132 regulator driver");
>>   MODULE_LICENSE("GPL v2");
>> diff --git a/drivers/regulator/max20411-regulator.c b/drivers/regulator/max20411-regulator.c
>> index 8c09dc71b16d..6614e767072f 100644
>> --- a/drivers/regulator/max20411-regulator.c
>> +++ b/drivers/regulator/max20411-regulator.c
>> @@ -161,4 +161,5 @@ static struct i2c_driver max20411_i2c_driver = {
>>   };
>>   module_i2c_driver(max20411_i2c_driver);
>>   
>> +MODULE_DESCRIPTION("Maxim MAX20411 High-Efficiency Single Step-Down Converter driver");
>>   MODULE_LICENSE("GPL");
>> diff --git a/drivers/regulator/mtk-dvfsrc-regulator.c b/drivers/regulator/mtk-dvfsrc-regulator.c
>> index f1280d45265d..1941aad5e247 100644
>> --- a/drivers/regulator/mtk-dvfsrc-regulator.c
>> +++ b/drivers/regulator/mtk-dvfsrc-regulator.c
>> @@ -211,4 +211,5 @@ static void __exit mtk_dvfsrc_regulator_exit(void)
>>   module_exit(mtk_dvfsrc_regulator_exit);
>>   
>>   MODULE_AUTHOR("Arvin wang <arvin.wang@mediatek.com>");
>> +MODULE_DESCRIPTION("MediaTek DVFSRC regulator driver");
> 
> Can you please drop this one?
> I have a series floating that is removing this driver entirely and replacing it
> with a refactored one. Though, it has the same issue, so I'll have to send a v6.
> 
> Anyway, v5 is there:
> 
> https://lore.kernel.org/r/20240424095416.1105639-1-angelogioacchino.delregno@collabora.com
> 
> 
>>   MODULE_LICENSE("GPL v2");
>> diff --git a/drivers/regulator/rt4831-regulator.c b/drivers/regulator/rt4831-regulator.c
>> index 97e6f7e2a0ba..7d1ba0c82271 100644
>> --- a/drivers/regulator/rt4831-regulator.c
>> +++ b/drivers/regulator/rt4831-regulator.c
>> @@ -202,4 +202,5 @@ static struct platform_driver rt4831_regulator_driver = {
>>   module_platform_driver(rt4831_regulator_driver);
>>   
>>   MODULE_AUTHOR("ChiYuan Huang <cy_huang@richtek.com>");
>> +MODULE_DESCRIPTION("Richtek RT4831 DSV RegulatorsRichtek RT4831 DSV Regulators driver");
> 
> Also, there's a typo here :-)
> 
> After dropping mtk-dvfsrc-regulator changes and after fixing the typo:
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Thanks, will address these in v2

/jeff


