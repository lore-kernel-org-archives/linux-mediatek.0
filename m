Return-Path: <SRS0=sTTz=O4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB584C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Oct 2021 10:24:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DF8E61038
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Oct 2021 10:24:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8DF8E61038
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8vTciSSdE1OjvV1aeHjg0kSnvmkI3ybd59GDkOBlKlY=; b=OcZvmA3iA0Um5F39BXh4ZiG6tb
	yGukXccwGbCnANd/lUBf7Y+MXZQ4wd/RPW4WUY4RLVWWWcNUjk7VxCu221rkt4e4V9C200ZUC6xD2
	rIpp68aV6BpvKTzK05lIFw45kHkc4+r+X7Y530Byd0W9Wlw8Wv/Gnuf7O/063y3zBZg0+hfkD/G96
	bAQ9Myt+qIv33tK2cdzxl3CBv23vPWhMqSQVynaLvp/3FgLA+AhX+iWFl9U3G/yWCSRB9e7fOTLLy
	o1PZaQCDt5omLUgdwvtdgsBJb+usaxXs6SYc/WWxN/LSOfZyzi7pOLrHVP/Rg5MPCIQyRC1P6RJTj
	qgSehbhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYn37-002MRI-Fi; Fri, 08 Oct 2021 10:24:21 +0000
Received: from mail-mw2nam10on2062.outbound.protection.outlook.com
 ([40.107.94.62] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYn33-002MQm-1n; Fri, 08 Oct 2021 10:24:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=grzzX2bv/KOtFKvj8TcPDWaSCTdDlHIQTQoj3/SkUu648tuzEA6a3kth53d0I3iZBRJpYlVLSyH2RpuD1UQvFq+QW3iMTVvrwixaRq9fBQFS9cyDKqR8E74mOk8fKzauXw642uPB86h8ZBC4teRjNLqrDcUc83meb+lkNGENZWGnT3DGkF/akssjpll2YxK0rS2Xjsm3vXAnRfzUOgBs8X8w1hkXU16VlsajoGmx9oHByHWcQekbyTQOloG3TOPBiUwwCveHGkE1/wxy2sQbjxmR9MT6kZIONzUvLZrXYjbATdU8SS25Lr5kW0/Y55anznD7D4l2+hL24wcKoTJdPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CSgI1n9OX8M1wngxHyzalUPKmItZYwTszpp53TBTQJ8=;
 b=Fbw48/ue1eVLYoAzIMZNQWVZc9+QtUjrxhqmVE9vSdnTYxYPTHTKINNLTwU+Vsl+jBtZLc72s4TsBH5AycmG3KSNXLghE7/BJhZUEAZnKvI2V8z7FxtsrMBVfLsW2CAAdCzRA7m4JX8f2ZuwCWRW/zmYZQiPzWbF5fcvesEeU2OnRNosv1d7MmDAiwES6tmBK2/X0Yroh9/qFThtJDLLozYPGIX7k2J1znOtUX1c5JQFKpmnL3kHLZITQuOrp4QZ5VfXFUVmxvlghrSFX1zKKLfrZ/ELLdjkbV3Buz+3M+2VtlpKumAbZn1BrT3xuWfar8Gw7c/jrgUpoCJ8Zb1XuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CSgI1n9OX8M1wngxHyzalUPKmItZYwTszpp53TBTQJ8=;
 b=O20ZIc/nzZB86+qWJoPTspf0ia/JWBfO9tXMPcP5ZVOWO2Hgx+jM4ZoYaM5gdXiNP18UrYD4BHsEd5eQfHF88J5hv/DweusVpX5IUaJp04VT4UD5dJbstLNI8O3ZSFra14ow4d4PFzc3uRImcLZmthBCAeV6MqxhHOE0TbeKG4Y=
Authentication-Results: mediatek.com; dkim=none (message not signed)
 header.d=none;mediatek.com; dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MW3PR12MB4457.namprd12.prod.outlook.com
 (2603:10b6:303:2e::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.20; Fri, 8 Oct
 2021 10:24:14 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a%10]) with mapi id 15.20.4587.022; Fri, 8 Oct 2021
 10:24:14 +0000
Subject: Re: [PATCH v2] dma-buf: acquire name lock before read/write
 dma_buf.name
To: guangming.cao@mediatek.com
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, sumit.semwal@linaro.org, wsd_upstream@mediatek.com
References: <5b7cdb6c-45f2-6b31-bfdd-5cc68a2fda5e@amd.com>
 <20211008075420.42874-1-guangming.cao@mediatek.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <169957a7-302b-1de9-39b0-415c4675743a@amd.com>
Date: Fri, 8 Oct 2021 12:24:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20211008075420.42874-1-guangming.cao@mediatek.com>
Content-Language: en-US
X-ClientProxiedBy: AS9PR06CA0157.eurprd06.prod.outlook.com
 (2603:10a6:20b:45c::32) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:efac:61bc:bb73:d6b5]
 (2a02:908:1252:fb60:efac:61bc:bb73:d6b5) by
 AS9PR06CA0157.eurprd06.prod.outlook.com (2603:10a6:20b:45c::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.16 via Frontend
 Transport; Fri, 8 Oct 2021 10:24:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d16ec1aa-ac55-48fa-f891-08d98a45c6c8
X-MS-TrafficTypeDiagnostic: MW3PR12MB4457:
X-Microsoft-Antispam-PRVS: <MW3PR12MB445799C908859C0E46B3823C83B29@MW3PR12MB4457.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:334;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VE4SUBr6f7+R+U8ocdbuRZv46QZo8+6XLdGzqASLFu5zFQN/LZz8G0TKbURHQvXOVQUYHwKoOp2jTRflmoMzVD0DWKDZ+hU+ex2EqUeMywdzPnBqVIMVpJopNKKMWBgKM4ql2nuhx5hchkO3188wrqD+hOqAoiOfQr9OlOslzLBZDDEHnPeV3CECXNs9Z89EgVbukQDXyKEq02Hu4V/2JeSQpxWUAyWD8hteC4XLo0Gama8JeoVMM/xMMptTpixsAX8BX5e/cDzFzkPv4E0PLxRUZC5ii33JpOryp3GJVkGCzoC2Howq6Jw2ZZXJTXgOCR5MKMF0FJwvzffZj8j+kBwtR8d1IqjfhfMnufdOVh3VTdN3kH+OF/pWKUmO+xALu+GNb3CbJzhnVXQd8EJFOdV0ZSPUrZyX5l33k8cFvC9DlxhIWtIDBouTwRfEIXYUMtIQvem+VaoZoQBA81FaE7LwMNaWzuouOMaOm+1DA439O/fobIxhIkADkay9BLThXVypu7UUxjqKXyA9svzNqbfypTlS0DovDFd14ee3fChplsvMtUj85PAZxxIJUKQR2oG+ZiO+vrV1bT3ilFr1jHSewuEkmjXamWSB0+Lo9XmF9qRGty+P+AEn35TSz98j8vnKMo6BqnmwGP1V1Kzbc6IRAxdY3FPIpe+JeOjHMASPBQH/0xRi5pYOqwG8UCGo17beD0Awf8AsL4W5pyLDFOs23dPUrg+D4RWpEqeF4H0BTTzCbqecqBkwzap26qu2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(66556008)(6666004)(83380400001)(6486002)(31696002)(316002)(66574015)(186003)(6916009)(8676002)(2906002)(2616005)(8936002)(38100700002)(508600001)(31686004)(5660300002)(36756003)(7416002)(4326008)(66476007)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWoyS0VjWnpnSjBnMmdqQldzY0xFc2Zob3pUWGlhVkI4a1F1WHFRZG5FODE2?=
 =?utf-8?B?dkZmVDdqM2F2blNkeFEwL1dsY3AzcTNHVkdmUFVkb3plN0RhSjdGVHI2Tzgr?=
 =?utf-8?B?T2ZvRmVJbWZjdW9nYWdCYURVMU9vQlhSb3JkTitPVjVQTnczTzFJekx6RnJU?=
 =?utf-8?B?TWpJcWsvblFQdm1mL29UcjhPN1VsaHBnWVNYa2M2K005OXBtSmRKZjh5WnBH?=
 =?utf-8?B?ZjJtTmd0VkJBM2tOOU1Oem5paHBxQ0lQS3FqWXJjOS9aWG4wdWRCQTVhNERV?=
 =?utf-8?B?ZXFFYUplMGlleUsxSC9VQ2dsMlVuT0RMMzdJNHhWY3Q3Vmp0TGtKeklHV0Z1?=
 =?utf-8?B?VkxQQUp0cEdUWUhrekJGZER6RTNRK3BrSmN6M082S2kxaTM4UUNFc0hmN2c4?=
 =?utf-8?B?Q3MyWk9uOWhjVGpMZFNXUEszVU5lS2V1V3BNdU9YTUdLTXcyL0haSDVYSkZi?=
 =?utf-8?B?UWU5MEUvRWg2aUlZNUovZDFkRWFnN2lHVTRiN1l0eG95U3BrNUY5dXpqQ0Ri?=
 =?utf-8?B?U0hnbExCOHdqK05TTCt5OWRGOHQyOVdMQlNMREhwbFVSZWZGS3NObDR2eTVh?=
 =?utf-8?B?cGhQSHBicFZ6Z042blhLTk11YWlscktlY2ZCWnlIK1F2YXZORm5Xc3kycVRH?=
 =?utf-8?B?TjhIZDZMNUc5a0orOThvWHRaQTJ2bnJ2ZGMyMGdlUTVrdE1ieHlBUTFGMTY2?=
 =?utf-8?B?eHVFWnVZZ2xNcU5Hbnh4cHJOUnR6aklGMTNJRXhvRHFMS2VQL21XbHRPbTN6?=
 =?utf-8?B?R1oybUt2QURLRmxGbGExbzI4K1BCS3E2alptVW9QMUhRcTBpSkkrSUxxajhp?=
 =?utf-8?B?S1JueWhLOEN3eU5vTWt2VmFXVHBIYmszM1JUVEdyckdmRklSREsxNFdWazVP?=
 =?utf-8?B?aGZHQWh4QTZtZlNTTmtLdUNDRlRtb3VnVjFQajdSM08zdnJQVG5qcFJjS0g4?=
 =?utf-8?B?MnJSYU5XQWxGbUFxRmJXMSt2YXFrTUsxRTJoSlpNNnFzM0s1aFUrRGh0akhs?=
 =?utf-8?B?TTNWdTJCUjVmR0pGNzVKYld1WU8yOU1NTmtNaG4zVGVEMkR3cFgyMHROZ3Y2?=
 =?utf-8?B?S20ybm43ZGhJbmZ5SkY3U2V2OURBQ1RTK3JjY3NQbDlNT1J6OHFNdHpZbXlR?=
 =?utf-8?B?bEFWVjFTWnJoN21CZGVRVUU0RGYyK3JLNGpYeUtBa0pvTkh6S0pnQk5TRCtQ?=
 =?utf-8?B?M0dWZlUvRk40TlBRMm5uM1RMdVJhcnFwcm5iajZqdzV6STFMdnlXbXk4T2VW?=
 =?utf-8?B?NVREdFFLOFdKa3ZOTGtLSmNzUkdrZWVpMldqMHZuMnl3V1h4aXZLTElwNTdn?=
 =?utf-8?B?ZzBuZlV5b2ZUd0ZhaTVFbUNnUmFxdko3SFRXLzdadjZXeHpxN3R5ekZQNkpV?=
 =?utf-8?B?RG9ndzdkemN6RUhramFUWWJhYTQ2YWdKby83d1pDVVNHbDVQVzgzL1VDYkNV?=
 =?utf-8?B?MlRUMzltcmw2V1NiVnh5T1ozTjlkanc0czJkdG9pSjNKaWhVWUNWcmdSd2xI?=
 =?utf-8?B?VjJkNitFM2JLNHZMcXpiTHRFRm9LWndMaFRMUXdFcUpZRENuOFhzNURZM0JM?=
 =?utf-8?B?NGl2ajljcW5SNjRtSW9PblhrSlpEbG9vb2s3L3dBdk1HRm9PamlZTE1kWW1B?=
 =?utf-8?B?TldENnluVTBWbk9LeEkycUlPV2MzN2hJSHB3VDFNOENRMkNtbExDZ1RRNjF6?=
 =?utf-8?B?cGx1eDVMVGtITGFBOXkrd3ZCRm9SR0hSNnRydkVDdmxpbm5QMU5LMXV6UWRp?=
 =?utf-8?B?S1BScjFBSUFDR0ZrUFI1Tk55YUNnRnE1YXBWWXc2b1oySWs1QWhOTklWWkFD?=
 =?utf-8?B?WWt3K24xdTJ3b3BvUEttYXNnRDI0b2FJRXJjc0VLMWxEL2JudFFkeWExOGpm?=
 =?utf-8?Q?aDMAPy+8xIbDR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d16ec1aa-ac55-48fa-f891-08d98a45c6c8
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2021 10:24:14.5800 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E6soHBbQ6mrafBu/Gov1rihbLRv3i/RpbNtJlUmufgs5/RQhsWiU/RavSiSuAVrH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4457
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_032417_153242_89F61BDA 
X-CRM114-Status: GOOD (  14.30  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

QW0gMDguMTAuMjEgdW0gMDk6NTQgc2NocmllYiBndWFuZ21pbmcuY2FvQG1lZGlhdGVrLmNvbToK
PiBGcm9tOiBHdWFuZ21pbmcgQ2FvIDxHdWFuZ21pbmcuQ2FvQG1lZGlhdGVrLmNvbT4KPgo+IEJl
Y2F1c2UgZG1hLWJ1Zi5uYW1lIGNhbiBiZSBmcmVlZCBpbiBmdW5jOiAiZG1hX2J1Zl9zZXRfbmFt
ZSIsCj4gc28sIHdlIG5lZWQgdG8gYWNxdWlyZSBsb2NrIGZpcnN0IGJlZm9yZSB3ZSByZWFkL3dy
aXRlIGRtYV9idWYubmFtZQo+IHRvIHByZXZlbnQgVXNlIEFmdGVyIEZyZWUoVUFGKSBpc3N1ZS4K
Pgo+IFNpZ25lZC1vZmYtYnk6IEd1YW5nbWluZyBDYW8gPEd1YW5nbWluZy5DYW9AbWVkaWF0ZWsu
Y29tPgoKUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1k
LmNvbT4KCkdvaW5nIHRvIHB1c2ggdGhhdCB1cHN0cmVhbSBpZiBub2JvZHkgZWxzZSBvYmplY3Rz
LgoKVGhhbmtzLApDaHJpc3RpYW4uCgo+IC0tLQo+ICAgZHJpdmVycy9kbWEtYnVmL2RtYS1idWYu
YyB8IDMgKysrCj4gICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9kbWEtYnVmL2RtYS1idWYuYyBiL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtYnVm
LmMKPiBpbmRleCA1MTFmZTBkMjE3YTAuLmE3ZjZmZDEzYTYzNSAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2RtYS1idWYvZG1hLWJ1Zi5jCj4gKysrIGIvZHJpdmVycy9kbWEtYnVmL2RtYS1idWYuYwo+
IEBAIC0xMzcyLDYgKzEzNzIsOCBAQCBzdGF0aWMgaW50IGRtYV9idWZfZGVidWdfc2hvdyhzdHJ1
Y3Qgc2VxX2ZpbGUgKnMsIHZvaWQgKnVudXNlZCkKPiAgIAkJaWYgKHJldCkKPiAgIAkJCWdvdG8g
ZXJyb3JfdW5sb2NrOwo+ICAgCj4gKwo+ICsJCXNwaW5fbG9jaygmYnVmX29iai0+bmFtZV9sb2Nr
KTsKPiAgIAkJc2VxX3ByaW50ZihzLCAiJTA4enVcdCUwOHhcdCUwOHhcdCUwOGxkXHQlc1x0JTA4
bHVcdCVzXG4iLAo+ICAgCQkJCWJ1Zl9vYmotPnNpemUsCj4gICAJCQkJYnVmX29iai0+ZmlsZS0+
Zl9mbGFncywgYnVmX29iai0+ZmlsZS0+Zl9tb2RlLAo+IEBAIC0xMzc5LDYgKzEzODEsNyBAQCBz
dGF0aWMgaW50IGRtYV9idWZfZGVidWdfc2hvdyhzdHJ1Y3Qgc2VxX2ZpbGUgKnMsIHZvaWQgKnVu
dXNlZCkKPiAgIAkJCQlidWZfb2JqLT5leHBfbmFtZSwKPiAgIAkJCQlmaWxlX2lub2RlKGJ1Zl9v
YmotPmZpbGUpLT5pX2lubywKPiAgIAkJCQlidWZfb2JqLT5uYW1lID86ICIiKTsKPiArCQlzcGlu
X3VubG9jaygmYnVmX29iai0+bmFtZV9sb2NrKTsKPiAgIAo+ICAgCQlyb2JqID0gYnVmX29iai0+
cmVzdjsKPiAgIAkJZmVuY2UgPSBkbWFfcmVzdl9leGNsX2ZlbmNlKHJvYmopOwoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1h
aWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
