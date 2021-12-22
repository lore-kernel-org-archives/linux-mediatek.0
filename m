Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0252FC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Dec 2021 08:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CGFD/7ugXMWn+WpM2HdTRDp6sf3/iJM7/bW2fSuA41A=; b=t4cYdqwhSkzoI9
	2we5SVIfUIQRckg6BAlZhWg0zKIu2jIjSEmUVcXK9a3bpgrXvUrppblmnLmyCKHAYpSJhm0JIAKHP
	TBYO/GB6nQ3mMk/1FEyApXLn0wlhSG/GuR1sQ+A6kFtxRDpdzSlrcDeIAPfBB1+j80JmbYH3uYMJN
	cKFdzyV6M1AcbPBAg9BcEtmLdqCMiiy1qQXYya0wFxhjZ/HVNw5xhtkOgPC2VOForTDD7BGwJ5ZLQ
	Ftx1T68DKD5Hg6JOCYxyJnr/XryeFsNnQ2QP4IhpKSDkLiTRaXOE6TWYwBkKn+j1EXA7aT5xyDNfq
	QdM2R8fYn1DSj6nnYApQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzx5q-009iOm-J2; Wed, 22 Dec 2021 08:35:26 +0000
Received: from coyote.holtmann.net ([212.227.132.17] helo=mail.holtmann.org)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzx5l-009iLM-RL
 for linux-mediatek@lists.infradead.org; Wed, 22 Dec 2021 08:35:24 +0000
Received: from smtpclient.apple (p5b3d2e91.dip0.t-ipconnect.de [91.61.46.145])
 by mail.holtmann.org (Postfix) with ESMTPSA id 8B0E9CED09;
 Wed, 22 Dec 2021 09:35:14 +0100 (CET)
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.40.0.1.81\))
Subject: Re: [PATCH v2 1/3] Bluetooth: mt7921s: Support wake on bluetooth
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <ef0603f2553d09fb84043704e4726d0ab98aa63b.1640141813.git.objelf@gmail.com>
Date: Wed, 22 Dec 2021 09:35:13 +0100
Cc: Johan Hedberg <johan.hedberg@gmail.com>,
 =?utf-8?B?Ik1hcmstWVcgQ2hlbiAo6Zmz5o+a5paHKSI=?= <Mark-YW.Chen@mediatek.com>, 
 Soul.Huang@mediatek.com, YN.Chen@mediatek.com, Leon.Yen@mediatek.com,
 Eric-SY.Chang@mediatek.com, Deren.Wu@mediatek.com, km.lin@mediatek.com,
 robin.chiu@mediatek.com, Eddie.Chen@mediatek.com, ch.yeh@mediatek.com,
 posh.sun@mediatek.com, ted.huang@mediatek.com, Eric.Liang@mediatek.com,
 Stella.Chang@mediatek.com, Tom.Chou@mediatek.com, steve.lee@mediatek.com,
 jsiuda@google.com, frankgor@google.com, jemele@google.com,
 abhishekpandit@google.com, Michael Sun <michaelfsun@google.com>,
 Miao-chen Chou <mcchou@chromium.org>, shawnku@google.com,
 linux-bluetooth <linux-bluetooth@vger.kernel.org>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Message-Id: <88EFA0DD-4DB4-4D29-8A76-460ED0B6CD9F@holtmann.org>
References: <ef0603f2553d09fb84043704e4726d0ab98aa63b.1640141813.git.objelf@gmail.com>
To: Sean Wang <sean.wang@mediatek.com>
X-Mailer: Apple Mail (2.3693.40.0.1.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211222_003522_080302_190BD35D 
X-CRM114-Status: GOOD (  24.80  )
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

SGkgU2VhbiwKCj4gRW5hYmxlIHdha2Ugb24gYmx1ZXRvb3RoIG9uIG10NzkyMXMgdGhhdCBjYW4g
YmUgc3VwcG9ydGVkIHNpbmNlIHRoZQo+IGZpcm13YXJlIHdpdGggdmVyc2lvbiAyMDIxMTEyOTIx
MTA1OSB3YXMgYWRkZWQsIGFuZCB0aGUgcGF0Y2ggd291bGQKPiBub3QgY2F1c2UgYW55IGhhcm0g
ZXZlbiB3aGVuIHRoZSBvbGQgZmlybXdhcmUgaXMgYXBwbGllZC4KPiAKPiBUaGUgcGF0Y2ggd2Fz
IHRlc3RlZCBieSBzZXR0aW5nIHVwIGFuIEhJRCBvciBIT0dQIHByb2ZpbGUgdG8gY29ubmVjdCBh
Cj4gQmx1ZXRvb3RoIGtleWJvYXJkIGFuZCBtb3VzZSwgdGhlbiBwdXR0aW5nIHRoZSBzeXN0ZW0g
dG8gc3VzcGVuZCwgdGhlbgo+IHRyeWluZyB0byB3YWtlIHVwIHRoZSBzeXN0ZW0gYnkgbW92aW5n
IHRoZSBCbHVldG9vdGgga2V5Ym9hcmQgb3IgbW91c2UsCj4gYW5kIHRoZW4gY2hlY2tpbmcgaWYg
dGhlIHN5c3RlbSBjYW4gd2FrZSB1cCBhbmQgYmUgYnJvdWdodCBiYWNrIHRvCj4gdGhlIG5vcm1h
bCBzdGF0ZS4KPiAKPiBDby1kZXZlbG9wZWQtYnk6IFNlYW4gV2FuZyA8c2Vhbi53YW5nQG1lZGlh
dGVrLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBTZWFuIFdhbmcgPHNlYW4ud2FuZ0BtZWRpYXRlay5j
b20+Cj4gU2lnbmVkLW9mZi1ieTogTWFyayBDaGVuIDxtYXJrLXl3LmNoZW5AbWVkaWF0ZWsuY29t
Pgo+IC0tLQo+IHYyOiByZWZpbmUgdGhlIGdpdCBtZXNzYWdlCj4gLS0tCj4gZHJpdmVycy9ibHVl
dG9vdGgvYnRtdGsuaCAgICAgfCAgOCArKysrKysrKwo+IGRyaXZlcnMvYmx1ZXRvb3RoL2J0bXRr
c2Rpby5jIHwgMzEgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLQo+IDIgZmlsZXMgY2hh
bmdlZCwgMzggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2JsdWV0b290aC9idG10ay5oIGIvZHJpdmVycy9ibHVldG9vdGgvYnRtdGsuaAo+IGlu
ZGV4IDZlN2IwYzc1NjdjMC4uMmJlMWQyNjgwYWQ4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvYmx1
ZXRvb3RoL2J0bXRrLmgKPiArKysgYi9kcml2ZXJzL2JsdWV0b290aC9idG10ay5oCj4gQEAgLTY4
LDYgKzY4LDE0IEBAIHN0cnVjdCBidG10a190Y2lfc2xlZXAgewo+IAl1OCB0aW1lX2NvbXBlbnNh
dGlvbjsKPiB9IF9fcGFja2VkOwo+IAo+ICtzdHJ1Y3QgYnRtdGtfd2FrZW9uIHsKPiArCXU4IG1v
ZGU7Cj4gKwl1OCBncG87Cj4gKwl1OCBhY3RpdmVfaGlnaDsKPiArCV9fbGUxNiBlbmFibGVfZGVs
YXk7Cj4gKwlfX2xlMTYgd2FrZXVwX2RlbGF5Owo+ICt9IF9fcGFja2VkOwo+ICsKPiBzdHJ1Y3Qg
YnRtdGtfaGNpX3dtdF9wYXJhbXMgewo+IAl1OCBvcDsKPiAJdTggZmxhZzsKPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ibHVldG9vdGgvYnRtdGtzZGlvLmMgYi9kcml2ZXJzL2JsdWV0b290aC9idG10
a3NkaW8uYwo+IGluZGV4IGI1ZWE4ZDNiZmZhYS4uNzcxNzMzY2UzNjJiIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvYmx1ZXRvb3RoL2J0bXRrc2Rpby5jCj4gKysrIGIvZHJpdmVycy9ibHVldG9vdGgv
YnRtdGtzZGlvLmMKPiBAQCAtOTU4LDYgKzk1OCwzMCBAQCBzdGF0aWMgaW50IGJ0bXRrc2Rpb19z
ZW5kX2ZyYW1lKHN0cnVjdCBoY2lfZGV2ICpoZGV2LCBzdHJ1Y3Qgc2tfYnVmZiAqc2tiKQo+IAly
ZXR1cm4gMDsKPiB9Cj4gCj4gK3N0YXRpYyBib29sIGJ0bXRrX3NkaW9fd2FrZXVwKHN0cnVjdCBo
Y2lfZGV2ICpoZGV2KQo+ICt7Cj4gKwlzdHJ1Y3QgYnRtdGtzZGlvX2RldiAqYmRldiA9IGhjaV9n
ZXRfZHJ2ZGF0YShoZGV2KTsKPiArCWJvb2wgbWF5X3dha2V1cCA9IGRldmljZV9tYXlfd2FrZXVw
KGJkZXYtPmRldik7Cj4gKwlzdHJ1Y3QgYnRtdGtfd2FrZW9uIGJ0X2F3YWtlID0gewo+ICsJCS5t
b2RlID0gMHgxLAo+ICsJCS5ncG8gPSAwLAo+ICsJCS5hY3RpdmVfaGlnaCA9IDB4MSwKPiArCQku
ZW5hYmxlX2RlbGF5ID0gY3B1X3RvX2xlMTYoMHhjODApLAo+ICsJCS53YWtldXBfZGVsYXkgPSBj
cHVfdG9fbGUxNigweDIwKQo+ICsJfTsKPiArCXN0cnVjdCBza19idWZmICpza2I7Cj4gKwo+ICsJ
aWYgKG1heV93YWtldXAgJiYKPiArCSAgICBiZGV2LT5kYXRhLT5jaGlwaWQgPT0gMHg3OTIxKSB7
Cgp0aGlzIGRvZXNu4oCZdCBmaXQgaW4gYSBzaW5nbGUgbGluZT8KCj4gKwkJc2tiID0gIF9faGNp
X2NtZF9zeW5jKGhkZXYsIDB4ZmMyNywgc2l6ZW9mKGJ0X2F3YWtlKSwKPiArCQkJCSAgICAgICZi
dF9hd2FrZSwgSENJX0NNRF9USU1FT1VUKTsKPiArCQlpZiAoSVNfRVJSKHNrYikpCj4gKwkJCW1h
eV93YWtldXAgPSBmYWxzZTsKCk1lbW9yeSBsZWFrPwoKQW55IHdoeSBub3QgbW92ZSB0aGUgc2ti
IHZhcmlhYmxlIGludG8gdGhlIHNjb3BlIHdoZXJlIGl0IGlzIHVzZWQuCgo+ICsJfQo+ICsKPiAr
CXJldHVybiBtYXlfd2FrZXVwOwo+ICt9Cj4gKwo+IHN0YXRpYyBpbnQgYnRtdGtzZGlvX3Byb2Jl
KHN0cnVjdCBzZGlvX2Z1bmMgKmZ1bmMsCj4gCQkJICAgY29uc3Qgc3RydWN0IHNkaW9fZGV2aWNl
X2lkICppZCkKPiB7Cj4gQEAgLTk5OCw2ICsxMDIyLDcgQEAgc3RhdGljIGludCBidG10a3NkaW9f
cHJvYmUoc3RydWN0IHNkaW9fZnVuYyAqZnVuYywKPiAJaGRldi0+c2h1dGRvd24gPSBidG10a3Nk
aW9fc2h1dGRvd247Cj4gCWhkZXYtPnNlbmQgICAgID0gYnRtdGtzZGlvX3NlbmRfZnJhbWU7Cj4g
CWhkZXYtPnNldF9iZGFkZHIgPSBidG10a19zZXRfYmRhZGRyOwo+ICsJaGRldi0+d2FrZXVwID0g
YnRtdGtfc2Rpb193YWtldXA7Cj4gCj4gCVNFVF9IQ0lERVZfREVWKGhkZXYsICZmdW5jLT5kZXYp
Owo+IAo+IEBAIC0xMDMyLDcgKzEwNTcsMTEgQEAgc3RhdGljIGludCBidG10a3NkaW9fcHJvYmUo
c3RydWN0IHNkaW9fZnVuYyAqZnVuYywKPiAJICovCj4gCXBtX3J1bnRpbWVfcHV0X25vaWRsZShi
ZGV2LT5kZXYpOwo+IAo+IC0JcmV0dXJuIDA7Cj4gKwllcnIgPSBkZXZpY2VfaW5pdF93YWtldXAo
YmRldi0+ZGV2LCB0cnVlKTsKPiArCWlmIChlcnIpCj4gKwkJYnRfZGV2X2VycihoZGV2LCAiJXM6
IGZhaWxlZCB0byBpbml0X3dha2V1cCIsIF9fZnVuY19fKTsKPiArCj4gKwlyZXR1cm4gZXJyOwo+
IH0KPiAKPiBzdGF0aWMgdm9pZCBidG10a3NkaW9fcmVtb3ZlKHN0cnVjdCBzZGlvX2Z1bmMgKmZ1
bmMpCgpSZWdhcmRzCgpNYXJjZWwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
