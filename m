Return-Path: <SRS0=BCEy=NX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8680AC432BE
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Sep 2021 13:42:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47D9D60234
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Sep 2021 13:42:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 47D9D60234
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vTWbQ3WLsdOs3n00QJNg/2O7LimgbtEHvlsgthUq7pQ=; b=rY05O/4fAa/hGd
	lSG/Nzy8jdinhVKnE0OJL4Ult16a26+btpvEO4ShiV6ie5pkHVu27sS83y+F2D/uaNH9ESOCrp7iH
	G7yLc/UmpAhaDa3UCZcEFUCrVl51MDXUZkE2JaOQVFLKXHhHn+HDzTWb2DRP80yBEjnDIKrGgBa+P
	KXFb5/3kvI/dRcuFx6hczmZ+YU2O5eOQ1GK5Yv+rAcBoif6N1MW9NXHpfgGEJbFFvq5HW54Ai+gbE
	P/ld0Jx6ZjLab1GFKsgrzZhTGyiuoxZCdBVhmaKnJnYbHvNNWG3JPXAQPr3tX4e3uFEgBNn0+W9wc
	ugblr/awla1QpgTxUbcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLQVI-006AEY-20; Wed, 01 Sep 2021 13:42:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLQVC-006ACE-3i; Wed, 01 Sep 2021 13:42:10 +0000
X-UUID: a2797232e0014794bdbd659954d2cebb-20210901
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=xnm4+RIee6nDCPiHhaRep4kZgXRYPgUrLaqbm00MQt4=; 
 b=niVvtx8P3CV4hp/Xov7fVp4sYaVZIw6MprjCiYlNdJ67ySBRku7Fh8gNZe+Lnb3EAa5ZMr2BGAEu52l7CpZhOvKDt6BzloDz8qV6GQ1rohUbwz4kHz2r9FkOCx+iemycpLKqoOWdWeEqjqXRqLA6EopKcNeX1XGszNfH9HVNJGU=;
X-UUID: a2797232e0014794bdbd659954d2cebb-20210901
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1424052584; Wed, 01 Sep 2021 06:42:01 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 1 Sep 2021 06:40:01 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 1 Sep 2021 21:40:00 +0800
Received: from APC01-PU1-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.792.3 via Frontend Transport; Wed, 1 Sep 2021 21:39:59 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bK15a/3/3nFWpC4hIH7aPF1hxuPDs6GPP29DDJK50BzvezeIjOzQyjQsfsekOU8YTiMtpf2lyyX781VmyR5/ExEkfecfhLhCPg//ThYm7QCoqpJkZWIIvTxj7ObX6+URGFWudBhb+N+6I5eqdMEOpC9V5zVEvcLoyCUK07wDaxpy3WfxEaL0XcwwBssfNxxBOSCG2C6qeJ8zrDJlLDMdAdlBbuWj5ZHKE8g8+ZuPuBTiOznnO5PXZ9g3aSYlpK32IOwdNYTWu6Ag1RYxTc2ysokLauuerlp4v4vFYXC13HC9mL/DxDcnud4XiKNwCHaBAFPrXyCGCF7CE0h66WO32Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=xnm4+RIee6nDCPiHhaRep4kZgXRYPgUrLaqbm00MQt4=;
 b=AKrQgeOKs8/aML1E2FBZiaEXRhOywQCtQqcEULnY8wsT2wuT4HC0DvzGF2bWckEFnQ0oFtKiRRIqrbNY4wS0d4mUIrUUkCwYScaqoQw0j0hdqX+JdzBTCX+yosj8v5USV46G1SoK6+Ejpm6di/Kn5k7yV99vo/m4wvclGkDLgKVB3H5OdlkB75J1UlA74oVpirE00gUgBcaVTPski4uzEUskyoddv54upNoyK9V6orUcSlBcqhtAGFn9V96HcKJrXGbFDGkeMQzdzZ28LMqj6qp9LUGRdYemPmDjPu+flEgVVZSSeiFjJolBK0GjP9PHzIqzR17TgGGpgZ7UZh2CTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xnm4+RIee6nDCPiHhaRep4kZgXRYPgUrLaqbm00MQt4=;
 b=EXxiD29j0QYpbkL9+A3vVM4GM1Mh67tn36BIiy3zEwZSp3ZLWbw+Q471HJyYn++k+DJM10MfSSv5q+g/DGxpGsrmc8Fr4IvhE0kJLpX2jX3zgVO5kHABXtcI80JkWXTriU0KdNFfLebdmQvojcomnKh+9RX/n7n8AjuXi4pterQ=
Received: from HK0PR03MB3139.apcprd03.prod.outlook.com (2603:1096:203:4b::11)
 by HK2PR03MB4403.apcprd03.prod.outlook.com (2603:1096:202:21::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.16; Wed, 1 Sep
 2021 12:01:36 +0000
Received: from HK0PR03MB3139.apcprd03.prod.outlook.com
 ([fe80::6595:af4e:bda9:801e]) by HK0PR03MB3139.apcprd03.prod.outlook.com
 ([fe80::6595:af4e:bda9:801e%6]) with mapi id 15.20.4478.019; Wed, 1 Sep 2021
 12:01:36 +0000
From: =?utf-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>
To: "hsinyi@chromium.org" <hsinyi@chromium.org>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "tfiga@chromium.org"
 <tfiga@chromium.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, =?utf-8?B?WW91bGluIFBlaSAo6KO05Y+L5p6XKQ==?=
 <youlin.pei@mediatek.com>, "drinkcat@chromium.org" <drinkcat@chromium.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "evgreen@chromium.org" <evgreen@chromium.org>,
 =?utf-8?B?QW5hbiBTdW4gKOWtmeWuieWuiSk=?= <Anan.Sun@mediatek.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>, "joro@8bytes.org"
 <joro@8bytes.org>, "iommu@lists.linux-foundation.org"
 <iommu@lists.linux-foundation.org>, srv_heupstream
 <srv_heupstream@mediatek.com>, "tfiga@google.com" <tfiga@google.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, =?utf-8?B?Q2hhbyBIYW8gKOmDnei2hSk=?=
 <Chao.Hao@mediatek.com>, "krzysztof.kozlowski@canonical.com"
 <krzysztof.kozlowski@canonical.com>, "will@kernel.org" <will@kernel.org>
Subject: Re: [PATCH v2 16/29] iommu/mediatek: Adjust device link when it is
 sub-common
Thread-Topic: [PATCH v2 16/29] iommu/mediatek: Adjust device link when it is
 sub-common
Thread-Index: AQHXkBCYbO6e8lmd0kinqTzjFutBSquCVPuAgAzdGQA=
Date: Wed, 1 Sep 2021 12:01:36 +0000
Message-ID: <5e8f943884efbc00b839d33be5420bb8cd7a239a.camel@mediatek.com>
References: <20210813065324.29220-1-yong.wu@mediatek.com>
 <20210813065324.29220-17-yong.wu@mediatek.com>
 <CAJMQK-ir-wLy4OHkWEWZf=CZcURMhRvHnOjBLWXaezhukJh2JA@mail.gmail.com>
In-Reply-To: <CAJMQK-ir-wLy4OHkWEWZf=CZcURMhRvHnOjBLWXaezhukJh2JA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 059d757e-5523-454f-5a04-08d96d403ff0
x-ms-traffictypediagnostic: HK2PR03MB4403:
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK2PR03MB44032ED105ED5B1A7A7DAFA998CD9@HK2PR03MB4403.apcprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6FsbGWur1ZWk4fqQGBScJNFKYybFVN3ONXlAB1O5Yjk4GDMfFMniV2tv3wL4PL+kBUTnrdVkt74IeGhix36JldhGsG76/S7lct+fB2LCYuK/GVg61/364p9W2wQP0NOURRhgICxXtZ0LfFr+uULmpSYB2KERBUe5+bdXacD41t7HudOG5P+BciB/mi1FFmDbe0AwlcEK6pJ6EJ1IZ7NsZVKKhUJ79fzFq9CkFCXV/A01fhgGzlPnQSUwaIZi6Ni0ddg3zxtXk00oeMB4MpR5WTnNNpT9hx5WTGEOxcdkp0mlZmjA7lYq11Iq/2taMcsEnIxgHa+I24xXA05WD+ve6hkiUTD3LruHIWSOGWceq9f6VEgv5pbz16aq/pWY46tPtxqAbLbRWAS6GKPIX0sOgVLd7b/UxXakUt9xdhaAgZGch4Ipfm01tq56J/XzzA7BJH7tnNPGnmJCrgqJv2sSqiHhtvVoAb0Rj1bEQ7HwRRDsl+HRfqKyia+4w3NbQYjA+yDcXgmcZLKJAlyvuZs034d0yaXGmfi8Ehxqc/A10cYSNItuAJoQ3yXQdE9OcJhMKSfCHhcyWOPGA90UXiEp3WqkybNvrjExnN2fw2dzIfe3OCQrTCWIyrymSox8kOzJsmPBu6lM9Qn1gFmj0AV6Tc3JusFjWjixkK7v0E250AEeQ+nuaRzkq2EZ0NhiycXLat7bGsDEAAq15dKg+JFwRmltMntge/DW40osjzFNGpvHDiX7yHnSrmmUx9GS/V842l16AvApxh3V6GuASU6a/Hv/tVuj1Mk9Q3W0jTyri8UYC4ybJ5y/t3OpEUBhTOju
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR03MB3139.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(39840400004)(136003)(346002)(396003)(316002)(83380400001)(6916009)(4326008)(6486002)(54906003)(5660300002)(66556008)(66476007)(64756008)(66446008)(26005)(122000001)(38070700005)(85182001)(66946007)(38100700002)(186003)(2616005)(36756003)(86362001)(7416002)(966005)(53546011)(478600001)(71200400001)(8936002)(2906002)(76116006)(6506007)(91956017)(8676002)(6512007)(99106002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Ky83OHRLYmpyN3Y2YTZ5LzN4bHVIbjF3bUdkT2hvMzR1OC9iUHZqaFpLeDZl?=
 =?utf-8?B?RXM2dEtKdk1qUWRlNXpaZ3MyMmZEeWJJN3hDWDdXMk54NzdDRDhWTURxdUhR?=
 =?utf-8?B?RXkvMGFaaG94cG04QWpxUGEyTTVXU3M2OHlJL013YkloWnhVM3I3QTFZTXpk?=
 =?utf-8?B?THNXR0V0eXd3cjZjS3pCVkxJSGlpVkNiVkhZNmZWa29HMDVmVTBmanJ2V2l6?=
 =?utf-8?B?RDdMZHZhbXFxc0IremdjS3dCRDU1L3pQT1ozR3NFZkVDUzh1WlJtKzZwa1pj?=
 =?utf-8?B?QVkwMkdUd0Jvb21JbVRPY2dmeW9EdVRiODRUNkdLL0w1V3UyZ3czMVBCanlT?=
 =?utf-8?B?MStqSjQ0bHlTUjQ4RFd3clk5ejlReHFXd001QUVxd3hMS1V6aXBWT2hZK1pu?=
 =?utf-8?B?MVlqR1dzejkzNW92YXJxY2dmTkpORkN4SnpRRGJOZVFkU3ZiSXhUYythbXFY?=
 =?utf-8?B?akRLN011N1hhQk96OFcvTCtvanY2aHdZcTZXRTJPSVhvODFvZlFRQXpQZ2Fo?=
 =?utf-8?B?SUpUKzB3SFY5Q25nczNSSFNwaEdKQVBNVEFjOXZxa0xaRXRmZlM1WnMycGlz?=
 =?utf-8?B?TkZ2UkZBYklkSlMxNW4zZm9tOVBzeExrRm5UcndPUk9Jb1VDTmZ2NzB0eU8w?=
 =?utf-8?B?d3FUSmw0R2J1dGNsRmZMTXp3YmRTOG1TenhDUW1wVlV1MWkxU09YS3VvcUpH?=
 =?utf-8?B?UEtOcUk0eWNleFVwSUtoS2xjS2d2alFINU53YWdiZ0FYN3p1OHNFMytiQlF3?=
 =?utf-8?B?RVhkaUpSN3Rvd2l3NmtLbkpKbmZLNDNnbTd1YnQrVjh5eXZyTTc4aDNPekRq?=
 =?utf-8?B?T1BZRzQzdDd6dzMxb1QvRDljSEsvQmNxZW9Sa3ZxT1B5OFpYem13N0dLdjkv?=
 =?utf-8?B?QmFVamtyUk14bDFZMDA1cVZ4QWhrMlA1N3V2VlpiNm55ZmtMRWFDQmYwMFFO?=
 =?utf-8?B?NFhDM0V6NFVCTmtBdUN3SW9mN2JXVXg4Y2dERmNDQk5SekZMYkhOcDhFem94?=
 =?utf-8?B?NjRWZzkvRFl3ZDhEcjNqQXd1MlFHUmNBRHVFN1ErMWlqSmF6VlR0VFMzNmE1?=
 =?utf-8?B?enN0UTZmU1ZMdDZvbDdRMW50d01CZGZ0VTBXZSt2RTFFRFZpT0lnK3Jjb1Zp?=
 =?utf-8?B?SHlNbXkrSnZXN09lUGVSQ3JyYWMrSXcwbGd1UUFqY0s4b0o3VU9pUUZhbzJD?=
 =?utf-8?B?SnVjVmdKcE9JTkZPM3d0MEdmRjZwVDVIREhtTXZra0lyN3lncGJXb2tOS1lQ?=
 =?utf-8?B?R1RnVnZpNTUxQjhNVkRYQm9NblZwL3M4cjBJdUdGZ2FBUlNuaWdoaHdEcXIv?=
 =?utf-8?B?THdWdURRR1hQTmdUMnlCZTFENTRwRnlxem1Jb1BQT3lCSE4vbkdwbkU2NFhK?=
 =?utf-8?B?TmJ3QzNLdzFJdzhlQnk0b2VWa1lPVGdHQUtIWE1RdEdBSlF5TXVxcmtBRWda?=
 =?utf-8?B?N2NSdlJGSDBtZDhIWFdvalk2cGpNYm1iS2lsRG5kNVB4aGlTd3hQMlFPVTBB?=
 =?utf-8?B?SGZoSVlReUVzbTZBZFFOZkc2dzJJeGM0T3hBeXBuZzk0M2xLOTJkT3lBZ3NK?=
 =?utf-8?B?cWRoZ3RjbTVDZkxJMDZhdW5xU0lSRmgxa2dQSVE0a000WC9sTG5yVzZCalVz?=
 =?utf-8?B?SDQzRUo3VHJ6c1ZZa2JjM1dtaHE4NEpmZWJnUk95S2FOeUYraE1yZXcyTGtq?=
 =?utf-8?B?ZjNJQ2xNSG1GWndIeFViNEZ1dGVZcmRDWjZtRjYrYkhncStnWEpKK1Rnd21L?=
 =?utf-8?Q?WFDy+Pp8omIcO6k1yVASXYLmx2tQ/io0raf1Kpa?=
Content-ID: <4A1762D6C555A64E8F0701808953DCDD@apcprd03.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR03MB3139.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 059d757e-5523-454f-5a04-08d96d403ff0
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2021 12:01:36.5188 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jl+nF8qILE3xXmXeBXQf5li6E9L8oKhAIrUQXVMHLLDDRYXQZAHjG8IVJ3tSuylv9WDg6BWiL4OT/pxdfgPtyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR03MB4403
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210901_064206_206420_88C98A3A 
X-CRM114-Status: GOOD (  27.36  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2021-08-24 at 15:35 +0800, Hsin-Yi Wang wrote:
> On Fri, Aug 13, 2021 at 3:03 PM Yong Wu <yong.wu@mediatek.com> wrote:
> > 
> > For MM IOMMU, We always add device link between smi-common and
> > IOMMU HW.
> > In mt8195, we add smi-sub-common. Thus, if the node is sub-common,
> > we still
> > need find again to get smi-common, then do device link.
> > 
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > ---
> >  drivers/iommu/mtk_iommu.c | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> > 
> > diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> > index a4479916ad33..a72241724adb 100644
> > --- a/drivers/iommu/mtk_iommu.c
> > +++ b/drivers/iommu/mtk_iommu.c
> > @@ -845,6 +845,17 @@ static int mtk_iommu_mm_dts_parse(struct
> > device *dev,
> >         if (!smicomm_node)
> >                 return -EINVAL;
> > 
> > +       /* Find smi-common again if this is smi-sub-common */
> > +       if (of_property_read_bool(smicomm_node,
> > "mediatek,smi_sub_common")) {
> > +               of_node_put(smicomm_node); /* put the sub common */
> > +
> > +               smicomm_node = of_parse_phandle(smicomm_node,
> > "mediatek,smi", 0);
> 
> This only checks 1 level here, and does not check if the mediatek,smi
> of a sub-common node is not another sub-common node.
> So maybe add a check that the updated node here doesn't have
> mediatek,smi_sub_common property.

Yes. Currently there are only 2 levels. we could confirm if it is sub-
common from if it has "mediatek,smi", then "mediatek,smi_sub_common" is
unnecessary.

Will fix in the next version.

> 
> > +               if (!smicomm_node) {
> > +                       dev_err(dev, "sub-comm has no common.\n");
> > +                       return -EINVAL;
> > +               }
> > +       }
> > +
> >         plarbdev = of_find_device_by_node(smicomm_node);
> >         of_node_put(smicomm_node);
> >         data->smicomm_dev = &plarbdev->dev;
> > --
> > 2.18.0
> > _______________________________________________
> > Linux-mediatek mailing list
> > Linux-mediatek@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-mediatek
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
