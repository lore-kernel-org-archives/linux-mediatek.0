Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE530C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Apr 2022 09:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZbSZIUHBa6CzFH9quFfgb/8v5rp2T5W8hmOMCW7rhBg=; b=lt/CQ7Tb3RdoTk
	ZwyZZoI+L/R8S1kZx0VchHZpm8KXRzIcAwBMKAnphofQzoDgR12p1HPMmhmiN83BWJaLuh4g7Xks8
	/wSrEgOiK+acx/42xd2jHKMCb86q5ONzIG8otZG14sNzTfEvmmkLlPZR10hsMEf6RBUh7jZQ4hcjw
	fDgyTl0Emv0/5A9PzUKSJP+8bFhMIQ44u07Gk15VESmFUxKbtKuCphNn+Kp86L/KVv7NVkZuQGjXC
	n+xvjtLdh4oPIbr6tQEiz3x83u1jTJRZsIecRTL5RUVq3J3fd5v96eZiFtEW3d+GARhWZY7SGmIYJ
	mVc6N1eYmC0FSuY8aWqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neCvp-00CxTY-IP; Tue, 12 Apr 2022 09:35:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neCvl-00CxQg-Ro; Tue, 12 Apr 2022 09:35:27 +0000
X-UUID: 6fb49a3f03a34423837af576fe3c294b-20220412
X-UUID: 6fb49a3f03a34423837af576fe3c294b-20220412
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <kuyo.chang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 348016588; Tue, 12 Apr 2022 02:35:16 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 12 Apr 2022 02:28:11 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 12 Apr 2022 17:28:10 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 12 Apr 2022 17:28:10 +0800
Message-ID: <354ea7554096b0745d4f947685add33c8c8d2d62.camel@mediatek.com>
Subject: Re: [PATCH 1/1] sched/pelt: Refine the enqueue_load_avg calculate
 method
From: Kuyo Chang <kuyo.chang@mediatek.com>
To: Vincent Guittot <vincent.guittot@linaro.org>
CC: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Juri Lelli <juri.lelli@redhat.com>, Dietmar Eggemann
 <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, "Ben
 Segall" <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, "Daniel Bristot
 de Oliveira" <bristot@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 <wsd_upstream@mediatek.com>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Date: Tue, 12 Apr 2022 17:28:10 +0800
In-Reply-To: <20220412085845.GA14088@vingu-book>
References: <20220411061702.22978-1-kuyo.chang@mediatek.com>
 <CAKfTPtAyhc-tAWXmXcHstmiBSMjj5GENizX__KRDab28NRum1A@mail.gmail.com>
 <5a90b20570ecacf457f68da7a106d3b2f8c2269e.camel@mediatek.com>
 <20220412085845.GA14088@vingu-book>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_023525_942390_41AD9F0A 
X-CRM114-Status: GOOD (  39.91  )
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

T24gVHVlLCAyMDIyLTA0LTEyIGF0IDEwOjU4ICswMjAwLCBWaW5jZW50IEd1aXR0b3Qgd3JvdGU6
Cj4gTGUgbWFyZGkgMTIgYXZyaWwgMjAyMiDDoCAxMDo1MToyMyAoKzA4MDApLCBLdXlvIENoYW5n
IGEgw6ljcml0IDoKPiA+IE9uIE1vbiwgMjAyMi0wNC0xMSBhdCAxMDozOSArMDIwMCwgVmluY2Vu
dCBHdWl0dG90IHdyb3RlOgo+ID4gPiBPbiBNb24sIDExIEFwciAyMDIyIGF0IDA4OjE3LCBLdXlv
IENoYW5nIDxrdXlvLmNoYW5nQG1lZGlhdGVrLmNvbQo+ID4gPiA+Cj4gPiA+IHdyb3RlOgo+ID4g
PiA+IAo+ID4gPiA+IEZyb206IGt1eW8gY2hhbmcgPGt1eW8uY2hhbmdAbWVkaWF0ZWsuY29tPgo+
ID4gPiA+IAo+ID4gPiA+IEkgbWVldCB0aGUgd2FybmluZyBtZXNzYWdlIGF0IGNmc19ycV9pc19k
ZWNheWVkIGF0IGJlbG93IGNvZGUuCj4gPiA+ID4gCj4gPiA+ID4gU0NIRURfV0FSTl9PTihjZnNf
cnEtPmF2Zy5sb2FkX2F2ZyB8fAo+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgY2ZzX3JxLT5h
dmcudXRpbF9hdmcgfHwKPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgIGNmc19ycS0+YXZnLnJ1
bm5hYmxlX2F2ZykKPiA+ID4gPiAKPiA+ID4gPiBGb2xsb3dpbmcgaXMgdGhlIGNhbGx0cmFjZS4K
PiA+ID4gPiAKPiA+ID4gPiBDYWxsIHRyYWNlOgo+ID4gPiA+IF9fdXBkYXRlX2Jsb2NrZWRfZmFp
cgo+ID4gPiA+IHVwZGF0ZV9ibG9ja2VkX2F2ZXJhZ2VzCj4gPiA+ID4gbmV3aWRsZV9iYWxhbmNl
Cj4gPiA+ID4gcGlja19uZXh0X3Rhc2tfZmFpcgo+ID4gPiA+IF9fc2NoZWR1bGUKPiA+ID4gPiBz
Y2hlZHVsZQo+ID4gPiA+IHBpcGVfcmVhZAo+ID4gPiA+IHZmc19yZWFkCj4gPiA+ID4ga3N5c19y
ZWFkCj4gPiA+ID4gCj4gPiA+ID4gQWZ0ZXIgY29kZSBhbmFseXppbmcgYW5kIHNvbWUgZGVidWcg
bWVzc2FnZXMsIEkgZm91bmQgaXQgZXhpdHMKPiA+ID4gPiBhCj4gPiA+ID4gY29ybmVyCj4gPiA+
ID4gY2FzZSBhdCBhdHRhY2hfZW50aXR5X2xvYWRfYXZnIHdoaWNoIHdpbGwgY2F1c2UgbG9hZF9z
dW0gaXMKPiA+ID4gPiB6ZXJvCj4gPiA+ID4gYW5kCj4gPiA+ID4gbG9hZF9hdmcgaXMgbm90Lgo+
ID4gPiA+IENvbnNpZGVyIHNlX3dlaWdodCBpcyA4ODc2MSBhY2NvcmRpbmcgYnkgc2NoZWRfcHJp
b190b193ZWlnaHQKPiA+ID4gPiB0YWJsZS4KPiA+ID4gPiBBbmQgYXNzdW1lIHRoZSBnZXRfcGVs
dF9kaXZpZGVyKCkgaXMgNDc3NDIsIHNlLT5hdmcubG9hZF9hdmcgaXMKPiA+ID4gPiAxLgo+ID4g
PiA+IEJ5IHRoZSBjYWxjdWxhdGluZyBmb3Igc2UtPmF2Zy5sb2FkX3N1bSBhcyBmb2xsb3dpbmcg
d2lsbAo+ID4gPiA+IGJlY29tZQo+ID4gPiA+IHplcm8KPiA+ID4gPiBhcyBmb2xsb3dpbmcuCj4g
PiA+ID4gc2UtPmF2Zy5sb2FkX3N1bSA9Cj4gPiA+ID4gICAgICAgICBkaXZfdTY0KHNlLT5hdmcu
bG9hZF9hdmcgKiBzZS0+YXZnLmxvYWRfc3VtLAo+ID4gPiA+IHNlX3dlaWdodChzZSkpOwo+ID4g
PiA+IHNlLT5hdmcubG9hZF9zdW0gPSAxKjQ3NzQyLzg4NzYxID0gMC4KPiA+ID4gCj4gPiA+IFRo
ZSByb290IHByb2JsZW0gaXMgdGhlcmUsIHNlLT5hdmcubG9hZF9zdW0gbXVzdCBub3QgYmUgbnVs
bCBpZgo+ID4gPiBzZS0+YXZnLmxvYWRfYXZnIGlzIG5vdCBudWxsIGJlY2F1c2UgdGhlIGNvcnJl
Y3QgcmVsYXRpb24gYmV0d2Vlbgo+ID4gPiBfYXZnCj4gPiA+IGFuZCBfc3VtIGlzOgo+ID4gPiAK
PiA+ID4gbG9hZF9hdmcgPSB3ZWlnaHQgKiBsb2FkX3N1bSAvIGRpdmlkZXIuCj4gPiA+IAo+ID4g
PiBzbyB0aGUgZml4IHNob3VsZCBiZSBhdHRhY2hfZW50aXR5X2xvYWRfYXZnKCkgYW5kIHByb2Jh
Ymx5IHRoZQo+ID4gPiBiZWxvdwo+ID4gPiBpcyBlbm91Z2gKPiA+ID4gCj4gPiA+IHNlLT5hdmcu
bG9hZF9zdW0gPSBkaXZfdTY0KHNlLT5hdmcubG9hZF9hdmcgKiBzZS0+YXZnLmxvYWRfc3VtLAo+
ID4gPiBzZV93ZWlnaHQoc2UpKSArIDE7Cj4gPiAKPiA+IFRoYW5rcyBmb3IgeW91ciBraW5kbHkg
c3VnZ2VzdGlvbi4KPiA+ICsxIHdvdWxkIG1ha2UgdGhlIGNhbGN1YXRpb24gZm9yIGxvYWRfc3Vt
IG1heSBiZSBvdmVyZXN0aW1hdGU/Cj4gPiBIb3cgYWJvdXQgdGhlIGJlbG93IGNvZGUgbWFrZSBz
ZW5zZSBmb3IgZml4IHRoZSBjb3JuZXIgY2FzZT8KPiA+IAo+ID4gLS0tIAo+ID4gLS0tIGEva2Vy
bmVsL3NjaGVkL2ZhaXIuYwo+ID4gKysrIGIva2VybmVsL3NjaGVkL2ZhaXIuYwo+ID4gQEAgLTM4
MzIsNyArMzgzMiw4IEBAIHN0YXRpYyB2b2lkIGF0dGFjaF9lbnRpdHlfbG9hZF9hdmcoc3RydWN0
Cj4gPiBjZnNfcnEKPiA+ICpjZnNfcnEsIHN0cnVjdCBzY2hlZF9lbnRpdHkgKnMKPiA+ICAJc2Ut
PmF2Zy5sb2FkX3N1bSA9IGRpdmlkZXI7Cj4gPiAgCWlmIChzZV93ZWlnaHQoc2UpKSB7Cj4gPiAg
CQlzZS0+YXZnLmxvYWRfc3VtID0KPiA+IC0JCQlkaXZfdTY0KHNlLT5hdmcubG9hZF9hdmcgKiBz
ZS0+YXZnLmxvYWRfc3VtLAo+ID4gc2Vfd2VpZ2h0KHNlKSk7Cj4gPiArCQkJKHNlLT5hdmcubG9h
ZF9hdmcgKiBzZS0+YXZnLmxvYWRfc3VtID4KPiA+IHNlX3dlaWdodChzZSkpID8KPiA+ICsJCQlk
aXZfdTY0KHNlLT5hdmcubG9hZF9hdmcgKiBzZS0+YXZnLmxvYWRfc3VtLAo+ID4gc2Vfd2VpZ2h0
KHNlKSkgOiAxOwo+ID4gIAl9Cj4gPiAgCj4gPiAgCWVucXVldWVfbG9hZF9hdmcoY2ZzX3JxLCBz
ZSk7Cj4gPiAtLSAKPiA+IDIuMTguMAo+IAo+IEluIHRoaXMgY2FzZSwgdGhlIGJlbG93IGlzIGVh
c2llciB0byByZWFkCj4gCj4gZGlmZiAtLWdpdCBhL2tlcm5lbC9zY2hlZC9mYWlyLmMgYi9rZXJu
ZWwvc2NoZWQvZmFpci5jCj4gaW5kZXggMTY1OGE5NDI4ZDk2Li4yYzY4NTQ3NGRiMjMgMTAwNjQ0
Cj4gLS0tIGEva2VybmVsL3NjaGVkL2ZhaXIuYwo+ICsrKyBiL2tlcm5lbC9zY2hlZC9mYWlyLmMK
PiBAQCAtMzgzNiwxMCArMzgzNiwxMiBAQCBzdGF0aWMgdm9pZCBhdHRhY2hfZW50aXR5X2xvYWRf
YXZnKHN0cnVjdAo+IGNmc19ycSAqY2ZzX3JxLCBzdHJ1Y3Qgc2NoZWRfZW50aXR5ICpzCj4gCj4g
ICAgICAgICBzZS0+YXZnLnJ1bm5hYmxlX3N1bSA9IHNlLT5hdmcucnVubmFibGVfYXZnICogZGl2
aWRlcjsKPiAKPiAtICAgICAgIHNlLT5hdmcubG9hZF9zdW0gPSBkaXZpZGVyOwo+IC0gICAgICAg
aWYgKHNlX3dlaWdodChzZSkpIHsKPiArICAgICAgIHNlLT5hdmcubG9hZF9zdW0gPSBzZS0+YXZn
LmxvYWRfYXZnICogZGl2aWRlcjsKPiArICAgICAgIGlmIChzZV93ZWlnaHQoc2UpIDwgc2UtPmF2
Zy5sb2FkX3N1bSkgewo+ICAgICAgICAgICAgICAgICBzZS0+YXZnLmxvYWRfc3VtID0KPiAtICAg
ICAgICAgICAgICAgICAgICAgICBkaXZfdTY0KHNlLT5hdmcubG9hZF9hdmcgKiBzZS0+YXZnLmxv
YWRfc3VtLAo+IHNlX3dlaWdodChzZSkpOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIGRpdl91
NjQoc2UtPmF2Zy5sb2FkX3N1bSwgc2Vfd2VpZ2h0KHNlKSk7Cj4gKyAgICAgICB9IGVsc2Ugewo+
ICsgICAgICAgICAgICAgICBzZS0+YXZnLmxvYWRfc3VtID0gMTsKPiAgICAgICAgIH0KPiAKPiAg
ICAgICAgIGVucXVldWVfbG9hZF9hdmcoY2ZzX3JxLCBzZSk7CgpJdCByZWFsbHkgZWFzaWVyIHRv
IHJlYWQuClRoYW5rcyBmb3IgeW91ciBraW5kbHkgc3VnZ2VzdGlvbi4KCgo+IAo+IAo+ID4gCj4g
PiAKPiA+ID4gPiAKPiA+ID4gPiBBZnRlciBlbnF1ZXVlX2xvYWRfYXZnIGNvZGUgYXMgYmVsb3cu
Cj4gPiA+ID4gY2ZzX3JxLT5hdmcubG9hZF9hdmcgKz0gc2UtPmF2Zy5sb2FkX2F2ZzsKPiA+ID4g
PiBjZnNfcnEtPmF2Zy5sb2FkX3N1bSArPSBzZV93ZWlnaHQoc2UpICogc2UtPmF2Zy5sb2FkX3N1
bTsKPiA+ID4gPiAKPiA+ID4gPiBUaGVuIHRoZSBsb2FkX3N1bSBmb3IgY2ZzX3JxIHdpbGwgYmUg
MSB3aGlsZSB0aGUgbG9hZF9zdW0gZm9yCj4gPiA+ID4gY2ZzX3JxIGlzIDAuCj4gPiA+ID4gU28g
aXQgd2lsbCBoaXQgdGhlIHdhcm5pbmcgbWVzc2FnZS4KPiA+ID4gPiAKPiA+ID4gPiBBZnRlciBh
bGwsIEkgcmVmZXIgdGhlIGZvbGxvd2luZyBjb21taXQgcGF0Y2ggdG8gZG8gdGhlIHNpbWlsYXIK
PiA+ID4gPiB0aGluZyBhdAo+ID4gPiA+IGVucXVldWVfbG9hZF9hdmcuCj4gPiA+ID4gc2NoZWQv
cGVsdDogUmVsYXggdGhlIHN5bmMgb2YgbG9hZF9zdW0gd2l0aCBsb2FkX2F2Zwo+ID4gPiA+IAo+
ID4gPiA+IEFmdGVyIGxvbmcgdGltZSB0ZXN0aW5nLCB0aGUga2VybmVsIHdhcm5pbmcgd2FzIGdv
bmUgYW5kIHRoZQo+ID4gPiA+IHN5c3RlbQo+ID4gPiA+IHJ1bnMKPiA+ID4gPiBhcyB3ZWxsIGFz
IGJlZm9yZS4KPiA+ID4gPiAKPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBrdXlvIGNoYW5nIDxrdXlv
LmNoYW5nQG1lZGlhdGVrLmNvbT4KPiA+ID4gPiAtLS0KPiA+ID4gPiAga2VybmVsL3NjaGVkL2Zh
aXIuYyB8IDYgKysrKy0tCj4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pCj4gPiA+ID4gCj4gPiA+ID4gZGlmZiAtLWdpdCBhL2tlcm5lbC9zY2hl
ZC9mYWlyLmMgYi9rZXJuZWwvc2NoZWQvZmFpci5jCj4gPiA+ID4gaW5kZXggZDRiZDI5OWQ2N2Fi
Li4zMGQ4YjZkYmEyNDkgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEva2VybmVsL3NjaGVkL2ZhaXIuYwo+
ID4gPiA+ICsrKyBiL2tlcm5lbC9zY2hlZC9mYWlyLmMKPiA+ID4gPiBAQCAtMzA3NCw4ICszMDc0
LDEwIEBAIGFjY291bnRfZW50aXR5X2RlcXVldWUoc3RydWN0IGNmc19ycQo+ID4gPiA+ICpjZnNf
cnEsIHN0cnVjdCBzY2hlZF9lbnRpdHkgKnNlKQo+ID4gPiA+ICBzdGF0aWMgaW5saW5lIHZvaWQK
PiA+ID4gPiAgZW5xdWV1ZV9sb2FkX2F2ZyhzdHJ1Y3QgY2ZzX3JxICpjZnNfcnEsIHN0cnVjdCBz
Y2hlZF9lbnRpdHkKPiA+ID4gPiAqc2UpCj4gPiA+ID4gIHsKPiA+ID4gPiAtICAgICAgIGNmc19y
cS0+YXZnLmxvYWRfYXZnICs9IHNlLT5hdmcubG9hZF9hdmc7Cj4gPiA+ID4gLSAgICAgICBjZnNf
cnEtPmF2Zy5sb2FkX3N1bSArPSBzZV93ZWlnaHQoc2UpICogc2UtCj4gPiA+ID4gPmF2Zy5sb2Fk
X3N1bTsKPiA+ID4gPiArICAgICAgIGFkZF9wb3NpdGl2ZSgmY2ZzX3JxLT5hdmcubG9hZF9hdmcs
IHNlLT5hdmcubG9hZF9hdmcpOwo+ID4gPiA+ICsgICAgICAgYWRkX3Bvc2l0aXZlKCZjZnNfcnEt
PmF2Zy5sb2FkX3N1bSwgc2Vfd2VpZ2h0KHNlKSAqIHNlLQo+ID4gPiA+ID4gYXZnLmxvYWRfc3Vt
KTsKPiA+ID4gPiAKPiA+ID4gPiArICAgICAgIGNmc19ycS0+YXZnLmxvYWRfc3VtID0gbWF4X3Qo
dTMyLCBjZnNfcnEtPmF2Zy5sb2FkX3N1bSwKPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBjZnNfcnEtPmF2Zy5sb2FkX2F2Zwo+ID4gPiA+ICoKPiA+ID4g
PiBQRUxUX01JTl9ESVZJREVSKTsKPiA+ID4gPiAgfQo+ID4gPiA+IAo+ID4gPiA+ICBzdGF0aWMg
aW5saW5lIHZvaWQKPiA+ID4gPiAtLQo+ID4gPiA+IDIuMTguMAo+ID4gPiA+IAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1h
aWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
