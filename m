Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2725EB64DA
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 09:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VF8ofKUT5qHRXr7yC8PL3EkIaPv+GP8WoCIG3n2qTI0=; b=HSoC4Ez1pziEpYF/2lpNrznCLl
	LVEaOJCpRQK/u2sleP3VlAYxTAuZy3a8rzCrKuZ1Fn5CrvoaCMSXCKrZLlEl61sLnE9iHTtH91/S7
	od87eEbtyEs7o4urwocYQBRyPYEvdpoUCREDC0ht/O5f1xRhFMBTKg7Ltj94Ymmj7n4S+J66zd25t
	fF67RE5ng528axOnbPklpCCPn4vVUkLlH4N+Pdh365vxWRzTtcfHyaUug14jDj+7ygdOUqYe2MDxl
	lKQ8WGX/KZJUVtrrKBaWzUxaYfSiZvbu+CiJYaeK/t4REVogrGVPG6txS/UAAM4ArfV7AVV4OHI2h
	+SIckxyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM3UV-006YIV-2F;
	Wed, 19 Jul 2023 09:29:03 +0000
Received: from mail-tyzapc01on20710.outbound.protection.outlook.com ([2a01:111:f403:704b::710] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM3US-006YGE-1d;
	Wed, 19 Jul 2023 09:29:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sa21G7TZc19arlmsLzoKYbUbXCVEDXkkM1M9pzLBtGRCWfQTX3lYCCxYc9rbhHOFzJmvvGNLSn/+EWX32UPovTyEa5kuZ143hYjq4eTp5wC6EO69Pdo/x1rWoutDfio2Qi3Tzp7KvPZ4CUXpWCTKVAMB8Wf92PncQA/k3BKC5pA94jDCRTHfpYnVlpIi43pMgPBuyBMJ9CN/jYiYBsW+Qp0FM9wukTv6Uo9w+WiW5BWXd2CsBxPMQAOHkrcinHUREg3a5ZP0DmLz5aUGNz80KY8YC1zEA8CvS4lZ0EEeZGwaGbKADpzSNrGBHlM6lHHSgh9BdEVMVoYRykoXfcgSyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VF8ofKUT5qHRXr7yC8PL3EkIaPv+GP8WoCIG3n2qTI0=;
 b=ThgaF0NNG57tWbYB7h7ydlhsANid1KYYQ+E/pPThioHZhConPmCIGtBOoV4k4IIpCS7n35mFAgBxZMFzSl97LNDN3QAW8cr6g3geBRn7rKJ7UxhPVqRmMm+S+AfuPHpLDikSJGwu/bqw0J9/VBIEekQneUEImSwmDiE0NnzDqLt0S3DMY+Q3Bcl556DqBJK8FZbA1U1eTdQKb0UefdCe0BUqvOGu/w3JC+T/HaELPU6ZhJIoRaEJyA4zZelYydbDU4HDLMHsV17aLspTdwgLO2mKR9wlXKlHFTagzVkfgnG0ijVjR91tJ2NtcCuNlt0DhIaPfrFAS8cRjyL52eso7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VF8ofKUT5qHRXr7yC8PL3EkIaPv+GP8WoCIG3n2qTI0=;
 b=AkwckgZGQF8lKUH+5BeZvR5b70fBDkNEJkABQZq/6pCEHMSn35VPwuMJRQTdMk1i44h8nd+jMRFkfy+L0LqPVFe7ch3RDVFYkfrAcpLjy2sMzVAA2ukCkKVmnILgKInnWo2+oWah+lcwLnFQ7Za6i8Gyur7ZkeOfLJ3Sc7xqKT5Ny4PvlYa9kHmYlqjhwjz/BwK7Bq4a7lJGpchx2zuZkXaZtAN1rJsuHwCi5uAGzd2CMVI+2I9YaLAa1CcrfTz4wJLLbLXpFW4PGC6E5BrOa9v8+fIp/6j2O8JQtUgw8Pmg61hMR8b5EYXwOk2OuGFKsJWm8wQPArCvl0W8g1yyYA==
Received: from TYZPR06MB6697.apcprd06.prod.outlook.com (2603:1096:400:451::6)
 by KL1PR0601MB5726.apcprd06.prod.outlook.com (2603:1096:820:bc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33; Wed, 19 Jul
 2023 09:28:46 +0000
Received: from TYZPR06MB6697.apcprd06.prod.outlook.com
 ([fe80::30f7:d30:53e3:ce86]) by TYZPR06MB6697.apcprd06.prod.outlook.com
 ([fe80::30f7:d30:53e3:ce86%4]) with mapi id 15.20.6609.022; Wed, 19 Jul 2023
 09:28:46 +0000
From: =?gb2312?B?wre67LfJ?= <luhongfei@vivo.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, Moudy Ho <moudy.ho@mediatek.com>, Deepak R Varma
	<drv@mailo.com>, Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
	=?gb2312?B?wre67LfJ?= <luhongfei@vivo.com>, Sun Ke <sunke32@huawei.com>, Arnd
 Bergmann <arnd@arndb.de>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>
CC: opensource.kernel <opensource.kernel@vivo.com>
Subject: [PATCH v2] media: mdp3: Fix resource leak in a
 for_each_child_of_node() loop
Thread-Topic: [PATCH v2] media: mdp3: Fix resource leak in a
 for_each_child_of_node() loop
Thread-Index: Adm6I2sdYFiCMAGvmkCFbWNJMn34mQ==
Date: Wed, 19 Jul 2023 09:28:46 +0000
Message-ID: <20230719092810.2116-1-luhongfei@vivo.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: SI2PR02CA0028.apcprd02.prod.outlook.com
 (2603:1096:4:195::8) To TYZPR06MB6697.apcprd06.prod.outlook.com
 (2603:1096:400:451::6)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB6697:EE_|KL1PR0601MB5726:EE_
x-ms-office365-filtering-correlation-id: 83674517-9eb0-4f25-6ae5-08db883a8d99
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7LyBmm64tv+DKsn5hQoTwk2Le6yD5uXpYGHXq7b8fAaH1a93HCeJ78Vl+0ejvZKIP0WUz50g5f584s1QAR0jJNKnluhk/Y8u3dQqyoKblDpp7z5UJEvBPLQNJfiWvNmbMNEUWxyLeafvApn3nnrAAwYDUY6epexKnt/3ctPLlRbBQtHCE9JHqnfV8YScTNC103Qtc/bwmsfIVzlyIywIxKKIuBKF+EQb2SdkuQKvSRThTp6QZea+27wIldxKap43NfHLuymVR/XSertYNK2r9pZsuM+tWD6Hu6y5a5oo5q36st//vGQMkRqOjIWSR8VyoxswpvaT74r+smMzz20Rle1/bQAGIgwuMkv3i5wWnEw4u9iO+cT3k+lLjxdR/5cHxk6tc82ciw0OvDVGlA/0m+GOfnAJ6+5vntfO15twcosiL2hygpC/60ayXjDbsUDgcQjGs/7XzTRgGuMZHi5ExhkzrCYx7fWf5V/tZg67WsYf+64pQ0ND0qbh6rIYPB+CvERBlBbYe+6082iiFE0TKbgF0oRf6T2Fc/ITqQIo3t0od5HPuIoHyS1MwBtBzaIqgFsRGSVJe0h429cpxad1nggAHoXnGZccNU+7q52YUkWxxCfGf/hwlCtVl/mT1gDg
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB6697.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(376002)(396003)(366004)(39860400002)(451199021)(38350700002)(8936002)(8676002)(107886003)(38100700002)(4744005)(85182001)(2906002)(2616005)(36756003)(5660300002)(6506007)(1076003)(26005)(122000001)(921005)(186003)(66476007)(86362001)(7416002)(66556008)(66946007)(52116002)(4326008)(110136005)(66446008)(6486002)(71200400001)(64756008)(41300700001)(478600001)(6512007)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?RGRoc3pDZ2p2Q3F4MzBHN1I2YnduYWNkVzRpdUdWS01SVEtzNWJHaUxZOWth?=
 =?gb2312?B?VmZ5WU5Jb1FFbTIvQUtuV2phM0E4OU1jbmpjVUJSYnYxY2ZPM2lxVWplTElQ?=
 =?gb2312?B?QzNOQmFodk91cXdzdmNFUmYvRHBzWEZ4WXF5bG1DUlI5UHBDRjF4bW4xSjB6?=
 =?gb2312?B?c0JuMWxja1I2WW9BOHc4YVVrWGxGdHI1b2E4eEZhZmpYbjJCTHNaNVl4Z3ha?=
 =?gb2312?B?cUlvdFFSOHlObXpYUlM3OW9xUFFjUjVmaWljMUNZeXhWbnl5a0JpOFNXUEEv?=
 =?gb2312?B?STVGMkRsa0E1YkFkbTduNlZvUGg0TGRMWTNxNjM2dE92MGl6akJwaGhGTzdl?=
 =?gb2312?B?aC9tL0ptdWllVFVhdlpwSjJ2Z3V4TWhkMzJMZnoweUNLLzZ0MVRSd05NRlpM?=
 =?gb2312?B?MnFlOEFSNnh2dHZzWHc3SlZZWUJtVlN0aTcrUTNwUjNIQWZHV1dmUUdXSW1a?=
 =?gb2312?B?ekdmK2RvamM3UzdEdDhxYzMzOGw3amYxNjdHQ09weDNGY0M1V1ppQjNZRGNI?=
 =?gb2312?B?WnFuamc4SVZWVHJnODMrZkgvc2R5NmtlVzExdGpiNzdRK052VzZTa1ZEelpR?=
 =?gb2312?B?ZjhKb0w3elluYzRqTm1URVV0bmtVQnFoVnV6U1poSDJDckVzVkp2QmcxbHFC?=
 =?gb2312?B?SFJYMnJka1UxdzJDTkVXUVJQUzUwNE02a2gxZUhZbkpuTWRhS2tabGF0SVlJ?=
 =?gb2312?B?VXM4VVRhSjhxRHZHT0N1WGpPT05VS3YrZGpKcndSbUlSYjNZVU9Mak5UVGNF?=
 =?gb2312?B?K2VabUdxWldRV0JKaU9hYkVnZjJsRUZMbVhhSUhPNThqMkxVTlN2cHJMVS9T?=
 =?gb2312?B?eU9Ta3NISnpRQUlLNjFyTGw1L09FY2F6ek1QUDRxd2wzTG1QWlk4ODRhckg4?=
 =?gb2312?B?Q2tBVWlGd0hjYS90TjRob1BBM0FXQ0NvLzN4Ni9RdmJ1czI5RGd0MHZjUnp2?=
 =?gb2312?B?UXFOK0NrVDhxdGdaaVExNlNtQ2p5SVR4ZmFueWRZM00yRWJINTliSmM4UjhR?=
 =?gb2312?B?NUFJQWhwVzZUQVBHRlMyZExRdHFORnNKdGpmb1hIRkdsYzhPdi9QYTFrS2dB?=
 =?gb2312?B?WTFUNEQyazlxNTAyVmZtWk9QQ3dIOVNZckVyNEhlMjE4RFE3aFh4ZlBvaFNU?=
 =?gb2312?B?RzZORmM2dnBWMjExdFlmTjhhc3NKQndzSTFCcThtb20valNMZWpUdmpFSFdY?=
 =?gb2312?B?aXNpeXF0Y1FvdVpoRFNLVWs4NHRRS2ZvWDk2aVdtaVRQejRmN3lQYWhOK0s4?=
 =?gb2312?B?N1RKelJhb2JqNzUvNGxEdjI2LzNXMFpQcWNNQ2ZUaXh5ai9qdWtIdUVacFJn?=
 =?gb2312?B?TWxDMlZSZDExV2l0SmdabTRISTgzbUdrYzhqSW9ialJBSDROVzgyT0Q4VXBv?=
 =?gb2312?B?alVVSUNna2tkRU80ZUZ3QTYzNEhGZzRRWU9YYW1scC9TZWFJT052TFo0SnZh?=
 =?gb2312?B?TFpuT1F3SkNQUWZHT1lxWkt0dURYYk1JWFQ5YjQ2b1BqZlJNbm9TUjMwbktJ?=
 =?gb2312?B?alR4RFpWRERqRVRZT28xNGV6NHdpVmxaZnVSNnNrQmFVem9LREQxQUt2TnVn?=
 =?gb2312?B?a2dyZCtDNldWMWlFZ2ZISXNRbEhUYzl4Vi9xc2QzUWYrMjhROU5WNVExOHRQ?=
 =?gb2312?B?Z0lYZTFHUitwcVA5a2ZBaTRYWkZNdUlremswMVQrQjR2enloa0M3cnBmYlZ4?=
 =?gb2312?B?SUlKdlRDOTg0MWpsZkpjZTNzWXpIRngwK1NpUjQrR0tQSkJEN1dwcXVVaEgx?=
 =?gb2312?B?UnRya0hWNUJ2RkRTWVEwbGsveDRqeDExczU1RlBJem5VZUs1MEI0N0FpR3Fv?=
 =?gb2312?B?Ky9aRWpIb2xpcGRNUGc2dmp2ZnFyOTlBYVNFY3ZkVHljL3JGT0JvcFpKTGZl?=
 =?gb2312?B?NlpOZGhwOXdLWVhlTy82Z2Z0UENCczlCdkxOYUFCc3ptZU1WYVRXd25sQXEy?=
 =?gb2312?B?eGRQNWU5R1FCNGxxc0gzQ3FMb3lqZCsrMGNaTW9NRFQzUzdQWUpQeXFKMlBT?=
 =?gb2312?B?cjk0djlCQjJGak9tYUt1L2RqUFRDSEFDOCswZHJTMkVES1FwN1dFV3JEMnFW?=
 =?gb2312?B?ZFdzclJOMDF0Z0lHUmhEZDMrS2E4YlUzL3Y3RkZKV1BBbFJvOUF5dEJZOWht?=
 =?gb2312?Q?IqtvkeAuyAiO7ZW6m6l5A/1Vh?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB6697.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83674517-9eb0-4f25-6ae5-08db883a8d99
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2023 09:28:46.7892
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PQCMXC4PiOsLKqaCUexvQXGNgG22amAHmYBga02MKWLMlgBrxwNssTj8EgKpGgxg+DNvEfC1Jku4Ye5RWYVwMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5726
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_022900_550687_62317C35 
X-CRM114-Status: GOOD (  11.37  )
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

