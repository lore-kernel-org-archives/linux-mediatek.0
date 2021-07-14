Return-Path: <SRS0=d5Ie=MG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CBF4C11F66
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 10:34:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 661E261178
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 10:34:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 661E261178
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8yzz/ncfJa8UKjSVuJaVCSN3hOm6LLzhs3wd+xx10pM=; b=AWIJS7K/203gGz
	+uAYxEK02aekrr5PYoSp2cNy5LZivDo4gUZmgWuCNiMaRy3xRoV5fUwE9q3Kvx1k/QqY6xJ+UD0li
	V6FekvW4Qzng2G13QCWsQFyvZVU2ZH6WXWqGNhZsc8THahqKkXukEeH2muX2Lo2nV4CgYZvRZfBtQ
	eTEckFV7EBUv/H0/15PSaHNTjJcCM2qGh8z6Abjhwd7ITE8Jit+0CpVmYHf+oWLdCMEQrLk30gHHW
	c9DLcScbzK9wffd7B4TtY0tyLcu0qIqyp+6aTKtrAgvw9llP/y4TRikpbTgQT3NUAU/+oxnygSor0
	10cjhRLpyDvOelnf/IwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3cDH-00DAWT-N6; Wed, 14 Jul 2021 10:33:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3c9l-00D953-Cy; Wed, 14 Jul 2021 10:30:28 +0000
X-UUID: 5481b59f0fe64e7494c05f8af485b30e-20210714
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=aMvi45gbpJSoRaiIcIqBkq7M/xz+yG1kS/cPkMPAaJA=; 
 b=iIEWfWOp6Dz2l/1ThPsg0itw4MG1mWyXzSdhvgGw1x/SoMBzOu3XZOp5/Vj+JTzEpF5KnnuQSQMdqooWyu7WhUTkAyKLWhyPPrqWtBxB9jxl+BvIe5PFTTLNMATJ+YX5qiAIF8R5Xj2g/3YAbfrh187V/6MEbyNwFZhMPue1g4M=;
X-UUID: 5481b59f0fe64e7494c05f8af485b30e-20210714
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <chuanjia.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 397249708; Wed, 14 Jul 2021 03:30:18 -0700
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 14 Jul 2021 03:30:16 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 14 Jul 2021 18:30:08 +0800
Received: from [10.17.3.153] (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 14 Jul 2021 18:30:07 +0800
Message-ID: <1626258607.13880.9.camel@mhfsdcap03>
Subject: Re: [PATCH v10 2/4] PCI: mediatek: Add new method to get shared
 pcie-cfg base address and parse node
From: Chuanjia Liu <chuanjia.liu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
CC: <lorenzo.pieralisi@arm.com>, <robh+dt@kernel.org>, <bhelgaas@google.com>, 
 <ryder.lee@mediatek.com>, <jianjun.wang@mediatek.com>,
 <yong.wu@mediatek.com>, <linux-pci@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "Frank Wunderlich" <frank-w@public-files.de>
Date: Wed, 14 Jul 2021 18:30:07 +0800
In-Reply-To: <e462d9f0-2fa3-6106-f060-9753dc604b9f@gmail.com>
References: <20210611060902.12418-1-chuanjia.liu@mediatek.com>
 <20210611060902.12418-3-chuanjia.liu@mediatek.com>
 <e462d9f0-2fa3-6106-f060-9753dc604b9f@gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_033021_503954_B44762BF 
X-CRM114-Status: GOOD (  25.42  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gVHVlLCAyMDIxLTA3LTEzIGF0IDEzOjMyICswMjAwLCBNYXR0aGlhcyBCcnVnZ2VyIHdyb3Rl
Og0KPiANCj4gT24gMTEvMDYvMjAyMSAwODowOSwgQ2h1YW5qaWEgTGl1IHdyb3RlOg0KPiA+IEZv
ciB0aGUgbmV3IGR0cyBmb3JtYXQsIGFkZCBhIG5ldyBtZXRob2QgdG8gZ2V0DQo+ID4gc2hhcmVk
IHBjaWUtY2ZnIGJhc2UgYWRkcmVzcyBhbmQgcGFyc2Ugbm9kZS4NCj4gPiANCj4gPiBTaWduZWQt
b2ZmLWJ5OiBDaHVhbmppYSBMaXUgPGNodWFuamlhLmxpdUBtZWRpYXRlay5jb20+DQo+ID4gQWNr
ZWQtYnk6IFJ5ZGVyIExlZSA8cnlkZXIubGVlQG1lZGlhdGVrLmNvbT4NCj4gDQo+IFlvdSBtaXNz
ZWQgdGhlDQo+IFJldmlld2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPg0KPiBn
aXZlbiBpbiB2OC4gT3Igd2VyZSB0aGVyZSBhbnkgc3Vic3RhbnRpYWwgY2hhbmdlcyBpbiB0aGlz
IHBhdGNoPw0KPiANClRoYW5rcyBmb3IgeW91ciByZXZpZXchDQoNCk9ubHkgYSBzbWFsbCBjaGFu
Z2XvvIxhcyBzaG93biBiZWxvdw0KDQogCQlpZiAoZXJyKQ0KLQkJCWdvdG8gZXJyb3JfcHV0X25v
ZGU7DQorCQkJcmV0dXJuIGVycjsNCiAJfQ0KSSBoYXZlIGEgZGVzY3JpcHRpb24gaW4gdGhlIFY5
IHZlcnNpb246DQpmaXgga2VybmVsLWNpIGJvdCB3YXJuaW5n77yMSW4gdGhlIHNjZW5lIG9mIHVz
aW5nIG5ldyBkdHMgZm9ybWF0LA0Kd2hlbiBtdGtfcGNpZV9wYXJzZV9wb3J0IGZhaWxzLCBvZl9u
b2RlX3B1dCBkb24ndCBuZWVkIHRvIGJlIGNhbGxlZC4NCg0KU28gSSBkaWRuJ3QgYWRkIHJldmll
d2VkLWJ5IHJvYiBiZWNhdXNlIEkgY2hhbmdlZCB0aGUgcGF0Y2jjgIINCj4gPiAtLS0NCj4gPiAg
ZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2llLW1lZGlhdGVrLmMgfCA1MiArKysrKysrKysrKysr
KysrKysrLS0tLS0tLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMzkgaW5zZXJ0aW9ucygrKSwgMTMg
ZGVsZXRpb25zKC0pDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGNpL2NvbnRyb2xs
ZXIvcGNpZS1tZWRpYXRlay5jIGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2llLW1lZGlhdGVr
LmMNCj4gPiBpbmRleCA2MmEwNDJlNzVkOWEuLjk1MGY1NzdhMmY0NCAxMDA2NDQNCj4gPiAtLS0g
YS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL3BjaWUtbWVkaWF0ZWsuYw0KPiA+ICsrKyBiL2RyaXZl
cnMvcGNpL2NvbnRyb2xsZXIvcGNpZS1tZWRpYXRlay5jDQo+ID4gQEAgLTE0LDYgKzE0LDcgQEAN
Cj4gPiAgI2luY2x1ZGUgPGxpbnV4L2lycWNoaXAvY2hhaW5lZF9pcnEuaD4NCj4gPiAgI2luY2x1
ZGUgPGxpbnV4L2lycWRvbWFpbi5oPg0KPiA+ICAjaW5jbHVkZSA8bGludXgva2VybmVsLmg+DQo+
ID4gKyNpbmNsdWRlIDxsaW51eC9tZmQvc3lzY29uLmg+DQo+ID4gICNpbmNsdWRlIDxsaW51eC9t
c2kuaD4NCj4gPiAgI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPg0KPiA+ICAjaW5jbHVkZSA8bGlu
dXgvb2ZfYWRkcmVzcy5oPg0KPiA+IEBAIC0yMyw2ICsyNCw3IEBADQo+ID4gICNpbmNsdWRlIDxs
aW51eC9waHkvcGh5Lmg+DQo+ID4gICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4N
Cj4gPiAgI2luY2x1ZGUgPGxpbnV4L3BtX3J1bnRpbWUuaD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4
L3JlZ21hcC5oPg0KPiA+ICAjaW5jbHVkZSA8bGludXgvcmVzZXQuaD4NCj4gPiAgDQo+ID4gICNp
bmNsdWRlICIuLi9wY2kuaCINCj4gPiBAQCAtMjA3LDYgKzIwOSw3IEBAIHN0cnVjdCBtdGtfcGNp
ZV9wb3J0IHsNCj4gPiAgICogc3RydWN0IG10a19wY2llIC0gUENJZSBob3N0IGluZm9ybWF0aW9u
DQo+ID4gICAqIEBkZXY6IHBvaW50ZXIgdG8gUENJZSBkZXZpY2UNCj4gPiAgICogQGJhc2U6IElP
IG1hcHBlZCByZWdpc3RlciBiYXNlDQo+ID4gKyAqIEBjZmc6IElPIG1hcHBlZCByZWdpc3RlciBt
YXAgZm9yIFBDSWUgY29uZmlnDQo+ID4gICAqIEBmcmVlX2NrOiBmcmVlLXJ1biByZWZlcmVuY2Ug
Y2xvY2sNCj4gPiAgICogQG1lbTogbm9uLXByZWZldGNoYWJsZSBtZW1vcnkgcmVzb3VyY2UNCj4g
PiAgICogQHBvcnRzOiBwb2ludGVyIHRvIFBDSWUgcG9ydCBpbmZvcm1hdGlvbg0KPiA+IEBAIC0y
MTUsNiArMjE4LDcgQEAgc3RydWN0IG10a19wY2llX3BvcnQgew0KPiA+ICBzdHJ1Y3QgbXRrX3Bj
aWUgew0KPiA+ICAJc3RydWN0IGRldmljZSAqZGV2Ow0KPiA+ICAJdm9pZCBfX2lvbWVtICpiYXNl
Ow0KPiA+ICsJc3RydWN0IHJlZ21hcCAqY2ZnOw0KPiA+ICAJc3RydWN0IGNsayAqZnJlZV9jazsN
Cj4gPiAgDQo+ID4gIAlzdHJ1Y3QgbGlzdF9oZWFkIHBvcnRzOw0KPiA+IEBAIC02NTAsNyArNjU0
LDExIEBAIHN0YXRpYyBpbnQgbXRrX3BjaWVfc2V0dXBfaXJxKHN0cnVjdCBtdGtfcGNpZV9wb3J0
ICpwb3J0LA0KPiA+ICAJCXJldHVybiBlcnI7DQo+ID4gIAl9DQo+ID4gIA0KPiA+IC0JcG9ydC0+
aXJxID0gcGxhdGZvcm1fZ2V0X2lycShwZGV2LCBwb3J0LT5zbG90KTsNCj4gPiArCWlmIChvZl9m
aW5kX3Byb3BlcnR5KGRldi0+b2Zfbm9kZSwgImludGVycnVwdC1uYW1lcyIsIE5VTEwpKQ0KPiA+
ICsJCXBvcnQtPmlycSA9IHBsYXRmb3JtX2dldF9pcnFfYnluYW1lKHBkZXYsICJwY2llX2lycSIp
Ow0KPiA+ICsJZWxzZQ0KPiA+ICsJCXBvcnQtPmlycSA9IHBsYXRmb3JtX2dldF9pcnEocGRldiwg
cG9ydC0+c2xvdCk7DQo+ID4gKw0KPiANCj4gRG8gSSB1bmRlcnN0YW5kIHRoYXQgdGhpcyBpcyB1
c2VkIGZvciBiYWNrd2FyZHMgY29tcGF0aWJpbGl0eSB3aXRoIG9sZGVyIERUUz8gSQ0KPiBqdXN0
IHdvbmRlciB3aHkgd2UgZG9uJ3QgbmVlZCB0byBtYW5kYXRlDQo+IGludGVycnVwdC1uYW1lcyA9
ICJwY2llX2lycSINCj4gaW4gdGhlIGJpbmRpbmcgZGVzY3JpcHRpb24uDQpZZXPvvIx0aGlzIGlz
IHVzZWQgZm9yIGJhY2t3YXJkcyBjb21wYXRpYmlsaXR5IHdpdGggb2xkZXIgRFRT44CCDQpJZiBu
ZWNlc3NhcnksIEkgd2lsbCBhZGQgdGhlIGZvbGxvd2luZyBpbiBiaW5kaW5nIGRlc2NyaXB0aW9u
Lg0KLSBpbnRlcnJ1cHQtbmFtZXPvvJpNdXN0IGluY2x1ZGUgdGhlIGZvbGxvd2luZyBlbnRyaWVz
77yaDQogICAgLSAicGNpZV9pcnEi77yaIFRoZSBpbnRlcnJ1cHQgdGhhdCBpcyBhc3NlcnRlZCB3
aGVuIGFuIE1TSS9JTlRYIGlzDQpyZWNlaXZlZA0KDQpCZXN0IHJlZ2FyZHMNCkNodWFuamlhDQo+
IA0KPiBSZWdhcmRzLA0KPiBNYXR0aGlhcw0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVk
aWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
