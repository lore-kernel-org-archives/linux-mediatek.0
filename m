Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB123C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Dec 2021 14:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I1J4I/0326e7ZxITwIPcuH4y9IY7Hn/cwxfbhbINQbQ=; b=O8G6o4qAtWBkxI
	NsA287BUyDQaow3FHkPrDuX2W336artGeBlkEw/XbzJRu9Eqr4qtzxIeZXxR/NMD06KTszcLuiSpz
	of8UKhaLoCiMwUKDqgpeNxukYXLOdiFwAwRH99GPGmRBcnl3KCOi7tM/Vqu6+SsUYRDzMJh9WdkKZ
	A1Q9AqZv1NiSGBbCR1NaZCfs49Dk5f8amWLOD76MHrT4DciwtMxwaagfljakUTN+6hiQaX+IQdK/m
	4Y2/wamqmFshE8CuR3XTUQJ3X7OzgnZ8XjnbbRN2ghpWYkUWqfjdgA74SOep+lA2BdKLXS2io0nTf
	fqp/vf2KjrWQpInL8WnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n02YQ-00Afto-3v; Wed, 22 Dec 2021 14:25:18 +0000
Received: from mx3.molgen.mpg.de ([141.14.17.11] helo=mx1.molgen.mpg.de)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n02YM-00AfoL-Sb
 for linux-mediatek@lists.infradead.org; Wed, 22 Dec 2021 14:25:17 +0000
Received: from [192.168.0.2] (ip5f5aeac8.dynamic.kabel-deutschland.de
 [95.90.234.200])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id F34BD61EA1935;
 Wed, 22 Dec 2021 15:24:58 +0100 (CET)
Message-ID: <f6baa415-b078-4308-e31d-6b44e748c1c5@molgen.mpg.de>
Date: Wed, 22 Dec 2021 15:24:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH v2 1/3] Bluetooth: mt7921s: Support wake on bluetooth
Content-Language: en-US
To: Sean Wang <sean.wang@mediatek.com>, Marcel Holtmann
 <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>
Cc: Mark-YW.Chen@mediatek.com, Soul.Huang@mediatek.com, YN.Chen@mediatek.com, 
 Leon.Yen@mediatek.com, Eric-SY.Chang@mediatek.com, Deren.Wu@mediatek.com, 
 km.lin@mediatek.com, robin.chiu@mediatek.com, Eddie.Chen@mediatek.com,
 ch.yeh@mediatek.com, posh.sun@mediatek.com, ted.huang@mediatek.com,
 Eric.Liang@mediatek.com, Stella.Chang@mediatek.com, Tom.Chou@mediatek.com,
 steve.lee@mediatek.com, jsiuda@google.com, frankgor@google.com,
 jemele@google.com, abhishekpandit@google.com, michaelfsun@google.com,
 mcchou@chromium.org, shawnku@google.com, linux-bluetooth@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <ef0603f2553d09fb84043704e4726d0ab98aa63b.1640141813.git.objelf@gmail.com>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <ef0603f2553d09fb84043704e4726d0ab98aa63b.1640141813.git.objelf@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211222_062515_130956_78CAA9FF 
X-CRM114-Status: GOOD (  26.79  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

RGVhciBTZWFuLAoKCkFtIDIyLjEyLjIxIHVtIDA0OjExIHNjaHJpZWIgc2Vhbi53YW5nQG1lZGlh
dGVrLmNvbToKPiBGcm9tOiBNYXJrIENoZW4gPG1hcmsteXcuY2hlbkBtZWRpYXRlay5jb20+Cj4g
Cj4gRW5hYmxlIHdha2Ugb24gYmx1ZXRvb3RoIG9uIG10NzkyMXMgdGhhdCBjYW4gYmUgc3VwcG9y
dGVkIHNpbmNlIHRoZQo+IGZpcm13YXJlIHdpdGggdmVyc2lvbiAyMDIxMTEyOTIxMTA1OSB3YXMg
YWRkZWQsIGFuZCB0aGUgcGF0Y2ggd291bGQKPiBub3QgY2F1c2UgYW55IGhhcm0gZXZlbiB3aGVu
IHRoZSBvbGQgZmlybXdhcmUgaXMgYXBwbGllZC4KCk1heWJlIHByaW50IGEgbm90aWNlIGxldmVs
IG1lc3NhZ2UsIGlmIHRoZSBmaXJtd2FyZSBpcyB0b28gb2xkLCBhbmQgdGhlIApmZWF0dXJlIGNh
bm5vdCBiZSBzdXBwb3J0ZWQ/Cgo+IFRoZSBwYXRjaCB3YXMgdGVzdGVkIGJ5IHNldHRpbmcgdXAg
YW4gSElEIG9yIEhPR1AgcHJvZmlsZSB0byBjb25uZWN0IGEKPiBCbHVldG9vdGgga2V5Ym9hcmQg
YW5kIG1vdXNlLCB0aGVuIHB1dHRpbmcgdGhlIHN5c3RlbSB0byBzdXNwZW5kLCB0aGVuCj4gdHJ5
aW5nIHRvIHdha2UgdXAgdGhlIHN5c3RlbSBieSBtb3ZpbmcgdGhlIEJsdWV0b290aCBrZXlib2Fy
ZCBvciBtb3VzZSwKPiBhbmQgdGhlbiBjaGVja2luZyBpZiB0aGUgc3lzdGVtIGNhbiB3YWtlIHVw
IGFuZCBiZSBicm91Z2h0IGJhY2sgdG8KPiB0aGUgbm9ybWFsIHN0YXRlLgoKSeKAmWQgc3RpbGwg
d291bGQgbGlrZSB0byBzZWUgdGhlIGRhdGFzaGVldCBuYW1lLCByZXZpc2lvbiwgYW5kIHNlY3Rp
b24gaW4gCnRoZSBjb21taXQgbWVzc2FnZSwgZXZlbiB0aG91Z2ggdGhlIGRhdGFzaGVldCBpcyBu
b3QgcHVibGljLgoKPiBDby1kZXZlbG9wZWQtYnk6IFNlYW4gV2FuZyA8c2Vhbi53YW5nQG1lZGlh
dGVrLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBTZWFuIFdhbmcgPHNlYW4ud2FuZ0BtZWRpYXRlay5j
b20+Cj4gU2lnbmVkLW9mZi1ieTogTWFyayBDaGVuIDxtYXJrLXl3LmNoZW5AbWVkaWF0ZWsuY29t
Pgo+IC0tLQo+IHYyOiByZWZpbmUgdGhlIGdpdCBtZXNzYWdlCj4gLS0tCj4gICBkcml2ZXJzL2Js
dWV0b290aC9idG10ay5oICAgICB8ICA4ICsrKysrKysrCj4gICBkcml2ZXJzL2JsdWV0b290aC9i
dG10a3NkaW8uYyB8IDMxICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0KPiAgIDIgZmls
ZXMgY2hhbmdlZCwgMzggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2JsdWV0b290aC9idG10ay5oIGIvZHJpdmVycy9ibHVldG9vdGgvYnRtdGsu
aAo+IGluZGV4IDZlN2IwYzc1NjdjMC4uMmJlMWQyNjgwYWQ4IDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvYmx1ZXRvb3RoL2J0bXRrLmgKPiArKysgYi9kcml2ZXJzL2JsdWV0b290aC9idG10ay5oCj4g
QEAgLTY4LDYgKzY4LDE0IEBAIHN0cnVjdCBidG10a190Y2lfc2xlZXAgewo+ICAgCXU4IHRpbWVf
Y29tcGVuc2F0aW9uOwo+ICAgfSBfX3BhY2tlZDsKPiAgIAo+ICtzdHJ1Y3QgYnRtdGtfd2FrZW9u
IHsKPiArCXU4IG1vZGU7Cj4gKwl1OCBncG87Cj4gKwl1OCBhY3RpdmVfaGlnaDsKPiArCV9fbGUx
NiBlbmFibGVfZGVsYXk7Cj4gKwlfX2xlMTYgd2FrZXVwX2RlbGF5Owo+ICt9IF9fcGFja2VkOwo+
ICsKPiAgIHN0cnVjdCBidG10a19oY2lfd210X3BhcmFtcyB7Cj4gICAJdTggb3A7Cj4gICAJdTgg
ZmxhZzsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ibHVldG9vdGgvYnRtdGtzZGlvLmMgYi9kcml2
ZXJzL2JsdWV0b290aC9idG10a3NkaW8uYwo+IGluZGV4IGI1ZWE4ZDNiZmZhYS4uNzcxNzMzY2Uz
NjJiIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvYmx1ZXRvb3RoL2J0bXRrc2Rpby5jCj4gKysrIGIv
ZHJpdmVycy9ibHVldG9vdGgvYnRtdGtzZGlvLmMKPiBAQCAtOTU4LDYgKzk1OCwzMCBAQCBzdGF0
aWMgaW50IGJ0bXRrc2Rpb19zZW5kX2ZyYW1lKHN0cnVjdCBoY2lfZGV2ICpoZGV2LCBzdHJ1Y3Qg
c2tfYnVmZiAqc2tiKQo+ICAgCXJldHVybiAwOwo+ICAgfQo+ICAgCj4gK3N0YXRpYyBib29sIGJ0
bXRrX3NkaW9fd2FrZXVwKHN0cnVjdCBoY2lfZGV2ICpoZGV2KQo+ICt7Cj4gKwlzdHJ1Y3QgYnRt
dGtzZGlvX2RldiAqYmRldiA9IGhjaV9nZXRfZHJ2ZGF0YShoZGV2KTsKPiArCWJvb2wgbWF5X3dh
a2V1cCA9IGRldmljZV9tYXlfd2FrZXVwKGJkZXYtPmRldik7Cj4gKwlzdHJ1Y3QgYnRtdGtfd2Fr
ZW9uIGJ0X2F3YWtlID0gewo+ICsJCS5tb2RlID0gMHgxLAo+ICsJCS5ncG8gPSAwLAo+ICsJCS5h
Y3RpdmVfaGlnaCA9IDB4MSwKPiArCQkuZW5hYmxlX2RlbGF5ID0gY3B1X3RvX2xlMTYoMHhjODAp
LAo+ICsJCS53YWtldXBfZGVsYXkgPSBjcHVfdG9fbGUxNigweDIwKQo+ICsJfTsKPiArCXN0cnVj
dCBza19idWZmICpza2I7Cj4gKwo+ICsJaWYgKG1heV93YWtldXAgJiYKPiArCSAgICBiZGV2LT5k
YXRhLT5jaGlwaWQgPT0gMHg3OTIxKSB7Cj4gKwkJc2tiID0gIF9faGNpX2NtZF9zeW5jKGhkZXYs
IDB4ZmMyNywgc2l6ZW9mKGJ0X2F3YWtlKSwKPiArCQkJCSAgICAgICZidF9hd2FrZSwgSENJX0NN
RF9USU1FT1VUKTsKPiArCQlpZiAoSVNfRVJSKHNrYikpCj4gKwkJCW1heV93YWtldXAgPSBmYWxz
ZTsKPiArCX0KPiArCj4gKwlyZXR1cm4gbWF5X3dha2V1cDsKPiArfQo+ICsKPiAgIHN0YXRpYyBp
bnQgYnRtdGtzZGlvX3Byb2JlKHN0cnVjdCBzZGlvX2Z1bmMgKmZ1bmMsCj4gICAJCQkgICBjb25z
dCBzdHJ1Y3Qgc2Rpb19kZXZpY2VfaWQgKmlkKQo+ICAgewo+IEBAIC05OTgsNiArMTAyMiw3IEBA
IHN0YXRpYyBpbnQgYnRtdGtzZGlvX3Byb2JlKHN0cnVjdCBzZGlvX2Z1bmMgKmZ1bmMsCj4gICAJ
aGRldi0+c2h1dGRvd24gPSBidG10a3NkaW9fc2h1dGRvd247Cj4gICAJaGRldi0+c2VuZCAgICAg
PSBidG10a3NkaW9fc2VuZF9mcmFtZTsKPiAgIAloZGV2LT5zZXRfYmRhZGRyID0gYnRtdGtfc2V0
X2JkYWRkcjsKPiArCWhkZXYtPndha2V1cCA9IGJ0bXRrX3NkaW9fd2FrZXVwOwoKSnVzdCBhIG5p
dCwgdGhhdCB0d28gYW5kIHRocmVlIGxpbmVzIGFib3ZlLCB0aGUgZXF1YWwgc2lnbnMgYXJlIGFs
aWduZWQuCgo+ICAgCVNFVF9IQ0lERVZfREVWKGhkZXYsICZmdW5jLT5kZXYpOwo+ICAgCj4gQEAg
LTEwMzIsNyArMTA1NywxMSBAQCBzdGF0aWMgaW50IGJ0bXRrc2Rpb19wcm9iZShzdHJ1Y3Qgc2Rp
b19mdW5jICpmdW5jLAo+ICAgCSAqLwo+ICAgCXBtX3J1bnRpbWVfcHV0X25vaWRsZShiZGV2LT5k
ZXYpOwo+ICAgCj4gLQlyZXR1cm4gMDsKPiArCWVyciA9IGRldmljZV9pbml0X3dha2V1cChiZGV2
LT5kZXYsIHRydWUpOwo+ICsJaWYgKGVycikKPiArCQlidF9kZXZfZXJyKGhkZXYsICIlczogZmFp
bGVkIHRvIGluaXRfd2FrZXVwIiwgX19mdW5jX18pOwo+ICsKPiArCXJldHVybiBlcnI7Cj4gICB9
Cj4gICAKPiAgIHN0YXRpYyB2b2lkIGJ0bXRrc2Rpb19yZW1vdmUoc3RydWN0IHNkaW9fZnVuYyAq
ZnVuYykKCgpLaW5kIHJlZ2FyZHMsCgpQYXVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVk
aWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
