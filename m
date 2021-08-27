Return-Path: <SRS0=sikH=NS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAC19C432BE
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Aug 2021 07:00:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 880DD60FD8
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Aug 2021 07:00:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 880DD60FD8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s482xyId+QwbBjMKdBTEm04Tb4QPORIMWkjazEFiIvg=; b=kJYpfEKNKwdOPD
	k+WGJ0SaJC3zrnWO8nbLuctUMVKJe3TrQWIxYnZeNJXyK8mtBK0ZwtOPu7BUHY7OFE7nBvxtjjYCx
	44va4bpRxR0JdryW70diioOXJfY+e2xI7IN/45BGcxi/Jlkd54cuFbi1DJYSzbSZixh3uTUTOhXIS
	DH62YgThbKoKVX/NHRivEcuQTDtgwNSZR1z8P+nsZsM/bmp91Jw+wZaw33v3oyzwHfBRKtvDpdQh4
	lM+6rkrg7jngr6qgOHZ4rx+fZ+9JBmrMXXni+1a/mPWyKlbj+JSaRR7JLBCDeGqLFYIjHcfi9oWAd
	OlMhkKjadnmucH7OL1LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJVqj-00BjFU-Mi; Fri, 27 Aug 2021 07:00:25 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJVqQ-00BjCd-9J; Fri, 27 Aug 2021 07:00:11 +0000
X-UUID: 24f6f5baddeb4f0094b83e8d4a09eb69-20210826
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=UD81GlPUaoDKdwsKH4lkwO96oYOhl/GykrQ+frjhVZM=; 
 b=ktMe+oD/TltRvhKnEOn1vNMbAO82BGY1uyi864D003JrCEMPg7BuR7Sn7X/hoEX2mJB4NjnbPtBF2vh6wJNkcZHFriB4v1c0LiCgOQcmTwCEdhBW/7NoAa3DKLhC07s/Bs2xWRakUbyeR/lrk2QtM8cR+XJ00o67CoTp9PnNswc=;
X-UUID: 24f6f5baddeb4f0094b83e8d4a09eb69-20210826
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 767536814; Thu, 26 Aug 2021 23:59:52 -0700
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 26 Aug 2021 23:49:50 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 27 Aug 2021 14:49:42 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.792.15 via Frontend Transport; Fri, 27 Aug 2021 14:49:42 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MZdQv+EOJM/o0rUL3E6ORorH4/CHj+Wke6uR/g8uqMITQppBZQ9szmkXJkpqerbmAmAzL/ATmFVJWy1yCiisJvqwZGZU91H4oudYZO3ciL5ZoEFo+zyUEMovNGtwvEE3cXm418uMULwUV7QX4FhYo0nwioN1gYVOQpoHWLIQPlKO083nCGoWIM4866FXK6jBfWtSiFhYCC5Z19x2m2+vIBr40DkzG9oA6A9rYCXe9KFh1aaGkFUj2uhCc0c3htxiWQT8Pm3383IrXSTCFeUBWDDe3vqwuEAKV6pBK4g+8J0w8t2xouFtnhdqsxGGnRqb4OKB9c7qCznn6N3m5qkvEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=UD81GlPUaoDKdwsKH4lkwO96oYOhl/GykrQ+frjhVZM=;
 b=Y+dvfsBfF4S4ZoMjOQm4yO1nwDuqhtfEqVal580bLeVwIc9kIYOZW+YSpjmzIvH9rcHIO0Ulnltz8UlfcyLKyb09xpSjOW2YbD5N3DKmW++4ehAVV0layVDHXQbzhOkegTkQen7v0EUSxyNTauxDooY7L2Yh24/Yv5pgcwrsF2f/LhQFQifj5Yqtem31CGS5x4LYv/0ptVXr8zI4dskRzYOkaP2x0wuJb74KLcAVNKO94FkJpR4zocP4EvgYSHxb/J5wA5IW18DJ5I2f30oOhiQ6VzDYzOLm56rGXWSWi0uwDjSI9RJSBAxbTLOTO8nmQhmwp9WhRNz6+AoOKRc15w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UD81GlPUaoDKdwsKH4lkwO96oYOhl/GykrQ+frjhVZM=;
 b=Khh6QiaYORT8OyF3hE5q9HbcG38qEhuBDR+hCJfIssZ4iXS/VrhYYin9wqCfSfZIgn0RzBaT2gY92lwqNNevGvue7HdtuGpdbO05WFSl9QpHrKFhO1f+FXGxvLH3H2nlyK18z8qyajq0u7hpqM6MCC5YZRzCqiUFXnJG1BKQEG8=
Received: from KL1PR03MB5062.apcprd03.prod.outlook.com (2603:1096:820:1a::22)
 by KL1PR03MB6228.apcprd03.prod.outlook.com (2603:1096:820:8e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.9; Fri, 27 Aug
 2021 06:49:28 +0000
Received: from KL1PR03MB5062.apcprd03.prod.outlook.com
 ([fe80::1898:f611:33ba:b58c]) by KL1PR03MB5062.apcprd03.prod.outlook.com
 ([fe80::1898:f611:33ba:b58c%7]) with mapi id 15.20.4457.017; Fri, 27 Aug 2021
 06:49:27 +0000
From: =?utf-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= <Chunfeng.Yun@mediatek.com>
To: "ikjn@chromium.org" <ikjn@chromium.org>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 =?utf-8?B?WWFxaWkgV3UgKOatpuS6muWlhyk=?= <Yaqii.Wu@mediatek.com>,
 "mathias.nyman@intel.com" <mathias.nyman@intel.com>,
 =?utf-8?B?RWRkaWUgSHVuZyAo5rSq5q2j6ZGrKQ==?= <Eddie.Hung@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "gregkh@linuxfoundation.org"
 <gregkh@linuxfoundation.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>
Subject: Re: [PATCH next v2 3/6] usb: xhci-mtk: update fs bus bandwidth by
 bw_budget_table
Thread-Topic: [PATCH next v2 3/6] usb: xhci-mtk: update fs bus bandwidth by
 bw_budget_table
Thread-Index: AQHXmiVZCYpp+DFuZEGdWMiTnTLyNKuFrdcAgAE9OgA=
Date: Fri, 27 Aug 2021 06:49:27 +0000
Message-ID: <72ee7a203d8a49e6e43a954b45133470ee6d5c16.camel@mediatek.com>
References: <20210826025144.51992-1-chunfeng.yun@mediatek.com>
 <20210826025144.51992-3-chunfeng.yun@mediatek.com>
 <CAATdQgBD+dTtBie-cNKRJbfxEpc3haqjfUu1k26mTk8pCSOEww@mail.gmail.com>
In-Reply-To: <CAATdQgBD+dTtBie-cNKRJbfxEpc3haqjfUu1k26mTk8pCSOEww@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 77a49dd3-0d12-43f4-4767-08d96926d087
x-ms-traffictypediagnostic: KL1PR03MB6228:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <KL1PR03MB6228F75DC4FFD6861D42A35AFDC89@KL1PR03MB6228.apcprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7A/FcV8mwwiw2qlK/foabJS970DMN2C7aWpyWXSWdPLFLUeRH1QoCX+VtC6FRZo2ebZM+LYiEVtRuF2CyoWMkqzbs7e1mfqPt+BWG1lw6pV8CsCkUaXOnyyhKtkZV6JpPa0ZcD/xVEHb03+ueyBjRitqrJiFcmSFIgw5MamqwPt8BEkdYgKGZ99uz4Dq3wRgyY1onuZrRFyyXZ/DfymvcnRm9Jfz0DMdVIklzXc4xcxJ6PO6HhEpMO/GOG9eXtRCFNafuY+e2d92x6t4dinGJuYzSwq+SoD+vOb/00kWANJKuWso/FoVSmmmzYsDUXO1Vrgx4T7PHVLuB3aJxX5W4AQnSy3PzsZUL8liWFLV2+qJfMQLY1bUM4Ghb66yBOYIuEdBFUSQrtmWmkPITIb1jkU4meAbIcKfPkdeJK7PfZn8IMLrkx3YZ0bFMM114Nz8mQUqMWZIB8meHCGvJfZkDUAf7X/PTIl8pbAGH2JGUWGSZzFqH7qh+ZIjDSQv+0h4XhubPwtqozeOAfNA/Wnqb9r21gVUKadQ7xsXuoCQh1pP4c0t/4qE2QgkuPpTmCtPFMB6t27vw16xpyve3pdYCzbzIVMW20wvNtkdiqgUGpyQZ0+qs5ojT2EuqveQWRFVwz8jIUbNUJnF5ntnthnRTIrdrZo76aJg8NGe54/r9aVoyiJLBbgJqsZ8GC5LNFo9vwvqb78V5R2dEZthIfBOYHU9ArcXK3SOBRYvGTxi53Cina0lk8FVMI5uNSe/qAJvBCkNW9+9LMh3FzhFfcOO7ZeR9H5c7ZgUJ0yQgugO91s=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR03MB5062.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(508600001)(15650500001)(6916009)(85182001)(66556008)(6512007)(6486002)(53546011)(36756003)(86362001)(38070700005)(8676002)(6506007)(2906002)(64756008)(66446008)(83380400001)(66946007)(5660300002)(76116006)(26005)(4326008)(2616005)(91956017)(316002)(66476007)(186003)(54906003)(38100700002)(71200400001)(122000001)(99106002)(414714003)(473944003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NWNQZThsV21nUGJaeVlBNjdJendnRnI4QUlUOHFXZ2RDN0ZmblI0eEN1NW5w?=
 =?utf-8?B?WnVNTkFTU2NlL0NKR1VEZ2N0SCttTS9kb1pqZGF4cEdXT1puWGRmcDJpbEdV?=
 =?utf-8?B?WCtmZmtRd0FNRzZ0UU1pM25FLzJXSGxiQyt5WEpva0JMbXZDbFdZUERqQWZh?=
 =?utf-8?B?WXA5WnMxQjg2OWptTmZrN1lMQkpaOEdQY3JCczFaU0xLL2dNSExhNVN1bHo1?=
 =?utf-8?B?TTNIbmVrK0tKNC83VVdET0dvV1ZNUkg3RzVZU3FLaWVTSktscWhaYkZUT2VG?=
 =?utf-8?B?bkNwU2RxZ2FSMlAyaTVqOVdnMUNJeUh3QTV6TWc1djZRSjdzNERBUFFzUEVN?=
 =?utf-8?B?SEJTV0NTb0V6ZnlXV244RVVCaWZ2YkFvTjV5RDg3NFZzMENrZ3NUNWl0REpB?=
 =?utf-8?B?TXpXQlQ3RjB5My9BcmpUdzJiaGNGM1phQjYwMDNGUWZMRGxab1hJMVhUYml6?=
 =?utf-8?B?NldRMHB0ck9aNE1nNFZza3g4bDZ4c3laY3lnTWIzZ3UydlZ3V3hSVUVpK2t4?=
 =?utf-8?B?Mm9zSnBIVXRNVzVQRUI2MFkyWUpPaEZJKzREQkNCQTBZWjhFL2g2OWlGclBa?=
 =?utf-8?B?VmtFQXFkbm1adlQxS1RnNlFBbUZGWDk4bkJJUjUyT2tWMmFwaWt0T2VwOEtS?=
 =?utf-8?B?NllyalIvUDhvQWRlVjUxVU9JaXVWdldveE44Vmt4R2xnemJ6dzRDZGY4SWtx?=
 =?utf-8?B?S0d4MitGQlZnaTRBM2dwYlNNdWVmQ25iT2JkT3ZhcGZsakp3K2VFcjZuVFVn?=
 =?utf-8?B?U1RRSVRjazZMK2tBb0N1UTdPVldTNEhFWjEwblhxaEY4TENlbGVRK1gyWVZH?=
 =?utf-8?B?eHQrL0xmUHBTTXhtZ05tQnFuczE4RGVmb3RsRURRYWJqQ2FQRGVLdjRpSzd6?=
 =?utf-8?B?YUlmRXRtMk0xUFZKSktLaG5meFNNdXJObDBrZDlvTEdySldwMFdyYXA0RTNi?=
 =?utf-8?B?eXduTlpkUzFLN0V6Z1NldEF2cHVXVWV3ell3VzBOcDRDeVVXeHBNZ290Umcr?=
 =?utf-8?B?a09Gb3NnN0VTQVpRanpEMDZNa1UvNnIwSnJGeHNEMlA1eUNEeUtwKzBXZHBs?=
 =?utf-8?B?Qkt1SHFoTUJBM3o5WDFWM05VZGFtRWJlbjZmWUt4OVQxekZ6UGg3dnc1c2ht?=
 =?utf-8?B?ZnJvUUxkVWdMYW1PYzFsRWlrSEdWWnN0WEVsTFFJSVo4dDNCNkpuK0hlU0wx?=
 =?utf-8?B?L2k3eGM2djdKeHJ3QmxyZVRZa0F6c0wxOUYySllsZkZxL0dYQWllL2VFcEpz?=
 =?utf-8?B?YnN1aU5aNWFjK1VXM3cyUWNaMUJhZHJwM3ZJRTNobEVKa05oS3dPN3I2ZnpH?=
 =?utf-8?B?Mld5UG5NR0tuaFNEL2xIb09vVGhBNUpOa3FTVnY1TFpNbUlMUzRFcVhFUStt?=
 =?utf-8?B?Q2t3dUU4U2pIKzhPdWFWV0NmS3BURXFNQXAvVlo5NitwQUdzaG1ZU1JPdnJr?=
 =?utf-8?B?WWJIYXJ3NStwTjB0ZjVveEJoZmpONVhQanB4VnVBeGIwMU9ZRWpocGxuQ21q?=
 =?utf-8?B?N3NoOGhVOVRBT0F4ZDlVQkNNK3djRW51RUVMcm9Zbnc4dzFRQVJrZWlDNndu?=
 =?utf-8?B?NFBHZkovRGdEbElaSkV2Mll3bFZ1ZmZLUk5vVUpXRXBUczQxT2M5M0UvbW1k?=
 =?utf-8?B?M3pZUkJOR3VycFhxZ3R6MGcyYnlEZFNrT1BWSnZ6YlZtNXh0blhwTWJsOWZI?=
 =?utf-8?B?WHUvNWt5VThHYkI4bFNLTVRsRnZDWm9zUnozWExsQnR4amc4U2NzVFlIRFRV?=
 =?utf-8?Q?NlmDodGtBzFr59QJHrysbiV39QB/JFKcHUr7cBY?=
Content-ID: <4914202AB55BC348B3508C353F5ECC4F@apcprd03.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5062.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77a49dd3-0d12-43f4-4767-08d96926d087
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2021 06:49:27.6786 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: feWuG61BQnqB37ZmmsVDBnv4oiJ/iqvFKwLfKH/FsfkAhJ2NkR7mHoKwP4lBCM/zYp9T170/G2DN0YZ9ZOFOvS9jgMB02C4XK5c8i0Z1X7Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB6228
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210827_000007_784307_C81AF461 
X-CRM114-Status: GOOD (  30.02  )
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

On Thu, 2021-08-26 at 19:54 +0800, Ikjoon Jang wrote:
> Hi Chunfeng,
> 
> On Thu, Aug 26, 2021 at 10:52 AM Chunfeng Yun <
> chunfeng.yun@mediatek.com> wrote:
> > 
> > Use @bw_budget_table[] to update fs bus bandwidth due to
> > not all microframes consume @bw_cost_per_microframe, see
> > setup_sch_info().
> > 
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> > v2: new patch, move from another series
> > ---
> >  drivers/usb/host/xhci-mtk-sch.c | 17 +++++++----------
> >  1 file changed, 7 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/usb/host/xhci-mtk-sch.c
> > b/drivers/usb/host/xhci-mtk-sch.c
> > index cffcaf4dfa9f..83abd28269ca 100644
> > --- a/drivers/usb/host/xhci-mtk-sch.c
> > +++ b/drivers/usb/host/xhci-mtk-sch.c
> > @@ -458,8 +458,8 @@ static int check_fs_bus_bw(struct
> > mu3h_sch_ep_info *sch_ep, int offset)
> >                  * Compared with hs bus, no matter what ep type,
> >                  * the hub will always delay one uframe to send
> > data
> >                  */
> > -               for (j = 0; j < sch_ep->cs_count; j++) {
> > -                       tmp = tt->fs_bus_bw[base + j] + sch_ep-
> > >bw_cost_per_microframe;
> > +               for (j = 0; j < sch_ep->num_budget_microframes;
> > j++) {
> > +                       tmp = tt->fs_bus_bw[base + j] + sch_ep-
> > >bw_budget_table[j];
> 
> I'm worrying about this case with two endpoints,
> * EP1OUT: isochronous, maxpacket=192: bw_budget_table[] = { 188, 188,
> 0, ... }
> * EP2IN: interrupt, maxpacket=64: bw_budget_table[] = { 0, 0, 64, 64,
> ... }
> (Is this correct bw_budget_table contents for those eps?)
Yes, ep1out isoc use two uframe, ep2in intr use a extra cs;
> 
> I'm not sure if it's okay for those two endpoints to be allocated
> on the same u-frame slot.
> Can you please check if this is okay for xhci-mtk?
Already test it this afternoon, can transfer data rightly on our dvt
env.

> (I feel like I already asked the same questions many times.)
Yes, as said before, prefer to use bw_budget_table[], if there is
issue, we can fix it by building this table.

Thanks
> 
> 
> >                         if (tmp > FS_PAYLOAD_MAX)
> >                                 return -ESCH_BW_OVERFLOW;
> >                 }
> > @@ -534,21 +534,18 @@ static void update_sch_tt(struct
> > mu3h_sch_ep_info *sch_ep, bool used)
> >  {
> >         struct mu3h_sch_tt *tt = sch_ep->sch_tt;
> >         u32 base, num_esit;
> > -       int bw_updated;
> >         int i, j;
> > 
> >         num_esit = XHCI_MTK_MAX_ESIT / sch_ep->esit;
> > 
> > -       if (used)
> > -               bw_updated = sch_ep->bw_cost_per_microframe;
> > -       else
> > -               bw_updated = -sch_ep->bw_cost_per_microframe;
> > -
> >         for (i = 0; i < num_esit; i++) {
> >                 base = sch_ep->offset + i * sch_ep->esit;
> > 
> > -               for (j = 0; j < sch_ep->cs_count; j++)
> > -                       tt->fs_bus_bw[base + j] += bw_updated;
> > +               for (j = 0; j < sch_ep->num_budget_microframes;
> > j++)
> > +                       if (used)
> > +                               tt->fs_bus_bw[base + j] += sch_ep-
> > >bw_budget_table[j];
> > +                       else
> > +                               tt->fs_bus_bw[base + j] -= sch_ep-
> > >bw_budget_table[j];
> >         }
> > 
> >         if (used)
> > --
> > 2.18.0
> > 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
