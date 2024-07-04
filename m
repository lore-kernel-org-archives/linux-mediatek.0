Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29A6FC30653
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Jul 2024 11:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:Cc:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w1tkJAh8DqqS2r8otToyTzLNaNek4ZrpGUpjDJgOdns=; b=Pbnu9Xrp0VvfjLYrqLskaxkJtF
	7j+sutB+U4LMkFVaFJpudaLoePsoCcnuPDCUltwFKxXRMDdBr15Dt7hSvBOfbrmLtFkuJ57KFeAid
	kx3NFL/m8uliJRdc/7WQUJYiRSIvmcEhkGGpxb1bktOFgQKZ7fqMCBsF1DhZUbnhyEMOXcyB4P5xp
	CYqdYwQVXZOFLysvuOh34oifoc+ERJYLMB4/Oh2skiWPpKaAX5xpOGhHir8g0Ro3kZz0r0sIvifqy
	YfzT4szyT+1lwigkLJJtVI/m+Ii5vDrUprZuDVDtsF/YhutCMk0n+V2yW6c+SMVsBClArzetMRMXK
	05W+D2jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPKNV-0000000CyGo-1lV5;
	Thu, 04 Jul 2024 11:11:53 +0000
Received: from mail-japaneastazolkn190100000.outbound.protection.outlook.com ([2a01:111:f403:d405::] helo=TY3P286CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPKNS-0000000CyEx-23bj;
	Thu, 04 Jul 2024 11:11:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SKaSNUrJNWq9aTzxGsmjHxmBIv629XGlFgA0mjOtm9vOJsHWoGllSMpjsPEBGg4BXCi7g0txZnyV5KDTKH1wNzbBWqQbIRjEmLflDVm1G8fme0Lm3Mzpmu9gNNXiIgIGXZFnBaIUEH/0EI1eHPpcLZqcKktOKh55/VPQS7n3Gjc4RyxSImUsxc9KY03YlR1Jqnm88HAbdofYppZ8qTsezhv8HS2CMHMVJ7gkIXr1l2+6rwyxtLC9sO1oSAYBgod7SfOiWxYVYf8eYooYUWgbzforbG52tfCoMdcK/6dBSinmO87dLoNHdyAFqbMWo0Hd9ZgkUfemldVLIqKItiMgww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w1tkJAh8DqqS2r8otToyTzLNaNek4ZrpGUpjDJgOdns=;
 b=hJWQ2DvL2M1fQJSkbrmF3gkZfTwG3bTAPcfTBtDDUCBpSzXCIIjedGD/higRDNoETDDn1ifIwtgHzX4f3lrIV2tmJ3VK4p9fsnnRanXBv4HC1FNiRI3rtntJ5eRa/ALxJY+/XEzgbUbcj+tkDHfticf57Z6Brcp+o5ELQ41mvUg4nDu64SBU9ntuRImcNptUEv1SM3fEtFMsyAZqhxtrLtIBBhdfBaqXaMHpfyip7R4YCgg9phr3xK8Wp2FT+FOsRb/XYhV5fzBau7UdNvif6+YhuAJMuF06ptifBEqhEbB9RE1915f9EI/yn/tFYSlLf54OmNvCNjjbHU92yeU3fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w1tkJAh8DqqS2r8otToyTzLNaNek4ZrpGUpjDJgOdns=;
 b=Cu+0HQY8j/x5XIAyG5K8zYFRFZO0SAVQHEIUM1sXtGAoPoku+7isblJYcKMu5p9kObN9Cle+NjsJEpZBLb8gQxiRZQkVJqR9s9HWqgBtthCvBPtFdIVBH4t9NFJv3cC7dyAwG4M+SePq93bzK/Myl3pOPHGLQneHTlITJk4Yk8k+wNuzBWHIbxiDDYAF6sTH/W7UKwQeEyabqjmTWFfVgGEpV4QXkPGGmw70FG71ETf37kr8LFxBXxv8nFDfnhHUxZrSgX+JEzseWdL4jKX4wETx53lU71gtBMLlludGGLCGw0LacRqc4wOwR09RpKnX5rsUFik+M4VPGGDwbszzjQ==
Received: from TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:23e::10)
 by TYWP286MB2777.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:248::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.33; Thu, 4 Jul
 2024 11:11:29 +0000
Received: from TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM
 ([fe80::85b8:3d49:3d3e:2b3]) by TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM
 ([fe80::85b8:3d49:3d3e:2b3%5]) with mapi id 15.20.7719.029; Thu, 4 Jul 2024
 11:11:29 +0000
Message-ID: <TY3P286MB261180E580D838704E6123B598DE2@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
Date: Thu, 4 Jul 2024 19:06:29 +0800
User-Agent: Mozilla Thunderbird
Cc: wiagn233@outlook.com, nbd@nbd.name, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, lorenzo@kernel.org, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, pablo@netfilter.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 stable@vger.kernel.org, Elad Yifee <eladwf@gmail.com>
Subject: Re: [PATCH v2] net: ethernet: mtk_ppe: Change PPE entries number to
 16K
To: Jakub Kicinski <kuba@kernel.org>
References: <TY3P286MB2611AD036755E0BC411847FC98D52@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
 <20240702110224.74abfcea@kernel.org>
 <TY3P286MB26119C0A14621AD8D411466A98DD2@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
 <20240703164818.13e1d33c@kernel.org>
From: Shengyu Qu <wiagn233@outlook.com>
Autocrypt: addr=wiagn233@outlook.com; keydata=
 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
In-Reply-To: <20240703164818.13e1d33c@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TMN: [VjWDQoItHKPzoOr1QNrajdFhJLET1UrQ2TpucUIf0flIlzx+nyfiStupp90yw33p]
X-ClientProxiedBy: TYCP286CA0065.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::6) To TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:23e::10)
X-Microsoft-Original-Message-ID: <9ef43904-d60d-459e-a39d-1554413b056c@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3P286MB2611:EE_|TYWP286MB2777:EE_
X-MS-Office365-Filtering-Correlation-Id: e2109164-ea5e-4905-7d17-08dc9c1a0cb0
X-Microsoft-Antispam: BCL:0;ARA:14566002|461199028|8060799006|4302099013|3412199025|440099028|1602099012|1710799026;
X-Microsoft-Antispam-Message-Info: FMaxJW3w4EwsyrA6+nj028v7g4C5gxyBKsGWDF4PuA4GHLTibskrWRpIohYvHAf3H0sm3sLnO9trnjIOkTXbjeMTJKqZpopv5DxG5vZ437ugJi3/LJzv7q+vppvsZDlY5Sv49fRJLiuOVb+PQLe5AcC0LqhYw22m1/TCMoczUcLSoiFR2Fi10eM7gUam10Y5IriES3bMa0WGdNXEzuoEjDCld8DfaZJsJEYOqy9kk6nCT/WZGtzIiM3tgBMDckycpyLvhqDciciIMMValTmxHyWdYudz/x7lo9QEAo5K8Ocoe3hDi5l/RpmVtMwIxxqjDJOv56yyC+NU+HZwqL2yLzsKnAoIXhu3L10DYOoMRtX2vwHjPuMmMyX4cQtO5eMl/QUDKwszoZFNK/j0K+42UjtvZ1wo8KeIXLcvN2V3Z4+RYE7mGMM4aryeq5Pf/TV+7QzlSGw9XN0UeOqhMPDXUqc84nDTRYeKfs7qmg3G9/SU3cFoDYLhhwlyot1wdk09tCZZTcv4TyblngFFJQ6SvCSFrRd9xrzqT+78tb8LBSzzbr7FhOj+TP9Z8A8ybuA+79rCQPpXlPMiC7Fo0BEcVV/l2x0hLNQQWWavKnQg5nAIKgmlWfoHcatxQYTh2t8Lt/oi4i1b8GZOnxlmzCGx7PJaOWmxMUhYJjf689t1EaAM0/xFhxvvZh3lUc27+HkUTu+Yak0vROTfnZUXNfsL1wezODwdZr1952wik+aW25mvM2mEsFMBKpnHwFOFmnfe6kMyT3vMgRlREf2vOA8Sfw==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVUrYmlKdG9ZVWc0OFZKUWJCZmw4VHVSZHhBWTg3RGtiZm9rZE8wQ295R1g3?=
 =?utf-8?B?NHFSelYyeXRORWhYYUc0a3pnWWUwS3ZmVXBDdEx4a0dnT2JpNkVsMnFzOEZF?=
 =?utf-8?B?WlU2Rk5hNzNYckFJTEE3VjdWL1pWd0U2bkRtSGZZbGRJeWdkcms3MlE4Z3ZO?=
 =?utf-8?B?MVVYbGJ3MHhjTnJBTHZkS0tLS0hHVDZVZVhFR3JmSU1RNENFUDkzUnBxazVa?=
 =?utf-8?B?WEdiVGUwY2FUY0xOd3QxdFVBRlNiaE9hVzh0bEFnQi9LVDVCZGxxR24rOGYv?=
 =?utf-8?B?eVNHcUtJKzY5Z1FTYXBqZFA5dUZxMloxUmtSZmRWYk9Tbk1qd092VnBvWmJG?=
 =?utf-8?B?VG54cnFhZEFzY05VNlV1K0g2b3c0N1g5citYbTRZRVFTb0h2MWhVZEZqSk1M?=
 =?utf-8?B?WUpDWkxOYU1SelE2UUVUeGpoSHlvczJOZjEzeHdzTmxndGhSYXBYdEl1dHN0?=
 =?utf-8?B?N2NoMmxwekF0VDVKSzJuSFBwOG5neldiUU8ybDUvV2dDR3NmTTRZeGhUemh6?=
 =?utf-8?B?V3EwbDZjek5lRVovdWg5aDBCZ042d2xkWXFyN24yN2dTRzkyUm4vUmlrUDRu?=
 =?utf-8?B?ZnZXMFpLanlrdWhueElZRU5WVjI4OXZIUG9xd3RjU01aeWxWR0ZVVHVzZ2l1?=
 =?utf-8?B?bm5KeDJFQkdlb05ubFRqcmpQdElWNUkwa1VXaHkyclZvSUEydXMvL0hMUVBE?=
 =?utf-8?B?Qm90Tm5HRWtFQXl1NUt2K280dnFuMWphTCt3WS9PdmRNL2NmakJpYTJTUVFi?=
 =?utf-8?B?c1lhSGdRcWx1OTYyQ2ZGS2E3b2ZqbDBQMDFWOStNby85dWNhakVQMW9SK2FY?=
 =?utf-8?B?Y2FyNk82cmFQTjY5L21XZndIR1MvcWp2TFNJVHIyY3FJRXN1amN1bmtyUStP?=
 =?utf-8?B?WTRERG05L0cxYXBqRjZvdWprSE1ScTQvcXlIdng4SWVWejltenBmSE11N3U5?=
 =?utf-8?B?ZFNQdmxmNTNCSW5JZ09aRTY1T0R5MERXT2hJS2ZMWm41ZVpEMkJ5T0U5YkY5?=
 =?utf-8?B?Q0RORytvKzdhZ1E2K1pnS3NoOXRHdDhpMnZ4bGFiMHRxelpOQW5Qcmx3UE1n?=
 =?utf-8?B?VzNsY0dBWkRvaHEzY1pVZDFGOEhsQTlhT3F5Tzhicnl4dUVENEJYWURhZ1dw?=
 =?utf-8?B?a3p4b1o4WUdQKzhKTUh5c3ZkS2k4TG83ZnFobnhMN2ZxZ1BFbkNMMEJ6cllZ?=
 =?utf-8?B?Tk1FTW4rSWRqRHlEd3RNUHBtRC9SSnYyTHFhNzJKRFpMNk9Na0s5MVRrbkJT?=
 =?utf-8?B?c1czU2JlUnFGQnZCZzF2V3lvMG9kQ1VCRS9BODBRZGQvUWJ0ZUFvTE5QekRp?=
 =?utf-8?B?dlM4TzlUai9Ncmc1MHVFeU9RS3FvYmpkN1VsN1JCWlJQRW9pRnhHM2dSU2lr?=
 =?utf-8?B?enB0VHVwRFBuWjU5YkppTm1qemltbVl3MFdUcXZpK05FaTJOcGVIdEFYODVT?=
 =?utf-8?B?MWZPUVpPQVdRZXErMVRXampCaXlyOC93dS95WWVaZ0dKVXVJQ05kM0IrS0FE?=
 =?utf-8?B?S3M4NXpNMzZoTEJDNzJFL3FVRXJ0NndISUoxQWNiMUIrWFpUOXhsbCtiTFc5?=
 =?utf-8?B?aWY4Wk9RTlQrVitORHlXbStGRGhBa2JTbGU0WFVZVUM3NlBkLy8yeDgrSUxO?=
 =?utf-8?B?S3JnbXlYSFQybEQrVEJmWnQ1Zy9XbVR3NVA5NFJNYXJ4aFdkSU1ZOEJhQjlQ?=
 =?utf-8?B?ZTFEMjgzS2lCdzJJRlRvNHlXRXlWUVpDSk1FWEpQckIxZzc3eUhxTHprdHE2?=
 =?utf-8?Q?Hg7KWIAmkSHcVzxoUI=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2109164-ea5e-4905-7d17-08dc9c1a0cb0
X-MS-Exchange-CrossTenant-AuthSource: TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2024 11:11:27.7556
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWP286MB2777
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_041150_562664_A3A53E5D 
X-CRM114-Status: GOOD (  11.30  )
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

PCDN means P2P CDN[1]; This modification already exists in a heavily
modified openwrt fork here[2] for over 2 years so it should be working
with to regression. Although a higher limit would be better for PCDN use
case, but only newer devices like MT7986 supports 32768 max entries.
Setting to 16384 would keep old devices working.

[1] https://www.w3.org/wiki/Networks/P2P_CDN
[2] https://github.com/coolsnowwolf/lede/blob/2ef8b6a6142798b5e58501fe12ffd10b0961947f/target/linux/ramips/files/drivers/net/ethernet/mtk/mtk_hnat/hnat.h#L604

在 2024/7/4 7:48, Jakub Kicinski 写道:
> On Thu, 4 Jul 2024 01:38:50 +0800 Shengyu Qu wrote:
>> BT download and PCDN would create tons of connections, and might be
>> easily to reach the 8192 limit, one of my friend sees 50000+ links when
>> hosting PCDN.
> 
> I don't know what PCDN is, but what we care about in Linux is whether
> the change under Fixes introduced a regression. Optimizations, and 
> improvements no matter how trivial in terms of code are not fixes.
> So did ba37b7caf1ed ("net: ethernet: mtk_eth_soc: add support for
> initializing the PPE") make things worse. And if you're saying there
> are 50k "links" in real world why is 16k a major win? it's 1/3rd of
> the total.

