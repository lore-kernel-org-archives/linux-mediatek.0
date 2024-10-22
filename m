Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9224AD2CE0B
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Oct 2024 17:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ok+ChEZwJjXKoFvr0xSEuSNpLWa2odbwyQGVn8dHhsQ=; b=iql7T4zxr8mTEAtOz1ohx8iVOr
	daJp2lTAsET085C32VhDdWzc5QjCoM37Np8M6Uh3B0lOspFOstCPg3Ky3KrRkLQLq+fYD6Wn+3tEc
	KtiZCqOTFeADZNXGQrT+EaVUinDHH76KVbH/JmKOXpPzJP9wolHDNnKnPw+qQcjCCjj59+/mHW3bD
	mw+NubXE8Ht9ho+KJ+F31SOSnjQ7DlRzzV+/NsJDXqIM1bJC+AIzqH2PAMiMsayGin2RLxp2o376B
	eC853NNrJwIc3mkvvdCtr/kJv/uFuW5ocUMol9HyQhVrqfTUOpSEAnoDwKm+6u44RYIg4m6boJVDW
	4VjoCC6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3IRn-0000000Bbzm-24Pe;
	Tue, 22 Oct 2024 17:13:31 +0000
Received: from mail-vi1eur02on20705.outbound.protection.outlook.com ([2a01:111:f403:2607::705] helo=EUR02-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ICf-0000000BZ6E-2kcV;
	Tue, 22 Oct 2024 16:57:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PlzEKvgzy4F7CnF6D5VE1uyNPq0KegANs7iS/i/Z30EgF9zAj5cE3y5Ph7HQLoFYoCe1Dqwj8Dj3J4FQvdLSBoY5ktTxy7brxlsaneEZXf6Dq/3/WDWuCXO/8yX8pqkwJpb6wzni8BXdlKaQj3SPeQ9VBKli8FAD4VVe16CSRKDcHT4SDaanxQPNYP63HA1qha9a5fmByqL08zaV0W9hcw11ubYejW/ZIy/1Pj+l0wcYuR+TT1exII4u8KiiAfLHnm2Dtd+g+UPdBMFhANDObUYpebYfiJLlfQtHwRQ/I/aFMRPDpYdRL5QD7DrDA3b2FZtylZMh9C82qhqAv5cxJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ok+ChEZwJjXKoFvr0xSEuSNpLWa2odbwyQGVn8dHhsQ=;
 b=VmJR44rgbEYlO0JPLC/oO8oOHUXU3lNVODcHFnhc3aoQzSuWIzmi8Sf+LvvRFuO/CivA/fBq3KqGAn/7EcRK4VCSOx5a1CPpg1M9sJFj27IOwVumALlxtptavqnyyVOD2ET84lEu7OEOJN5yXU6Y7NwYom7YuZSQZEUN2bnBnnyxn/3TceAC2+jEsTUytxmGyqhXKDa4PfhXO/puYWW00fs3MCURMtQxGn1uHObz9id4UHK9yOn3cq42BvIijBU/ZlTSYsyOe/sC8FG2gqgV8MkmQL66y5TbxiA/BzwnCGRS0M3L0YOXpR+gULLKE/gf2W+pyf1E4+iFWxn9NS9FDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=genexis.eu;
 dkim=pass header.d=genexis.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=genexis.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ok+ChEZwJjXKoFvr0xSEuSNpLWa2odbwyQGVn8dHhsQ=;
 b=YMQouRoPC2a1YOGwALuIdAtLSrCaY0+Tf/SqTKfkpW4ew+7mUpkbO+CRVJopoWUMNavb/Xpd/a4mpC6MXhNc1GToF12h8furM0vTktrageC6DLuU08p0AuV38d1syCE1tLxgTUGyntB0nQw+hhkEcgPxoHHsWzr5iIZIMSOHPrk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=genexis.eu;
Received: from AM9PR08MB6034.eurprd08.prod.outlook.com (2603:10a6:20b:2db::18)
 by DU2PR08MB9990.eurprd08.prod.outlook.com (2603:10a6:10:492::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Tue, 22 Oct
 2024 16:57:40 +0000
Received: from AM9PR08MB6034.eurprd08.prod.outlook.com
 ([fe80::9ead:b6bc:10eb:ef35]) by AM9PR08MB6034.eurprd08.prod.outlook.com
 ([fe80::9ead:b6bc:10eb:ef35%6]) with mapi id 15.20.8069.027; Tue, 22 Oct 2024
 16:57:39 +0000
Message-ID: <4df5447c-6410-4da6-84ed-031735fdce29@genexis.eu>
Date: Tue, 22 Oct 2024 18:57:37 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/6] dt-bindings: pwm: airoha: Add EN7581 pwm
To: Rob Herring <robh@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sean Wang <sean.wang@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lee Jones <lee@kernel.org>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <ukleinek@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, upstream@airoha.com,
 ansuelsmth@gmail.com, linux-pwm@vger.kernel.org
References: <20241018-en7581-pinctrl-v8-0-b676b966a1d1@kernel.org>
 <20241018-en7581-pinctrl-v8-3-b676b966a1d1@kernel.org>
 <20241021190053.GA948525-robh@kernel.org>
Content-Language: en-US
From: Benjamin Larsson <benjamin.larsson@genexis.eu>
In-Reply-To: <20241021190053.GA948525-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV2PEPF0000453F.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::356) To AM9PR08MB6034.eurprd08.prod.outlook.com
 (2603:10a6:20b:2db::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR08MB6034:EE_|DU2PR08MB9990:EE_
X-MS-Office365-Filtering-Correlation-Id: d8573a2c-beec-4733-84e9-08dcf2baa34f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ekRkL0pqUUc4WWlzQzNHSlltelpCS1IwZ1BjaGo0NnVFS3QyZW5KRlg4bDIv?=
 =?utf-8?B?UHNSdzRzMGtnbXEzMnBSamNNMnNlT2NZOCtzcDZRdzViWmYrTUZVejVYSmlR?=
 =?utf-8?B?MUNtcldkYW4yS0xkTlZpcElFTHlLN1l4RjZzQitmUkQ0VTgwNnhpMTVmbWJM?=
 =?utf-8?B?UlJXdGRWUDRnTy9IQmlHTEptUzlhTURlWTFPYU1ETW1YVDF5NFY0UHMxSm9M?=
 =?utf-8?B?Y3NRcjN3enQrNmlFWldPZkJ1WjZoVTVmbVRiZ3VNQ29RNitNVDNNU3RVMWd2?=
 =?utf-8?B?bUdQQ1FSazY4TGJmT05ldHJmL0dta2h0czdPSWFkV21XS25lK1BLbXlDQmZr?=
 =?utf-8?B?bGNURTdCcEcvTXhsRnhTTThjeCtiMitrd0gyMkR6eldTakZtZ1AyZkdGT3Vq?=
 =?utf-8?B?TnJ5QWk3MGxaMW8wdU1rRURQTjdWeGRNYnU3N0lBSkF1Q05LRlc2TFBYUThp?=
 =?utf-8?B?bXdzVkYzQ2pDeEtmRG1zc3F5M1N0b0pnblhTczdtRDNNREQ1eHZlUFlhRkZ3?=
 =?utf-8?B?RkdXMHg5TmpqZ2pFZzdlbnRBQm1IaTFZYmgvbENuazFVYTlzZXVCM1BZc0Fo?=
 =?utf-8?B?dU10dHgyQWoxb3NyQWowRVR1bzN1ZUoxWDMwZUVjNU5mcXlMcXk5anZzWmlG?=
 =?utf-8?B?bVJ3dUtWV2N5ZFlOaFRYVTlDeHA0M1lWWGR4d1QyaFpndForaWIvNjQ2Vkt1?=
 =?utf-8?B?SUxmZ1ZKVXc1STIweUNlQTg1Q1AxZWwrcGZBRTdqK1AvMVN0WFZFMGVmSnpO?=
 =?utf-8?B?Q2NJbk9YNFlSeWlDTGgwbVkxSE40SkMwTVl4UUlNbkdVK2tITkk5eDJRT0hh?=
 =?utf-8?B?L2FadWEzWXZuT2Z0RVdYYXdCUkJadFlaVjluZmsyajBnZEJ3UFRWRlJNSmtY?=
 =?utf-8?B?MzN6dms4MWoyM2R2SjBBYW5sQW1HS0ViWU5WYnFqbG5XRnlneHVjT0I4NXRv?=
 =?utf-8?B?TUFtSEVzZEJNck45TjFYWHZlT3BONlc5ZFU1clFsQldZVXo3Vk5pci9kUnZE?=
 =?utf-8?B?VTl4TnBwcW1vTlcwUi9WUGtuWWZ2eXkwVWdlZ2NXSVBQY2xKaVVBTDNrSXdB?=
 =?utf-8?B?Ym1MQzJZSHB6MG4yTTRzNEtiL2xmb3dFTmcxYW95ZUsrTERFYkhvNERYTjB3?=
 =?utf-8?B?ZXp2T3ZuSGZKZHJLN1JocloxTGdNNmNhdHJ1RjRhQjJtKzRvOUgxRS9LeWlC?=
 =?utf-8?B?UWhtdGNyZWdpYm02UGU2TElRTU9ITjZxdHliSGppMkhTMGMrcVZ5MjhaL21F?=
 =?utf-8?B?Q01ub3p5anFBTmtoMDV4MmNRcXcxZGxVWkcvN0JuVXdjc28vZURtc1NsY3B2?=
 =?utf-8?B?M2hEZ1JxWWdnbThyZmxxclN1aG9lRG5jWS9JbU1pTkhvenhRNXdHK3BpZzNP?=
 =?utf-8?B?amtPSG5GRmJUa2JVOCtxMzNudUxQQjBwK1psTkl4RXN0RmpOdmk5T01RTG96?=
 =?utf-8?B?US9YMGpicVplakxpQmo1OHE4ekNnaS9WdUhHRzBRTUN6WU1uZ1dMN2hpenhh?=
 =?utf-8?B?WGhrUUE2NGhyNFQzWDRUbWJOZ29zbDBPZitPTnhCZEdLU0xxd3lTZDRNQUJx?=
 =?utf-8?B?cEQyY3JXejB6UXluMHoxUXVaRkFqektqcmVsQVRqd3hVYUtLNU9UcTNkQ1A5?=
 =?utf-8?B?aTNWTHh3Nk9sNjR2ZktCZWJmTStIUHQvay82NC9wOTMyUFMzU24xSERBVXhv?=
 =?utf-8?B?NDZnS3hTb1VnSGFIMzIya3IyS2NuU3I2VE1RYTlYQi9KTXBGUXlybmw2Q0RP?=
 =?utf-8?Q?CkMit7NORxBHJobQ36Ve6kdKqSgbtsuenyNhHq/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6034.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dHRtSzIvUzI2ZzFQcUt0RWVjSGxCcW8wMDZyc1RWVHduaXorK3E5NWh5WHUx?=
 =?utf-8?B?VEN3TkVMNzJWMk1RbW15M3FzZXVnTGRFK1JrVTVTODhDeFBzemNSZ0JXK3dC?=
 =?utf-8?B?SWx4N2x0QnM0VU9vbjlJb3ZhWTRpbEE4WnplT0RHazIvVnBtQWhaclJZOG15?=
 =?utf-8?B?R1NmRFBvcE5xaXFVeGk1QitNMzlyZ1FWM3ZyODJNZVVLdEd4bjgzNlFWOUtH?=
 =?utf-8?B?a2JkNUdUcExFRWhkb2ZNdldIV09JQS95Wmd2Y1BVa0JSTWlHdFhneEZOaUdX?=
 =?utf-8?B?bFNxcytaK0w5QWN5MmtLalBldzB4MCs4RWwzc1l2VFR4VXFETVdUOFpRd0kr?=
 =?utf-8?B?NzVuRllKclMrVGxhcWtrcVI0amNQZTRIL0VJbzFoU1c3QnNEV2oyZnMzT0Ir?=
 =?utf-8?B?NTFiTHYxbHkzTnBSd2N6Z0tyZ04xRXprdlZ2Vm5UeTFCYng2TWZpUUZzSHBY?=
 =?utf-8?B?ajRxeXpPQk9STEZST0g1Z2xZNUhESnIwVnNZdVJZbW1MRG5jN1BuR2Eya3FC?=
 =?utf-8?B?b0UyeFQvZyszMEpVUk9OaE5OOU8wN1pwbG1EUlVOOHZMa1lwcURnQTJPbWxu?=
 =?utf-8?B?Q082dDQ4eFNoYkEwVkhrQnFwTjd2b0xtTGFoMVBhRkp4VzNxS3JTMThwdWIv?=
 =?utf-8?B?bk5vSVRKdkRzSlZUZEY1Qm9VcUtKWmJCb3lOR0dhclRUQlF5V2dqUG1wOWt0?=
 =?utf-8?B?UXBIYVJieVdLdjJqOEtGOE9QNm5wRXkxRURKMXZnZHJxRkpEdi91UWIvdmRn?=
 =?utf-8?B?dnRpTUIwSFJiZTNCTFhOVytBandyWXBYZFY0RTJZVllLUVRYRktDMWJJZENh?=
 =?utf-8?B?U3E4WHJMaFhtRm1jVDRqSUFRcFdQR3hZQzRTOS9peE4wbEMzdDV0OEVEaGhJ?=
 =?utf-8?B?UW5pbmdQZ0xUazViRGR2UEh3c3ZjNlNhTlJUcWwzUVZWTDExWi9tUlFUZCs1?=
 =?utf-8?B?VWpwbDl2cVZHVjhRcVpUQjdqSmQzbWtENzYrZ3Rwbnk3OFg5SUhnelhjOGoy?=
 =?utf-8?B?K283OFZYK0RKVk5ibFJZOVAxSWhjZWpQbG9lMkdZcjZEQU4zaG5WZlM2RmVt?=
 =?utf-8?B?bXp3K2Jzc1ZTZ1dZNlRaZVhSL0pwM3h2Rk9SN2N5V2pxZDdMK0x5WlRVODAw?=
 =?utf-8?B?b3B6T0F3andaUU5HdEJ4Qmt5NlkzcFV5Yyt4RGJvcUt3Z1JEa1I4ZytEemI1?=
 =?utf-8?B?SDdBSGJYN0RKUTIxOFBBRS9YaFI5RTB0TE9SZER2SkpsUVBLc0liOUxPTDhS?=
 =?utf-8?B?RUtweHZmWTJydmg2NENuRldoVlcvQ0JHZStPK0JoRTczclFpVkpGbXRsZ25P?=
 =?utf-8?B?bGJXeC9NbjliZk1GZkNUZ2drY3JSb0dMREhCNThlL0ZNcXVrVndRRWE1MWJa?=
 =?utf-8?B?OHZTL28xVFU5ajdnUmtZaHNtdHVOWDVhTVgzaHgrU0I4TGlKM3RTTUdUcWdS?=
 =?utf-8?B?NUo0YUtwZGwxeHpnQXZ6YUZ6M3BiL2FVQkJldU16Z0JPZXE4YnR2OGVhRE10?=
 =?utf-8?B?MkpzMmlQR1Q3QURVa2FHNGVibWJOOHJhUksrajZacE53YXZXdjZsVjQvVlRN?=
 =?utf-8?B?QzA3L2FyYXREd0ZDeUY2QktBUlBqQmF3VWUrWDgwNFVsdE40dUpoR29BZGpw?=
 =?utf-8?B?dkt2c2xUdGg5YTRnOXB5WlJyUE9PVER2MVZBbFJ3alpRcXFYRVQ2NFNvTVhH?=
 =?utf-8?B?eTduTFpiWGhvNm1JTVJXSHR5ZTFPQXhzZDBVYXNkNVhDNHRsSlpJWlRVNUJ0?=
 =?utf-8?B?SEtmOFpWUkpZMlZOcG1aU00wTE5pVEtUdjN6MEwzazRLd1hGQXVrYUtKRlAw?=
 =?utf-8?B?RHA3UzM0YUhqRlExS2VkR3drUkhINXB2TVNVOEJKbk5vMGJ6Ym1ockFkZDJX?=
 =?utf-8?B?aW9ad21ldlNzRmtIdHdvYnhOV0Rid0owS2FRV1VoZ1VhU3NqaTkvMU1GblFn?=
 =?utf-8?B?WkV0akhHSUx3aDRocHUrMVFHSnZWQXpTbE1wU1crRXN1MVpvdGxFUTRaajVF?=
 =?utf-8?B?TmZVcGU2Q2toM0NWcDBKQWNROFBhZVZxOWtFTzRUS1RGcFk4YUt4MW9SNjFG?=
 =?utf-8?B?WVNTVnRmN0xVVXpFRUovR01lU01nWVFJbHc0WWNXMDMwRVczalg0MkVuRFJy?=
 =?utf-8?B?TWlvazEzL3BiKzU1SlhJZ2pVbFpiL01wRVNxbW5KZnJjaFF0dkhUb0ZHV3gw?=
 =?utf-8?B?ZVE9PQ==?=
X-OriginatorOrg: genexis.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: d8573a2c-beec-4733-84e9-08dcf2baa34f
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6034.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 16:57:39.8514
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QXvIyHHullg+m2IdbSlDWqmgJ3uiO7CKgOC7fRNOldp+SgsG4ay+CjynwIzv2XHdzONoyQsayWRbj+CcFS1NI03R2NfZsti+E9GrV6wNyQk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB9990
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_095754_063963_8DA1D8B7 
X-CRM114-Status: GOOD (  11.31  )
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

On 21/10/2024 21:00, Rob Herring wrote:
>> +  airoha,sipo-clock-divisor:
>> +    description: Declare Shift Register chip clock divisor (clock source is
>> +      from SoC APB Clock)
> Where is the clock source defined?
>
> You can specify the PWM frequency in PWM cells and should be able to get
> the APB Clock frequency. Then you can calculate the divider.

Hi this controls SRCLK for shift registers.

https://www.ti.com/lit/ds/symlink/sn74hc595.pdf page 8 has the limits 
for this chip.

I am fine with removal of this option. The main use of this pwm driver 
is for leds and for that purpose the default is ok.

But I will try to get a value for the clock source, I guess with that 
value the option can stay in.

MvH

Benjamin Larsson



