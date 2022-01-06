Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0D19C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Jan 2022 14:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KOy1lcu1DvF845mdcO8N+gGUdc4aNgWjnDCEb4U7dmk=; b=tXlWSkD4BuUUaJ
	pN3UC+y6N4BxM6BfhfE+6U/cJ7EGakUQUj/tf0rm2lcK406lQ2CWX2tbZd64NyxGG/kcVGU7ib5++
	jpuxVXBt4furraaR3z8p34d52Kc+Dpxxv/JbW7GlEShafiDjjStLROdS/gU+8PLpP4heZ1Klup4VZ
	UJ+p+cfq/K801d88qVbm/IgY6qJL3D4kXqdvX9lnTQaz/r1ghEP74Flfj3WRhcxIhM0/cO08quKeJ
	wPArCzrFLs8ckEHsBXQLOxdZPt1KPZCRjvPYSwSyxORM6WuvO91pPjJRSz6eYA1UJmMknuIpiS7SU
	PbO1oMeAfVOdZQqMG1QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5TJk-000HWx-P3; Thu, 06 Jan 2022 14:00:36 +0000
Received: from coyote.holtmann.net ([212.227.132.17] helo=mail.holtmann.org)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5TJh-000HTi-Eh
 for linux-mediatek@lists.infradead.org; Thu, 06 Jan 2022 14:00:35 +0000
Received: from smtpclient.apple (p4fefca45.dip0.t-ipconnect.de [79.239.202.69])
 by mail.holtmann.org (Postfix) with ESMTPSA id 698C3CECD5;
 Thu,  6 Jan 2022 15:00:25 +0100 (CET)
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.40.0.1.81\))
Subject: Re: [PATCH v4 1/3] Bluetooth: mt7921s: Support wake on bluetooth
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <91dfa736b7629cdb94bd2029f05717eeae77b07d.1640334021.git.sean.wang@kernel.org>
Date: Thu, 6 Jan 2022 15:00:24 +0100
Cc: Johan Hedberg <johan.hedberg@gmail.com>,
 =?utf-8?B?Ik1hcmstWVcgQ2hlbiAo6Zmz5o+a5paHKSI=?= <Mark-YW.Chen@mediatek.com>, 
 Soul.Huang@mediatek.com, YN.Chen@mediatek.com, Leon.Yen@mediatek.com,
 Eric-SY.Chang@mediatek.com, Deren.Wu@mediatek.com, km.lin@mediatek.com,
 robin.chiu@mediatek.com, Eddie.Chen@mediatek.com, ch.yeh@mediatek.com,
 posh.sun@mediatek.com, ted.huang@mediatek.com, Eric.Liang@mediatek.com,
 Stella.Chang@mediatek.com, Tom.Chou@mediatek.com, steve.lee@mediatek.com,
 jsiuda@google.com, frankgor@google.com, jemele@google.com,
 abhishekpandit@google.com, michaelfsun@google.com, mcchou@chromium.org,
 shawnku@google.com, linux-bluetooth@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Message-Id: <F4F5EE39-6EEF-446D-ABD3-C02280BCE849@holtmann.org>
References: <91dfa736b7629cdb94bd2029f05717eeae77b07d.1640334021.git.sean.wang@kernel.org>
To: Sean Wang <sean.wang@mediatek.com>
X-Mailer: Apple Mail (2.3693.40.0.1.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220106_060033_673470_A7664DC4 
X-CRM114-Status: GOOD (  26.58  )
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

SGkgTWFyaywKCj4gRW5hYmxlIHdha2Ugb24gYmx1ZXRvb3RoIG9uIG10NzkyMXMgdGhhdCBjYW4g
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
Pgo+IC0tLQo+IHYyOiByZWZpbmUgdGhlIGdpdCBtZXNzYWdlCj4gdjM6Cj4gICAgMS4gZml0IHRv
IHNpbmdsZSBsaW5lIGFzIHBvc3NpYmxlCj4gICAgMi4gbW92ZSB0aGUgc2tiIHZhcmlhYmxlIGlu
dG8gbG9jYWwgc2NvcGUKPiAgICAzLiBmcmVlIHNrYiBhZnRlciBjYWxsaW5nIF9faGNpX2NtZF9z
eW5jCj4gICAgNC4gbWFrZSBidF9hd2FrZSBhcyBjb25zdCBzdHJ1Y3QgYnRtdGtfd2FrZW9uCj4g
djQ6IDEuIGRyb3AgX19mdW5jX18gaW4gZXJyb3IgbWVzc2FnZXMKPiAgICAyLiBtYWtlIGhkZXYt
Pndha2V1cCBhc3NpZ25tZW50IGFsaWduZWQgdG8gaGRldi0+c2VuZAo+IC0tLQo+IGRyaXZlcnMv
Ymx1ZXRvb3RoL2J0bXRrLmggICAgIHwgIDggKysrKysrKysKPiBkcml2ZXJzL2JsdWV0b290aC9i
dG10a3NkaW8uYyB8IDMzICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLQo+IDIgZmls
ZXMgY2hhbmdlZCwgNDAgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2JsdWV0b290aC9idG10ay5oIGIvZHJpdmVycy9ibHVldG9vdGgvYnRtdGsu
aAo+IGluZGV4IDZlN2IwYzc1NjdjMC4uMmJlMWQyNjgwYWQ4IDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvYmx1ZXRvb3RoL2J0bXRrLmgKPiArKysgYi9kcml2ZXJzL2JsdWV0b290aC9idG10ay5oCj4g
QEAgLTY4LDYgKzY4LDE0IEBAIHN0cnVjdCBidG10a190Y2lfc2xlZXAgewo+IAl1OCB0aW1lX2Nv
bXBlbnNhdGlvbjsKPiB9IF9fcGFja2VkOwo+IAo+ICtzdHJ1Y3QgYnRtdGtfd2FrZW9uIHsKPiAr
CXU4IG1vZGU7Cj4gKwl1OCBncG87Cj4gKwl1OCBhY3RpdmVfaGlnaDsKPiArCV9fbGUxNiBlbmFi
bGVfZGVsYXk7Cj4gKwlfX2xlMTYgd2FrZXVwX2RlbGF5Owo+ICt9IF9fcGFja2VkOwo+ICsKPiBz
dHJ1Y3QgYnRtdGtfaGNpX3dtdF9wYXJhbXMgewo+IAl1OCBvcDsKPiAJdTggZmxhZzsKPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ibHVldG9vdGgvYnRtdGtzZGlvLmMgYi9kcml2ZXJzL2JsdWV0b290
aC9idG10a3NkaW8uYwo+IGluZGV4IGI1ZWE4ZDNiZmZhYS4uODliZDcwNjUxZTllIDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvYmx1ZXRvb3RoL2J0bXRrc2Rpby5jCj4gKysrIGIvZHJpdmVycy9ibHVl
dG9vdGgvYnRtdGtzZGlvLmMKPiBAQCAtOTU4LDYgKzk1OCwzMiBAQCBzdGF0aWMgaW50IGJ0bXRr
c2Rpb19zZW5kX2ZyYW1lKHN0cnVjdCBoY2lfZGV2ICpoZGV2LCBzdHJ1Y3Qgc2tfYnVmZiAqc2ti
KQo+IAlyZXR1cm4gMDsKPiB9Cj4gCj4gK3N0YXRpYyBib29sIGJ0bXRrX3NkaW9fd2FrZXVwKHN0
cnVjdCBoY2lfZGV2ICpoZGV2KQo+ICt7Cj4gKwlzdHJ1Y3QgYnRtdGtzZGlvX2RldiAqYmRldiA9
IGhjaV9nZXRfZHJ2ZGF0YShoZGV2KTsKPiArCWJvb2wgbWF5X3dha2V1cCA9IGRldmljZV9tYXlf
d2FrZXVwKGJkZXYtPmRldik7Cj4gKwljb25zdCBzdHJ1Y3QgYnRtdGtfd2FrZW9uIGJ0X2F3YWtl
ID0gewo+ICsJCS5tb2RlID0gMHgxLAo+ICsJCS5ncG8gPSAwLAo+ICsJCS5hY3RpdmVfaGlnaCA9
IDB4MSwKPiArCQkuZW5hYmxlX2RlbGF5ID0gY3B1X3RvX2xlMTYoMHhjODApLAo+ICsJCS53YWtl
dXBfZGVsYXkgPSBjcHVfdG9fbGUxNigweDIwKQoKc28gd2Ugbm9ybWFsbHkgYWRkIHRoZSAsIGF0
IHRoZSBlbmQgaGVyZSBhcyB3ZWxsLiBUaGF0IG1lYW5zIGV4dGVuZGluZyB0aGUgc3R1cmN0IHJl
cXVpcmVzIG9uZSBsZXNzIGxpbmUgdG8gY2hhbmdlLgoKPiArCX07Cj4gKwo+ICsJaWYgKG1heV93
YWtldXAgJiYgYmRldi0+ZGF0YS0+Y2hpcGlkID09IDB4NzkyMSkgewo+ICsJCXN0cnVjdCBza19i
dWZmICpza2I7Cj4gKwo+ICsJCXNrYiA9ICBfX2hjaV9jbWRfc3luYyhoZGV2LCAweGZjMjcsIHNp
emVvZihidF9hd2FrZSksCj4gKwkJCQkgICAgICAmYnRfYXdha2UsIEhDSV9DTURfVElNRU9VVCk7
Cj4gKwkJaWYgKElTX0VSUihza2IpKQo+ICsJCQltYXlfd2FrZXVwID0gZmFsc2U7Cj4gKwo+ICsJ
CWtmcmVlX3NrYihza2IpOwo+ICsJfQo+ICsKPiArCXJldHVybiBtYXlfd2FrZXVwOwo+ICt9Cj4g
Kwo+IHN0YXRpYyBpbnQgYnRtdGtzZGlvX3Byb2JlKHN0cnVjdCBzZGlvX2Z1bmMgKmZ1bmMsCj4g
CQkJICAgY29uc3Qgc3RydWN0IHNkaW9fZGV2aWNlX2lkICppZCkKPiB7Cj4gQEAgLTk5OCw2ICsx
MDI0LDcgQEAgc3RhdGljIGludCBidG10a3NkaW9fcHJvYmUoc3RydWN0IHNkaW9fZnVuYyAqZnVu
YywKPiAJaGRldi0+c2h1dGRvd24gPSBidG10a3NkaW9fc2h1dGRvd247Cj4gCWhkZXYtPnNlbmQg
ICAgID0gYnRtdGtzZGlvX3NlbmRfZnJhbWU7Cj4gCWhkZXYtPnNldF9iZGFkZHIgPSBidG10a19z
ZXRfYmRhZGRyOwo+ICsJaGRldi0+d2FrZXVwICAgPSBidG10a19zZGlvX3dha2V1cDsKCkp1c3Qg
bW92ZSB0aGlzIG9uZSBhZnRlciAtPnNlbmQuCgo+IAo+IAlTRVRfSENJREVWX0RFVihoZGV2LCAm
ZnVuYy0+ZGV2KTsKPiAKPiBAQCAtMTAzMiw3ICsxMDU5LDExIEBAIHN0YXRpYyBpbnQgYnRtdGtz
ZGlvX3Byb2JlKHN0cnVjdCBzZGlvX2Z1bmMgKmZ1bmMsCj4gCSAqLwo+IAlwbV9ydW50aW1lX3B1
dF9ub2lkbGUoYmRldi0+ZGV2KTsKPiAKPiAtCXJldHVybiAwOwo+ICsJZXJyID0gZGV2aWNlX2lu
aXRfd2FrZXVwKGJkZXYtPmRldiwgdHJ1ZSk7Cj4gKwlpZiAoZXJyKQo+ICsJCWJ0X2Rldl9lcnIo
aGRldiwgImZhaWxlZCB0byBpbml0X3dha2V1cCIpOwoKRG9u4oCZdCB1c2UgZnVuY3Rpb24gbmFt
ZXMgaW4gdGhlIGVycm9yIG1lc3NhZ2UuIE1ha2UgaXQgZGVzY3JpcHRpdmUuCgo+ICsKPiArCXJl
dHVybiBlcnI7Cj4gfQo+IAoKUmVnYXJkcwoKTWFyY2VsCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0Ckxp
bnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
