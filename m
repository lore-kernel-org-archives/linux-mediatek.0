Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0DBACD4F4B
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Sep 2024 23:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L82PtjuVD3wjckwIRirKiXsRTJAodn9WM9R3qK5uzGI=; b=rfwpmy7cUAENH5fSkl5yk98SMm
	HEesTON6+57S8f5mgiZD9nExmBswP8O/65xUpoqwVwtvEBEvRbh4qgkSyLr2pOl5FC3SPpaP5iNNG
	OKrPb/8QexqvoyWO1f+527Kr8KLyTN97A9iEBPXFWcagpYyrcFHBdO3SWWDGQr8/FQxwU1G9mAPfF
	Q8B7YnPmII2EdDUBRZU+Rj7kpLby43F6U6y4oKxIyA2n96O+TPdULkPwNwbT34uIdBe1vvYVCBUo6
	w9NoTnOdkE7Dq3V/eng66izeq42RG6LOGPJbfuBfmhebMKblbo8x6liK+2w1dQmBb9YLNn+B3NUe2
	WVsbg4bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slz9Z-00000006Kh7-2q2R;
	Wed, 04 Sep 2024 23:11:09 +0000
Received: from mail-vi1eur05on20700.outbound.protection.outlook.com ([2a01:111:f403:2613::700] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slz8a-00000006KWx-36aF;
	Wed, 04 Sep 2024 23:10:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TdPQ2maohzuDX7YSSUSdu+NdgF8cbv/+aiQRQbbxczCM9/chIFqYHptdkcDBsj+M752qKUP4GFWZPHD6/gT2/dPieWu8e7tnl0lzDS0rspgrnCcQn/DCidXXIrIkleAeqF09BkXgRTKr5X07I0FDFUqZI9hhQZrbse2fClC4qWvHgardT8hyH8fC6TG9bKxrv2o01ijT9AaVjCLChxCFqSsNOI9QtcAnEvP6cDxQKaVyUHbyzva15pCGnJReivV1VGZQUGE57vXVwCZlOzcV3MVz1kCKExlroIIZLJJgDUVudEXgDdVjDSEwzuGA+30v6H/mJUEwc4Ojb5MW/EnNPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L82PtjuVD3wjckwIRirKiXsRTJAodn9WM9R3qK5uzGI=;
 b=rJ45j/NeKtypOQOVCBt3N44TiAI7Z9E/aHbSeDe7XRfL6mKZVcblb41HeTazanPE7muZDnZNr73ujZJQvDPTMaRM7xmyGVzKpg4EKOFmloKYjMoF8C0JWXEay2VONUBMi+Iva4+wI7+y59rz6yM60Ytm1iIkOupY0mCOP/8k+Z41BqeAS1FxcFSWVkLosx9eWRL340w9Lr+57zsSjjiV8ZXqhnEyb1kBrxQXwKJmL6utnKtMMJvFPGXwmcIEhz7IFks6lk43SEn5gFcsBEqKlaXQYhnNoI6UJ/k/mdr9BMtsB6akhZm13iGwIIPWMVq7frKKEKfPc56vLpcjRi8RPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=genexis.eu;
 dkim=pass header.d=genexis.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=genexis.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L82PtjuVD3wjckwIRirKiXsRTJAodn9WM9R3qK5uzGI=;
 b=RXOlOx7BH9JmJtSO7qQ1v4/JNxChekfD4MUaoQbI+CoGUdL0pcU77IjGvp8EjhNE29d7Dm0a68i1ORfdmwst+pFnoEidOLcE4DOsIrO3Xk3H2CPRUd1FgCEvQd1IywBMTqP7vFm2LcSa86yuYUqmRE4rSq23RP1oXbEUK5VyO6g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=genexis.eu;
Received: from AM9PR08MB6034.eurprd08.prod.outlook.com (2603:10a6:20b:2db::18)
 by DBBPR08MB5915.eurprd08.prod.outlook.com (2603:10a6:10:20d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Wed, 4 Sep
 2024 23:09:52 +0000
Received: from AM9PR08MB6034.eurprd08.prod.outlook.com
 ([fe80::9ead:b6bc:10eb:ef35]) by AM9PR08MB6034.eurprd08.prod.outlook.com
 ([fe80::9ead:b6bc:10eb:ef35%5]) with mapi id 15.20.7939.010; Wed, 4 Sep 2024
 23:09:50 +0000
Message-ID: <b7e44fb2-6cf6-4530-a271-9e1730d4f431@genexis.eu>
Date: Thu, 5 Sep 2024 01:09:48 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] pwm: airoha: Add support for EN7581 SoC
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sean Wang <sean.wang@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lee Jones <lee@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, upstream@airoha.com,
 ansuelsmth@gmail.com, linux-pwm@vger.kernel.org
References: <20240831-en7581-pinctrl-v3-0-98eebfb4da66@kernel.org>
 <20240831-en7581-pinctrl-v3-5-98eebfb4da66@kernel.org>
 <yfqmlca6cnhrghpo5s6tml36tngmekcfbyjakxs7or7wtap3ka@7qlrxjowo4ou>
 <d9298199-fe10-4b28-8e28-dc252bd6832c@genexis.eu>
 <t2f5kockuvfi66qqumda6jxf5a4c4zf35ld5ainsnksavkchyj@kdueaqlhjoar>
Content-Language: en-US
From: Benjamin Larsson <benjamin.larsson@genexis.eu>
In-Reply-To: <t2f5kockuvfi66qqumda6jxf5a4c4zf35ld5ainsnksavkchyj@kdueaqlhjoar>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: GV2PEPF0000383C.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:5:0:c) To AM9PR08MB6034.eurprd08.prod.outlook.com
 (2603:10a6:20b:2db::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR08MB6034:EE_|DBBPR08MB5915:EE_
X-MS-Office365-Filtering-Correlation-Id: 71d70476-7ef6-40eb-3119-08dccd36ad64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SXcxZlRpTEpkcHEyRUQxS2xUMm4rVU9CVU9tSlB1Z1RVM29BQlNvTm03bjl4?=
 =?utf-8?B?SHpKU09GKzZET3dOYXpHY1B1bGJlbG1BSHVwYXQ5MkEwSndIVlNLNWZWcTFy?=
 =?utf-8?B?TkR1MTlpRlJnT09FOEdoS000Qml4TzdkV2lGQnEvUnpMLzJMdTFwSlpROERQ?=
 =?utf-8?B?VzF0eWp0VkxsRXc5Q2krWUNSa3hLU3E3SEdhcTlTbyt2Qk5UdHo2U2xQMzY5?=
 =?utf-8?B?N0J2R285UnczdEkvekdjdkVMZzNOMFFvd0I4Ykc0eFN5VXNzT1pIMVYxODVr?=
 =?utf-8?B?MGU4KytZcnNDUXE3aWJ0TElWRWFwUDU0VFNrb0tPVWVpMFhhSTFrUGYwRWVM?=
 =?utf-8?B?aXFwVm81NmIvVE9nQzh5WUd4RzlYQjZ4WDUzaUNyOFUzQVloSGFyZmRBeXlB?=
 =?utf-8?B?K2dRVWFCTVUyUUp2YXY5a201V2dNSEZEa3FBb0hYNFRyakRQNmRVL3AwRW1j?=
 =?utf-8?B?dW8rN1lHSDhINlFtVzk0amdMeEVFcTN5dmNkcXZSdHJWQStoMyt0ZUhwdjdk?=
 =?utf-8?B?YzdIMkhKdnlWZDRWVVB5RkFKRDNMbk1KNXBGMm9NbVR5NEJkdzRUbFVJMGo5?=
 =?utf-8?B?TkZla21hSUJLVysrR1poWTNpNk40SnVoeWJzbzRtVmNVVmdzVmdabitFNWpP?=
 =?utf-8?B?bUhiUlpEMU1yVHd4eUVoNHJOSnZ6ejlna3NQZHpyOGVBME43TEY4enNHTHdR?=
 =?utf-8?B?MVNORUlXWC9vS0RQNUpoZWZQSDR1RWlHWFZ5Z0VZcnVwbzNlaE5WM3hRMmRk?=
 =?utf-8?B?dDdEaUFIdmwyNks4azdGVW9BTDAxQ1p6Szc5ZWRuUlQ3alluOTl6NExNdUVN?=
 =?utf-8?B?RU1ySEI2djdNclBJaThrMUNENXFEbG83cGlIY3VXREdLdTJweHRuZlladUZY?=
 =?utf-8?B?RDlhUFNPdHpTa1V6VEJrZ1p2eFRMRk1Yc3p5OGFxRjRiU1gxT2FWS0I2YUNB?=
 =?utf-8?B?K2ZZVFlKR29lTWVLUE1zbnlrNG9Ib3BpdmJCc3p4Ykd5MzRkOTdDOWloNjZh?=
 =?utf-8?B?YVltZG9yNDBYUkJQeVB2b0J5dkV1R3YzSFRpTjB5SStJUFBONE1sRDdCUkl1?=
 =?utf-8?B?Nnl1T01odlJYUXZ4cFozMUNzcjBscW4yTWxWZW1JWHptVFExU2JqamZqZ216?=
 =?utf-8?B?eVRoeHhUM3MvRmZKWktydmFPS2VjbnM4NXM4cUpZTDFYS3R4UzQwbmZKK2k0?=
 =?utf-8?B?SXd0WkxDYWVrbTNDaGdNSU41UUVPV0VHYmhjZGdmMnE1T3hsOXRnYW9qbTZK?=
 =?utf-8?B?cFBpRjNuaTFEWUlMRFB2bnhYYkxyQjBpQUpoRGZubXA4UGh0ejdMWE5pS1Vs?=
 =?utf-8?B?RnBvMGhpQ24wYWVGRGdyTzc3K2U2M3lqT0NWYzRtUGdQbjFrN1VTVVVoeVls?=
 =?utf-8?B?NlNvRE5GcVJpcGpnYUVTeGFzTFUzRVBsSnJnY0tEK1AvdDdZSHQwSWxoMjVG?=
 =?utf-8?B?SGtMd2t5ckI4UVZmbUhGNHF0OU1RYUUyU09FU3hnVEdQWjhQUU9SREw3aU42?=
 =?utf-8?B?WUs3SW56Y0puaExlVkRTVDNYK0NURDRTNFdyV3ZSR3NCRm5ZZHJJbFIvT2VR?=
 =?utf-8?B?SWdPYy85MkFCR0pKZGlwRHpyWVpQaTlSYnRNclhEUnJUOTFrZnVjQzZEUllz?=
 =?utf-8?B?YTNGem1lcEUwTWdrQW5qTU5nQ2Zudy9yYWRDenNvWWwxekJXNlJlRC9BMGdP?=
 =?utf-8?B?TC8zc0syYlppT3dQNWp2cWlJd0UybndYa1YvREVtNGh1ZkNsc096ZVF6a3Bt?=
 =?utf-8?B?UWJ5WUhIU3ZYR3NSNmp0cHYrQzV6aXh1NVVmd2tTcUJ3eTBxSDhhNGpZNWx6?=
 =?utf-8?B?WWRpMUxhR3o3bmY3NURwQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6034.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MUM0bitFRjdlVktuUzJjbU9jT1VZOUNQZlBXbWE3NjZHQ0ZKZnRnejc5ZkFG?=
 =?utf-8?B?TUxDN0hzVjVvMml3eVR4Y1hqN0ptMmw4Q3pwTHNNdkU5aHdZVXJDVlFidkpT?=
 =?utf-8?B?SmtPR01ITFd1ZXdwUDVaMmxpejJtZkFycVIrZXlwOEF4elZ0amNxakFPTHpn?=
 =?utf-8?B?elVNL2JRWGJ5dFlXUHAvMHVZZjJFRTl3RlprY0ZsWlplUTlaREdqTjJCZ21v?=
 =?utf-8?B?b2ZWcGVMK0U0eDdXSmZjN3g2L1Z0bWNNc0xTUDY0UTRhSWt4amVKbEUvWFE3?=
 =?utf-8?B?RExMbWVqMlhKT3NNRDNZNWlpbFRnMFdaOGgwS1IwTzBIemNKbGpOWHdPbi90?=
 =?utf-8?B?MFZXUjR4a1o1VkI5bjVIWHhvd3Jtd2FCUUNvYmZpaFo4Q0pmWkJWSFNpci83?=
 =?utf-8?B?OGpZc0s5WHhDeFJ4eU9UMDArdTU5dnhUdEFlOGoxWWMyTnhtL01rUkhFRTBY?=
 =?utf-8?B?REp6K1EzMmszbGRUV0Q1V0hTTXpQYit6RWN4MloyWnQwem9NVDRuMEpHNkhK?=
 =?utf-8?B?eWVINDA1bnVYWTBXSlkwWVI1a0l4c2lYYU1YQ0R1YlphTTdYNWxSdHJ0R3E4?=
 =?utf-8?B?OWllRGFkQlpuK045SWlaM3hVWGt6WlZtUFRGTEQyeEI0RGJUZHh1aTdNYzMz?=
 =?utf-8?B?akNPVHJlV2d4NUxUYkxITE02VHE1QjRBS2QvcmJ2dExtdDE2OE14bkk2aWhI?=
 =?utf-8?B?aTROOWhVeWF5TGVET0RZU0ZkdTRuUnZmS2NDWFJmenFiUkRKWFFocTZPZnF3?=
 =?utf-8?B?WmtoaUZXZ2VhbFZjcFRqeG5qa1dkdllYbjVzS2xManZKd3AzdVlNWkQyU1V2?=
 =?utf-8?B?Z0E1TUY1QXVScDRYSWY2STlxdGpzZGtvbmw2NTJpaVJwYkRtTVlaa2JPMWU3?=
 =?utf-8?B?L1pmNXZodmtkNEJoL3R3ZGMrdnFLOXlvRDJzcFZwYk5Ocy8weTh1cWx2dVlz?=
 =?utf-8?B?dXpFYlJuNWdqb2o2dzNUUnFvV29MMmJzRTlJbzg5Sk5oL0lTQVA1di9MNXNy?=
 =?utf-8?B?UmZjeDhvK2JxWlpCajEycHRSQmNsNnhrWGsxMjVmQnlYS20zSGtiYzgwZzBO?=
 =?utf-8?B?clB3MlZHNjdaWHBtQmU5Y3JMaGYwdXRabjduKzRRVXJGMjRkYWlCblNpc2Ru?=
 =?utf-8?B?NlFoaDRObE1DMUtMOGRIWnBVZ3pVY0FVN3U5TGhSQXpua2ZMUnlpbTY4SGlG?=
 =?utf-8?B?Z0Izb2tCc0Z3Z3JCK3FrN1lrb0grZEhBNm43NGtWLzR1a0w2MUlkZmNVSm9H?=
 =?utf-8?B?Umd5d2hsakxGV21kMGpKUHJrNnR4TkI4UDRBTHdqWStZTVBDRnp3S2R2WTg2?=
 =?utf-8?B?bXZRVHpqdUF4c3ZrOUZDQWhTUFA1cERFanpxZDl1SHlnWXRVSUdVNnAwL3Ft?=
 =?utf-8?B?MDJlRnhmUlprcjUvZURBRjU3UTVmYUZOdkJEV1FzU2JYRW9RTURhMHJSdEtY?=
 =?utf-8?B?TnFMamlVbk5GMDZpL2U2OWpyaHBqRlhPUUg5TUZ2VjVlV2ptdFBkd1dZTWpP?=
 =?utf-8?B?UStXL2Uzcks5VTRHdVVRcGhqcFVPMXZUcVVKaUpkUkJsSWNTZFk0TkJ6OE5P?=
 =?utf-8?B?ZVYxb3pPeTFkNEI4ZEdoZkZBd3RYekd1ZlNkazhGanFPS2ZORmtrcGZvRWpY?=
 =?utf-8?B?Ly91Q3dWRTJUd0NnUUNZNlF6NHVKenhCWHhLTVhWbE5VdWFJT0MxZ2h5RWlx?=
 =?utf-8?B?djV3MnF0YlZIYTRtd2RnbjBKY3BtV0VoVVNncDkyM2YrYXJFNWtZNlF5dVM4?=
 =?utf-8?B?UWF4RHFndi9icFhIeW1qWEdnaUErTDhUMVpEMEkwYTlibitDSzhQSlEvRzZ5?=
 =?utf-8?B?bWlXdU5ub29xbDh3Nk5hM1BIVjZXTUVwRjEwYkRNWU5ydlVHaW1WMVg5aTRu?=
 =?utf-8?B?dDJUU3ZwU1N2MC9SWnVlYmxsenJqS2taK0J3UXJRMWNSZ0p4SVU0YnlBSVd4?=
 =?utf-8?B?WU9jaDlia2ZTNlcyODBoQlI3d2s0TWw5US9wMXRaYWNNRjZnMUw1d0cwUUh2?=
 =?utf-8?B?d002NGZTQUl3NnJVbXRzd201bEhSS1JOdEdwNXYwYUQrZTZLZERhSkJJQkJL?=
 =?utf-8?B?NjVKVU9HMUF4MGxGMmlwRGFFeC9JRjFITm96bUJ4WEpKaU80UVk1bElwRzdR?=
 =?utf-8?B?eGRKZW5MdklUbnVpbkxPY0tnekNJWjZGWWsvK09IZC9tc3dUQ1BmeUM4U09W?=
 =?utf-8?B?Snc9PQ==?=
X-OriginatorOrg: genexis.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 71d70476-7ef6-40eb-3119-08dccd36ad64
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6034.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2024 23:09:50.2267
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2wZy7jCHcqUgUmqbEv40qiY5NDgPZfJaLXEs/PCSCCj62zfk5LR+hC8yTYQpw900Vt561tqMHYafBw6sxxnjlmD8P+ksIGtOotp406T3fTE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5915
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_161009_112910_1814BAF4 
X-CRM114-Status: GOOD (  27.72  )
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

Hi.

On 03/09/2024 17:47, Uwe Kleine-König wrote:
> Hello Benjamin,
>
> On Tue, Sep 03, 2024 at 01:58:30PM +0200, Benjamin Larsson wrote:
>> On 2024-09-03 12:46, Uwe Kleine-König wrote:
>>> Would you please add a "Limitations" paragraph here covering the
>>> following questions:
>>>
>>>    - How does the hardware behave on changes of configuration (does it
>>>      complete the currently running period? Are there any glitches?)
>>>    - How does the hardware behave on disabling?
>>>
>>> Please stick to the format used in several other drivers such that
>>>
>>> 	sed -rn '/Limitations:/,/\*\/?$/p' drivers/pwm/*.c
>>>
>>> emits the informations.
>> The answer to your questions are currently unknown. Is this information
>> needed for a merge of the driver ?
> It would be very welcome and typically isn't that hard to work out if
> you have an LED connected to the output or a similar means to observe
> the output. An oscilloscope makes it still easier.
>
> For example to check if the current period is completed configure the
> PWM with period = 1s and duty_cycle = 0 disabling the LED. (I leave it
> as an exercise for the reader what to do if duty_cycle = 0 enables the
> LED :-) Then do:
>
> 	pwm_apply_might_sleep(mypwm, &(struct pwm_state){
> 		.period = NSEC_PER_SEC,
> 		.duty_cycle = NSEC_PER_SEC,
> 		.enabled = true,
> 	});
> 	pwm_apply_might_sleep(mypwm, &(struct pwm_state){
> 		.period = NSEC_PER_SEC,
> 		.duty_cycle = 0,
> 		.enabled = true,
> 	});
>
> Iff that enables the LED for a second, the period is completed. The
> question about glitches is a bit harder to answer, but with a tool like
> memtool should be possible to answer. Alternatively add delays and
> printk output to .apply() in the critical places.
>
>

I connected a logic analyzer to a pin and configured the pwm for it.

I then configured the pwm with these parameters (setup for 2Hz).

echo 1000000000 > /sys/class/pwm/pwmchip0/pwm12/period
echo 0 > /sys/class/pwm/pwmchip0/pwm12/duty_cycle

If I then ran the following (in a script) no pulse was detected:

echo 500000000 > /sys/class/pwm/pwmchip0/pwm12/duty_cycle
echo 0 > /sys/class/pwm/pwmchip0/pwm12/duty_cycle

If I added a sleep 1 in between I always got 1 500ms pulse.

I then did the same but with direct register access with the same 
result. Setting the duty cycle to 0 disables the pwm function on the 
pin, it seems to take a while before it properly activates but before it 
disables it the cycle completes.


I also tested with enabling the pwn signal and then setting a 0 duty 
cycle. The last observed pulse was always 500ms long.


I am not sure what of your questions this answers and is there some 
other tests I should perform ?

For the record while toggling the registers I noticed that it was 
actually possible to generate 1 second long pulses. The documentation is 
not clear on this part.

MvH

Benjamin Larsson


