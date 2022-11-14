Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A7C0C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Nov 2022 11:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/p2m+PCgl5R/RZvluUSS3g9KUXEUX3aetsLIkOn6NPM=; b=Qd9GLI0HQM3JznOBmjeAteXOlq
	ZaoDs/cKOxLKmBfNs7boLNLL3sN/qC3pZV0BRmCRmqEF1W7j2bv8rU0Pv7Yh3H3rsymp7YG3z2SZc
	qtwu6pO4wSbI0awOgFfw7JcBL9hmhRe1CFM/e5lS1LOMJwAN6NjFYSuuP72Ce5wxR+QIwcVG8fqrD
	5wsTpNYvmhYqm9ldQO2AD5RbstwkWzxIaCV7w9IxhkHiBnchX0rRtRbTB4NiImAH9t221QYRPGcW8
	/ReHvFB0NNpwMwPJsCD3Av6Mtywf4xQr3MBA++G4D7AEYLaO6P9tRNYe3m8Fa9BHPT4scq5dmE1sl
	FrzBz+Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouXbi-000Lpq-Nf; Mon, 14 Nov 2022 11:26:30 +0000
Received: from mail-db3eur04on0630.outbound.protection.outlook.com ([2a01:111:f400:fe0c::630] helo=EUR04-DB3-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouXbR-000LfS-Ry; Mon, 14 Nov 2022 11:26:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rw0enh3RFyzrMuHcAMuEgA30nSCVb9DlyJp918zJb51elETQ1AUT9cuI/JmyAiaxW++jErIpQN4I3gOkvgG5v/ZoWpqfFByR2nEVMkzOd3Q4ewBZ2EJBOD7M/W+W9LsDCREa2zLPdXDN3fu8Pq1DLYasdg3iaSQ67UOfl8KmdiyimESx8TJBhqdc62sQGtXYibibJMM1UO2geHgtA0htcRwjykm2siVJUcNPe6nkcJ072+7Xis4yXrxumeGXndoiWoc8XzDlZWqCn+o805JhJHYRaIqlzOk1mkgZWIGb3og2gB7cXi5KkjN/nQmmlApHA63xLWCQg6cArOqN4rycqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/p2m+PCgl5R/RZvluUSS3g9KUXEUX3aetsLIkOn6NPM=;
 b=j2CtrBIBWemiVd6K3F/6HUIh068qLOdO72oKkggCTnmDCdWdEQQfcv4shc9d9YgFAY9TPLP5YdkfOOLjTDbkASX+04C2hlHjx2zFIG7FsWw4m6CW780UyGYTwJ1Ap5oumDH57tvPpLo0Ighf97FVaUhKvVVG8HOQvWAoSf6ucwIxB1mPf8KlgPkzOLT+0oDrrLo/Y3jcyhstdfWwvnnPQEug7zI48Qr5BggOjR/GUZV7bTB93EZoYR/oDLYCZTwRLTLrGt6ECdFFxHBNKOM0HImrH9xDSRF9Prrh9ej7hnMA0b/gB6dSszALRXKHsUhP8XXpeFEOW020I+PRnrq2iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/p2m+PCgl5R/RZvluUSS3g9KUXEUX3aetsLIkOn6NPM=;
 b=X/AEGTrzfxiRjaLqCNAW5yzzQ1NdpoS8Tpul4ie9foC6eeXlTEZl+sPzqlf5e1AO8fVAhx61e2fbBXNtENfzDIYPFA2UVW3R85SRDiGBjplAAEof78qeTDgw8mAn5ZRK1x9Qtjhh58/bGkVAZu1/21R8EhS+N1Bh/96/k3hG2mAPtph2IPmZsSeQTglthPIr960WDrPBDfZ9wKmWnREzOqKH9/imaKarcBLGq6c7aeKEVF6EiWA1y9pB1BoCmlk8BG4QFflFPk8I1DbZoj2Qokh2tbXqK3fIQlBNhLRjpD9gQ6b+bBC92sVpVQ43Ktcr/rV8bjqf7JOan40D+l10sw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from DB6PR0402MB2789.eurprd04.prod.outlook.com (2603:10a6:4:94::7)
 by AM8PR04MB7267.eurprd04.prod.outlook.com (2603:10a6:20b:1df::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Mon, 14 Nov
 2022 11:26:08 +0000
Received: from DB6PR0402MB2789.eurprd04.prod.outlook.com
 ([fe80::a8eb:fbb6:be0e:cc72]) by DB6PR0402MB2789.eurprd04.prod.outlook.com
 ([fe80::a8eb:fbb6:be0e:cc72%11]) with mapi id 15.20.5813.017; Mon, 14 Nov
 2022 11:26:08 +0000
Message-ID: <85b3be01-315b-cb3e-f974-898cd76b683c@suse.com>
Date: Mon, 14 Nov 2022 12:26:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] arm64: dts: mediatek: mt7986: Add SoC compatible
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 matthias.bgg@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 frank-w@public-files.de
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20221111113635.4603-1-matthias.bgg@kernel.org>
 <1683603c-8486-b7a7-e9d7-bddd28c1cd8c@collabora.com>
Content-Language: en-US
From: Matthias Brugger <mbrugger@suse.com>
In-Reply-To: <1683603c-8486-b7a7-e9d7-bddd28c1cd8c@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0134.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::18) To DB6PR0402MB2789.eurprd04.prod.outlook.com
 (2603:10a6:4:94::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB6PR0402MB2789:EE_|AM8PR04MB7267:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fb8b41a-3bf7-4abc-7e35-08dac6330647
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	Xtr9ztCj4KOe9k1MIS2FK0DiMIesakGUen4Dwsf85Y0sphkbt7rPz5EdW60RtDDmn9NR0ZnpwKpP/V+ENMmb9a/LYVxrZDmg/93XvyNSE8xARgrz11uwmZILZytpHf7s1XMgApHpyCAk7to74gzwZX1t5fR3pdZJZzyLRnsFMD0TgF7VFGon0xBVQqUsB9f2xlcp2i5iGlUaID3zQpoZoGhz3wdR+zrkTK7TGhAY3fGAOxXrL1AQyQV5EBdsOTfAMx8fxUzgzuubZWafBVLluwFD4oBor7UgBYSJlbY4246yAeXv4Fu7EglT/XDI81RyUMJkEgAvEGskXG7dfW17bxtwC+OBG3sQff1LzxohDNGYtCd3xF7Z3VUyAk8HVy0LH34keWUwbiMB+Q1/EOMNhUcoCCZg0fpFKR/m88E8zQGsYeicYcj7xUf/PKNJDdarnSD4h1PgYnWytWDHJt5c/3jXQ9VVFRdi8fVAzWNH261nMxYVDlux9NtoUvHP0esDCc9cJmmYgyTt/JtdlTkWQ+M6m7KycRTVZ25xLX0EOFm8LF6Fnv0vlEs/qUVeJUWZQBiyBs6uwqrU8r2t84HX5OXykSmd6y6ozP1IC3lttQiBm55FPaM8Rpun5FfBiZuRoPgl5eIujP8Ao16h2nwNg5xce7wXg4dSEsuJODl77zY22KrDqGvUz4iJU53MPG1p2MJl0vk5MD1uSbGj6EPwT5UwE0G2Ko6fHIFqyQki6BkCMO0q0RU1lE+y8Fpo2A3x8DoMfS+2EXoA5qj3VEDf3C9LgxVF+mSe09xVQHTAz/M=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2789.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(396003)(39860400002)(136003)(346002)(376002)(451199015)(41300700001)(6506007)(6512007)(31696002)(86362001)(26005)(2906002)(186003)(6666004)(478600001)(6486002)(4326008)(316002)(5660300002)(2616005)(8936002)(83380400001)(38100700002)(7416002)(66946007)(66556008)(66476007)(8676002)(31686004)(36756003)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?bmJ0M1E0Q3hKTVR1bXN6SmM5SnVjSUdFYUhkZ2V2bEVkSGdnb29VTGJFcndq?=
 =?utf-8?B?YkZHZ1hUM2FuR0k3KzdkMlZ1eFdqbXlUeHovOTkyRTRCQ2VFMEhZVTcwaGRO?=
 =?utf-8?B?ak92NzB6Q1pGUTFrbmlqRjZEUlB1OURnak9BV1dsSWtuR0c2S2pGVm10WUlB?=
 =?utf-8?B?bGpEQUVHUFVLUUtIKzF4MlplQTBqWjFLSEhtQ0RMMGpYR2swREhXUGVBWDlT?=
 =?utf-8?B?NjFhSXBqT3o1S01jODhobExTNkRiYU90WkkxY2tLYnVxaTNMc2xUN2F3d0xR?=
 =?utf-8?B?UkYrSHhDWVhDR2o4cTJkREVtcDV4REtzb2ZHL1VWYXhxTG9kcUt3N0tYY05U?=
 =?utf-8?B?aWRkQVVLS2cyWlBKNmZyTzJ6RGRkUXp6anVKUXRSNFdXaTBwU0NYM0I1SUhT?=
 =?utf-8?B?VzNPOVJUckZ6TE1oamRBZ3B3cEdaZlMxRlA1ZmJDLys4bmNFTFpQSTZEbVY5?=
 =?utf-8?B?QVQrT1pZdHQxN20rTXEwdHY3V2UySEdqVG1qQ2NtNGpPdXowcUJLWUV0dDMx?=
 =?utf-8?B?TExQeHRPMjFMYUxEZUFLQTd2WkUzOTVFY0E3YkZLalB3dUFtY0p0dnJuT05N?=
 =?utf-8?B?QU5sWlpleDUzbzVsU0hEa3pubmJxaFM1Uk5vOTF4bjZoM2M3bkh2Sk45SGsx?=
 =?utf-8?B?eEhCTlVNb2pCV1FDSkd6elFQclRhWWVmTnlaS3BINEE1aDhqa1A1dGN4QmE5?=
 =?utf-8?B?WGo4SG0xSWRTUTFGUXhRRFpQc0lRS0ZTSUo1akZrN1B0L1huNzl2ZmdYWnZx?=
 =?utf-8?B?TGl3Y3BXZTRyOXZkMmRJZFZOVVJYeXVBckNLSGMxenI4SzlmUklVYkNlQ0hi?=
 =?utf-8?B?ako3bFdLYkEyMWNLaGxTM2JKMjJXNS9NajFTakdiVDVLTVFudDNZdmRtaW5P?=
 =?utf-8?B?OFE1QXBsQWV5WkVDYmt4S2Y0MCtJMGo2YTVKYjNkanY4cUVPMGw4OENpdlR5?=
 =?utf-8?B?TEs5YTlGdHdVT1RLQjRGejdZUjFxOUdoU1l1L3oyOENDVVJZdTdVYlQyaTFW?=
 =?utf-8?B?bkdhNnJTS3dFUVU4V1ZPQVA4eFBITU9nelVtTWZVcno0RTloRm4zUHlwbDhz?=
 =?utf-8?B?SlBTYzJRbVhpYUpxY0lNVnptbzJWOEdVTW1kUjFUUmVqMm9YWHFPbGpyWGwy?=
 =?utf-8?B?OC9OdW4wTWl1d3o3bkNjRFFqSCtqdUdOUVZpWmU1MEIrendzUUxZdXgwNWRQ?=
 =?utf-8?B?S0VickhBQXZDMVN6eXN5Z01qYys3L0V1ckE0VzFiRWdPdGhlcjV3ZktVcndh?=
 =?utf-8?B?dkdDengyd2h0UjZDcUlXTC9oVUVaZXEvV0U4eVVoYjhPNGlxaXR5YVBmQXZS?=
 =?utf-8?B?cGttKzRLVCtCZ1lEWURQV1diakhJc0RCRWk1RUVhbTNVSkprZ1c3ZTFGMUpu?=
 =?utf-8?B?SGtISlNyUGxodDdnZ1lTbUtPWDEvL2ZwY0JrbTFFRSs3MHVpTGRQQmxtMUUy?=
 =?utf-8?B?dzgzdGNxblAyMEFqTjZqSmxBQkROQTI1blFMa1QyUmxOOWwyeUtZVGp0cm9m?=
 =?utf-8?B?Sk5RZ3BFb0pjcVVFbkEyalI4VUJ2QTRnaVJaUjFRclUxcWc5aTFkMGZxc0kv?=
 =?utf-8?B?VWsrblRVeit2ZjdmUWNwWStzczdqUHBIaDNzYjJrenVtQ3U4UERVNGU3Mkph?=
 =?utf-8?B?VEp4aVpXVXhKMjdtRzNjbENOZUVXamQxS3FKTFZLd0hqMmlyNm4xeU1sdjdF?=
 =?utf-8?B?MXpPR3AxV1dJS2QwSXFRUVdRVUNCcjZGWHFVaXVLb1FQbGJwc1M0NnhYMTlM?=
 =?utf-8?B?UlhmZXI5UU1RTkI3ZVZQbGpYRFpSRW9MT1luSlpwUGo5ZzJ2N3lHQ2k1eXpH?=
 =?utf-8?B?SnhNRHU1aFNmUHJROFZHZTRBOHlNVk9GZkNWZ1JmRnlFRE5VdlNFV2hjUWFC?=
 =?utf-8?B?K2VabXkyVVA5VVZwVStYZXRXVFVtRlJyVjBRcVN0RzBNMTZrMWVWK3AwYi9H?=
 =?utf-8?B?MkczNmVKekVkaDZzQ0U4VmVWSTkyZkJzaWNsMGovSWNLaFpaZmQrUnpaOGZt?=
 =?utf-8?B?TXdrajBaWXhnb3M5cWJqN2g4Ris3ZUpJdHdBMlFvWkp2SEFSOC83bzZuc2c5?=
 =?utf-8?B?aVRRTWJCcTJBUmc4Q2x4bTh2K1dzaHlMeHZsQUYzTDZLRWFuNDBtVkswNzZV?=
 =?utf-8?Q?mXdDVHC8CNIyZsScUTvi34hGv?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fb8b41a-3bf7-4abc-7e35-08dac6330647
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2789.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2022 11:26:07.8889
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LxssCqXbEHdWxXjqzKOU1N1zEufx5829NRsHDxF4ys+/JUvwf3yunRhaAijgfMP96zJmoBF56E78LiGlsuIj9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7267
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_032613_987669_CA467509 
X-CRM114-Status: GOOD (  16.85  )
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



On 14/11/2022 12:02, AngeloGioacchino Del Regno wrote:
> Il 11/11/22 12:36, matthias.bgg@kernel.org ha scritto:
>> From: Matthias Brugger <mbrugger@suse.com>
>>
>> Missing SoC compatible in the board file causes dt bindings check.
>>
>> Signed-off-by: Matthias Brugger <mbrugger@suse.com>
>> ---
>>   arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts | 2 +-
>>   arch/arm64/boot/dts/mediatek/mt7986a.dtsi    | 2 ++
>>   2 files changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts 
>> b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
>> index afe37b702eef9..0e3b603159477 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
>> +++ b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
>> @@ -9,7 +9,7 @@
>>   / {
>>       model = "MediaTek MT7986a RFB";
>> -    compatible = "mediatek,mt7986a-rfb";
>> +    compatible = "mediatek,mt7986a-rfb", "mediatek,mt7986a";
>>       aliases {
>>           serial0 = &uart0;
>> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi 
>> b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
>> index 72e0d9722e07a..1191ecf345a7d 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
>> +++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
>> @@ -14,6 +14,8 @@ / {
>>       #address-cells = <2>;
>>       #size-cells = <2>;
>> +    compatible = "mediatek,mt7986a";
>> +
> 
> It's DTS that shall declare the machine compatible and it's expected that they
> all declare their own, so please drop this one.

SoC compatible should have a the compatible for it's SoC. But for style reasons 
it should be the first of the block, I'll fix that.

> 
> Also, while at it, the same should happen with mt7986b-rfb.dts: can you fix that
> one too?
> 
>      compatible = "mediatek,mt7986b-rfb", "mediatek,mt7986b";

Will do.

Thanks,
Matthias

> 
> Cheers,
> Angelo
> 
> 

