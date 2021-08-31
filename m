Return-Path: <SRS0=bg5C=NW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3A9CC432BE
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Aug 2021 10:46:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 792EA60F12
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Aug 2021 10:46:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 792EA60F12
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ncxa21ZDKCGlkQ/BcveAXgAufR0RX0tya8pxAAKWdco=; b=AhB5f3jc64XsTf
	s4qvNeA8I6h69V4qPm4VTGLSO45asCmZPSRUkSbB1icLHXQLY669aalYWlLRts2vn8z3bHFOAZt3j
	wrBdFEn289GwVm4b2QNL+J/tNIdDtZpEhYERuIpJL4NGwXaQMmI2SBrs9BZm+gfx2qzxEWWU3WAOe
	yLLoMphTCNolQipdBw2Dd5NxaHzC+dnFPNwUEWgnX6m2nXiswgY5Yz8G8vqBC1rmy9LgCxJ9hVbFN
	2XUAdjUxa8R6MFJkpYenOUQKXnbRViJghMV1z4pU0+NV/FDImKTfWHiZfdr7X7LjaAKHjHcSUvqEb
	zP2nIqsT5nhxxJvGIgeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mL1Gz-00252Y-HC; Tue, 31 Aug 2021 10:45:45 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mL1Gf-0024xw-Dh; Tue, 31 Aug 2021 10:45:29 +0000
X-UUID: 4e6f41742bd74add8fcd21392ae7eedc-20210831
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=phNHXum76mAZ4qYmxK28Mp4u++IBnPR+ThnSGtip/xI=; 
 b=bHJc8wjrQQX01lRkhQulo48BOhlYo5XR3yWHpBGr+kfHPvSuCGwCKWxqIjPjvLvb+SAzvF7lYeM7mtREPnTEGBbKuI2BM6J5L4wR0Jf9O6xNrAje4DzsM+6iJkpuDr2N3sVyK2LQTT0M2SDqp04UvVqWaE4/XU+2oJJqSbi/iOU=;
X-UUID: 4e6f41742bd74add8fcd21392ae7eedc-20210831
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 156776540; Tue, 31 Aug 2021 03:45:18 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 31 Aug 2021 03:45:16 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 31 Aug 2021 18:45:15 +0800
Received: from APC01-PU1-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.792.15 via Frontend Transport; Tue, 31 Aug 2021 18:45:15 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EMAXYF/BcmTfpToo49CxrBo96Txabtqqt8ttcUwy3PTjJnc5WbzrNaAJoEffnMKOKwxO30BeQi/UJ1mb9xfY3V4PEIQyG2eBtUKbLybc4IEwskgPRABCSWJ4BCe5WsDamRTrK6egqn3YYs2BucDzL76oeB7p1BH57dvXm9eY0NWGUNhK2Mwwu6xocqYnCQk/cdIOEUTc1Bdal+0INakYmy65RDqPq3dgRkMD+ArC0Hz8O9Xa+qSyOzg5OVg4YNtTxVV525mq1yZ03RT99jTEdBVChmNBR4lj4TQLGg2v7GDbBDxqw4pmFNQZjBYxJ3Ofv0X4vm5g9luwsji2OoEYCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=phNHXum76mAZ4qYmxK28Mp4u++IBnPR+ThnSGtip/xI=;
 b=MD9SkBwLv/1MiaOq/HmZc8536g+BdmFwIuzH6TLicovUHVvJWPL5PISgKyBIWIqoTOtQm43H++qqauNFbRLpGTd01PYFxOS4HDhyDCnL9vBSwTOn3ESxVl5PSOj0c4fFZ4KQE6Y8BteFp7zfxeNfBLEMesm9KuXkbvbfVQo0Z/LXmqSkv3MrkNXkf/EpXT9F3yq1bPp14rTE7vqcHe4Cqu9UMNy476PGmo+NHv+JR4GrpNDCHa3dmINS8GLBvSconAzQoFPM4UoM1mWGJsf8a/f79Bu6BBO7QJhoeqib95cCHKEk6gpeuMnReoCfa4FQI2wvurZiJi9wdObWoJkyug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=phNHXum76mAZ4qYmxK28Mp4u++IBnPR+ThnSGtip/xI=;
 b=icrP/PO7FK+gGiQmcKbZpWaFHOnOD4OTf5TurY5udFhoMpatC7dQwicfIlg8i/dKl9Ca0VCbs1fZg2bsYEh/n0cIcnthgdBHO/H5HTRaLOYATZn4h57FagGF9v0vF3CrU1f9PbN82x2rQybjuha6MmcxQuJ6NY5pEVWW2iBboDY=
Received: from HK0PR03MB3139.apcprd03.prod.outlook.com (2603:1096:203:4b::11)
 by HK2PR0302MB2499.apcprd03.prod.outlook.com (2603:1096:202:3::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.16; Tue, 31 Aug
 2021 10:45:03 +0000
Received: from HK0PR03MB3139.apcprd03.prod.outlook.com
 ([fe80::6595:af4e:bda9:801e]) by HK0PR03MB3139.apcprd03.prod.outlook.com
 ([fe80::6595:af4e:bda9:801e%6]) with mapi id 15.20.4478.017; Tue, 31 Aug 2021
 10:45:02 +0000
From: =?utf-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>
To: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
CC: "dafna.hirschfeld@collabora.com" <dafna.hirschfeld@collabora.com>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 "krzysztof.kozlowski@canonical.com" <krzysztof.kozlowski@canonical.com>,
 =?utf-8?B?WW91bGluIFBlaSAo6KO05Y+L5p6XKQ==?= <youlin.pei@mediatek.com>,
 =?utf-8?B?QW5hbiBTdW4gKOWtmeWuieWuiSk=?= <Anan.Sun@mediatek.com>,
 "tfiga@chromium.org" <tfiga@chromium.org>, "iommu@lists.linux-foundation.org"
 <iommu@lists.linux-foundation.org>, =?utf-8?B?WGlhIEppYW5nICjmsZ/pnJ4p?=
 <Xia.Jiang@mediatek.com>, "eizan@chromium.org" <eizan@chromium.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 =?utf-8?B?WWkgS3VvICjpg63mh78p?= <Yi.Kuo@mediatek.com>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>, "evgreen@chromium.org" <evgreen@chromium.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?utf-8?B?QW50aG9ueSBIdWFuZyAo6buD5bu65ZiJKQ==?=
 <Anthony.Huang@mediatek.com>, =?utf-8?B?VGlmZmFueSBMaW4gKOael+aFp+ePiik=?=
 <tiffany.lin@mediatek.com>, "acourbot@chromium.org" <acourbot@chromium.org>,
 "airlied@linux.ie" <airlied@linux.ie>, "drinkcat@chromium.org"
 <drinkcat@chromium.org>, "hsinyi@chromium.org" <hsinyi@chromium.org>,
 "joro@8bytes.org" <joro@8bytes.org>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "frank-w@public-files.de"
 <frank-w@public-files.de>, =?utf-8?B?TWluZy1GYW4gQ2hlbiAo6Zmz5piO5rGOKQ==?=
 <Ming-Fan.Chen@mediatek.com>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "will.deacon@arm.com" <will.deacon@arm.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "mka@chromium.org" <mka@chromium.org>
Subject: Re: [PATCH v7 00/12] Clean up "mediatek,larb"
Thread-Topic: [PATCH v7 00/12] Clean up "mediatek,larb"
Thread-Index: AQHXhO4/B+asb7CmWUi2ITwnwJWoI6uNoJ8A
Date: Tue, 31 Aug 2021 10:45:02 +0000
Message-ID: <271b63107031f6bfa1b746e70ccdcee6d86db8b7.camel@mediatek.com>
References: <20210730025238.22456-1-yong.wu@mediatek.com>
In-Reply-To: <20210730025238.22456-1-yong.wu@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 74c22ace-4c7a-4b3f-8624-08d96c6c635b
x-ms-traffictypediagnostic: HK2PR0302MB2499:
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK2PR0302MB249906CC89596137FA88C2C898CC9@HK2PR0302MB2499.apcprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ICJs5sYJxBYBYD8Oubv8I/7rjityPVUeoC/5N9Imn52AmsSMw76NqBv80QAqEaRLHfWpMo6z98AflyeNViBrDS18tOfkK4WA7/qKaul7n7++EJ4spdQBjXvyY0F6cWtQx3Uybv7yWI760NWTBDekUg07QoE8at20pgw0WzudeWDi/rYOZ6NgwM1eV+skoAaVxCGAKcQftUus43hjsN1MAqm7arPOjwpl/Cb351WCduYV0/UGufzk2YfYgTHAe9IHLcKqXj4UexJWwGp3x/q1dVCGyo7em4FDAaCMqCJBL6v4goGNQOwrn8viAnKU3+hJCehKe1qExYP39Xc1w+H0nBQbtxjuZ82ygIe3o2SlHHIFPMf/SoZAH2vPIKSUDenjX8xMAr154L6HEsEPvmp0ALsSRGh2mNaWJvXB7Sw/AvBw9LVezqoLe5i4E153Fn1Nk8udDIGK6ABixgBw9uYY1CKgA0BEiqvc+/KNbkAZ5A3ygNeLRxwLjPQVU/os+LO09/U+bakaiBLeIllgMxyHf2sQo4RaB+8asKN622wwkEeyJ5GYLMLiS1XJy4tB7PK8/uA4kJILKp4AckfRDuK9pE87zk/QkV/6p6PtbIaLOJbhAc5RzLwOPKHPfREVQFkRkUNtTKJZKE7YOXMRT61bF1BbJgvRwezln6RhL8wRtU0UP9vA/XyCdAH+gcgWbKgYLazyybP+k1MQQ0MPGsuwo+ikgDsYeNJEs4wg8VcwVjUxmAKhrQix3lTxuYvpma/Q9RgR8f2iKrzyO96tkiJPM5zc8GPUCAsvpBfJVZSK2ruGTjCylW/Pejt2Vn6FmnRc8WNZL54h1vwIY5R2isdptY8GULO8f5pVy66HZopXIeA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR03MB3139.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(85182001)(66476007)(66556008)(64756008)(316002)(38100700002)(66946007)(66446008)(6506007)(122000001)(91956017)(76116006)(6486002)(2906002)(36756003)(6512007)(54906003)(5660300002)(83380400001)(2616005)(71200400001)(966005)(186003)(86362001)(26005)(7416002)(4326008)(6916009)(38070700005)(508600001)(8676002)(8936002)(99106002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dHpPTzRIRnJUWXJQODREV1NIVzd0N1JXeEZLVHNQdWV6eDlmeWR2VUxYaWpS?=
 =?utf-8?B?eC92VjN5UDNaVXpZSWt0NVRLbHNKU1Z1RXZ1NFE2V0NOUWpVZ3R4RFRGUTlE?=
 =?utf-8?B?bWFrUXZGQU1NTDJRRlVLdjNMcUEyYlZlRjhUTTU4NUhLM1BGRVM2SHZVK08y?=
 =?utf-8?B?Q254RTlCbTR0SUpiemJWYmNrcGFKNDBubXVBZWtYaGpaVEpnUGV3SUdibkNw?=
 =?utf-8?B?TVpndkZjZ1l1ZUNRNjVwODZQSDdNbkFoVnRxa1dYa0Nua2ZZYTNOZnl0QjZQ?=
 =?utf-8?B?endQemxSSG91WUNrSWZaanpWNWNROGt5TUpSMkszdm5jb1BqbHA4NG56Rmp3?=
 =?utf-8?B?UDY1OFNPWXhQbWZ5T01MOXJhRHhQbkl1TFhzSERWdXZTc3VWMnEvY2ZubU4r?=
 =?utf-8?B?ZWJwTExPSkhweFh2VHYvVnVnbkxFcm1PRXFwdlhsYklQYjc0cGtPV1B0QlRT?=
 =?utf-8?B?YUNuYmsrL0dOa0lhQU1FeVQ5cUNkYlN1R3l1dVVWTk1SVXJzVzdxb3NXS2Va?=
 =?utf-8?B?TlRnSThDenhZZnZFSlN6ZzJ4SnhqaDdTTDgrNmVIWEIzQUcrNU5iMGRZaDZN?=
 =?utf-8?B?amxIeFFUUGtGQUhSQ29LTm42cG42Q29YMVdDMS9Bc0RnSzIzQVkvZEkvK0hR?=
 =?utf-8?B?Uk1OQUVSbXZFeCtObDBlYVlEWndFV0lPb3RJR3o4TjM1c2ltSGRVaVZKalRP?=
 =?utf-8?B?WVQvd1pNQ1N2dTMyWGNQL2gyZG1uTWwyNDcrWmJCRExMZWRtTTdMQlRWaFBY?=
 =?utf-8?B?VGdxU04wMUI2MWFjTTJPY3NUNWFUMUFYL05BWUgzTUZpQ3dlYWZRZ24ycXpX?=
 =?utf-8?B?bVBKYm5hQkk0TGxkUXhmdTZLNkhYaWhzT1U2YjFTNEpteDJXcnErQjNNYUFC?=
 =?utf-8?B?ZVVGOGVudk9OQmZ1RWVmelFLSFgyaFl4VXBBSnNOekg3YU9HYTF3YlpDelRl?=
 =?utf-8?B?eVlTYUFHVzJVQzhWTEcrL0I3b3hXTGpITStwcUVqRWNWSThkeWc2bnM2Q1Vn?=
 =?utf-8?B?TVZOcFgvTUxIOFVBZ3huM2FPVE5PZ0pybGtPZHc1Q1hQd0RieFFVNVRBakt5?=
 =?utf-8?B?Njc1R3BLeFdZV3NUMEFvK0VuV29Kc0hQbzFlQTV3S2JjYVRBaTNTOWNpZU1l?=
 =?utf-8?B?d0NyTHd4aXlyRXBMbWNSU0VhZlFUc2FwMjVnUUFtUFF0b0dkazR3WlI0UXlU?=
 =?utf-8?B?ZzZMb0UydVYxOHFiMXJXbFBRYXU3RUZ5T1pkb09jaS9HVUp4YTNYOUxNT1pl?=
 =?utf-8?B?T1NLWExTa2xzZFhkcDcreERESVhCQ3VseDZFSFpFdUxubVNFaGpPRzZFMExX?=
 =?utf-8?B?Rm9HYVhTZW04bElGOTQ0RFFoVkRrdHoxQVRXNDVxMWtFaGlrc3doS2JUL2RY?=
 =?utf-8?B?MC84TE1RRVdWNlFPdnNIYmNhRDA1bHlSSDVIditHQU92S251M0QySFRDWDFZ?=
 =?utf-8?B?RlkyWXZtWVd1WG9USXpxNmRHS0tyU2RuWWhRLzBRaGVxeXd4NjcrOTY2Z0NP?=
 =?utf-8?B?eHJWQTduS0FZVGFQbkdkSFphMkh2UWdlbkFlMlZLaExOcTIyODZUeUNCNzBV?=
 =?utf-8?B?NFZGQWRjY1JQR0IrVmljYzNuVWhseXlvMit3cWhLWUdRUDN2RUhzTDBBZWo4?=
 =?utf-8?B?QzlDNXVWVW1kc0lybmJmTHVsc0tlMGIzaC83cEppM0QxdEtJTCs2eEg4Wmhk?=
 =?utf-8?B?Z0lVRWZ6OVh0VGNHTE02dG96NGxQRFh3MDlMbWt6Um9ZQmlKQ0NUNGoxSjZU?=
 =?utf-8?Q?UFtR7qKBws/0BmZsw+cQnc3CZiweAiPaGSkWWtk?=
Content-ID: <985F7259908913478FD1B549BAC23552@apcprd03.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR03MB3139.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74c22ace-4c7a-4b3f-8624-08d96c6c635b
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2021 10:45:02.5578 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FTX8d5gunTqX53RnrogGC7P0520rFxArZo2rqvwf9WiHMiyrjV8MIR4MY933sB/d0+reTUhoDsKG+Bcra80bMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR0302MB2499
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210831_034525_511369_1F5609FD 
X-CRM114-Status: GOOD (  13.77  )
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

Hi Matthias,

Just ping for this patchset.

Thanks.

On Fri, 2021-07-30 at 10:52 +0800, Yong Wu wrote:
> MediaTek IOMMU block diagram always like below:
> 
>         M4U
>          |
>     smi-common
>          |
>   -------------
>   |         |  ...
>   |         |
> larb1     larb2
>   |         |
> vdec       venc
> 
> All the consumer connect with smi-larb, then connect with smi-common.
> 
> When the consumer works, it should enable the smi-larb's power which
> also
> need enable the smi-common's power firstly.
> 
> Thus, Firstly, use the device link connect the consumer and the
> smi-larbs. then add device link between the smi-larb and smi-common.
> 
> After adding the device_link, then "mediatek,larb" property can be
> removed.
> the iommu consumer don't need call the mtk_smi_larb_get/put to enable
> the power and clock of smi-larb and smi-common.
> 
> Base on v5.14-rc1, and a jpeg[1] and mdp[2] patchset.
> 
> [1] 
> https://lore.kernel.org/linux-mediatek/20210702102304.3346429-1-hsinyi@chromium.org/
> [2] 
> https://lore.kernel.org/linux-mediatek/20210709022324.1607884-1-eizan@chromium.org/
> 
> Change notes:
> v7: 1) Fix a arm32 boot fail issue. reported from Frank.
>     2) Add a return fail in the mtk drm. suggested by Dafna.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
