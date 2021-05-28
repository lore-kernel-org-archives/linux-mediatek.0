Return-Path: <SRS0=JD7o=KX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0185C4708C
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 May 2021 09:03:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CD0361222
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 May 2021 09:03:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9CD0361222
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fi.rohmeurope.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:
	In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l6gJp3aKtf/KhCMglzs6Y5pyWDj3EU4GVguLV7E2zg8=; b=EUQPhO3rJMl7LM
	v7uMRpxi3/dLFqgzvqWZcskDAr64JedrqSz3n59E1uXTk2BJ7OPSH5B8bGKcyX9K8pZVljC3PxTDx
	FrZzq1dFKrCcA47kn1ApbfK9LWP56g94+yNqkApAOYXZjf9fZzjkoaCoZLbS3a8r4YZH9L8T8nRfC
	xmroCQYnO9/a+TRlREd7apmscy24LAvoiq2muZh6LJd8RgFS/7MgwF/x1U+QnhxvXsxDId5Tt7fR1
	rGS5DA1Ii6xsP9/SaTZiXr+cDwCE49MffQdqsbJ8tdrs8DG4Z7DbNLodOCuIsVN3GnR/w2uARqI9g
	5II+5DE3RmYVR43MIG6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmYOZ-00Df9B-6X; Fri, 28 May 2021 09:03:07 +0000
Received: from mail-eopbgr00067.outbound.protection.outlook.com ([40.107.0.67]
 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmYOF-00Df1T-7s; Fri, 28 May 2021 09:02:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gwRId6CYT8LCHlxFWJsN1/qlUoKvRuG1Zwy0Of9MBZkaVCpwVStdsio21ZjjJ0A6KbAdddqwgWtwM42I4Bz6/WFLEAchDiLHMlUXfCSv7JoKRjoxrPojWsnbb77334ki44V+XowjX2GXzAK0+93UseywX46MXtnkRraN8vEqlHyWJwQybU7Q8uB64+tRSsReLUW2v0uIqxjL6fEBYKZVI1u5RTmE7DpRB1jCmrPLrdce4ZpQjBQSY+l9RyVsa2GuVy8DB0UZm7I3ypsZpJDzQXiZNKsdJBsvmtEece0nhxFg67p8qY9QIBgMlGt5BaqYIpEsqT5srxsne6hOO0UoAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gvBxuaEtbZPZXkt8osRwEO3oSrS7+eOFWMxhaditLm8=;
 b=GOwucVsC3jsOZU7ROFFM4a/6+WpJNFR8TR/pcprNAbOwQEMW4DJCyJ95zP6S0f+rFpHLcvd8yvIRztfKNsCWpFLHVIL2A5dIzLGxeaS2vjl2RKtqlJ0DxQt3wFZwaeGw2aIGDSRLY/tXuJ5mMVYwlMVwExssryqDKGM4cM90DMCS28oKg07s6zdvfJe3na4FsJ4wiftN7D0WrXSv+Sz0HVABmUNPsPXDvJwJAuLe3HjZxDQoXRZPKb243zopopXdmrJkPOAhK7XQmjxXQfiAdYihX50IWc6M/IyEo5b8cpYvRseDKKyoeKVWMy/A7Allp9Tn3F9wZte+N/gagUJMDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gvBxuaEtbZPZXkt8osRwEO3oSrS7+eOFWMxhaditLm8=;
 b=DxpCwLYYZFdVbdn/BJyQVAS73VPJbEYhFn2QQw24jFOtlFVgPfUUHytB8FwSGymdzJNICcOENZZW4h/S5X9cK04aCJS/TJMwovwflH+eMT96QP6PY8aDg/ugwAgm0Uum2wxpaZAbAv56gPZfI7D4V6XnTM6+m3TeFgqf6njFqTM=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR0301MB2393.eurprd03.prod.outlook.com (2603:10a6:3:68::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.24; Fri, 28 May 2021 09:02:42 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::a88a:6fa9:ab7f:4a44]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::a88a:6fa9:ab7f:4a44%4]) with mapi id 15.20.4173.026; Fri, 28 May 2021
 09:02:42 +0000
From: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To: "gene.chen.richtek@gmail.com" <gene.chen.richtek@gmail.com>,
 "sre@kernel.org" <sre@kernel.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>
CC: "rdunlap@infradead.org" <rdunlap@infradead.org>, "inux-pm@vger.kernel.org"
 <inux-pm@vger.kernel.org>,
 "shufan_lee@richtek.com" <shufan_lee@richtek.com>, 
 "cy_huang@richtek.com" <cy_huang@richtek.com>, "broonie@kernel.org"
 <broonie@kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "gene_chen@richtek.com"
 <gene_chen@richtek.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "Wilma.Wu@mediatek.com"
 <Wilma.Wu@mediatek.com>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "benjamin.chao@mediatek.com"
 <benjamin.chao@mediatek.com>
Subject: Re: [PATCH v5 1/3] lib: add linear range get selector within
Thread-Topic: [PATCH v5 1/3] lib: add linear range get selector within
Thread-Index: AQHXU5lQ+linZHKpckqd+H+t7ps1cKr4mTqA
Date: Fri, 28 May 2021 09:02:42 +0000
Message-ID: <8d5eb59bf3a2054e945d6c3c0203be529b61f8ec.camel@fi.rohmeurope.com>
References: <20210528081300.64759-1-gene.chen.richtek@gmail.com>
 <20210528081300.64759-2-gene.chen.richtek@gmail.com>
In-Reply-To: <20210528081300.64759-2-gene.chen.richtek@gmail.com>
Accept-Language: fi-FI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.34.4 (3.34.4-1.fc31) 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none
 header.from=fi.rohmeurope.com;
x-originating-ip: [2001:14ba:16e2:8300::4]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c751bd2c-b492-4ad0-0214-08d921b75a17
x-ms-traffictypediagnostic: HE1PR0301MB2393:
x-microsoft-antispam-prvs: <HE1PR0301MB2393AA9F558F79CD5F754CFAAD229@HE1PR0301MB2393.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PSe/UBTpkbGN1jKFvsDhxu4wcUeOqC1X9TQtYhftC+cT6yMmYb7OUNVXxDFU8OIdx2s9u2lk7qslD6c7VQe3mwezvUN8O/tJfyJimpFVaPkuuSlQmVOxn/xj+RPU4QxYegez07sawZTiPj1BdKBwjzBoBVpRd7XsCnNbdsr1/XQVKLDsn0kCqJpj0UQDY/pd1Ds/qIuNevobDRHI7r/jEMfwsrJ0mKAYaAbT7jvFTojpvU1AhugEqK3HAshXaUPeuG/VDywl1HARaU4HP7dLgV372ppB7clJfnWR8gkKsWixkhLU+4F5P4FbS4uRfkJfBHqi1WGZ3MU8sANHxj1J+21StMhS9eF+7uahB1DUmrLX+mjfh2VpLqnvHs/5PK8vnSQzaCaKsmR1NEnUOtBhf7rKjVneDkINepe+olw0xBIkxdum4JxDepSvnK5/UdTjOmn0oXVOBExhgR2zRkFCBRS7ZrvH3dAQTk1Js0ReypEQhxx6WZl1m3MEefv0caZ8bgUZ6aiBAG+uVdCnieY80j3Ndybd3WE+Yn3xwdnpKOCDFsT8k5Et4A5nI9ApluN12romtfICk41QqHZTFUzsgdWNVuhfqyYFkWF+UB5mSHM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HE1PR03MB3162.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39840400004)(396003)(366004)(136003)(376002)(478600001)(83380400001)(186003)(71200400001)(6506007)(8676002)(3450700001)(316002)(8936002)(2906002)(122000001)(110136005)(38100700002)(7416002)(86362001)(6486002)(54906003)(4326008)(5660300002)(6512007)(76116006)(2616005)(66446008)(64756008)(66476007)(66556008)(66946007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?dEpMQ0ltTjAxYnlKejVkVzFGdXQ1V3d0RGdONEhleFBlaHg5em9GTFk3ZnpL?=
 =?utf-8?B?VU1JSWNsZUIwNHNGSHZEOWFtRkticE82eU1yWEx0WjMrSFdLYW1xbENZcXpm?=
 =?utf-8?B?WXc4U2FYNHo2Nk0zSnQrZWI2RUU0RXR1a3VvV0FFWTFjRU1LYzVNSzFFSW5E?=
 =?utf-8?B?V3BDajlNb1F3NXUrZ3B2ZllZcW1JdUtJM3o0MUxQcERFZW52aFArTVVEN2dr?=
 =?utf-8?B?OVVXQUZKRHdpRGxyaXJpSW9Qd3dENjloc1ZtOSt2VzVXZFFOS2pGbmlJdEZh?=
 =?utf-8?B?d09pT3BzbXdzRURLaGdac2pvRGNzNkZUSWlzMjJTcnIyVWhwMGNpVWg0WGdp?=
 =?utf-8?B?MExUa0lUUVZ6VlRNQlU4MUxTYVFEMGdrMEV6WTlmMkNLYlFmT3ZnVUQrd21W?=
 =?utf-8?B?UEFhVXZwZ1htU2tDQ0NXNWx2aytDMGFLZ2hJOHYvZXlXc0VrOUVSdUMzNW5N?=
 =?utf-8?B?THhYUDd4eCtzTTNZSldjblNqbGkySlNYVzhXYUJYejFlRWgxNVVxcmRqUGtR?=
 =?utf-8?B?WXdIYUpzYmo2bmgzazNDUlYyenk1dnBJVWxzV0xkbTdGZTlabFJhOXc3dUJJ?=
 =?utf-8?B?Q3l0VW12WDdSd1ZlNkgvVkIwQnU0Y3A5QlladjZrbWhjbjRlR1VPQm9VU2tX?=
 =?utf-8?B?U3lDYWZzNmNZejFUL2JYaW5uT1ZFN1J3OVVsdHlzdnhmSXlvcmZCdDRGaTBN?=
 =?utf-8?B?UE1CTDRqeHAxcEZjeEpONDJucW5tcm03ejU1eTV2QUtlejdLMDYxWlFIWHk0?=
 =?utf-8?B?ejdJL3hTYTBieWRqR1pUQmt4dGNoN0pubThycXhRRFloWUJpUnZzV0ZBTnVO?=
 =?utf-8?B?OFBKeE4wWlV3Y0hhdXhPOGlWdXNNNUhLOS92ZStpSGgwb3Q1aS83UWV4QTY5?=
 =?utf-8?B?S1c5Q3FhWWNHS2g5dGF1aDNqdmQ2bUlKNmdQWWpzMlIvekxxS0dtZGRoQm1q?=
 =?utf-8?B?bldvM0RveFJwN3RNVE1sVC9UY1dFeVBwamRCRVRMRFBwelAxelB4RFFHWFUr?=
 =?utf-8?B?b1YwU1A2MWYwVXF4bWMvNVo0ZDgrYXJLYkliOWFUbDRlWDNQcUNENE1PMG1Y?=
 =?utf-8?B?TXhxQU9GejJEMEFPWXF0cGgyNnc4QXJkSkZYZjZ3YnNjeE5QeVZTa1B1OVNL?=
 =?utf-8?B?M0JuZ1VGa0lEdXBnR3QzU3E0aU9BNVc5ZC9tdERncTU1NVBxU3VUZ2NMMVBZ?=
 =?utf-8?B?N0UwbThiaTdjaFhVZWdLWWJTRmVVdnUxaitBM0QwTGFOTWpsVzRXODl3WHY5?=
 =?utf-8?B?cy9aaVdicE1ibjZnUDhxZzVWYTllSy9rb1hIYm4zWGthOGdkRjVUaENUVTM3?=
 =?utf-8?B?dUNsTDdVM3RiUmFkYmJwVG81bXhYMXBtSlNnSFoxR2lZTEwzTXlLUDFPZk4y?=
 =?utf-8?B?bFo2Q3JqL1lLeUxpY25DWXZMT0c2NSt2dDIvOUJnajR2N3pVcXNQdWV3cFZE?=
 =?utf-8?B?SFcrTVd6c0loNndxNTRWbUovMFJFVE5UUU5FRmRsTmx6NkdYNGk3b3A4QVpv?=
 =?utf-8?B?MHBmbWVheEd3MFplbDVQam1xQ09xaUdvOU05cFNBWEs2MnJiSjE1bENTdXdO?=
 =?utf-8?B?ZVRTdlFjTFROeW1wWHhaNHpiQ0lxeEJ0aHF4ZjJmUWNBY3NvWExJTGkzVHhl?=
 =?utf-8?B?UjQ0elE4NVJGeFFHTFd6Wk1TYTdNUkRWdDlFeDRkdGJBd05qY29TYUc5cnE5?=
 =?utf-8?B?ZC9LczluOGI4ZEFXMit1TEtGTjNLMnFiSVlBT1REL0tDMXR5V09tTFJCS3Mw?=
 =?utf-8?B?VmtzNnMwai9aTUlmU3ppMUtvckYzM2RzZGk4a2hVdUhzb001akhSRWE5M0pq?=
 =?utf-8?Q?sLsbDzMw6zFMTQI8JKv8pQ4tiOAZBjcN1OVXE=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <7AB756DAFEE3424E8A0746A45629390C@eurprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c751bd2c-b492-4ad0-0214-08d921b75a17
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2021 09:02:42.1936 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aUCbvH2FvLZ33o9zci0ze9a1iumqAU7xozJpAzp+dxIcsavnu4Jx/n+xG/sAFKggmgj0eEr8Dfgg6XF4Xs9Zg41aFcnMH15/RSPycrq8Qi4IOTbhfNfHZ7EFxGITyiQ1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0301MB2393
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210528_020247_381670_A07D96D0 
X-CRM114-Status: GOOD (  22.15  )
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
Reply-To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2021-05-28 at 16:12 +0800, Gene Chen wrote:
> From: Gene Chen <gene_chen@richtek.com>
> 
> Add linear range get selector within for choose closest selector
> between minimum and maximum selector.
> 
> Signed-off-by: Gene Chen <gene_chen@richtek.com>
> ---
>  include/linux/linear_range.h |  2 ++
>  lib/linear_ranges.c          | 31 +++++++++++++++++++++++++++++++
>  2 files changed, 33 insertions(+)
> 
> diff --git a/include/linux/linear_range.h
> b/include/linux/linear_range.h
> index 17b5943727d5..fd3d0b358f22 100644
> --- a/include/linux/linear_range.h
> +++ b/include/linux/linear_range.h
> @@ -41,6 +41,8 @@ int linear_range_get_selector_low(const struct
> linear_range *r,
>  int linear_range_get_selector_high(const struct linear_range *r,
>  				   unsigned int val, unsigned int
> *selector,
>  				   bool *found);
> +void linear_range_get_selector_within(const struct linear_range *r,
> +				      unsigned int val, unsigned int
> *selector);
>  int linear_range_get_selector_low_array(const struct linear_range
> *r,
>  					int ranges, unsigned int val,
>  					unsigned int *selector, bool
> *found);
> diff --git a/lib/linear_ranges.c b/lib/linear_ranges.c
> index ced5c15d3f04..a1a7dfa881de 100644
> --- a/lib/linear_ranges.c
> +++ b/lib/linear_ranges.c
> @@ -241,5 +241,36 @@ int linear_range_get_selector_high(const struct
> linear_range *r,
>  }
>  EXPORT_SYMBOL_GPL(linear_range_get_selector_high);
>  
> +/**
> + * linear_range_get_selector_within - return linear range selector
> for value
> + * @r:		pointer to linear range where selector is
> looked from
> + * @val:	value for which the selector is searched
> + * @selector:	address where found selector value is updated
> + *
> + * Return selector for which range value is closest match for given
> + * input value. Value is matching if it is equal or lower than given
> + * value. But return maximum selector if given value is higher than
> + * maximum value.
> + */
> +void linear_range_get_selector_within(const struct linear_range *r,
> +				      unsigned int val, unsigned int
> *selector)

I like the naming! The "within" sounds good to me :)
It slightly bothers my "style eye" to see this not returning a value
(void) - but still returning the value via parameter (selector). It may
be slightly more complicated to read when used.

Please consider for first time reading code like:
unsigned int do_something(const struct linear_range *r, unsigned int
val, int *myvalue)
{
	int ret;

	...

	linear_range_get_selector_within(r, val, myvalue);

	...

	return ret;
}

to reading code like:
unsigned int do_something(const struct linear_range *r, unsigned int
val, int *myvalue)
{
	int ret;

	...

	*myvalue = linear_range_get_selector_within(r, val);

	...

	return ret;
}

For me reading the latter shows better where the myvalue is really set.

OTOH, Your suggestion is consistent with the other functions so I am
not asking for a change if this is Ok with others :) Thanks a lot!

Reviewed-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>

> +{
> +	if (r->min > val) {
> +		*selector = r->min_sel;
> +		return;
> +	}
> +
> +	if (linear_range_get_max_value(r) < val) {
> +		*selector = r->max_sel;
> +		return;
> +	}
> +
> +	if (r->step == 0)
> +		*selector = r->min_sel;
> +	else
> +		*selector = (val - r->min) / r->step + r->min_sel;
> +}
> +EXPORT_SYMBOL_GPL(linear_range_get_selector_within);
> +
>  MODULE_DESCRIPTION("linear-ranges helper");
>  MODULE_LICENSE("GPL");

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
