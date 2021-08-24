Return-Path: <SRS0=VOwE=NP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 701A3C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 09:16:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B9CE6135F
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 09:16:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0B9CE6135F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tH54Dgiwnz+5m5sXk22Is7Mkk8Dl3cca1gatnI+ApEY=; b=Pie1tcryOYSEdz
	Lp02jCaOAWCKCs55fpKtKEkvZOZ79bEKL5IYyimnovTXwLnYYpqACiwj4d7bADNkC2iX7ly5MrulO
	qU1aMTTv913WoPMD8zjRrc9PCdaxOAQ0tmSMobc6bNKJB7+JMgvQBLImJLshl4hQZP6zMyG4WWP1N
	b8VzKepXLFyU/uL+1bK9UKcw3drOj6Cdjr5mKGpXQZzOhGZDrv61uYMTns5dkLNzPHecMPV+BHZWW
	O8F1NfcPVLsIQZ+RTJQXvZacrCWJ/6xZrUuSBWD3OefcvroM+aj6hjjsQSa1mayuzB8V85OaCr1I0
	KJx2ShEDtgXrhV6DVtTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mISXT-002Gid-N2; Tue, 24 Aug 2021 09:16:11 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mISXN-002GhZ-Hf
 for linux-mediatek@lists.infradead.org; Tue, 24 Aug 2021 09:16:10 +0000
X-UUID: 24ccf64ffb6b4d93b89b1d4129257ba0-20210824
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=DTyWZg0lRuL4snX3Fr6BgReM9AtZdE40HXruRQ7hb88=; 
 b=qKY2EUcvslXANvRLBICW9taRxTBuJtgwI9IHquPbp5+30sUPCK/FAT2ev1zZRyHf5Dyo8H0NAvgr/nmG0iCg+MQL0+0lWIdXNSIXtAh2LgSitNCogKrVtyM0CdvYwX5MuXLJG19ANv9fnkWrv1IZDgjaTFg6KY0LWMZnDTwNw5g=;
X-UUID: 24ccf64ffb6b4d93b89b1d4129257ba0-20210824
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1547471961; Tue, 24 Aug 2021 02:16:00 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 24 Aug 2021 02:15:58 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkcas07.mediatek.inc (172.21.101.84) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 24 Aug 2021 17:15:57 +0800
Received: from APC01-HK2-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.792.3 via Frontend Transport; Tue, 24 Aug 2021 17:15:57 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oy+WYoksgmpnPJrIn9EMI78fXPDoHFrkQoAdRPX86C2tiSJ1uIeo4OYkoXJGQ5zU9y0ftRrM3X+p3ktVPpKFUv6LNYdHcWfTP490AvNl5mUUttMwxt05wp3OikXugA1PPH0+twSLBasp+w6lUEVYDgn3VfKIUJ1mdXtJ+gCrZZNhR/1EifTXTee58jaXoH2sE5cZlr8pcC1oQL/xfEFyQGcF+MTyJkBC8lBlvaN5mJVwNKkCA89FHvd/IAGibYtCsV30+5X9ZuuzCfko66PUA+vO2HWd3xQZpLNdhm79w7qsRSfqJ7DcBIjOV2dJdQ2B+xjwWoL0cmMoish0N/md9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DTyWZg0lRuL4snX3Fr6BgReM9AtZdE40HXruRQ7hb88=;
 b=DxX1Dl9kv/b5vNU4D+tVcCmCEZH33be3E/Nhyz1sShr7D8wDJ+0wRhhgE3buJsQ08RpK9h7vd4zOZ5wAAPr3ss7gpgN1WoOdR+DUvPyjk18glYgyXW8UHBtYYt3zlwEIQZl5RfYqRFwmtv20g/le+7TaEPMhial8qIwyoV8RNRMO9A4x8t1jCgdMPLMalBsfUjZJBxALg+Q0UUO2P8YeijFK19sHfg3V4H62Ouez9DCRrG5Y3FUxHpTlIBC1hCuqpiTyUfFP3LhxrNhWieFtZVfWphWyszJ3XBsFHqe+VLXdd0umSymIpG0G0IwsUFlwxGGvb9fz+kSifC+pAgK/IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DTyWZg0lRuL4snX3Fr6BgReM9AtZdE40HXruRQ7hb88=;
 b=pMhoiPcotPDmUEgbWIaYVdz4w1CinbmL8EwnKZC0WLM72JVDJWvFv7Bp39ntYPyHjRwjjbxlVGiClJ7jhVCyKxT+1elEogSkFgQHRX6oyzpFhyB3pw4rGzhe2i9cSkEwkc7t8oSlSxFlanX6tDoDGi+CAlLsGYOBc+p6jC59Mws=
Received: from KL1PR03MB5062.apcprd03.prod.outlook.com (2603:1096:820:1a::22)
 by KL1PR0302MB5331.apcprd03.prod.outlook.com (2603:1096:820:42::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15; Tue, 24 Aug
 2021 09:15:46 +0000
Received: from KL1PR03MB5062.apcprd03.prod.outlook.com
 ([fe80::1898:f611:33ba:b58c]) by KL1PR03MB5062.apcprd03.prod.outlook.com
 ([fe80::1898:f611:33ba:b58c%7]) with mapi id 15.20.4457.017; Tue, 24 Aug 2021
 09:15:46 +0000
From: =?utf-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= <Chunfeng.Yun@mediatek.com>
To: "ikjn@chromium.org" <ikjn@chromium.org>
CC: "srv_wsdupstream@mediatek.com" <srv_wsdupstream@mediatek.com>,
 =?utf-8?B?WWFxaWkgV3UgKOatpuS6muWlhyk=?= <Yaqii.Wu@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
Subject: Re: [RFC PATCH 3/6] usb: xhci-mtk: Do not use xhci's virt_dev in
 drop_endpoint
Thread-Topic: [RFC PATCH 3/6] usb: xhci-mtk: Do not use xhci's virt_dev in
 drop_endpoint
Thread-Index: AQHXmB33SLgpzOAq60aT2NQ2q7BWd6uCBvMAgABaDwA=
Date: Tue, 24 Aug 2021 09:15:46 +0000
Message-ID: <68dce398198d9de6acaeb8bcf37af953e19fe064.camel@mediatek.com>
References: <1629723236-10768-1-git-send-email-chunfeng.yun@mediatek.com>
 <1629723236-10768-3-git-send-email-chunfeng.yun@mediatek.com>
 <CAATdQgCfXqS_DyBrMNpSeLqMRsw0KnLg45r0P4EWuMZhPsHH7g@mail.gmail.com>
In-Reply-To: <CAATdQgCfXqS_DyBrMNpSeLqMRsw0KnLg45r0P4EWuMZhPsHH7g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 905efd80-b30f-4d5e-0201-08d966dfc1a6
x-ms-traffictypediagnostic: KL1PR0302MB5331:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <KL1PR0302MB53315AA8AA108CD8C9BD2998FDC59@KL1PR0302MB5331.apcprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2276;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8AVXXMKUFMPdDyW1KNjvwtwnxoLCTrA3h4btnjZEW73FkFaBuJQffp9fNQWu1IkUmbdBjbQtNp3ILaNFsZbHfhj4sNm6m0NQ2SDlCUA4fVLhZJCHHcJ2ehmhTmBU9X9LVSvFI9g1O5odowLI+QassPgKZprRqNgeReyRmxlNLUx6kgs2VsjfAYhdxp+UNzN83Dc/zpmjpFnFxzQ4UvgbI6X7tWsQ4f230ggVVjk/1P4HC6aO8GY8gnj/PxG6UpvKtzLVrZtQgBm+d0MMF7R8j4uqzt2lexORTlrpQDmkMM3zdN/E+nv2w9Wwqj/FelTIHmfj9g9YS3Wh3Se1OWERdS7EC68ZlVsDUqz4tGSfZBWl1J+/+hB3Hwo2mHYqQnGuurV2fZutrQ9qXzv37XQqArjdwuXUEMtWpGNGHc8QHYzq88vS5yPcOh5xFzK5X/UwDcBFlR1HWiYqSbkVhCl5VkQ80syxn1I+5pRB8gGrfzuAw7Tpo1nqGlZvnRIjBDZOKxPrmScS3X3wa/rWSKc6LqzBarfCwjIh7NIuW+v6UJEZLkBNsAxGZyWOkC3+UplU7o09tPhY2+JSfebaKS22y7yHyUyOu4sAG8Juz10k9O7hLcX+f7jVGoV/MhPPASBsTXGt00yDqoKSwvHTlu06/FhON7QTGqThOAfLfztwXZg4YN4jbkgDtLc7EAP6sfn+FNmmX1X90rkFyavdsGdZ8d2G6XDg6Joxzyr7ABXbOQo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR03MB5062.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(83380400001)(38070700005)(6506007)(2616005)(8676002)(38100700002)(76116006)(186003)(36756003)(91956017)(85182001)(66946007)(8936002)(316002)(5660300002)(4326008)(26005)(508600001)(6486002)(122000001)(6916009)(64756008)(66446008)(86362001)(71200400001)(2906002)(53546011)(66476007)(66556008)(6512007)(54906003)(99106002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OFgzbWIrSHhEQ1VOOEF2aW9iN1JqZUR3RUJYVUx5ZUZWeU0rbjI4dWJCNGp2?=
 =?utf-8?B?TXFWK1QxeE9aQzRRRXJiSUtvZlZvOXZ4L1lodDBtVVh3a29BQWF5T1BHVFRT?=
 =?utf-8?B?WjJEVDF4bnh1eFh1cEdZUyt6b1YrRzdXeExQWkRlUVdWQXFxaUcxWjl2VS9o?=
 =?utf-8?B?L1dNMjVrNnRhRmFxRHhjamFHbmE0aldjRHcrOVRLRHB3VkRta1FSN1JhQjRk?=
 =?utf-8?B?NkVWOHdnUjV2YWl5VWsyV2FBUUdwS2ZtaWl5NkNta1RSTzFraE9ndDVORGJI?=
 =?utf-8?B?NzBrTXQ4NWIzUUZnT0JPVVVyZVJySjV2Q2VZVVdRT252Z2RSZEZyMUUrbkxQ?=
 =?utf-8?B?Z3hRNHRrTXlWc0Y1WStHOVZQNVlmTzNGVDZ6OXlGOXhNQnlrTFR5aDBXeDhZ?=
 =?utf-8?B?T3MyejcyblhucFpPcVFOejU2RWZBSXNUaUtQdDhoKzE2ZVQ5V1Nzam5yZ2Jo?=
 =?utf-8?B?Vzg2b0dxUVZYekNMOXN4RTlucTBNNDFpOGV0b0ZoUUNZaXZkbk9XTG91NklJ?=
 =?utf-8?B?d0RrbjRnbXduanpvNWF2ZTUyMmEyVmMvazlra1RKMTRLb1RLb3plSzdnZkNi?=
 =?utf-8?B?NFFYMEdBRnFHZ3NHRE1HMEJnVTJPazhzTmxpcXhXcGNXbEVXams2Z1NZb1ds?=
 =?utf-8?B?dlRGVEQvOXN6VW56SmtKL2ZZcWNQQkFzOVA2SkF5OUFtdG9maGg0VmF5TW16?=
 =?utf-8?B?cnBpUUVZZDNnQUtHMldoN2Z6allYcTlYS2pjT1BqUmJrWEltVnBYdzZ5VTlp?=
 =?utf-8?B?Q0UxMWRwSDJvbG45NWZCWUx4ZVpDZXhZdkNSaVcrRnNid2tJalRQalRBZE5L?=
 =?utf-8?B?M25yaDBWQngyazl5TnEzanF0ZzJwbDYvOTMwSDVDMFpsS1NEWG0zSGVBc2Rp?=
 =?utf-8?B?TndhY1VsQU55QmlMbXg4YVZUaVoveENuT0lGWGJlTTV4eG52YTVMQXQxTXVD?=
 =?utf-8?B?TUNZN3dCVEVtTEZnSEJpb0dzNFdHOEljaGZoT3l5UjFkZG5DNWJuYkJGRnRu?=
 =?utf-8?B?SExtcEx2VG5UOVE4Z3lIcHZVbkdpa2FiOFFiaE5MZHFFY0tuUk1CYXQ5MzdM?=
 =?utf-8?B?SXJhRno5MForOW0xeERyWW5id3p1SFRCNnNOL1BWbEIxZDVkRWlkcm4rbExu?=
 =?utf-8?B?b0JZWE45NEpwemRZTVdlVFhSN1pCdHFlS0ZzT3o4cGhnQzVrVkVqY1kwK2tP?=
 =?utf-8?B?ZlYzbDNrS0lyMlRVY01pREQ3VE1HVXVhcjZmWW4wTXRFbGFwY1BrbGsxV0FB?=
 =?utf-8?B?QVJUUnhOdVpYMVBPWDlnMlIrL0tUdHMzRmNvaE9WekxrektBSWp2c1V6SFJj?=
 =?utf-8?B?Z0ZBbHB6VklIR1ZxTkN3OENQWlhFdGg0ZlRrMEdEVmVCTDg1SzBRak1LNTFR?=
 =?utf-8?B?SVdpWDdrcEVaUU1EZmw2V0krRHVnOFJPNnlHa282aU9RaEJlYW16QnBiUFBj?=
 =?utf-8?B?WU9UMTl3ZmNzQ21SazdBc3VhdXBNSmY1YXR0M0d5SWxvRklJS202K0pXTzgw?=
 =?utf-8?B?NzZTZUxnNlpUeVI2SHllNEgyWjNaWXVST1grV0c2S0o5N2FkTlpDd3NaQjJk?=
 =?utf-8?B?YzJ0ZzBHMTcrd0NwYUdHWGtDczArc1kzbTJmTXZ3L1F2ZlcxQ2JJQ3c2cjFo?=
 =?utf-8?B?aU1xenV6WitJdTc4TlNVWjllL0V2bDRwdEVlbnhXMi81a0NheXJ2UW5ReCtk?=
 =?utf-8?B?Tkp4MHQrSkZPY1JCcWdVTFZuK001T1RyQ0ZTVFNjbDk4UjVadkpPZFFwS1ND?=
 =?utf-8?Q?CbG/85Vxr/SWW+74APT7IkJb76Jbifq30ZqW7Lo?=
Content-ID: <0771E499B912C3439287076397A281F6@apcprd03.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5062.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 905efd80-b30f-4d5e-0201-08d966dfc1a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2021 09:15:46.1678 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v3DXCEu+dE1Sh8k+MPThb4/GlA1J9WCwaFzCQpN/ieSTVM7kpX2qqbOqaBfP0IQHG/nmmvQHDTmMuS0CfBaw8V69c2ogzXFkv/lLyPYsXLc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0302MB5331
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210824_021605_710624_B0239941 
X-CRM114-Status: GOOD (  27.51  )
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

On Tue, 2021-08-24 at 11:53 +0800, Ikjoon Jang wrote:
> HI Chunfeng,
> 
> On Mon, Aug 23, 2021 at 8:54 PM Chunfeng Yun <
> chunfeng.yun@mediatek.com> wrote:
> > 
> > xhci-mtk depends on xhci's internal virt_dev when it retrieves its
> > internal data from usb_host_endpoint both in add_endpoint and
> > drop_endpoint callbacks. But when setup packet was retired by
> > transaction errors in xhci_setup_device() path, a virt_dev for the
> > slot
> > is newly created with real_port 0. This leads to xhci-mtks's NULL
> > pointer
> > dereference from drop_endpoint callback as xhci-mtk assumes that
> > virt_dev's
> > real_port is always started from one. The similar problems were
> > addressed
> > by [1] but that can't cover the failure cases from setup_device.
> > 
> > This patch drops the usages of xhci's virt_dev in xhci-mtk's
> > drop_endpoint
> > callback by adopting hashtable for searching mtk's schedule entity
> > from a given usb_host_endpoint pointer instead of searching a
> > linked list.
> > So mtk's drop_endpoint callback doesn't have to rely on virt_dev at
> > all.
> > 
> > [1] f351f4b63dac ("usb: xhci-mtk: fix oops when unbind driver")
> > 
> > Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> >  drivers/usb/host/xhci-mtk-sch.c | 100 ++++++++++++++++----------
> > ------
> >  drivers/usb/host/xhci-mtk.h     |  11 +++-
> >  2 files changed, 60 insertions(+), 51 deletions(-)
> > 
> > diff --git a/drivers/usb/host/xhci-mtk-sch.c
> > b/drivers/usb/host/xhci-mtk-sch.c
> > index 54c521524bfc..f3c6f078f82d 100644
> > --- a/drivers/usb/host/xhci-mtk-sch.c
> > +++ b/drivers/usb/host/xhci-mtk-sch.c
> > @@ -80,7 +80,7 @@ decode_ep(struct usb_host_endpoint *ep, enum
> > usb_device_speed speed)
> >                 interval /= 1000;
> >         }
> > 
> > -       snprintf(buf, DBG_BUF_EN, "%s ep%d%s %s, mpkt:%d,
> > interval:%d/%d%s\n",
> > +       snprintf(buf, DBG_BUF_EN, "%s ep%d%s %s, mpkt:%d,
> > interval:%d/%d%s",
> >                  usb_speed_string(speed), usb_endpoint_num(epd),
> >                  usb_endpoint_dir_in(epd) ? "in" : "out",
> >                  usb_ep_type_string(usb_endpoint_type(epd)),
> > @@ -129,6 +129,10 @@ get_bw_info(struct xhci_hcd_mtk *mtk, struct
> > usb_device *udev,
> >         int bw_index;
> > 
> >         virt_dev = xhci->devs[udev->slot_id];
> 
> Yeah, previous code had unnecessary NULL checking here.

yes, xhci_add/drop_endpoint() -> xhci_check_args() helps to check it,
it will return -EINVAL.

> 
> > +       if (!virt_dev->real_port) {
> > +               WARN_ONCE(1, "%s invalid real_port\n",
> > dev_name(&udev->dev));
> > +               return NULL;
> > +       }
> > 
> >         if (udev->speed >= USB_SPEED_SUPER) {
> >                 if (usb_endpoint_dir_out(&ep->desc))
> > @@ -236,14 +240,20 @@ static void drop_tt(struct usb_device *udev)
> >         }
> >  }
> > 
> > -static struct mu3h_sch_ep_info *create_sch_ep(struct usb_device
> > *udev,
> > -       struct usb_host_endpoint *ep, struct xhci_ep_ctx *ep_ctx)
> > +static struct mu3h_sch_ep_info *
> > +create_sch_ep(struct xhci_hcd_mtk *mtk, struct usb_device *udev,
> > +             struct usb_host_endpoint *ep, struct xhci_ep_ctx
> > *ep_ctx)
> >  {
> >         struct mu3h_sch_ep_info *sch_ep;
> > +       struct mu3h_sch_bw_info *bw_info;
> >         struct mu3h_sch_tt *tt = NULL;
> >         u32 len_bw_budget_table;
> >         size_t mem_size;
> > 
> > +       bw_info = get_bw_info(mtk, udev, ep);
> > +       if (!bw_info)
> > +               return ERR_PTR(-ENODEV);
> > +
> >         if (is_fs_or_ls(udev->speed))
> >                 len_bw_budget_table = TT_MICROFRAMES_MAX;
> >         else if ((udev->speed >= USB_SPEED_SUPER)
> > @@ -266,11 +276,13 @@ static struct mu3h_sch_ep_info
> > *create_sch_ep(struct usb_device *udev,
> >                 }
> >         }
> > 
> > +       sch_ep->bw_info = bw_info;
> >         sch_ep->sch_tt = tt;
> >         sch_ep->ep = ep;
> >         sch_ep->speed = udev->speed;
> >         INIT_LIST_HEAD(&sch_ep->endpoint);
> >         INIT_LIST_HEAD(&sch_ep->tt_endpoint);
> > +       INIT_HLIST_NODE(&sch_ep->hentry);
> 
> so tt_endpoint was revived, is this related to bugs?
No, it's no related with drop_endpoint issue, so keep it unchanged.
It helps to add debug info when encounter issue, we may want to find
all eps attached to a specific TT.

> 
> > 
> >         return sch_ep;
> >  }
> > @@ -576,9 +588,9 @@ static u32 get_esit_boundary(struct
> > mu3h_sch_ep_info *sch_ep)
> >         return boundary;
> >  }
> > 
> > -static int check_sch_bw(struct mu3h_sch_bw_info *sch_bw,
> > -                       struct mu3h_sch_ep_info *sch_ep)
> > +static int check_sch_bw(struct mu3h_sch_ep_info *sch_ep)
> >  {
> > +       struct mu3h_sch_bw_info *sch_bw = sch_ep->bw_info;
> >         const u32 esit_boundary = get_esit_boundary(sch_ep);
> >         const u32 bw_boundary = get_bw_boundary(sch_ep->speed);
> >         u32 offset;
> > @@ -624,23 +636,26 @@ static int check_sch_bw(struct
> > mu3h_sch_bw_info *sch_bw,
> >         return load_ep_bw(sch_bw, sch_ep, true);
> >  }
[skip]
> > diff --git a/drivers/usb/host/xhci-mtk.h b/drivers/usb/host/xhci-
> > mtk.h
> > index eb05aaf6edbe..dc5e83f5c5cc 100644
> > --- a/drivers/usb/host/xhci-mtk.h
> > +++ b/drivers/usb/host/xhci-mtk.h
> > @@ -10,11 +10,15 @@
> >  #define _XHCI_MTK_H_
> > 
> >  #include <linux/clk.h>
> > +#include <linux/hashtable.h>
> > 
> >  #include "xhci.h"
> > 
> >  #define BULK_CLKS_NUM  5
> > 
> > +/* support at most 64 ep, use 32 size hash table */
> > +#define SCH_EP_HASH_BITS       5
> > +
> >  /**
> >   * To simplify scheduler algorithm, set a upper limit for ESIT,
> >   * if a synchromous ep's ESIT is larger than @XHCI_MTK_MAX_ESIT,
> > @@ -36,14 +40,12 @@ struct mu3h_sch_tt {
> >   * struct mu3h_sch_bw_info: schedule information for bandwidth
> > domain
> >   *
> >   * @bus_bw: array to keep track of bandwidth already used at each
> > uframes
> > - * @bw_ep_list: eps in the bandwidth domain
> >   *
> >   * treat a HS root port as a bandwidth domain, but treat a SS root
> > port as
> >   * two bandwidth domains, one for IN eps and another for OUT eps.
> >   */
> >  struct mu3h_sch_bw_info {
> >         u32 bus_bw[XHCI_MTK_MAX_ESIT];
> > -       struct list_head bw_ep_list;
> >  };
> > 
> >  /**
> > @@ -54,8 +56,10 @@ struct mu3h_sch_bw_info {
> >   * @num_budget_microframes: number of continuous uframes
> >   *             (@repeat==1) scheduled within the interval
> >   * @bw_cost_per_microframe: bandwidth cost per microframe
> > + * @hentry: hash table entry
> >   * @endpoint: linked into bandwidth domain which it belongs to
> >   * @tt_endpoint: linked into mu3h_sch_tt's list which it belongs
> > to
> > + * @bw_info: bandwidth domain which this endpoint belongs
> >   * @sch_tt: mu3h_sch_tt linked into
> >   * @ep_type: endpoint type
> >   * @maxpkt: max packet size of endpoint
> > @@ -84,7 +88,9 @@ struct mu3h_sch_ep_info {
> >         u32 num_budget_microframes;
> >         u32 bw_cost_per_microframe;
> >         struct list_head endpoint;
> > +       struct hlist_node hentry;
> 
> I think a simple hashtable is well fit but also rhashtable
> had no problems to use.
Yes, rhashtable is also fine, but seems more complex, may introduce new
issues easier.

> 
> Overall, I suggest you merge this patch with reverting
> b8731209958a "usb: xhci-mtk: Do not use xhci's virt_dev in
> drop_endpoint"
> with some notes about the bugs I made.

Ok, they are all related with error handling:
1. when usb_add_hcd() -> xhci_mtk_setup() -> xhci_mtk_ssusb_config() or
xhci_gen_setup() failed, xhci_mtk_sch_init() will not be called, but
probe() will call xhci_mtk_sch_exit(), then NULL dereference oops
happens, because rhashtable is not init but try to destroy it.
2. in xhci_mtk_sch_init(), when alloc sch_array failed, need destroy
rhashtable;
3. in add_ep_quirk(), when rhashtable_insert_fast() failed, need
destroy sch_ep(), it's not added in bw_ep_chk_list.

Thanks a lot

> 
> IIUC, this patch looks like reviving mu3h_sch_tt::ep_list and
> changing rhash_table to hashtable. The incremental patch will be
> much shorter sized and clearer to understand.
> I'm not so clear what you are trying to fix.
> 
> Besides that, I don't have any objections to these changes. :)
> Thanks.
> 
> >         struct list_head tt_endpoint;
> > +       struct mu3h_sch_bw_info *bw_info;
> >         struct mu3h_sch_tt *sch_tt;
> >         u32 ep_type;
> >         u32 maxpkt;
> > @@ -137,6 +143,7 @@ struct xhci_hcd_mtk {
> >         struct usb_hcd *hcd;
> >         struct mu3h_sch_bw_info *sch_array;
> >         struct list_head bw_ep_chk_list;
> > +       DECLARE_HASHTABLE(sch_ep_hash, SCH_EP_HASH_BITS);
> >         struct mu3c_ippc_regs __iomem *ippc_regs;
> >         int num_u2_ports;
> >         int num_u3_ports;
> > --
> > 2.18.0
> > 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
