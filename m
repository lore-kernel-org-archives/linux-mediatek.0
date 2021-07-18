Return-Path: <SRS0=A55m=MK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15C29C636CA
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Jul 2021 09:56:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE60A61183
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Jul 2021 09:56:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE60A61183
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fi.rohmeurope.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:
	In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jSmpRIlXxhM4CgGNmDwcRfcrnOhInTiIjlhYRQcFp9g=; b=aeQUxUvIumeBVK
	z12CpNEUZZzYxHDIHOcuZwpy6DvQL+4wYxwNyzWE8m5tC+3INRTJu7hX8PyCCli/72CIRnxCn+GiO
	8O/JtYi0juwNSSLbh3bKcnoD01yDxKcTPwIgq5XgRyHhUP2VjkjkoVoYaTawHPlW+7jGfdtaJtRpi
	2d/3PaYxePnBlIWa0pu7PKTiq88EB1FKqo+Qasip7Dq0WcIforZhxUnzAgZs9a/mMPATWdzzYY7eR
	baTVUgx/nSmQySgIpUfmt5f3eJz/7SCkku0RswdVgYp+QLX9OACf3ixfqOwkZjq8S1iCUKtX9hbJO
	2r0JnhbXlr4bmr7xqJ9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m53WR-007YRv-OV; Sun, 18 Jul 2021 09:55:43 +0000
Received: from mail-eopbgr50060.outbound.protection.outlook.com ([40.107.5.60]
 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m53WC-007YPz-Dx; Sun, 18 Jul 2021 09:55:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kSK5RIwBw1a850KADFVtxu9VxrIyRDhpr+7AyBcotTnzJhc2jwsK+DYb+zqk3z79nY0n4rOiKQ1v0iKutghMOEXST9chiZSUUwZc32DhSHh6kwrQKqhErIf7nYdGPjlAdXWuczqbo4pLrCQ2xiceS40hT/XBp45uzB/GtfCPUftZMPMAPJWLTzfAEDBJMS6785xvskLC17pnMP8u+HH41RchT88TjewWO5Ccq0W+VIoefgckmpwYcSZAeEEvWIwLVI5u7PXB/EHrAGnEFJj3hUg38JyiWKOIu6MfnfAUyO24GijLnLgZq+LSX/T9ubROKasZrwnLDToEzDQsmZ6YnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kBZwHa7zaQrSbJQgrW2UtJzlg0kybjQwjZ+/7khIf8s=;
 b=isqNZww+B0fEXbpiaJOAERQUtGvCMbRSG/6AwcEOhQpFYQ8mliSZGDqqLLuXYF53OKquX9MDH8MaR/Zr/B4q+simOzlrmoH4mwjE0az5heXbKOBcRDkDrQo2CLMyHdvIgPs2jfPJGbISQycZx9fIOrOsYHPaQb+bqw8/u2SD7QTAxHNHsshCsEbY2NE0JNMi243PikjHO92oIxOazmX2SX+62POf0fRgluBs+1z9ZL3FtQjLPw0Lczq1OmIwQ4NXN6DTg83wxJoC0elpwABg5ExRX9x4ECjaKXDaJ5O5avIzl83jXgo/CWh3rwsVQ7vNV03phRzK1A0ZvZ+eM+vZVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kBZwHa7zaQrSbJQgrW2UtJzlg0kybjQwjZ+/7khIf8s=;
 b=nPsM8DJZF2faI+1bc0WcfFPBoYQsFRfamJCvqQaUN0oWSYGeI4lX2HeJauaw9Au2cOwZ+HbhyAvIyMPEhJuFqkGxXcqOJotI4tA68h91ol9vuO4b3a6SvJA2uT+SDUWdy2MnDEdlbKNt2suQXe3+u8vn9EqTEdd9SflGCBOL8YI=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR0301MB2313.eurprd03.prod.outlook.com (2603:10a6:3:27::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21; Sun, 18 Jul 2021 09:55:22 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::40f1:967f:ee9f:ea90]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::40f1:967f:ee9f:ea90%7]) with mapi id 15.20.4331.031; Sun, 18 Jul 2021
 09:55:22 +0000
From: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To: "gene.chen.richtek@gmail.com" <gene.chen.richtek@gmail.com>,
 "sre@kernel.org" <sre@kernel.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>
CC: "rdunlap@infradead.org" <rdunlap@infradead.org>, "inux-pm@vger.kernel.org"
 <inux-pm@vger.kernel.org>, "benjamin.chao@mediatek.com"
 <benjamin.chao@mediatek.com>, "cy_huang@richtek.com" <cy_huang@richtek.com>,
 "broonie@kernel.org" <broonie@kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "gene_chen@richtek.com"
 <gene_chen@richtek.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "Wilma.Wu@mediatek.com"
 <Wilma.Wu@mediatek.com>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>
Subject: Re: [PATCH v6 1/3] lib: add linear range get selector within
Thread-Topic: [PATCH v6 1/3] lib: add linear range get selector within
Thread-Index: AQHXeicgfZyLQURgy02fHGmRYUcoRatIgcGA
Date: Sun, 18 Jul 2021 09:55:22 +0000
Message-ID: <a6af3a44529141fb931bef33e96b4c66b93d920a.camel@fi.rohmeurope.com>
References: <20210716094353.140536-1-gene.chen.richtek@gmail.com>
 <20210716094353.140536-2-gene.chen.richtek@gmail.com>
In-Reply-To: <20210716094353.140536-2-gene.chen.richtek@gmail.com>
Accept-Language: fi-FI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.34.4 (3.34.4-1.fc31) 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none
 header.from=fi.rohmeurope.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3a1725c6-fb9f-4a6c-83de-08d949d228a9
x-ms-traffictypediagnostic: HE1PR0301MB2313:
x-microsoft-antispam-prvs: <HE1PR0301MB2313EF4C0B77F8F50BD0DF2DADE09@HE1PR0301MB2313.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: r3dLW9gTTZagpukpkYyj2DW/HsPCUNIndGCvRrhGtD4hp4HHPNR9pCPuyMnbtDE0cBga+YKImZbKbq2AshzMiv7EDewvbhd6pVc2T6rjjnziZ/ffa/1+9Goq1+10C9R8LC9T/e0EFsAMyR7GNn9vW3YoT8btIhT/gHA4+Rtt1KBFkC4D7+xW36SqCmm9MDPYBJIc/Oz5OJfOxsttGwGFERhY/QG+x5PCfqGEwFDSpbU34Ex/WGjk3FUHq8FIfHLsHaInNVoxHfhJ0BtviFVbflZC63Ez17pHpYanIzQT9VOCEz4Y8GWxdzDXur65cdku30+k2Ld6rVDQ1IqMhissPyrlHLJRfsgnu4XZD+cDBHCkXFcGZ1z+OkbwTfwyp4Wf5R5qx/64LCGckY8q6yT2Wt0h2+r/9X80JTIe+RSdw6C8VHDqhkbgaXBFmmdikwLdyRAfNY4aUlH5zGMGVVJ9UiRwx7/JxcjB3/I7DPpZ4/CrvLIyo9B8aesq8PAO02uinCaEnErVeJVBYPF2w1yBHQX53lXPTIwoEnwR0shH+7I38Z1luRAk6IYBRkN2RtoMDKqljT946gKmwCPWeg/tE84j4qB8micF8ytuvjfGj9xR9uSg8k2julaymWka89T3i4qB//nbiK2iXE3lm8ZRt2R6jYTxhRL3QhYNpTCnpSUdYMary2QqFPA7qN228zYAu7q4NMiH+vT1+8mO+pgm+Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HE1PR03MB3162.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(39830400003)(376002)(136003)(346002)(4744005)(86362001)(66946007)(66556008)(71200400001)(110136005)(38100700002)(6486002)(66476007)(8936002)(6506007)(64756008)(54906003)(8676002)(3450700001)(7416002)(316002)(66446008)(122000001)(76116006)(2906002)(2616005)(83380400001)(5660300002)(6512007)(186003)(478600001)(4326008)(38070700004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZytadnFxUmhieTNtOXNtL1dkUUFyR3JmWHJuVjlpY3VVeU9zMTZYUHROcVB4?=
 =?utf-8?B?eW5McmRkN0RNc0oyTVoveFp6WXVjd3JBT0ZGaHRkaWpGSENOV1NIS1pTc0xm?=
 =?utf-8?B?VkJJTHFTOGttRHlodlNvUjdKN0luZGk2eitSTzR4d2lnaWNlMTVXTTkvNU5k?=
 =?utf-8?B?eXBsQkp6K3QyWUFrazVEMDNjTStLTFd1OWtrTVFuTEJYNWtpTUdMbDRQVlkv?=
 =?utf-8?B?a2o3WFN4VHhkTnBvdHFla1FZUVIvRFo1S0dZVEd6ZWZsQk13MVVQNlhtOUJU?=
 =?utf-8?B?Z3djaC8ySThpMXNYczY4VlV1dldOenR3M3dycnRnT2xHTTF5Zzk0Zlp3Skow?=
 =?utf-8?B?YXNNakN6Q1BvWStCeWdtT3VEM0g5Mm1QaWpkOG9GOHZzcHByMzMraUxoUEh1?=
 =?utf-8?B?UXdURTdRZkQ5QkxzREhnS2FLM1QyWHlyTTVTaG9rWFB0RDUvV2JLYXlsMjlJ?=
 =?utf-8?B?K2JBS1ZFZDhQVDRrdVlqek1NbHBaNkdiMFhFU1JtK0t3Tm1tQzRtMTdmS1FX?=
 =?utf-8?B?czhpM1ViV1BsS2xZN2ppRmR4RHo1b1UwU0JwK2tqMUxLRUNPMWZRNHkwOWhF?=
 =?utf-8?B?L25hbThub3VTbWlSbnJBcnZSNDl6Y3pveFBlanhHcmxKeXkxZHhnRFdxSEFX?=
 =?utf-8?B?bXE3b2Z0bCtkMmwyMHBHWDZYakhDdUtxczJXYS9PNUxkbjc3SjJqanNFWGVO?=
 =?utf-8?B?eFBLUWNjVGtOcVNWcEptNkM1WkpMNjhKU0VhYStXNTBCT1dlK3JZVEVNSGZM?=
 =?utf-8?B?bUswTXVqbWxUL0x5OUZKSUZOeTF4b2plNUswYzJsc1FrRmp3YkN6VnlnQkhv?=
 =?utf-8?B?M1oySkZ3cHdOR0EzMUx0c0dkbmNlcThEVTY4UC9TWWhwSUduUGRSS0FRUjli?=
 =?utf-8?B?RDY5ZWdkT0pQWTVZN3A3WHdTYTZ0RFVQNzVGMEhya3pRU2oyNTRsdDE1a0ZR?=
 =?utf-8?B?OGJId1RJRkpxVEFxU01lYi93WlpaVjdDd29PYTE1VEYxSzE5akk4MTNFYU1O?=
 =?utf-8?B?VlNGdE9yMlpuN2VJVDd1YWRucEhpTnR3dU83M2Z6RG1Xa29mSjUwT0V1K2pF?=
 =?utf-8?B?VVkzV2NwM25CYjh4YmU1TGZ5NUNuRCszM3hjNzAvRFVtc1oxWXpZdW9nSE1M?=
 =?utf-8?B?RlFmbXY5M1RCNlZzZXVjQS9tWUo4Z3JYZ04xQXJBdGlxbXA4ekdLYmwvOTZI?=
 =?utf-8?B?OXVINkxoT200QzFpbGV6OHlERHpId283SmZjRzg5M3F3T3BZd0syV3hmMzJY?=
 =?utf-8?B?LzFHMUl1RnhpNXhwQWZhU3lSUHIxd0pnUTg4enpmZk9SMS9EZVhlTTVEY0x2?=
 =?utf-8?B?OGlkSUgrRUtEZTQ2dS8xMXRicjM5TnJKQWpKVXdkcmQ2RGxVaGhLL0ZLb0t5?=
 =?utf-8?B?V3BrK1ZjWnlXL1VMMUN5ZndxUVRZemkrdjhhSkhRUmZvckFEZVRQc3ZQeUhq?=
 =?utf-8?B?ek83eVVEOE9YUmEweTkzUFZJOHNsQmw1RUpkM2dGTWY0RmsxV0ZFTHBUQi85?=
 =?utf-8?B?aUFWRUZCOExUMVFhVzhpM29FR1lhQVJCWEovLzNjTk5Rb0Q4VkNkUjBQZ2JN?=
 =?utf-8?B?RkJCVFJNcDN2bmtCQ2haeVJqNHMyVHZSQ0hDa2NHWXpmd2g2OGRPWi8wbEc4?=
 =?utf-8?B?RFlYYmVVTEJlaHRsQ2V0YVFiRW1zeFJoQitreVEweERKVk8xWjkyZitpMi9T?=
 =?utf-8?B?ZGh4ZE9xMEpDbXE5akVzemlmQ2xmR0QxUmpOYTd2SUhsMnY3VU4vM1RrbVdh?=
 =?utf-8?B?L1l0YnhXMlBWcC9zazVodnR1bGJZa0VsZ0VSak1HNG9wcFRjOFRqcVdmcTZn?=
 =?utf-8?B?V0RwTy81dHZrUFdNVzl2Zz09?=
x-ms-exchange-transport-forked: True
Content-ID: <9CB33D0871080D49AACC4F9AECBC9A4F@eurprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a1725c6-fb9f-4a6c-83de-08d949d228a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2021 09:55:22.1684 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k/6QlfgyF8ZVr3WUMHCmA9HqLl0oLDoAQROcRSScTls0CSDhPKJ/wxnxdl5YPvlS1/V3dHIwY4z8P8MEb2OjWH+D/WGmHiTaG+4DNuELT+NWI8/aZYEj1H3TmUkesiLT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0301MB2313
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210718_025528_516172_DD06DB8C 
X-CRM114-Status: UNSURE (   8.72  )
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
Reply-To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On Fri, 2021-07-16 at 17:43 +0800, Gene Chen wrote:
> From: Gene Chen <gene_chen@richtek.com>
> 
> Add linear range get selector within for choose closest selector
> between minimum and maximum selector.
> 
> Signed-off-by: Gene Chen <gene_chen@richtek.com>

I think I had this already reviewed.

Please maintain the reviewed by, acked by etc. tags when sending new
patch versions. (assuming there is no major changes). Eg, add all
relevant tags after your signed-off-by line. This helps reviewers to
see which changes are still pending for a review/ack.

Best Regards
	Matti Vaittinen
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
