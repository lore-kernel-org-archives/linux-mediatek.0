Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 989F3C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Dec 2021 19:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ex5P9PJKWgeCUxrSNmXjnjhbs6TXyXfnYJjMLo3L4ow=; b=zqlj2kVPWySFEV
	4H9GHWqpWiez8uTQYx971+wFR6QLS9r77ZiVCYJljOpQFpELWnGQmVBbpVzy/NNDGY0lolCu6LHiJ
	oKhpX3Tt2/ARPXW2guw8mm1gc62a6/onhPtbXQu5QRRePvn/ShTK7N1vP87N5rUxCBwcPSvnQMCLw
	jRkb7fedBUk4UujWcBNo99jcIrhV2UDvPfGm9/h6L6UbF62KPIMdAB1zd6/h8ubZDDph0aYsPlYkR
	sKgXawv4W7BaRChi8nyPtF7k1VJgtkyxsLFT2gj9wmpcik5WH0v33HxWMDtdQ5pTJCgGc6yjFTkAP
	OZ1cI5/9VizjUtU0qiLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n07hH-00BHFY-Ks; Wed, 22 Dec 2021 19:54:47 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n07hE-00BHEt-1K
 for linux-mediatek@lists.infradead.org; Wed, 22 Dec 2021 19:54:46 +0000
X-UUID: 4f313480c31f42c88f4b639df71f89a0-20211222
X-UUID: 4f313480c31f42c88f4b639df71f89a0-20211222
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1591409369; Wed, 22 Dec 2021 12:54:35 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Dec 2021 11:54:33 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 23 Dec 2021 03:54:19 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 23 Dec 2021 03:54:19 +0800
From: <sean.wang@mediatek.com>
To: <pmenzel@molgen.mpg.de>
CC: <marcel@holtmann.org>, <johan.hedberg@gmail.com>,
 <Mark-YW.Chen@mediatek.com>, <sean.wang@mediatek.com>,
 <Soul.Huang@mediatek.com>, <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
 <Eric-SY.Chang@mediatek.com>, <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, 
 <robin.chiu@mediatek.com>, <Eddie.Chen@mediatek.com>, <ch.yeh@mediatek.com>,
 <posh.sun@mediatek.com>, <ted.huang@mediatek.com>, <Eric.Liang@mediatek.com>, 
 <Stella.Chang@mediatek.com>, <Tom.Chou@mediatek.com>,
 <steve.lee@mediatek.com>, <jsiuda@google.com>, <frankgor@google.com>,
 <jemele@google.com>, <abhishekpandit@google.com>, <michaelfsun@google.com>,
 <mcchou@chromium.org>, <shawnku@google.com>,
 <linux-bluetooth@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?q?Re=3A=20=5BPATCH=20v2=201/3=5D=20Bluetooth=3A=20mt7921s=3A=20Support=20wake=20on=20bluetooth?=
Date: Thu, 23 Dec 2021 03:54:18 +0800
Message-ID: <1640202858-15180-1-git-send-email-sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <f6baa415-b078-4308-e31d-6b44e748c1c5@molgen.mpg.de--annotate>
References: <f6baa415-b078-4308-e31d-6b44e748c1c5@molgen.mpg.de--annotate>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211222_115444_114668_D436B465 
X-CRM114-Status: GOOD (  24.89  )
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

RnJvbTogU2VhbiBXYW5nIDxzZWFuLndhbmdAbWVkaWF0ZWsuY29tPgoKPkRlYXIgU2VhbiwKPgo+
QW0gMjIuMTIuMjEgdW0gMDQ6MTEgc2NocmllYiBzZWFuLndhbmdAbWVkaWF0ZWsuY29tOgo+PiBG
cm9tOiBNYXJrIENoZW4gPG1hcmsteXcuY2hlbkBtZWRpYXRlay5jb20+Cj4+Cj4+IEVuYWJsZSB3
YWtlIG9uIGJsdWV0b290aCBvbiBtdDc5MjFzIHRoYXQgY2FuIGJlIHN1cHBvcnRlZCBzaW5jZSB0
aGUKPj4gZmlybXdhcmUgd2l0aCB2ZXJzaW9uIDIwMjExMTI5MjExMDU5IHdhcyBhZGRlZCwgYW5k
IHRoZSBwYXRjaCB3b3VsZAo+PiBub3QgY2F1c2UgYW55IGhhcm0gZXZlbiB3aGVuIHRoZSBvbGQg
ZmlybXdhcmUgaXMgYXBwbGllZC4KPgo+TWF5YmUgcHJpbnQgYSBub3RpY2UgbGV2ZWwgbWVzc2Fn
ZSwgaWYgdGhlIGZpcm13YXJlIGlzIHRvbyBvbGQsIGFuZCB0aGUgZmVhdHVyZSBjYW5ub3QgYmUg
c3VwcG9ydGVkPwo+CgptdDc5MjEgZmlybXdhcmUgd2lsbCBiZSB1cGRhdGVkIHJlZ3VsYXJseSB0
byBhZGQgZmVhdHVyZXMgb3IgZml4IGJ1Z3MsIHNvIEkgd291bGQgdHJ5IHRvIGF2b2lkIGFkZGlu
ZyBzdWNoCm1lc3NhZ2UgcmVsYXRlZCB0byBmaXJtd2FyZSB0byBtYWtlIHRoZSBkcml2ZXIgbG9v
ayBtZXNzeS4KCj4+IFRoZSBwYXRjaCB3YXMgdGVzdGVkIGJ5IHNldHRpbmcgdXAgYW4gSElEIG9y
IEhPR1AgcHJvZmlsZSB0byBjb25uZWN0IGEKPj4gQmx1ZXRvb3RoIGtleWJvYXJkIGFuZCBtb3Vz
ZSwgdGhlbiBwdXR0aW5nIHRoZSBzeXN0ZW0gdG8gc3VzcGVuZCwgdGhlbgo+PiB0cnlpbmcgdG8g
d2FrZSB1cCB0aGUgc3lzdGVtIGJ5IG1vdmluZyB0aGUgQmx1ZXRvb3RoIGtleWJvYXJkIG9yCj4+
IG1vdXNlLCBhbmQgdGhlbiBjaGVja2luZyBpZiB0aGUgc3lzdGVtIGNhbiB3YWtlIHVwIGFuZCBi
ZSBicm91Z2h0IGJhY2sKPj4gdG8gdGhlIG5vcm1hbCBzdGF0ZS4KPgo+SeKAmWQgc3RpbGwgd291
bGQgbGlrZSB0byBzZWUgdGhlIGRhdGFzaGVldCBuYW1lLCByZXZpc2lvbiwgYW5kIHNlY3Rpb24g
aW4gdGhlIGNvbW1pdCBtZXNzYWdlLCBldmVuIHRob3VnaCB0aGUgZGF0YXNoZWV0IGlzIG5vdCBw
dWJsaWMuCj4KCmFjdHVhbGx5IHRoZSBoYXJkd2FyZSBkYXRhc2hlZXQgZG9lc24ndCBtZW50aW9u
IHRoZSB0aGluZ3MgcmVnYXJkaW5nIHdha2Ugb24gYmx1ZXRvb3RoIGJlY2F1c2UgdGhhdCBpcyBh
IHRvdGFsbHkgc29mdHdhcmUgZmVhdHVyZQpleHRlbmRlZCBmcm9tIHRoZSBwcmV2aW91cyBmaXJt
d2FyZS4KCj4+IENvLWRldmVsb3BlZC1ieTogU2VhbiBXYW5nIDxzZWFuLndhbmdAbWVkaWF0ZWsu
Y29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBTZWFuIFdhbmcgPHNlYW4ud2FuZ0BtZWRpYXRlay5jb20+
Cj4+IFNpZ25lZC1vZmYtYnk6IE1hcmsgQ2hlbiA8bWFyay15dy5jaGVuQG1lZGlhdGVrLmNvbT4K
Pj4gLS0tCj4+IHYyOiByZWZpbmUgdGhlIGdpdCBtZXNzYWdlCj4+IC0tLQo+PiAgIGRyaXZlcnMv
Ymx1ZXRvb3RoL2J0bXRrLmggICAgIHwgIDggKysrKysrKysKPj4gICBkcml2ZXJzL2JsdWV0b290
aC9idG10a3NkaW8uYyB8IDMxICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0KPj4gICAy
IGZpbGVzIGNoYW5nZWQsIDM4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4KPj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvYmx1ZXRvb3RoL2J0bXRrLmggYi9kcml2ZXJzL2JsdWV0b290aC9i
dG10ay5oCj4+IGluZGV4IDZlN2IwYzc1NjdjMC4uMmJlMWQyNjgwYWQ4IDEwMDY0NAo+PiAtLS0g
YS9kcml2ZXJzL2JsdWV0b290aC9idG10ay5oCj4+ICsrKyBiL2RyaXZlcnMvYmx1ZXRvb3RoL2J0
bXRrLmgKPj4gQEAgLTY4LDYgKzY4LDE0IEBAIHN0cnVjdCBidG10a190Y2lfc2xlZXAgewo+Pgl1
OCB0aW1lX2NvbXBlbnNhdGlvbjsKPj4gICB9IF9fcGFja2VkOwo+Pgo+PiArc3RydWN0IGJ0bXRr
X3dha2VvbiB7Cj4+ICsJdTggbW9kZTsKPj4gKwl1OCBncG87Cj4+ICsJdTggYWN0aXZlX2hpZ2g7
Cj4+ICsJX19sZTE2IGVuYWJsZV9kZWxheTsKPj4gKwlfX2xlMTYgd2FrZXVwX2RlbGF5Owo+PiAr
fSBfX3BhY2tlZDsKPj4gKwo+PiAgIHN0cnVjdCBidG10a19oY2lfd210X3BhcmFtcyB7Cj4+CXU4
IG9wOwo+Pgl1OCBmbGFnOwo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ibHVldG9vdGgvYnRtdGtz
ZGlvLmMKPj4gYi9kcml2ZXJzL2JsdWV0b290aC9idG10a3NkaW8uYyBpbmRleCBiNWVhOGQzYmZm
YWEuLjc3MTczM2NlMzYyYgo+PiAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ibHVldG9vdGgvYnRt
dGtzZGlvLmMKPj4gKysrIGIvZHJpdmVycy9ibHVldG9vdGgvYnRtdGtzZGlvLmMKPj4gQEAgLTk1
OCw2ICs5NTgsMzAgQEAgc3RhdGljIGludCBidG10a3NkaW9fc2VuZF9mcmFtZShzdHJ1Y3QgaGNp
X2RldiAqaGRldiwgc3RydWN0IHNrX2J1ZmYgKnNrYikKPj4JcmV0dXJuIDA7Cj4+ICAgfQo+Pgo+
PiArc3RhdGljIGJvb2wgYnRtdGtfc2Rpb193YWtldXAoc3RydWN0IGhjaV9kZXYgKmhkZXYpIHsK
Pj4gKwlzdHJ1Y3QgYnRtdGtzZGlvX2RldiAqYmRldiA9IGhjaV9nZXRfZHJ2ZGF0YShoZGV2KTsK
Pj4gKwlib29sIG1heV93YWtldXAgPSBkZXZpY2VfbWF5X3dha2V1cChiZGV2LT5kZXYpOwo+PiAr
CXN0cnVjdCBidG10a193YWtlb24gYnRfYXdha2UgPSB7Cj4+ICsJCS5tb2RlID0gMHgxLAo+PiAr
CQkuZ3BvID0gMCwKPj4gKwkJLmFjdGl2ZV9oaWdoID0gMHgxLAo+PiArCQkuZW5hYmxlX2RlbGF5
ID0gY3B1X3RvX2xlMTYoMHhjODApLAo+PiArCQkud2FrZXVwX2RlbGF5ID0gY3B1X3RvX2xlMTYo
MHgyMCkKPj4gKwl9Owo+PiArCXN0cnVjdCBza19idWZmICpza2I7Cj4+ICsKPj4gKwlpZiAobWF5
X3dha2V1cCAmJgo+PiArCSAgICBiZGV2LT5kYXRhLT5jaGlwaWQgPT0gMHg3OTIxKSB7Cj4+ICsJ
CXNrYiA9ICBfX2hjaV9jbWRfc3luYyhoZGV2LCAweGZjMjcsIHNpemVvZihidF9hd2FrZSksCj4+
ICsJCQkJICAgICAgJmJ0X2F3YWtlLCBIQ0lfQ01EX1RJTUVPVVQpOwo+PiArCQlpZiAoSVNfRVJS
KHNrYikpCj4+ICsJCQltYXlfd2FrZXVwID0gZmFsc2U7Cj4+ICsJfQo+PiArCj4+ICsJcmV0dXJu
IG1heV93YWtldXA7Cj4+ICt9Cj4+ICsKPj4gICBzdGF0aWMgaW50IGJ0bXRrc2Rpb19wcm9iZShz
dHJ1Y3Qgc2Rpb19mdW5jICpmdW5jLAo+PgkJCSAgIGNvbnN0IHN0cnVjdCBzZGlvX2RldmljZV9p
ZCAqaWQpCj4+ICAgewo+PiBAQCAtOTk4LDYgKzEwMjIsNyBAQCBzdGF0aWMgaW50IGJ0bXRrc2Rp
b19wcm9iZShzdHJ1Y3Qgc2Rpb19mdW5jICpmdW5jLAo+PgloZGV2LT5zaHV0ZG93biA9IGJ0bXRr
c2Rpb19zaHV0ZG93bjsKPj4JaGRldi0+c2VuZCAgICAgPSBidG10a3NkaW9fc2VuZF9mcmFtZTsK
Pj4JaGRldi0+c2V0X2JkYWRkciA9IGJ0bXRrX3NldF9iZGFkZHI7Cj4+ICsJaGRldi0+d2FrZXVw
ID0gYnRtdGtfc2Rpb193YWtldXA7Cj4KPkp1c3QgYSBuaXQsIHRoYXQgdHdvIGFuZCB0aHJlZSBs
aW5lcyBhYm92ZSwgdGhlIGVxdWFsIHNpZ25zIGFyZSBhbGlnbmVkLgoKdGhhbmtzLCBJIHdpbGwg
ZG8gaXQgd2l0aCBhbm90aGVyIHBhdGNoCgo+Cj4+CVNFVF9IQ0lERVZfREVWKGhkZXYsICZmdW5j
LT5kZXYpOwo+Pgo+PiBAQCAtMTAzMiw3ICsxMDU3LDExIEBAIHN0YXRpYyBpbnQgYnRtdGtzZGlv
X3Byb2JlKHN0cnVjdCBzZGlvX2Z1bmMgKmZ1bmMsCj4+CSAqLwo+PglwbV9ydW50aW1lX3B1dF9u
b2lkbGUoYmRldi0+ZGV2KTsKPj4KPj4gLQlyZXR1cm4gMDsKPj4gKwllcnIgPSBkZXZpY2VfaW5p
dF93YWtldXAoYmRldi0+ZGV2LCB0cnVlKTsKPj4gKwlpZiAoZXJyKQo+PiArCQlidF9kZXZfZXJy
KGhkZXYsICIlczogZmFpbGVkIHRvIGluaXRfd2FrZXVwIiwgX19mdW5jX18pOwo+PiArCj4+ICsJ
cmV0dXJuIGVycjsKPj4gICB9Cj4+Cj4+ICAgc3RhdGljIHZvaWQgYnRtdGtzZGlvX3JlbW92ZShz
dHJ1Y3Qgc2Rpb19mdW5jICpmdW5jKQo+Cj4KPktpbmQgcmVnYXJkcywKPgo+UGF1bAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsg
bWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
