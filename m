Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF5BEC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Dec 2021 18:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GJFRimedUtZEhTCyXYVYcGVwy6NW1HOEI1WkFmoHXO0=; b=Ubym9y65bTyfZg
	xado2W5pWMamkzT0bVbZ6aJO50ZSH0mfS7xeB/WKTHt9jKdt5B2pm4EWYS9lxUqyq1V+GXqiULRhb
	aBzf8NfKn2YYvedLDEfN8Mg4AXlrjpq/K7owObsiI881rf6iG2bV4ftVVMglawx/WdrfxRGtKX/p/
	QniQ6XFdMT4tJlCJzsHWHVaU01gAXGREQpKbA3LIKiPz88JePF92dDe7hQn6m27rXsTmcxGp3l7KB
	AbhXlvWsmlkaieZV4Dc/Iw+gxp8Qnc9VUK0Yn4d62X+3lb3+NFk+wRzBRCInyvPEl/x/P7wbXYh9K
	HzKKxzw0qv/dyONXUk8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzNe8-003rzJ-CO; Mon, 20 Dec 2021 18:44:28 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzNe5-003rx2-4E
 for linux-mediatek@lists.infradead.org; Mon, 20 Dec 2021 18:44:26 +0000
X-UUID: 3fe500c4cb0d46b0bc77ec4e78c2e3b1-20211220
X-UUID: 3fe500c4cb0d46b0bc77ec4e78c2e3b1-20211220
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 901543452; Mon, 20 Dec 2021 11:44:23 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 20 Dec 2021 10:34:20 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 21 Dec 2021 02:34:19 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 21 Dec 2021 02:34:18 +0800
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
Subject: =?UTF-8?q?Re=3A=20=5BPATCH=20RESEND=201/3=5D=20Bluetooth=3A=20btmtksdio=3A=20add=20the=20support=20of=20wake=20on=20bluetooth?=
Date: Tue, 21 Dec 2021 02:34:17 +0800
Message-ID: <1640025257-18029-1-git-send-email-sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <67f062f9-293b-78aa-6474-f018d4bd269c@molgen.mpg.de--annotate>
References: <67f062f9-293b-78aa-6474-f018d4bd269c@molgen.mpg.de--annotate>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211220_104425_211328_20A59747 
X-CRM114-Status: GOOD (  23.77  )
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

RnJvbTogU2VhbiBXYW5nIDxzZWFuLndhbmdAbWVkaWF0ZWsuY29tPgoKCj5EZWFyIFNlYW4sIGRl
YXIgTWFyaywKPgo+Cj5BbSAxOC4xMi4yMSB1bSAwMjowOCBzY2hyaWViIHNlYW4ud2FuZ0BtZWRp
YXRlay5jb206Cj4+IEZyb206IE1hcmsgQ2hlbiA8bWFyay15dy5jaGVuQG1lZGlhdGVrLmNvbT4K
Pgo+U2hvcnRlciBzdW1tYXJ5OiBCbHVldG9vdGg6IGJ0bXRrc2RpbzogU3VwcG9ydCB3YWtlIG9u
IGJsdWV0b290aAoKc2VlbWVkIG5pY2UgdG8gbWUsIHdpbGwgZG8gaW4gdGhlIG5leHQgdmVyc2lv
bgoKPgo+PiBBZGQgdGhlIHN1cHBvcnQgdG8gZW5hYmxlIHdha2Ugb24gYmx1ZXRvb3RoCj4KPkNh
biB5b3UgcGxlYXNlIGxpc3QgdGhlIGRhdGFzaGVldCBuYW1lIGFuZCByZXZpc2lvbiB1c2VkIGZv
ciB0aGUgaW1wbGVtZW50YXRpb24uCgp0aGUgZGF0YXNoZWV0IGlzIG5vdCByZWxlYXNlZCBpbiBw
dWJsaWMgc28gTWFyayBhbmQgSSBjYW5ub3QgcHJvdmlkZSB0aGUgZGV0YWlsIGhlcmUsIGJ1dCB3
ZSB3aWxsIG1ha2UgdGhlIHBhdGNoIGVhc3kgdG8gcmV2aWV3IGFuZCB1bmRlcnN0YW5kLgoKPlBs
ZWFzZSBkb2N1bWVudCBob3cgeW91IHRlc3RlZCB0aGlzLgoKSXQgd2FzIHRlc3RlZCBieSBzZXR0
aW5nIHVwIGFuIEhJRCBvciBIT0dQIHByb2ZpbGUgdG8gY29ubmVjdCBhIEJsdWV0b290aCBrZXli
b2FyZCBhbmQgbW91c2UsICB0aGVuIHB1dHRpbmcgdGhlIHN5c3RlbSB0byBzdXNwZW5kLCB0aGVu
IHRyeWluZyB0byB3YWtlIHVwIHRoZSBzeXN0ZW0gYnkgbW92aW5nIHRoZSBCbHVldG9vdGgga2V5
Ym9hcmQgb3IgbW91c2UsIGFuZCB0aGVuIGNoZWNraW5nIGlmIHRoZSBzeXN0ZW0gY2FuIGJlIHdh
a2VuIHVwIGFuZCBiZSBicm91Z2h0IGJhY2sgdG8gdGhlIG5vcm1hbCBzdGF0ZS4KCj4KPj4gQ28t
ZGV2ZWxvcGVkLWJ5OiBTZWFuIFdhbmcgPHNlYW4ud2FuZ0BtZWRpYXRlay5jb20+Cj4+IFNpZ25l
ZC1vZmYtYnk6IFNlYW4gV2FuZyA8c2Vhbi53YW5nQG1lZGlhdGVrLmNvbT4KPj4gU2lnbmVkLW9m
Zi1ieTogTWFyayBDaGVuIDxtYXJrLXl3LmNoZW5AbWVkaWF0ZWsuY29tPgo+PiAtLS0KPj4gICBk
cml2ZXJzL2JsdWV0b290aC9idG10ay5oICAgICB8ICA4ICsrKysrKysrCj4+ICAgZHJpdmVycy9i
bHVldG9vdGgvYnRtdGtzZGlvLmMgfCAzMSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKyst
Cj4+ICAgMiBmaWxlcyBjaGFuZ2VkLCAzOCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+
Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2JsdWV0b290aC9idG10ay5oIGIvZHJpdmVycy9ibHVl
dG9vdGgvYnRtdGsuaAo+PiBpbmRleCA2ZTdiMGM3NTY3YzAuLjJiZTFkMjY4MGFkOCAxMDA2NDQK
Pj4gLS0tIGEvZHJpdmVycy9ibHVldG9vdGgvYnRtdGsuaAo+PiArKysgYi9kcml2ZXJzL2JsdWV0
b290aC9idG10ay5oCj4+IEBAIC02OCw2ICs2OCwxNCBAQCBzdHJ1Y3QgYnRtdGtfdGNpX3NsZWVw
IHsKPj4JdTggdGltZV9jb21wZW5zYXRpb247Cj4+ICAgfSBfX3BhY2tlZDsKPj4KPj4gK3N0cnVj
dCBidG10a193YWtlb24gewo+PiArCXU4IG1vZGU7Cj4+ICsJdTggZ3BvOwo+PiArCXU4IGFjdGl2
ZV9oaWdoOwo+PiArCV9fbGUxNiBlbmFibGVfZGVsYXk7Cj4+ICsJX19sZTE2IHdha2V1cF9kZWxh
eTsKPj4gK30gX19wYWNrZWQ7Cj4+ICsKPj4gICBzdHJ1Y3QgYnRtdGtfaGNpX3dtdF9wYXJhbXMg
ewo+Pgl1OCBvcDsKPj4JdTggZmxhZzsKPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvYmx1ZXRvb3Ro
L2J0bXRrc2Rpby5jCj4+IGIvZHJpdmVycy9ibHVldG9vdGgvYnRtdGtzZGlvLmMgaW5kZXggYjVl
YThkM2JmZmFhLi43NzE3MzNjZTM2MmIKPj4gMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvYmx1ZXRv
b3RoL2J0bXRrc2Rpby5jCj4+ICsrKyBiL2RyaXZlcnMvYmx1ZXRvb3RoL2J0bXRrc2Rpby5jCj4+
IEBAIC05NTgsNiArOTU4LDMwIEBAIHN0YXRpYyBpbnQgYnRtdGtzZGlvX3NlbmRfZnJhbWUoc3Ry
dWN0IGhjaV9kZXYgKmhkZXYsIHN0cnVjdCBza19idWZmICpza2IpCj4+CXJldHVybiAwOwo+PiAg
IH0KPj4KPj4gK3N0YXRpYyBib29sIGJ0bXRrX3NkaW9fd2FrZXVwKHN0cnVjdCBoY2lfZGV2ICpo
ZGV2KSB7Cj4+ICsJc3RydWN0IGJ0bXRrc2Rpb19kZXYgKmJkZXYgPSBoY2lfZ2V0X2RydmRhdGEo
aGRldik7Cj4+ICsJYm9vbCBtYXlfd2FrZXVwID0gZGV2aWNlX21heV93YWtldXAoYmRldi0+ZGV2
KTsKPj4gKwlzdHJ1Y3QgYnRtdGtfd2FrZW9uIGJ0X2F3YWtlID0gewo+PiArCQkubW9kZSA9IDB4
MSwKPj4gKwkJLmdwbyA9IDAsCj4+ICsJCS5hY3RpdmVfaGlnaCA9IDB4MSwKPj4gKwkJLmVuYWJs
ZV9kZWxheSA9IGNwdV90b19sZTE2KDB4YzgwKSwKPj4gKwkJLndha2V1cF9kZWxheSA9IGNwdV90
b19sZTE2KDB4MjApCj4+ICsJfTsKPj4gKwlzdHJ1Y3Qgc2tfYnVmZiAqc2tiOwo+PiArCj4+ICsJ
aWYgKG1heV93YWtldXAgJiYKPj4gKwkgICAgYmRldi0+ZGF0YS0+Y2hpcGlkID09IDB4NzkyMSkg
ewo+Cj5XaHkgdGhlIGNoZWNrIGZvciAweDc5MjE/IElzIHRoYXQgZGV2aWNlIG9ubHkgc3VwcG9y
dGVkPyBUaGUgY29tbWl0IG1lc3NhZ2UgZG9lcyBub3Qgc2F5IGFueXRoaW5nIGFib3V0IGl0LgoK
Y3VycmVudGx5LCB3YWtlIG9uIGJ0IGlzIG9ubHkgc3VwcG9ydGVkIGJ5IG10NzkyMSwgd2Ugd2ls
bCBjaGFuZ2UgdGhlIHN1YmplY3QgdG8gIkJsdWV0b290aDogbXQ3OTIxczogU3VwcG9ydCB3YWtl
IG9uIGJsdWV0b290aCIKYW5kIHJlZmluZSB0aGUgbWVzc2FnZSBib2R5IHRvIHJlZmxlY3QgdGhl
IGZhY3QuCgo+Cj4+ICsJCXNrYiA9ICBfX2hjaV9jbWRfc3luYyhoZGV2LCAweGZjMjcsIHNpemVv
ZihidF9hd2FrZSksCj4+ICsJCQkJICAgICAgJmJ0X2F3YWtlLCBIQ0lfQ01EX1RJTUVPVVQpOwo+
PiArCQlpZiAoSVNfRVJSKHNrYikpCj4+ICsJCQltYXlfd2FrZXVwID0gZmFsc2U7Cj4+ICsJfQo+
PiArCj4+ICsJcmV0dXJuIG1heV93YWtldXA7Cj4+ICt9Cj4+ICsKPj4gICBzdGF0aWMgaW50IGJ0
bXRrc2Rpb19wcm9iZShzdHJ1Y3Qgc2Rpb19mdW5jICpmdW5jLAo+PgkJCSAgIGNvbnN0IHN0cnVj
dCBzZGlvX2RldmljZV9pZCAqaWQpCj4+ICAgewo+PiBAQCAtOTk4LDYgKzEwMjIsNyBAQCBzdGF0
aWMgaW50IGJ0bXRrc2Rpb19wcm9iZShzdHJ1Y3Qgc2Rpb19mdW5jICpmdW5jLAo+PgloZGV2LT5z
aHV0ZG93biA9IGJ0bXRrc2Rpb19zaHV0ZG93bjsKPj4JaGRldi0+c2VuZCAgICAgPSBidG10a3Nk
aW9fc2VuZF9mcmFtZTsKPj4JaGRldi0+c2V0X2JkYWRkciA9IGJ0bXRrX3NldF9iZGFkZHI7Cj4+
ICsJaGRldi0+d2FrZXVwID0gYnRtdGtfc2Rpb193YWtldXA7Cj4+Cj4+CVNFVF9IQ0lERVZfREVW
KGhkZXYsICZmdW5jLT5kZXYpOwo+Pgo+PiBAQCAtMTAzMiw3ICsxMDU3LDExIEBAIHN0YXRpYyBp
bnQgYnRtdGtzZGlvX3Byb2JlKHN0cnVjdCBzZGlvX2Z1bmMgKmZ1bmMsCj4+CSAqLwo+PglwbV9y
dW50aW1lX3B1dF9ub2lkbGUoYmRldi0+ZGV2KTsKPj4KPj4gLQlyZXR1cm4gMDsKPj4gKwllcnIg
PSBkZXZpY2VfaW5pdF93YWtldXAoYmRldi0+ZGV2LCB0cnVlKTsKPj4gKwlpZiAoZXJyKQo+PiAr
CQlidF9kZXZfZXJyKGhkZXYsICIlczogZmFpbGVkIHRvIGluaXRfd2FrZXVwIiwgX19mdW5jX18p
Owo+Cj5Db3VsZCB0aGUgZXJyb3IgbWVzc2FnZSBiZSBleHRlbmRlZCwgc28gbm9ybWFsIHVzZXJz
IGtub3cgd2hhdCB0byBkbz8KPkN1cnJlbnRseSBpdOKAmXMgb25seSB1c2VmdWwgZm9yIGRldmVs
b3BlcnMuCgpUaGF0IGlzIGRvbmUgYnkgcmVmZXJyaW5nIHRvIGJ0dXNiLmMuIEkgaGF2ZSB3aWxs
aW5nIHRvIGVuaGFuY2UgdGhlIHBhcnQgYWxvbmcgd2l0aCBidHVzYi5jIGlmIE1hcmNlbCBoYXMg
YW55IGlkZWEgYWJvdXQgdGhhdC4KCj4KPj4gKwo+PiArCXJldHVybiBlcnI7Cj4+ICAgfQo+Pgo+
PiAgIHN0YXRpYyB2b2lkIGJ0bXRrc2Rpb19yZW1vdmUoc3RydWN0IHNkaW9fZnVuYyAqZnVuYykK
Pgo+Cj5LaW5kIHJlZ2FyZHMsCj4KPlBhdWwKPgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgt
bWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
