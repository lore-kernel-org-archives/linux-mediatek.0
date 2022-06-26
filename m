Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6F4EC433EF
	for <linux-mediatek@archiver.kernel.org>; Sun, 26 Jun 2022 04:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n2YvvTsJXTpeVNQg6HdlzQAWih7t0IvnUEKrURRyxU0=; b=u2/4Pw7DRIdC8sX3QWVKVjtB9K
	GaPH5GD0qPJUnHlBMvzRxhsGQR7q8sZhRNSJsH9TtDIpj6o+xm0fuZGtdUzDEwVgVv1xqisGyg+Sn
	Ysdaw3x8XmJYTpqbPhhWNCwgN5j8s+eMOES6IfkOkpENyhOtcWNj+lJPZ/WjmvLQn0BANgPWFZWsL
	OgSNF0VHd/zPHWhYRhPgXz7FqC9sG5IqPQDmAa4XcAg3EmcA1Yg/Byha9MJ1s3SmMqZjJ81JNN9Rm
	Z6GgnkMO0xKrQTgofdzffLNrrJdk7pqde0wgN3ancUepRZYUhNYYdTvlH5WboJ0KvIYdu32jKMih+
	Z18akGvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5KFq-009clU-C9; Sun, 26 Jun 2022 04:52:14 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5KDs-009bbR-2D; Sun, 26 Jun 2022 04:50:15 +0000
X-UUID: aa7dc2174e7840cab7ccef1912d63b1e-20220625
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=n2YvvTsJXTpeVNQg6HdlzQAWih7t0IvnUEKrURRyxU0=;
	b=RDkNwg/jhSdR4u1B/Ho+OHbHaAsEuNXyGZqw0tTL6198KTu6sR0/D+Ttki4lT4FFZmX24Cj12Mha2/90WiZihLHmuHp9jziVo2GD9kbyAsxooL8GJF29WvKG/bhDy3qmrFeg9fPGVS/QvuzsqSjTLyTmefP8kjyTn9wNUDMzfZM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:1c55c9a6-53e3-4de0-88f7-1fff1259caad,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:b14ad71,CLOUDID:874c83ea-f7af-4e69-92ee-0fd74a0c286c,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:-5,EDM:-3,IP:nil,URL:1,File:ni
	l,QS:nil,BEC:nil,COL:0
X-UUID: aa7dc2174e7840cab7ccef1912d63b1e-20220625
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
	(envelope-from <guodong.liu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 129533551; Sat, 25 Jun 2022 21:50:02 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 25 Jun 2022 21:44:33 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Sun, 26 Jun 2022 12:44:32 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 26 Jun 2022 12:44:31 +0800
Message-ID: <1f0e594b7c10f0937f9e676c3ba2ccfe401951d9.camel@mediatek.com>
Subject: Re: [PATCH v2 4/5] pinctrl: mediatek: dropping original advanced
 drive configuration function
From: Guodong Liu <guodong.liu@mediatek.com>
To: "=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>
CC: Linus Walleij <linus.walleij@linaro.org>, Rob Herring
	<robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang
	<sean.wang@kernel.org>, Sean Wang <sean.wang@mediatek.com>, Zhiyong Tao
	<zhiyong.tao@mediatek.com>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Sun, 26 Jun 2022 12:44:31 +0800
In-Reply-To: <20220624160810.alotw7iwvivp5zg6@notapiano>
References: <20220624133700.15487-1-guodong.liu@mediatek.com>
	 <20220624133700.15487-5-guodong.liu@mediatek.com>
	 <20220624160810.alotw7iwvivp5zg6@notapiano>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220625_215012_168192_5416B3F9 
X-CRM114-Status: UNSURE (   9.09  )
X-CRM114-Notice: Please train this message.
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IE7DrWNvbGFzIEYuIFIuIEEuIFByYWRv
IDxuZnJhcHJhZG9AY29sbGFib3JhLmNvbT4NClRvOiBHdW9kb25nIExpdSA8Z3VvZG9uZy5saXVA
bWVkaWF0ZWsuY29tPg0KQ2M6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9y
Zz4sIFJvYiBIZXJyaW5nIDwNCnJvYmgrZHRAa2VybmVsLm9yZz4sIE1hdHRoaWFzIEJydWdnZXIg
PG1hdHRoaWFzLmJnZ0BnbWFpbC5jb20+LCBTZWFuDQpXYW5nIDxzZWFuLndhbmdAa2VybmVsLm9y
Zz4sIFNlYW4gV2FuZyA8c2Vhbi53YW5nQG1lZGlhdGVrLmNvbT4sDQpaaGl5b25nIFRhbyA8emhp
eW9uZy50YW9AbWVkaWF0ZWsuY29tPiwgbGludXgtZ3Bpb0B2Z2VyLmtlcm5lbC5vcmcsIA0KZGV2
aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmcsIGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFk
Lm9yZywgDQpsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnLCBsaW51eC1rZXJuZWxA
dmdlci5rZXJuZWwub3JnLCANClByb2plY3RfR2xvYmFsX0Nocm9tZV9VcHN0cmVhbV9Hcm91cEBt
ZWRpYXRlay5jb20NClN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgNC81XSBwaW5jdHJsOiBtZWRpYXRl
azogZHJvcHBpbmcgb3JpZ2luYWwNCmFkdmFuY2VkIGRyaXZlIGNvbmZpZ3VyYXRpb24gZnVuY3Rp
b24NCkRhdGU6IEZyaSwgMjQgSnVuIDIwMjIgMTI6MDg6MTAgLTA0MDANCg0KSGkgR3VvZG9uZywN
Cg0KT24gRnJpLCBKdW4gMjQsIDIwMjIgYXQgMDk6MzY6NTlQTSArMDgwMCwgR3VvZG9uZyBMaXUg
d3JvdGU6DQo+IEZ1bmN0aW9uIGJpYXNfY29tYm8gZ2V0dGVyL3NldHRlcnMgYWxyZWFkeSBoYW5k
bGUgYWxsIGNhc2VzIGFkdmFuY2VkDQo+IGRyaXZlDQo+IGNvbmZpZ3VyYXRpb24sIGluY2x1ZGUg
ZHJpdmUgZm9yIEkyQyByZWxhdGVkIHBpbnMuDQoNClRoaXMgY29tbWl0IG1lc3NhZ2UgY291bGQg
YmUgaW1wcm92ZWQuIEkgc3VnZ2VzdCB1c2luZyB0aGUgZm9sbG93aW5nDQpjb21taXQNCm1lc3Nh
Z2U6DQoNClRoZSBiaWFzX2NvbWJvIGdldHRlci9zZXR0ZXIgaXMgYWxyZWFkeSBhYmxlIHRvIGhh
bmRsZSBhZHZhbmNlZCBkcml2ZQ0KY29uZmlndXJhdGlvbiwgd2hpY2ggaXMgdGhlIHJlYXNvbiBj
b21taXQgMzUzZDJlZjc3ZjJiICgiZHQtYmluZGluZ3M6DQpwaW5jdHJsOg0KbXQ4MTkyOiBVc2Ug
Z2VuZXJpYyBiaWFzIGluc3RlYWQgb2YgcHVsbC0qLWFkdiIpIGRyb3BwZWQgdGhlIHB1bGwtdXAt
DQphZHYgYW5kDQpwdWxsLWRvd24tYWR2IHByb3BlcnRpZXMgZnJvbSB0aGUgYmluZGluZy4gV2l0
aCB0aG9zZSBwcm9wZXJ0aWVzDQpyZW1vdmVkLA0KdGhlcmUncyBubyBsb25nZXIgYW55IHVzZSBm
b3IgdGhlIGFkdl9wdWxsIGNhbGxiYWNrcywgc28gZHJvcCB0aGVtLg0KDQpXaGVuIGNvbW1pdCBp
bmZvIGluY2x1ZGUgaW5mbyAiY29tbWl0IDM1M2QyZWY3N2YyYiIsIGxvY2FsIGNoZWNrIHBhdGhj
aA0Kd2lsbCByZXBvcnQgIldBUk5JTkc6VU5LTk9XTl9DT01NSVRfSU86IFVua25vdyBjb21taXQg
aWQNCiczNTNkMmVmNzdmMmInIiwgc28gaXNuJ3QgYWRkIHRob3NlIGNvbW1pdCBpbmZvIGhlcmUu
IHRoYW5rcyENCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEd1b2RvbmcgTGl1IDxndW9kb25nLmxpdUBt
ZWRpYXRlay5jb20+DQoNClJldmlld2VkLWJ5OiBOw61jb2xhcyBGLiBSLiBBLiBQcmFkbyA8bmZy
YXByYWRvQGNvbGxhYm9yYS5jb20+DQpUZXN0ZWQtYnk6IE7DrWNvbGFzIEYuIFIuIEEuIFByYWRv
IDxuZnJhcHJhZG9AY29sbGFib3JhLmNvbT4NCg0KVGhhbmtzLA0KTsOtY29sYXMNCg==


