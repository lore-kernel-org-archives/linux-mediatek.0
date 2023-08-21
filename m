Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F32C5EE4993
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Aug 2023 14:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7h0pGD0LfaEykNYmC/iP6rdLl2uB6GGBpeS22075GMM=; b=J+YQZGgtjzVwwHvHldp1yQLlpb
	gjVTMTNRi8zMuEdPV5dnzya8UoWAkZ7bSfWsx+H82jXr0/DBRmCM0vZb4M3MWSjtAg0Ikla79b5WZ
	MNVgh7NngBFdlcKoaWuxHm6kkTp3ugaTXXIXdbpYTjSn8aMjAE5McVqIugBJZxbI1nBF2QB0ESHFy
	rOxdSItfNFA67S127awMBpbs3JVJvmxpxYLXDzq8PBMk2aT6YOXstZ5Wh5J5sHFDhMhFWOHZIM1yQ
	rx4fBtpkR10256eZVoRQc+L6/J1xnINyqcZgra9eNiYS6KLcTkiiN5ZR1K8EMiKmWeNJfOYRjGKJ6
	mEClHkRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qY5jY-00EA2g-0W;
	Mon, 21 Aug 2023 14:18:20 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qY5jV-00EA1b-0I;
	Mon, 21 Aug 2023 14:18:18 +0000
X-UUID: 8ec3369c402d11ee912e1518a6540028-20230821
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=7h0pGD0LfaEykNYmC/iP6rdLl2uB6GGBpeS22075GMM=;
	b=r7zDE86d7RX1Z/YVouLYk0cD4UblOV2ges7opPn9lLPxNSr50Tn6gDBVj9Ap+WEE6VTCi3PKoyUF4UO/dQ0pkjU+NR6dVW9AEjUkD07Prvnzm4ybCAmY/g2kphbldC76/LoF4FWtEZgq9J4E67275cnsz8pIegu8jcLZ3G8az8c=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:6bf78060-8357-4fac-a78b-abd1ebfe75b3,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:0ad78a4,CLOUDID:e1d819c2-1e57-4345-9d31-31ad9818b39f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 8ec3369c402d11ee912e1518a6540028-20230821
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <sam.shih@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 77319399; Mon, 21 Aug 2023 07:18:10 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 21 Aug 2023 22:18:08 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 21 Aug 2023 22:18:08 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FfZcfkmHOd3sd3S1Y87HnLfoLs+20AvQKcixkzBrdWy16YfjJyKx3+1OJ/vJDUm4YCPWlgf7uGvvTkq8YHGjP5iz0PvnBz8iEjhjd2xyL2qrkDy0KFmrnpS3AFeld+MhySOH+vYcrwXKB4+JWqrq8l6rsW/a0XSDSPWlnl210bd1tfeD57/QWOLC7TQkJYy7nbDbsl0JJ7zHnXaGjJPE0FvPccOSRnMVaGkR4wRR0jrdlQNOO8SI0mDGmVB77Ixw/nwPsE1iSBC+kQHhhm1fPJ+g1A8H1X+6BwkmL1x1W9ZXSClv2EWc3uE5Qd0m9xurhsm+5KLlFc9wZuGT3gi9ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7h0pGD0LfaEykNYmC/iP6rdLl2uB6GGBpeS22075GMM=;
 b=m68gVfyODDXNU1+cqy+r2lkgYqOOO9X6sYxQKE2fPgy0bm4BOrMragqHlrIbW+cjszbbqXkPpnHEcMpN3U7e1JFL40PmixtX6+JO7bWDcW+OtNXu56KkWfKevDo7FRPsCatqwY+5H65My3/tjpucT6rTDCXwSzSEOQYv1tbSL/G1k5KItqTdVSLpZ3xGm3NF1rQcekZojIaLmHCyS9mf4TeGRYhgzGjHcMgLKw6wOUIniZ7Feb/9BlFBy6ZuPA61utrTnl1CPsGP5depfKunmGRuluhtJjwCs613WiO6eQak/MitcRQeVuGNnwkWW/FVuwxenN47ulBvfRTWjdGymw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7h0pGD0LfaEykNYmC/iP6rdLl2uB6GGBpeS22075GMM=;
 b=s99K28WLK8FxXKtH+CsWamt3z5n2+fGXEl/ube1KuD1ldocks/x6wBk+EwZAMM6saDxJ2S5Ve5cMJ0X0oYhYztMKDLDL2v3fMd0yiWZ+cnvBwKFDvVM0d0M91Gl3Ee0ytpizHXX1MEojIZaCfiF6k2QkFkOH9LlA8NRmjJDfvto=
Received: from SEZPR03MB7874.apcprd03.prod.outlook.com (2603:1096:101:182::11)
 by SEYPR03MB8066.apcprd03.prod.outlook.com (2603:1096:101:16e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Mon, 21 Aug
 2023 14:18:05 +0000
Received: from SEZPR03MB7874.apcprd03.prod.outlook.com
 ([fe80::266f:d96a:d719:cdc8]) by SEZPR03MB7874.apcprd03.prod.outlook.com
 ([fe80::266f:d96a:d719:cdc8%4]) with mapi id 15.20.6699.020; Mon, 21 Aug 2023
 14:18:05 +0000
From: =?utf-8?B?U2FtIFNoaWggKOWPsueiqeS4iSk=?= <Sam.Shih@mediatek.com>
To: "daniel@makrotopia.org" <daniel@makrotopia.org>,
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] pinctrl: mediatek: fix pull_type data for MT7981
Thread-Topic: [PATCH 1/2] pinctrl: mediatek: fix pull_type data for MT7981
Thread-Index: AQHZ0YCDi7rbchNQD0CAzO88jd8cWK/0lL6AgAA82IA=
Date: Mon, 21 Aug 2023 14:18:05 +0000
Message-ID: <7f25a5a59b790c6988ed54003230ccab2b941675.camel@mediatek.com>
References: <7bcc8ead25dbfabc7f5a85d066224a926fbb4941.1692327317.git.daniel@makrotopia.org>
	 <CACRpkdYpLkPp0-3rT5xxbzO9Lf35020Aid7QX6iqZGaW3C5x0g@mail.gmail.com>
In-Reply-To: <CACRpkdYpLkPp0-3rT5xxbzO9Lf35020Aid7QX6iqZGaW3C5x0g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR03MB7874:EE_|SEYPR03MB8066:EE_
x-ms-office365-filtering-correlation-id: 5436faca-3eb0-408a-f7b6-08dba2516fa0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9zPb/Rn1xYk4NUVfcdQ2xmT8egfadt8/4XW+q1+pCgP0yd/qwpzaqU0x8Kdxh5bWbUceLAPdVCs+wsIrxqZt8b6Yj/z8NLzus8ksyDiCYLM29QeC4HbImB8v5sJOmrb9rUO6rphnDDHUGJSxUUy1oLt2byujri6XAjPtwYSt8Pv+MpwqiH6cBErMLboDhRUPNjmG9uYCCWOqZ81XJpoUmLq7gUk8bswzM2ClMPQc6qrZ1z+jYumdGQ6lcmTkrIuRTKzkDzypn1q3ANJ/w4DNhndaJ+yh2DylPg0Ar1WdrmGppalD0eraJ4Q+B4o4BJLSIYlyQxiDLzlrLoMlqbEnWUAFSi56qtDWX4ERU21Cb8Ep03ddD/YUegyW2KSI1DNJBEQmawk3FpnwEJeHB57CjFIJiDhrDrArkF1pXuGAY//GAK6sK0bLEQMUiA3N7iQ+M8M1wZ0lEzwILBGjlspLhATfilLZdHhXTrYAilO4u7jmYJ75dtVCwdsZHKC0hls+Q3vo1uKWbafWRR3HhJZJ5OF+fIRcAzHjsfdgXK5PZbBCIarzGpEEYmAWyIkRsUGL4TzFeg9w9TrWRHei+Eq7Qrc7TbmFDoBRDiUo+yVOemBiwkPvWu9HdOd85GHcxXA2D6GZSjp7zsfZfChcLQOqeFGC3EudWn+zargajyK1x6sdtC+UUeKPJjl8Sr/52Ed5m1qafbfA5sVtcKQBSJ72Cb/tJYc+rsT5QQ186CfzA90=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR03MB7874.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(396003)(136003)(366004)(346002)(186009)(451199024)(1800799009)(2616005)(6506007)(53546011)(6486002)(6512007)(12101799020)(26005)(83380400001)(8676002)(4326008)(8936002)(85182001)(36756003)(122000001)(316002)(41300700001)(38070700005)(38100700002)(7416002)(86362001)(2906002)(5660300002)(71200400001)(478600001)(66446008)(110136005)(54906003)(64756008)(76116006)(91956017)(66946007)(66476007)(66556008)(99106002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aWp1MFhEaERHVnA5NHl1bmNsYkM2UXNFckZ2QXZpUG1xa21vaUZIbzNpNTZu?=
 =?utf-8?B?dDIrQUthd1hoOGI1UGZkR2Q1dWQzT0RJWGJJZHlRNE5mR1hNY3YyZEpQdVQr?=
 =?utf-8?B?WmRpZHZpWlUwRVFEdVZjcjJLcHJvUGd1NjF2dkJwNmpUUU45WWpjR2paQm95?=
 =?utf-8?B?Zm5PdHk3WndzQ1EveVYzU3A0bFR4cjV4ZHVmMFBUcnNvMmpxR2ZHbXRRZjJR?=
 =?utf-8?B?Ymt0b1UzcmRrb2VsOXIwY0s4anhhakNqa2F4UjBGcnphNVNVZzExTThhdFNm?=
 =?utf-8?B?YkVHdi9DRTZGUU5yZHRkYXJZUkUwcWhNVXlGZkpWbFRFTUpSZ2Ivc1Ztc0hL?=
 =?utf-8?B?dkh0b05TZm95UGRtTW5GeW11Ump3VlBpNjVocGZiWG5ab2VkWEV5dXVuWm9R?=
 =?utf-8?B?bHdXYWtpUUxvWlppUFdtTkRXY3Izci9UYU5UNlZ1b0hkZkt5UFM3b05nMUVY?=
 =?utf-8?B?OURWUDFWWXVGUm54TjVYbnNHTlJDdUtDRmRhZlhpWXRnT3B3Z1JQWTdTZXcv?=
 =?utf-8?B?T2pLU0hmZzRRZHFlVWpSUzNHTUVzVjBjU2pKeE5FZUNVdUNvbWJnMXorT0lr?=
 =?utf-8?B?TG94ODduK2UrWmhybWNOSGR2Z1h6NE8rZXZtSncyUHlOVXphc3diK1Jnd24r?=
 =?utf-8?B?bmpNbkxFcEFSbUgrNTd0cmFIMDFVTi9sS2trYzhidXA1OWpnYlAyclJGN3Er?=
 =?utf-8?B?YUl3c2tnMVYzTkZmYnYxL2ljSmhsNVh6aXhiVFBUQlZCcDRzUmUyM3VJZlNx?=
 =?utf-8?B?dlYrS0hTRWxiNm9OS3dSYUJKUGd6ZGtva2ZQL3lialBFL1pJQnJwSmxLa3F4?=
 =?utf-8?B?YlBkUzEvMVMzL2hWeHJZZWxyL09hVFFraWtwSzloMGp0cW5HQU00a0VCdHoz?=
 =?utf-8?B?K0x5UlRXVG03NmtPMGN3eWlTZXJocW8xZHhJcWpzdlAwTzBzTHhLb2l0QnNN?=
 =?utf-8?B?WERMUDJtTXFJRTdFQW9qT2VXT01WOXNNZnpMM0pUczlMbU1ZeGVwVUt0K054?=
 =?utf-8?B?eU5vUXBUVWp5UHBoMHR2blhmcVZFb3Vlb0R2RXBVU0pYM1VUK09aRlZKRTFN?=
 =?utf-8?B?YndHSDFKWGJCSlVVQ1ZpUVkxVEQxeEZPcncwZ0grZG5yaUFQL3YzM0F0TVBL?=
 =?utf-8?B?ajNzNkdWWE1DZ0FUdEMweDNPTVpuVlExQytEbEVHeWYwSUZkbnpZT0lPSVFl?=
 =?utf-8?B?d3IvNFhpVWs1a0Z2dGcvb0l4YnhPSEtRMXg5eUdvYTk0bmd4VGMvV3FmMXBU?=
 =?utf-8?B?T2MzMVp0WWVCb05oenZwWVUvSlFNSDJzZnk1eWE5Y0hjNUVqOW9ya0Y4RXo0?=
 =?utf-8?B?alY4ejdhTEtzckFSTjAwbGZzQysvbnFLNzJPazBVUDlCcjBvRWhiQzczUWE1?=
 =?utf-8?B?THdvd0praGNCYkR1aXRqTWptcW9XR3hTTlZsWGRuTVRlQkZLUDB4SWswb2pQ?=
 =?utf-8?B?ZFZzYnlUU1hzYUpuSlA3SVpUVGRLem1obEtmcHhhbmJvbm1OV1M2dVRYcE1w?=
 =?utf-8?B?bmN2S2lvUzRkWTR5ODVGL0ovUFkxYmE1cGk4Z1lGdlR3Ym5UYWVqcHk0MUl3?=
 =?utf-8?B?QzZ4bWlPM0JyNHZRQUZHd0hzMGlEa2R3VSt2NFZvVFhOYmRNU3oyUFZSV0NI?=
 =?utf-8?B?ZEFCSmZYRHZGOXRFdHlNK3lDT0JlSzVIWHJFdFhHUUxyMksvMFlPR1l0MGdj?=
 =?utf-8?B?ZElaVzRMRGRpSWxJT2pNU1lMRGJMYy9GTFZ5UWM4d3YzckdWYnc4SnZMbmVU?=
 =?utf-8?B?ZHRCNm0vSmdzbFlGMEN0SGFVL29PcnJneEZyZ1F3V2JuaTdwdTRNdXgya0J6?=
 =?utf-8?B?TXB2VGpuMzJ2ZHhkUE0wQzJLYXczTXpzN3RHMDZFb3YzcmRBcU9zWjJGZ2RO?=
 =?utf-8?B?Ykg2TTRtTEt4anE4RzV1ZVZVTDMrZ1dEVGJBYzh5RGNHT1I5NGg0SjhyWXNY?=
 =?utf-8?B?STB6eDhyeWwvOE9qQVBlMGg2eWRXVTBuQytPVmdmU1ZsS2VPVEpLVEZGS3VD?=
 =?utf-8?B?UGIxUktpMlNseWVBVDNPNUJpejRsSSs1d2d6N1k4UmlkdEN0bGwyT1JiRVk0?=
 =?utf-8?B?NGtRL0oxNGNrY3JMY05EVHAxek9INjhpVi9zUGdLWlF0RHkrc0JFQ09GekVY?=
 =?utf-8?B?cUxaaElVb3N6cHduVWxFMC93clRYSloxVitCVzlNVjlSZWUzZHlPenBNS0Ez?=
 =?utf-8?B?L2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F23FA8C55790A8438717DB980B6B2E67@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR03MB7874.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5436faca-3eb0-408a-f7b6-08dba2516fa0
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2023 14:18:05.1683
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eatyjXvoXxhtKvz/MHzsqjU9hlwNJUTavl5Yn5Yb6gdlwFO8dYdZQP++C//prQMy2FilUEQOhNPRZI/VqLqSjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB8066
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230821_071817_198063_DA4496D2 
X-CRM114-Status: GOOD (  16.53  )
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
Cc: "robh@kernel.org" <robh@kernel.org>, "sean.wang@kernel.org" <sean.wang@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAyMDIzLTA4LTIxIGF0IDEyOjQwICswMjAwLCBMaW51cyBXYWxsZWlqIHdyb3RlOg0K
PiAgCSANCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9w
ZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0
aGUgY29udGVudC4NCj4gIE9uIEZyaSwgQXVnIDE4LCAyMDIzIGF0IDU6MDLigK9BTSBEYW5pZWwg
R29sbGUgPGRhbmllbEBtYWtyb3RvcGlhLm9yZz4NCj4gd3JvdGU6DQo+IA0KPiA+IE1lZGlhVGVr
IGhhcyByZWxlYXNlZCBwdWxsX3R5cGUgZGF0YSBmb3IgTVQ3OTgxIGluIHRoZWlyIFNESy4NCj4g
PiBVc2UgaXQgYW5kIHNldCBmdW5jdGlvbnMgdG8gY29uZmlndXJlIHBpbiBiaWFzLg0KPiA+DQo+
ID4gRml4ZXM6IDZjODNiMmQ5NGZjYyAoInBpbmN0cmw6IGFkZCBtdDc5ODEgcGluY3RybCBkcml2
ZXIiKQ0KPiA+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBHb2xsZSA8ZGFuaWVsQG1ha3JvdG9waWEu
b3JnPg0KPiANCj4gVGhpcyBsb29rcyBwcmV0dHkgdXJnZW50IGJ1dCBJIGFwcGxpZWQgaXQgZm9y
IHY2LjYgKG5vbi11cmdlbnQpDQo+IGZvciBub3cgc28gd2UgZ2V0IHNvbWUgdGVzdGluZyBpbiBs
aW51eC1uZXh0Lg0KPiANClRoZSBNZWRpYVRlayBNVDc5ODEgU29DIG9ubHkgaGFzIHBpbjAgdG8g
cGluNTYgd2hpY2ggZGVmaW5lZCBpbg0KJ210Nzk4MV9waW5zJywgVGhpcyBwYXRjaCByZW1vdmVz
IHRoZSBub24tZXhpc3RlbnQgcGluNTcgdG8gcGluMTAwIGFuZA0KZml4ZXMgdGhlIHB1bGwgdHlw
ZSBmb3IgcGlucyA0MCB0aHJvdWdoIDU2Lg0KDQpUaGUgZHJpdmVyIGNhbiBzdGlsbCB3b3JrIGR1
ZSB0byB0aGUgcGluIG51bWJlcnMgb2YgTVQ3OTgxIGlzIGRlZmluZWQNCmJ5IEFSUkFZX1NJWkUo
bXQ3OTgxX3BpbnMpLCBhbmQgdGhlIGRlZmF1bHQgaGFyZHdhcmUgY29uZmlndXJhdGlvbiBmb3IN
CnBpbnMgNDAgdGhyb3VnaCA1NiBjYW4gd29yayBjb3JyZWN0bHkgd2l0aG91dCBhZHZhbmNlZCBh
ZGp1c3RtZW50cywNCkhvd2V2ZXIsIHdpdGhvdXQgdGhpcyBwYXRjaCwgYXR0ZW1wdHMgdG8gdXNl
IHBpbmNvbmYgdG8gY29uZmlndXJlIHBpbnMNCjQwIHRocm91Z2ggNTYgcmVzdWx0IGluIGEgIi1F
SU5WQUwiIGVycm9yLg0KDQoNCkFja2VkLWJ5OiBTYW0gU2hpaCA8c2FtLnNoaWhAbWVkaWF0ZWsu
Y29tPg0KDQoNCkJlc3QgUmVnYXJkcywNClNhbQ0K

