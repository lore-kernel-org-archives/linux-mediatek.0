Return-Path: <SRS0=M7U7=AV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2222EC433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2020 03:34:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E31D12065C
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2020 03:34:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="D0+4LcRa";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="DwJIium/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E31D12065C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BgYXfq+D4NePZ2BOWEOXcvaLJ1hOMQfOzcEIZTHsQxE=; b=D0+4LcRaAN9LCpZMNY0/drgCM
	I8cnNbUdA04vNbIemalUghVeE3u8BuJIO+qOUoE0mnCRFGmAPbwFpL540FKSG9M4JGSlEH5OoxGdM
	me55YlM4AIfziWA7LMfiefB4Cg2gP/1xPxaXtgb/HuLJ7wJiTMk98V1DqbRTMuvFlY2+sn/wo+Vnz
	iI6eYw0l8NUZcjdBPR78QQ7b8XFPGqgWKvizw1WwQc9cjfj6jKYRfggTx3OzeZmCtQmnRA8gRs6ru
	QzthB+Zl/hLR7MijSlIFqNmcFYZMlJ2S7+y+0NFiSiBIfE0awrAnwkWFAhSIUcuizYw5xQUTqk3k7
	MHQea9Uhw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtjna-0001x6-9M; Fri, 10 Jul 2020 03:34:06 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtjnW-0001wO-IL; Fri, 10 Jul 2020 03:34:03 +0000
X-UUID: 69ecadd81ab143a7aa5f210807460fa9-20200709
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=aVokGLS8swWtFu2TZi5OW5HHpT2IA0OUoFqf4tEbDBo=; 
 b=DwJIium/PwrDuzlJmWByXQFyM3iXeRpfDrUmFQFq3lRg+DazSMB3M+Yq7Ri/J+GQKRD78UFtq31KGa2f+w+PgFEW6PtDr0hYgclr1SNtTogAG0Mr+lSozf8emp0XG7TANl++r5EeyU3X7G/NpRRLbEKcy9WMn03T3khVXOblRlU=;
X-UUID: 69ecadd81ab143a7aa5f210807460fa9-20200709
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <neal.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 91141051; Thu, 09 Jul 2020 19:33:49 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 9 Jul 2020 20:23:49 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Jul 2020 11:23:42 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 10 Jul 2020 11:23:43 +0800
Message-ID: <1594351423.4670.18.camel@mtkswgap22>
Subject: Re: [PATCH v2 2/2] soc: mediatek: add mtk-devapc driver
From: Neal Liu <neal.liu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 10 Jul 2020 11:23:43 +0800
In-Reply-To: <CAAOTY_-7PwoPG_0ce2p4BCNQ3rundg40Bsni14XSmVETExkKkw@mail.gmail.com>
References: <1594285927-1840-1-git-send-email-neal.liu@mediatek.com>
 <1594285927-1840-3-git-send-email-neal.liu@mediatek.com>
 <CAAOTY_-7PwoPG_0ce2p4BCNQ3rundg40Bsni14XSmVETExkKkw@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200709_233402_790002_9FA60E05 
X-CRM114-Status: GOOD (  22.82  )
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
Cc: devicetree@vger.kernel.org, wsd_upstream <wsd_upstream@mediatek.com>,
 lkml <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Neal Liu <neal.liu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGkgQ2h1bi1LdWFuZywNCg0KVGhhbmtzIGZvciB5b3VyIHJldmlldy4NCg0KT24gVGh1LCAyMDIw
LTA3LTA5IGF0IDIxOjAxICswODAwLCBDaHVuLUt1YW5nIEh1IHdyb3RlOg0KPiBIaSwgTmVhbDoN
Cj4gDQo+IE5lYWwgTGl1IDxuZWFsLmxpdUBtZWRpYXRlay5jb20+IOaWvCAyMDIw5bm0N+aciDnm
l6Ug6YCx5ZubIOS4i+WNiDU6MTPlr6vpgZPvvJoNCj4gPg0KPiA+IE1lZGlhVGVrIGJ1cyBmYWJy
aWMgcHJvdmlkZXMgVHJ1c3Rab25lIHNlY3VyaXR5IHN1cHBvcnQgYW5kIGRhdGENCj4gPiBwcm90
ZWN0aW9uIHRvIHByZXZlbnQgc2xhdmVzIGZyb20gYmVpbmcgYWNjZXNzZWQgYnkgdW5leHBlY3Rl
ZA0KPiA+IG1hc3RlcnMuDQo+ID4gVGhlIHNlY3VyaXR5IHZpb2xhdGlvbiBpcyBsb2dnZWQgYW5k
IHNlbnQgdG8gdGhlIHByb2Nlc3NvciBmb3INCj4gPiBmdXJ0aGVyIGFuYWx5c2lzIG9yIGNvdW50
ZXJtZWFzdXJlcy4NCj4gPg0KPiA+IEFueSBvY2N1cnJlbmNlIG9mIHNlY3VyaXR5IHZpb2xhdGlv
biB3b3VsZCByYWlzZSBhbiBpbnRlcnJ1cHQsIGFuZA0KPiA+IGl0IHdpbGwgYmUgaGFuZGxlZCBi
eSBtdGstZGV2YXBjIGRyaXZlci4gVGhlIHZpb2xhdGlvbg0KPiA+IGluZm9ybWF0aW9uIGlzIHBy
aW50ZWQgaW4gb3JkZXIgdG8gZmluZCB0aGUgbXVyZGVyZXIuDQo+ID4NCj4gPiBTaWduZWQtb2Zm
LWJ5OiBOZWFsIExpdSA8bmVhbC5saXVAbWVkaWF0ZWsuY29tPg0KPiANCj4gW3NuaXBdDQo+IA0K
PiA+ICsNCj4gPiArc3RhdGljIHUzMiBnZXRfc2hpZnRfZ3JvdXAoc3RydWN0IG10a19kZXZhcGNf
Y29udGV4dCAqZGV2YXBjX2N0eCwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQg
c2xhdmVfdHlwZSwgaW50IHZpb19pZHgpDQo+IA0KPiB2aW9faWR4ICBpcyB1c2VsZXNzLCBzbyBy
ZW1vdmUgaXQuDQo+IA0KDQp5ZXMsIG15IG1pc3Rha2UuIEknbGwgcmVtb3ZlIGl0IG9uIG5leHQg
cGF0Y2guDQoNCj4gPiArew0KPiA+ICsgICAgICAgdTMyIHZpb19zaGlmdF9zdGE7DQo+ID4gKyAg
ICAgICB2b2lkIF9faW9tZW0gKnJlZzsNCj4gPiArICAgICAgIGludCBiaXQ7DQo+ID4gKw0KPiA+
ICsgICAgICAgcmVnID0gbXRrX2RldmFwY19wZF9nZXQoZGV2YXBjX2N0eCwgc2xhdmVfdHlwZSwg
VklPX1NISUZUX1NUQSwgMCk7DQo+ID4gKyAgICAgICB2aW9fc2hpZnRfc3RhID0gcmVhZGwocmVn
KTsNCj4gPiArDQo+ID4gKyAgICAgICBmb3IgKGJpdCA9IDA7IGJpdCA8IDMyOyBiaXQrKykgew0K
PiA+ICsgICAgICAgICAgICAgICBpZiAoKHZpb19zaGlmdF9zdGEgPj4gYml0KSAmIDB4MSkNCj4g
PiArICAgICAgICAgICAgICAgICAgICAgICBicmVhazsNCj4gPiArICAgICAgIH0NCj4gPiArDQo+
ID4gKyAgICAgICByZXR1cm4gYml0Ow0KPiA+ICt9DQo+ID4gKw0KPiANCj4gW3NuaXBdDQo+IA0K
PiA+ICsNCj4gPiArLyoNCj4gPiArICogZGV2YXBjX3Zpb2xhdGlvbl9pcnEgLSB0aGUgZGV2YXBj
IEludGVycnVwdCBTZXJ2aWNlIFJvdXRpbmUgKElTUikgd2lsbCBkdW1wDQo+ID4gKyAqICAgICAg
ICAgICAgICAgICAgICAgICB2aW9sYXRpb24gaW5mb3JtYXRpb24gaW5jbHVkaW5nIHdoaWNoIG1h
c3RlciB2aW9sYXRlcw0KPiA+ICsgKiAgICAgICAgICAgICAgICAgICAgICAgYWNjZXNzIHNsYXZl
Lg0KPiA+ICsgKi8NCj4gPiArc3RhdGljIGlycXJldHVybl90IGRldmFwY192aW9sYXRpb25faXJx
KGludCBpcnFfbnVtYmVyLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBzdHJ1Y3QgbXRrX2RldmFwY19jb250ZXh0ICpkZXZhcGNfY3R4KQ0KPiA+ICt7DQo+ID4g
KyAgICAgICBjb25zdCBzdHJ1Y3QgbXRrX2RldmljZV9pbmZvICoqZGV2aWNlX2luZm87DQo+ID4g
KyAgICAgICBpbnQgc2xhdmVfdHlwZV9udW07DQo+ID4gKyAgICAgICBpbnQgdmlvX2lkeCA9IC0x
Ow0KPiA+ICsgICAgICAgaW50IHNsYXZlX3R5cGU7DQo+ID4gKw0KPiA+ICsgICAgICAgc2xhdmVf
dHlwZV9udW0gPSBkZXZhcGNfY3R4LT5zbGF2ZV90eXBlX251bTsNCj4gPiArICAgICAgIGRldmlj
ZV9pbmZvID0gZGV2YXBjX2N0eC0+ZGV2aWNlX2luZm87DQo+ID4gKw0KPiA+ICsgICAgICAgZm9y
IChzbGF2ZV90eXBlID0gMDsgc2xhdmVfdHlwZSA8IHNsYXZlX3R5cGVfbnVtOyBzbGF2ZV90eXBl
KyspIHsNCj4gDQo+IElmIHNsYXZlX3R5cGVfbnVtIGlzIDEsIEkgdGhpbmsgdGhlIGNvZGUgc2hv
dWxkIGJlIHNpbXBsZXIuDQoNCnNsYXZlX3R5cGVfbnVtIGlzIGRlcGVuZHMgb24gRFQgZGF0YSwg
aXQncyBub3QgYWx3YXlzIDEuDQoNCj4gDQo+ID4gKyAgICAgICAgICAgICAgIGlmICghbXRrX2Rl
dmFwY19kdW1wX3Zpb19kYmcoZGV2YXBjX2N0eCwgc2xhdmVfdHlwZSwgJnZpb19pZHgpKQ0KPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOw0KPiA+ICsNCj4gPiArICAgICAgICAg
ICAgICAgLyogRW5zdXJlIHRoYXQgdmlvbGF0aW9uIGluZm8gYXJlIHdyaXR0ZW4gYmVmb3JlDQo+
ID4gKyAgICAgICAgICAgICAgICAqIGZ1cnRoZXIgb3BlcmF0aW9ucw0KPiA+ICsgICAgICAgICAg
ICAgICAgKi8NCj4gPiArICAgICAgICAgICAgICAgc21wX21iKCk7DQo+ID4gKw0KPiA+ICsgICAg
ICAgICAgICAgICBtYXNrX21vZHVsZV9pcnEoZGV2YXBjX2N0eCwgc2xhdmVfdHlwZSwgdmlvX2lk
eCwgdHJ1ZSk7DQo+IA0KPiBXaHkgZG8geW91IG1hc2sgaXJxPw0KDQpJdCBoYXMgdG8gbWFzayBz
bGF2ZSdzIGlycSBiZWZvcmUgY2xlYXIgdmlvbGF0aW9uIHN0YXR1cy4NCkl0J3Mgb25lIG9mIGhh
cmR3YXJlIGRlc2lnbi4NCg0KPiANCj4gPiArDQo+ID4gKyAgICAgICAgICAgICAgIGNsZWFyX3Zp
b19zdGF0dXMoZGV2YXBjX2N0eCwgc2xhdmVfdHlwZSwgdmlvX2lkeCk7DQo+ID4gKw0KPiA+ICsg
ICAgICAgICAgICAgICBtYXNrX21vZHVsZV9pcnEoZGV2YXBjX2N0eCwgc2xhdmVfdHlwZSwgdmlv
X2lkeCwgZmFsc2UpOw0KPiA+ICsgICAgICAgfQ0KPiA+ICsNCj4gPiArICAgICAgIHJldHVybiBJ
UlFfSEFORExFRDsNCj4gPiArfQ0KPiA+ICsNCj4gPiArLyoNCj4gPiArICogc3RhcnRfZGV2YXBj
IC0gaW5pdGlhbGl6ZSBkZXZhcGMgc3RhdHVzIGFuZCBzdGFydCByZWNlaXZpbmcgaW50ZXJydXB0
DQo+ID4gKyAqICAgICAgICAgICAgICAgd2hpbGUgZGV2YXBjIHZpb2xhdGlvbiBpcyB0cmlnZ2Vy
ZWQuDQo+ID4gKyAqLw0KPiANCj4gW3NuaXBdDQo+IA0KPiA+ICsNCj4gPiArc3RydWN0IG10a19k
ZXZpY2VfaW5mbyB7DQo+ID4gKyAgICAgICBpbnQgc3lzX2luZGV4Ow0KPiANCj4gVXNlbGVzcywg
c28gcmVtb3ZlIGl0Lg0KDQpXZSBuZWVkIHRvIHByaW50IGl0IGFzIG91ciBkZWJ1ZyBpbmZvcm1h
dGlvbi4NCkJ1dCBJIGRpZCBub3QgYXBwbHkgaXQgb24gdGhpcyBwYXRjaCwgSSdsbCBhZGQgaXQg
b24gbmV4dCBwYXRjaC4NCg0KPiANCj4gPiArICAgICAgIGludCBjdHJsX2luZGV4Ow0KPiANCj4g
RGl0dG8uDQo+IA0KPiBSZWdhcmRzLA0KPiBDaHVuLUt1YW5nLg0KPiANCj4gPiArICAgICAgIGlu
dCB2aW9faW5kZXg7DQo+ID4gK307DQo+ID4gKw0KDQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgt
bWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
