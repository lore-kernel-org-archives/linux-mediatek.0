Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A3E0C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Nov 2021 01:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=675X1E+1fP40fjt7yuTEbKXk5r/95xGpnz1nKCZe75o=; b=wwN4/1i1B5qCDp
	Onb7Y+kgm0dbIDHfYua22lgZMSpiYQ+ld2v/ynWLldBLa2p4BfVIcIXQWFshVWg3uolRt2y6nmNMh
	JtbxYBk+SlswLlttjD4wBMT/YpVtRjqAORsAVSGP09dIaRzzyVi7GWZ9skwKZdVt9I/n4q6pkBh9f
	BfY9UA1v+ITmvXyB2AT5QjuJ+KUEg0lWuqszghAvuEGZapCDnxUuiAHxFUetfxvAEwWGE6uANeXu6
	A7in3U1I6uynRm1uI5uZOdG+XhzIM/dPlhOGtuDr3KHNB+twpXUZ2dLjfVXdZktuNlFCaGwPPfk8A
	lt85bd8XG+BY/jo2czLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mq3vR-006Fi2-Ei; Thu, 25 Nov 2021 01:51:49 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mq3vN-006FhY-N5; Thu, 25 Nov 2021 01:51:47 +0000
X-UUID: 0d8fbec79848488abedf9bb88d439f9a-20211124
X-UUID: 0d8fbec79848488abedf9bb88d439f9a-20211124
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2011525080; Wed, 24 Nov 2021 18:51:42 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 24 Nov 2021 17:51:41 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 25 Nov 2021 09:51:27 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 25 Nov 2021 09:51:27 +0800
Message-ID: <f3642bcd031fbfd461b5efae1eba4816cc4856b2.camel@mediatek.com>
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
Date: Thu, 25 Nov 2021 09:51:27 +0800
References: <20211124084514.28002-1-allen-kh.cheng@mediatek.com>
 <20211124084514.28002-3-allen-kh.cheng@mediatek.com>
 <YZ4TCYmvegnC/kR0@google.com>
In-Reply-To: <YZ4TCYmvegnC/kR0@google.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211124_175145_789750_0A575F54 
X-CRM114-Status: GOOD (  34.44  )
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

SGkgVHp1bmctQmksCiAKVGhhbmtzIGZvciB5b3VyIHN1Z2dlc3Rpb25zLgogCiAKT24gV2VkLCAy
MDIxLTExLTI0IGF0IDE4OjI1ICswODAwLCBUenVuZy1CaSBTaGloIHdyb3RlOgo+ID4gT24gV2Vk
LCBOb3YgMjQsIDIwMjEgYXQgMDQ6NDU6MTNQTSArMDgwMCwgYWxsZW4ta2guY2hlbmcgd3JvdGU6
Cj4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWFpbGJveC9LY29uZmlnIGIvZHJpdmVycy9t
YWlsYm94L0tjb25maWcKPiA+ID4gPiBpbmRleCBjOWZjMDZjN2U2ODUuLmZjOTlkOWZjODBhZiAx
MDA2NDQKPiA+ID4gPiAtLS0gYS9kcml2ZXJzL21haWxib3gvS2NvbmZpZwo+ID4gPiA+ICsrKyBi
L2RyaXZlcnMvbWFpbGJveC9LY29uZmlnCj4gPiA+ID4gQEAgLTIzNiw2ICsyMzYsMTMgQEAgY29u
ZmlnIE1US19DTURRX01CT1gKPiA+ID4gPiAgICAgIGNyaXRpY2FsIHRpbWUgbGltaXRhdGlvbiwg
c3VjaCBhcyB1cGRhdGluZyBkaXNwbGF5Cj4gPiA+ID4gY29uZmlndXJhdGlvbgo+ID4gPiA+ICAg
ICAgZHVyaW5nIHRoZSB2YmxhbmsuCj4gPiA+ID4gIAo+ID4gPiA+ICtjb25maWcgTVRLX0FEU1Bf
SVBDX01CT1gKPiA+ID4gPiArICB0cmlzdGF0ZSAiTWVkaWFUZWsgQURTUCBNYWlsYm94IENvbnRy
b2xsZXIiCj4gPiA+ID4gKyAgZGVwZW5kcyBvbiBBUkNIX01FRElBVEVLIHx8IENPTVBJTEVfVEVT
VAo+ID4gPiA+ICsgIGhlbHAKPiA+ID4gPiArICAgIFNheSB5ZXMgaGVyZSB0byBhZGQgc3VwcG9y
dCBmb3IgTWVkaWFUZWsgQURTUCBJUEMgbWFpbGJveAo+ID4gPiA+IGNvbnRyb2xsZXIKPiA+ID4g
PiArICAgIGRyaXZlci4gSXQgaXMgdXNlZCB0byBzZW5kIHNob3J0IG1lc3NhZ2VzIGJldHdlZW4K
PiA+IHByb2Nlc3NvcnMKPiA+ID4gPiB3aXRoIGRzcC4KPiAKPiA+Cj4gPiBBbHRob3VnaCB0aGUg
ZmlsZSBkaWRuJ3QgbWFpbnRhaW4gYWxwaGFiZXRpY2FsIG9yZGVyLCB0byBiZSBuZWF0LAo+ID4g
bW92aW5nIE1US19BRFNQX0lQQ19NQk9YIGJlZm9yZSBNVEtfQ01EUV9NQk9YIG1ha2VzIG1vcmUg
c2Vuc2UuCj4gPgo+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21haWxib3gvTWFrZWZpbGUK
PiA+IGIvZHJpdmVycy9tYWlsYm94L01ha2VmaWxlCj4gPiA+ID4gaW5kZXggYzIwODlmMDQ4ODdl
Li40NzlhOWFlNTZkNWUgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvZHJpdmVycy9tYWlsYm94L01ha2Vm
aWxlCj4gPiA+ID4gKysrIGIvZHJpdmVycy9tYWlsYm94L01ha2VmaWxlCj4gPiA+ID4gQEAgLTUx
LDYgKzUxLDggQEAgb2JqLSQoQ09ORklHX1NUTTMyX0lQQ0MpICArPSBzdG0zMi1pcGNjLm8KPiA+
ID4gPiAgCj4gPiA+ID4gIG9iai0kKENPTkZJR19NVEtfQ01EUV9NQk9YKSArPSBtdGstY21kcS1t
YWlsYm94Lm8KPiA+ID4gPiAgCj4gPiA+ID4gK29iai0kKENPTkZJR19NVEtfQURTUF9JUENfTUJP
WCkgKz0gbXRrLWFkc3AtbWFpbGJveC5vCj4gPiA+ID4gKwo+IAo+ID4KPiA+IERpdHRvLiAgTW92
ZSBDT05GSUdfTVRLX0FEU1BfSVBDX01CT1ggYmVmb3JlIENPTkZJR19NVEtfQ01EUV9NQk9YCj4g
PiB3aXRob3V0IGJsYW5rIGxpbmUgc2VwYXJhdGlvbi4KPiA+Cj4gPiA+ID4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvbWFpbGJveC9tdGstYWRzcC1tYWlsYm94LmMKPiA+ID4gPiBiL2RyaXZlcnMvbWFp
bGJveC9tdGstYWRzcC1tYWlsYm94LmMKPiAKPiA+Cj4gPiBbLi4uXQo+ID4gPiA+ICtzdGF0aWMg
aXJxcmV0dXJuX3QgbXRrX2Fkc3BfaXBjX2lycV9oYW5kbGVyKGludCBpcnEsIHZvaWQKPiA+ICpk
YXRhKQo+ID4gPiA+ICt7Cj4gPiA+ID4gKyAgc3RydWN0IG1ib3hfY2hhbiAqY2ggPSAoc3RydWN0
IG1ib3hfY2hhbiAqKWRhdGE7Cj4gCj4gPgo+ID4gVGhlIGNhc3Qgc2hvdWxkIGJlIGFibGUgdG8g
cmVtb3ZlLgo+ID4KPiA+ID4gPiArc3RhdGljIGlycXJldHVybl90IG10a19hZHNwX2lwY19oYW5k
bGVyKGludCBpcnEsIHZvaWQgKmRhdGEpCj4gPiA+ID4gK3sKPiA+ID4gPiArICBzdHJ1Y3QgbWJv
eF9jaGFuICpjaCA9IChzdHJ1Y3QgbWJveF9jaGFuICopZGF0YTsKPiAKPiA+Cj4gPiBUaGUgY2Fz
dCBzaG91bGQgYmUgYWJsZSB0byByZW1vdmUuCj4gPgo+ID4gPiA+ICtzdGF0aWMgaW50IG10a19h
ZHNwX21ib3hfc3RhcnR1cChzdHJ1Y3QgbWJveF9jaGFuICpjaGFuKQo+ID4gPiA+ICt7Cj4gPiA+
ID4gKyAgc3RydWN0IGFkc3BfbWJveF9jaF9pbmZvICpjaF9pbmZvID0gY2hhbi0+Y29uX3ByaXY7
Cj4gPiA+ID4gKyAgdm9pZCBfX2lvbWVtICpyZWcgPSBjaF9pbmZvLT52YV9yZWc7Cj4gPiA+ID4g
Kwo+ID4gPiA+ICsgIC8qIENsZWFyIERTUCBtYm94IGNvbW1hbmQgKi8KPiA+ID4gPiArICB3cml0
ZWwoMHhGRkZGRkZGRiwgcmVnICsgTVRLX0FEU1BfTUJPWF9JTl9DTURfQ0xSKTsKPiA+ID4gPiAr
ICB3cml0ZWwoMHhGRkZGRkZGRiwgcmVnICsgTVRLX0FEU1BfTUJPWF9PVVRfQ01EX0NMUik7Cj4g
PiA+ID4gKwo+ID4gPiA+ICsgIHJldHVybiAwOwo+ID4gPiA+ICt9Cj4gPiA+ID4gKwo+ID4gPiA+
ICtzdGF0aWMgdm9pZCBtdGtfYWRzcF9tYm94X3NodXRkb3duKHN0cnVjdCBtYm94X2NoYW4gKmNo
YW4pCj4gPiA+ID4gK3sKPiA+ID4gPiArICBjaGFuLT5jb25fcHJpdiA9IE5VTEw7Cj4gPiA+ID4g
K30KPiAKPiA+Cj4gPiBTaGFsbCBtdGtfYWRzcF9tYm94X3NodXRkb3duKCkgYWxzbyBjbGVhciBE
U1AgbWJveD8gIEkuZS46Cj4gPiB3cml0ZWwoMHhGRkZGRkZGRiwgcmVnICsgTVRLX0FEU1BfTUJP
WF9JTl9DTURfQ0xSKTsKPiA+IHdyaXRlbCgweEZGRkZGRkZGLCByZWcgKyBNVEtfQURTUF9NQk9Y
X09VVF9DTURfQ0xSKTsKPiA+Cj4gPiA+ID4gK3N0YXRpYyBpbnQgbXRrX2Fkc3BfbWJveF9zZW5k
X2RhdGEoc3RydWN0IG1ib3hfY2hhbiAqY2hhbiwKPiA+IHZvaWQKPiA+ID4gPiAqZGF0YSkKPiA+
ID4gPiArewo+ID4gPiA+ICsgIHN0cnVjdCBhZHNwX21ib3hfY2hfaW5mbyAqY2hfaW5mbyA9IGNo
YW4tPmNvbl9wcml2Owo+ID4gPiA+ICsgIHZvaWQgX19pb21lbSAqcmVnID0gY2hfaW5mby0+dmFf
cmVnOwo+ID4gPiA+ICsKPiA+ID4gPiArICBzcGluX2xvY2soJmNoX2luZm8tPmxvY2spOwo+ID4g
PiA+ICsgIHdyaXRlbChjaF9pbmZvLT5pcGNfb3BfdmFsLCByZWcgKyBNVEtfQURTUF9NQk9YX0lO
X0NNRCk7Cj4gPiA+ID4gKyAgc3Bpbl91bmxvY2soJmNoX2luZm8tPmxvY2spOwo+IAo+ID4KPiA+
IFdoeSBkb2VzIGl0IG5lZWQgdGhlIGxvY2s/Cj4gPgo+ID4gSXMgdGhlIHdyaXRlIHRvIE1US19B
RFNQX01CT1hfSU5fQ01EIGEgc3luY2hyb25vdXMgb3BlcmF0aW9uPwo+ID4gLSBJZiB5ZXMsIEkg
ZmFpbGVkIHRvIHVuZGVyc3RhbmQgd2h5IGRvZXMgaXQgbmVlZCB0aGUgbG9jay4gIEV2ZXJ5Cj4g
PiBjYWxscyB0byBtdGtfYWRzcF9tYm94X3NlbmRfZGF0YSgpIHNob3VsZCB3YWl0IGZvciB0aGUg
ZGF0YQo+IHRyYW5zZmVyCj4gPiBjb21wbGV0aW9uLgo+ID4gLSBJZiBubywgSSBhbHNvIGZhaWxl
ZCB0byB1bmRlcnN0YW5kCj4gd2h5LiAgbXRrX2Fkc3BfbWJveF9zZW5kX2RhdGEoKQo+ID4gaGFz
IG5vIHdheSB0byBiZSBhd2FyZSBvZiB0aGUgdHJhbnNmZXIgY29tcGxldGlvbi4gIFdvdWxkIGV4
cGVjdCBhCj4gPiBsb29wIGZvciBjaGVja2luZyB0aGUgY29tcGxldGlvbiBmb3IgdGhlIGNhc2Uu
Cj4gPgo+ICAKCkluIEFEU1AgTUJPWCBJUEMgZmxvdywKIApIb3N0IHdvdWxkIGNhbGwgbWJveCBz
ZW5kIGRhdGEgd2hlbiB0aGUgc2hhcmVkIGRhdGEgdHJhbnNmZXIgY29tcGxldGVkLgogCihtdGtf
YWRzcF9tYm94X3NlbmRfZGF0YSB3aWxsIG5vdGljZSBjbGllbnQgdXNpbmcgTVRLX0FEU1BfTUJP
WF9JTl9DTUQpCiAKSXTigJlzIG1vcmUgbGlrZSBhIHNpZ25hbC4KIApJbiBnZW5lcmFsIGNhc2Us
CiAKVGhlcmUgbWF5IGJlIHNvbWUgaG9zdHMgdXNlIHRoZSBzYW1lIG1ib3ggY2hhbm5lbC4KIApJ
IHRoaW5rIGl04oCZcyBiZXR0ZXIgdXNpbmcgbG9jayB0byBwcm90ZWN0IGFjY2VzcyB0bwpNVEtf
QURTUF9NQk9YX0lOX0NNRCByZWdpc3RlcnMKIAogClRoYW5rcywKQWxsZW4KIAo+ID4gPiA+ICtz
dGF0aWMgYm9vbCBtdGtfYWRzcF9tYm94X2xhc3RfdHhfZG9uZShzdHJ1Y3QgbWJveF9jaGFuICpj
aGFuKQo+ID4gPiA+ICt7Cj4gPiA+ID4gKyAgc3RydWN0IGFkc3BfbWJveF9jaF9pbmZvICpjaF9p
bmZvID0gY2hhbi0+Y29uX3ByaXY7Cj4gPiA+ID4gKyAgdm9pZCBfX2lvbWVtICpyZWcgPSBjaF9p
bmZvLT52YV9yZWc7Cj4gPiA+ID4gKyAgdTMyIG9wID0gcmVhZGwocmVnICsgTVRLX0FEU1BfTUJP
WF9JTl9DTUQpOwo+ID4gPiA+ICsKPiA+ID4gPiArICByZXR1cm4gKG9wID09IDApID8gdHJ1ZSA6
IGZhbHNlOwo+IAo+ID4KPiA+IFRvIGJlIGNvbmNpc2UsIHJldHVybiByZWFkbCguLi4pID09IDA7
Cj4gPgo+ID4gPiA+ICtzdGF0aWMgaW50IG10a19hZHNwX21ib3hfcHJvYmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldikKPiA+ID4gPiArewo+IAo+ID4KPiA+IFsuLi5dCj4gPiA+ID4gKyAg
cmVzID0gcGxhdGZvcm1fZ2V0X3Jlc291cmNlKHBkZXYsIElPUkVTT1VSQ0VfTUVNLCAwKTsKPiA+
ID4gPiArICBpZiAoIXJlcykgewo+ID4gPiA+ICsgICAgICBkZXZfZXJyKGRldiwgIm5vIGFkc3Ag
bWJveCByZWdpc3RlciByZXNvdXJjZVxuIik7Cj4gPiA+ID4gKyAgICAgIHJldHVybiAtRU5YSU87
Cj4gPiA+ID4gKyAgfQo+ID4gPiA+ICsKPiA+ID4gPiArICBzaXplID0gcmVzb3VyY2Vfc2l6ZShy
ZXMpOwo+ID4gPiA+ICsgIHByaXYtPnZhX21ib3hyZWcgPSBkZXZtX2lvcmVtYXAoZGV2LCAocGh5
c19hZGRyX3QpcmVzLQo+ID4gPnN0YXJ0LAo+ID4gPiA+IHNpemUpOwo+ID4gPiA+ICsgIGlmIChJ
U19FUlIocHJpdi0+dmFfbWJveHJlZykpCj4gPiA+ID4gKyAgICAgIHJldHVybiBQVFJfRVJSKHBy
aXYtPnZhX21ib3hyZWcpOwo+IAo+ID4KPiA+IFVzZSBkZXZtX3BsYXRmb3JtX2lvcmVtYXBfcmVz
b3VyY2UoKSwgaXQgc2hvdWxkIGJlIGVxdWl2YWxlbnQuCj4gPgo+ID4gPiA+ICsgIC8qIHNldCBh
ZHNwIG1ib3ggY2hhbm5lbCBpbmZvICovCj4gPiA+ID4gKyAgY2hfaW5mbyA9IGRldm1fa3phbGxv
YyhtYm94LT5kZXYsIHNpemVvZigqY2hfaW5mbyksCj4gPiA+ID4gR0ZQX0tFUk5FTCk7Cj4gCj4g
Pgo+ID4gVG8gYmUgbmVhdCwgdXNlIGRldiBpbnN0ZWFkIG9mIG1ib3gtPmRldi4KPiA+Cj4gPiA+
ID4gKyAgcmV0ID0gZGV2bV9tYm94X2NvbnRyb2xsZXJfcmVnaXN0ZXIoZGV2LCAmcHJpdi0+bWJv
eCk7Cj4gPiA+ID4gKyAgaWYgKHJldCA8IDApCj4gPiA+ID4gKyAgICAgIGRldl9lcnIoZGV2LCAi
ZXJyb3I6IGZhaWxlZCB0byByZWdpc3RlciBtYWlsYm94OiVkXG4iLAo+ID4gPiA+IHJldCk7Cj4g
PiA+ID4gKwo+ID4gPiA+ICsgIHJldHVybiByZXQ7Cj4gCj4gPgo+ID4gVG8gYmUgY29uY2lzZSwg
cmV0dXJuIGRldm1fbWJveF9jb250cm9sbGVyX3JlZ2lzdGVyKC4uLik7Cj4gIAo+ICAKPiAgCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVk
aWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
