Return-Path: <SRS0=kfxU=PO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B364CC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Oct 2021 11:19:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72FAD60232
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Oct 2021 11:19:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 72FAD60232
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PDp1Z5qnyTyx7crmQHbGkjHBORNfapUevqy5IT2vR6M=; b=UQFCyWSM3nlkDbK9OEhVH812EK
	RaV1t+fIv2p9ltiL5ff3oWnQUCniIQtqmlZfLtUuEnpu+hL43lICQsA0oepmvcIDaSXfkzh8+CHzx
	9HSX6HIl8XxNF1Y0wL398Fxo1SfVtPmf1Q82IZ4qwSBnwm6vPXJOsBpn+x1Yf3l555vPfBm/dy+MM
	DVaJD/6Px/sKyykI0JDmMiHjv9XmuGZEzbgwmfNk/ilLsZ4MfOZ9TPbugMoVt22qMPVFdROgFvMBK
	Me3tDQ2xfc/Hk23YTKOCPssh+mhvxivaFkaQsxVlyuM27T9VhRu7lSYZgmMDp4xnnhD4a1aA/WKX3
	AbzTVKhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfKU3-001c34-Fn; Tue, 26 Oct 2021 11:19:11 +0000
Received: from mail-mw2nam10on2072.outbound.protection.outlook.com
 ([40.107.94.72] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfKTz-001c1X-Jc; Tue, 26 Oct 2021 11:19:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XEiYQ2COP0ltYpVhZI2cUJEgp7uYRVbGdiuw1E6l62tlg29QAXrNFiT/ytMnILSdincE3/L6mpTOCMSjKNSdH6pA5sSDAkw7Nvi+i+WOZa5qCKk5PUZKtN05VcOi25hsgGcM+/8Hyz+JSUr7QOJa3OTiS8EEXGRSioCJKQ1pB5PVd82Yz8rOjEtjmL6sO3UoUeC4UFau4hQmUGKszw+t4qyF8sYXu97QYJQoBJxgeq2jbwUDQzjV6IVhOGVHeXZQNAuEJklvDyA2JEZpLMZFz4RyqEOakFiJMkqFKLUG4Dmv9SlIP+evKTs+KzmzEyMVgi/AydZa/0p51PuVcStZWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mH8FxJbKNh1Zn4BwOQsGJObTEtfvnvBkY+82WJiGyhw=;
 b=oMNFruGXmS9ffgTG9WdV5JjDFLDcGkRTGUGPP2oCbv1QDfSMnLXsWlTkrYF0PKjGm/Il+SB4Vl+Z9Z8EdIYRZvP0Z5rzBK3smR2pTt5B2zSVQd66b6Ui8D7Er4TCL93sCC15vCEO80R4pzpQk8ZowcdugOMf2LPblj8XTTtMVtQRrjgaR1JSdt3O3d9xbknTsZahe29I5uH27WKN17aM6aJpq4WuFHrV4ZbTJbAHcwlF/0O4iW1kh4J59P5S98vWL5oTyYBnwa3ytwAGBtgxYM3Ku/dKIIEifD7v80BqZEJMuwRieFpW/qrSDAwkCzYguusbXN1VCqlZdM0SNu2uBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mH8FxJbKNh1Zn4BwOQsGJObTEtfvnvBkY+82WJiGyhw=;
 b=1Q75ZSsxXCuyh0qLVG7pJQV629/Xa6O+cwX6vwQXMpkZsmdUu3lU1jCTYaMim5t4ap29GEX4ryqTX35k2VxPrqv7/wLrbvzS3RBTdsCNDFkwMpB1sgRsVF928BHUxUUQdi/ZxgmVmQNj5RUIWN3nn7pY598QD9rg8HVC7rNrBXY=
Authentication-Results: mediatek.com; dkim=none (message not signed)
 header.d=none;mediatek.com; dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR12MB1839.namprd12.prod.outlook.com
 (2603:10b6:300:10b::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Tue, 26 Oct
 2021 11:19:03 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a%10]) with mapi id 15.20.4628.020; Tue, 26 Oct
 2021 11:19:02 +0000
Subject: Re: [PATCH v3] dma-buf: remove restriction of IOCTL:DMA_BUF_SET_NAME
To: guangming.cao@mediatek.com, sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, rdunlap@infradead.org, wsd_upstream@mediatek.com
References: <20211012084109.176542-1-guangming.cao@mediatek.com>
 <20211014102551.54983-1-guangming.cao@mediatek.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <0e062f12-7e79-5a05-1e7b-10dda8e353b7@amd.com>
Date: Tue, 26 Oct 2021 13:18:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20211014102551.54983-1-guangming.cao@mediatek.com>
Content-Language: en-US
X-ClientProxiedBy: AS9PR06CA0354.eurprd06.prod.outlook.com
 (2603:10a6:20b:466::9) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:4969:85a5:71fe:e4fa]
 (2a02:908:1252:fb60:4969:85a5:71fe:e4fa) by
 AS9PR06CA0354.eurprd06.prod.outlook.com (2603:10a6:20b:466::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.13 via Frontend Transport; Tue, 26 Oct 2021 11:18:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 01341e0b-2847-4214-fe21-08d998726a39
X-MS-TrafficTypeDiagnostic: MWHPR12MB1839:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1839EE2ED72E7FC554A5248D83849@MWHPR12MB1839.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X5Co4O7qV9ksZEnyrpfX7sSc9HrveIKaRc3vJc3c46DCyd9EAjR8ObgRodKG0CCwMD/60l2bgPGNZGKtMVXl8gMaxtUVhnr9Np5p1i6ruwviC2lNJzVLJCvxZwNz/adITr3YMpDqR6R9bSW01Q56wgeW1gd+esT4AGaPuiRr1u6OXl5xNhS/pPCLvrlL6z9PjZq6ulmUa3vmmbzgYs+xeVrvwtE6vcMVr7aSmB9ODlZ/cDaS+go+mis4asTslaAOaYHx62MfSgzLlOMZumCDMzv+9Y8QrJgHXM951mpMwyR5uZoadyyaMBnqR4BBbEMrcju8aObSjv6v6tFjsT7ZywNb7tA1gCLQc9GSKCkhpDzRnBsmB5wwGo79OZ4Q6+jKOMXkPGLlYvGfWM68k8hVMMv4gjyj6bPwssdlL+KcrgpBLHH14akIjWxs3xlzKKza/7xOU8zeqvgu9m7F2Rq/7OgsReWiSfv8sxEw6rOTMR7Irl9CQO3gipU4HwuZKYTyCLf+eJpce2FDdgjY09ZnOwdbYqfBvPlhXTnl5iliWXdOSTqrGUXLDsP9A7Fnyuqz6EUBzW6/foOkIw3yXErq7W5vrvsRPKLUDhhpACP8KAgpAmnxO+kgoNql6EQSwzAOWvdWcZuJC/aRnOzm+2iBYeleR8/R2T4uYgoR6/lhf3oXu585F74JEMon1di4XHKMdMEEMlExCBjtzfvNtEA86xwjHlj3Nge3UjyR65jTEDGY0CjVW7tEYQMYxhOdnVF4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(66574015)(4326008)(2616005)(86362001)(31696002)(7416002)(83380400001)(38100700002)(316002)(6486002)(31686004)(66946007)(5660300002)(36756003)(2906002)(6666004)(508600001)(8936002)(66556008)(66476007)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vkc5cXdzS3Izek5iOGxaTGZzU0JwSEZ2M0lXTHQ1eGJkK2VaenhYNnFubkNF?=
 =?utf-8?B?MEFTZWN1amMzVjkxVy8vRnlKSUVlNGh3WXo1SE9GdGhFdmMzOGZRNzR2bk1I?=
 =?utf-8?B?K1pDdis2RUZFSXlld3pvL01NREJ4OU5JRjhrZExXNGZ6ZWxHQVN1b3JwUFpy?=
 =?utf-8?B?aEhBcG5Tc20zaHQ5OGJ5QzBHU01qVHRKdlpwRlpucUNnaEU5ZSsycGJYTWVT?=
 =?utf-8?B?ZUFGZm9YSkw5MnFYaGxTMmJIeGdYVTM0RWRnbi9QNUxId1UyQkwyTkRmUzNL?=
 =?utf-8?B?TjdLVDNBcktrcDBpUGNaejhTaG5VMVBHL255MUVFT3RiRHFPdFFQS1RxbEJL?=
 =?utf-8?B?V21Lb01tQjJEaTRaRmw1dFVBSXlxZ2JLVldBYUZSQ0F3Q0psUWlwVkw5dWxu?=
 =?utf-8?B?OHEzOU56WnZIVG5mMXpEUTRYR1BkWmRrd1dkcHBoM2NmdmdCS0ZTRUVwZEtt?=
 =?utf-8?B?ZkVwRnJad2dmWEcvbld0MldybVpBNTYzUEJOYlhxNGZlcFVkZUxMdnRBZFEr?=
 =?utf-8?B?aG1jSDFFZGQyV0NvcE5qbDVkMk9JbWpoaWprVnZlZTF1WHBuSjFyb1FYalNp?=
 =?utf-8?B?bWxaS2dwRjNSdlkrWlJnZ0laY2tlb3ZWelBtQlVmLzZwL3loTFMyYzZRcmRC?=
 =?utf-8?B?OUVMcTN5b2dtRHl2Q0p5UG9zNmZhK3NoTk91WmZlYXBzaExWY3AxcHJoMnNZ?=
 =?utf-8?B?bmRPNEJpVHgwcWlPRUY3WndVanFZM3RjaEFpOEZ3Sm8vUVJwNmF1bHRWV0NK?=
 =?utf-8?B?cWJ5K0twbjJzOXRnaktnVElKVlJhVklzdzJJY25GQUFzZVl5WWk4MDFneU9w?=
 =?utf-8?B?Vk1uL21CcEc5emN6bFl4d3BlakpKc2lueUdkM3pQRE1jeTd5Y3lPQVFEek5q?=
 =?utf-8?B?Q1lyMUk4enJrY3o4SlBBNXdKK3d6WG5Sck55ZG00cHJpMmhJTWxwalFtMzU1?=
 =?utf-8?B?SXdpQXJzVWFudFdYUGtHeVM0Y250VVNPNUNUcUVxaTZkUmw0Vyt3NnprKzUr?=
 =?utf-8?B?UDJuMk1Zc2hRdEhmVlR6OW9Ydkp6TTNkaGdNbjJRWXlQcUNSejN2UEpjMFM2?=
 =?utf-8?B?em1vT2R2TFFRRUxTQ3diQ1NNL0tpTVV1elRiMmFtb2pjK0lBZGloZW1GUVZR?=
 =?utf-8?B?YWxYTUx5OFZES1hKQllNOFdjMVVZOEFVWXZXblhIT2t5Vkk2d2FnSVlKZzN4?=
 =?utf-8?B?Y1FLWTlEM2kxdWpuZk5qdnZqSExPdWlyS2pjVzJCZWRNVkhTaXJ1UDI1Szc5?=
 =?utf-8?B?NDZwcXZZdmFiYmo2dW4rdVpaVVVJczV2SkZiYWZrWUx2RXdzRWRPTGxEaFJC?=
 =?utf-8?B?NW1hdWxRTnVEYkUySXJQT0FlMTYxdjI3UXptT0dIUmZLWlZyTnh3SkhFSml2?=
 =?utf-8?B?Y0pQTG41QTNIOTRjOExvVDY5cWpMV3ZpTy9DRFQrNjRqTHZqMEx5Q1IrVWtO?=
 =?utf-8?B?NEtReFdqMzA1RnF1OEUrOFBJSEp6RmY3eVVXdWR1WUJJUlRBWDl5UFpZcWR5?=
 =?utf-8?B?MjZhaFlmaW9IWnNRM1NBWWVEa3RXWXdJRkduNG1lc2o0SjB2cU5teEQ1bWJN?=
 =?utf-8?B?ZkVqWXEwRXRQQjMyTWtIRDk1a0J3aGVqYXRuNFY4UGJnemV1WDFncCszS2lr?=
 =?utf-8?B?bmwvdk0ra1JqTGZoQnVMTGozTGtudGVBNWNXOHMwVHRkczNReWc3cXFRSkxl?=
 =?utf-8?B?L014eVEzaXZIZStDQ1pqS2IxaGtGaGNTL09DZERqNXowREh6ZDd1em5mVDdp?=
 =?utf-8?B?eHI1NHgyUDVMTERlNUtGMHZhK1oyUjBORWwwOHpHQ090eDlQcjZYUFdXZStZ?=
 =?utf-8?B?Zi9WVTdmYnE3UlA0QlpWbXB2NTBjU3doQWk3bDlQWTlUbTV5VVVTRitqRXBq?=
 =?utf-8?B?eWl3ZXNrV2swbURPUVRROFFUZysxcjRlMHJpNHB0S2xrU2JMdStUL0JIek9G?=
 =?utf-8?B?OHN1UktXdGlHTmVnNXZicDA0WFdzc2VMSWlPS2JkSDZ2Wm1xYWR3SCtpUjNK?=
 =?utf-8?B?WEl5NXEwWlAycVA5OXpYcmVKRVljalpFTWJJczdKNW1QWEE4N1BuNTI3Nkxv?=
 =?utf-8?B?ZERVQVN1R1B6cjY3U241QytaYi9JeGdCMEY3d1BmUTgwc2NKTitubTRiYXJH?=
 =?utf-8?B?Qm1YMjBjT003ayt5ajZqSG1uT2swa092VXhpTHVxZmQ3N1lqYlR6am5LY0ZB?=
 =?utf-8?Q?CgmapkGlkaEanPFOIudZgHU=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01341e0b-2847-4214-fe21-08d998726a39
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 11:19:02.7834 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jMFfbPJqt46DFs4/pSsoYY4wzJl1hISpMgtbuGKX7TQM/SIUGfjbJqn4dv6/m7Xw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1839
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_041907_758293_0B152DE2 
X-CRM114-Status: GOOD (  30.28  )
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

QW0gMTQuMTAuMjEgdW0gMTI6MjUgc2NocmllYiBndWFuZ21pbmcuY2FvQG1lZGlhdGVrLmNvbToK
PiBGcm9tOiBHdWFuZ21pbmcgQ2FvIDxHdWFuZ21pbmcuQ2FvQG1lZGlhdGVrLmNvbT4KPgo+IElu
IHRoaXMgcGF0Y2goaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoLzMxMDM0
OSksCj4gaXQgYWRkIGEgbmV3IElPQ1RMIHRvIHN1cHBvcnQgZG1hLWJ1ZiB1c2VyIHRvIHNldCBk
ZWJ1ZyBuYW1lLgo+Cj4gQnV0IGl0IGFsc28gYWRkZWQgYSBsaW1pdGF0aW9uIG9mIHRoaXMgSU9D
VEwsIGl0IG5lZWRzIHRoZQo+IGF0dGFjaG1lbnRzIG9mIGRtYWJ1ZiBzaG91bGQgYmUgZW1wdHks
IG90aGVyd2lzZSBpdCB3aWxsIGZhaWwuCj4KPiBGb3IgdGhlIG9yaWdpbmFsIHNlcmllcywgdGhl
IGlkZWEgd2FzIHRoYXQgYWxsb3dpbmcgbmFtZSBjaGFuZ2UKPiBtaWQtdXNlIGNvdWxkIGNvbmZ1
c2UgdGhlIHVzZXJzIGFib3V0IHRoZSBkbWEtYnVmLgo+IEhvd2V2ZXIsIHRoZSByZXN0IG9mIHRo
ZSBzZXJpZXMgYWxzbyBtYWtlcyBzdXJlIGVhY2ggZG1hLWJ1ZiBoYXZlIGEgdW5pcXVlCj4gaW5v
ZGUoaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoLzMxMDM4Ny8pLCBhbmQg
YW55IGFjY291bnRpbmcKPiBzaG91bGQgcHJvYmFibHkgdXNlIHRoYXQsIHdpdGhvdXQgcmVseWlu
ZyBvbiB0aGUgbmFtZSBhcyBtdWNoLgo+Cj4gU28sIHJlbW92aW5nIHRoaXMgcmVzdHJpY3Rpb24g
d2lsbCBsZXQgZG1hLWJ1ZiB1c2Vyc3BhY2UgdXNlcnMgdG8gdXNlIGl0Cj4gbW9yZSBjb21mb3J0
YWJseSBhbmQgd2l0aG91dCBhbnkgc2lkZSBlZmZlY3QuCj4KPiBTaWduZWQtb2ZmLWJ5OiBHdWFu
Z21pbmcgQ2FvIDxHdWFuZ21pbmcuQ2FvQG1lZGlhdGVrLmNvbT4KCldlIGNvdWxkIG5vdyBjbGVh
bnVwIHRoZSByZXR1cm4gdmFsdWUgZnJvbSBkbWFfYnVmX3NldF9uYW1lKCkgaW50byBhIAp2b2lk
IHNpbmNlIHRoYXQgZnVuY3Rpb24gY2FuJ3QgZmFpbCBhbnkgbW9yZSBhcyBmYXIgYXMgSSBjYW4g
c2VlLgoKQnV0IHRoYXQgaXNuJ3QgbWFuZGF0b3J5IEkgdGhpbmssIHBhdGNoIGlzIFJldmlld2Vk
LWJ5OiBDaHJpc3RpYW4gS8O2bmlnIAo8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgoKUmVnYXJk
cywKQ2hyaXN0aWFuLgoKPiAtLS0KPiAgIGRyaXZlcnMvZG1hLWJ1Zi9kbWEtYnVmLmMgfCAxNyAr
KystLS0tLS0tLS0tLS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMTQg
ZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9kbWEtYnVmL2RtYS1idWYuYyBi
L2RyaXZlcnMvZG1hLWJ1Zi9kbWEtYnVmLmMKPiBpbmRleCA1MTFmZTBkMjE3YTAuLjVmYmIzYTIw
NjhhMyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2RtYS1idWYvZG1hLWJ1Zi5jCj4gKysrIGIvZHJp
dmVycy9kbWEtYnVmL2RtYS1idWYuYwo+IEBAIC0zMjUsMTAgKzMyNSw4IEBAIHN0YXRpYyBfX3Bv
bGxfdCBkbWFfYnVmX3BvbGwoc3RydWN0IGZpbGUgKmZpbGUsIHBvbGxfdGFibGUgKnBvbGwpCj4g
ICAKPiAgIC8qKgo+ICAgICogZG1hX2J1Zl9zZXRfbmFtZSAtIFNldCBhIG5hbWUgdG8gYSBzcGVj
aWZpYyBkbWFfYnVmIHRvIHRyYWNrIHRoZSB1c2FnZS4KPiAtICogVGhlIG5hbWUgb2YgdGhlIGRt
YS1idWYgYnVmZmVyIGNhbiBvbmx5IGJlIHNldCB3aGVuIHRoZSBkbWEtYnVmIGlzIG5vdAo+IC0g
KiBhdHRhY2hlZCB0byBhbnkgZGV2aWNlcy4gSXQgY291bGQgdGhlb3JpdGljYWxseSBzdXBwb3J0
IGNoYW5naW5nIHRoZQo+IC0gKiBuYW1lIG9mIHRoZSBkbWEtYnVmIGlmIHRoZSBzYW1lIHBpZWNl
IG9mIG1lbW9yeSBpcyB1c2VkIGZvciBtdWx0aXBsZQo+IC0gKiBwdXJwb3NlIGJldHdlZW4gZGlm
ZmVyZW50IGRldmljZXMuCj4gKyAqIEl0IGNvdWxkIHN1cHBvcnQgY2hhbmdpbmcgdGhlIG5hbWUg
b2YgdGhlIGRtYS1idWYgaWYgdGhlIHNhbWUKPiArICogcGllY2Ugb2YgbWVtb3J5IGlzIHVzZWQg
Zm9yIG11bHRpcGxlIHB1cnBvc2UgYmV0d2VlbiBkaWZmZXJlbnQgZGV2aWNlcy4KPiAgICAqCj4g
ICAgKiBAZG1hYnVmOiBbaW5dICAgICBkbWFidWYgYnVmZmVyIHRoYXQgd2lsbCBiZSByZW5hbWVk
Lgo+ICAgICogQGJ1ZjogICAgW2luXSAgICAgQSBwaWVjZSBvZiB1c2Vyc3BhY2UgbWVtb3J5IHRo
YXQgY29udGFpbnMgdGhlIG5hbWUgb2YKPiBAQCAtMzQxLDI1ICszMzksMTYgQEAgc3RhdGljIF9f
cG9sbF90IGRtYV9idWZfcG9sbChzdHJ1Y3QgZmlsZSAqZmlsZSwgcG9sbF90YWJsZSAqcG9sbCkK
PiAgIHN0YXRpYyBsb25nIGRtYV9idWZfc2V0X25hbWUoc3RydWN0IGRtYV9idWYgKmRtYWJ1Ziwg
Y29uc3QgY2hhciBfX3VzZXIgKmJ1ZikKPiAgIHsKPiAgIAljaGFyICpuYW1lID0gc3RybmR1cF91
c2VyKGJ1ZiwgRE1BX0JVRl9OQU1FX0xFTik7Cj4gLQlsb25nIHJldCA9IDA7Cj4gICAKPiAgIAlp
ZiAoSVNfRVJSKG5hbWUpKQo+ICAgCQlyZXR1cm4gUFRSX0VSUihuYW1lKTsKPiAgIAo+IC0JZG1h
X3Jlc3ZfbG9jayhkbWFidWYtPnJlc3YsIE5VTEwpOwo+IC0JaWYgKCFsaXN0X2VtcHR5KCZkbWFi
dWYtPmF0dGFjaG1lbnRzKSkgewo+IC0JCXJldCA9IC1FQlVTWTsKPiAtCQlrZnJlZShuYW1lKTsK
PiAtCQlnb3RvIG91dF91bmxvY2s7Cj4gLQl9Cj4gICAJc3Bpbl9sb2NrKCZkbWFidWYtPm5hbWVf
bG9jayk7Cj4gICAJa2ZyZWUoZG1hYnVmLT5uYW1lKTsKPiAgIAlkbWFidWYtPm5hbWUgPSBuYW1l
Owo+ICAgCXNwaW5fdW5sb2NrKCZkbWFidWYtPm5hbWVfbG9jayk7Cj4gICAKPiAtb3V0X3VubG9j
azoKPiAtCWRtYV9yZXN2X3VubG9jayhkbWFidWYtPnJlc3YpOwo+IC0JcmV0dXJuIHJldDsKPiAr
CXJldHVybiAwOwo+ICAgfQo+ICAgCj4gICBzdGF0aWMgbG9uZyBkbWFfYnVmX2lvY3RsKHN0cnVj
dCBmaWxlICpmaWxlLAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbWVkaWF0ZWsK
