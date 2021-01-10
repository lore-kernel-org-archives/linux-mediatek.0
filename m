Return-Path: <SRS0=wO2S=GN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52340C433DB
	for <linux-mediatek@archiver.kernel.org>; Sun, 10 Jan 2021 18:48:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A18E3227BF
	for <linux-mediatek@archiver.kernel.org>; Sun, 10 Jan 2021 18:48:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A18E3227BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oha+/lnSl9RmriVXhiHND1pW970drUh2BIg3HEMdZo8=; b=pBPlXkM60LyAUvjSpdLX0eVx3
	ZqZ6YZO+VUFHcyo+DGPFJkJqb6xfa3vx8Ns5ZZ8DmmO8kDQPHXlBQD+Yu+J5z0NlCHWqIx4cR//Jy
	HDcXtMkGYnYW/7le8VbLxiHDgqFI0czDdhAW/XrOrg7S5KNLflCmr+AImKvdyHP5rvnbTNPbN3Axp
	HtbYoRfYPEn2OR1Z2oW5q5QHCntlwaE3RGlriT0dBgzHAqC289zBdIFInDrppNTfseagqZjWXMfZ5
	EMIdZR36Ym4yVG+dic8hj8PXPzhBDxHqY9J4i5JdUgDfVwe5GnsECHNjy8OoPHst/Xk4qdP4y6voz
	HecWYGmeA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kyflA-0001Fd-3s; Sun, 10 Jan 2021 18:48:16 +0000
Received: from de-smtp-delivery-102.mimecast.com ([62.140.7.102])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kyfl5-0001DG-SM
 for linux-mediatek@lists.infradead.org; Sun, 10 Jan 2021 18:48:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1610304488;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WVlwN5RgbgYmqrLu2qRybVFfUTYl0f9PNRwvNS28xQ4=;
 b=CR9pEsa1E7RSwLW3YXiEgaZx0+iF0kBzBSWdrSkcxblJYlsS1m9jq5rvsUAmgitlCOSi4I
 ghj0NNBjLstcpWb4EwQihUgnyH5in2yfzObz5tjbWZ4T8MhAruc5GMt3mezTI40OaELIPh
 yTJ4dJMIekTZHp1CjWVX+SrvlXF8Q/U=
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2051.outbound.protection.outlook.com [104.47.12.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-20-0Zegfz3gMZG8B4xunLqtIg-1; Sun, 10 Jan 2021 19:48:06 +0100
X-MC-Unique: 0Zegfz3gMZG8B4xunLqtIg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l01wr7a36HalyY2N2yY1G5LMFvxtQ80TWcKBJp4BqmaexWURI0RAKJtnf/IC7WmEIB08iPHZameoy8DPRZ3cpOVtANBtjz3cPeftqV61JKvom6F1poB3K6ku3PgpbM04MbQhhMYEWYyYFixiZbSCxCChwHgo6tVuxf1Tp8UIMLBr5L+F9B3JjnEUcAf3/CcojosiS9mUgiQ+WG7I8DRK9f/HQza+Kgwe+Tbyj/DA/ZuyeXCHbu7ckELiSgtUI/v4+w7yBWZ1Aln97PqqJYyO1EhdP4m23psCTU9I1AvQ3p7wBSaZLgupmUs0upPHAdJUEYg7jgS6c2qt2r1YnZWDsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WVlwN5RgbgYmqrLu2qRybVFfUTYl0f9PNRwvNS28xQ4=;
 b=CEJemCqtVmn9liqXkQ3T/xu/q3n9arYqepaLmViebBYk1Bg/lXItQOQHgFoZHblVQmJiMSEaSvI2w6Zig4AkXSnZP/VeNOL+CuxWrWTzSMiucRQ81xTMN+N7b8R7CrnLjs23+Ttpg3q9Y7DeTkap5OQjhYibI4fgrhXtHCM46Tak59Oc2yd5561d+JuzzXe2Wfk7KEMZyEwN++bOrgove9aEUtZJT/dtCXH/K5OteXrs5Xv9IpgPFlN4QaAeMbsmCEfTmv0kmtJVdJSHm8ISCvrHJR3D+r2k/KVJO9CS6/PnDFpGKlzV2o67/IErLePifOcrctVGeVy1DogNRp578Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: mediatek.com; dkim=none (message not signed)
 header.d=none;mediatek.com; dmarc=none action=none header.from=suse.com;
Received: from AM6PR04MB5366.eurprd04.prod.outlook.com (2603:10a6:20b:9d::19)
 by AM5PR0401MB2481.eurprd04.prod.outlook.com (2603:10a6:203:39::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.11; Sun, 10 Jan
 2021 18:48:05 +0000
Received: from AM6PR04MB5366.eurprd04.prod.outlook.com
 ([fe80::58d1:4050:d882:3ca0]) by AM6PR04MB5366.eurprd04.prod.outlook.com
 ([fe80::58d1:4050:d882:3ca0%7]) with mapi id 15.20.3742.012; Sun, 10 Jan 2021
 18:48:05 +0000
Subject: Re: Aw: [PATCH v2 3/3] regulator: mt6323: Add OF match table
To: Frank Wunderlich <frank-w@public-files.de>, matthias.bgg@kernel.org
References: <20210109112612.1221-1-matthias.bgg@kernel.org>
 <20210109112612.1221-3-matthias.bgg@kernel.org>
 <trinity-5d8f37cd-9d0e-4790-baf9-30b8ea4bc743-1610210692928@3c-app-gmx-bap17>
From: Matthias Brugger <mbrugger@suse.com>
Message-ID: <f0be4573-685a-33ae-16a0-d483272571b7@suse.com>
Date: Sun, 10 Jan 2021 19:48:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <trinity-5d8f37cd-9d0e-4790-baf9-30b8ea4bc743-1610210692928@3c-app-gmx-bap17>
Content-Language: en-US
X-Originating-IP: [213.195.126.134]
X-ClientProxiedBy: VI1PR0901CA0103.eurprd09.prod.outlook.com
 (2603:10a6:800:7e::29) To AM6PR04MB5366.eurprd04.prod.outlook.com
 (2603:10a6:20b:9d::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ziggy.stardust (213.195.126.134) by
 VI1PR0901CA0103.eurprd09.prod.outlook.com (2603:10a6:800:7e::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Sun, 10 Jan 2021 18:48:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 833a1757-7520-4d60-b579-08d8b59843ec
X-MS-TrafficTypeDiagnostic: AM5PR0401MB2481:
X-Microsoft-Antispam-PRVS: <AM5PR0401MB24810D72A00AD449DDB65242BAAC0@AM5PR0401MB2481.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:972;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RYojoK0xJ3L7eCyCS1HVBe2Wbl+yqGW4sWFBsv6PfUXnFhzLqBw6w1Hss8y03dBVWndb1W+VhrVOGCQ1t6djFhe2l9UBK2uTjgyJxvm/mXfAAQ0IoxWxQ7gnPUwMC0Q/m/pwhlkE58kr3v2bX7nnEfkihbrN4Gsb/jSQIx3gQf4DWLYTaeUb6COEjgQnkSbkJNdz0smyQui9NNfcjhshhmH7U2SJVfWwvME6gAn0IAlD/k1GMxdc6BJSAdFsnH5G2rqu+otPqXZWlNF8QE9s1PvZ1Fszkn4oVUKNt/WtJVmPNhB6eLWuhZVbgmbDX5srlct8tjRC7/XR8BjZfpWt6oq29iJA1N/gpBPG7LQlVTYDj9hW2uNOdi02OSJgLY+qb9xPSQlmCAzPHDxsO55sW3wgtjDp+XMdhrW5rTbPXUn2erQ+wKQRUwM8L0OqlewP7Tm1sYvQWbuHBvYZY0Ndk22NsLSj9YquHuWffS3LymJhhatqsNKljusJh8XcKElmBA1ZBUGBAI2AVqWFWbIRxUsvWw/H7QvaLH/wB8RSdDg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR04MB5366.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(366004)(346002)(396003)(39850400004)(376002)(8936002)(16526019)(186003)(4326008)(6512007)(31686004)(8676002)(6506007)(956004)(2616005)(53546011)(966005)(66556008)(478600001)(36756003)(66476007)(7416002)(66946007)(52116002)(316002)(6486002)(2906002)(31696002)(5660300002)(26005)(86362001)(54906003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OUlFd1pPQTBPNXJSMVhxVmdmbHVUeWVXRjVOdVEyTWxpMUZMZHdjVkd3NlBP?=
 =?utf-8?B?VmhhdnpRREtjSW5Vd0RnQWdCMVdOSFlHQmhBNG8yZWYxR1ViVVBtdWtiNEx3?=
 =?utf-8?B?YUtaS3l5WW1QWkV2anRqNFVqQktlSzNZbEpDSEdZKzhETTBGU0lzOUpnUFhE?=
 =?utf-8?B?a2FKMHBKaVlFa2dwMDRvV2lWZzRWTmg2WTBLMjZ0akpGTzVSZ1Y4UGZDaGxI?=
 =?utf-8?B?SWFkUkp5SWx0dlJXcFg3aG5BSW56cmkxSVNxQ3dPZTU1eWF3K3F0NDhPWFJ3?=
 =?utf-8?B?REJkdFI4NHZFSk8vZ2ZqVFRHdS9ROWhycXJxTFZIYmlHSkZJWnltcmc1bGV2?=
 =?utf-8?B?MFcrTXA0QmxQT0JVVFoxWiszZXY2YXAyVGQ0YXl0NnlEOGsyQ0VTYzdEeFZi?=
 =?utf-8?B?WE1HL1NiSCtvVGlud0J0RE5vdm9Id2VJa3VqUDdaNDhHWnF5aGg0T3NoN24y?=
 =?utf-8?B?cWk4cE1CUng5T2VvODExT2lmdEVTY2NMcVBST3BVVTN3UjZpZlh1SjgwbTZv?=
 =?utf-8?B?L3hGSlZvdmI4SHNoUXNqUW4xRlp4d25LRlFWbENwSnlKT01BQS9WZHhtV3V4?=
 =?utf-8?B?U2J5TmRMeGh1VWVJTW4wbVRaOHdITzVJZG9yVW1aeUxjQ0ZPaGprQitWbXk5?=
 =?utf-8?B?b3JrT2NqVlR6bVRzZkZmeTJCL0pzUmMzaHd4Q1czVjQxRVJFUG9sOGN4YTJF?=
 =?utf-8?B?WmJEWWh0a1cwc1BveEtnUklrdTRXMzRGaEZISjNLZEorZDQ5Y3BoSVo5aWNT?=
 =?utf-8?B?Q1NFamtDWVZjSXJFM2VHVEU4b0V0WXF3WDdlc3ZFRXpIYURDNEc5QU16cWYw?=
 =?utf-8?B?UEVXbVl2eHBMR0d6SWYyR01HVUIyZ2hIZzgvY3JncFM3YVRvWTFJM2FUS3Rn?=
 =?utf-8?B?aE9rbnJZUXlEdytrOXpWVW5kakNQWndTMXphSEZhVXE3cERxM25VVHRCVk9j?=
 =?utf-8?B?T0RidVpGb2EyVnhWelpvNGkyQ2xpN0toY0xKM0NUY2swLzBuSjlWWDA2VFpn?=
 =?utf-8?B?YU5Na2V4dzlyMHNWWkpQQmltUkJXKzd0VmlIKzlTbzk1NHdTdzBORGVBaC9y?=
 =?utf-8?B?TzBzY2tnZ2NNYTY1M0pVVFRlbHhPcDNKWjRJN2cxSm4va3I4VE9hVHZEdWRX?=
 =?utf-8?B?TjRWb1B6U0gxK0xYNzlnNC9QeW9YMnQ1QzNuMEw3bUUyY0NOSEM5Z0lDYXdC?=
 =?utf-8?B?WVdVdUs3SUJkK0hwUU1xWlZnMkQwMGVjQ2RYcEpQeW5NM29TbjV6RlNpNHY1?=
 =?utf-8?B?cCtuckRpYmpmVUpFMEdXbW9VMHJ6cjZVZ3VBeDE5T2kyc1Q3ZGI3d1Z4cVFp?=
 =?utf-8?Q?bPrStPhXlsJFnnw4LX6UCIRHL9P1QV/y0X?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2021 18:48:05.1648 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-Network-Message-Id: 833a1757-7520-4d60-b579-08d8b59843ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zZliIjZ6WWnyjg0VtK4cPvbZtz0zvR21U8FB4x2w6IGdfE+OGwdDuONgJ8jm9eSCztd/E1kiYRaOneG8/D2t1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0401MB2481
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210110_134812_062112_8DEFC644 
X-CRM114-Status: GOOD (  11.62  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Gene Chen <gene_chen@richtek.com>, Axel Lin <axel.lin@ingics.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
 John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chen Zhong <chen.zhong@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 09/01/2021 17:44, Frank Wunderlich wrote:
> Hi
> 
>> Gesendet: Samstag, 09. Januar 2021 um 12:26 Uhr
>> Von: matthias.bgg@kernel.org
> 
>> Changes in v2:
>> - check for CONFIG_OF
>> - add Fixes tag
> 
>> --- a/drivers/regulator/mt6323-regulator.c
>> +++ b/drivers/regulator/mt6323-regulator.c
>> @@ -406,9 +406,18 @@ static const struct platform_device_id mt6323_platform_ids[] = {
>>  };
>>  MODULE_DEVICE_TABLE(platform, mt6323_platform_ids);
>>
>> +#ifdef CONFIG_OF
>> +static const struct of_device_id mt6323_of_match[] = {
>> +	{ .compatible = "mediatek,mt6323-regulator", },
>> +	{ /* sentinel */ },
>> +};
>> +MODULE_DEVICE_TABLE(of, mt6323_of_match);
>> +#endif
>> +
>>  static struct platform_driver mt6323_regulator_driver = {
>>  	.driver = {
>>  		.name = "mt6323-regulator",
>> +		.of_match_table = of_match_ptr(mt6323_of_match),
> 
> imho check for CONFIG_OF is here needed too, else mt6323_of_match is referenced but undefined
> 

No, of_match_ptr already takes care of this:
https://elixir.bootlin.com/linux/latest/source/include/linux/of.h#L998

Regards,
Matthias


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
