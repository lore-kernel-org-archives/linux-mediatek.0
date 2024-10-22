Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E455CDD0EA
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Oct 2024 21:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9lRQ0kf349/L1cBhjY8/BvEc2NQJ8Uaz7MFLIPo4NeY=; b=kC50pQziWMgX2O5X0AfcwNV5D+
	GipEnQUpftJkUAH+OidmmkWTEBlFz3A/irAq62+c2z33j3AWyVjA0cYdIemDbPOWiw63cvOWMX7Xl
	ZHK1rhOns8qD8h1QrWEBfso1kQ/mNQjh5rm/1D8gjP/fiAF/A7PmTkKvTTLY4B2B0xF1uGv2BaH6C
	5EFfHEbyjVIczOyox2QGBikI46CV22Nvr2e5hRulYQCIbBke69+0SXnaxRAYTaWqpIceuE+oC95a/
	DSoFRInk8xtRfXPKE0txM5DZnGIFHY4Ql0lYrhhrTfWsfZrUuHNwhCx+Xyzaou9fU4cxCuaIkfSoV
	iEqYE2Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3MW5-0000000CDoi-2H8V;
	Tue, 22 Oct 2024 21:34:13 +0000
Received: from mail-vi1eur05on20728.outbound.protection.outlook.com ([2a01:111:f403:2613::728] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3MUT-0000000CDOE-2iCH;
	Tue, 22 Oct 2024 21:32:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f4sQDzEagJ65VAHfa2QxD0XG7uCEO+/jj1q1VMt8koo6Yk4nCYuX1pUaIFLBvdmlBxvsk044Y7D5O+N6oFKUq12XAVWb9/JkV08PRqiPHN7e56pfjoDJe7mSQxWI5W5EUriFwwkhEomW32By0DR8RkquoM/uMvwzPv8c6ZbZhxf/jdtuFbiM00xvOsAa6jeeZ+wy81Z2ph3flTpRwU69tNXymaYesH84sIWn9C/rtB41ej6T3Tv3Q6Uh4+H9RjT7lK4TSWWZ54aJ1FuWXXR4A+EyTRvQlmlqbOELtXoT6ECR8JlFukaAF7+IzAGW4O8gab+s1qtB7RICW30ZaKcTsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9lRQ0kf349/L1cBhjY8/BvEc2NQJ8Uaz7MFLIPo4NeY=;
 b=IAhRBPHa5F3QTnhuEGUmXpHTcjJUkNhPDrRG9XPaeMujW84H4JoTtAVU6N4j1HRC3hjYcfFFGGxCkx5BeeL8V84a6Cyb1V1QsnLZbgPBX+lvGfvS8KrumyzpsuTVLPmJph6or+ZRX9mKgP2OV97N25npP1nQ76MfTeDVAkGE9oataGR7iUR4l5AKNOVYYM/RurItPbAtLG6cepuEwEn86iscjd650zdRRiyt3I6TKcxds3OzCcxV525tUChByV+S3Nuod3Y52Tc9Irtex6n4nclXhLk/7ywXh0qP06Mx+czz05O7MRPdRnaTqw+iJhUt0z9VXzb+87qqAEA9mdcY7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=genexis.eu;
 dkim=pass header.d=genexis.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=genexis.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9lRQ0kf349/L1cBhjY8/BvEc2NQJ8Uaz7MFLIPo4NeY=;
 b=NGdDPhtsqvzH56fiWg49/Ewl5xGB+/1482xNutV1vGkU9rUtI/U+J2DThW9Qf3TDzvo/cvPuWzNBVUucKqX9N3+v6rJpZMCJMDxaeLvnwx+BW4/M45m7AM6FPmFN6T8w11Z4uXXKvypkf1woEUqp6l70rHVqQR+cKoFGkgdcMok=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=genexis.eu;
Received: from DBBPR08MB6044.eurprd08.prod.outlook.com (2603:10a6:10:207::7)
 by AM8PR08MB6322.eurprd08.prod.outlook.com (2603:10a6:20b:361::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Tue, 22 Oct
 2024 21:32:29 +0000
Received: from DBBPR08MB6044.eurprd08.prod.outlook.com
 ([fe80::f5b3:3fcb:d608:bfe2]) by DBBPR08MB6044.eurprd08.prod.outlook.com
 ([fe80::f5b3:3fcb:d608:bfe2%4]) with mapi id 15.20.8069.027; Tue, 22 Oct 2024
 21:32:29 +0000
Message-ID: <f3915d41-3886-4b85-8e5e-463c62e7e228@genexis.eu>
Date: Tue, 22 Oct 2024 23:32:26 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/6] dt-bindings: pwm: airoha: Add EN7581 pwm
To: Rob Herring <robh@kernel.org>, Christian Marangi <ansuelsmth@gmail.com>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sean Wang <sean.wang@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lee Jones <lee@kernel.org>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <ukleinek@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, upstream@airoha.com,
 linux-pwm@vger.kernel.org
References: <20241018-en7581-pinctrl-v8-0-b676b966a1d1@kernel.org>
 <20241018-en7581-pinctrl-v8-3-b676b966a1d1@kernel.org>
 <20241021190053.GA948525-robh@kernel.org>
 <6717cd70.df0a0220.850c6.7b5d@mx.google.com>
 <20241022211738.GB1565063-robh@kernel.org>
Content-Language: en-US
From: Benjamin Larsson <benjamin.larsson@genexis.eu>
In-Reply-To: <20241022211738.GB1565063-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GVX0EPF0001A048.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::492) To DBBPR08MB6044.eurprd08.prod.outlook.com
 (2603:10a6:10:207::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR08MB6044:EE_|AM8PR08MB6322:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cf2a829-e01d-4f28-b5e1-08dcf2e10784
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b0ROanNlemJZYjVOcWRBdWVkNmtxeUV6d1Rwei9BQjVTaUMvZnB5ZytPZllQ?=
 =?utf-8?B?Q0NWS0gwR3RCMGFmWXhYMWU5Q2p6aFIrdkxLREw2OFZtSmcyT3NtWTRVa1Vr?=
 =?utf-8?B?dlBTZmZ2NWNQRGg4a1Vmb0xJYVNYK3dZQmt1N0VaTDB2RFN6RzRQbkF0cUs4?=
 =?utf-8?B?NVFmRW41V0FTOEtkT2tFZHdnVER4OWhmZGNOZ2JIV3NkMWgxQW04NnNiS3Fm?=
 =?utf-8?B?NXJmL2w3K051OUFsbndiVWpjWUMyeUo4SitpQWsxWGF1bVRqcHczNnZpa2dx?=
 =?utf-8?B?THlad1VFZFpaV2kyREgwWU9jTHRRS3FuelhjMW5xNGRrbWFEVDVHNEhuUXZV?=
 =?utf-8?B?R2g1RDBPU01jSE14NkJXTjNYYmNheFhTbEMxNkJYVWF1WS9qcW8xWXVCYWRC?=
 =?utf-8?B?S0k2Y1poTkRyZVV3V21VTEt5T05VejdVNjNDQklRa1VxZTFXbFZ3Ti9LY0Iw?=
 =?utf-8?B?UjBiSUhKU1JCbmxiTzBoNDNOdTZXb2xPbjNPTVF0YksxL285YzU3UGgveFQw?=
 =?utf-8?B?TStjNVVvOG5wanZYN3NlbkFIckxlWnBPQTVjVllteTVMOFUzbEZhbkNQYlho?=
 =?utf-8?B?SVhRRDcvVnM1R01TYjdUdnU3Zm1qUVkyVmw3cUdodFNZWEJUYXBOSWdWa0xQ?=
 =?utf-8?B?TGttQmNKakV3UFBuNkhEVWlQVnZZWGlNeXpaWTY3TkZaM1RzSnVidGsrb0xO?=
 =?utf-8?B?SkhxbTZqUWREYy8yZEluZElCNiswWDBsRms5alEyQlZYUStYRGlVTm5yKzBW?=
 =?utf-8?B?WWhhQkRIM1dCd2ozNlRsT1ZDVTJUTE96NGFTTU05bzN0UVhhQUtNZjB5NlhP?=
 =?utf-8?B?R3hqYjJLY2t3NU15SmhVd3JySEZGYTdMQmZXb3BOSTQvY0VEY2pia2NOcFNF?=
 =?utf-8?B?MjlHRzJ6QTZGdWZkOC9OdUVYSGZWcmFpS3dCQzN0bVVrUm1pV01xTkNpQ0Na?=
 =?utf-8?B?enFTR1pLcWpYNmowVFF6WHVqOWg1U2l2WExHNGltcTFqcW53UnNlWjJjWkpo?=
 =?utf-8?B?bC9HeEZ6dUtpS2dNV1h2UjVVSUZHWS9BZlkyTlhGaFRLVEtFMCtlSUxleUhT?=
 =?utf-8?B?ek1jVFRIeXVGY1Bkb1NPK2tMODEwWFFLYnBiK0J1Y3Irc3Y4UmFJSFBiZita?=
 =?utf-8?B?b0tHME50NE1HZWg1UjNjRWZyZWZXSC9TREVJT3o3TGVoRHlQVGFrTW9MVlRZ?=
 =?utf-8?B?bzc1U0dyZ0FDRmthR0huczRKVFNJUzN2NUJxbVlqVGNhUjFKNTlhSXVqQ2lO?=
 =?utf-8?B?R005VVo1WGZlUTlGYlVLUDk5dVpwemZhdnFDNFYxaGR0Rmk3cm9QQlgxYjh1?=
 =?utf-8?B?M1JYVE51RVVSbVBUK0FpVjl0L240aDlHczFJVXk0VlFDeXFrODV1Yk5EVFYx?=
 =?utf-8?B?MUZyMEV2SThGTFYxdWpIZE9QUVNycTdiQTBWNnRkSndpOENscUxoRmZ2bkNR?=
 =?utf-8?B?aU1EUW9jbUtVOFRlZ0t5LzFnWTBoSWZWWitlSTBBRzBpa2owTTJxK25jMUsy?=
 =?utf-8?B?TkJQcDJ3TUxQMUdtZHlzbVlnNjZqNEhqUy93czdSWHpTZmd6TVFza011bTNJ?=
 =?utf-8?B?ekM1WHJoSk9wTDBJOWNRdk5ZUmlPTzJodVdOYXliTDQ1b3RnVW0vdndtczEz?=
 =?utf-8?B?dWFJMUZIWlhSZ1VWenRJM3ZCY3ExUlB0RVgxYVhNNmVrL0FEYzR0NWpEQjVS?=
 =?utf-8?B?NVREY0pKY3VJOEhJamFKdjl0NjNCZzJQSDN2cit3ZjJEZGNXR1pNMVA3bWJY?=
 =?utf-8?Q?nC10bs8qvCtq3ElVd01S5nHKC0RRCXCZvZilHmN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR08MB6044.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eVBrQkZTbTl2WUNWWGMzakY4SXNyakZIZ2JHS0hMdkY4bDBpd1paWDBycXJV?=
 =?utf-8?B?U0ROeHVYd1EzbzV0Z0U5NmtYc1MxQ3g1T1FWYmxCb21jNHNndXY0UnZCZGdB?=
 =?utf-8?B?d1d4VlNYekJseitoZEFTWnRHaVNzMjZhVUdZUDZWS08vbHlYaUgrOHU0Q3NV?=
 =?utf-8?B?T3poZVJnZko4K0hWa29GaEluaHRYOWtGMGNBdEdmc21YT3FkNzVqamxtaXBL?=
 =?utf-8?B?V2YyNzFGZ0J1VUcvWjRVcklQajJwMVczV1JnejE3SUM0YlZSaGp6eG9LV3VP?=
 =?utf-8?B?bVRjKzRGajdlYnRmM2szeDdBcEZEUmEzVEVxcnBRcTgrKzlUZU5UckxmUHdS?=
 =?utf-8?B?Mmc0cFlyNWxHV3Z5Qit3ZGxhcUNxNzJTWUhsNlNiZnJrbm1oVFNZaDZtMzZx?=
 =?utf-8?B?TTdERllpZ0xWcW5WUkE2U21Ldnl3QjRLQU5VUWFEeWJjTi9QcExhbkQxMXFZ?=
 =?utf-8?B?bHZzaldyR2oyendOSjBXNml0UmpYVnlNTFZTdWVycDNTbEhMVDZDejNmTWRt?=
 =?utf-8?B?SUpTTy9ZUmVCYW9WcXlzT0QzN2J1SXJvSDQwTEUzc3VvZTNNbjQydXZFZCtw?=
 =?utf-8?B?ZW1GRmpBU0ZqTXBET25sbXVxcVB5TWdTTzlQeEVaMHpYRDRib0plM1hlTFVP?=
 =?utf-8?B?NTB3Sy9sZTh2SU5JY080eGd1S1RDczhtcGFmS1g0bW43c1BFTFhCZGJTdTFV?=
 =?utf-8?B?MVVWNVVtMG9ZNTVzbThhd0p5M0ErWEZlUldpMTdGYkYxY0QzcGNOeHV2bytT?=
 =?utf-8?B?c1padWw2T3A5MnMyMlk1a3crUE5WTWQ0WCt3c2VscmU3bm1DQTlYdVhrZHgv?=
 =?utf-8?B?bm5ZQUFGM1RaQ3NoY1N6VXpKK0xzb25seW0zcHVnUnBQOTdsMUpuUjh6WEJ4?=
 =?utf-8?B?N2JPcTlSczJEUE5PeHk1NVlnZDZXa2cvdXRLUTAvVG9oWVY2M3I5Z29jeVVu?=
 =?utf-8?B?U21UWkFsRzNSZ3I4ZUZENTFYSjNZNWt4Q2NpNjR4TWJzUmN3NnIreXlDcFc4?=
 =?utf-8?B?dEd2NUlHWlVmL1JCZS9iQjB6bkViNlY4Y1hzRkdwbEpySWQ0T1dIcGZxRVo5?=
 =?utf-8?B?TVovYUZKaHVFWkJmdTBDWHhRZ2IvVlRrZ0NHMGVEamxOYldJcE1WNW4zZ2Fk?=
 =?utf-8?B?SzZHQXh1YVlleEx1SDBuckExQzh1RFZqclR2K2ltVThJdUp2RENGQWZGS1di?=
 =?utf-8?B?dEFmdll6cjJvb3pOeHNyMllIcjNSenc5RW9JUWd5ZmhkOWg0VmZudXU4Nmx6?=
 =?utf-8?B?VnpVUjV2enY2QXZTcldKdUVsUEZHQWcwY1JwVlpva0FuK3ZPdlJGK0ZHN3dz?=
 =?utf-8?B?ZTByTHIxOUdNeSs1TVRUSEdpWEgrNEplTUtYVjlaTGlsVjRyZDhYQktBVk9j?=
 =?utf-8?B?YkxOOHdLV1ArMUo4b2UxdldXUnNIZWpIMmZwbThIM3dUckIrY3V4dWFXSldH?=
 =?utf-8?B?cHhIUERCbXV0cTNGWFh4OENlYndRS3NtTXdmalAyMGtCVko2ZUt6ZGFlZkht?=
 =?utf-8?B?YmJDdFRwNzdJbnppdXg1MEdmV2lMU0YvWWZNR0NwNURUckFsOXFHTWl4QnRo?=
 =?utf-8?B?VGNSZUF2UzQzWE5nSzV2SS9lOG1pcmdRU3NTVksvV3VyK1ZIVStxS1ZZaHk1?=
 =?utf-8?B?RzFWU1Boa08wYURxT0FhNmExOVN0OFNES01yd0thZDhWeXJRQnRyYWtsL3gy?=
 =?utf-8?B?dmdBL0ovdi92Y2M0aStxR0xlY3IwZkZMS0dBVzBiK1k1VnZVdTZHWEtmcUZO?=
 =?utf-8?B?SVpjZm1WRXl6enNyVWZKSi9Gb1REU1pCU0hnUCtXZHZRVDd0NW1tNkF1eVV6?=
 =?utf-8?B?TC94MWxYaGMyQzJkZHoyZHlTNXZweWwvSUVnL3VHTW9SZExZY0MwYTVtbDRV?=
 =?utf-8?B?TGtOSVJkekJSTU8xbklURGRuS09acm1ySlhCS1ZrZldyZjlqd0YvcHFNTjds?=
 =?utf-8?B?cS9teWdyeVh0UmtJOTJkSmdLRGJQSWpUcytBNUJlRHJEbGE1RHhJSGROVFdL?=
 =?utf-8?B?NlVya2FXOEl2dWkxcys5eE1lZlVGbTV4WTBhbVEraWdycHB2RUhldmVGWGll?=
 =?utf-8?B?V0w3VHkreWdkRmt6MWtiTXg4eW0yMmlZcWZUeFUrWjcvd0ZuV1VTT3g0c2dp?=
 =?utf-8?B?cE5NZHo0NmNieTBESHFDRzFYMXpLQjNlTS9DVWZRYlljeDVYMTB2SXNzQVlk?=
 =?utf-8?B?VHc9PQ==?=
X-OriginatorOrg: genexis.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cf2a829-e01d-4f28-b5e1-08dcf2e10784
X-MS-Exchange-CrossTenant-AuthSource: DBBPR08MB6044.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 21:32:29.1611
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gmQRsHYW0Sui+R0bgpHvXLc0jvVRtR3qsKlQI5fJarOLSJMFKAL0iyfSWKTMgVx6gnBvrTZYzxmujRyft9vlmqVDLxGZ7+BFTPww/pYmYiw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6322
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_143234_031639_61D734AE 
X-CRM114-Status: GOOD (  13.17  )
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

On 22/10/2024 23:17, Rob Herring wrote:
> So how is the PWM involved? I'm going to need a picture.
>
> If this external shift register chip can be attached to any PWM and
> clock providers, then perhaps it needs to be its own node with a 'pwms'
> property and clock source.
>
> I would suggest you go back to the version without these properties
> and that I already reviewed, then discuss adding them separately.
>
> Rob

Hi, to answer your question. The shift register is not attached to any 
PWM output, there is a specific pin function (mux) that the shift 
register needs to be connected to for the (pwm capable) gpio hardware to 
be able to drive it. If that is done the shift register pins can output 
pwm signals. So if you are low on gpio pins for leds you can connect a 
shift register and serialize the state of leds connected to the shift 
register.

You can even connect several shift registers chips in a chain with a 
total of 17 outputs. The kernel already has support to drive shift 
register leds but with pwm you can do fancy stuff like dimming and color 
mixing.

MvH

Benjamin Larsson


