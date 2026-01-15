Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B2F5D41149
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jan 2026 09:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RHBcMHBJmke0P5cdp6bd6qc4CPG5CTBAWI6PkoH9Y3g=; b=FcNQacxofpU81U2dp7lDVj+7YI
	XlvVtqusvD1Xh6zJynyw/hv+WI3/EeMCC/h5K+gNPVVcI6mJ6hBFE+55jXnaqS8G0ftusf+qohUp9
	Ubbr+J4KvMqLgdti7o6JsikX/YhdXBfTmv/iOlwG2Y7fiNKwnvg6NrEcFYYVU46dffk9htd2J+Ss+
	J+vzZ/B3JDZqo3YXxHneZWWCnuY3/5hORW4OF9pF6CtOwuiZSn3t1P8eODvwJ+bfXjUG/QJF6KelJ
	YmKejU07UJfz3f1WmyGm7hSDAp7wgmdbi1nOtC33cAjqBrhBptefSrbVMQ530shK7zFSflLVH6FLW
	alQmxdlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgJpi-0000000C5eK-2OMq;
	Thu, 15 Jan 2026 09:40:02 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgJpf-0000000C5cm-2KyB
	for linux-mediatek@lists.infradead.org;
	Thu, 15 Jan 2026 09:40:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ioSG8KeFx7qAhaTDWZTRxrAXGPQ7VrTwnDzVWfQhoejikVvQaDxyR3N9vJjQsb3Vi5UJaNcgyOH5z1Q+G8h1qICMVXUkXbAR5ORANmyeNCep8RIPG3qt4tuIc1f9KZJHqtVCg0Fwb34livN7a2cC6HQq2K9c/VJZcRhmbPi1K7bhEeqxiAllLsWXQUWkrh6goS1/Ux6HxZ4dRo+Wc1A0z7gthqjBDRlYc72H8MehMH4SE0tQ814FJmFqylpK2XVV1m6/LA8jcAz5hC9UBEiZIXrcMOwRuBWgFiS4LJKO920PkBsJxkgu5U9prdr0w3NODYS4+O/jfX+b3aLUuxvODQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RHBcMHBJmke0P5cdp6bd6qc4CPG5CTBAWI6PkoH9Y3g=;
 b=unrc/Zbn77wLJaIr4fnD3KRN7CGvRKH5ofU/vZoAhZwJxljuP8vXp/sjX2qFX8s1dxZycTbEHwhZ4Y7WrA+QrjLqg83spGzco3FyH78qQVxlLUed9PyRNLxdjKa74Cg5y1PsxU4M9D+bmOxKJJNxPAsR/esF4KflJOas5fEKaguHFkjZ8BnBDHKClCLg/V2807NRp7aBav0rGMc7EaVAJQfKY37FXVxWINhLSVLc6wiUgE8HtTSLagIuBbZatV3RglTGa3w4drF2X+kuadWv/hcQW2iZZBXddon8ZW+yMxbPB2qFxgL5eci6nF6h8YA62RuH6RiZeWvT+JjV15PmJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=genexis.eu;
 dkim=pass header.d=genexis.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=genexis.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RHBcMHBJmke0P5cdp6bd6qc4CPG5CTBAWI6PkoH9Y3g=;
 b=tQYVIE9TWKH+bAqHgG3zophieJ96ZIX+Xy0QvkFoG4p0tmaCspkOeXoLoTpvHK8IC9RPKDQ84Q/a4/1YVCKWlnwLC3MpmXX5mP02ubTEJefVxynZLJ0Dp1FFQsNMud7eWKhCd43TCBY07bo7VdwTWktQAjc6+ixzb7tfiDiQgrhaQej2JgKNGpXKr9PzxR1+7TV/InHrtq1mEGzUEVNjehw5z+rkOMbb3OYBWotiqg7i684RXGQmXHfPj1cGflTqhLNm2jtdDfsFYUxQ9K7SO4kx3zu0Zv5y3Pmlcjd4YDFOSXsY3qi0AiNma6j+MCIpo2T+6vBZ73ZoQ/dPsOj9gw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=genexis.eu;
Received: from DU4PR08MB11149.eurprd08.prod.outlook.com (2603:10a6:10:576::21)
 by DU2PR08MB10158.eurprd08.prod.outlook.com (2603:10a6:10:46d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Thu, 15 Jan
 2026 09:39:55 +0000
Received: from DU4PR08MB11149.eurprd08.prod.outlook.com
 ([fe80::8b3b:ee06:2f0b:a94d]) by DU4PR08MB11149.eurprd08.prod.outlook.com
 ([fe80::8b3b:ee06:2f0b:a94d%3]) with mapi id 15.20.9499.005; Thu, 15 Jan 2026
 09:39:55 +0000
Message-ID: <c58c9ddd-63d7-4e22-910c-d537fe6d64de@genexis.eu>
Date: Thu, 15 Jan 2026 10:39:54 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: airoha_eth: increase max mtu to 9220 for DSA jumbo
 frames
To: linux-mediatek@lists.infradead.org
References: <20260115084837.52307-1-sayantann11@gmail.com>
Content-Language: en-US
From: Benjamin Larsson <benjamin.larsson@genexis.eu>
In-Reply-To: <20260115084837.52307-1-sayantann11@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GVX0EPF00011B5B.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:8:0:11) To DU4PR08MB11149.eurprd08.prod.outlook.com
 (2603:10a6:10:576::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU4PR08MB11149:EE_|DU2PR08MB10158:EE_
X-MS-Office365-Filtering-Correlation-Id: 9791ab9d-ce38-4c80-a2d9-08de541a0a47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|10070799003|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V1NmMjlIamUyVnVSSUx3Y1BjSEUzcWhWY0c0NThoQ0tVRVNMVWNmU296ZHlJ?=
 =?utf-8?B?aHJjc0tFUEQvcDBHSHhTWFh6bEF0QlpOTlN0SDR4SDQwRW5udjBobzFQUEtv?=
 =?utf-8?B?c1VIMjBXY2N2TVFQZW5TTXc1NTIrSkc4Z3RkalozNXBWL2tzbFpDSEwvMHBV?=
 =?utf-8?B?b0VoUGpwZzdKT1Z3aUlzNFpRWkIzOU1HREJXSmRJUnk3L1ZjWHJ4QWs2eWZ2?=
 =?utf-8?B?ZHUzMkp0aW84RGVITWt6SDJNaVlhTW5ZNUpuY0VCRHUxOFZqRzNldVdvSUVX?=
 =?utf-8?B?VWhrVHZDYUJxVHhCV1hWMk1xNTVFMVlhOWJ5WVUwNHExUXN1RG5OdFZ3Ry9U?=
 =?utf-8?B?b2Zxc2t2TXR1VWgydDRvdUZQUS9Lc0hDSG9LVkIyNXlIMFRuaG1waENTandQ?=
 =?utf-8?B?ZHFKY0FNTjlTNGJsaHBYdDhmTStuWmZseFREVXR6YXZBU01BWjR3UnMwbW53?=
 =?utf-8?B?UENIaUdvSmlMNEZQRjVYRFNiS0FseGdsTWpja04zRXIydEFFcUlNRzAwRHdV?=
 =?utf-8?B?NnIzMlU5Tmx5bThpVmJ5K2dIY1AwU3UwaUplam1iV3d3M2pjVnlLaEJiZ2wv?=
 =?utf-8?B?Z1pjNk1kcllFZXV1ZzhkdDRxRWdlRUJ5ZTdjRTJXYUUwVit6cHBEZ1JMMnA1?=
 =?utf-8?B?NHNvZVRid0NqaVFic3VuY2ltc2FQUW5sTjljQlV1YTEzcFh6RlNUZ1hmc3I0?=
 =?utf-8?B?ZkVRQzZrdm9lU3NNNy9DSkJPa3hlYUF5a1l1N3lVQjJzd2NZcXlSYXlLb0pz?=
 =?utf-8?B?SUpENWJqUGFEOGlpNDhpNkUzUTNIZ1o2TG13MTVIWFhWWmE3VWFibGFZYklX?=
 =?utf-8?B?K1hUNHRnME84SnBWb1lXQlNnaURmb2dMZVI0b01EbU80Z1FPbDBXL0xNeXdM?=
 =?utf-8?B?cGlxM1ZtNCtkOEJlc0gzU0pnTEdDa2JLRDRRd0ZlTWRxZ09iTWp3TXFJczBW?=
 =?utf-8?B?UTBjN1pWb29LUHk2Z21CUS8xZ0k4eU5zT2V6MzMzbmMrYmYrYW84bU41MWZk?=
 =?utf-8?B?WVlSazFtNHB3VXVTK0NkZnVBOFVBOHRUb1R6Z0I2U3FQbFRsb0wzQWJTSExn?=
 =?utf-8?B?Slo5emNyRDV3S2xnV09UWS9tdk9kSlFiOWNRL1ZibzNKSEp4Zkd3NUJ4T2to?=
 =?utf-8?B?K1I2a0J0TWVBMVNYNkFNbHpBbG9hMSt1YUhqbzdncncxMkd5cHFTMS9CRldT?=
 =?utf-8?B?U1hZYVB2RXRIQUpUdlBzeGo4bUxIeEJtMjFVVXFNcy8xaGorUHhtc3NrRmw0?=
 =?utf-8?B?ZEhiMzV5bTRRanZPK0lVcE92OFVCT2kxWXFMVkhHSDI5TzM1UUNlcElQOTJw?=
 =?utf-8?B?TU9ZZUczRnEzTGFnNDNMdGJCTXE3c2ozbTFNejMwdk5QTVRWNExHQ2NqVXgy?=
 =?utf-8?B?c0lhYWczbS9BK25GaWdHUmNsV29RUkUzNHZFajlmUktHZmlkNTM1aDB2dXpn?=
 =?utf-8?B?cng0Yml6TVZPSmdTZThHaW13R1NyVG5HRzFPSE13aVpjVlN5YU5zNDNpY3hm?=
 =?utf-8?B?NVhpUWJMcVZHQStLMHByN1o4VmVOM3hWOUpuRkxSZ2ZTTlJQL2dMeUJyQ2Zh?=
 =?utf-8?B?Q3JRKzFEQmpIWCtLL3hMbFlPZk1DVUJTVGdxRTNpdTZpNDNMd01RMkVUNmlT?=
 =?utf-8?B?K0pEcUtvRW5vM1BQRjljcVhTNVB6UGRVT2xzTExINHFHZk1NR3dFdEErYzNz?=
 =?utf-8?B?MGhKajFZWjl3SW13K01rTXNaeUQ4R1ZCM1JNd3BZR1F3MC84RStOTGdOSmtW?=
 =?utf-8?B?SFhxQVNqSzU5ZG9paWFtOXNGUWxzcVllbzVrK1VZNXBQa3VHMGMwcXpoT01M?=
 =?utf-8?B?M01UbFlKOUFGZGJDMytwR2pwTE5pYmdjdHYrWlIzY3ZvenIrakV6Zml5NFFz?=
 =?utf-8?B?RDFOeG5iZ3Q3b1JvYUtKYkxjYlNMNjJlVFd5V2IrSzIvQkhwT1JQNFFESzhT?=
 =?utf-8?B?WStTOVJTVXgxUml6NDE0cndzNFhIbG5jTEt0b1hodmJFZnhOZ0xvVjk3dDBB?=
 =?utf-8?B?TFJrZ1JZR1pWcHNnZENjcG9vRSs4YU1USkpKakRaUnMyUE4wNktPSk1venZY?=
 =?utf-8?B?ZTZhRFdUY2dyMHU3cjRVYjMzN0NnYmE2cE94Zmd1Y1h1Y2FJSlVRUU52NndV?=
 =?utf-8?Q?D+L0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR08MB11149.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(10070799003)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RlZrRjBZS2EwQTdPSWphaVNTOHo4MER5c2w1WVZadWxkZVlNQkh2Tk8zdUpa?=
 =?utf-8?B?dVpmdVdVdGVVMjB0THlVbElEL1RqcmJxZ2FrNXhRenRSTTdzWnhHOGFHMDNv?=
 =?utf-8?B?YUpCTHU4L0lrRnNzMXN6SkVLbzBNQW45ZXU5SkdrMkZoWE1IVDBCRDlqd29k?=
 =?utf-8?B?dWRsMlpWUnpoMTh0eHRObUhWcDV5K2FYL2g3OEUxRzUwb3JoSnhGQTJzbUsw?=
 =?utf-8?B?dmFqNmVHa3kyTkJONXZ1cTV3T3BQbVNhNVYrYTY2ZzhFZTVhaGRrOERYSmI5?=
 =?utf-8?B?MWRqRkVaUkhramZmbTNHbml3eHlQeC9TbkVGT2RQTW9qS1lzU1F1RGNucCty?=
 =?utf-8?B?YnR3cnZCRHdGWjFVMGN1ditxWkpjY04zMy8vd2w5OVhUK2M5UlJGdXZ6SjF1?=
 =?utf-8?B?MkVoZXZ3V1gyRTMra3VZcHFZeUFESG1NUEpFNitxWkhEQXI5VzFxeGNpNHEv?=
 =?utf-8?B?d0VpL0x3L2RWR2RtMUhZRDBWcmZmd2hRRTFXbFFvc053eFcyMG8ybC94YjlJ?=
 =?utf-8?B?NGRDSnI0Mkt2emprc3VCeVVZdUpXa1RMb3MrMG4zcGF0cjQxM21tTGU5aHJY?=
 =?utf-8?B?aHdiKzFKZVptZi81dXlicFMyV0NqZzR5VDg5NjdxTFVQbWUyaHNiQWoxaTNw?=
 =?utf-8?B?aHJBUC9GOHhCRHFCaEJIQ3lkUUVVcHNFNjEzUmk2Mm5WYTMxcjEyMERFQ0I1?=
 =?utf-8?B?bDFqT2QxTndUYnpQZFBMcTFoVkFHRkxZblZPa2xSci82aFpYR1RWWDhRQk80?=
 =?utf-8?B?ZTZpN0tTNzRFNmtlNXJ3UFFKVHhuMDUvZVFYT09ack5qSGF3VGJqbVo3bEhX?=
 =?utf-8?B?MUozOFdrK0Y2YjR0YlJPVWMxbldzV0RYRUQrZDlLVWhXVEN0UlNMQ081ZWg3?=
 =?utf-8?B?RXZucHQybUVpS2s3UEdPL0s1NTA4NnRlU3BFMDBHUWE1ejZiQ2tkWHU5RU96?=
 =?utf-8?B?S0FVNHJCcVV6YVRRc1hiTnFKTFRPUU5qUEczNDZReUpnTHlnb0RQL2IzNzJH?=
 =?utf-8?B?b2o5bStkRzltcy81TWVnK3FPNmhTQkR6TS9nMEJGWnFwdFNwKzMwaWxiYUZN?=
 =?utf-8?B?U0NuTitLZGNRd3djdTJ1UWRnU2J1endRdXNUb0h3dG16TjNQM1R4MDNjNUxG?=
 =?utf-8?B?TjNtUDdXSXd1Z3FZK3hwc2tScTY0cHp4MkdqR1JSbmhFWDdhMmIzTFl0NnBv?=
 =?utf-8?B?aFhzdWZTZVRDRnBmUkZCUGhEZGZXdUZ2MUxCL0w0WWlOb05DaE12emRENUNC?=
 =?utf-8?B?aEZuTitvSzkrbnNJWGR5ek42K2dndng2OGtZZXkzMGhqVHBHVUQvQWF1RDJD?=
 =?utf-8?B?dG1wSHgwL2kxRy9wMTBaQUgrRnFGQldNblVTbGJLTjhNOWxteVgrWkdKY1h2?=
 =?utf-8?B?OStUQU1FN2x6cFhCTWc4Y3dSL212aFgyUFM4NXV3aXJZN21RM0NOeEhmMFM4?=
 =?utf-8?B?Y1hXeXlWaG5pL0hxQVJaR1F1Vm9wS1ArTExCamh2ei9oa3JMRXBLZlFPS0pl?=
 =?utf-8?B?TDk5U1g2L0xhTDEvMHJLK1I1L1dveDlvK3hhVEwvcnZ5VnZvK3hsYmFDaHY2?=
 =?utf-8?B?djEyZmU4S2JXVkVYSjNPdlU3a3NnSWRSdHFvSVRkbTZhYitXc0lXeXFPSGhY?=
 =?utf-8?B?eVgzZ1kyNkhlS3ZwM1E4SnVnbDZXQ2grd2JqYldUMFpmMmFkZUMvc2EzQW1s?=
 =?utf-8?B?OGRmNjMyYU9iaTkySEZQenZPdmVtb2o0K2FBMWZITDM3WW1EVW14WmdhTUtw?=
 =?utf-8?B?UjVDR1Q1dDVuc09aMUxnUzNqcUJ5dExqWXdnS2VUSXgrUDgzRmVGYTNMalg3?=
 =?utf-8?B?QXVZZzZ5M1pra1RURGNzblZzVi9ka1NMdVI0dHl2Um5sVmh0VWRYZkxDUVZp?=
 =?utf-8?B?ZVVhVXZwaEdJTzBHNHVHMFV1MVAxMGZwb3NES3FrWThWWlhOR2IyRU1IVlRQ?=
 =?utf-8?B?c3diU09HV21hT05wQk1ZalZPWEpielVtV0Z2S0hJVjVLUUY4b3hoQUVYOW8v?=
 =?utf-8?B?YkYwTlpOUnFIak51R1ljU01nZmdKbjRwY00zM25qME05YTlwMTFMbWd4RnVa?=
 =?utf-8?B?c3AzeURpRTZibWpDOEduNlJoaHZnNDNLT21LdVFTNHR1RGdvbDV5eFZ6OVdD?=
 =?utf-8?B?cXlUbG9RdzhLbEViR1RKaTM3Z0RxUEZkc3FYRXhIVDNVKzJhSU1xdVhhcjVr?=
 =?utf-8?B?TTY4UlRKcGdHQm1GQ3BJQkhZRkVvbDA3NnlsUU5GQkpJaEpRL0N6YkNIazk5?=
 =?utf-8?B?ZTJGT3VKdGJJKzAzVWtIWlRvWlFoVlNZaXVFcTRPYzBJQTBrNmdMajJNT2o3?=
 =?utf-8?B?Wlc2MjRUZEhLTmxITk1TKy9DWlp6VHdGcGdrTVczYW9xWXJvc1lETVRmZUpx?=
 =?utf-8?Q?c/NqN9kVc2CJ1+UQfGifv7N3wpb7B+3ZqKRA5RNRYh75q?=
X-MS-Exchange-AntiSpam-MessageData-1: yasDN/q1sjo09BfEsZ4x/Uvw466+zKIYm78=
X-OriginatorOrg: genexis.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 9791ab9d-ce38-4c80-a2d9-08de541a0a47
X-MS-Exchange-CrossTenant-AuthSource: DU4PR08MB11149.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 09:39:55.2743
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9LGVSxv9EU6Di4neTFZD0ttXYmYWytnuKHFzJuAcpQH27GI+5lkV9aEake9YszTj250ge8Y27h2SskfwBTe6HrxVcYD2J6qDABBWXa8DhLw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10158
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_013959_610944_2E0CAE48 
X-CRM114-Status: GOOD (  15.12  )
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

On 1/15/26 09:48, Sayantan Nandy wrote:
> [You don't often get email from sayantann11@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> The Industry standard for jumbo frame MTU is 9216 bytes. When using DSA
> sub-system, an extra 4 byte tag is added to each frame. To allow users
> to set the standard 9216-byte MTU via ifconfig,increase AIROHA_MAX_MTU
> to 9220 bytes (9216+4).
> 
> Signed-off-by: Sayantan Nandy <sayantann11@gmail.com>
> ---
>   drivers/net/ethernet/airoha/airoha_eth.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
> index fbbc58133364..20e602d61e61 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.h
> +++ b/drivers/net/ethernet/airoha/airoha_eth.h
> @@ -21,7 +21,7 @@
>   #define AIROHA_MAX_NUM_IRQ_BANKS       4
>   #define AIROHA_MAX_DSA_PORTS           7
>   #define AIROHA_MAX_NUM_RSTS            3
> -#define AIROHA_MAX_MTU                 9216
> +#define AIROHA_MAX_MTU                 9220
>   #define AIROHA_MAX_PACKET_SIZE         2048
>   #define AIROHA_NUM_QOS_CHANNELS                4
>   #define AIROHA_NUM_QOS_QUEUES          8
> --
> 2.43.0


Hi, for reference the hardware datasheets lists support for jumbo frame 
sizes up to 16k.

In the Airoha case the MTK-DSA tag is transmitted out of band via the 
dma descriptor. I am not sure how this affects the frame size, it might 
be opaque in the actual hardware.

MvH
Benjamin Larsson

