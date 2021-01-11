Return-Path: <SRS0=02OB=GO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01B49C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 14:39:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99EB121744
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 14:39:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99EB121744
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TjX4ackI4ZZQuoqACuvQyzqZ4+722GxBo5XmsHgNwfg=; b=mjSAK20Q6ZommDu2pVevKF+2B
	hA6i6FnIv7oPWT2a61PzkLnlE4zzZyjvrLHaEl37Ca/4a1zmy34WIBVVq7OOg0TnY83s+A1P3yAO6
	ZSIcWCBAfZSokyJdCDj6eB0HFw6DvoEeY6BKFKrs00XRUYHVmerTbQrrtTXcyFok8aLklBW40gQ5f
	HIl0eo6fZRPC10Oa/DFLn+nvhFTemIsmdl4Bkeb+wAmh3qeX6w7Exa/3dw85IMUnMfgqWysd6i+qA
	2PtNEB0t8BQ4b4MSFViAWAvWXBUm3PKhDKmwjCWQ7cvwUHTiokbrTH1wX2z2DU8k/u3nAjU60KJfh
	HY56mC/fQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kyyLf-0001PH-Eu; Mon, 11 Jan 2021 14:39:11 +0000
Received: from de-smtp-delivery-102.mimecast.com ([62.140.7.102])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kyyLa-0001ML-WB
 for linux-mediatek@lists.infradead.org; Mon, 11 Jan 2021 14:39:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1610375943;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N32pC0acih86D/l0R5T8eoMjvYHiUsUu7K3o3XaEIjg=;
 b=FVMwMd5txcs7gIFqlP6K43Bctro4fzUGUufEHdusCCHHIc/R2kG8SRPwAPmCdNKzdgb9M8
 isQl6iG6kQf0CK3mTVRvX1mkyWVKRBpiq4jcIh0fBJAjr7Fjct6ETGW+YVSU+btqD1Ldq9
 RzONeOux/ecWZL8TDB6XUlXbHcBbUm8=
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2059.outbound.protection.outlook.com [104.47.0.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-6-rdh8dxsQPr-PEWwbUOUCCw-1;
 Mon, 11 Jan 2021 15:39:02 +0100
X-MC-Unique: rdh8dxsQPr-PEWwbUOUCCw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DcA9DO5dQuvt2f9mocFo9kKcMyawKvP1nPdbErKVADfjbyhnvtFDeqEnRmhhxm72ihRFtgn27IIPkwF3uCI6AFbgxVC+G8EOuEyzTmcaya6AvVOAT9nUt7wFuIa5H3UOm6H2hSftTGlGUyj/rJ+Xcnx5LtK81OThZVydJV54ZfoXfAZhNY5EN5uHZDxaR+2SRyLQUUkdFpFZ61Wae3X7xrSGtsfN1hJn1hJJH7GzfWDXD316bMn0sN6QrxdEQ+jeakDYaLSJxT4vOOcnr+hLANGEUNwNSrjchfnjOU/eUkNOMSxrRV67MupOeXZANomYtU1KJfoZLFiTqq7o5row1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O565qy6yCXpgQBU2Bb752y8920QwcorASaAS5NztnQ8=;
 b=RroFSlut+sw60JTxJ53EiCLaHC2T3d00q1wve4AC/SrIVZ8XKTDtHNLGa14nRFak0ZenuX2zVLKfvu2sloIVI/QeNZNLrBA7XRw/2h6BY5G9djvRi7GWVokNLKb1qgAps4Gyxv1SJ3ZGviXTMMH0wpmFXXGMpNYxceSPFx7sU5sTdv8QFkoCeFMFBNF3D25aKOVv8+vBHF8l/qYlWJgIvpNS1UcDx3BgMPsTP+M4iWrlmiOua+I8ivW2fSEWdXdV3gMP3KuEsjez3L+3g7WY7CaZBPZF/1fkFdZ6XcnDK8A75kyaJhjPde3agziJKJzTdd8ZucvPJNVa3pDL6gnqFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=none action=none header.from=suse.com;
Received: from AM6PR04MB5366.eurprd04.prod.outlook.com (2603:10a6:20b:9d::19)
 by AM5PR0401MB2595.eurprd04.prod.outlook.com (2603:10a6:203:2f::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Mon, 11 Jan
 2021 14:39:00 +0000
Received: from AM6PR04MB5366.eurprd04.prod.outlook.com
 ([fe80::58d1:4050:d882:3ca0]) by AM6PR04MB5366.eurprd04.prod.outlook.com
 ([fe80::58d1:4050:d882:3ca0%7]) with mapi id 15.20.3742.012; Mon, 11 Jan 2021
 14:39:00 +0000
Subject: Re: [PATCH] mfd: mt6360: Fix MFD cell names and compatibles
To: Gene Chen <gene.chen.richtek@gmail.com>, matthias.bgg@kernel.org
References: <20210111123518.30438-1-matthias.bgg@kernel.org>
 <CAE+NS35Br8jgLfii=VPjFx+m+9=a=EQKYyoQMAyd7Zdo0K6n+A@mail.gmail.com>
From: Matthias Brugger <mbrugger@suse.com>
Message-ID: <392f08b4-0e46-3ba3-2515-640a05accbcb@suse.com>
Date: Mon, 11 Jan 2021 15:38:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <CAE+NS35Br8jgLfii=VPjFx+m+9=a=EQKYyoQMAyd7Zdo0K6n+A@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [213.195.126.134]
X-ClientProxiedBy: AM0PR07CA0021.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::34) To AM6PR04MB5366.eurprd04.prod.outlook.com
 (2603:10a6:20b:9d::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ziggy.stardust (213.195.126.134) by
 AM0PR07CA0021.eurprd07.prod.outlook.com (2603:10a6:208:ac::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.2 via Frontend Transport; Mon, 11 Jan 2021 14:38:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7717ed13-d17a-4145-75f2-08d8b63ea27e
X-MS-TrafficTypeDiagnostic: AM5PR0401MB2595:
X-Microsoft-Antispam-PRVS: <AM5PR0401MB259507917FA245D9BFD54A6FBAAB0@AM5PR0401MB2595.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eXIAZFh5Qmv1YoEXNWkbw3tmY4dx6WfgswB7gDNF1IGsjJNsqX5k4PPCaQMhvjf5GM6E4HbDuuCxO2TsRnEiQnek2RNZagLpXMbSk/nPOME4W0E1SPDTgjQTYRkCyiVPwWeYon5nfJdkk/rTpb4hAY8mHrPg7TgRpetbtVo/IT4BLLozj+JgbQjSP/JWldL7Zo2vPreVNcvCydCZsPoCU4w5+fhbc1YwWIBviWV6ru/HfVpKsWHKBhY/9YP5rl5x0O5N7m2zxU75JUHjcSMqWwYxwNbLXLyAxwwEl61VFCgNyU+Bb2TtZxzoFlFSAzA+M0zU/ZV7mm99P8UKOO+r8c+AD6JCPTW5uMbFb/EHOg5y86qcK5+/DRV4YvXxY654HRuTeAcuPhZDTwH7fopb9oidIZDoD+6MP54EveftmvoHCk/o5aWK4CGrI3ORzIa/KFFU9pjBcdEF6KyLNipcz0giFJYyhAgKfJfZtG/8i6o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR04MB5366.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(366004)(376002)(396003)(136003)(39860400002)(54906003)(53546011)(6506007)(316002)(36756003)(956004)(2616005)(478600001)(66946007)(66556008)(8936002)(86362001)(7416002)(31686004)(66476007)(52116002)(5660300002)(6486002)(16526019)(6512007)(31696002)(83380400001)(8676002)(2906002)(4326008)(26005)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?TcLiLjFGSAka+LH4QU5JXrQiT4xdyfEcxdUaU1PxrvdypuUcCJy2msEhPveI?=
 =?us-ascii?Q?gi04DNw3L/+bwGaXG2rkKg6eRZJDdEGdk9vp4sZQO0e9tQWm9JpBYrvtgOzg?=
 =?us-ascii?Q?zh1OAfNnDIWmZZf6UP2BePUaBKCkvmqdY3TaHCNQH3sTUq7yjDqR5nDYYhJ2?=
 =?us-ascii?Q?uY4LXvIc7rg2si2yealmnT1bfgcqcip7RXtw1Dqr4NP0l/QSh770kCRYbG5Z?=
 =?us-ascii?Q?E3nUGgrrMH9rf5eEmaN44YEPX7v6vnYM5sNCDxzOx3gaguht/1mXZOKAuN3E?=
 =?us-ascii?Q?GLKE8TmsXXUodE3Ccv6VDwJNVl5/W04TQbyfbOuyMnda6Wct+Zn37QBVTmyM?=
 =?us-ascii?Q?b2QjaU2gexfoBg2dXRdPfIQnno3osEwKtm0dWOupgBUQMyBJ+E79tN4DeKbt?=
 =?us-ascii?Q?L87dRwDdBdEAJJkb3jFvJxzxCPzD77SmmViGJ4VedxifkZNVWaBePlTHqVjR?=
 =?us-ascii?Q?LZRTdp/bhxoYWABYFP2ri24AspQlPeMf2QHV8pIoIol98Xn9eoaBMp4tBRUV?=
 =?us-ascii?Q?xUffFm0eGuOqoTUeCNNouIYSoPBJw5W1xh9rm6BI4jS7T9MEaYKqrdWHmMth?=
 =?us-ascii?Q?MNT3UgyJw5nX3mgcKTd8pkajRuWvY3cIpFwSai3NpE8gPfgM0x1gEQZCnaaP?=
 =?us-ascii?Q?mX5Cx1yLgRjU7V+LtUSQPn4nNcZf3MpmvSjc4a+jm4ngqY4qwXL0OdYxCgeA?=
 =?us-ascii?Q?/nbQ9zwmuCMorjnIlGUf8BowB1q96Rv4QVUAhhawleFKVd26kcRK01zPOby3?=
 =?us-ascii?Q?7NxEzFMMYAk4KdPRHNa6Jc5Lw+ds4SFoB2gusHr0scX0vEtZFI3A6CuoyvcY?=
 =?us-ascii?Q?qJnE+2MqMvCWN+9ChnIXQBZer98iPBLnd890Ru5n8KL9eSCb/oDLvnkX6xT2?=
 =?us-ascii?Q?qoxoSdT4VooOrFm2rym0CdpxazL2eX+COdVaBKchHxBgevaTSm5A4jIVz46y?=
 =?us-ascii?Q?rovwBcfXkKQVdw2VbhksIJWHoknaebC2wFusbY9HkPGusf8UznjUuPb2Fvcu?=
 =?us-ascii?Q?Is5X?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2021 14:39:00.2529 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-Network-Message-Id: 7717ed13-d17a-4145-75f2-08d8b63ea27e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1c9bycABZ9zEQU2yTc1qNQ1XDh4yROsIog6wtEl2h4a7goZb8S08+8BGVT65T2Dhk3VB/zzeP2+Q5uOmAgcDYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0401MB2595
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_093907_277178_6B50153F 
X-CRM114-Status: GOOD (  15.89  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Gene Chen <gene_chen@richtek.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 ChiYuan Huang <cy_huang@richtek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

CgpPbiAxMS8wMS8yMDIxIDE0OjA1LCBHZW5lIENoZW4gd3JvdGU6Cj4gSGkgTGVlLAo+IAo+IFRo
aXMgY2hhbmdlIGV4aXN0cyBpbiBbUEFUQ0ggdjcgMDMvMTFdIG1mZDogbXQ2MzYwOiBJbmRpY2F0
ZSBzdWItZGV2Cj4gY29tcGF0aWJsZSBuYW1lIGJ5IHVzaW5nICItIi4KPiBEb2VzIHBhdGNoIHY3
IGFsc28gbWVyZ2UgdG9nZXRoZXIgdG8gbWZkLW5leHQ/Cj4gCgpvbmNlIGFnYWluLCBwbGVhc2Ug
ZG9uJ3QgdG9wLXBvc3QuCgpTb3JyeSBJIGRpZG4ndCBzYXcgdGhpcyBwYXRjaC4gTG9va3MgZ29v
ZCB0byBtZSwgc28gcGxlYXNlIGlnbm9yZSB0aGlzIHBhdGNoIG1pbmUuCgpSZWdhcmRzLApNYXR0
aGlhcwoKPiA8bWF0dGhpYXMuYmdnQGtlcm5lbC5vcmc+IOaWvCAyMDIx5bm0MeaciDEx5pelIOmA
seS4gCDkuIvljYg4OjM15a+r6YGT77yaCj4+Cj4+IEZyb206IE1hdHRoaWFzIEJydWdnZXIgPG1i
cnVnZ2VyQHN1c2UuY29tPgo+Pgo+PiBNRkQgY2VsbCBuYW1lcyBhbmQgY29tcGF0aWJsZXMgdXNl
ICdfJyBpbnN0ZWFkIG9mICctJywgd2hpY2ggaXMgY29tbW9uCj4+IHByYWN0aWNlIGZvciBuYW1l
cyBhbmQgdGhlIHN0YW5kYXJkIGZvciBEVCBjb21wYXRpYmxlcy4KPj4gVGhpcyB3aWxsIGFsc28g
Zml4IHRoZSBwcm9iaW5nIGZvciB0aGUgZHJpdmVycyBhbHJlYWR5IGltcGxlbWVudGVkCj4+ICht
dDYzNjAtYWRjIGFuZCBtdDYzNjAtdGNwYykuCj4+Cj4+IEZpeGVzOiA3ZWRkMzYzNDIxZGEgKCJt
ZmQ6IEFkZCBzdXBwb3J0IGZvciBQTUlDIE1UNjM2MCIpCj4+IEZpeGVzOiAxZjQ4NzcyMThmN2Ug
KCJpaW86IGFkYzogbXQ2MzYwOiBBZGQgQURDIGRyaXZlciBmb3IgTVQ2MzYwIikKPj4gRml4ZXM6
IGUxYWVmY2RkMzk0ZiAoInVzYiB0eXBlYzogbXQ2MzYwOiBBZGQgc3VwcG9ydCBmb3IgbXQ2MzYw
IFR5cGUtQyBkcml2ZXIiKQo+PiBTaWduZWQtb2ZmLWJ5OiBNYXR0aGlhcyBCcnVnZ2VyIDxtYnJ1
Z2dlckBzdXNlLmNvbT4KPj4KPj4gLS0tCj4+Cj4+ICBkcml2ZXJzL21mZC9tdDYzNjAtY29yZS5j
IHwgMjQgKysrKysrKysrKysrLS0tLS0tLS0tLS0tCj4+ICAxIGZpbGUgY2hhbmdlZCwgMTIgaW5z
ZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21m
ZC9tdDYzNjAtY29yZS5jIGIvZHJpdmVycy9tZmQvbXQ2MzYwLWNvcmUuYwo+PiBpbmRleCA0NjYx
YzFiMjlhNzIuLjE0ZTY0OWZmZTUwZiAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9tZmQvbXQ2MzYw
LWNvcmUuYwo+PiArKysgYi9kcml2ZXJzL21mZC9tdDYzNjAtY29yZS5jCj4+IEBAIC0yOTIsMTgg
KzI5MiwxOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHJlc291cmNlIG10NjM2MF9sZG9fcmVzb3Vy
Y2VzW10gPSB7Cj4+ICB9Owo+Pgo+PiAgc3RhdGljIGNvbnN0IHN0cnVjdCBtZmRfY2VsbCBtdDYz
NjBfZGV2c1tdID0gewo+PiAtICAgICAgIE9GX01GRF9DRUxMKCJtdDYzNjBfYWRjIiwgbXQ2MzYw
X2FkY19yZXNvdXJjZXMsCj4+IC0gICAgICAgICAgICAgICAgICAgTlVMTCwgMCwgMCwgIm1lZGlh
dGVrLG10NjM2MF9hZGMiKSwKPj4gLSAgICAgICBPRl9NRkRfQ0VMTCgibXQ2MzYwX2NoZyIsIG10
NjM2MF9jaGdfcmVzb3VyY2VzLAo+PiAtICAgICAgICAgICAgICAgICAgIE5VTEwsIDAsIDAsICJt
ZWRpYXRlayxtdDYzNjBfY2hnIiksCj4+IC0gICAgICAgT0ZfTUZEX0NFTEwoIm10NjM2MF9sZWQi
LCBtdDYzNjBfbGVkX3Jlc291cmNlcywKPj4gLSAgICAgICAgICAgICAgICAgICBOVUxMLCAwLCAw
LCAibWVkaWF0ZWssbXQ2MzYwX2xlZCIpLAo+PiAtICAgICAgIE9GX01GRF9DRUxMKCJtdDYzNjBf
cG1pYyIsIG10NjM2MF9wbWljX3Jlc291cmNlcywKPj4gLSAgICAgICAgICAgICAgICAgICBOVUxM
LCAwLCAwLCAibWVkaWF0ZWssbXQ2MzYwX3BtaWMiKSwKPj4gLSAgICAgICBPRl9NRkRfQ0VMTCgi
bXQ2MzYwX2xkbyIsIG10NjM2MF9sZG9fcmVzb3VyY2VzLAo+PiAtICAgICAgICAgICAgICAgICAg
IE5VTEwsIDAsIDAsICJtZWRpYXRlayxtdDYzNjBfbGRvIiksCj4+IC0gICAgICAgT0ZfTUZEX0NF
TEwoIm10NjM2MF90Y3BjIiwgTlVMTCwKPj4gLSAgICAgICAgICAgICAgICAgICBOVUxMLCAwLCAw
LCAibWVkaWF0ZWssbXQ2MzYwX3RjcGMiKSwKPj4gKyAgICAgICBPRl9NRkRfQ0VMTCgibXQ2MzYw
LWFkYyIsIG10NjM2MF9hZGNfcmVzb3VyY2VzLAo+PiArICAgICAgICAgICAgICAgICAgIE5VTEws
IDAsIDAsICJtZWRpYXRlayxtdDYzNjAtYWRjIiksCj4+ICsgICAgICAgT0ZfTUZEX0NFTEwoIm10
NjM2MC1jaGciLCBtdDYzNjBfY2hnX3Jlc291cmNlcywKPj4gKyAgICAgICAgICAgICAgICAgICBO
VUxMLCAwLCAwLCAibWVkaWF0ZWssbXQ2MzYwLWNoZyIpLAo+PiArICAgICAgIE9GX01GRF9DRUxM
KCJtdDYzNjAtbGVkIiwgbXQ2MzYwX2xlZF9yZXNvdXJjZXMsCj4+ICsgICAgICAgICAgICAgICAg
ICAgTlVMTCwgMCwgMCwgIm1lZGlhdGVrLG10NjM2MC1sZWQiKSwKPj4gKyAgICAgICBPRl9NRkRf
Q0VMTCgibXQ2MzYwLXBtaWMiLCBtdDYzNjBfcG1pY19yZXNvdXJjZXMsCj4+ICsgICAgICAgICAg
ICAgICAgICAgTlVMTCwgMCwgMCwgIm1lZGlhdGVrLG10NjM2MC1wbWljIiksCj4+ICsgICAgICAg
T0ZfTUZEX0NFTEwoIm10NjM2MC1sZG8iLCBtdDYzNjBfbGRvX3Jlc291cmNlcywKPj4gKyAgICAg
ICAgICAgICAgICAgICBOVUxMLCAwLCAwLCAibWVkaWF0ZWssbXQ2MzYwLWxkbyIpLAo+PiArICAg
ICAgIE9GX01GRF9DRUxMKCJtdDYzNjAtdGNwYyIsIE5VTEwsCj4+ICsgICAgICAgICAgICAgICAg
ICAgTlVMTCwgMCwgMCwgIm1lZGlhdGVrLG10NjM2MC10Y3BjIiksCj4+ICB9Owo+Pgo+PiAgc3Rh
dGljIGNvbnN0IHVuc2lnbmVkIHNob3J0IG10NjM2MF9zbGF2ZV9hZGRyW01UNjM2MF9TTEFWRV9N
QVhdID0gewo+PiAtLQo+PiAyLjI5LjIKPj4KPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgt
bWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
