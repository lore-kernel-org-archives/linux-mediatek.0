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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 320A8C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 14:43:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9C2B221F8
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 14:43:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9C2B221F8
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Pdy+kLqA+kKA+RgVMoC+lgZcCLFgLS+9dCpRaQTfTds=; b=ub3LlucAjoz0PxTzb/vP6zo42
	VnT/l8veXwxtsJ1nGtPlHyh5hJCY/3+SyVuuSUpUua50mXJ8MNahEKdBmpeGqSJNvGVlXu1kzGK/n
	wn++f4GfUUdp1NcWKKcXs+8M/ynd90aMpVlb+t4hHk8+7xPXF5Bge3TVXvkrUiDls/mTV4atskvvg
	/ePE2VNLJGsxAg5EtPMLT339yxx0ynadErgzAdIP5/U3esDekuDmr1fFgePv892pcyrzawTt+FZaL
	B9EWaLJG99ybsrrYM9gX3HA0APUsWtHRcMcJ8/pKmiE7C4Ry1IzjTD6JPWsVSWWrr18VeUFutovY9
	wZwl2/Oqw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kyyPM-0002Sq-0j; Mon, 11 Jan 2021 14:43:00 +0000
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kyyPF-0002QB-Qs
 for linux-mediatek@lists.infradead.org; Mon, 11 Jan 2021 14:42:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1610376171;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1G8cuiVUFhWPKP83ojLy/0EVJtSx/vMz7FSWedeR9zU=;
 b=RvcfNTyGhK12bvs0j+fdLULOQOSf3pP4gpHjDlXRZS+kr7n+wo8rXV+hXOtzt9PxKW405P
 qWF9kKPlNjDzVZoqyN7dOvyRDbSIuwp/IMj/MGtsiQIthzSWxB4d9ZHyPpuaZ4wznpoghk
 eAv/fcqwP4sSambtNtwEDLlJfs+rpWI=
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2059.outbound.protection.outlook.com [104.47.0.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-25-y_1jlEjVOTOH-jQBDdsILA-1; Mon, 11 Jan 2021 15:42:49 +0100
X-MC-Unique: y_1jlEjVOTOH-jQBDdsILA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O7GBa9HtPEkp3ECDsG2cYFOc7Tc0DtyDYCg9YPFGg5+L2dzwilwRXFGLModiNDyTbO1dNn9k3hEIuRdH070p/M8O4XFCB1OV2ci+EyUo/gYjn8bVSwVByXpZpE5rHN0Ce1KpBUCi3mduTi7AKn7TdWSk/lG1wAI3j11khwGjYs7pOVAuGzEWuwh/ZOPLhOzJ2mCZZP5opBT1+0lkqXe9gmlpxDZ5ky4+Tqvb3f9KXbfhOhr+gu0uwQtqNlrjJd+GSLQgWbS17cFU21K2fQDFcaY7y4RXYOk10RwpDtMUV1hTzOor1f8Zc7zI1pVG/vnylvkEFv9wP3j4mv6fzBpVuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O6DpbqNjiPazuPaQF+Q7z0ZdhMo+VrAm/58NplvKVAw=;
 b=E9AKNs3nNV29RNMxsDJqy17A19eh2hEhAxX2CzixA5UbR3NW+SndLhu2Wduu2U7xbBM1RmuAvCWupgv8KVtcTT0WD/EhvnQecu2WhlOo5MACA97EBRURzhgrfGpI77FxE76bfS6s6kzQ2tYTTTFzWYA56fSOhVuI5gWswJZWNgFS3mcEI7FHQvgA2m6L9K0NDveWrG5yEMbxYALcMV8m/ropOQFSHCzHTFT0dbxUpIHNwv6TJFV+FD5Ds2waSV4t1qdS4mbkBs6wHKhbwmteErfV4koELSFqNBbfIXoE8DnSnEZ11/of2gASv2bZrpQOawW6Cmm7VnqNojAXdGDfpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: fi.rohmeurope.com; dkim=none (message not signed)
 header.d=none; fi.rohmeurope.com; dmarc=none action=none header.from=suse.com; 
Received: from AM6PR04MB5366.eurprd04.prod.outlook.com (2603:10a6:20b:9d::19)
 by AM5PR0401MB2595.eurprd04.prod.outlook.com (2603:10a6:203:2f::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Mon, 11 Jan
 2021 14:42:48 +0000
Received: from AM6PR04MB5366.eurprd04.prod.outlook.com
 ([fe80::58d1:4050:d882:3ca0]) by AM6PR04MB5366.eurprd04.prod.outlook.com
 ([fe80::58d1:4050:d882:3ca0%7]) with mapi id 15.20.3742.012; Mon, 11 Jan 2021
 14:42:48 +0000
Subject: Re: [PATCH v2 1/3] regulator: mt6360: Add OF match table
To: =?UTF-8?B?Z2VuZV9jaGVuKOmZs+S/iuWuhyk=?= <gene_chen@richtek.com>,
 "matthias.bgg@kernel.org" <matthias.bgg@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
References: <20210109112612.1221-1-matthias.bgg@kernel.org>
 <b358179732f940f883c12dd1276f855a@richtek.com>
From: Matthias Brugger <mbrugger@suse.com>
Message-ID: <a82ba3bd-2ca0-f0cd-b715-a59b57284c1b@suse.com>
Date: Mon, 11 Jan 2021 15:42:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <b358179732f940f883c12dd1276f855a@richtek.com>
Content-Language: en-US
X-Originating-IP: [213.195.126.134]
X-ClientProxiedBy: AM0PR02CA0027.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::40) To AM6PR04MB5366.eurprd04.prod.outlook.com
 (2603:10a6:20b:9d::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ziggy.stardust (213.195.126.134) by
 AM0PR02CA0027.eurprd02.prod.outlook.com (2603:10a6:208:3e::40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Mon, 11 Jan 2021 14:42:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2312cd48-4086-4b82-6112-08d8b63f2a6a
X-MS-TrafficTypeDiagnostic: AM5PR0401MB2595:
X-Microsoft-Antispam-PRVS: <AM5PR0401MB2595AB726D1743D6F6843BB2BAAB0@AM5PR0401MB2595.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DEGO411Oo6/A7eDW5Gd9Vv4BfelDbRrqgRlMhiRfUisIvkKdeS5UbyLNupFFGDMQOWOQoJkFh7senZJycEsTBZahLuPlX8vgva0Cp4vRsh3OYMsxT866Y7rX7Y5Y/qzpN9N295SpnDScSTZuErmRHo2I8e2qFogs1QfOgcd56VMsmPfOlddQ89HqH/R7iYax6VeoQMEs1FUupR9eHPGH3FArOgzwwN76mwCn8CUsdedJOdysXymtxsyqR9hoJZbkjvFC1P96b6I+n6C9L/ZsWP6iWHarOyNCd5IhxeyYYoVVKaMvqAsnISapvNPtoN6TEuU6Z5fZBNLFoZbzSBWJ6gACrW2r3q57lkABiK8Y12AsaWzeFpMkLyh0JefqM6getTbUJ/CXZicD0tbZBzH06KUr+S/QTH/1D00yIQ7Di57wSlZJepXV5SkD+H62iGZpEnVNnMJDHKI3Czqmb4SL1ucJso0uNoBtMRTL15BAiYdN5J59v1PZt/Wo/E6l1b60MM7SP4HN/13DYvycuuv+eSPxbEXs3dlSkDZCqCnE5dkgqLqG+95vhzCrpYBEvSP6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR04MB5366.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(366004)(376002)(396003)(136003)(39860400002)(54906003)(53546011)(6506007)(316002)(36756003)(956004)(2616005)(110136005)(478600001)(66946007)(66556008)(8936002)(86362001)(7416002)(31686004)(66476007)(52116002)(5660300002)(6486002)(16526019)(6512007)(5009610100001)(31696002)(83380400001)(8676002)(966005)(2906002)(4326008)(26005)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?1pqLeX/XUMex/34lQFyt+8LV7SowvCMVbwOoLYqPu6FyG7GdX5uXeeCw1EF2?=
 =?us-ascii?Q?nvo9FfHWIjZHFZ2ykhY5RszxxHmSdGm4YxFjAshs7ZQkg6/9E94Xt/Ocje4V?=
 =?us-ascii?Q?Vr2HGJ3yeqHt6a64Y7Tv4R+D89yLuEQc8o9Agl6o5LC4eGLAvRU5ioVaaTfO?=
 =?us-ascii?Q?/7g0+XGH7fhakMc0CjV41wH+sCIR2o3yzi017Psz/fasOCGxIQ4FFIUMgvhy?=
 =?us-ascii?Q?X6ziv0wT+LlvHPSK6c1SuJcdA/3GL3exbdjw/d0zIhUVIc3E0N6Z8PuUiMWt?=
 =?us-ascii?Q?GYNup9Q4p9g5255dy4XxJ2ArIZADO0FMwlTUu/3Te13y21B8vXl8nh1FoNzc?=
 =?us-ascii?Q?DjEcshPNZ/IPH+69qAHZuvOVaSetQB1PsqWuEWWWlnGvbaeGU8sSmSmokdRp?=
 =?us-ascii?Q?g7nqjh+9FCfMKzW5WnupXUY6xEHKBYURKrC6ema0vSdI8F47XhxFk/UzDtGx?=
 =?us-ascii?Q?kRKzz8d6quy/JMtGmp0g4MW95CjHaF1IEXyLy24PUx1jrfIkzXT4LIzHavHk?=
 =?us-ascii?Q?D3NR9e3xdM5UGHB0gcWcNZclxnuhs3ZPr8gS9rMdG8cWGskwSZ6T9Fm5x6Is?=
 =?us-ascii?Q?DNmdHx1lsHi3BrGoPYTyXUH4Jk3inGEesTCjKJLDukoJHqJmgf8DPQi2/ibc?=
 =?us-ascii?Q?EnlWNyR+SUfI7wzmaKPrKdiRwYqEo0xGh2XCAFp+6cuOA/xvOycd7bJtYw5o?=
 =?us-ascii?Q?e1Fyp3qrH426hhiWbl2kX53sV5xIy+3jxYvSWHTfCA8H2NuuRWU6D2VUuXUG?=
 =?us-ascii?Q?BKCBwPahEncn295TuvMI4R+/7gRV0bHt1/Q8WKPYBvrgtRT1d6U6RH4WgghB?=
 =?us-ascii?Q?a+fkvc1gbapwEsPmjG02JAriubp2hBWgsGizGRrNJJnmqd8bXrnApt1S7ymI?=
 =?us-ascii?Q?I9IBmb7Q67RmFQ+m8O9rmOY27ktabmDbR4QoFxan2CVlVQH2hsdExuVIvR4y?=
 =?us-ascii?Q?+Lc6LRtEqfHSoSyXqc5p3ZSK1AvKTN36FiI2bqcHT7CN9y1WYtqICn3lFd0+?=
 =?us-ascii?Q?NgYa?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2021 14:42:48.3005 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-Network-Message-Id: 2312cd48-4086-4b82-6112-08d8b63f2a6a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5ToMsxEzix74wSBhcUER8xkfWMKdCSpvVcb6g8RwRjGD4SKPmj2umCLRzEuqhQCh4fN8PFJkPnJExGBTgmnJdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0401MB2595
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_094254_020068_DCEC3D81 
X-CRM114-Status: GOOD (  16.78  )
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
Cc: Axel Lin <axel.lin@ingics.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chen Zhong <chen.zhong@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

CgpPbiAxMS8wMS8yMDIxIDAzOjE4LCBnZW5lX2NoZW4os6+rVKZ0KSB3cm90ZToKPiBbIEludGVy
bmFsIFVzZSAtIEV4dGVybmFsIF0KPiAKPiBIaSBNYXR0aGlhcywKPiAKPiBJIGRpc2N1c3NlZCBP
RiBtYXRjaCB0YWJsZSB3aXRoIE1hcmsgaW4gcHJldmlvdXMgbWFpbCBpbiBvdXIgUEFUQ0ggdjMs
Cj4gTUZEIHNob3VsZCBqdXN0IGluc3RhbnRpYXRlIHRoZSBwbGF0Zm9ybSBkZXZpY2UuCj4gCj4+
IE1hcmsgQnJvd24gPGJyb29uaWVAa2VybmVsLm9yZz4gqfMgMjAyMKZ+OKTrMjCk6SC2Z6V8IKRV
pMg3OjQ1vGe5RKFHCj4gCj4+PiBUaGlzIGRldmljZSBvbmx5IGV4aXN0cyBpbiB0aGUgY29udGV4
dCBvZiBhIHNpbmdsZSBwYXJlbnQgZGV2aWNlLCB0aGVyZQo+Pj4gc2hvdWxkIGJlIG5vIG5lZWQg
Zm9yIGEgY29tcGF0aWJsZSBzdHJpbmcgaGVyZSAtIHRoaXMgaXMganVzdCBhIGRldGFpbAo+Pj4g
b2YgaG93IExpbnV4IGRvZXMgdGhpbmdzLiAgVGhlIE1GRCBzaG91bGQganVzdCBpbnN0bnRpYXRl
IHRoZSBwbGF0Zm9ybQo+Pj4gZGV2aWNlLgo+IAo+PiBUcnlpbmcgdG8gYXV0b2xvYWQgbW9kdWxl
IHdpdGhvdXQgb2ZfaWRfdGFibGUgd2lsbCBjYXVzZSBydW4tdGltZSBlcnJvcjoKPj4gdWV2ZW50
ZDogTG9hZFdpdGhBbGlhc2VzIHdhcyB1bmFibGUgdG8gbG9hZAo+PiBvZjpOcmVndWxhdG9yVChu
dWxsKUNtZWRpYXRlayxtdDYzNjAtcmVndWxhdG9yCj4gCj4gWW91IHNob3VsZG4ndCBoYXZlIHRo
aXMgZGVzY3JpYmVkIGluIHRoZSBkZXZpY2UgdHJlZSBhdCBhbGwsIGxpa2UgSSBzYXkKPiB0aGUg
TUZEIHNob3VsZCBqdXN0IGluc3RhbnRpYXRlIHRoZSBwbGF0Zm9ybSBkZXZpY2UuCj4gCgpXZWxs
IHdpdGggdGhlIHBhdGNoIHlvdSBzZW5kIHRvIGVuYWJsZSByZWd1bGF0b3JzIFsxXSAgeW91IHVz
ZSBPRl9NRkRfQ0VMTC4gU28KbXkgdW5kZXJzdGFuZGluZyBpcywgaWYgeW91IGRvbid0IHByb3Zp
ZGUgYW4gb2ZfbWF0Y2hfdGFibGUgaW4gdGhlIHJlZ3VsYXRvcgpkcml2ZXIsIHRoZSBsb2FkaW5n
IHZpYSB1ZGV2IGlzIGJyb2tlbiAobGlrZSB5b3UgbWVudGlvbmVkIGluIHRoZSBjaXRlIGZyb20g
YW4Kb2xkZXIgZW1haWwpLgoKUmVnYXJkcywKTWF0dGhpYXMKClsxXQpodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9saW51eC1tZWRpYXRlay8xNjA1MTc3NTk4LTIzNTAxLTUtZ2l0LXNlbmQtZW1haWwt
Z2VuZS5jaGVuLnJpY2h0ZWtAZ21haWwuY29tLwoKPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0KPj4gRnJvbTogbWF0dGhpYXMuYmdnQGtlcm5lbC5vcmcgPG1hdHRoaWFzLmJnZ0BrZXJuZWwu
b3JnPgo+PiBTZW50OiBTYXR1cmRheSwgSmFudWFyeSA5LCAyMDIxIDc6MjYgUE0KPj4gVG86IExp
YW0gR2lyZHdvb2QgPGxnaXJkd29vZEBnbWFpbC5jb20+OyBNYXJrIEJyb3duCj4+IDxicm9vbmll
QGtlcm5lbC5vcmc+Cj4+IENjOiBIc2luLUhzaXVuZyBXYW5nIDxoc2luLWhzaXVuZy53YW5nQG1l
ZGlhdGVrLmNvbT47IEF4ZWwgTGluCj4+IDxheGVsLmxpbkBpbmdpY3MuY29tPjsgQ2hlbiBaaG9u
ZyA8Y2hlbi56aG9uZ0BtZWRpYXRlay5jb20+Owo+PiBnZW5lX2NoZW4os6+rVKZ0KSA8Z2VuZV9j
aGVuQHJpY2h0ZWsuY29tPjsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsKPj4gbGludXgt
bWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZy
YWRlYWQub3JnOwo+PiBNYXR0aGlhcyBCcnVnZ2VyIDxtYXR0aGlhcy5iZ2dAZ21haWwuY29tPjsg
TWF0dGkgVmFpdHRpbmVuCj4+IDxtYXR0aS52YWl0dGluZW5AZmkucm9obWV1cm9wZS5jb20+OyBN
YXR0aGlhcyBCcnVnZ2VyCj4+IDxtYnJ1Z2dlckBzdXNlLmNvbT4KPj4gU3ViamVjdDogW1BBVENI
IHYyIDEvM10gcmVndWxhdG9yOiBtdDYzNjA6IEFkZCBPRiBtYXRjaCB0YWJsZQo+Pgo+PiBGcm9t
OiBNYXR0aGlhcyBCcnVnZ2VyIDxtYnJ1Z2dlckBzdXNlLmNvbT4KPj4KPj4gQmluZGluZyBkb2N1
bWVudGF0aW9uIG1lbnRpb25zIHRoYXQgYSBjb21wYXRpYmxlIGlzIHJlcXVpcmVkIGZvciB0aGUK
Pj4gTVQ2MzYwIGRldmljZSBub2RlLCBidXQgdGhlIGRyaXZlciBkb2Vzbid0IHByb3ZpZGUgYSBP
RiBtYXRjaCB0YWJsZS4KPj4KPj4gRml4ZXM6IGQzMjE1NzFkNWU0YyAoInJlZ3VsYXRvcjogbXQ2
MzYwOiBBZGQgc3VwcG9ydCBmb3IgTVQ2MzYwIHJlZ3VsYXRvciIpCj4+IFNpZ25lZC1vZmYtYnk6
IE1hdHRoaWFzIEJydWdnZXIgPG1icnVnZ2VyQHN1c2UuY29tPgo+Pgo+PiAtLS0KPj4KPj4gQ2hh
bmdlcyBpbiB2MjoKPj4gLSBjaGVjayBmb3IgQ09ORklHX09GCj4+IC0gYWRkIEZpeGVzIHRhZwo+
Pgo+PiAgZHJpdmVycy9yZWd1bGF0b3IvbXQ2MzYwLXJlZ3VsYXRvci5jIHwgOSArKysrKysrKysK
Pj4gIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvcmVndWxhdG9yL210NjM2MC1yZWd1bGF0b3IuYwo+PiBiL2RyaXZlcnMvcmVndWxhdG9y
L210NjM2MC1yZWd1bGF0b3IuYwo+PiBpbmRleCAxNTMwOGVlMjljMTMuLmY3YjI1MTRmZWFiZiAx
MDA2NDQKPj4gLS0tIGEvZHJpdmVycy9yZWd1bGF0b3IvbXQ2MzYwLXJlZ3VsYXRvci5jCj4+ICsr
KyBiL2RyaXZlcnMvcmVndWxhdG9yL210NjM2MC1yZWd1bGF0b3IuYwo+PiBAQCAtNDQ1LDkgKzQ0
NSwxOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHBsYXRmb3JtX2RldmljZV9pZAo+PiBtdDYzNjBf
cmVndWxhdG9yX2lkX3RhYmxlW10gPSB7ICB9OyAgTU9EVUxFX0RFVklDRV9UQUJMRShwbGF0Zm9y
bSwKPj4gbXQ2MzYwX3JlZ3VsYXRvcl9pZF90YWJsZSk7Cj4+Cj4+ICsjaWZkZWYgQ09ORklHX09G
Cj4+ICtzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBtdDYzNjBfb2ZfbWF0Y2hbXSA9
IHsKPj4gK3sgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ2MzYwLXJlZ3VsYXRvciIsIH0sCj4+
ICt7IC8qIHNlbnRpbmVsICovIH0sCj4+ICt9Owo+PiArTU9EVUxFX0RFVklDRV9UQUJMRShvZiwg
bXQ2MzYwX29mX21hdGNoKTsgI2VuZGlmCj4+ICsKPj4gIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1f
ZHJpdmVyIG10NjM2MF9yZWd1bGF0b3JfZHJpdmVyID0gewo+PiAgLmRyaXZlciA9IHsKPj4gIC5u
YW1lID0gIm10NjM2MC1yZWd1bGF0b3IiLAo+PiArLm9mX21hdGNoX3RhYmxlID0gb2ZfbWF0Y2hf
cHRyKG10NjM2MF9vZl9tYXRjaCksCj4+ICB9LAo+PiAgLnByb2JlID0gbXQ2MzYwX3JlZ3VsYXRv
cl9wcm9iZSwKPj4gIC5pZF90YWJsZSA9IG10NjM2MF9yZWd1bGF0b3JfaWRfdGFibGUsCj4+IC0t
Cj4+IDIuMjkuMgo+ICoqKioqKioqKioqKiogRW1haWwgQ29uZmlkZW50aWFsaXR5IE5vdGljZSAq
KioqKioqKioqKioqKioqKioqKgo+IAo+IFRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhp
cyBlLW1haWwgbWVzc2FnZSAoaW5jbHVkaW5nIGFueSBhdHRhY2htZW50cykgbWF5IGJlIGNvbmZp
ZGVudGlhbCwgcHJvcHJpZXRhcnksIHByaXZpbGVnZWQsIG9yIG90aGVyd2lzZSBleGVtcHQgZnJv
bSBkaXNjbG9zdXJlIHVuZGVyIGFwcGxpY2FibGUgbGF3cy4gSXQgaXMgaW50ZW5kZWQgdG8gYmUg
Y29udmV5ZWQgb25seSB0byB0aGUgZGVzaWduYXRlZCByZWNpcGllbnQocykuIEFueSB1c2UsIGRp
c3NlbWluYXRpb24sIGRpc3RyaWJ1dGlvbiwgcHJpbnRpbmcsIHJldGFpbmluZyBvciBjb3B5aW5n
IG9mIHRoaXMgZS1tYWlsIChpbmNsdWRpbmcgaXRzIGF0dGFjaG1lbnRzKSBieSB1bmludGVuZGVk
IHJlY2lwaWVudChzKSBpcyBzdHJpY3RseSBwcm9oaWJpdGVkIGFuZCBtYXkgYmUgdW5sYXdmdWwu
IElmIHlvdSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lwaWVudCBvZiB0aGlzIGUtbWFpbCwgb3Ig
YmVsaWV2ZSB0aGF0IHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZS1tYWlsIGluIGVycm9yLCBwbGVh
c2Ugbm90aWZ5IHRoZSBzZW5kZXIgaW1tZWRpYXRlbHkgKGJ5IHJlcGx5aW5nIHRvIHRoaXMgZS1t
YWlsKSwgZGVsZXRlIGFueSBhbmQgYWxsIGNvcGllcyBvZiB0aGlzIGUtbWFpbCAoaW5jbHVkaW5n
IGFueSBhdHRhY2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwgYW5kIGRvIG5vdCBkaXNjbG9zZSB0
aGUgY29udGVudCBvZiB0aGlzIGUtbWFpbCB0byBhbnkgb3RoZXIgcGVyc29uLiBUaGFuayB5b3Uh
Cj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRp
YXRlawo=
