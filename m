Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ECECC54F54
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Jul 2026 05:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:Cc
	:To:Subject:Message-ID:Date:From:In-Reply-To:References:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RFksZYSkXTd0uiZhqAEjcRH+JjaeD1z1ZAqsbf8XdNU=; b=mKSGJVkoNrR1gYg7lBeWcrGV/8
	BV7RBv6RYmCH5JtXd7HUlpNEsmHgqDgF3N7T83sDNKn3VYTu8UZYzV0dW8XY1dZLm6X6XVG2Ucq9f
	49/eunqYPIHi73nNGVeDl+TE8q4o0P/GnCZ3d1XjA8j5aOqK8FJdJ5h1MHXUxy2JoCmp/4xJIF2RC
	u3bpp5h/pvAdWE7GYJS2UvVdhDJF2OJE077lIuvL/YYrwlZb3ob6zNpA3Td9G4+8IFKttEpvYOhTZ
	uIJQgB6+LVx2SdZMZLMM/KfWOcLhzNwaWKSW+jqkzvCiXhtlHXu4+76iMeCvIMyRbBJBw01lTn+KD
	7kzeGk4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpg8d-0000000Bq6m-2tei;
	Fri, 31 Jul 2026 05:50:32 +0000
Received: from mail-westcentralusazolkn190130001.outbound.protection.outlook.com ([2a01:111:f403:d123::1] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpg8b-0000000Bq68-1NCn
	for linux-mediatek@lists.infradead.org;
	Fri, 31 Jul 2026 05:50:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BNSMh0Fh3Fs8saGioSt4RwC7OOZNcIRqHSpEzfgWIsGlrSdYFym0Ykxst7fZwVQT9CiJ7JzquBFRH0GuE9uKZuszcokcHppTVqMc5exXDYwBdj9rRBKHyfbOgEBjpMUoAN4vc8XRWJvA742El52ao4mHlDHmPA3k/FqRaE0VLVSixFpP8tmNW9bbmGyVV1fHGO49sfQ6Jj7XBMW2wnuM3BsOl8uJHhyMv5s0nhnpd10zVgs2rjsF8TlNRx/IJ95WZ9jXmsHBkufvRVjAuGPDTSt+t9CoE7LuGpoTmTEbaqrlbNS7UHOfJXzHnaEF87i2LFHAIRIi2EcS1N7CiZH2gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RFksZYSkXTd0uiZhqAEjcRH+JjaeD1z1ZAqsbf8XdNU=;
 b=qT1GTrNCp14AgrkpGJoKn4G2Yigvc5h54JYDdMGwy/x3++iRmmwJFPXme3OmUQIVfoeZcmTg7p5noh6fLMjb9JYEZLEsacuzAY81EBfByxdxgTaoqHj0JOZgk3s8BdvN6cp5a9vELVKShccqKVK7wQfPfi2igH3cFy/Xq5cuH+g+I9q4QWfFC7T6bB29m1Ez1QrQWfwyeZqvVQUd9xJkVV2MxGPyFicWHacRKP30X8/O3RXTXOKIOWSY8hjyxx5sg0l7X0dsoUglJRBHko3IH9BQVx/9sTEzoD1qKmXJjsYVu7zKY4AexUbcL7xj/jalbmTBxZ1pjyGIhIWTWUXnyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RFksZYSkXTd0uiZhqAEjcRH+JjaeD1z1ZAqsbf8XdNU=;
 b=icA2rpBKWOauQQN/9w3IgHc8x03yS1ufhYrtby6Spc/YWxtak4vIX18WUy//mugq5mgtCqhO+agksvVkOzvKEKSQQgOAz0teIFawRur9bjbiSgbg97/YJqIagA79GzbLvefauG1EixMSsOG6RRVxBY9dhMDzOBErzCJsZKswUM6PUYwPNvhzI/+z1yVzjUd3sbaneGfabOq6HrtPfGGRg6qllF+MZ8odkdaZ5IvfW+2fPIsgzvBF1cTcmoo0c2Ru/qOAxNUlfaBw6O4VL3JfiTNYGqG9IzIM8pp7npqQyhA1Rt7dB1ndhaHrFFmlZvA4GFkhEQrXVo6n/+jMm/I8bw==
Received: from CH3PR15MB6020.namprd15.prod.outlook.com (2603:10b6:610:156::20)
 by MW4PR15MB4636.namprd15.prod.outlook.com (2603:10b6:303:10d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.16; Fri, 31 Jul
 2026 05:50:24 +0000
Received: from CH3PR15MB6020.namprd15.prod.outlook.com
 ([fe80::a655:4b65:19a2:85c1]) by CH3PR15MB6020.namprd15.prod.outlook.com
 ([fe80::a655:4b65:19a2:85c1%6]) with mapi id 15.21.0270.012; Fri, 31 Jul 2026
 05:50:24 +0000
X-Forwarded-Encrypted: i=1; AHgh+RovZaqTZSvazKbfKIZ5otjOiDDdEiw88MyOZWRlEYCzJ2C4Pt7pFFIvCi9WhmS331rcrbwrdl/0aYg8AufaZg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyHE8hnLf+dfCplKNFAE8EoZa9+VQ2BSw89rESppULchj5ccr+m
	LqeyFkOIF56KcVOtF20iPzmgWgGquiTtburhmbbwvD2UfVB9jatYyXdEvBfF8p9hEvisoocKAy8
	WfKjVYd0Aa6TAL7al4WwY1L9bEiELlEY=
X-Received: by 2002:a05:690e:4544:10b0:667:db13:bdc1 with SMTP id
 956f58d0204a3-669484c1c53mr96701d50.9.1785476623809; Thu, 30 Jul 2026
 22:43:43 -0700 (PDT)
References: <20260715044431.1207-2-mbc07@live.com> <CAGsSZgFqeNpPXS8q9VYGGqE_ONVCD-V18vf0+R6tZTS2PeKv9Q@mail.gmail.com>
In-Reply-To: <CAGsSZgFqeNpPXS8q9VYGGqE_ONVCD-V18vf0+R6tZTS2PeKv9Q@mail.gmail.com>
From: "Mateus B. Cassiano" <mbc07@live.com>
Date: Fri, 31 Jul 2026 01:43:32 -0400
X-Gmail-Original-Message-ID: <CAGsSZgEN=OXW-fVNub4tCJ+bMmpOC6nnXKC00+fWSi8zhvpkiQ@mail.gmail.com>
X-Gm-Features: AUfX_mz9I0vGiOdLuzgsgzbhEV-n_RKf1RB1px9tdjzSh8sTyOzo_MT74_vt7c4
Message-ID: <CH3PR15MB602047A6674082E11215C471C8C82@CH3PR15MB6020.namprd15.prod.outlook.com>
Subject: Re: [PATCH] wifi: mt76: pass LED define via ccflags-y in driver submodules
To: nbd@nbd.name
Cc: lorenzo@kernel.org, ryder.lee@mediatek.com, shayne.chen@mediatek.com, 
	sean.wang@mediatek.com, linux-wireless@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: BN9PR03CA0539.namprd03.prod.outlook.com
 (2603:10b6:408:131::34) To CH3PR15MB6020.namprd15.prod.outlook.com
 (2603:10b6:610:156::20)
X-Microsoft-Original-Message-ID: <CAGsSZgEN=OXW-fVNub4tCJ+bMmpOC6nnXKC00+fWSi8zhvpkiQ@mail.gmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR15MB6020:EE_|MW4PR15MB4636:EE_
X-MS-Office365-Filtering-Correlation-Id: 267917eb-6f77-4cf4-2b08-08deeec79d53
X-Microsoft-Antispam: BCL:0;ARA:14566002|6090799003|8060799015|19110799012|15080799012|51005399006|24021099003|5072599009|23021999003|25010399006|40105399003|2607281247196008|3412199025|440099028|19061999003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ck15Ky95NjBTNWhpZ2VYcmFtTXdBTStSTUo5ZEROeEdmeFY0bXpWTm9EbUVp?=
 =?utf-8?B?NEVJUkdPUSthb2RBUktyeWRmRVlNbStRRDU5bGZhQ1VlN3NYcGhJQTUreFhu?=
 =?utf-8?B?WkduZGZTbTBrODhkY1l6ak1ubjk5K0xDQ05yYWY1bncralFIck9NekNVblJq?=
 =?utf-8?B?c3IxbFR4ZjBSV0dqakZWdzMvL2dBZmd2QjJJQnBlTW1uU3BnUWtpY1p4emV4?=
 =?utf-8?B?NWdNU2VlSFB6dVFrVlJKaFhNR2pPODdyWTg5WldDMk1JY1hEdlZuRWZFSW1s?=
 =?utf-8?B?UEtKclZJbTZNRGFla1BtaVVyL3M3VFE3S0FiSVcvcXBCNW9ZTFk0TFBCQ1Fw?=
 =?utf-8?B?RjlPcFRvK2hidW90cnh1dzRLZzB3SnZPUHNPcFFaYlVrTElJVno2bXZOT2g1?=
 =?utf-8?B?Vnp2OWdKQ0VBN053NWpJeUpHd1U5V0J6WTZjQUtNdzhZZm8wSHppTnlYd0lP?=
 =?utf-8?B?RXpHN3hPR0FWTDdBV24renBvZThxVzl1QTlBRXFicjhPeCs3UEZ4S28yc1Rn?=
 =?utf-8?B?SzBLUndqeFdRMkFPZUhadFdEWUJrak1iNStLamk0cGJ5K2szTzcyV1FvcE9t?=
 =?utf-8?B?S01jNXZmUmU5bG5wZjU5NWcyc1QzVnV4bStMTTc5SGFpUE42akpKNyswV3pz?=
 =?utf-8?B?OWt2ZUd5Q3AyUWNYTmVzdjVGcVFCMmVMTHJRd2haRHZIaHUrN2xVVW9WVkQy?=
 =?utf-8?B?RC9wNWJETkVYU1BGbC9TUlBaMy9VbVNUYkFUZmFJNXB4V0pZR3Ard2c1VU5L?=
 =?utf-8?B?T0xrZzdvU0JONmphNTJIZmJSYTMwMm9pVWpaV0tFc09Lb05aN0oyLzBPNlBr?=
 =?utf-8?B?aTU5cTlMQ3pVUmg4SE13MU04QlloM2I4cVFoNTFCU3JTc1ZveVBlc0ZCUEls?=
 =?utf-8?B?VUVPcDlNRURSOGQ5Y01hSlEzcllvL3NITnRkWEtiSXgwVjFBZ2lFSzBrYTFU?=
 =?utf-8?B?V3B6YVFkWjZ3R0U4TVVNRXBvR0FQcVgvYll1NHBHMkdQVFZ0aXFoYTg0TC9z?=
 =?utf-8?B?ekk1a003a1hOSVJPZlY0ei8yZVA3UUo4MUp0UzY1Y2kwa21RNFM0eXVqdWxn?=
 =?utf-8?B?SHJhYkhhTnA4UC82RWo3V3p3TWNsRFJXMmxmR3E2ZzlNWFV4cGc5YXVRUlQv?=
 =?utf-8?B?emg0bk5lZFo0Y0hVRkxoRVpqV3lhS0xlUzlReDJkTTlPTmlZbnYyYkRNcFp6?=
 =?utf-8?B?YnFlb2xPdU5kTkI0WXJlYW4vSkRPL0RoTnEzUEJJOUZKNFZxdHgyMnBXSmhO?=
 =?utf-8?B?cDBqR2JaL0V3cUhudlFnejdWeXFxdFdMdlJ6TndJT1J2ZFRkanBLbTRYb2ZQ?=
 =?utf-8?Q?S7S7aNNHSFM3i+YpYlhIbm5L0XfrqxN4lX?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bDRxdHVGcGNnMXk1aldmSnVXci9RSlhkMWZJeFhZN2d5UXVqMmxZV3FHSVRm?=
 =?utf-8?B?VFl0N1pXdlh1ZmZGRVVNNEl4cUJBb0NHRVdHUjJHYU9zYURtY3FUckxTWmRi?=
 =?utf-8?B?a2VUYWNvdm1pR3hFMWF1RTRTK1FlZTYzRlloMEh5Q3RZV1dRM2diMWxUTStj?=
 =?utf-8?B?dnNadWtMdHA1QVZyZEhONUV0RmxOVHJGRjFXRTdQTUhVR0xaSW43empIdHNo?=
 =?utf-8?B?ZkdkSGcxejZsRXlqYnZvRGpoTnRVQ0VvQ2R4OFNVdDU5ZnBFekhzcWVhZy9H?=
 =?utf-8?B?dlpqZktsRjZVWTlSS3hoeUpZeHF0cWdLVlNSOWt5UjUvOUxjZjZVdzB1RW04?=
 =?utf-8?B?ZTg1Nm44WkVodzd6UjUzTGFGbDltRUxvN21KVTdKc2F5VkRjV3psaks1blNF?=
 =?utf-8?B?Q2YzVmt4UzA0RVZucXFZNVdjWk1ZdFFidUNZTzltWWhnTHBKQkZPbU1wQXdp?=
 =?utf-8?B?SjBVOVRlYnc4elVUQVRmWnl5SlBRMkJVc1R2c01jNHpaOWlaSnlMbjdqVWhi?=
 =?utf-8?B?cksvUGJzcVN1c3FBZnkzZzJxaktZVjJsZnMxaHBiSmhjUTliZTdsMXhRTjZN?=
 =?utf-8?B?anVSVmUzZGEwRnA2dHdFZWIwSDBlUXpLY3RvZExjMDE5aHdvRE81cEQ1V1lv?=
 =?utf-8?B?OExUSDlYeHJFNDNRK3o1VWs2UVh4QnNuYk9HS0IrVm01UXRhUktUa1V2Rncv?=
 =?utf-8?B?cXBaRjlTWnZFVGh2QkhrTU5HNXBiTzVHb2ZOdVdQSk43VHBtaHE5ZUhGTTNK?=
 =?utf-8?B?d0FEZi9lNkNTWVJsS3RFL3JCUW1hNVR3bDNNSkQ5ejR2aHY0WmREYjRJWitB?=
 =?utf-8?B?TXY2bWNVL1RIdU1TbDdWa01UWTRMZFU5UmlQRzg1ZnFzZEJ3MzBxZGZVb05m?=
 =?utf-8?B?RGhpYVg2UzY3MXhsM0gvVkJYdGF1Qk5GZEVwVmpGQ1BwZTVHSGlFRVpOU2FW?=
 =?utf-8?B?cVBWZC85NGcrZ3o0MWhocWgwL3F4TElqM2NkWXp5dG9kaGwvNkVTS01KZ0pM?=
 =?utf-8?B?NzNYWm4xRTZqK3lwaTRkeTRkY0gwMlpIYkc2Qzc2KzF4cnhvTmlBaGFybTJX?=
 =?utf-8?B?NjBlTlZhbHgvT1RqWmpKVUxmWEc3VnhzUjdMMW1IWkFNTi81SW0rZzZTY1JN?=
 =?utf-8?B?US9td2ZmeGtIRm82M3NMdkpVM05LZGFwYTIwNzNPYkM5V2I0MTBMM2xJR0h0?=
 =?utf-8?B?VjFNRU4yNDNFcnd4ZmJ6c1Z5K0NyUW5FREswZjBqS3NqdE1hZjlIalh1R09x?=
 =?utf-8?B?cmxQbUxZelM1YllDQUxpbW5GMy9wQ3ZmOFllZ1JnMWhxRndhcTNVVVMrMEtM?=
 =?utf-8?B?dVFGNVYrZlpWYm94NVNvTEl0VzNNd1EzbTVrNEIzaElWbGpzaytScjQvdHZS?=
 =?utf-8?B?MzhlOTN2SDVob20vWlJrYXZQR095UEV0KzUvZUVVYlFHdS9EQnZYUjJ5N3R4?=
 =?utf-8?B?eS83THl5ZUc3TkhuUHRSKzJiWmcrc2VhVkIyUi9ST2VvY1dLajBER3pxc2lK?=
 =?utf-8?B?SmNlenoyaG5PcUx4NjlIbHVTTVA4ZVp1UTUwRnFPZENBRXMwRkpWOU1FemxM?=
 =?utf-8?B?d2d4UWl6alpNZGpQYS9YejNLNFRjQlZDNGErSVdaSEtTOEpwS0hueVZpZWVG?=
 =?utf-8?B?ZDFsVy8rc2g0MGdXVWl3cjhxaTQyYStseG5NY2NNa0UvSm8yQTZyanpHTGdQ?=
 =?utf-8?B?NXJoTmFpWjNvRU14dU9jZ3lOam5ETURwRWp6NXZ6bzZHUjEweXVjR01RUVYv?=
 =?utf-8?B?RmtSVVk3RHNHTEtkMjZJQ29nOUo0Y0JjcEtVTW54YWhLYm9VeFJzTFJZRWs2?=
 =?utf-8?Q?WAIYzn7ox3CZ7viPAgcOr3YYmbH3IF/8u/Zy0=3D?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-d4257.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 267917eb-6f77-4cf4-2b08-08deeec79d53
X-MS-Exchange-CrossTenant-AuthSource: CH3PR15MB6020.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 05:50:24.3624
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR15MB4636
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_225029_371662_C3CD0563 
X-CRM114-Status: UNSURE (   3.99  )
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

Hi,

Gentle ping on this patch.

The mt7615 change was tested by me, and the mt7996 hunk was also
independently confirmed on hardware in the follow-up above.

Any feedback would be appreciated.

Thanks,
Mateus

