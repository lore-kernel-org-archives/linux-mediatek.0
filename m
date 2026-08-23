Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41D83C5DF8C
	for <linux-mediatek@archiver.kernel.org>; Sun, 23 Aug 2026 04:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:Cc
	:To:Subject:Message-ID:Date:From:In-Reply-To:References:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jOJ1XyoxIFe6JNjBTJQ6V2mFzsfbfUK2TiROIkU1AXk=; b=3sosdD8XDKEy/6spxE9pWTUvw0
	7i7YsBwIIXVna9+lb9TdLvkpIHjDvhUXCOcSRRqkuf6WwtkdfyFzaiWZJOEorgZyuHJJRsEm6ixbs
	1dsxrrt35tZfQSlT2mf83flpDnxiR6Wytowmyy+XmDn5KutRCdRquWa6LOzFwwX6O+XT/tqomNkEk
	SQNkD9XFeU//iR7cRd8fj8KUSTRKjRpUgX/J5k/4mbVUK7FXVyL3N2/7lQfiKoJGDJtREsXYeMrp9
	W699xCyZJpFpKfbd5zxRuehdFgUllplKZmIB0qgzWWgNsi01aatovVAiJW3hKj9u7FzhSdsJ2DH1r
	8OpsfnFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxziU-0000000F3rx-1kQH;
	Sun, 23 Aug 2026 04:21:54 +0000
Received: from mail-westus2azolkn19012021.outbound.protection.outlook.com ([52.103.10.21] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxziR-0000000F3re-32ZU
	for linux-mediatek@lists.infradead.org;
	Sun, 23 Aug 2026 04:21:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eLLQI8OsvMfBvd+hJBqR17ME/l17uagaHfbwfnqj7ywAFEe3VsjzLxuXrVAYnBu2+AZD6sJrpz1mdVo0QVSFlR9FotM0mPjaInP+mcQVgHm4gU4BkNr5dK/xIie/57wNUI63dDUM6gSlZlkTjdcqKvbpSCpsxKTyxbdlsQiN3PwM6K5f60w3zCZPGEdHVA/mt+h3te5ib2Xt446NzBl1aCpSj1aq015vi/S+fTV24ENh6zBGsMiitDsbsc61KqXnXD7+eqAjoo2WRo74ICenngxr5Ul7blb9XKgeq0c5ZN0FI1yC1EHWG1GXaIT45hB3WU9HcwLDEbM1eE2kQuAHTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jOJ1XyoxIFe6JNjBTJQ6V2mFzsfbfUK2TiROIkU1AXk=;
 b=I6J4wHAeoScy+ll7wQfJ35WK0D7407mgwMK6rCUXvpcpn8yRicdfde8Jpg2avov1n0ynX19S+z3mns8cuNydmIa2KFW1X6Wfv5IE3NSoq1IZMgM8XHa4O6BmcoATsZQCDA1xcIZTalhzMjBa1YF1RnGqqH7TeqfvkQidhfWoZi+jVp8YB61GUu8Qy47v3gHtKW+dnGjqM4Ltoxv9HasLxwnwz4moWXNLNnvQoNoFAq87SM+TBbs4wuaN3XghnNl6lfA9ki3xWX1CAVfcS1PHxJCI4CEDaC0Zd1sfrQiwYFmBp2Kj0NJ1DV7mrX3nfUyuOQTpTdBLb4qKKM3U079IOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jOJ1XyoxIFe6JNjBTJQ6V2mFzsfbfUK2TiROIkU1AXk=;
 b=Mu8u2iT1ciQghHy5L6IZ394uS9A3TCDz/ZcNK04VotZ4SQ4eEAQA+tQQAGITW3iui+i3OmmZ+/uEuFqct+S9l7RwBNl8i23CWOeuEz8pB3LDKfZj5ajIKieGXmocUWOYPm6cmAEafz2naWgClGu+YbNVo8vIIttOgpgJuzmZqu25CE0Z5mIVGYgNZ5p981akveKOSrGAEHjsjJ3R/Ny710sSjOIxh3CagvzQKF6N90R0ymd4o8sKVdti8CKQfN9Q+tPJ/uSEmdtDr1oQ0wQcVI3A/qXxA40cmt4OHUW1yMzC16GfJ6WHX0vQ5D8QOBZBpDKLsYyoIjF87VyqjW3oVw==
Received: from CH3PR15MB6020.namprd15.prod.outlook.com (2603:10b6:610:156::20)
 by DSWPR15MB7112.namprd15.prod.outlook.com (2603:10b6:8:35f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Sun, 23 Aug
 2026 04:21:47 +0000
Received: from CH3PR15MB6020.namprd15.prod.outlook.com
 ([fe80::a655:4b65:19a2:85c1]) by CH3PR15MB6020.namprd15.prod.outlook.com
 ([fe80::a655:4b65:19a2:85c1%6]) with mapi id 15.21.0339.010; Sun, 23 Aug 2026
 04:21:47 +0000
X-Forwarded-Encrypted: i=1; AHgh+RoYW/6SeanniWw50C2OdbLKYe2oNfjPp+zF3VO2b+sRB5ZRA8gmYq2mKB2MUAQ1lySjibG80t07Y7pLosGSlA==@lists.infradead.org
X-Gm-Message-State: AFuF++n346FLfzx48YpmVvOR2KCG5hlPDPQ/Jwbcnq2OkZL102aEGEZ+
	3wN84M/o1tZ/OytglQETs14BlvQIl5kpq9qHppBy4/KEBRNH/yiJ/IjmQBvKvcPI8N95AlyXHhl
	7oYap8MaLLR4Pc/RT3cXdygg3Nb/CaIU=
X-Received: by 2002:a05:690c:6605:b0:7fd:4ef9:e5a4 with SMTP id
 00721157ae682-84c9ad37e57mr38079507b3.29.1787458501913; Sat, 22 Aug 2026
 21:15:01 -0700 (PDT)
References: <20260715044431.1207-2-mbc07@live.com> <CAGsSZgFqeNpPXS8q9VYGGqE_ONVCD-V18vf0+R6tZTS2PeKv9Q@mail.gmail.com>
 <CH3PR15MB6020E8912A56105D447332BEC8C82@CH3PR15MB6020.namprd15.prod.outlook.com>
 <a7681525-b5fd-4a34-8ba5-99e79d77a694@nbd.name> <CAGsSZgFetjvj69w6MELzMcXyMjD76SQJRey3_UW=SpvR3arSCQ@mail.gmail.com>
In-Reply-To: <CAGsSZgFetjvj69w6MELzMcXyMjD76SQJRey3_UW=SpvR3arSCQ@mail.gmail.com>
From: "Mateus B. Cassiano" <mbc07@live.com>
Date: Sun, 23 Aug 2026 00:14:48 -0400
X-Gmail-Original-Message-ID: <CAGsSZgFAP+mmmynpZzi19xQUA2B+G0PVP9so2GobAShc4EuFqA@mail.gmail.com>
X-Gm-Features: AcwNN1UQJ_OjBJCPrZDHwsf89IE1s4zjLW0leTnzvnyRO4FSdhmcjkFM0FG6IeM
Message-ID: <CH3PR15MB6020A58FAA6CCA4EE1C63174C8A12@CH3PR15MB6020.namprd15.prod.outlook.com>
Subject: Re: [PATCH] wifi: mt76: pass LED define via ccflags-y in driver submodules
To: Felix Fietkau <nbd@nbd.name>
Cc: lorenzo@kernel.org, ryder.lee@mediatek.com, shayne.chen@mediatek.com, 
	sean.wang@mediatek.com, linux-wireless@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: BN9PR03CA0416.namprd03.prod.outlook.com
 (2603:10b6:408:111::31) To CH3PR15MB6020.namprd15.prod.outlook.com
 (2603:10b6:610:156::20)
X-Microsoft-Original-Message-ID: <CAGsSZgFAP+mmmynpZzi19xQUA2B+G0PVP9so2GobAShc4EuFqA@mail.gmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR15MB6020:EE_|DSWPR15MB7112:EE_
X-MS-Office365-Filtering-Correlation-Id: 3882a515-0ade-4fd0-b2fa-08df00ce0b77
X-Microsoft-Antispam: BCL:0;ARA:14566002|15080799012|51005399006|25010399006|8060799015|19110799012|5072599009|6090799003|23021999003|24021099003|19061999003|440099028|3412199025|40105399003|2607281247196008;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q2lLYzFmN1pHd1VJbUlUSkVuU2ZhRzZXYjhUNm1WYWxqQmdzSkNqUjFiOEQ3?=
 =?utf-8?B?ekRRK3FmZzdMT0JMYUNzV3FKcXJ3TWQrcitVYmlJeXplaG00K0EyeFhiWFF1?=
 =?utf-8?B?UCtDZWFtaS9YVjQyQldWTEpsZmpDMDFQajlxTkNsR01HSXM5V0dicTRtYkV6?=
 =?utf-8?B?NmV5SFQ4dDJrNHU1b2lmS09FUXF5cFdGTWJqZXBBTTZOaWZXYmhnMmpXWjBl?=
 =?utf-8?B?R3ZRdnJNbW5OcWhuK1k0SVBvK1pTRmlzc3Q1ajJSeTQzaXFTK3loRUhzVjls?=
 =?utf-8?B?d3NxQ1ArRk1sZGZhMW9GK3BrVUN6c0hGcitFblZNUDZ1dEV5cWY4UEt6THdx?=
 =?utf-8?B?cENQK0FscFE1NlR1WXdTS2pmdFhnMmhlMVE0VHRFa2p5NDJVZ0ordHQ3OU1T?=
 =?utf-8?B?V2RjSDl5NXlhTWNuREo1ZXFWMDRHbHVEQzVrY3AwUkhlU0lTMzlnQmJBR1hP?=
 =?utf-8?B?eWI0L3MzUGM4WmlNWUhMVG52Qm1hcS9XMTdpaXhITzBpbURIcTZnZURwL0dD?=
 =?utf-8?B?eE8vcWZERklqbmhpWmNxMXdGZUI1Vm84N0doQWhwSlFxQ01GOG05N0J4c0xT?=
 =?utf-8?B?VXdRTmVqekliZzdBWHFtV0k2U3hPbUh4c3ZOdE92UUpoL1hUUHVFcUlKWGNK?=
 =?utf-8?B?K0NNcWJ6WVFvUzZ6WW1QNHgweXFpZUd2RDlrWWlhdDJSYVk3aWpyYTBRT05S?=
 =?utf-8?B?eFh4TjM4a3Q3dnJ5TlpPZFVRYm1DKys4NGRrMzlDQjJwVnZNMGVMTldpeWJF?=
 =?utf-8?B?RjBUYVJWeEp1L3R3d2hzcjVTckJtcm4za0NtSjRvdk0yNWhEQTh0d3YvczlM?=
 =?utf-8?B?eXYrV2ZXM0FSajZqYklZWlR2cnRGWGw2Q1JSWWdBcHFobVJWOHZoOGsxQnNl?=
 =?utf-8?B?WEFQcHMrWENIK3ExK09vazBiaytlT2s2eTdxSGZzaE1wbCt3UUhwZVN0dEZi?=
 =?utf-8?B?aGdIS3hObWJWN1pCZzBLamhxbXRVdW9qeUhGeVV3YkZ2VklBVS9NVFBlcVBN?=
 =?utf-8?B?bDhEZENNa0ppS2N2ZE5ZWGhHN3hNNXlNSzFaTnVrRmE4bCtJcW1Uc0pjenZQ?=
 =?utf-8?B?Mmk1NnQrNDk1UERmdEYyaFpXWWYvN0ZERm9MMVEwWHNNa0NCNzRadjcwYTA1?=
 =?utf-8?B?ZkYyeGUyalpGUWpSeER6Z3c4cW4yVWdNc0ludGFPVzl1TUNpd1FkWldWL3FH?=
 =?utf-8?B?bjZqc0FCMk9BTjJFTGZJOWIzZEdKNVBsVGNqOTJjWk55enJ4djBTKzFBRDNy?=
 =?utf-8?B?WGwrOGM3WmQ0cS9LTlpmczFtUWZhOVZSQmRlRGJ5aEQ1ODl1UVV3dTBNOEV3?=
 =?utf-8?Q?lgWhxPrXl2DR6njfa48n95WVA/CTWBgYKE?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c1pvTE5TMGtPTTZRMXliZzNjUXFzODhxRENqdVQ5YU5SS3N0Z1M1MEEzYW9O?=
 =?utf-8?B?djJGQnlHUzJ3ckFCRmJjMkh4ejBScmNXQ21qWjBvUEkwTGwvcUp0cTRJN2pw?=
 =?utf-8?B?dFhqZzhobXNHbUJBUVlFWjArMlYzUEQzY3k1SDZuSXB5b1pXUnNsZ1JXaHIw?=
 =?utf-8?B?NHBJb0c1WmtRUEgzZXJ4WXh4UXFHTjJtU2hTWGl1TURrUGhqWitZblA4VEZW?=
 =?utf-8?B?Y1ZHcjYwMVNaNUxhVmozbktzbDl2NHFIQVRKSjRoVVBydkNUdTZzbVZuYlA0?=
 =?utf-8?B?M1UvbzFBZGZvWjU5ZHZvTS9qemJVTlYrYVg0MTR5WDMreFpUVHRYYWNwNjdH?=
 =?utf-8?B?VkNCSDkrRXRZbEROeVZyMjdwamJvZEVZbVBLc0NxbDlzRlZFSlJvRGtUcmN2?=
 =?utf-8?B?UHlLM2VTb3FJSzhWaHozdXI2bW0yc2FwMUJXUm9GQ3BTOFg5a2d5OEkwK1JW?=
 =?utf-8?B?T2FpSVJmWW1wWmovdmc0NlJmbk4xM3hhVlkwWGUwTjByNzM0eUhsSmNweFdt?=
 =?utf-8?B?N1U5cW95OHBkanRCRm02Qm5QRzVnWHNseC9YMUtCSXRGaHJNTE1rMGJseFYv?=
 =?utf-8?B?L0h1aTFzenArR1hZelZ6NGlhUUFhcTJIR3hWdzd2QU5XOG54YnlPZ0FnYTZO?=
 =?utf-8?B?ek5ad0JDTXZwVUI2bDJwTk82TnhPU3lWSmhTY281akdOU2VZZjV2SlJ4OFI0?=
 =?utf-8?B?T2Y0bnNVUldqUWdjbHdmSnJBZmpmcmVmUzduZ3hNTXQyQi9mMGhaZjVZYVli?=
 =?utf-8?B?VC9FM1dBS3ZqbWFuSXl2dC9WOHNRMjh5T0tZZEFvdkZFZHN5UTJlZXRISnI0?=
 =?utf-8?B?bm0xTm9lb3N1enJlZk9Zc3BvbS9wUlFGanluUEgrTDlzWVE3cWUvcHdFYUIy?=
 =?utf-8?B?cXJVRldsU3RwV1Rwa2JoTDZHeHpUVkJUMXE2L0gyRnEvczI2WElKcnZ3Zlpk?=
 =?utf-8?B?bDRKenU3dUtELytGZXp2ZTlnQXBIZERmNUtpV2JEbnZvTVB3eUJtUUkyZEtS?=
 =?utf-8?B?Um5zc3hBeDI3U0JVbVhubzlYQ082VXFRQ21qMWkzRWxsQ1I0a3VVeDlpL1ha?=
 =?utf-8?B?Y21FVTJ6V3B0azl4TnhLMnU3OU5LemtDUWdsTFRKdlRBaEg5U2ZJdStrUE5z?=
 =?utf-8?B?QTlraWl1UGVFbVlwZXdxM0VLcUZ6czFHZzlXbnN3Vy9BY1pETVNlem9RUDBS?=
 =?utf-8?B?cUl6bFJFam44OXBLdWwvVEVqUlFmc2FiK2hleHZjdnVZeVBLNFdBSldQTkRo?=
 =?utf-8?B?UG51a3NXYkdyZmFZSGloMENjZ0NaZTg4WDZsYzlIWTV3RDFJeHhvdm10cjQy?=
 =?utf-8?B?dFdBdTBqUFp2ZnpXSE0xQ0hGRzZOVFA3aHVORHJzb3AyNE5NOFI1b04vQ0VS?=
 =?utf-8?B?ODlSZXVIdzBGOC9NU09KQ3VaQWRqMUtDaU02c0xEdVhxcEJxQzZqM2hlbUc2?=
 =?utf-8?B?N3VvQjA0OUFOZmg1TloxQlJ0NGZveWtZcXpDTjR4dGVud1lJSU5wazEvWUth?=
 =?utf-8?B?c1RTckJuWThiUWVNSDd0VkxtODJ0ZUxHMEZ1L3BTby9OcVRIZXFXS2pJcjdO?=
 =?utf-8?B?WnMxQk5GQ2lGQ3BMMVJ0WVRLbEFsT05iemZZZzQ4emlWejV1dDJTcDlhODUz?=
 =?utf-8?B?czYwem1MQW9iT1lzSVh5N0h5bTA4Y0ltMjhzVkU4ZjZBT2w0TnAvZXRWUzBz?=
 =?utf-8?B?cHEvb20vVGFibzdFRjR3WXlrQVVsUGl2YllXU1hFSkJ1QjgxYm5rbk4wbjE4?=
 =?utf-8?B?OHV2bkh6clRaUnUwYXovQ05ZNFd1Mkx6bEtHRlFMMXJuUDdaQkRwVUtUWXlq?=
 =?utf-8?Q?OjlRz9MEgBzfcGBlqhtcYICI+S/oc0GMF9J50=3D?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-d4257.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 3882a515-0ade-4fd0-b2fa-08df00ce0b77
X-MS-Exchange-CrossTenant-AuthSource: CH3PR15MB6020.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2026 04:21:46.9874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR15MB7112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260822_212151_797700_B692ED77 
X-CRM114-Status: UNSURE (   3.01  )
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

For the record, this has since been merged upstream as of
c5a3bd91aa735b669618610d5f0ebfa5786845a6

