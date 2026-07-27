Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46F31C53219
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2026 09:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yNF1xkmYBL+LNm3Ad3YriXnX+gwU5+RrayJcvlKnSIg=; b=K09N4z93c/CDZTSCZXmD0sccn/
	/aupJN6332+iRYv10kPUrmhCJbcJ999D5y9oaEElWnrY57Z7EqitjGgRNsxupHopuwhusI5z3FqXT
	uUrVZDlftuVrrcQbQmh4fxBZTag8jpGqE//eUPrFxGklTHDt2y1Qrhv0bFMVx08S0VpuA8+Dah3ov
	Wa3qaAPfckf0pV1X5JLwTaSatg4neSd8ooWOZzA9f9g4qU5KMHbkPEunBff0OMH0d446KN+gIR2wt
	nGV4xaEwvqJYrctcxBsk1cSmuF5oVZTyd7avncDaVi91gVA+IXGGa3QCtJXNLbFJkFEIFYdq3u3uS
	rbbsx5Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woHpC-00000002Lxf-0vRq;
	Mon, 27 Jul 2026 09:40:42 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woHp9-00000002Lx5-0Vno
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Jul 2026 09:40:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QN1CDycZkUqjXu9zar0jAyKYeBhJ9P5Ei+hEwoK85P8glPQJHmRrQH+GtLI+LSPcl0dpf1gObwyefPPjI+lefUluHspfrB9egXGJth3GTgkb/Jzgq1zNBRwMIqav8cfZEs8Y08t33A4wIsFQgmGrWI+wvHLqznSLgJG4Ti9Zx9xfqvoSrJKXfvZchF3cbZy0KpMVkC4+uJDwpqwXTF3Um3kbWZIoAf+nddMbBGUi8Zea1IkqdJacOLiP54/k/Fo9oDitf7cba4BJSzVLnAPTklnqSUruFt3WrhDlxJEGr3h6VuYqm1absTkLCKX+GYrpubj+NnVYo6X9ytK+Q6HKdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yNF1xkmYBL+LNm3Ad3YriXnX+gwU5+RrayJcvlKnSIg=;
 b=D24utN6lVb2lGGPzfzT4slSQD4b7Z6aqhnfT1ijWUx/8/OS5M8McgZabJpxX4WV7riUuvSuX9y33A1GZdkX9Z1c4aJ8QDvvc80KqrFu61vlln+hSWrg4Y7VjrqFVoEkoYdqS0lt5eh1EMlIaQP5SF3rjRk2KaB9ZhN66zJADLAMJxvAvYHALkfqfuoxLXwsoLN1RLMyUaWyKJ8oBCc3VCP6BNic2TAL+RTcmlzy3QZTd1bmXxtUBjXCc7F3CPKmdndGk23ir3/wPH6xh/pm6e3wPTlIEZuRfQny6BJoRQ2iDpqiXtwSI3lyCk52XxeqE/narUaw3cYY6JwMl0Qz9Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yNF1xkmYBL+LNm3Ad3YriXnX+gwU5+RrayJcvlKnSIg=;
 b=RGf5EBS6hIClAtOZ+FYvHXSGaTcz4N65h3Bb8DJ94N17a/iIaa4qhImG6JuDMK3ikWaG4D6ccWHhj/AnLDjstL8BN3LZlYyGo2iFGLdumoCWZHWNx0YC17Tom8byp/5A6O2RH2ZuSqKfsPP0tBvmTwFyhOzOHPM66YM41wzD/vfjBF76UdZ2GBQl0/YkBhZWHBovFmedl7zoNRSa7mpnVR5sVoBsTil9iHwNyLM2/g6ZSB1zPAY086IFsJg3FodTZEclXV80Qr31zfMTN6nckBeH841ip7bYskkKO15PlgPmi4muMfxRdqOE6E745iIjBCLC4heKJOJrj8AoYU7YoQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by GV2PR08MB8097.eurprd08.prod.outlook.com (2603:10a6:150:75::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 09:40:30 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 09:40:30 +0000
Message-ID: <179fbc45-a43e-499f-bb54-58fee8c66df3@iopsys.eu>
Date: Mon, 27 Jul 2026 12:40:28 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 12/34] pinctrl: airoha: add missed get_direction()
 function for gpio_chip
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Christian Marangi <ansuelsmth@gmail.com>,
 Benjamin Larsson <benjamin.larsson@genexis.eu>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Markus Gothe <markus.gothe@genexis.eu>,
 Matheus Sampaio Queiroga <srherobrine20@gmail.com>
References: <20260727074234.3761170-1-mikhail.kshevetskiy@iopsys.eu>
 <20260727074234.3761170-13-mikhail.kshevetskiy@iopsys.eu>
 <amcRI3c0-1iWWX5M@lore-desk>
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Content-Language: en-US, ru-RU
In-Reply-To: <amcRI3c0-1iWWX5M@lore-desk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: GVX0EPF0005F6DC.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::1fb) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|GV2PR08MB8097:EE_
X-MS-Office365-Filtering-Correlation-Id: 33230421-e5b6-44b8-1b7b-08deebc318ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|23010399003|4143699003|56012099006|11063799006|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 5SoNAG1OLJVsyeraTT5ylDzmjjaGkC5GRDJ7jIoUeFhnVXNKswN0S5vIzdpFtb5ES45FAf2aTptFvITclqthChTtofHFp9RGjhYWhcSz/e8JE8RNBZlxnQYvBlHz6KQIT90MR6/Pn3n4kn7owLh0AINf/BrdqJhGGDUNhaq0O3MeUpWFuocVig/HvtyOIB5vTQCewQJtoveSkH9e0G91JO/6BcaY1k3als2zrmQqY13PXzdNJRqeSGAPycEfYe+l+zD8YidHOa/q+iyULRDxUGM31vj4Lk6g/0j1aR0zpaHE+Jqs94pJbiQPgNINlyqVfLeJm42QpBpO491RwqR4Oy2bGBxcErZBGtUgCzKFgUvZahMYscSaW6zLN7vuIvQoDCCo7Ua24ndG+bXnyfs93cFXs7mv1b0LothY3OxAFCgSl1iB41Tjn20FiCfoswu6murer9rYL7hQ35AxsQr6j0fuH/Lwmd0dZrdtYkFn6mBoqT9mecbWnW8nGNxp3npuxuhhXUGQ8W+Q72QICnHAUaWWWwIZ0jZSuhODnHeg4827iPn4h9HQJBEaqGG/gzyJGFlqTwNKT47eciNHvo6BphojIPsb+tggWMOKWopfgnzqIXlTv0wcTaLNW96uze7g7ojKLGs2lZRShjo2sgGvwoNfg5wfoDljnD9nB1Gq3SU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(23010399003)(4143699003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SkhOblRORXlSTjYySWlXaS9SSktQUXE2MFN5dHROZjVyQWdmSzhJZ01PUmZQ?=
 =?utf-8?B?eGtnR3g4NDIxbXcvbHVtdWlPWkEzVysvZHVLWDE5SURWajRGcncyMWp4Zjl6?=
 =?utf-8?B?WWp6SnhhMnV6N0o3YzQ2WGl3QlhiR0o3MVdJWTJOd1lVWCtHeWxlWEdsWE84?=
 =?utf-8?B?cWNLMCtOMDdpQ1dqVjdtWWV1ck1TcDVmM0ZWeUtpb2loeGNNQ1FlcEVHMW5x?=
 =?utf-8?B?SnhzM2V6T0ZCWnF3NHF4aXB6MlNPcCsrYXh1VWxQSnVJdjZkOTg4bTlCSm50?=
 =?utf-8?B?d3FGcVNGWm8xWXFQd3ZZSVZuVWN3NExsNWR2ci9QTFNEY2xUanBqWFFmckxJ?=
 =?utf-8?B?bllTUEpNUHlsSnR4eXE0L3dOSjd5OEcrZExDY2I0aVpBWTJuTURzc1NCTHdW?=
 =?utf-8?B?TStpQkE1UTdRbitEZ0RoQmEyVVU1eGZhaDhSNHZQWjhFbUlMS1BGV0Vaa2NM?=
 =?utf-8?B?Mk9ob2tDdFVvZUxQUzBjbjlOYUYrVUZVV3hlYzMxNXRYVE9IbW9lMU5IZmNB?=
 =?utf-8?B?aE41VVA5V29IaGZWUkZ3NmtoQmZwclZQU3NkbzFxMUxYSm80VENoQzZadjYx?=
 =?utf-8?B?Vk5QU2o4dHF6dzdMb01oMXVxbDNBSXBQOUpHSktRTmllSzFWMFEwaENsZ1V3?=
 =?utf-8?B?WVcvT1FlNXpiYkhMV0VJbGZMdXdKaDRaM1B5dU9vTVZJM3B6bURhZ1lBRWtr?=
 =?utf-8?B?U2thc1ByYkNhYy91VTNrSklTVEU3SDVHOFpyck9nb015Q0FRYmFsN05wVHpr?=
 =?utf-8?B?RE5qbzFyeDdlUzNPS2RQS0VSRkNHZmJ0bUpKSFh2YmtOZGZZMWhMSjR6RXc2?=
 =?utf-8?B?aFpWQkJEdU5PbnRjM1g0K1JTM0hURFhEY20zTjhTQlpHR3pzdE5nQWVvTzg3?=
 =?utf-8?B?dStXV0lPc1dvK1RNakVlRjU1QkQ4RHIzdXUwWVZlRzRYWkN2TEdIVlpOOVVC?=
 =?utf-8?B?eVcwSk5hOEIvL2c1aTNJeG0yTk5EMGtZUEc3M1hQYlVLcFlIM2xKRVBldm44?=
 =?utf-8?B?Tll1RDI3R3dKZm84UXNudGllM1lkY3I0ay9WYWlMVGdKSk50d2xBcmpVWHM3?=
 =?utf-8?B?ZFN1aktYV2FPc3VOYWdTL0xObm9jRDBROE4vM0twYVJreWtyb0lPdVN3eUdj?=
 =?utf-8?B?Ym9Nb2F1RHpSN2NoY3ViTXJxNWtpRmZ2cjJTT2MyakJHK0NtUEx5cFpXMjg2?=
 =?utf-8?B?OXUzdTlhcURncDVyRktQbE1OSkdLRm5WTkZ2UEl1RGYxVURPaHlCTGZuUTNK?=
 =?utf-8?B?ZWdLZG9Pa1AweVQ0WEY5NkRreURrYXJiZnd1UG1mKytyeHNuM3RRdDkyNGlQ?=
 =?utf-8?B?VEVjaFB1YnNZS0QzMStNZ01kbk5Md3RnOC9kcXdLWnZiWVpwSTFLazNIWXlT?=
 =?utf-8?B?QlVWWlJrcGk5UEo0WEdOTGl6dFlNdHBJQ09zVzNkUng2ZFNqVDFSVHFxWEVU?=
 =?utf-8?B?OWMwM2toZTRTeTZlWkE3bDFBN25FdXdrWG9Wb3ZrdlNQNXdPcWNpMTRNTEJK?=
 =?utf-8?B?K1VqTVhmY24rSEtRVTVaWm82NUJ3aVJwak5JSk9SUkV0NkFLSUVIUjdUY0Fj?=
 =?utf-8?B?b1FVN2dGeHZ1RGNpblRBMnV5Tkc5M1J3RVNhV2N4c282akVVY1FlbHVXakZh?=
 =?utf-8?B?SXE0RTYyVjVYZjVHOE9oOW9YcUFhSjYyVjc4L3JLYTAyUjVoVjhnZ2w4NWpv?=
 =?utf-8?B?emZaQWtndUJsSDZEYms3TzMzSHZNUk1LUVlWU2VTWkg0aEdFaG5KZWxZRDJQ?=
 =?utf-8?B?UzI3MEc0dWkrUXZINUhQZlVxemUxejJoUlVlWUEyTjJGUGxVcXNBTkRmeXFP?=
 =?utf-8?B?UTQva1E3MmpZdWhIRTFTVUhPZ0U4ZGxQMFMwR0kydWlYaXFzQkJBYnVYTTNi?=
 =?utf-8?B?aHFZa2U2aEpuZmtPL3dIVU43VWJLdnBZWHNta3ZFZ2puKzJ4WEpLcTVQSlMr?=
 =?utf-8?B?b0o0eUJpanZZYmE3S3kydE5PbHh1NWc2UHlycFd1U2pXTHZrRXRTbHF1OG9W?=
 =?utf-8?B?Qy9iNnlnUlF1TUdDaTB6UnFPemgwSURaRklMcitCNW9YRkUvZjBFc3BTUFQ5?=
 =?utf-8?B?d281RHNOUjBpdVZsSFB5SmVpTUx0cjZZYXNJTGdtam81TDNCaWRieTYwa3ox?=
 =?utf-8?B?bGdMTnM2TjdiaDJHQ2dhbWRHK3hHcENuU0ZKSkZLQXZwamwzVmhaL1JreDhm?=
 =?utf-8?B?TXd2VmZJNjhNckNGSUtKd2N6dXJFODFUaCt2UGhVWkphakFEWlNLL1R3ZGVP?=
 =?utf-8?B?b2RSTHRXajFnZHpMNGJsUXNGdk52Q3NPMXdNc1FYUFhiakhLb1N5QW4zNEpW?=
 =?utf-8?B?RktYanJEN0ZvZFo2cXBIaUpScEQyNUpiTlNiSThrRlJzR2UzWDdza2lCWHpa?=
 =?utf-8?Q?x1ryot8TkJyZbwF0=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 33230421-e5b6-44b8-1b7b-08deebc318ff
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 09:40:30.5534
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9tZb6CBmmH8tSTwozj0M6AgfvSo/qLQGobt9B4JfchVd6s473SJRMyKtVNIDnD1OxyXY51lslzI57b8w94AwF1gi+zow6BFEDotc9mxqI8I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8097
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_024039_183349_53544A23 
X-CRM114-Status: GOOD (  16.67  )
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

On 7/27/26 11:04, Lorenzo Bianconi wrote:
>> This patch adds missed get_direction() function for gpio_chip.
>> Also it reimplements pinconf's get_direction() function using
>> newly defined function.
>>
>> Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")
>> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
>> ---
>>  drivers/pinctrl/airoha/pinctrl-airoha.c | 41 ++++++++++++++++++-------
>>  1 file changed, 30 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
>> index 820b7b0443851..b52eb39c55ff3 100644
>> --- a/drivers/pinctrl/airoha/pinctrl-airoha.c
>> +++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
>> @@ -2502,6 +2502,27 @@ static int airoha_gpio_get(struct gpio_chip *chip, unsigned int gpio)
>>  	return err ? err : !!(val & BIT(pin));
>>  }
>>  
>> +static int airoha_gpio_get_direction(struct gpio_chip *chip, unsigned int gpio)
>> +{
>> +	struct airoha_pinctrl *pinctrl = gpiochip_get_data(chip);
>> +	u32 mask, index, val;
>> +	int err, field_shift;
>> +
>> +	field_shift = 2 * (gpio % AIROHA_REG_GPIOCTRL_NUM_PIN);
>> +	mask = GENMASK(field_shift + 1, field_shift);
> before we where checking just BIT(field_shift) as mask, while now we are
> checking two bits. 
As I know upper bits treated as reserved. I think we should not use gpio
operations if upper bit is not zero.
What is your opinion?
>  
>
>> +	index = gpio / AIROHA_REG_GPIOCTRL_NUM_PIN;
>> +
>> +	err = regmap_read(pinctrl->regmap,
>> +			  pinctrl->gpiochip.dir[index], &val);
>> +	if (err)
>> +		return err;
>> +
>> +	if ((val & mask) > BIT(field_shift))
>> +		return -EINVAL;
>> +
>> +	return (val & mask) ? GPIO_LINE_DIRECTION_OUT : GPIO_LINE_DIRECTION_IN;
> nit: unnecessary brackets.
>
>> +}
>> +
>>  static int airoha_gpio_direction_output(struct gpio_chip *chip,
>>  					unsigned int gpio, int value)
>>  {
>> @@ -2648,6 +2669,7 @@ static int airoha_pinctrl_add_gpiochip(struct airoha_pinctrl *pinctrl,
>>  	gc->free = gpiochip_generic_free;
>>  	gc->direction_input = pinctrl_gpio_direction_input;
>>  	gc->direction_output = airoha_gpio_direction_output;
>> +	gc->get_direction = airoha_gpio_get_direction;
>>  	gc->set = airoha_gpio_set;
>>  	gc->get = airoha_gpio_get;
>>  	gc->base = -1;
>> @@ -2855,21 +2877,18 @@ static int airoha_pinctrl_set_conf(struct airoha_pinctrl *pinctrl,
>>  static int airoha_pinconf_get_direction(struct pinctrl_dev *pctrl_dev, u32 p)
>>  {
>>  	struct airoha_pinctrl *pinctrl = pinctrl_dev_get_drvdata(pctrl_dev);
>> -	u32 val, mask;
>> -	int err, pin;
>> -	u8 index;
>> +	int err, gpio;
>>  
>> -	pin = airoha_convert_pin_to_reg_offset(pctrl_dev, NULL, p);
>> -	if (pin < 0)
>> -		return pin;
>> +	gpio = airoha_convert_pin_to_reg_offset(pctrl_dev, NULL, p);
> if you do not rename pin in gpio here the patch will be simpler.
>
> Regards,
> Lorenzo
>
>> +	if (gpio < 0)
>> +		return gpio;
>>  
>> -	index = pin / AIROHA_REG_GPIOCTRL_NUM_PIN;
>> -	err = regmap_read(pinctrl->regmap, pinctrl->gpiochip.dir[index], &val);
>> -	if (err)
>> +	err = airoha_gpio_get_direction(&pinctrl->gpiochip.chip, gpio);
>> +	if (err < 0)
>>  		return err;
>>  
>> -	mask = BIT(2 * (pin % AIROHA_REG_GPIOCTRL_NUM_PIN));
>> -	return val & mask ? PIN_CONFIG_OUTPUT_ENABLE : PIN_CONFIG_INPUT_ENABLE;
>> +	return err == GPIO_LINE_DIRECTION_OUT ?
>> +	       PIN_CONFIG_OUTPUT_ENABLE : PIN_CONFIG_INPUT_ENABLE;
>>  }
>>  
>>  static int airoha_pinconf_get(struct pinctrl_dev *pctrl_dev,
>> -- 
>> 2.53.0
>>

