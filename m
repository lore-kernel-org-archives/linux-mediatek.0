Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C59EC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Nov 2021 08:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7qzUg8ltgYFmHxGCuDS+ZL+8I62KUY8FtGpEpXK7kOw=; b=d5p62i7zQEh1ZV
	MBNtYMSI6ikUEIJeQRJxlEWosfk91TQet7dJOkRJrNEr5E+iANOUUfKS00cerBaP9R6PocV2ZNahc
	yyXeZEXGynJ6KAB24tgu6xw/qjKQuqkYJGRT70Xp1JldBb7RfWN0Yy6BYkNU6v6ePZgXCbrE79hJI
	axmlyD4wLI83eTskGbaG8DKtJFdhIrHABZthZ48o7SkTU4anRVxyaIfdIX/qt3/PnqQ3Xu1RN9rzx
	zC2Fqxo1T5tlgXVjPPZoS2dOqxkZ026hLER4jB+m+U4SM0I55hzNr5VGKYbLPXwyOQMyY8SjN+a/J
	Z6+1DUY+MOcpUDi/tPsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqA6W-006i1o-Vj; Thu, 25 Nov 2021 08:27:40 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqA6S-006hzi-7M; Thu, 25 Nov 2021 08:27:39 +0000
X-UUID: 239fc390cdc546028cdd2f256408c730-20211125
X-UUID: 239fc390cdc546028cdd2f256408c730-20211125
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 993506265; Thu, 25 Nov 2021 01:27:32 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 25 Nov 2021 00:24:34 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 25 Nov 2021 16:24:32 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 25 Nov 2021 16:24:32 +0800
Message-ID: <d7626397a034ff429e0d915994c0ebc16f2706fe.camel@mediatek.com>
Subject: Re: [PATCH v3 2/3] mailbox: mediatek: add support for adsp mailbox
 controller
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: Tzung-Bi Shih <tzungbi@google.com>
CC: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>, "Kai
 Vehmanen" <kai.vehmanen@linux.intel.com>, Liam Girdwood
 <lgirdwood@gmail.com>, "cujomalainey@google.com" <cujomalainey@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Takashi Iwai
 <tiwai@suse.com>, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Mark Brown
 <broonie@kernel.org>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>, Daniel Baluta <daniel.baluta@nxp.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "sound-open-firmware@alsa-project.org" <sound-open-firmware@alsa-project.org>
Date: Thu, 25 Nov 2021 16:24:32 +0800
References: <20211124084514.28002-1-allen-kh.cheng@mediatek.com>
 <20211124084514.28002-3-allen-kh.cheng@mediatek.com>
 <YZ4TCYmvegnC/kR0@google.com>
 <f3642bcd031fbfd461b5efae1eba4816cc4856b2.camel@mediatek.com>
 <YZ8r9GvUFqkGCqSz@google.com>
In-Reply-To: <YZ8r9GvUFqkGCqSz@google.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211125_002736_278098_0BE90B12 
X-CRM114-Status: GOOD (  25.66  )
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

T24gVGh1LCAyMDIxLTExLTI1IGF0IDE0OjIzICswODAwLCBUenVuZy1CaSBTaGloIHdyb3RlOgo+
ID4gT24gVGh1LCBOb3YgMjUsIDIwMjEgYXQgMDk6NTE6MjdBTSArMDgwMCwgYWxsZW4ta2guY2hl
bmcgd3JvdGU6Cj4gPiA+ID4gT24gV2VkLCAyMDIxLTExLTI0IGF0IDE4OjI1ICswODAwLCBUenVu
Zy1CaSBTaGloIHdyb3RlOgo+ID4gPiA+ID4gPiA+ID4gT24gV2VkLCBOb3YgMjQsIDIwMjEgYXQg
MDQ6NDU6MTNQTSArMDgwMCwgYWxsZW4tCj4gPiA+ID4ga2guY2hlbmcgd3JvdGU6Cj4gPiA+ID4g
PiA+ID4gPiA+ID4gPiA+ICtzdGF0aWMgaW50IG10a19hZHNwX21ib3hfc2VuZF9kYXRhKHN0cnVj
dAo+ID4gPiA+ID4gPiBtYm94X2NoYW4gKmNoYW4sCj4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gPgo+
ID4gPiA+ID4gPiA+ID4gdm9pZAo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiAqZGF0YSkKPiA+ID4g
PiA+ID4gPiA+ID4gPiA+ID4gK3sKPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gKyAgc3RydWN0IGFk
c3BfbWJveF9jaF9pbmZvICpjaF9pbmZvID0gY2hhbi0KPiA+ID4gPiA+ID4gPmNvbl9wcml2Owo+
ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiArICB2b2lkIF9faW9tZW0gKnJlZyA9IGNoX2luZm8tPnZh
X3JlZzsKPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gKwo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiAr
ICBzcGluX2xvY2soJmNoX2luZm8tPmxvY2spOwo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiArICB3
cml0ZWwoY2hfaW5mby0+aXBjX29wX3ZhbCwgcmVnICsKPiA+ID4gPiA+ID4gTVRLX0FEU1BfTUJP
WF9JTl9DTUQpOwo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiArICBzcGluX3VubG9jaygmY2hfaW5m
by0+bG9jayk7Cj4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gV2h5IGRv
ZXMgaXQgbmVlZCB0aGUgbG9jaz8KPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiBJcyB0
aGUgd3JpdGUgdG8gTVRLX0FEU1BfTUJPWF9JTl9DTUQgYSBzeW5jaHJvbm91cwo+ID4gPiA+IG9w
ZXJhdGlvbj8KPiA+ID4gPiA+ID4gPiA+IC0gSWYgeWVzLCBJIGZhaWxlZCB0byB1bmRlcnN0YW5k
IHdoeSBkb2VzIGl0IG5lZWQgdGhlCj4gPiA+ID4gPiA+ID4gPiBsb2NrLiAgRXZlcnkKPiA+ID4g
PiA+ID4gPiA+IGNhbGxzIHRvIG10a19hZHNwX21ib3hfc2VuZF9kYXRhKCkgc2hvdWxkIHdhaXQg
Zm9yIHRoZQo+ID4gPiA+IGRhdGEKPiA+ID4gCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IHRyYW5z
ZmVyCj4gPiA+ID4gPiA+ID4gPiBjb21wbGV0aW9uLgo+ID4gPiA+ID4gPiA+ID4gLSBJZiBubywg
SSBhbHNvIGZhaWxlZCB0byB1bmRlcnN0YW5kCj4gPiA+IAo+ID4gPiA+ID4gPgo+ID4gPiA+ID4g
PiB3aHkuICBtdGtfYWRzcF9tYm94X3NlbmRfZGF0YSgpCj4gPiA+ID4gPiA+ID4gPiBoYXMgbm8g
d2F5IHRvIGJlIGF3YXJlIG9mIHRoZSB0cmFuc2Zlcgo+ID4gPiA+IGNvbXBsZXRpb24uICBXb3Vs
ZAo+ID4gPiA+ID4gPiA+ID4gZXhwZWN0IGEKPiA+ID4gPiA+ID4gPiA+IGxvb3AgZm9yIGNoZWNr
aW5nIHRoZSBjb21wbGV0aW9uIGZvciB0aGUgY2FzZS4KPiA+ID4gPiA+ID4gPiA+Cj4gPiA+IAo+
ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiAgCj4gPiAKPiA+ID4gPgo+ID4gPiA+IEluIEFEU1AgTUJP
WCBJUEMgZmxvdywKPiA+ID4gPiAgCj4gPiA+ID4gSG9zdCB3b3VsZCBjYWxsIG1ib3ggc2VuZCBk
YXRhIHdoZW4gdGhlIHNoYXJlZCBkYXRhIHRyYW5zZmVyCj4gPiA+ID4gY29tcGxldGVkLgo+ID4g
PiA+ICAKPiA+ID4gPiAobXRrX2Fkc3BfbWJveF9zZW5kX2RhdGEgd2lsbCBub3RpY2UgY2xpZW50
IHVzaW5nCj4gPiA+ID4gTVRLX0FEU1BfTUJPWF9JTl9DTUQpCj4gPiA+ID4gIAo+ID4gPiA+IEl0
4oCZcyBtb3JlIGxpa2UgYSBzaWduYWwuCj4gPiA+ID4gIAo+ID4gPiA+IEluIGdlbmVyYWwgY2Fz
ZSwKPiA+ID4gPiAgCj4gPiA+ID4gVGhlcmUgbWF5IGJlIHNvbWUgaG9zdHMgdXNlIHRoZSBzYW1l
IG1ib3ggY2hhbm5lbC4KPiA+ID4gPiAgCj4gPiA+ID4gSSB0aGluayBpdOKAmXMgYmV0dGVyIHVz
aW5nIGxvY2sgdG8gcHJvdGVjdCBhY2Nlc3MgdG8KPiA+ID4gPiBNVEtfQURTUF9NQk9YX0lOX0NN
RCByZWdpc3RlcnMKPiAKPiA+Cj4gPiBJIHN0aWxsIGZhaWxlZCB0byB1bmRlcnN0YW5kLiAgV2hh
dCBpZiAyIGhvc3RzIG5vdGlmeSB0aGUgc2FtZQo+IGNsaWVudAo+ID4gYnkgd3JpdGluZyBNVEtf
QURTUF9NQk9YX0lOX0NNRCBhdCB0aGUgc2FtZSB0aW1lPwoKIApIaSBUenVuZy1CaSwKIApBZnRl
ciBJIHRoaW5rIGNhcmVmdWxseS4gVGhlcmUgaXMgbm8gbmVlZCB0byBhZGQgbG9jayBpbgptdGtf
YWRzcF9tYm94X3NlbmRfZGF0YS4KIApJbiBvdXIgZHNwIGlwYyBkZXNpZ24sIHdlIG9ubHkgaGF2
ZSBvbmUgaG9zdChhcCkgYW5kIG9uZSBjbGllbnQoZHNwKS4KIApJZiBzb2YgaXAgbWVzc2FnZSB0
cmFuc2ZlciBpcyBjb21wbGV0ZSwgaG9zdCB3aWxsIHVzZSBtYm94IG5vdGljZSBkc3AKbWVzc2Fn
ZSBhcnJpdmVkLgogCihNVEtfQURTUF9NQk9YX0lOX0NNRCBpcyBzaWduYWwgdG8gdHJpZ2dlciBt
Ym94IGlycSkKIApJIHdpbGwgcmVtb3ZlIHRoaXMgaW4gbmV4dCB2ZXJzaW9uLgogCiAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRl
ayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
