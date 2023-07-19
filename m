Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AC39C0015E
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 08:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VF8ofKUT5qHRXr7yC8PL3EkIaPv+GP8WoCIG3n2qTI0=; b=SAKMftG08TCGV3s5eFwgGgOPXY
	VhJ62/hcE4neu/Enq4vTpqyrb60edDMM51c8q3ZrhFuPJqffCgvpghZFKQHfs5kFn7TCbwh1YTZix
	BjBqpqhVhI0ldrz/Raf3zUHgZ97jxwKQoBsJX79w5wyuD+NnFADYv9qoT+w7T2HAljbhcwT2WQuvj
	QukFLZMLGyuW1u8dGWCozWz/h49dF3bqY3Xt5ikxohwUwCsrWHc+yXUJrW2IEBYh3bCry6er/LsNA
	dLdhM4pbXfbDXzasAiE8BWHDhDHoCyhyKPmYdSOkKA5z5VT11MbyCELl4y4XBtQ+0z6dx4u8wiMyO
	ADx/nptQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM2D5-006DsL-2p;
	Wed, 19 Jul 2023 08:06:59 +0000
Received: from mail-tyzapc01on2070c.outbound.protection.outlook.com ([2a01:111:f403:704b::70c] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM2D1-006Dox-2q;
	Wed, 19 Jul 2023 08:06:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AW4gD5AzPe3LwDDmRzKcuO3ic9oyU+gj5xF5Oivyr/JRvtAeKD4EfDR0qQu8W/1bJjW34PT00ALqdyVIDtN3jcIR6PkrvClL6aB8wyRXxNYbwP5ytm+LvZSdIZkNOUCp7+6qwSOxbtfAy4FbtqRRsg4qqn/pAGBKwy+ZAegMfgHrnVQjnNHbUOgHbtRGh89hK9hbnQYZvBh+zd5+T+y9Fs8vnxAnK1EF0NUnpfGNPg3yh8ila8yb3DPKUf80DI/3XDSCHCNg005LgeST41cF/FyUoyS8p+QqVvsx1yJ75CsfTwj28a9ofKgvkLLZDkNikxd2brqyEc2IKGQX88AKuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VF8ofKUT5qHRXr7yC8PL3EkIaPv+GP8WoCIG3n2qTI0=;
 b=MOSLGRlc4+zmdcgHzQkbcl1yVnLYmSKNmuJJR9rHaQb0bf53qrpqGKnfXat+fe9JXYHK3AeY1TRJM9PbRREWOhArqn7mzdtL0jRbc9KH2WlGaSgMcqlA+3GinGdfA0Fmq+Nwo92aToyHXDYb4lt/Fut1jrd9QdJns5cq6svbyGpe0lKYkBeb/dDUyig5GNVsyBQhYpvLIlSmHjRv7/WpDuKFo6XO3Ue2mWH3zCxGjGSMtUSlcFhlzT/xQSRORqNRixuJ+sjiTjOG58oEfFnmPxvhds9g20/APxPUJwbqOgFK49smrx+mNLMeV+H29ks/4f0apkO4KZ+CpraYRXMSiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VF8ofKUT5qHRXr7yC8PL3EkIaPv+GP8WoCIG3n2qTI0=;
 b=XE2yPY+mZypC18J7n2BAJdxtlsT1K5Mqv3XYUBquIa2mekrHrNuk/dtxIaJdjwcfoDReVOASBix8zS4kSQPbK+hDw2PuTYP5IY9994k2kfii9UqVMbwjxhOg3TgCpfRRUCq2cSBkAjBWJY/gtOTid/xvzV4dpXauBeA+FKFkj/zgbJovREMA6h8c0qgN7+uQra9D4tv4tvKBeC3MAhgOqeyFW6taaQlXXsxfU/+y0azWmkHPRdAgzimrRLz5OcC0T7GTS0rcQEONfKhbtfukC7RrzKnTnnDSWUbWxpQq5OSGX70M4EWospsgB4otcgK8MRhU25J/TEHNTnrRwxx8kg==
Received: from TYZPR06MB6697.apcprd06.prod.outlook.com (2603:1096:400:451::6)
 by SI2PR06MB4011.apcprd06.prod.outlook.com (2603:1096:4:ea::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.23; Wed, 19 Jul
 2023 08:06:43 +0000
Received: from TYZPR06MB6697.apcprd06.prod.outlook.com
 ([fe80::30f7:d30:53e3:ce86]) by TYZPR06MB6697.apcprd06.prod.outlook.com
 ([fe80::30f7:d30:53e3:ce86%4]) with mapi id 15.20.6609.022; Wed, 19 Jul 2023
 08:06:43 +0000
From: =?gb2312?B?wre67LfJ?= <luhongfei@vivo.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, Moudy Ho <moudy.ho@mediatek.com>,
	=?gb2312?B?wre67LfJ?= <luhongfei@vivo.com>, Sun Ke <sunke32@huawei.com>,
	Deepak R Varma <drv@mailo.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>
CC: opensource.kernel <opensource.kernel@vivo.com>
Subject: [PATCH v2] media: mdp3: Fix resource leak in for_each_child_of_node()
 loop
Thread-Topic: [PATCH v2] media: mdp3: Fix resource leak in
 for_each_child_of_node() loop
Thread-Index: Adm6F/SE4RTkuQkWhUizu/QRDyLU6g==
Date: Wed, 19 Jul 2023 08:06:43 +0000
Message-ID: <20230719080632.13357-1-luhongfei@vivo.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: TYCPR01CA0003.jpnprd01.prod.outlook.com (2603:1096:405::15)
 To TYZPR06MB6697.apcprd06.prod.outlook.com (2603:1096:400:451::6)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB6697:EE_|SI2PR06MB4011:EE_
x-ms-office365-filtering-correlation-id: 3b7e22ee-0c12-4b59-1ab6-08db882f1702
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tnZPsdZuAO57gZWSRS+sGP97YWlfYkbCVClL7hACBq5XVjd1ESOJ7CWqaeDjQdSKnGWUn8vSzD38pseWpA48SNc91CD4iB2nhZK2XyRp387a8s2OdMTmQ9PFNHkE2ZUcgUzTncotjlMcVAg+0uEDkWCAwYYBE0mMH53kMbo9RJQHLWmr8ugbbUzb5noE5pUUszfzyvmqunegul2GR1s5DGr3ye2rbX5+Zw5fQ7/+/iesl4no/LU3a1DYE0gnOxNhx9I3ePCUrw3lk/upGTtmPGCXsxSt57CsQOkN/SZ4uo/lQzNiDWHHW6abZbAENE9KPJIuNGgT+8BG8jSNd25MTVzgrxM3nTnzeIUkaXH+FbPTpQjVyKaugoABoW4Onf91xe/7jXJ+UqysaTY6nbOUGLQARG2ynnQpU+i2YtuT4xChPBfTeq8diTGFhEPYvmFil8OtLbtze/Nf+r+du9GUWsBmNCd5sw97K8qS+VCoy5PhjU4t+oyWzxmCVsU9tht9YigMB+yBUgn4pY0VrYisifbPtYnzPP06zTAQfyjPVMJz5o6w/YX35YkhB+rt2iCA1PU3uuIvNUrk72H4uaaGHN+wMv0DNqQWscEbaHoNehVds7qv+VYNcXQJ1C73+nff
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB6697.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(346002)(396003)(366004)(376002)(451199021)(52116002)(6506007)(26005)(1076003)(6512007)(107886003)(110136005)(85182001)(38350700002)(36756003)(38100700002)(122000001)(7416002)(5660300002)(2906002)(86362001)(4326008)(4744005)(316002)(41300700001)(64756008)(66446008)(66476007)(66556008)(66946007)(8936002)(8676002)(6486002)(71200400001)(478600001)(921005)(2616005)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?eE5GcWxiWXEzSTFMb01Pb3V6MGtKd3N1RTZwSTJndEV4SEZFY0VvemkrUWgr?=
 =?gb2312?B?eEthTEl0blJ6ZHhuaWhIUnFvaDhWdndmUUd4RnB5K3dDaUpERmlGOXk4cHYy?=
 =?gb2312?B?REg3UzZDZ3dvUjI5SjM5eWVOTFlxNGdDSDdkZXliRjNobmw3NHRlS0FoVkVR?=
 =?gb2312?B?QS83ZHZ3TVJaTFNta0RwdTBYRkg2L2RBZVFkKzlZeWRNNy9reTNCRm1UNFBl?=
 =?gb2312?B?czIyQVVMRUx6a1l3My8xS080WkxJbnlCaTU3a0NrSlNIbGpYUnZCVjJHMWVY?=
 =?gb2312?B?dGFvRVlqZnZrM2Jwa0VoYy9KQURjRjRqTEFHMHZWTXhDeUV2V2piR09EVzRy?=
 =?gb2312?B?SmFHRjN4aHljcGVJcGRxNm1wZHNsbjdvamJrUXplOTg4M3oreWRkbzVycFQv?=
 =?gb2312?B?UXBwY2RsOWl2YWY2ay8vbEJ2L2dDWDM0UjdxY0ZUcUk4dm0vaHRRQkJYQnRD?=
 =?gb2312?B?dGpONWNtQ0xvTnFMd0k2Zk44VittaEttcUtEMDR5OG5iN2ZOQzUrUkJqelhi?=
 =?gb2312?B?V2JDdkRBYWhHa0dIL3hyQ3ZkS0d3eGxFaFZzcGt3MExZWE5LZ0ovY0hkWmhM?=
 =?gb2312?B?MkNyaHY4Q1d1b2IxbnZzZGQwMk5nRGZ3RkJhTjBEMFpnQURCTlVFdEZwY2lT?=
 =?gb2312?B?TU5BaFNZSXczVnVYU0RnaWNST3FZSFhNV3NsUjdKakdYdW9DSDJ6TDJUYjVK?=
 =?gb2312?B?b1hIem9LamxQbkMydU1EUTQyQW9EcEMyZ2NJdUR2dE9QakRpK2NpNlk0Zlhp?=
 =?gb2312?B?YmJ5bDM3YXhGNlZVMlF6aG8wZ0I5dUsybmJhaGJFa3RvU0N5blVFRzVmVE1R?=
 =?gb2312?B?MUJzc1MzdlZ4TzRXbzR4U0dNNnlJaEVhazEwWUhvK0RHRzVGeU9nSEw3KytC?=
 =?gb2312?B?WFdYWlZiS3JwWXo3aHhGSDRMR1c5cWEwNThCR2trT204TU5wbGpGRjBNYjhj?=
 =?gb2312?B?MnROWW10bE1MRmRjb05jM1VmMjgrYmZHS0liTjdPc0NPUm9YSTRBVkhvWGwr?=
 =?gb2312?B?ZStZcXRFSW1UODBsVnd4R01aS1REdHBSOG5DdHZTYjZGNkdETkRPWDVFbHpP?=
 =?gb2312?B?MDBvd2ttTHh5Ry9wZTlzem1yZi9JQ2hGdWdPeURaclBERVpjUWtYRmJiZXI5?=
 =?gb2312?B?U0ZvbDZhcERINW1JRHRaMVdBS21CWlVEWkJ3eEEyYnZmU3dDRmRyOEhXdFRI?=
 =?gb2312?B?VEI1cmtiVHhXVkxGSGluRndKcXI0cHFoRnNhWXJFQnR5dDgxL3lma0VtbGdV?=
 =?gb2312?B?TWFLS0tPN1hsNlM3RFVDUWJlcjZ6MGVEWG5HMnh4V0JIRk9scjAwbEJQckgx?=
 =?gb2312?B?R2x4UWpVK3lLMXJIRk4rd0xsV2NJVEpRQ1JES1dwa29lTnYveEt2bmZhUmZi?=
 =?gb2312?B?UHdhVU1SUjRPK2VXc0RTcWJCZFp6ajUzMVREL3RicXhDdkM5WnhNbFNJbENj?=
 =?gb2312?B?NmNabzhmQVVHSmg2OHRIODRheFNXQW85WmlKV3JZaFFEVEp6dzNlSmJJS3hq?=
 =?gb2312?B?NHI4anVkVDJJazdQTHNzczB2RTJld09oZW1GNkt6a1dycXBBaWxtZUUzOWpN?=
 =?gb2312?B?dEllY3VSYjRiS2tRaWhxUTV6VkNuem9zMVN4eEhaZFBqb05vYThWQm9ZNHU4?=
 =?gb2312?B?MDFyQjNOK05SWkhIQkZvVUN6WHlpbnozY0VvM2VETGZyNitoMDdhaTJCdVFJ?=
 =?gb2312?B?eUpEeW9OTFBSdzZHZXdoTG42SDBtcVd2ZVB0WnRZejNFbTJYNUppZGdJOU02?=
 =?gb2312?B?WjFMd1lWSTN2TnZ4ckhYMjRZQjlhY3o0V2JqbmFOQzBsMXQ0RDlOTURHanpU?=
 =?gb2312?B?ZW4waU9vK0QvL1lzWG85VXVkZ1R0Mjl0OVdnUUpwMFNUT2NreEJNWDE5WUty?=
 =?gb2312?B?aXZQREFPNXl3NmYrejBiZXpCd29IcUdCTGhwaHVaaHIxc2dBVTNqbGw3T2Rv?=
 =?gb2312?B?NGV1REpkcHhhbzZZZlJ6RHVaZURHMDd1Y0JjVERNRXJ6VmtZNE1jMURrQy9C?=
 =?gb2312?B?Q2haTmZ4M0hYc0F5bkFDaVg2TlFpWEpyeFBiek5LTHJ0c0VYb2lnbGpuaHRV?=
 =?gb2312?B?OThpR0UrR21tSjB2aWRZcW9YaHAyZXBDeU9sUm5acFRVODVnVlhUS0w5clJF?=
 =?gb2312?Q?5PJZnWc4eeDl3wbeLZRVKPC38?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB6697.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b7e22ee-0c12-4b59-1ab6-08db882f1702
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2023 08:06:43.3501
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4yPAFGQW/IEVBYCqB1NP2ZDG8jDkeDa4Z2JlQCpbReWvxToTet8huPb14/3W2JRHRfgSPfRcuAMqYvUvj5n0EQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB4011
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_010655_924527_56BC06F5 
X-CRM114-Status: GOOD (  11.05  )
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

