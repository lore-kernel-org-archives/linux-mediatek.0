Return-Path: <SRS0=fB7w=DM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CBD1C4363A
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Oct 2020 07:31:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5868205F4
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Oct 2020 07:31:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aiBDM2tt";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="jc6flCCH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B5868205F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JJvl1Py+wgFslXryWDHLwOp+hMflXGU9MuhyVvBNZUE=; b=aiBDM2tt+1XPsvKMG88ZFMAY8
	8sgES0tY/9v8kaSBCJFJve+JFX/ig1lkRKBE7ZJW830hW9YDJYyXT4iIdPHwsKpkwVcJDkHlW/+bX
	GmwzbJiW21AZvu3Bmx54GnFhj6YYuWlZlZTgfNfIZ4m+yyZRHQVsxXXm8TkW9Y3E0O3Pjlc3BMi91
	03JY1oJp5PLCJjsIE0Wq8vFfHBJl+OPVbzUmePaNfVCMnfHRGTk9vcbgdYe0Jsdlim7PDc5l25WT1
	lLb3GvDUrBejX+Lj9a6ZvsSc9ge9lYgzBxwkTa1gbfZSZCm05NG2BluIrqO9H8SzPxiBe8oNHESF2
	RtwpLmxig==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPKy0-00087V-Ay; Mon, 05 Oct 2020 07:31:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPKxt-000869-5g; Mon, 05 Oct 2020 07:31:25 +0000
X-UUID: f61ec15261384dc39de97b8e1a139db4-20201004
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=7EnrdO3x7asX9gTBacmmrzjObvtt04/zORNX+OpwJXg=; 
 b=jc6flCCH9zmnOil4U8qr3ODs5lxQ8OBSH+4DPbecZ1wNMWvpx79Z+IxBhOQOfbtnclJDhWb78DN71ZOw2P5p5CmCWWeSr2hOg4k/qkz1Gn6iQeKiv3pGm85pqDf72y86gHS3WlIjESTFqkDscvgfxeVXd/JHzyPadIWcMRZkbic=;
X-UUID: f61ec15261384dc39de97b8e1a139db4-20201004
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <neal.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1785874299; Sun, 04 Oct 2020 23:30:59 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 5 Oct 2020 00:20:56 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 5 Oct 2020 15:20:49 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 5 Oct 2020 15:20:48 +0800
Message-ID: <1601882449.15742.4.camel@mtkswgap22>
Subject: Re: [PATCH v7 2/2] soc: mediatek: add mt6779 devapc driver
From: Neal Liu <neal.liu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 5 Oct 2020 15:20:49 +0800
In-Reply-To: <CAAOTY_-KTs6-5ZpzAWs0Yn-R3AJc8tRhDyKbp8bx60EJtfu-_Q@mail.gmail.com>
References: <1598497593-15781-1-git-send-email-neal.liu@mediatek.com>
 <1598497593-15781-3-git-send-email-neal.liu@mediatek.com>
 <CAAOTY_-KTs6-5ZpzAWs0Yn-R3AJc8tRhDyKbp8bx60EJtfu-_Q@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 1231EE9725B1C9C9F42046DE7BAF97293F3EDAC9A16F4C5A7FAF9C62563B81552000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201005_033121_676252_06949360 
X-CRM114-Status: GOOD (  22.56  )
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
Cc: DTML <devicetree@vger.kernel.org>, wsd_upstream <wsd_upstream@mediatek.com>,
 lkml <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Neal Liu <neal.liu@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGkgQ2h1bi1LdWFuZywNCg0KT24gU2F0LCAyMDIwLTEwLTAzIGF0IDAwOjI0ICswODAwLCBDaHVu
LUt1YW5nIEh1IHdyb3RlOg0KPiBIaSwgTmVhbDoNCj4gDQo+IE5lYWwgTGl1IDxuZWFsLmxpdUBt
ZWRpYXRlay5jb20+IOaWvCAyMDIw5bm0OOaciDI35pelIOmAseWbmyDkuIrljYgxMTowN+Wvq+mB
k++8mg0KPiA+DQo+ID4gTWVkaWFUZWsgYnVzIGZhYnJpYyBwcm92aWRlcyBUcnVzdFpvbmUgc2Vj
dXJpdHkgc3VwcG9ydCBhbmQgZGF0YQ0KPiA+IHByb3RlY3Rpb24gdG8gcHJldmVudCBzbGF2ZXMg
ZnJvbSBiZWluZyBhY2Nlc3NlZCBieSB1bmV4cGVjdGVkDQo+ID4gbWFzdGVycy4NCj4gPiBUaGUg
c2VjdXJpdHkgdmlvbGF0aW9uIGlzIGxvZ2dlZCBhbmQgc2VudCB0byB0aGUgcHJvY2Vzc29yIGZv
cg0KPiA+IGZ1cnRoZXIgYW5hbHlzaXMgb3IgY291bnRlcm1lYXN1cmVzLg0KPiA+DQo+ID4gQW55
IG9jY3VycmVuY2Ugb2Ygc2VjdXJpdHkgdmlvbGF0aW9uIHdvdWxkIHJhaXNlIGFuIGludGVycnVw
dCwgYW5kDQo+ID4gaXQgd2lsbCBiZSBoYW5kbGVkIGJ5IG10ay1kZXZhcGMgZHJpdmVyLiBUaGUg
dmlvbGF0aW9uDQo+ID4gaW5mb3JtYXRpb24gaXMgcHJpbnRlZCBpbiBvcmRlciB0byBmaW5kIHRo
ZSBtdXJkZXJlci4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IE5lYWwgTGl1IDxuZWFsLmxpdUBt
ZWRpYXRlay5jb20+DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvc29jL21lZGlhdGVrL0tjb25maWcg
ICAgICB8ICAgIDkgKysNCj4gPiAgZHJpdmVycy9zb2MvbWVkaWF0ZWsvTWFrZWZpbGUgICAgIHwg
ICAgMSArDQo+ID4gIGRyaXZlcnMvc29jL21lZGlhdGVrL210ay1kZXZhcGMuYyB8ICAzMDUgKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiA+ICAzIGZpbGVzIGNoYW5nZWQs
IDMxNSBpbnNlcnRpb25zKCspDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3NvYy9t
ZWRpYXRlay9tdGstZGV2YXBjLmMNCj4gPg0KPiANCj4gW3NuaXBdDQo+IA0KPiA+ICsNCj4gPiAr
c3RhdGljIGludCBtdGtfZGV2YXBjX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYp
DQo+ID4gK3sNCj4gPiArICAgICAgIHN0cnVjdCBkZXZpY2Vfbm9kZSAqbm9kZSA9IHBkZXYtPmRl
di5vZl9ub2RlOw0KPiA+ICsgICAgICAgc3RydWN0IG10a19kZXZhcGNfY29udGV4dCAqY3R4Ow0K
PiA+ICsgICAgICAgdTMyIGRldmFwY19pcnE7DQo+ID4gKyAgICAgICBpbnQgcmV0Ow0KPiA+ICsN
Cj4gPiArICAgICAgIGlmIChJU19FUlIobm9kZSkpDQo+ID4gKyAgICAgICAgICAgICAgIHJldHVy
biAtRU5PREVWOw0KPiA+ICsNCj4gPiArICAgICAgIGN0eCA9IGRldm1fa3phbGxvYygmcGRldi0+
ZGV2LCBzaXplb2YoKmN0eCksIEdGUF9LRVJORUwpOw0KPiA+ICsgICAgICAgaWYgKCFjdHgpDQo+
ID4gKyAgICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOw0KPiA+ICsNCj4gPiArICAgICAgIGN0
eC0+ZGF0YSA9IG9mX2RldmljZV9nZXRfbWF0Y2hfZGF0YSgmcGRldi0+ZGV2KTsNCj4gPiArICAg
ICAgIGN0eC0+ZGV2ID0gJnBkZXYtPmRldjsNCj4gPiArDQo+ID4gKyAgICAgICBjdHgtPmluZnJh
X2Jhc2UgPSBvZl9pb21hcChub2RlLCAwKTsNCj4gPiArICAgICAgIGlmICghY3R4LT5pbmZyYV9i
YXNlKQ0KPiA+ICsgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4gPiArDQo+ID4gKyAg
ICAgICBkZXZhcGNfaXJxID0gaXJxX29mX3BhcnNlX2FuZF9tYXAobm9kZSwgMCk7DQo+ID4gKyAg
ICAgICBpZiAoIWRldmFwY19pcnEpDQo+ID4gKyAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFM
Ow0KPiA+ICsNCj4gPiArICAgICAgIGN0eC0+aW5mcmFfY2xrID0gZGV2bV9jbGtfZ2V0KCZwZGV2
LT5kZXYsICJkZXZhcGMtaW5mcmEtY2xvY2siKTsNCj4gPiArICAgICAgIGlmIChJU19FUlIoY3R4
LT5pbmZyYV9jbGspKQ0KPiA+ICsgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4gPiAr
DQo+ID4gKyAgICAgICBpZiAoY2xrX3ByZXBhcmVfZW5hYmxlKGN0eC0+aW5mcmFfY2xrKSkNCj4g
PiArICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+IA0KPiBXaGF0IHdvdWxkIGhhcHBl
biBpZiB5b3UgZG8gbm90IGVuYWJsZSB0aGlzIGNsb2NrPyBJIHRoaW5rIHRoaXMNCj4gaGFyZHdh
cmUgaXMgYWxyZWFkeSBpbml0aWFsaXplZCBpbiB0cnVzdCB6b25lLg0KPiANCj4gUmVnYXJkcywN
Cj4gQ2h1bi1LdWFuZy4NCg0KSXQgY2Fubm90IGhhbmRsZSB2aW9sYXRpb24gaWYgdGhlIGNsb2Nr
IGlzIGRpc2FibGVkLg0KVGhpcyBwYXJ0cyBvZiBoYXJkd2FyZSBpcyBub3QgaW5pdGlhbGl6ZWQg
aW4gVHJ1c3Rab25lLg0KDQpUaGUgYW5vdGhlciBwYXJ0cyBvZiBoYXJkd2FyZSBpcyBpbml0aWFs
aXplZCBpbiBUcnVzdFpvbmUgd2hpY2ggaXMNCnJlc3BvbnNpYmxlIGZvciBwZXJtaXNzaW9uIGNv
bnRyb2wuIEkgdGhpbmsgdGhhdCBpcyB0aGUgcGFydCB3aGF0IHlvdQ0KaW50ZW5kIHRvIGV4cHJl
c3MuDQoNCi1OZWFsDQoNCj4gDQo+ID4gKw0KPiA+ICsgICAgICAgcmV0ID0gZGV2bV9yZXF1ZXN0
X2lycSgmcGRldi0+ZGV2LCBkZXZhcGNfaXJxLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAoaXJxX2hhbmRsZXJfdClkZXZhcGNfdmlvbGF0aW9uX2lycSwNCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgSVJRRl9UUklHR0VSX05PTkUsICJkZXZhcGMiLCBjdHgp
Ow0KPiA+ICsgICAgICAgaWYgKHJldCkgew0KPiA+ICsgICAgICAgICAgICAgICBjbGtfZGlzYWJs
ZV91bnByZXBhcmUoY3R4LT5pbmZyYV9jbGspOw0KPiA+ICsgICAgICAgICAgICAgICByZXR1cm4g
cmV0Ow0KPiA+ICsgICAgICAgfQ0KPiA+ICsNCj4gPiArICAgICAgIHBsYXRmb3JtX3NldF9kcnZk
YXRhKHBkZXYsIGN0eCk7DQo+ID4gKw0KPiA+ICsgICAgICAgc3RhcnRfZGV2YXBjKGN0eCk7DQo+
ID4gKw0KPiA+ICsgICAgICAgcmV0dXJuIDA7DQo+ID4gK30NCj4gPiArDQoNCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxp
bmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
