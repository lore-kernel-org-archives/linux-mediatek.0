Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC2BDCD6E5D
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Jun 2026 09:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FhzgdF9A57sRV057on+bWHfUH1jr7yWQtCeIqyex2j0=; b=D3mrPwaf8sXzoo+ucxbhywhiF8
	FDB858HUyJKxH6wsJ1gavpbY4CnZIYyedRu6irUvgMWC41AqiG4j2YoIAd3NE1hG/XOHif0PKpU9N
	xW7DgFXvK7+fnEjP3gnoujKfLXgYJwx/Mrg+O4nbVcDDgXDRaZQlsCdcPQFWpmJc3cP+y08EWn5QU
	8RUxwI6oXx8X2Q5iDE53TSSmHpgKL1GcNp1UZOlP2ZCn2m8ROPjq1Wf2krPCiSfBmjOwphbYG/EAd
	Zyym3c3ogzGMy7KjbtIBZO0bGIZkKs2fghAPpT20/c2w3WAdl+Vol70Ykj8N0QLCQFtOUVUwUdmX3
	j0sl0LbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVQdk-00000000Nlb-30EM;
	Fri, 05 Jun 2026 09:14:56 +0000
Received: from mail-swedencentralazon11023082.outbound.protection.outlook.com ([52.101.83.82] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVQdh-00000000NlA-3XU4
	for linux-mediatek@lists.infradead.org;
	Fri, 05 Jun 2026 09:14:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fJqHxfFLJufBmvd68tVT4q7gaH4qPtbYTHsnzu3YkVCGKTBvQeRNFHIflXvCc6+SwLA1VZS0Fu42B2KlWQaYOowErIWiLiIuH420YvcWWHuSfmkNyG23XS9r/ezy8VZvjqzkDhwuYWNuf4JyXGI5K/MpmFXNVwxz1fbqrSKZS0RgjvPFIySqPFhjg35gFwwlOV4koOWP8opuq+otJGdF37HR/ONJRB/0FVn/5+W0n9zkIe6t+V1PgkIgRElbnKcSztdZ/VxLYz4FMNvINKhbzs4sk8foYYizgh0sI/Lz7dcD8nYmGIirGtFgdossO1wT/pj6p+0DRP2IZFfi/KBJng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FhzgdF9A57sRV057on+bWHfUH1jr7yWQtCeIqyex2j0=;
 b=UixbjfDyrO5cagc4a/knbSE4EE2kqLjhQZUZmhlFJEEQU/LYDMKNZbA5mjahfA/KQIq4WbKdvTIhNPuX/RD7ru0WMVk9RkvXdAWfTO0d/Gjxg4T1PysMz5wTewNGQOpYNmJmi7+1ghDk/tsLUMODfvgiyoiWhRvyLEBgJnONggvEjvVtq+S7GKB6GZ4jXzHoYfqoej3qM9rvlPkeMEBFcNeV4lnRTLt3tPMnrqr1X36bFuVOshZ5PvnMO8vdARqMjrfujQEeHPKTC2ZU2OfI/q/oEKvBdNt7lvdNArJBO8ijVgL0EZKQWp9O9XoU+Map5b59fNaj8Co3JURhI6Q4oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=genexis.eu;
 dkim=pass header.d=genexis.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=genexis.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FhzgdF9A57sRV057on+bWHfUH1jr7yWQtCeIqyex2j0=;
 b=w/n2ZgvOALbmWtt4QKxLdqzSD0WiFJZhkg3JsIGVYwpabCr35H2zc3gNGvIyaxY9sBzQcvJqNbRSXfkZo5UNGgD1NgLbnLQ6kzVZbREz72Bu9G2vBCzPvarvjZl8+8PoM0+oDQbY/OXVR8d78cX+peWJgkZlbirIt24ISk2ePk66Au7zdcxu3zzQcRx6Q3AxYT1c+plt5/hP64Z0RHeCzBeH6Hz6WtXlOsNz48pdYBe9hW5o8k9Fvncs1BtNmcTLNqYj4YWFT+KVzVBpfJK49ekUz36Eom/omcvnjgaBrD6kG1x2c9cB6BOTxWZbTuuxvwJlXrPV6h02qS8uDbSzIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=genexis.eu;
Received: from DB9PR08MB6697.eurprd08.prod.outlook.com (2603:10a6:10:2ad::14)
 by AM9PR08MB6066.eurprd08.prod.outlook.com (2603:10a6:20b:2d8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Fri, 5 Jun 2026
 09:14:48 +0000
Received: from DB9PR08MB6697.eurprd08.prod.outlook.com
 ([fe80::bdec:3e95:6614:441f]) by DB9PR08MB6697.eurprd08.prod.outlook.com
 ([fe80::bdec:3e95:6614:441f%6]) with mapi id 15.21.0092.007; Fri, 5 Jun 2026
 09:14:47 +0000
Message-ID: <356bb88b-0968-4267-a9db-c389c0fa5801@genexis.eu>
Date: Fri, 5 Jun 2026 11:14:46 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: Move Airoha driver to dedicated directory
To: linux-mediatek@lists.infradead.org
References: <20260605071233.28873-1-ansuelsmth@gmail.com>
Content-Language: en-US
From: Benjamin Larsson <benjamin.larsson@genexis.eu>
In-Reply-To: <20260605071233.28873-1-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV2PEPF00023A18.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::21b) To DB9PR08MB6697.eurprd08.prod.outlook.com
 (2603:10a6:10:2ad::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR08MB6697:EE_|AM9PR08MB6066:EE_
X-MS-Office365-Filtering-Correlation-Id: 4edc627d-d218-4470-6b41-08dec2e2e3ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|10070799003|1800799024|376014|22082099003|18002099003|5023799004|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: jvTsHEI5d36MAtn7jcf1rOPKDLoS/rmMNWv6aZTOqxL7xMdxeTUMkH5TJuCv+iASj1NDr40ch1ZDxTXBA4NoF+8auEf+tk+DKP84lqJFDdiBFt3iZkAccKsNs4Vn+NNKrF2NOj0Ymwns/aGR9GCizwtJzbTMfwtl8uO7tzJAOOXbvdUb09aE+e14nZm8zM7U0mYIYlrle+NK4qjUEbl1Jj9CPo9YELTaWDDd6sH58nXDDOdWK4IqchFJtJ5HzFBvaG3VFCQW9/ZBdWkrLCXqnvJtrgWOm+2W+5vTHXgNO0RGN2lOs7rFzDTkGneJL1mryiACGm03taFQBnxF5/EG7c4ekJ3mXp/LS0tgoyEL4nyyVLSiFmDz/N4jcJiuplvGzLJDOeZQbdPqz5E8ANo/87GLw8Zm1CHYDoRX7++E449+sw7cNyU+XHWR4Ajanrh3MRw2Yxl+dV7d+pMctX/oRScrKIBtyyYOKeBPDSGvN6gwktXuWfNiff4EqEgTbxWZc6Briau9AeyO2sbfO+i5G1M5fosIWGC7brPS8BX45937xXgmI8d6/R9yu+lnMnL/L+Zv0yhkRUOdmo8FBRK7/gu6R9Y1GpkkLZUVN4mByEfOVvI0aP+2Kqtex50jMQH5FAroYHz5WlILw4+bTzOChd3Un1EeP68Dx2MEcDs8ytRIHK58T/bqa8tCoz/qGFJ6
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6697.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(22082099003)(18002099003)(5023799004)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T2ErTENBSnFpWjQwcEJYWWZ5dTBUZkFFZThOSFRNMWdiUEJ3cnhrbjM3dHVs?=
 =?utf-8?B?b1RrSGNkRFovSEU3YlMzNStSaU5rczZFeEpYT2N0a0xveEY1d3ptaUw3U0Yw?=
 =?utf-8?B?RGdodkxWL2RqZDlMVkgrcUxSVXJkcmpiVzVlY1Q1R2h1L3BPem1aaTdFVE5m?=
 =?utf-8?B?MEp5WnljaGJ1MFNsT1pxQnYxUWxYU0JYcTBkMmlrbDh5cUtTQUcyUk5XK3lV?=
 =?utf-8?B?clBVVndyME9VWnY3RTRwOHZwMG4vR09yb0J0dlorSlRDRklNbDdZWElYS1Yx?=
 =?utf-8?B?ZTVTY0R0S2U2enZsOGw1MXhjMC9Hc3NsM0lrVm53QlJSMncrTDhZMHdaUGkw?=
 =?utf-8?B?ZThkQzZxaytOTXc4VVRmeVRDSkExWTY1TlZiVVE4Z0hiK05jN3BwSTcxMTBW?=
 =?utf-8?B?Z2FaaHlpR1VEbDgzb3UxRUVrTmZzM1I4Z2Ntam1GTGFHc2JtdGJmTzUyOW5t?=
 =?utf-8?B?U2pNT1lrM2M2WVNpVWI1UzRRbFlQRDNWZFEwbHZvZzRMRWhzQkwwbzFLdWt6?=
 =?utf-8?B?d3BGcVEyYTNsT1N5MWtHYTJGK2hTZUowYUwwQVEvOGRpekxXeDlhM0Rmakw1?=
 =?utf-8?B?clo3bzhmVWpzZUlZU1V4OU0vdnVQc0dBS0tZZlFsZ2QwTy9BT0cwdVNJMU4y?=
 =?utf-8?B?a2p1RWQya1ZRbUJKVW9ZRnVGOTAySThJRXU1Q1J4QzJ5YUZpdG1qMjdobEdP?=
 =?utf-8?B?RWFnWnFUWnlUV0N6YnB1TFVEcWRZdG5xRVBBNHFoWHBHcEdDbGZLOVRUZmJU?=
 =?utf-8?B?eW56a09IWGxyNlFmMjcyaFk0NG1IWHJiaC9mbnRQNEdlNW1lbnRWdnFHNWRB?=
 =?utf-8?B?RVhZbzlKcGRGZCt0Y3pYVFVlakFEdUhVQzRENFBHSGdJS1lLYWs3dFFtenQ1?=
 =?utf-8?B?TEx0NG5QalVtNnFzN1UvcW5IZkQ1VXdkeVlzSmZqMkg5RjM4OCtvRmsyK2tG?=
 =?utf-8?B?enp0ZWNQb045NkU5WlRCTndZbkNHQWl6N21GcmVPOW9VRkM5N2tjNlNTejFq?=
 =?utf-8?B?MEN0c2h2OEZZMmYvekd4ZGJuUkNWdWtRRUY3ejVLVGNTVjFFZXJrbW81YUF1?=
 =?utf-8?B?ZlpJb1ZZd0V1WnFMdUdHVk04U0ZLRDFPdlVMZm9PcUFKaXVGSWhaVzc1YThz?=
 =?utf-8?B?VFhjMFFOTHJKeGhLb25IeDVDRUdpVmRaSjFCeFhWR1N2V2JsL1dNVUYxS0RR?=
 =?utf-8?B?R3hEUVh5YkM1SDYyVmg5OGZjeVpvYUtBbnpOWW1FeHNJWjk1QTFmdjE0amZI?=
 =?utf-8?B?RTcyanZCbWUrYjkwdTJTcHNuaWs1K1JuVld4NXNYUEt3R2tkeXZJWHl4UGFp?=
 =?utf-8?B?cFBnZmJBQ0N4ZWI0NmVXRlZ6bXV0SFZkRzVZVE11RGVjWEJkNUdJZlRGUUxa?=
 =?utf-8?B?aXNrSUNZNkZGa29RR1htQUNwUDlhTHEzUkFzU0M1eHBQeTRNcmtOTFE0TG9U?=
 =?utf-8?B?Qmh6UUxSNjdMcGJFNkRIQmZQRUttZkhWVTZOKzRkbnJEQ0syNHQrSHV5eldp?=
 =?utf-8?B?WmlodVlnVVRKcWNFWSt1Y1cvZmw2YzBnaWRONGlZT1lJMUVBRE5VbWdDTWJJ?=
 =?utf-8?B?VzlZTFRGYXRqam5rS1BwbW9WU3YwSVNuSHBkK0xVajQ3TVpaRUNaVFM5NUxV?=
 =?utf-8?B?TXNOVURJNXoyY0h3cWtOTkphZ1ozOXFUcHp6eFRxWDFZVmloM1hLdkQ2bG52?=
 =?utf-8?B?cnZYK2dqZXdPZXJsRWZXMnkyZUVEWkNranAzZUJhaWRicjIrek80TWxDb08x?=
 =?utf-8?B?ZkNidmhOamRUY1ZNcFNmQXE5UE1WaWNQWXlNclJLZmxXVWhGYjlMZXpteUJW?=
 =?utf-8?B?bnFxdEFvV0thOUk5SWhyK2ZvMlExMFhvOFRWQnVQYUpEYUJ4U2E0QUJVMytn?=
 =?utf-8?B?UW5GNlNlaXdRc0x2ZlczUlR4cUUzTFpFRjhEK3pzOWdTSkh5ZFpzZ0lPNnRQ?=
 =?utf-8?B?QkFEOTFhaW5pMTc1VFZ4b3FoT0ZOdWlBNG1ZNVR4QUovclNqZzRaRktuQUZC?=
 =?utf-8?B?Uk1mTFluZ3dtbndtOUdRZVV2TlRJcGhEWlFHZkxwak44NUhncCtJWEh0S1Rz?=
 =?utf-8?B?V04zYllxNjlwc2RDSXlRclhzSUdKMFA0bFVUUC9HSmd0UEVRVXMvazNqOHBw?=
 =?utf-8?B?eHdWcDBSOFNseUR5Z01lWncwcDFjcG5vVndvdUU4NkRGVzFyYlVvbXVPN0Jq?=
 =?utf-8?B?dXdHbE5TQzVnbkxoeGNWK3Zzb0hvTStudFVLL2hTMWVxRGREbE80QzRnSWJx?=
 =?utf-8?B?dWVQQnZaVlllQStpaXN3TzUva3NJeUtIaDlFc2hnS0x4RmZvQ2Y0eXkzVnN2?=
 =?utf-8?B?UjFWREw4cnBId1FDdkZYaUk1c0kvRXkyMlVVMm54elFJTkluWGxaM3FJaHJI?=
 =?utf-8?Q?EvHCBilWG8XHFXxWC3iG5OHUanXZN6Oy+28wWhSz3fULD?=
X-MS-Exchange-AntiSpam-MessageData-1: JIp7tHKzliu8kwvsABEiK27JjXehYWZ7rEM=
X-OriginatorOrg: genexis.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 4edc627d-d218-4470-6b41-08dec2e2e3ab
X-MS-Exchange-CrossTenant-AuthSource: DB9PR08MB6697.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 09:14:47.9119
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ARAl003thOLrVW7bkJdRIyC3qUl8PV6Tt/j5sOOLLNx/Y9K2l8ALQFXVSmiGYKI1FsipTFyJI+kSt/J/NwomJiLsd7iI5/VJbILhs4+Tb3k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_021453_902093_31D2A153 
X-CRM114-Status: UNSURE (   9.87  )
X-CRM114-Notice: Please train this message.
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

On 6/5/26 09:12, Christian Marangi wrote:
> In preparation for additional SoC support, move the Airoha pinctrl driver
> for AN7581 SoC to a dedicated directory.
>
> This is to tidy things up and keep code organized without polluting the
> Mediatek driver directory.
>
> The driver doesn't depend on any generic or common code from the Mediatek
> codebase so it can be safely moved without any modification.
>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---

For the record I plan on working on/assisting the following platforms: 
EN751221, EN7528, EN7580, EN7523 and AN7563/AN7552. There is a patch set 
under review in uboot that we hopefully can port over to linux. Any 
assistance/comments there would be much appreciated.

MvH

Benjamin Larsson


