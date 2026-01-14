Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 281FCD3CC84
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jan 2026 22:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/DRAA8Y+dpy2+LrhM8cjGBUtf9dNy4Li1t2nq9rN7+A=; b=ZdwebHxXM1H2jB0ivMnHLG6KdN
	UAk8ZK5Xl2iZAIDQdsNm/7kgBKbbw/Q6WgxuMocczQmdUm8V1vsOCw0PALEW2BkNDeUIDWx5mXUF2
	6Q1ZbMJwiVPWgVjCd6hgnPktTikIANAw1iaAQMeVjK/lVfI0w/dEbk05P0SaUb+2cT/ZFedncZV3i
	D+O15J/2+k2DNE8Fufl6I1d7+7HkoJKIQF+G+8NwR+X9Z3hNzIupLyYLc73tSs7iYzQg4YFJ0E8/Y
	L3Bi5RkIxJq/teEnW3T73HPLnA/4KL5HvxCLhjctuKRIroiyy5Q56wroHZzqmOi/ajqTbCeuvWJSg
	g2JOkevQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg9UX-0000000AxL4-1g7N;
	Wed, 14 Jan 2026 22:37:30 +0000
Received: from mail-westeuropeazon11021087.outbound.protection.outlook.com ([52.101.70.87] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg9UU-0000000AxJz-3Lhi
	for linux-mediatek@lists.infradead.org;
	Wed, 14 Jan 2026 22:37:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DaFUM4eXOReoiuakr9Hv+qSIQGpYBNprZoQ42O6swQo8Crc5p13mb5n000tODgnETF2UoCoMoraZEVif0/AqQK1l55ykU0CDrZns0QG8bPad+WzXrqB2JcvKCQJJDqhkIjIiHUkGcpgXEVkS/r5BT6YAGBKo8p/vaZVcCvAci351Li8cCxcIoaDCwiX43GR8cvlDfEzVnetTfuzxvL+GvZZlmdK+wSxj3XUNZssZoWXcPh7eOx0s4gieMTAPqz5680xNCjlAUSHEn8bPMKBY0Px1UedzK6trRjz9c111DNr/nYa7fVbZSae92OKAfnzO1TLwGb/+qzz+lJJ7n7jGhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/DRAA8Y+dpy2+LrhM8cjGBUtf9dNy4Li1t2nq9rN7+A=;
 b=lrhchcwIPdeGHfYG/hf6+fJ4rBNFWKS5GO/DPj7FRQkhXm8QKDe9dfP3PEdjwAnZbETLVBYVLJWuLDcSHJutR/t/5x/tn4QgIOu2ZCpEjYFIhV6AGhWujqxc7Y6n2PrjtHyxHJilYy4QDBNmr0b1AvkINqlLGKa99v4ALWO9MIRdVZcOFYFbKmBRFgtwcaaoGqqShp7WguxPODBPpikfpmLwvdvPM6P0UUXseTbG+z2DbvNVdcHiKEhOyJ8BSNPZgpDN5OjToLFV6C5oyv/Gf8n+TCAouvjCba/Y4tYh8y9Zbms+iS8iQ8WOwRgqlLbsyeIySpMs6UVnv0UY0xIsRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=genexis.eu;
 dkim=pass header.d=genexis.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=genexis.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/DRAA8Y+dpy2+LrhM8cjGBUtf9dNy4Li1t2nq9rN7+A=;
 b=pC+v4JpWaw0+iBl8N0XeYrKE0aO+gi1MzY898yjowdbyLx+1/Xy34k+UyaxcU/Ffv6gKTiU4DiaJPLzWBkx37Di6vMcpWmBNEpaiKP4TjnSprLjWQJpolrde6wbTL9TQU9tVz0ayvypnrCGBRJQP3/xda9sB85rKly+8B0S9D0HoJEEBIAnQqOJU0reiMUYQ4LNP9OeksYnUo/pUqkmoH+cMIdqDj5IFTOXEWOKZjh7CW8wd9wDH6zP5RdRMNp/Xrliag60Xfi4RTJPd17kquNhhwrNQq/z0EtRzk0fpzDQNHepaKOJbDeHEJicpqcQS03nNSWfkitisEHxJsurtHw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=genexis.eu;
Received: from DU4PR08MB11149.eurprd08.prod.outlook.com (2603:10a6:10:576::21)
 by AS8PR08MB7791.eurprd08.prod.outlook.com (2603:10a6:20b:52d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Wed, 14 Jan
 2026 22:37:20 +0000
Received: from DU4PR08MB11149.eurprd08.prod.outlook.com
 ([fe80::8b3b:ee06:2f0b:a94d]) by DU4PR08MB11149.eurprd08.prod.outlook.com
 ([fe80::8b3b:ee06:2f0b:a94d%3]) with mapi id 15.20.9499.005; Wed, 14 Jan 2026
 22:37:19 +0000
Message-ID: <20d64957-071e-428b-9875-88ddbc4dec17@genexis.eu>
Date: Wed, 14 Jan 2026 23:37:18 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 1/2] dt-bindings: net: airoha: npu: Add
 EN7581-7996 support
To: linux-mediatek@lists.infradead.org
References: <20260114-heretic-optimal-seahorse-bb094d@quoll>
 <aWdbWN6HS0fRqeDk@lore-desk>
 <75f9d8c9-20a9-4b7e-a41c-8a17c8288550@kernel.org>
 <69676b6c.050a0220.5afb9.88e4@mx.google.com>
 <e2d2c011-e041-4cf7-9ff5-7d042cd9005f@kernel.org>
 <69677256.5d0a0220.2dc5a5.fad0@mx.google.com>
 <76bbffa8-e830-4d02-a676-b494616568a2@lunn.ch>
 <6967c46a.5d0a0220.1ba90b.393c@mx.google.com>
 <9340a82a-bae8-4ef6-9484-3d2842cf34aa@lunn.ch> <aWfdY53PQPcqTpYv@lore-desk>
 <e8b48d9e-f5ba-400b-8e4a-66ea7608c9ae@lunn.ch>
Content-Language: en-US
From: Benjamin Larsson <benjamin.larsson@genexis.eu>
In-Reply-To: <e8b48d9e-f5ba-400b-8e4a-66ea7608c9ae@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV3PEPF00002BBA.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:6:0:14) To DU4PR08MB11149.eurprd08.prod.outlook.com
 (2603:10a6:10:576::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU4PR08MB11149:EE_|AS8PR08MB7791:EE_
X-MS-Office365-Filtering-Correlation-Id: 47f50237-cbb4-4a90-970f-08de53bd7a1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TExTUlo4ajArWlRVVWZjZHBBMmFXRkpudmFOd0lKZ2cvUlduRDFGSkF3Z1I1?=
 =?utf-8?B?c0ZKNWdtVnd0YnQ5RTZTVVhvMzFzbGpPb1hPcG1CaEhRYkRuNkt4YlN5ZkRz?=
 =?utf-8?B?SURyR3lGcHdPQlVvSEdoeXFOM3piVzg3QjNKdHhEaVIzSFkwQmdwRTJrL05w?=
 =?utf-8?B?WXJEZ3B1Sy9Ea2xsYm9nSXg4RlEzVkZtZXR3dlRBZlhnN0Vtd3VubWlwSFVT?=
 =?utf-8?B?elFZTlg1UlFDVFBGcyt4bHNEQWorVGoxY1hWY1FDZmRuL0M0RUZjaXhlblUx?=
 =?utf-8?B?OFBLalBVZlcwaDU2YktHU0ticVJqVURqWmRzVmxSRmhaMVIxdEp4RkNua1Rz?=
 =?utf-8?B?c1FhODdHeHRsWENxUFVNTlB0UFRVQmp0R1A4M3ViQmJjRDRDL0p5SWd1Qno4?=
 =?utf-8?B?M3MxeUxWL2RJYmhLQlU2T1FBRnZDNWdIRDhoYlczaG5BeGF2SDI4bCtsRUo1?=
 =?utf-8?B?OTE5dEExZGhXREEyNGwyNGtwejlBYW1LeDhyemZrL0tGcVlOQ253UGpHZ0Vm?=
 =?utf-8?B?Vkhzd005WGJGRzRMSGxmdzZRWUdiN01kVWFKSTNLeHBMWCtrcDhrWVJkTDF3?=
 =?utf-8?B?MkpON0preFY1NFRVNkJka2VTZ0taK0NDZzYrMkNEdG5Yc0I0SDQrRktiQmw3?=
 =?utf-8?B?QmVpVE5ITnVqbkovTGllMis0YUJqRGQycUJFRzdvRFQ3Zms2ZkVhUVI4Zm9Y?=
 =?utf-8?B?NFAwZEIzWEptaWlrZkgwTXYzVU5CUjVhRDB4ZVJSbkQyMWhQMnNJNkhtTjRj?=
 =?utf-8?B?YVlJc1lCdHJQR3NYem93WWczZ3R5bWNrOFZicGlYUWJPTklTbEQra3BLMkx1?=
 =?utf-8?B?R1hOczhiUEU4cXpha1Y0ZkVXSytLNU9zdDIwL3NSeW93cllhVXIxY3FUdDR5?=
 =?utf-8?B?aWQzbXZQd3VwZ2xvcHNybitacERKM29WYXVrUi9OUUtSRnAyL0pMbGhVZE9B?=
 =?utf-8?B?UUtuYktlWEdDNEp3S1VvNjlWOXNZYmNxV2JwaFlpdkVPcDN1Wnd3b2d4SEdF?=
 =?utf-8?B?enNRM2JWZzJJY2RsREtHKy9hbjVzdWFPcGNZZzNpUWFhMVlIUVJzazdWL1pO?=
 =?utf-8?B?blFTSC9YaDRnMXlyRUJMME1EbWdQOEtSbVhhL2gydDdWTkdHSFA5RkFkcUlI?=
 =?utf-8?B?RU1NTzFMeXZPWkdhUzdYcHljT1pFcXAvdzNxVC9jUFR6TWpvbEFvNnNQMTdJ?=
 =?utf-8?B?WjhIRm1TMWczNENMbHovL216bldteWhwbTIvd2JkRGRvMFhNK2NsNjFoalNB?=
 =?utf-8?B?dXg3WlhCTXpIQWFLdGtVdmZSYmQ2SXhrWk9SKzlVUUVlN0hnajFScUZweVJT?=
 =?utf-8?B?M2RhRkE0K0JxVzN5aE9XVjlER3UrS0VoSmJmYUpvc1pmV28wYXRaM2szME8z?=
 =?utf-8?B?R1U1RFRFZTVhcTRHVWIzQUxYL1psREZ3WlBCRlZHYXpYRzRtK2JNaUU4ZHV2?=
 =?utf-8?B?SVdRUVozc08zMGdramN2UmlVQjBCalRPT3h0VCtFaEphUnhvZnp3UTRjV2Nr?=
 =?utf-8?B?cStCUndKb1RoQlRWdnc3SXk2Y3RXTGpGeFFEOG9DcGZBczFNeGR3RXhvVUJW?=
 =?utf-8?B?S0xOM3RBZ1VPYzNMRDk2R091TWZySDk5cGtzRS9ZZTYxWHZONkp1NVY3TFdk?=
 =?utf-8?B?OFpMckhkeGdWYnhJaldVZWRvaUlaNGFFQ1QzbmhnZklhOThCM0IrcXFxdW4y?=
 =?utf-8?B?TUlSK0ZVeUtxTkFPZlRYbWtmRlVVQmduMGFNb2p3NGIxczNnMkxUNUZDT1dO?=
 =?utf-8?B?UWZucXpYZldveklSYjdZdE9TNmZwRTNlaGJLNUFDakFyMnVXeFNVZGcyMTRU?=
 =?utf-8?B?cytoOVhvRHNLbWI5ckNqaFdjRXJjc3U1WlJvenUzaEEwclU5MWV1WDAzTzY5?=
 =?utf-8?B?T21PQlFIbUFFbCtJcytmNWNhUnZXd3NsUjJSTVhhc0Q0UU1lRHBxV0U3V0th?=
 =?utf-8?B?YXZmajVEWitFNk0xZWdJWUprb21vWlpMZHNBUXdObWNyR09DeTVGalZMNjZ4?=
 =?utf-8?B?b25sMTk2MExlNk03bkpDb3VoRG5IRk4wQmFMNm5CN2NtMWVMRkdzUmw5L1B5?=
 =?utf-8?B?alI1SkhKdkkzNkFXYk56Y3hjMzNJOGhwMHNMUHc1aWJoTTNrVFFyYzNka3o0?=
 =?utf-8?Q?suiQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR08MB11149.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VzV1cmpJZDRsbVo5eHlBaG4vdGtpK2ZUMzVWcGk3N3ZZVWNpTWw0WTUzRWNr?=
 =?utf-8?B?Wk9mNGRBT2hDZnJFQmNMNDBUZ1ROem1Hc0lkMVVMRGU1V0hYSGllR1pqVHNz?=
 =?utf-8?B?M0FyV1BETGh1dlk2emJUZHNRbkI1L25XNmlDQ3R5THpFc2FKZCtIZWhVK25s?=
 =?utf-8?B?ckR2a2Z2cDV1d1ZsUjRjMldxQVIvOWxIWnVHVUl6MmZ4ZTI2L0dRb0dmaXRC?=
 =?utf-8?B?MG5BQ09zSDVRWlVqUWlFZGY0MFExSWw2MkJ1MlZDa05raS80ZjJlTC9jWElG?=
 =?utf-8?B?ZXBqUTc5RzVSQ29CUWxOZElodTRLN0hGR2RKcjNZRHowTFRoRXZJZXBKaG9t?=
 =?utf-8?B?UUEyU2ZpN1JKVDhVNFR3b1hPVzVSWkhpdEZZQlMvd3NTdGYvRUt0MEl3STFp?=
 =?utf-8?B?UFI0Zy9oRUd6c29TU2pvQWcxbWhHejRDdGxyNlNac1phQW1RRVdDbUN5WWVT?=
 =?utf-8?B?cWs5d2x5d3JNNmYvTDlYNnp1NnlqOTZWcWF6T0FJSjNUbnU4RTBaWVU2VUtB?=
 =?utf-8?B?WEE1WlhCU1k4K1dLQjAxSXJ5N0NBRXpGV2d2NmVPUHRJMUUxTGtXbndQTllV?=
 =?utf-8?B?OW1PeWxaeURvbjdzUVg1dnlmRk1NVXBPWUU4YnkrOGVseWxIaGd6L2R4aTZH?=
 =?utf-8?B?TnNIa0x2NWJqVEZPMjVUejF2dDdPSkx2dWxnY29ZRUd5aE9HckltSkczVlg5?=
 =?utf-8?B?cVN0SUwwSVR4RE02elloUm1HWUVzZVVISEJWakZWV3Z0bjlmYkNWVk90SlVF?=
 =?utf-8?B?SS9qa3ROR3M5cWhXRitxdG4rTHJlTHJzRFdlemdwYjJUVnFXU1Z3cXJnTmo0?=
 =?utf-8?B?cGtWeFRsSFJ0dURKU3hXNGk0R1ZOcVk2TlUrRDA4MlZ6eGtNRXNPVXFWRHgr?=
 =?utf-8?B?Y3NNQnR1ajFsU0ovMU1QT2l6ajV6dmZCWHBaTzE4VTVjNEdJN0l5V08yZnpW?=
 =?utf-8?B?MWh6K2F4amovQ2lhc2VVblIvSmxOWkVTNDRUTUtma2lER0tqS0ppSUQvdnZ4?=
 =?utf-8?B?WVFjNGVYeVlpaTI5SFFBek9tLzRCQ0k3L1JYVmdSL0xETzRXWkJwYWJWQ2sr?=
 =?utf-8?B?SXVpTHljZEd4T2dON1M3ck1nZzVNVGNkaktYMy9pK0hId0w4RU45UEpBZ2t6?=
 =?utf-8?B?Z0ZZY0xncWY1azBYSm4wcm9Bb0NBZXdEVXduYlZMUWhOZnhPLzNvbExtQWRR?=
 =?utf-8?B?b3ZZeXZkOEo3M0dtR3pKcy9SaG1zTjRYYlo3Y1ZmVlF0TjlIWVpyOHAxVlBX?=
 =?utf-8?B?ZTlDTlNqYkRhNjhRUHFkL0xHd0FOQzVXcFVvVWdCdHA4aGdON05QZzZmV3pK?=
 =?utf-8?B?ZmR1RnM0cm05d0xXclF4Z3hBQUZ5aTgvNkI2WVBvNnl5ckRtY2VKMkJyTHh5?=
 =?utf-8?B?bW9US3dweDVlQ01DWGQrY2dKazdpS2h4TXhhMjRPVzAyNmZzM3ZPbTQvVUls?=
 =?utf-8?B?Y3NuM1hndXVPZk4yMGNVYVJrVnF5aGZ0b0E5RFpBMmdEQ0ZGNFBZbnVnNkwv?=
 =?utf-8?B?aFhMYVd6Mit2TElmV25tSkRkY3pCcUlnYU9wazhqOWNkcXlxYjVHaXNJM3JP?=
 =?utf-8?B?Z2d6YnQ2bXJ0VmN1ejk1L1FTdkFDanpMQ2pHT0J4eDJtL1FRYlF1QXg5ckxy?=
 =?utf-8?B?dkkrSFg1cW56N3pJeTg0Rm5Ua3ptalpiVmN1bkxsQkZySEtFaXk4emZtcnQ0?=
 =?utf-8?B?L1I4cWJSWFBKQ2gxZVMvT3FGbjRjMWN2UmYvQzRBSDQ3b0dPcnB3SmdrM2pC?=
 =?utf-8?B?Qk42SUEvS1p1akJqaHAyZC95Y0FTak5OUUZDZ0JaZzExdHhacXZMQ0V4QVJE?=
 =?utf-8?B?TWY0bUdBdHV6Yk9LallkdW1wVHk1VDVyK1JNdHNFVWp3bUNERk56bVFVYVpp?=
 =?utf-8?B?OHF0WnJJWlZZeitHS0lrcmNGdEhUVkxudWs3eEEzc2VHcmhQdzBDQmdlb2dk?=
 =?utf-8?B?Qm1RVHNINnE5WGlQQyswMWtJd0ZSVitzbUsrUmExNlBRUko4Q0R1UDFRM24r?=
 =?utf-8?B?S3FyM216RVdWcmhsTkxxWld2MnlUTFZhemE3Q3VrZ05KNHZCclpVcGFXbTRN?=
 =?utf-8?B?aGxLT2FYQmdzaU5saTlleURreFhFWSswcUwvUExLV2ZYa3l5LzlncFhNSzJD?=
 =?utf-8?B?MnMxeGVnbktTZGREWjc0ZnExbjBnYlFSeDZVVldGNmlZdzh5OG9UWXhqb0FB?=
 =?utf-8?B?RXprTFE0ajFSY0xldEwwcHhsTFc1Rk0yTlk0NHpEVWgydGNGMGpqOUF6ZkN4?=
 =?utf-8?B?ZHVZWERSRjBsWlR1Q0kxSkxVOEZab0x0a2d0UUZ3MXZML1pNQ3B5bUc0RnBQ?=
 =?utf-8?B?NGxlY2lMSWgwaTZZSDV4WUt4c1JnWGxsWTZYM09iSE1Va1o3QlpJWGZXcHE4?=
 =?utf-8?Q?1/9E77Ndd3vne5nQ=3D?=
X-OriginatorOrg: genexis.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 47f50237-cbb4-4a90-970f-08de53bd7a1f
X-MS-Exchange-CrossTenant-AuthSource: DU4PR08MB11149.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 22:37:19.7880
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zzXNNYOFMsqJ3oGxqGvoWvSv8roRpOhTtBqUKevILe7+PFDcYIYEKvCf1n9iZ/aJ4lTSKUAYX5YSxwLU9c1fDMYdEbWyHLnN/fvRmevhfug=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7791
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_143726_858509_A37B5EE3 
X-CRM114-Status: GOOD (  13.84  )
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

On 14/01/2026 21:15, Andrew Lunn wrote:
>> In the current codebase the NPU driver does not need to access the WiFi PCIe
>> slot (or any other external device) since the offloading (wired and wireless)
>> is fully managed by the NPU chip (hw + firmware binaries).
> Are you saying the NPU itself enumerates the PCI busses and finds the
> WiFi device?  If it can do that, why not ask it which PCI device it is
> using?
>
> Or this the PCI slot to use somehow embedded within the firmware?
>
> Or is it simply hard coded in the NPU silicon which slot to use?
>
>     Andrew
>
Hi, the NPU can address most of the SoC (the NPU is a cluster of 
RiscV-cores). The SoC when paired with a specific wifi chip needs to be 
matched with a specific NPU firmware. The NPU firmware seems to contain 
wifi chip specific code and I guess only one electrical configuration is 
supported. The pcie card is connected via 2 pcie busses. One dual lane 
pcie gen3 and one single lane pcie gen2.

The NPU does not only handle wifi. It can do tunnel and IPv6-support 
also. So a device might not have anything connected to the pcie at all 
but still have a need to load a specific NPU firmware.

MvH

Benjamin Larsson


