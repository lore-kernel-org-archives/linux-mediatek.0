Return-Path: <SRS0=h+tY=YW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0350DCA9EAE
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Oct 2019 09:00:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA6BC20717
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Oct 2019 09:00:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rvcLpeQK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="iKh3gpHt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA6BC20717
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BoHFSXGy1fGCu6WP/u2WFaendf7TeD812khFdMJTnWw=; b=rvcLpeQKBqharo
	ot/i3In/667/CkU7kyfBrcFH5oS7PREp9LrH6DJKNUYkoUckOIK+5jSAa4ep6dDcJoSiw8j6YLDlu
	v4hI42/E2+JOkRzKex4IJlaXib3LiBqrPhiOPaWdI2fowhpOkTZ3KI26vhvx3dqrx+zXt+sNHiED1
	IwfG6ULcBzThNflAmfXn1SBdFmM7weOwfwAWfmYvh1B/Ur9NJMYu83MQ3OhxRYKIO3QSg/hEH0jXh
	5aOmJiFzXDyAJ2I4jXtDXa5NltpC/FnHPxBDbCg6I25iZuQ1Q1wknKMBM0VGgULVBZoNpt7twmZbx
	fjF4Iqm6s9ihdXW6g3GQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iPNMz-0003CA-OE; Tue, 29 Oct 2019 09:00:53 +0000
Received: from mail-eopbgr20088.outbound.protection.outlook.com ([40.107.2.88]
 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iPNMo-00032B-Fg; Tue, 29 Oct 2019 09:00:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ybaba4wV0UIZncLSoifMfVgN5u6CIEzxgNvGeTk31M/QSz0IvJ4tRwYB9emXWBOkAp6QyRWDjtiCkegNIVhKmKeudRWp8a1IzbSEBmt+sRl0Vcucb0hTXHsmarl/LUJRteCRmnGbpHFjw1h4rLPxQZtWrfRFmXF5huF+aKJt1kaE7DGsPTt6/CsD0/dBJRWUNFGT5mg14NrkcNuBJOomNfMwWFDD1lHS2PRSZPwoNlzrIWtnaVDrog3DptlaOIZ0MkmWtsXujv+yIsevvIW6AvlfAuozQrR9kGZSuxXctuAtUNaTRk/UvDFE5+XHXQkozVtAaRoIZ1zTfy3LVdKvlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+iXRmcCbl9+3snGwvi3OUEPv2Jm8dBThEauTVsyigX8=;
 b=h3+NxiUU4+2T0PaGfM1d/hEg7YJswJzUG7d9lqTNUN3lLLpfFeHFERwYRCy1/O6hRmElSQsdCnc6XkMkc3qCHFwoC5B7o4/XBQSeZxBEUioKsjrPz9sEa9KnVxd2MVEysrGfqwbBkmaXIiyQMTewSxGciP01F7qumofwxCxjOaP9vAaW8xcZK//yJFupAARC/aoNvr3jh1zqeNNNOiCLuTSACjblz3GFv4O/waBnUQgu+UASi25eAXBJmL7aqweBKpEYfwAoVIyKEBiEXF8UxkzQKEl+9SQGBHq9o1XCdQUvQ7wqeqL7H2CujbBnMp6mnZI+U1Dz/yUMHDfG+T+8mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+iXRmcCbl9+3snGwvi3OUEPv2Jm8dBThEauTVsyigX8=;
 b=iKh3gpHtnE/wgnVdmmv+m/qiXpHUj+n9EG0jEn8wSdupTfLzRuA4HmPmpXHq8s+421Hev1kZuUmM/p1aT6H3KcvS8GOCcq2UZ4Gv3wl8l8cT1JxA4RyH/BOovS+uSrI2Svy2tjPsL+BqXA45wwqS5h0qW1+mPO8HYEtWVWbIzVk=
Received: from DB8PR04MB6747.eurprd04.prod.outlook.com (20.179.250.159) by
 DB8PR04MB6363.eurprd04.prod.outlook.com (10.255.170.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.24; Tue, 29 Oct 2019 09:00:34 +0000
Received: from DB8PR04MB6747.eurprd04.prod.outlook.com
 ([fe80::f54f:12e3:3d7c:167b]) by DB8PR04MB6747.eurprd04.prod.outlook.com
 ([fe80::f54f:12e3:3d7c:167b%3]) with mapi id 15.20.2367.031; Tue, 29 Oct 2019
 09:00:34 +0000
From: "Z.q. Hou" <zhiqiang.hou@nxp.com>
To: Rob Herring <robh@kernel.org>, Andrew Murray <andrew.murray@arm.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi
 <lorenzo.pieralisi@arm.com>
Subject: RE: [PATCH v3 09/25] PCI: mobiveil: Use
 pci_parse_request_of_pci_ranges()
Thread-Topic: [PATCH v3 09/25] PCI: mobiveil: Use
 pci_parse_request_of_pci_ranges()
Thread-Index: AQHVja1swGHLnpSLL0anxzWa+mLdpadxUoRQ
Date: Tue, 29 Oct 2019 09:00:34 +0000
Message-ID: <DB8PR04MB6747A5E55650DD7ED174840284610@DB8PR04MB6747.eurprd04.prod.outlook.com>
References: <20191028163256.8004-1-robh@kernel.org>
 <20191028163256.8004-10-robh@kernel.org>
In-Reply-To: <20191028163256.8004-10-robh@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=zhiqiang.hou@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 52dec04b-13c7-43b9-4a84-08d75c4e75b7
x-ms-traffictypediagnostic: DB8PR04MB6363:
x-microsoft-antispam-prvs: <DB8PR04MB6363351F5D87EA7E86A5B18C84610@DB8PR04MB6363.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1201;
x-forefront-prvs: 0205EDCD76
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(346002)(366004)(376002)(39860400002)(199004)(189003)(13464003)(7696005)(66946007)(66476007)(66446008)(11346002)(316002)(66556008)(64756008)(110136005)(26005)(54906003)(52536014)(478600001)(25786009)(2906002)(99286004)(33656002)(7416002)(7406005)(6506007)(76116006)(71190400001)(5660300002)(71200400001)(53546011)(14454004)(476003)(4326008)(9686003)(76176011)(256004)(6436002)(3846002)(446003)(55016002)(186003)(86362001)(14444005)(8936002)(6246003)(81166006)(305945005)(66066001)(7736002)(102836004)(486006)(81156014)(8676002)(74316002)(229853002)(6116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB8PR04MB6363;
 H:DB8PR04MB6747.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3UWwX0buDQ8xTT6MY3jODIElA7U7kEG6E2N3JqrpUIiA/D0Pz27pJ26tcB7pHaf73w2i1QM1vw8ZY3Gs6MhnFdiH7DZJFycNUZdIu2nRWJLQkI5Ltfwyo5x6EoNKmfbMjEh2xbo9LWIUQZ6VOXku0d29ieuen8QRvs/zYWXQGQXdfKbXlTcfDX9rs5s6m1T4+5qNqKgAFubdTENbIhlWBv6hz4uKHETX8wyBhwlA3ublAaXdzkZzPR+cJTMeyJEOoCX1kHC6hILRhKkDgHrDFVnvfTLlVhZgMgRWfHvaG3spzHx7rmCA2hORAEBnVL3oh3HZ/BR9vmjpZe6MQ3wpmyKECtm7Gc8LBxYnhhDPz8S30nPS8hj8pks//5cG59/dqen2CH7TnTqMsjFVm5Bd2RZF+SpCV+EAdKXQhXNGYs6Kng7LyyCDy3bYl1kgxPyd
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52dec04b-13c7-43b9-4a84-08d75c4e75b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2019 09:00:34.3458 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HKbTnEE4J6/rl/7uIhiao/C3kOXNqqxE12Pu7E1piG2Pd8StGznXBZ4KO3G7cS6PH0caMuJPnPCQ71hDaPdBUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6363
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191029_020042_626094_751D8994 
X-CRM114-Status: GOOD (  21.65  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Heiko Stuebner <heiko@sntech.de>,
 Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Toan Le <toan@os.amperecomputing.com>, Will Deacon <will@kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, Michal Simek <michal.simek@xilinx.com>,
 Christoph Hellwig <hch@infradead.org>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "bcm-kernel-feedback-list@broadcom.com"
 <bcm-kernel-feedback-list@broadcom.com>, Shawn Lin <shawn.lin@rock-chips.com>,
 Ray Jui <rjui@broadcom.com>, Simon Horman <horms@verge.net.au>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Scott Branden <sbranden@broadcom.com>, Jingoo Han <jingoohan1@gmail.com>,
 "rfi@lists.rocketboards.org" <rfi@lists.rocketboards.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Tom Joseph <tjoseph@cadence.com>, Srinath Mannam <srinath.mannam@broadcom.com>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Ley Foon Tan <lftan@altera.com>
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUm9iIEhlcnJpbmcgPHJv
YmhAa2VybmVsLm9yZz4NCj4gU2VudDogMjAxOcTqMTDUwjI5yNUgMDozMw0KPiBUbzogQW5kcmV3
IE11cnJheSA8YW5kcmV3Lm11cnJheUBhcm0uY29tPjsgQmpvcm4gSGVsZ2Fhcw0KPiA8YmhlbGdh
YXNAZ29vZ2xlLmNvbT47IExvcmVuem8gUGllcmFsaXNpIDxsb3JlbnpvLnBpZXJhbGlzaUBhcm0u
Y29tPg0KPiBDYzogbGludXgtcGNpQHZnZXIua2VybmVsLm9yZzsgbGludXgtYXJtLWtlcm5lbEBs
aXN0cy5pbmZyYWRlYWQub3JnOw0KPiBiY20ta2VybmVsLWZlZWRiYWNrLWxpc3RAYnJvYWRjb20u
Y29tOyBDaHJpc3RvcGggSGVsbHdpZw0KPiA8aGNoQGluZnJhZGVhZC5vcmc+OyBHdXN0YXZvIFBp
bWVudGVsDQo+IDxndXN0YXZvLnBpbWVudGVsQHN5bm9wc3lzLmNvbT47IEhlaWtvIFN0dWVibmVy
IDxoZWlrb0BzbnRlY2guZGU+Ow0KPiBaLnEuIEhvdSA8emhpcWlhbmcuaG91QG54cC5jb20+OyBK
aW5nb28gSGFuIDxqaW5nb29oYW4xQGdtYWlsLmNvbT47DQo+IEthcnRoaWtleWFuIE1pdHJhbiA8
bS5rYXJ0aGlrZXlhbkBtb2JpdmVpbC5jby5pbj47IExleSBGb29uIFRhbg0KPiA8bGZ0YW5AYWx0
ZXJhLmNvbT47IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz47DQo+IGxp
bnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4LXJlbmVzYXMtc29jQHZnZXIu
a2VybmVsLm9yZzsNCj4gbGludXgtcm9ja2NoaXBAbGlzdHMuaW5mcmFkZWFkLm9yZzsgTWF0dGhp
YXMgQnJ1Z2dlcg0KPiA8bWF0dGhpYXMuYmdnQGdtYWlsLmNvbT47IE1pY2hhbCBTaW1layA8bWlj
aGFsLnNpbWVrQHhpbGlueC5jb20+OyBSYXkNCj4gSnVpIDxyanVpQGJyb2FkY29tLmNvbT47IHJm
aUBsaXN0cy5yb2NrZXRib2FyZHMub3JnOyBSeWRlciBMZWUNCj4gPHJ5ZGVyLmxlZUBtZWRpYXRl
ay5jb20+OyBTY290dCBCcmFuZGVuIDxzYnJhbmRlbkBicm9hZGNvbS5jb20+Ow0KPiBTaGF3biBM
aW4gPHNoYXduLmxpbkByb2NrLWNoaXBzLmNvbT47IFNpbW9uIEhvcm1hbg0KPiA8aG9ybXNAdmVy
Z2UubmV0LmF1PjsgU3JpbmF0aCBNYW5uYW0NCj4gPHNyaW5hdGgubWFubmFtQGJyb2FkY29tLmNv
bT47IFRob21hcyBQZXRhenpvbmkNCj4gPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+OyBU
b2FuIExlDQo+IDx0b2FuQG9zLmFtcGVyZWNvbXB1dGluZy5jb20+OyBUb20gSm9zZXBoIDx0am9z
ZXBoQGNhZGVuY2UuY29tPjsNCj4gV2lsbCBEZWFjb24gPHdpbGxAa2VybmVsLm9yZz4NCj4gU3Vi
amVjdDogW1BBVENIIHYzIDA5LzI1XSBQQ0k6IG1vYml2ZWlsOiBVc2UNCj4gcGNpX3BhcnNlX3Jl
cXVlc3Rfb2ZfcGNpX3JhbmdlcygpDQo+IA0KPiBDb252ZXJ0IHRoZSBNb2JpdmVpbCBob3N0IGJy
aWRnZSB0byB1c2UgdGhlIGNvbW1vbg0KPiBwY2lfcGFyc2VfcmVxdWVzdF9vZl9wY2lfcmFuZ2Vz
KCkuDQo+IA0KPiBUaGVyZSdzIG5vIG5lZWQgdG8gYXNzaWduIHRoZSByZXNvdXJjZXMgdG8gYSB0
ZW1wb3JhcnkgbGlzdCBmaXJzdC4gSnVzdCB1c2UNCj4gYnJpZGdlLT53aW5kb3dzIGRpcmVjdGx5
IGFuZCByZW1vdmUgYWxsIHRoZSB0ZW1wb3JhcnkgbGlzdCBoYW5kbGluZy4NCj4gDQo+IENjOiBL
YXJ0aGlrZXlhbiBNaXRyYW4gPG0ua2FydGhpa2V5YW5AbW9iaXZlaWwuY28uaW4+DQo+IENjOiBI
b3UgWmhpcWlhbmcgPFpoaXFpYW5nLkhvdUBueHAuY29tPg0KPiBDYzogTG9yZW56byBQaWVyYWxp
c2kgPGxvcmVuem8ucGllcmFsaXNpQGFybS5jb20+DQo+IENjOiBCam9ybiBIZWxnYWFzIDxiaGVs
Z2Fhc0Bnb29nbGUuY29tPg0KPiBSZXZpZXdlZC1ieTogQW5kcmV3IE11cnJheSA8YW5kcmV3Lm11
cnJheUBhcm0uY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwu
b3JnPg0KPiAtLS0NCj4gIGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNpZS1tb2JpdmVpbC5jIHwg
MjYgKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2Vy
dGlvbnMoKyksIDE5IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGNp
L2NvbnRyb2xsZXIvcGNpZS1tb2JpdmVpbC5jDQo+IGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9w
Y2llLW1vYml2ZWlsLmMNCj4gaW5kZXggYTQ1YTY0NDdiMDFkLi40ZWFiODYyNGNlNGQgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNpZS1tb2JpdmVpbC5jDQo+ICsrKyBi
L2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNpZS1tb2JpdmVpbC5jDQo+IEBAIC0xNDAsNyArMTQw
LDYgQEAgc3RydWN0IG1vYml2ZWlsX21zaSB7CQkJLyogTVNJIGluZm9ybWF0aW9uDQo+ICovDQo+
IA0KPiAgc3RydWN0IG1vYml2ZWlsX3BjaWUgew0KPiAgCXN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Ug
KnBkZXY7DQo+IC0Jc3RydWN0IGxpc3RfaGVhZCByZXNvdXJjZXM7DQo+ICAJdm9pZCBfX2lvbWVt
ICpjb25maWdfYXhpX3NsYXZlX2Jhc2U7CS8qIGVuZHBvaW50IGNvbmZpZyBiYXNlICovDQo+ICAJ
dm9pZCBfX2lvbWVtICpjc3JfYXhpX3NsYXZlX2Jhc2U7CS8qIHJvb3QgcG9ydCBjb25maWcgYmFz
ZSAqLw0KPiAgCXZvaWQgX19pb21lbSAqYXBiX2Nzcl9iYXNlOwkvKiBNU0kgcmVnaXN0ZXIgYmFz
ZSAqLw0KPiBAQCAtNTc1LDYgKzU3NCw3IEBAIHN0YXRpYyB2b2lkIG1vYml2ZWlsX3BjaWVfZW5h
YmxlX21zaShzdHJ1Y3QNCj4gbW9iaXZlaWxfcGNpZSAqcGNpZSkNCj4gDQo+ICBzdGF0aWMgaW50
IG1vYml2ZWlsX2hvc3RfaW5pdChzdHJ1Y3QgbW9iaXZlaWxfcGNpZSAqcGNpZSkgIHsNCj4gKwlz
dHJ1Y3QgcGNpX2hvc3RfYnJpZGdlICpicmlkZ2UgPSBwY2lfaG9zdF9icmlkZ2VfZnJvbV9wcml2
KHBjaWUpOw0KPiAgCXUzMiB2YWx1ZSwgcGFiX2N0cmwsIHR5cGU7DQo+ICAJc3RydWN0IHJlc291
cmNlX2VudHJ5ICp3aW47DQo+IA0KPiBAQCAtNjMxLDcgKzYzMSw3IEBAIHN0YXRpYyBpbnQgbW9i
aXZlaWxfaG9zdF9pbml0KHN0cnVjdCBtb2JpdmVpbF9wY2llDQo+ICpwY2llKQ0KPiAgCXByb2dy
YW1faWJfd2luZG93cyhwY2llLCBXSU5fTlVNXzAsIDAsIDAsIE1FTV9XSU5ET1dfVFlQRSwNCj4g
SUJfV0lOX1NJWkUpOw0KPiANCj4gIAkvKiBHZXQgdGhlIEkvTyBhbmQgbWVtb3J5IHJhbmdlcyBm
cm9tIERUICovDQo+IC0JcmVzb3VyY2VfbGlzdF9mb3JfZWFjaF9lbnRyeSh3aW4sICZwY2llLT5y
ZXNvdXJjZXMpIHsNCj4gKwlyZXNvdXJjZV9saXN0X2Zvcl9lYWNoX2VudHJ5KHdpbiwgJmJyaWRn
ZS0+d2luZG93cykgew0KPiAgCQlpZiAocmVzb3VyY2VfdHlwZSh3aW4tPnJlcykgPT0gSU9SRVNP
VVJDRV9NRU0pDQo+ICAJCQl0eXBlID0gTUVNX1dJTkRPV19UWVBFOw0KPiAgCQllbHNlIGlmIChy
ZXNvdXJjZV90eXBlKHdpbi0+cmVzKSA9PSBJT1JFU09VUkNFX0lPKSBAQCAtODU3LDcNCj4gKzg1
Nyw2IEBAIHN0YXRpYyBpbnQgbW9iaXZlaWxfcGNpZV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2
aWNlICpwZGV2KQ0KPiAgCXN0cnVjdCBwY2lfYnVzICpjaGlsZDsNCj4gIAlzdHJ1Y3QgcGNpX2hv
c3RfYnJpZGdlICpicmlkZ2U7DQo+ICAJc3RydWN0IGRldmljZSAqZGV2ID0gJnBkZXYtPmRldjsN
Cj4gLQlyZXNvdXJjZV9zaXplX3QgaW9iYXNlOw0KPiAgCWludCByZXQ7DQo+IA0KPiAgCS8qIGFs
bG9jYXRlIHRoZSBQQ0llIHBvcnQgKi8NCj4gQEAgLTg3NSwxMSArODc0LDggQEAgc3RhdGljIGlu
dCBtb2JpdmVpbF9wY2llX3Byb2JlKHN0cnVjdA0KPiBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+
ICAJCXJldHVybiByZXQ7DQo+ICAJfQ0KPiANCj4gLQlJTklUX0xJU1RfSEVBRCgmcGNpZS0+cmVz
b3VyY2VzKTsNCj4gLQ0KPiAgCS8qIHBhcnNlIHRoZSBob3N0IGJyaWRnZSBiYXNlIGFkZHJlc3Nl
cyBmcm9tIHRoZSBkZXZpY2UgdHJlZSBmaWxlICovDQo+IC0JcmV0ID0gZGV2bV9vZl9wY2lfZ2V0
X2hvc3RfYnJpZGdlX3Jlc291cmNlcyhkZXYsIDAsIDB4ZmYsDQo+IC0JCQkJCQkgICAgJnBjaWUt
PnJlc291cmNlcywgJmlvYmFzZSk7DQo+ICsJcmV0ID0gcGNpX3BhcnNlX3JlcXVlc3Rfb2ZfcGNp
X3JhbmdlcyhkZXYsICZicmlkZ2UtPndpbmRvd3MsIE5VTEwpOw0KPiAgCWlmIChyZXQpIHsNCj4g
IAkJZGV2X2VycihkZXYsICJHZXR0aW5nIGJyaWRnZSByZXNvdXJjZXMgZmFpbGVkXG4iKTsNCj4g
IAkJcmV0dXJuIHJldDsNCj4gQEAgLTg5MiwyNCArODg4LDE5IEBAIHN0YXRpYyBpbnQgbW9iaXZl
aWxfcGNpZV9wcm9iZShzdHJ1Y3QNCj4gcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgCXJldCA9
IG1vYml2ZWlsX2hvc3RfaW5pdChwY2llKTsNCj4gIAlpZiAocmV0KSB7DQo+ICAJCWRldl9lcnIo
ZGV2LCAiRmFpbGVkIHRvIGluaXRpYWxpemUgaG9zdFxuIik7DQo+IC0JCWdvdG8gZXJyb3I7DQo+
ICsJCXJldHVybiByZXQ7DQo+ICAJfQ0KPiANCj4gIAkvKiBpbml0aWFsaXplIHRoZSBJUlEgZG9t
YWlucyAqLw0KPiAgCXJldCA9IG1vYml2ZWlsX3BjaWVfaW5pdF9pcnFfZG9tYWluKHBjaWUpOw0K
PiAgCWlmIChyZXQpIHsNCj4gIAkJZGV2X2VycihkZXYsICJGYWlsZWQgY3JlYXRpbmcgSVJRIERv
bWFpblxuIik7DQo+IC0JCWdvdG8gZXJyb3I7DQo+ICsJCXJldHVybiByZXQ7DQo+ICAJfQ0KPiAN
Cj4gIAlpcnFfc2V0X2NoYWluZWRfaGFuZGxlcl9hbmRfZGF0YShwY2llLT5pcnEsIG1vYml2ZWls
X3BjaWVfaXNyLCBwY2llKTsNCj4gDQo+IC0JcmV0ID0gZGV2bV9yZXF1ZXN0X3BjaV9idXNfcmVz
b3VyY2VzKGRldiwgJnBjaWUtPnJlc291cmNlcyk7DQo+IC0JaWYgKHJldCkNCj4gLQkJZ290byBl
cnJvcjsNCj4gLQ0KPiAgCS8qIEluaXRpYWxpemUgYnJpZGdlICovDQo+IC0JbGlzdF9zcGxpY2Vf
aW5pdCgmcGNpZS0+cmVzb3VyY2VzLCAmYnJpZGdlLT53aW5kb3dzKTsNCj4gIAlicmlkZ2UtPmRl
di5wYXJlbnQgPSBkZXY7DQo+ICAJYnJpZGdlLT5zeXNkYXRhID0gcGNpZTsNCj4gIAlicmlkZ2Ut
PmJ1c25yID0gcGNpZS0+cm9vdF9idXNfbnI7DQo+IEBAIC05MjAsMTMgKzkxMSwxMyBAQCBzdGF0
aWMgaW50IG1vYml2ZWlsX3BjaWVfcHJvYmUoc3RydWN0DQo+IHBsYXRmb3JtX2RldmljZSAqcGRl
dikNCj4gIAlyZXQgPSBtb2JpdmVpbF9icmluZ3VwX2xpbmsocGNpZSk7DQo+ICAJaWYgKHJldCkg
ew0KPiAgCQlkZXZfaW5mbyhkZXYsICJsaW5rIGJyaW5nLXVwIGZhaWxlZFxuIik7DQo+IC0JCWdv
dG8gZXJyb3I7DQo+ICsJCXJldHVybiByZXQ7DQo+ICAJfQ0KPiANCj4gIAkvKiBzZXR1cCB0aGUg
a2VybmVsIHJlc291cmNlcyBmb3IgdGhlIG5ld2x5IGFkZGVkIFBDSWUgcm9vdCBidXMgKi8NCj4g
IAlyZXQgPSBwY2lfc2Nhbl9yb290X2J1c19icmlkZ2UoYnJpZGdlKTsNCj4gIAlpZiAocmV0KQ0K
PiAtCQlnb3RvIGVycm9yOw0KPiArCQlyZXR1cm4gcmV0Ow0KPiANCj4gIAlidXMgPSBicmlkZ2Ut
PmJ1czsNCj4gDQo+IEBAIC05MzYsOSArOTI3LDYgQEAgc3RhdGljIGludCBtb2JpdmVpbF9wY2ll
X3Byb2JlKHN0cnVjdA0KPiBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICAJcGNpX2J1c19hZGRf
ZGV2aWNlcyhidXMpOw0KPiANCj4gIAlyZXR1cm4gMDsNCj4gLWVycm9yOg0KPiAtCXBjaV9mcmVl
X3Jlc291cmNlX2xpc3QoJnBjaWUtPnJlc291cmNlcyk7DQo+IC0JcmV0dXJuIHJldDsNCj4gIH0N
Cj4gDQo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBtb2JpdmVpbF9wY2llX29m
X21hdGNoW10gPSB7DQo+IC0tDQo+IDIuMjAuMQ0KDQpSZXZpZXdlZC1ieTogSG91IFpoaXFpYW5n
IDxaaGlxaWFuZy5Ib3VAbnhwLmNvbT4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRl
a0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
