Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85D53C27C55
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jun 2024 14:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/UQQ9H++oZe+xwgJihFR6a+g++Sf6h5Yv7IgtvZo3fk=; b=J4fFk4rAc0zJoAbgy6PKbDcp2F
	P3A7BySbf2gtG3dZ2jP8IX2h21emt+fyUetjCz5V1LB24bEPLL/qiN29yNEkxO2uMx6KyASFqPUUM
	wGyVFMbKh5NBF6fbvB3y1I2OXTiVGuLVip6dU2x+TstYfIBEmInGv9cE6GPiWn+D3fvj54kXjDSyo
	duPyur0KcgWQ+UIwScE1jpcS8xk0TuQryDI44ZvBKmFSG5FBxy/lsUuQg9p85T9otunwEUbeCdCLP
	Na/f4Q4Uhsx72ljsYX/Kb6Rhw4FwBB+DBKrNwNYlAJK7qKS8lMnbYKwRS4vIRC7Q5BSfvxKqaJYzU
	gLeP+Qww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGgFD-00000005TEF-43s8;
	Mon, 10 Jun 2024 14:43:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGgFA-00000005TD7-0qxa;
	Mon, 10 Jun 2024 14:43:33 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45A0FHmi002948;
	Mon, 10 Jun 2024 14:43:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/UQQ9H++oZe+xwgJihFR6a+g++Sf6h5Yv7IgtvZo3fk=; b=ENvOjd4sXGajIdHU
	+7e/xb3ey0KYVCPCPva0Ih461Egi/g+FaTRqpZQlKdFRaqWlQDVMB8+/Kc2ZCuQR
	HDTburlqOnhEfnwRELlqnmE8lQfmb+z0oTubku4tpGHtiPFeTUbAzFNtG1vvlDZa
	SInmOrRv9Igxhgjsyz/6ATA52KGs7KBXOO1ikwnIwu47gdzSADGiUkgnajTRomLb
	sYvj6kEJnHZbBbrpPcxVuXgerpNsH6CBgt/1jn3JYb1RoTmZ3370V+G7oT1THiB7
	npKJFOwOfXkdPWkllG+47XChiBgkLBk1k+PL3BXzzMaI5sb7fT9CnLWnxS4tteiH
	JTz6kA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ymg2ekx98-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jun 2024 14:43:22 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45AEhLg1028882
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jun 2024 14:43:21 GMT
Received: from [10.48.242.196] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 10 Jun
 2024 07:43:20 -0700
Message-ID: <15a49eeb-aeca-4bd7-8761-5e42fe30aee3@quicinc.com>
Date: Mon, 10 Jun 2024 07:43:19 -0700
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
X-Proofpoint-ORIG-GUID: ziACR76-LJqII_3YKXKQuU1PmWJvYdmL
X-Proofpoint-GUID: ziACR76-LJqII_3YKXKQuU1PmWJvYdmL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-10_02,2024-06-10_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 adultscore=0 lowpriorityscore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406100112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_074332_280211_E127D672 
X-CRM114-Status: GOOD (  12.82  )
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

Your v5 looks fine to me:

+MODULE_AUTHOR("AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>");
+MODULE_AUTHOR("Dawei Chien <dawei.chien@mediatek.com>");
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("MediaTek DVFSRC driver");



