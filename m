Return-Path: <SRS0=bg5C=NW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2C09C432BE
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Aug 2021 06:16:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92BF161027
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Aug 2021 06:16:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 92BF161027
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9nn+EmfSueiJrMRmZEDCoadf3Vc7Q8VAgU3Z3o/iX9g=; b=vxybjkyQfdpgXh
	H/iohMcZ7jq3piHsR71ofA7zii9evJoP+HW3vdV1/2xNewxYnu/xADfHtTayFJV4R20p4sRPWdTi0
	Auzgn8krQJ8c32VHinpDqZX8rvxVyAgfaxKmWQc+HTlK+VHMLB4mLO+XGozJ8G6NnmNDXFW6WYrGR
	vduF/RTF4rlSxdOGF6d6e2LEQ6rFRUCOxwyNu0Z0pLaQH3npy5TaiiaOI96ek0JPqSXzAUEeVaDZ2
	Dh3jLIMDHDKF0ZYhrMT4El2RZMOdk21X82hY+ZPlaMfU7eHnZs+3kbAnYMZQoUk4G2KmnIzt7eVMe
	OAofubIlSAzPD4Gl1T7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mKx4J-001Qm1-NN; Tue, 31 Aug 2021 06:16:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mKx43-001QkU-3D; Tue, 31 Aug 2021 06:16:10 +0000
X-UUID: 2d09e1d2e20d427881f60301948ed653-20210830
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=Z4DQQ8aluK/JXRzxJzVi8/e5c234EJ1peA41JjTHwp8=; 
 b=PsUcOjazVwrCGTGZd5lVbTi5d6Rll/C9uzKOrh84O4dWa9b6K7JMlwRg+lZWFKp+ABFOKw5H+zpwSOJVTvmDRm6Mmx8J1RMyy7JdJI6g3Q1xfyUK8thowHudSAHLFwBXhu4UPukbnbbgyZ1bOBHu43PTQJK8V3KQ/MXP65yR3Y8=;
X-UUID: 2d09e1d2e20d427881f60301948ed653-20210830
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1321172590; Mon, 30 Aug 2021 23:16:03 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 30 Aug 2021 23:16:01 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkcas07.mediatek.inc (172.21.101.84) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 31 Aug 2021 14:16:00 +0800
Received: from APC01-HK2-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.792.3 via Frontend Transport; Tue, 31 Aug 2021 14:15:59 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IrvIUm0p9fnGRwP+3VL8qjUk2EMa3/mYEXRVMvBJUUVm4LVgVmriFJkn6LqTUVQy/8SB9Rb+mhLRqS1KeUPu4W4A+BB0mOwRpMhaI261p2Jlq8f/lU3bW5+O1aUY1kn4/KGs7FBfJEv4LihhFsjjKNBitrcG1/116lwfZmYNnwvvUuLUObagPMckBWcmTiKdfVhYEAucbkwAqkkzYhlwJrx/N7i8uRrQ0KOOsIORvFLFfYZFVtizWabi1sYvMmTxwRIyW5qZKZ9gDLv8RN9qgZ574QonwbRwDPbqW5oCGLNE4TwfC3YODhZrnPaBpaiktmpz8B8daHFRuntOqe5yKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=Z4DQQ8aluK/JXRzxJzVi8/e5c234EJ1peA41JjTHwp8=;
 b=Q+9BtMv4WPc1jzxPXavyW5QLMNuX4u9GhONHe61+gkbctkAo1F4mkvVnTA7iF3oFPfVkYcWuDx/qsd5vrAHzI+q0KwouWF7mNr8cjCYV1Rdssx/3TOrTRdG6ZCIkdxo7iFEeu867Ff8PO1qR4eRy9vLjva/X7VBFEtMYMatNDa1dcLeII1keFcPjO1bsoKqEXHygUgBKbTU/8BS21yXhgdQM+6dmqkUGRZOp9iJGSfW/IsemPgwCSbuUxbqGS/QztCG5ntRM9/63SrgmS4y2DKmIBhSHDc7zuIPgq4lP1ZM9tViR5R9AvLXPuEf5LaL1Isn2/O0GRjYohdYm2FNvdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z4DQQ8aluK/JXRzxJzVi8/e5c234EJ1peA41JjTHwp8=;
 b=Zo34dcJ8ML5uZogZt9nat9S8/iF49RHB3i+9sQ+Kat+YugnHd6QmMeK4/Auyh0+85kNO7vS26JsUDlGDPGPHiIAfnMX2fAhGTOrzDOEuHmCJzenIVMKEjChgo14S9hJSFhCkHjAI7NizIzNq04jb8uTLdAmKs+PhnPTLA07by4Y=
Received: from KL1PR03MB5062.apcprd03.prod.outlook.com (2603:1096:820:1a::22)
 by KL1PR0302MB5364.apcprd03.prod.outlook.com (2603:1096:820:45::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.14; Tue, 31 Aug
 2021 06:15:45 +0000
Received: from KL1PR03MB5062.apcprd03.prod.outlook.com
 ([fe80::1898:f611:33ba:b58c]) by KL1PR03MB5062.apcprd03.prod.outlook.com
 ([fe80::1898:f611:33ba:b58c%7]) with mapi id 15.20.4457.017; Tue, 31 Aug 2021
 06:15:45 +0000
From: =?utf-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= <Chunfeng.Yun@mediatek.com>
To: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
 "mans0n@gorani.run" <mans0n@gorani.run>
CC: "b-liu@ti.com" <b-liu@ti.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "frank-w@public-files.de" <frank-w@public-files.de>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "gregkh@linuxfoundation.org"
 <gregkh@linuxfoundation.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>
Subject: Re: [PATCH v4 2/2] usb: musb: mediatek: Expose role-switch control to
 userspace
Thread-Topic: [PATCH v4 2/2] usb: musb: mediatek: Expose role-switch control
 to userspace
Thread-Index: AQHXnbiFn3h5nfJnYE6UmzRfVxaR/6uNI9CA
Date: Tue, 31 Aug 2021 06:15:45 +0000
Message-ID: <654526ce5dcbfb2b92e4e888c8e24dd72eb478d1.camel@mediatek.com>
References: <20210822041333.5264-1-mans0n@gorani.run>
 <20210830155903.13907-1-mans0n@gorani.run>
 <20210830155903.13907-3-mans0n@gorani.run>
In-Reply-To: <20210830155903.13907-3-mans0n@gorani.run>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e2f24f9f-51c2-416c-4f7b-08d96c46c4f5
x-ms-traffictypediagnostic: KL1PR0302MB5364:
x-microsoft-antispam-prvs: <KL1PR0302MB536484ECF46CCBFA0089A93FFDCC9@KL1PR0302MB5364.apcprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:873;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7AWj5/HTXYo8Mn5PcFXTcRFdj6DIHTt+7gj0g5eRjuzMpcMAzjDNmgXQGx6z4MWKXb48xdO1/V7GETVaMScfbN1GeVNzSpGxJCOoQgaFq8JZTgrKv7MsQBsxk9TQiYIgUS1KrQQa3WFHYCjUFjAy8zz+io8GA/w9goHwhxeDLcMEVHYlmieJKgFs5VW6zCSCp5QHegt45H+Q1QW+E/sTPSYbhDCI+uqTpu4AHqoA1vNY2xLVvRgXSNDkFMsTWJm3wXcLNryNmKrK1ZlqYYt0ku2+zXijOYdeIEDc+yaJGm6NvIitMMuBwe7zbJgsMKHjyMZXvNG/I4eIJBGPmL70lmEIU7XOaOhusvv7a3b13sDU+h902xBOI/Jym4RJ6KvkQUdX8sqv9/GyCx2UZk1RGzjaOyNe4m0h6YffQOpcjmtk6aGwfq/bYJYR2CPLLAWOpvFIjXdrvoLC7G2aQpcJ6YOG9tTtSB106CfPkxPvuvDqSLIQ65kuJs5AhFmlwmvX85Q5Sykg4Z2eDCPzyZfvurcf32cHWgtLAJuTA6BDLm+atNXrI6/nVJOGcDnV52eStItetIFjgcgNBywbvHhuYhYNdm7ot94rA5sobSZvnNMEEimXLAbWp8/ybpgKAqUIg/E7kSYZMXLatroC7+QeT4/p4DpywCCUJRaDbJysYJPZnbdv0rJTEbrfPL8DmORHVxPPhU/z5OGFw9XDdtkeSOsfuvTGh95W3s9ijZej4A4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR03MB5062.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38100700002)(38070700005)(66946007)(86362001)(122000001)(66476007)(110136005)(54906003)(66446008)(4326008)(76116006)(66556008)(2906002)(316002)(91956017)(6486002)(6512007)(5660300002)(64756008)(508600001)(26005)(8676002)(2616005)(71200400001)(186003)(4744005)(6506007)(7416002)(85182001)(36756003)(8936002)(99106002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cHdSdHhHQXFyWlc4Wmt4U1Z4NFIwQTlac1daMWtLbkdHb1VSUFVNVDVZbzdk?=
 =?utf-8?B?Qy81YXRqdlpqdURyUTVtTnV5STZLQzlNUWdOT1JtTU5IQmFFTCtraWg2eUoz?=
 =?utf-8?B?U3VtR1NHdDlDZU1uRVJFcHRaRTA3QStRMEVLLzhrWEZyR3ZDNUpleU12R2p4?=
 =?utf-8?B?eDNxN2QzWU9QbnJCS0pNU2xsdVBnUi9waDZoYUVjelFIaFRCZE1GbjRqU1hJ?=
 =?utf-8?B?QndJNWlNTVlFb3VhL1RRTjY0ZGxvdTgyUE1kNzc4TFVjdElCTWhtY1pIRDhr?=
 =?utf-8?B?NWdURzZKU2tRRGFUYTlodEhIakhJS1NxMW9wRHc2OVBMVHRPNytZVnE1d1dG?=
 =?utf-8?B?MWRzdE9qZzlzUlhaem5OYWpHYjlydjNDMklYZ0dON3IwaFg2eWI0c1dVQTZ4?=
 =?utf-8?B?MGdyMnl1Zm9TSGN2Y29HNXk0VHlJUnIyRnA0ekY0RERiNnVuaVNCSDdvRElr?=
 =?utf-8?B?R3dQbXlxOUpXTDNMS2ZxaU9tYld6ZktvQzVEbnVHemRTVWdPWEdueWUzOTZV?=
 =?utf-8?B?MGh6OHNhQlJqVnpFRTVsdStTVEV3WldiZTducjByR05Eb2FyMmxXQkl5NGI0?=
 =?utf-8?B?b3VhNjIvNUg3dGJ6RVF0aEZ6VXl4RlgrcGF3NXR6ZGZkYmppV2U4TTBDTHVX?=
 =?utf-8?B?ZUhObFFTWmdmTW9mRFA1Q0JZNlExMVYwOVdlbTZ6cDBsdmVqQ3RITDV1ZHRV?=
 =?utf-8?B?cVZGdFpkNGZrNTB4b3VXdFVKN2xQSm5yUDBsOHN3Y3hoTzZER3lXa2RWTlZM?=
 =?utf-8?B?YzB4RW0rSEJmbmFuYVlTTit2Z3kyc3RTdHF1TDFyOVBUR3ZUZmkySnFxRmN2?=
 =?utf-8?B?bW1CWllCZ1pwWXBrVVZWK0pVVTFMbTgzak9QQ3ZCb2tsWDNPaExnYUZjajN5?=
 =?utf-8?B?b3VSL1ZaR3hldkVWL0FTQjE0UUtpVEpNNURzTTk2VmpYck5RdFI2aE5WdUdr?=
 =?utf-8?B?UkxlYnZyRUpVbkJ6MDQ2S2ZLK2VyN3VxY2FFb1dMOVNxM3FVUTFyN0lYVW1H?=
 =?utf-8?B?L1VIOGpMRTB0eW15Y0dFakdaZDB1WVgxSXhMcWgyaFZQdHIycUFES3lneWgv?=
 =?utf-8?B?MjYyY1RHNmd2UndmaEtLeDdNT0FRTU1LTEpxWDcvcmF2NmZ4UHFsSXA2QUk4?=
 =?utf-8?B?Z21hOWsvVVlQRG84dldNNzR0U016SkZaYms3NDhTcE4rMXJCNnA3bWgxQnRI?=
 =?utf-8?B?UlYwUkVMdmsya2pobTRGaUc1MUVIRVUwTVZyOHdGS1NOektOQ1B0a3hpbUV2?=
 =?utf-8?B?UzJnRytoMTJtbC9wdy9MR2NlZ2R4bVhPaVhkNXZlTm1nWXYzUXRaeFZWSFM3?=
 =?utf-8?B?TndreFc3QkhqVVVpMTV0aVZ5c3BtcXByUWs4VWExQTZZOFhmYTNSN3Bycjdw?=
 =?utf-8?B?TGlSc1RPeTNOdVBiYzRYVVppUmVrQlk4WER5Z2xuenN4d0gyVTVvWVhxUVcw?=
 =?utf-8?B?bDNhbVZNZGVWSmp4bUVicFI1d1ZvRlNDUHNVWUdnNWZML1BvN3ZUb3pYVmw3?=
 =?utf-8?B?WFVLb2lkbWk2b1F3M2pRc1N1TTFPS2ZrT1I5NlMzRDBlbDhEakNQTXk5T2c2?=
 =?utf-8?B?T21ZRWUzanVPZFE2STc0Q1F0TVlsN0pROWdUN3R1NWJ2OVJDNGE3eSt5VStO?=
 =?utf-8?B?Tmk0VnZlZnNJS0Fkc3VYckJ0eEJmVnd0MWhIUTFSTHZJamhOd0ZHZ2JNSW03?=
 =?utf-8?B?cEtuOTFCYSsrcGhEM05XdUluR25kcTk4S3dNNXg0YkxmN1dGblhCR241b2N1?=
 =?utf-8?Q?5ahJbhOHFvGvjVhqZpQ2t6AG08zIN/h6Iv8yOac?=
x-ms-exchange-transport-forked: True
Content-ID: <1395A4E7D8D74E4F8F32A6C399FCBE3D@apcprd03.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5062.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2f24f9f-51c2-416c-4f7b-08d96c46c4f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2021 06:15:45.6398 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nfavlTvcK7zbvxRdvK465UH0WhM0o1BRZ+1HxHrKSX0Y5hfYuJCYqo6ayLKkGpVzWiVqtqi527h5IXcBj6dVuujK68U9C9H2LiXkaShgvKY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0302MB5364
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210830_231607_254792_753BAD18 
X-CRM114-Status: GOOD (  14.88  )
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

On Tue, 2021-08-31 at 00:59 +0900, Sungbo Eo wrote:
> The allow_userspace_control flag enables manual role-switch from
> userspace.
> Turn this feature on like several other USB DRD controller drivers.
> 
> Signed-off-by: Sungbo Eo <mans0n@gorani.run>
> Tested-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>  drivers/usb/musb/mediatek.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/musb/mediatek.c
> b/drivers/usb/musb/mediatek.c
> index 6b92d037d8fc..f5d97eb84cb5 100644
> --- a/drivers/usb/musb/mediatek.c
> +++ b/drivers/usb/musb/mediatek.c
> @@ -185,6 +185,7 @@ static int mtk_otg_switch_init(struct mtk_glue
> *glue)
>  
>  	role_sx_desc.set = musb_usb_role_sx_set;
>  	role_sx_desc.get = musb_usb_role_sx_get;
> +	role_sx_desc.allow_userspace_control = true;
>  	role_sx_desc.fwnode = dev_fwnode(glue->dev);
>  	role_sx_desc.driver_data = glue;
>  	glue->role_sw = usb_role_switch_register(glue->dev,
> &role_sx_desc);

Acked-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Thanks
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
