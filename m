Return-Path: <SRS0=sikH=NS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 377E7C432BE
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Aug 2021 03:23:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D91B960F39
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Aug 2021 03:23:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D91B960F39
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5QBXrn/NZvxFNdYoSfoOXlRn5Dab8FGh/4QCwkFCy50=; b=o9vQzlgPw8hfoQ
	+Ippp7FzF1QS5an7WmIT4uS+fXrkoXdXgmlV4l1UkKd5+l/B9Ivl4f9su5joPjP/kT4llrG7E0bQe
	uIC4s9lmN3sYo/MTswfkVJeK8hkeJ4bfcjshYSMTthp9K5tmbJV6JYARwco593AlIfxN1Mklo2wPi
	eOXoxAkHVvC68SVBvvPhQ6ZcNA1mLimzZTfTpUraDk3a8l/uV8WrGn6fI1P8iadypKX1iyqNn2kK9
	NCB2RRrvqyMSSrtSFwnQscRE792LKXbDYc9O2rAR/iRHu1gSh1RKWTyuAW0K9Lfnx9NEXOlxfvl/Q
	vr5XmzGNwMu2dzqhhHEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJSSz-00BPql-F0; Fri, 27 Aug 2021 03:23:41 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJSSj-00BPpG-7w; Fri, 27 Aug 2021 03:23:29 +0000
X-UUID: 33a9330cbd584a4dbf68d92c27274bbd-20210826
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=TjMYclzLBVDiV5yAWoJeSAWDgVpqRzqWA0X1kGK/fGs=; 
 b=aq91Sqm1d8b+NHWOjWeIzIHy11x9eFEo0vTu+qdTnb7v6wbB3OTxVKVNUM0ZyhnfGWNVVzxeqkvSSGG40OOK83KBmMWf8faTs1DR/PbNVXV9bJ9Y0VzXZE3txUS7SJuO/B10XaVHh/WaflF+T9v8de7DUfyvZR7IfqmQeNNwSw4=;
X-UUID: 33a9330cbd584a4dbf68d92c27274bbd-20210826
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1864486103; Thu, 26 Aug 2021 20:23:18 -0700
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 26 Aug 2021 20:23:16 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 27 Aug 2021 11:23:15 +0800
Received: from APC01-PU1-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.792.3 via Frontend Transport; Fri, 27 Aug 2021 11:23:15 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sco2SEedYlFzsj0mciARcGBQpqBx3y56lHhOGb8F4igP9Bel7mzQ6yyW4n6kBpZEwas+BatlOSHKiSQodwKffIrHs1A3sRz2d9TZ44w0aw2AOUKzrGyh4nlMTvbW1hicBvvJl65qgGzp6vPZxqqMtIQY3UuKnUijSUJiaoz38/npRIQG1sQZcBn8fmBiZqiT3+DcO0y6paO2voAikvsPbPJHD809jQcdo5aFTqv1dA3Xn4HstyKzheH407YTcxQYMhJEeF3Wvzk8aJmLBHjstPSFDuzxn0eptQEKDf4vpy3C+/l4UyvgMmtrDuoB9np9YOpaXMhvbgSWx/7tpsC2lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=TjMYclzLBVDiV5yAWoJeSAWDgVpqRzqWA0X1kGK/fGs=;
 b=fatQAB3K7WafASvzr3XEPW+ssxtQU//LO/3qfhDlw4tvTs13CsGPZNITYnJ5o5OnbBpOHUkMjzq7A7f/My3JJFGZ6izfxMEl+E+BiTCygvmLxytm+uTGe6wpd7TVMpHLT84zJEPlRm5LBQ3ZliBWCAJ7Xy+QNehqtHPOkdDyg6AM1YU/Y9Da7JB3CGXGrio2SSzADuOnnAa8H/SJ5ZtF+YQ/3gon0UZYF1O9MaE6e75sfLHlMZVYwF6jnBaBcrpArNTL97cxsxShIavywj6zyPRbGBE6wasnfdGbCCU3rChWX9eeNA+qeJB+vazY451yerQc9IoSSM6pjmr/ivWb8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TjMYclzLBVDiV5yAWoJeSAWDgVpqRzqWA0X1kGK/fGs=;
 b=QRpA8VNSAGGvBcDl1PYMO8wUJ+y5TwtPve2EP1ZRxcPh8h7f25JnyZDG+CkHDwLzobIAZYDI6oD/4CQhWK2I57sm8/eHFKlUS4dU0F6C9s8as4si4D8YCqY3zNBNTx54EYXLdDtA1wOzf0gIWLf2QE0l/zBM/yZxqm3K4lj5ldU=
Received: from KL1PR03MB5062.apcprd03.prod.outlook.com (2603:1096:820:1a::22)
 by KL1PR0302MB5298.apcprd03.prod.outlook.com (2603:1096:820:4d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.9; Fri, 27 Aug
 2021 03:23:04 +0000
Received: from KL1PR03MB5062.apcprd03.prod.outlook.com
 ([fe80::1898:f611:33ba:b58c]) by KL1PR03MB5062.apcprd03.prod.outlook.com
 ([fe80::1898:f611:33ba:b58c%7]) with mapi id 15.20.4457.017; Fri, 27 Aug 2021
 03:23:03 +0000
From: =?utf-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= <Chunfeng.Yun@mediatek.com>
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 =?utf-8?B?WWFxaWkgV3UgKOatpuS6muWlhyk=?= <Yaqii.Wu@mediatek.com>,
 "mathias.nyman@intel.com" <mathias.nyman@intel.com>,
 =?utf-8?B?RWRkaWUgSHVuZyAo5rSq5q2j6ZGrKQ==?= <Eddie.Hung@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "ikjn@chromium.org" <ikjn@chromium.org>
Subject: Re: [PATCH next v2 1/6] Revert "usb: xhci-mtk: relax TT periodic
 bandwidth allocation"
Thread-Topic: [PATCH next v2 1/6] Revert "usb: xhci-mtk: relax TT periodic
 bandwidth allocation"
Thread-Index: AQHXmiVazC+quBfOAkq2QLX4yDaH/quFqkeAgAEHGwA=
Date: Fri, 27 Aug 2021 03:23:03 +0000
Message-ID: <a806a06ae1eea932240ff98291cca2a9c7739b16.camel@mediatek.com>
References: <20210826025144.51992-1-chunfeng.yun@mediatek.com>
 <YSd93+3D/PbacgsP@kroah.com>
In-Reply-To: <YSd93+3D/PbacgsP@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8760201e-a817-4d5f-7375-08d96909fb14
x-ms-traffictypediagnostic: KL1PR0302MB5298:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <KL1PR0302MB5298E0A8AD656B3B079F32BEFDC89@KL1PR0302MB5298.apcprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nna+xVejXCirll7CYXbz9dM84YRLggm8sjJOoTytPdDGb3Z5U5g4WNDHk8GkFYs++4ztmPDihxHBcXwDVFN9HYgP64RmsGd7iGgaxL1oKUZqgHpc5f2tCTqzVCEQc39yZd2KjwEAYqYe0BEGNt9aIMaXU1k21WcWMr8QHBOqy8q2d54IEPNSQZqZHODrDbGDqHeTxGrbqFt9YZShSWGTs0zeGFiVfW+3ZUHbIEhKZjoXjmeM4vdoObLcORU+Y6z6uECfd06ExikC1QWXxVqfNTG8OMiqUnllfNKpPWp6f6ZY3jm1/gA/3UoC40KD3KiihHvRnvKm9IwIformqUNHyKvGkOYCp8K7rdLG8NgfoPLZEVv3HrybpbEvRrQHg46bkMcdkKo7G40P0GSN+9YF8Wy2f0eCQh6CykMjlihG+/Yg8wa1LJ5jCRClmerNxE6DmQOCVJzbfZEXJfxqRzkNr/izpNilG4rydwiIkb2X0aB6pWIz4lnRvKOW5YTF+XjxPlw7NCqHSvoOfwh4tZ++BBIbGku7HR0Z5o9wRpyAFFkJ41RMnxINsoa+m7NGDNVhsLOHKpAZNmL1E1Htd5J8b6oS65TTaEb4EWunq8tjPe+BTMjd9Q8QTqCyKPuVDMqNQS1fttgUFqAMtFYuHSd+Ku/YuS9GyHye9IeQNqj73RdmLdqXBqXPvGE6snrNAXNDY563hI6dv9a6SXXkoryyre4Lxxh59R9v+yHM5xH43gO6NEFT+/qnr+bKN3MFEBtu23kpssNy57p+/QFRtXj6wSMYumL3QWWQhwYJME5HwkQL4htiXSjqRpjHUNtYFawyGyuQ8dXPiNUZHR+05vDiRvrLSc3spmbKm3TLjB9oSTI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR03MB5062.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(396003)(346002)(39860400002)(136003)(83380400001)(6506007)(5660300002)(6512007)(8936002)(36756003)(4326008)(38100700002)(122000001)(71200400001)(26005)(38070700005)(478600001)(316002)(86362001)(966005)(186003)(8676002)(2906002)(6486002)(85182001)(54906003)(2616005)(66556008)(66446008)(66476007)(64756008)(66946007)(6916009)(91956017)(76116006)(99106002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aGVLSVFKZ0YwKy9uMThaOW4yZ2E4M0pXa3laZlBudno3MEZuRGw4V04yTldE?=
 =?utf-8?B?b1hhWW4xRGo2LzhWSUludkJ3cFhYR3BZSzVrT0pqMWxvRko0Nm1TRlFvMm8z?=
 =?utf-8?B?YW9lRURpaWdKOEMvNFdYS3FXdlRKS09vc3c1ZW9FeE1naFNKckx5OTRsdDJk?=
 =?utf-8?B?SXovaXMvQUJUZk0zblMwSTdKcFhPSFZCdkZIT2EvSkJEMWJ0LzBTSnU2cjlQ?=
 =?utf-8?B?Y0JrN1lqRmhoUEZaYVJycEVYVi9wc2pkd0pBUzZHTWxDaXdzNUQ4Q05weWJm?=
 =?utf-8?B?aDlEbWxuTWs4Sm5GRlBLdDNjQ2J4MkN2Wk9sSWhMRFQwN1cyWWt1MFpIeURa?=
 =?utf-8?B?elJsMEFubTd5NGZWZHZteFdNTDdoSXYvcld4anB6VDZuY29HMEcwVnV0U0ZG?=
 =?utf-8?B?bUxmbmkrTnpKUmJpSWdwRko5SWhhTVF0OWF0L29GZVA0bzNHNjNRcUVWNDdY?=
 =?utf-8?B?QXFJVG5Sd1pMRUtSRzMvOTdzTVQ5N1FoQkRQUW5oc0NQcWM5WmErOE5NbjY2?=
 =?utf-8?B?Z2ZqVUdFMlRGeVJzaVJ4djh3Qnh2ZXN4c1M2a2ZnOGFMVHJocllQaUpmTk9H?=
 =?utf-8?B?MHN0TzhKYXhwbzQ1VytNYml2QXBReUV5cjVVbTc5MXRmZ3BNNW1XdHJzVHBI?=
 =?utf-8?B?MjFEZktoVE1rNmIvY1ZxMjB3bUQvN1NucUhrb0RpWG5JLzlvSmRJblZqejFJ?=
 =?utf-8?B?V2pFMkxGcFVKL3NzR2YrMlVFclFNTlorbW1TeWNQTWsySFpGNUVmTDV6Q0N6?=
 =?utf-8?B?dlVqL0c0cHhXNWZSTkVJeVBhZU5WU24yKzYwMitBK05qekJEM0dHWGZobjd0?=
 =?utf-8?B?dnB3elJSMWRiRENVWXd1TFZ2cldHNTIrdFpYVGRObGlSMmVaMFJWM3Y5YlZK?=
 =?utf-8?B?MEVIZmkwaHZIT2dsdWVTS0wxN1R1RUowWmZWUlphVWI4TGhPTGZWbnEyVmNl?=
 =?utf-8?B?cWZ5cmdTc1hnY2JObE1CUGUzT0JLUC96RnNqODlpVG4vd3A4WjM2YWhqSEc5?=
 =?utf-8?B?dUFJQk45QWZieVh0MzluRzl0MkV1bTFsQW1qSkI3SFdSN3hXMXVQeVFvcHVE?=
 =?utf-8?B?S3R0TWNIRVVIRkplUG5JaDlNRG1YK3ZmUW5Wakl4a2Q5d21Mb2g5TTBUck1B?=
 =?utf-8?B?aVNKeVRCMEUyc1dHbGpDa0pjNENFZTJSeGZMU1pRVklGb2xJWUJ2S1dCZ0FB?=
 =?utf-8?B?WTI0dzM3OUZyU1Aralh4Y3JTVnI2Y1dPR2UrcmRzZ25OMVZ6V1lxdG1NT2lQ?=
 =?utf-8?B?dWI4WUtYMy9mU1hxL0tGTlJ6dTE5NGFCcnNvb0hTWUFOeVNtbVphTTlheUpB?=
 =?utf-8?B?QUpMcFgwVHYxOUJmdGxUblRFeUVrczFuUU93N3M5ZmVVdU9jQndZaVdxWEY4?=
 =?utf-8?B?alNKY1BkdFBVVzRuOU01RS9XK2lvRHFvOWFnT3IxVERBNnA5NkZMbk4yREJX?=
 =?utf-8?B?R01QWnRUa1ZQVlJCQ2NHaFIwS3pCWjlkeWZEdzl1MkhxZFY3QW5jbVBpL2h2?=
 =?utf-8?B?eVQwanJ4ckdLL3JzcTB1MU53TWJxaGZ0TWk2bXF6a2s5VFZ3UnY1N2RKbkt1?=
 =?utf-8?B?RjREQTFnaEkzeUc0aU5xOFBoNGJTNXNQWU40WTRLcjE3VWdGQ1BWNStwM3FT?=
 =?utf-8?B?blFJWWwwSW9aSWc3eDF2Wmo1OGFSWWZ3L282UE15bXAzektNT0E0TkpyUFNN?=
 =?utf-8?B?OGlkSHpiOFhMODdNQWsyV2dGSFNxaGgzaHlPaHhrR1JWbWVtNm1paWRSTjdm?=
 =?utf-8?Q?E3V0SM8M8mSuTNNlsVXGihRxVFNev9Px4DzIlPk?=
Content-ID: <0B00E55F60AC5F4FA02517A6E89DA39A@apcprd03.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5062.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8760201e-a817-4d5f-7375-08d96909fb14
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2021 03:23:03.4951 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6oSkB7aqyzhqJebNuzwCFA9pmYiP/OPqkjE9FYGAgVhYgsss+BBHk/mIOLzkEpS4GwhVo0b1D85/G7T8Wy4W+wJbf/BJ42QGHKgXZrFXIHs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0302MB5298
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210826_202325_335733_73D8198E 
X-CRM114-Status: GOOD (  18.71  )
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

Hi Greg,
On Thu, 2021-08-26 at 13:41 +0200, Greg Kroah-Hartman wrote:
> On Thu, Aug 26, 2021 at 10:51:39AM +0800, Chunfeng Yun wrote:
> > As discussed in following patch:
> > https://patchwork.kernel.org/patch/12420339
> > 
> > No need calculate number of uframes again, but should use value
> > form check_sch_tt(), if we plan to remove extra CS, also can do
> > it in check_sch_tt(). So revert this patch, and prepare to send
> > new patch for it.
> > 
> > This reverts commit 548011957d1d72e0b662300c8b32b81d593b796e.
> > 
> > Cc: Ikjoon Jang <ikjn@chromium.org>
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> > v2: no changes
> 
> This series does not apply to my tree at all now, can you please
> rebase
> and resend?
Very sorry, I send out two series [1][2] for xhci-mtk, but don't take
care of conflicts, suppose that series [1] will be applied firstly, due
to one binding patch [3] of series [2] is not acked/reviewed by Rob (I
think only need modify some misleading commit message).

anyway, I find that only one patch [4] of series [1] is not applied, so
I'll fix conficts and resend it based on usb-testing branch.

Sorry again.


[1]: Series = [next,v2,1/6] Revert "usb: xhci-mtk: relax TT periodic
bandwidth allocation"
https://patchwork.kernel.org/project/linux-mediatek/list/?series=537471

[2]: Series = [RESEND,1/9] dt-bindings: usb: mtk-xhci: add optional
property to disable usb2 ports
https://patchwork.kernel.org/project/linux-mediatek/list/?series=532595

[3]:

https://patchwork.kernel.org/project/linux-mediatek/patch/1629189389-18779-2-git-send-email-chunfeng.yun@mediatek.com/
[RESEND,2/9] dt-bindings: usb: mtk-xhci: add compatible for mt8195

[4]:

https://patchwork.kernel.org/project/linux-mediatek/patch/20210826025144.51992-6-chunfeng.yun@mediatek.com/
[next,v2,6/6] usb: xhci-mtk: allow bandwidth table rollover

> 
> thanks,
> 
> greg k-h
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
