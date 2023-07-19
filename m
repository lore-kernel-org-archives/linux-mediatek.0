Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07774EB64DA
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 08:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VF8ofKUT5qHRXr7yC8PL3EkIaPv+GP8WoCIG3n2qTI0=; b=wZdR68H+MFbsjVM//ge6De7PJV
	Pwghdx64PQ7gFZ7COVdNN+nk7qbj5JNOoI/50UFY4tvkhpFER6w1P354BmDfCEaZlj2kqxmDDdf9c
	TxSRT11mOwL1lsUfrx12TG7iGP8JZZC0n8Kz1fKJakQxb/3j1JF+yJZBy8YTIUgV3oHLhYnVJUyff
	C+VMgwdyNokpgBEOYZYtqEs+Wqb9BnBQM/f8Dr31Il5hCP2jFODozdjo7UeH6+4DT1nWwwm01GKbA
	5s7jtFguukm03/njJhosHiPTTiIVXRBnd/1kZQXqa2Bs4INI4VQ8to0kUA1LgVk2ARAQf9ijt3H1c
	jH36jz2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM2uc-006SKp-33;
	Wed, 19 Jul 2023 08:51:58 +0000
Received: from mail-tyzapc01on20726.outbound.protection.outlook.com ([2a01:111:f403:704b::726] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM2uZ-006SK0-36;
	Wed, 19 Jul 2023 08:51:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IUX4X0CdSpK35w+9J9pbQf3XkxWQMgwuL85rTrIe1Xxtmy7YyIVwVh+PEVvotclb3jk7Ze50/S2AR2MfqarBIg38VS8RTglpll9Vm0Z9hiJ5fX1VZnI7JyL9hB0fjWbsw0ZhbykSjySaY+8xScaujWtoAr4XEQdrizDhJ7SLyyCgYc5nEJFCKg6ISEhpJQxciFD3/54B8h28EnZNbczWSyC/p7FeI88/VjbuOXzQSuZVz6+nnNbfG9NiH/h6+gUcPD5k/kkd54hWiw2PNqU44S+XADx7Y5Xr/o2odF5oIcYw1dhnk9uK1rTl6T+uWMUPdSQwEIx1dz39e+5MDJbRxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VF8ofKUT5qHRXr7yC8PL3EkIaPv+GP8WoCIG3n2qTI0=;
 b=FE42YkzxlkncMR+wkNa0BRPahaRGDwZ/iNZGIUp7Ben5UITza0aJPv/pjr9Bu5BIfO2WGOlrx1sX+aWrT1aLVzrKnu/q8t7C9n3t2LzWvRt/9s9hfA1zVdlYNGZFCJ7xzvtpMEqC61W5Dp9LdqH8/t58fMxKyBVnq66RMXwzmm74KkxQit/VsdGxsQ/OcMUg0uivzHsG3j6X1yrw/veNp4z+HUrJER6Lg9x2yJR//BucF1pPusRm5ZtKBKpBoEQDGqknrjEJOpHvum7ICwTWZ2fb9kXOqEZrdblB5le3/0rXCXtzeZJPDaFIMjE7CEBqMxJAz2xGMMVYPI+QLZSY4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VF8ofKUT5qHRXr7yC8PL3EkIaPv+GP8WoCIG3n2qTI0=;
 b=nQlpxaOpvMelUJLH+sROgwu44ifNOWHyRS9LrDIWIcv5LB+OSRfvA0LIt7hZWqetjnkmnj7qqzECu/MsXqWlbpjC+7tVRKbNUgQW6ZsEy3lJeybpDdLTJW/7V5Hx8CDICZJpCak9nZtIXKxaQu5hdmg4jQwjpJGKdgJ5FbpYYwAOZQhYHMfpQmzzQcPwDPIJajeGPDZmtv/vYhnwumNwsjm/u6ctyJzSvGCRD4C2jVWNuxNLcFF/fpSJ7RWxOFiL0FUgoux7Kvm/OJpM5y17Iy0tWLH4YWyBKBp/L+/QReTV7TyvuKXsF8W5m/XMbCXyuIvOO3MG+tzSFiKx5KV9Eg==
Received: from TYZPR06MB6697.apcprd06.prod.outlook.com (2603:1096:400:451::6)
 by PUZPR06MB5587.apcprd06.prod.outlook.com (2603:1096:301:e9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.23; Wed, 19 Jul
 2023 08:51:46 +0000
Received: from TYZPR06MB6697.apcprd06.prod.outlook.com
 ([fe80::30f7:d30:53e3:ce86]) by TYZPR06MB6697.apcprd06.prod.outlook.com
 ([fe80::30f7:d30:53e3:ce86%4]) with mapi id 15.20.6609.022; Wed, 19 Jul 2023
 08:51:45 +0000
From: =?gb2312?B?wre67LfJ?= <luhongfei@vivo.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, Moudy Ho <moudy.ho@mediatek.com>, Sun Ke
	<sunke32@huawei.com>, Ping-Hsun Wu <ping-hsun.wu@mediatek.com>, Arnd Bergmann
	<arnd@arndb.de>, Deepak R Varma <drv@mailo.com>, =?gb2312?B?wre67LfJ?=
	<luhongfei@vivo.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>
CC: opensource.kernel <opensource.kernel@vivo.com>
Subject: [PATCH v2] media: mdp3: Fix resource leak in a
 for_each_child_of_node() loop
Thread-Topic: [PATCH v2] media: mdp3: Fix resource leak in a
 for_each_child_of_node() loop
Thread-Index: Adm6Hj9G2kTmpHtGUUeMsbcEfGfScg==
Date: Wed, 19 Jul 2023 08:51:45 +0000
Message-ID: <20230719085122.24387-1-luhongfei@vivo.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: TYCP286CA0214.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::10) To TYZPR06MB6697.apcprd06.prod.outlook.com
 (2603:1096:400:451::6)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB6697:EE_|PUZPR06MB5587:EE_
x-ms-office365-filtering-correlation-id: b7dc7c7b-627a-42dd-e2d3-08db883561c4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lZxGc2Y6ZddZd7GjMFwCn0rhPe4Uz3bU7KqiM0zNjRmuHtCFhrGbSTQKP7zhPaAf+zKUWQZItg5iPDJH28BHF9N/6D8db4At+GgxJM09wWUJsPlcX72woaEH7l5Xju7Eu6EcohA32q+dSNuuDqv7wQDmjkePCIc3ho8qEdgfyGnwsjb7X3Fet0bxkeWzCkIrogYwJFWFSKEwz1RWaGyGVNnFPwOqHuFNWf99Ul655F9ne/WmZHQSWscW+3bCb2N3qya1QuA8EB0NyzJUFVWma20i57TemaVV+m78GiTGDJdhG4i44RGXTS+i02Dsg67YOgVQtB9D78l7AijYTzYIbvcymYUKUve6xFOYEBzyj7jaihwSloQL+wztGBDoPurdla+kYpfyRI0YnhZ/VNgoBLRBghiqTjknPNbf/xHe3Dw0qTb6dE+BWrE8fiXWEX7NI6rvrJLJIs9Ow280At9bCMzNNfZNiVHooOEN8YksN0Pt2fZOfghI12e42+duTt6tZjQLb24K16l/WKU8y6AVZ+qjzj2o8EfVK8VrIyYCLB9/D3dWemyKOK2VZJzAD1TkM9EPoi/QHGt6aF0U5YvzX0bt/fXNLbv6UVikDmantbTpds1vaTxB77ENCD7E0zjs
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB6697.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(346002)(136003)(376002)(39860400002)(451199021)(186003)(6506007)(1076003)(26005)(107886003)(7416002)(2616005)(110136005)(478600001)(66556008)(6486002)(41300700001)(316002)(66476007)(66946007)(66446008)(71200400001)(52116002)(6512007)(5660300002)(64756008)(8676002)(8936002)(4326008)(4744005)(86362001)(85182001)(36756003)(38350700002)(2906002)(38100700002)(122000001)(921005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?RFFaV3k3NUVPTXM1UXE1MnIyam1CZzFyNVoxZCt3RmdNeHl3blFYL1E0c2NL?=
 =?gb2312?B?aXhaZ1NSajVnN3VQVkRoL2ZzK29EUjBQUE92T0NudC83QXNnS0xSVHk4VjdI?=
 =?gb2312?B?bmdhWnYxWndJUXJyOUgvVXRleFhOZGltbjB6WWdCSjQvOUovTWtJK2lFK2dQ?=
 =?gb2312?B?VENoTm44NERla0tyNkV0NE5Ka0NGd1ptV2dxRFdkYnVnNWpCWURFZ0FiUity?=
 =?gb2312?B?MXY5a0xub1VuVUhrOW5RL3hJUWdrMEluUmdhd1RPTHRwd3VKYTdMeStucTlJ?=
 =?gb2312?B?K2VkTEowZmY4NEpBVm5hTFRKSVZ5SHdIYUVoMTV4amluWWhXM3YyZXFRK0ZU?=
 =?gb2312?B?WWlSbzdpWUZkMUM3ZDNHbTNIK0RKSXpoZjNoOU03ai9sTklYUW13VCtlblUy?=
 =?gb2312?B?aUhGdFA0R0I2U0ZITlZXaGRHdlJNdVBxTnpEd2RmQ0NkK1pBSElUeDhicFEx?=
 =?gb2312?B?S21YYkNaYVV2cUMzeFBNUTZ4QVF0YzcrRVBnb1pQNkMzYTN4UWZDczJucW4w?=
 =?gb2312?B?Y3REdlNSbUVsRkJzV0xINFcxUGRZaFVsWlAyWDR6ZXNpN3NRV25laTBUQWJm?=
 =?gb2312?B?V2pGeVpkejV0UlgyNk5GSlNBL2tYMVRveVN2azRYV3h2b1d6QUMyRDg1Mmoy?=
 =?gb2312?B?RkJHWDZ3NGVrQm1FQTk0cklkamdFZXdaaTVKaDdIak5kSVA1cGY0TjBNQm1O?=
 =?gb2312?B?V3M2dTRVUlEyQjFOVEVUYVRxeWpMUnZpRU1CeGZDd3ZmL2FlVEhyWXFTWlZT?=
 =?gb2312?B?Nk5qdUV0YTcxOFhsWlBHQjE4T1JpL09kWm9hQ2t5SlJhMlZpeVc1cGRiaDg0?=
 =?gb2312?B?dHRpSGJaNG9oam9JTjJjR3ZZeCt4YmpndGVOS1A1dis3dUZQZnY4cGN6NUcz?=
 =?gb2312?B?R2d0Umg5VTd1SVJvZTBxMUZJajBVV1ZoSENwNFRWUno2THNzRmlnT1k5R3Yv?=
 =?gb2312?B?MFB3RHd4NnpvOTBJVlRESXVIWElNYlZZKzhXTnhSUkRxcERMaHNGSnBKL0FS?=
 =?gb2312?B?aVRzR2lmV05SbWNWcVNndmpmSStIbTR1Z3Q0UnIrU2dTNEQ3Q1o0NWJON2ZS?=
 =?gb2312?B?NjREWkg1MHBYRkVwVlk3cUcyai9YT1Uza2gzQmlBdjhBNTRaTzhoV1VWbEVI?=
 =?gb2312?B?WXQ0VTBqdFNlSUsvenE4WEJ4MS9saUxFSWZVcHNoWjJ3Q1V6Y05UWkNsNkgz?=
 =?gb2312?B?L25vOFc1dTBxNGpMbEdNK2VxN2RseHBOZTZFY1IwN09hM1BSdDhDWnhSd2xn?=
 =?gb2312?B?ZEp0eWM2Z0ZDSU5WT1orbUplQkV2U1NGNytpY2txNTd0TGNKYU9oR281VDYx?=
 =?gb2312?B?RlgwRE1TcjlkUHhuSElHb3diY3kzbk9McWZzMG4xUlRhVGFJM25QWFNUMVMv?=
 =?gb2312?B?KzVGYW1FTnE2OFhvOG5RajRXbDl3aGNCK0VwSXNiK2VJa05QYzRKZXhwbG5n?=
 =?gb2312?B?d25ybExCVDkwaktRQ29KRERIL2o4UTZmN0lmeUhic0xYS202Z0dLdnZQam5O?=
 =?gb2312?B?bm5aNTN6MjdpSXJoeHpmR0FGUGhJS3gwc09mY1RpcVY5WWNLTXZFWE9DRE1V?=
 =?gb2312?B?WDJXcUpXQks0U0MrL1Q2VnhPNWE2QzJ0U3VIY1M2ampLei9hQlNoclNhL1RD?=
 =?gb2312?B?dFN2RElFbGQvUUk5elhsNHhnQjRPMW5taC9BM1g0MkNVMkw3R29MeHFJWHFD?=
 =?gb2312?B?SS9aV0ZrSlpvL1VFUlJZa0lIa0NOMStkYmF3ZjJoVUJrem1DV0kxYUVhMXcy?=
 =?gb2312?B?Q2ZZQXJiTm1DRE9FNit4cmJscUNhaVBhbk5MZTF2RFVQbk5LR05PYkpjMnhp?=
 =?gb2312?B?TzdoNWJzdnM1Wkx3VmV0bHhaQUsyWFNLZm05ZVRENld6eWFQdUxvTGpocXZM?=
 =?gb2312?B?RkdCOTk2a3luc2tTb1ZZeVVndytQU2RNR0tueW5EcFZJQm9iTXgrR2ZqekpV?=
 =?gb2312?B?QUJBQlcxa0ZBQUpQbkpFeHFsdzUySkVUZkNMUElrTmY2dVo2cFkvM2s3NDAv?=
 =?gb2312?B?UlA1K05iaHRvMEYzZFoyaHBmYUIxMG5DaVdEZjN1T2tzNDN0d3RTYVhqamRk?=
 =?gb2312?B?Ujd3Qm1oSHoxenhNVFJkUnNuNFlkSWNlZjlReFVmTHRvWlFiOVdGdkltV2ph?=
 =?gb2312?Q?dY8AssiErdZLXF1VBwcsO02nv?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB6697.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7dc7c7b-627a-42dd-e2d3-08db883561c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2023 08:51:45.7568
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T28BIHUc8xjJAbjUbG1e4J5zTyPTvkrJ8CVdaci1XuS6WbJQpb4OmVf1otZ7j244RoXwd7c8W3rxygmsnhQhLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB5587
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_015156_020080_74DE92DB 
X-CRM114-Status: GOOD (  11.27  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Zm9yX2VhY2hfY2hpbGRfb2Zfbm9kZSBzaG91bGQgaGF2ZSBvZl9ub2RlX3B1dCgpDQppbiBlcnJv
ciBwYXRoIGF2b2lkIHJlc291cmNlIGxlYWtzLg0KDQpTaWduZWQtb2ZmLWJ5OiBMdSBIb25nZmVp
IDxsdWhvbmdmZWlAdml2by5jb20+DQotLS0NCkNoYW5nZWxvZzoNCnYxLT52MjoNCjEuIENoYW5n
ZSB0aGUgc3ViamVjdCBsaW5lIG9mIHRoaXMgcGF0Y2ggdG8gaW5jbHVkZSBkcml2ZXIgbmFtZS4N
CjIuIFJlbW92ZSB0aGUgdW5uZWVkZWQgb2Zfbm9kZV9wdXQuDQoNCiBkcml2ZXJzL21lZGlhL3Bs
YXRmb3JtL21lZGlhdGVrL21kcDMvbXRrLW1kcDMtY29tcC5jIHwgMSArDQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3Jt
L21lZGlhdGVrL21kcDMvbXRrLW1kcDMtY29tcC5jIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9t
ZWRpYXRlay9tZHAzL210ay1tZHAzLWNvbXAuYw0KaW5kZXggYTYwNWU4MGM3ZGMzLi40MGM0Yjc5
YTUwOTAgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL21kcDMv
bXRrLW1kcDMtY29tcC5jDQorKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL21k
cDMvbXRrLW1kcDMtY29tcC5jDQpAQCAtMTEzNSw2ICsxMTM1LDcgQEAgaW50IG1kcF9jb21wX2Nv
bmZpZyhzdHJ1Y3QgbWRwX2RldiAqbWRwKQ0KIAkJY29tcCA9IG1kcF9jb21wX2NyZWF0ZShtZHAs
IG5vZGUsIGlkKTsNCiAJCWlmIChJU19FUlIoY29tcCkpIHsNCiAJCQlyZXQgPSBQVFJfRVJSKGNv
bXApOw0KKwkJCW9mX25vZGVfcHV0KG5vZGUpOw0KIAkJCWdvdG8gZXJyX2luaXRfY29tcHM7DQog
CQl9DQogDQotLSANCjIuMzkuMA0KDQo=

