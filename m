Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CC11C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat,  8 Jan 2022 01:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xcULilX9BzLY6XcXQ0Y/dZ7Jy+QpJJlYPjz85LJjbOM=; b=2Nia6kH6mcWybr
	xF1zffGAUoOqwrlRgo8489dE7ZuLgABZChfiHnotCAyxykWln+DcIxmUvIT/26J/zMZ+6PNXpjjlJ
	EHI0OwG4gfz3N0aBuM0Q10tpMq9e0AObNPSt863s90BNroG4PAmlpBO198UQnKjsSs0JCVcOD0/yJ
	4ILgMTjW51e2y94ZhGAIorZ4TVF65l2+KKd/EFS4tW4YGRsxiI+UZpW4Gr2jYFNLwh06sX2s5KQRV
	3WRkT3TSEDUJ+zy7+MhjPjFzlkk2YqQFhmS4+OdA8j8Ge0xHL2O+0eEhihib/HK4CxlIfnYYvHu8f
	q2VRWiyFV46u1CASm+mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n60eC-005leD-7a; Sat, 08 Jan 2022 01:35:56 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n60e8-005ldW-C6
 for linux-mediatek@lists.infradead.org; Sat, 08 Jan 2022 01:35:55 +0000
X-UUID: 85e1d276e969440fadb69206527e502f-20220107
X-UUID: 85e1d276e969440fadb69206527e502f-20220107
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 423120220; Fri, 07 Jan 2022 18:35:50 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 7 Jan 2022 17:35:48 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 8 Jan 2022 09:35:46 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 8 Jan 2022 09:35:46 +0800
From: <sean.wang@mediatek.com>
To: <marcel@holtmann.org>
CC: <johan.hedberg@gmail.com>, <Mark-YW.Chen@mediatek.com>,
 <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>, <YN.Chen@mediatek.com>,
 <Leon.Yen@mediatek.com>, <Eric-SY.Chang@mediatek.com>,
 <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, <robin.chiu@mediatek.com>,
 <Eddie.Chen@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
 <ted.huang@mediatek.com>, <Eric.Liang@mediatek.com>,
 <Stella.Chang@mediatek.com>, <Tom.Chou@mediatek.com>,
 <steve.lee@mediatek.com>, <jsiuda@google.com>, <frankgor@google.com>,
 <jemele@google.com>, <abhishekpandit@google.com>, <michaelfsun@google.com>,
 <mcchou@chromium.org>, <shawnku@google.com>,
 <linux-bluetooth@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?q?Re=3A=20Bluetooth=3A=20mt7921s=3A=20Enable=20SCO=20over=20I2S?=
Date: Sat, 8 Jan 2022 09:35:44 +0800
Message-ID: <1641605744-14346-1-git-send-email-sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <6DDA9D10-3001-4A57-B2F4-9712732868AC@holtmann.org--annotate>
References: <6DDA9D10-3001-4A57-B2F4-9712732868AC@holtmann.org--annotate>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220107_173552_453548_E68848BF 
X-CRM114-Status: GOOD (  23.78  )
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

RnJvbTogU2VhbiBXYW5nIDxzZWFuLndhbmdAbWVkaWF0ZWsuY29tPgoKSGksIE1hcmNlbAoKPgo+
SGkgU2VhbiwKPgo+PiBUaGUgZHJpdmVyIGhhcyB0byBpc3N1ZSB0aGUgc3BlY2lmaWMgY29tbWFu
ZCB0byBlbmFibGUgQmx1ZXRvb3RoIFNDTwo+PiBvdmVyIHRoZSBJMlMvUENNIGludGVyZmFjZSBv
biBtdDc5MjFzLCB0aGF0IGlzIHN1cHBvcnRlZCBzaW5jZSB0aGUKPj4gZmlybXdhcmUgd2l0aCB2
ZXJzaW9uIDIwMjExMjIyMTkxMTAxIHdhcyBhZGRlZCwgYW5kIHRoZSBwYXRjaCB3b3VsZAo+PiBu
b3QgY2F1c2UgYW55IGhhcm0gZXZlbiB3aGVuIHRoZSBvbGQgZmlybXdhcmUgaXMgYXBwbGllZC4K
Pj4KPj4gVGhlIFNDTyBwcm9maWxlIHdpdGggdGhlIHBhdGNoIHdhcyB0ZXN0ZWQgYnkgc2V0dGlu
ZyB1cCBhIFZPSVAKPj4gYXBwbGljYXRpb24sIGNvbm5lY3RlZCB0byBIRlAgZGV2aWNlLCBjaGVj
a2VkIHRlbGVwaG9ueSBmdW5jdGlvbiBjYW4gd29yayBub3JtYWxseS4KPj4KPj4gQ28tZGV2ZWxv
cGVkLWJ5OiBTZWFuIFdhbmcgPHNlYW4ud2FuZ0BtZWRpYXRlay5jb20+Cj4+IFNpZ25lZC1vZmYt
Ynk6IFNlYW4gV2FuZyA8c2Vhbi53YW5nQG1lZGlhdGVrLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTog
TWFyayBDaGVuIDxtYXJrLXl3LmNoZW5AbWVkaWF0ZWsuY29tPgo+PiAtLS0KPj4gdjI6IHJlZmlu
ZSBnaXQgbWVzc2FnZSBhbmQgZml4IHR5cG8KPj4gdjM6Cj4+ICAgIDEuIGZyZWUgc2tiIGFmdGVy
IGNhbGxpbmcgIF9faGNpX2NtZF9zeW5jCj4+ICAgIDIuIG1ha2UgYnRfYXdha2UgYXMgY29uc3Qg
c3RydWN0IGJ0bXRrX3Njbwo+PiB2NDoKPj4gICAgMS4gdXBkYXRlIGdpdCBtZXNzYWdlCj4+ICAg
IDIuIGRyb3AgYSBmZXcgcmVkdW5kYW50IGVycm9yIG1lc3NhZ2VzCj4+IC0tLQo+PiBkcml2ZXJz
L2JsdWV0b290aC9idG10ay5oICAgICB8IDIwICsrKysrKysrKysrCj4+IGRyaXZlcnMvYmx1ZXRv
b3RoL2J0bXRrc2Rpby5jIHwgNjggKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysK
Pj4gMiBmaWxlcyBjaGFuZ2VkLCA4OCBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2JsdWV0b290aC9idG10ay5oIGIvZHJpdmVycy9ibHVldG9vdGgvYnRtdGsuaAo+PiBp
bmRleCAyYmUxZDI2ODBhZDguLmZjNTdlZjA5ZDEzMiAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9i
bHVldG9vdGgvYnRtdGsuaAo+PiArKysgYi9kcml2ZXJzL2JsdWV0b290aC9idG10ay5oCj4+IEBA
IC03LDggKzcsMTIgQEAKPj4KPj4gI2RlZmluZSBIQ0lfV01UX01BWF9FVkVOVF9TSVpFCQk2NAo+
Pgo+PiArI2RlZmluZSBCVE1US19XTVRfUkVHX1dSSVRFIDB4MQo+PiAjZGVmaW5lIEJUTVRLX1dN
VF9SRUdfUkVBRCAweDIKPj4KPj4gKyNkZWZpbmUgTVQ3OTIxX1BJTk1VWF8wIDB4NzAwMDUwNTAK
Pj4gKyNkZWZpbmUgTVQ3OTIxX1BJTk1VWF8xIDB4NzAwMDUwNTQKPj4gKwo+PiBlbnVtIHsKPj4J
QlRNVEtfV01UX1BBVENIX0RXTkxEID0gMHgxLAo+PglCVE1US19XTVRfVEVTVCA9IDB4MiwKPj4g
QEAgLTc2LDYgKzgwLDIyIEBAIHN0cnVjdCBidG10a193YWtlb24gewo+PglfX2xlMTYgd2FrZXVw
X2RlbGF5Owo+PiB9IF9fcGFja2VkOwo+Pgo+PiArc3RydWN0IGJ0bXRrX3NjbyB7Cj4+ICsJdTgg
Y2xvY2tfY29uZmlnOwo+PiArCXU4IHRyYW5zbWl0X2Zvcm1hdF9jb25maWc7Cj4+ICsJdTggY2hh
bm5lbF9mb3JtYXRfY29uZmlnOwo+PiArCXU4IGNoYW5uZWxfc2VsZWN0X2NvbmZpZzsKPj4gK30g
X19wYWNrZWQ7Cj4+ICsKPj4gK3N0cnVjdCByZWdfd3JpdGVfY21kIHsKPj4gKwl1OCB0eXBlOwo+
PiArCXU4IHJzdjsKPj4gKwl1OCBudW07Cj4+ICsJX19sZTMyIGFkZHI7Cj4+ICsJX19sZTMyIGRh
dGE7Cj4+ICsJX19sZTMyIG1hc2s7Cj4+ICt9IF9fcGFja2VkOwo+PiArCj4+IHN0cnVjdCBidG10
a19oY2lfd210X3BhcmFtcyB7Cj4+CXU4IG9wOwo+Pgl1OCBmbGFnOwo+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ibHVldG9vdGgvYnRtdGtzZGlvLmMKPj4gYi9kcml2ZXJzL2JsdWV0b290aC9idG10
a3NkaW8uYyBpbmRleCA4OWJkNzA2NTFlOWUuLmY2ZmI4MmIzMTdkZQo+PiAxMDA2NDQKPj4gLS0t
IGEvZHJpdmVycy9ibHVldG9vdGgvYnRtdGtzZGlvLmMKPj4gKysrIGIvZHJpdmVycy9ibHVldG9v
dGgvYnRtdGtzZGlvLmMKPj4gQEAgLTgzMCw2ICs4MzAsNjYgQEAgc3RhdGljIGludCBidHNkaW9f
bXRrX3JlZ19yZWFkKHN0cnVjdCBoY2lfZGV2ICpoZGV2LCB1MzIgcmVnLCB1MzIgKnZhbCkKPj4J
cmV0dXJuIGVycjsKPj4gfQo+Pgo+PiArc3RhdGljIGludCBidHNkaW9fbXRrX3JlZ193cml0ZShz
dHJ1Y3QgaGNpX2RldiAqaGRldiwgdTMyIHJlZywgdTMyCj4+ICt2YWwsIHUzMiBtYXNrKSB7Cj4+
ICsJc3RydWN0IGJ0bXRrX2hjaV93bXRfcGFyYW1zIHdtdF9wYXJhbXM7Cj4+ICsJc3RydWN0IHJl
Z193cml0ZV9jbWQgcmVnX3dyaXRlID0gewo+PiArCQkudHlwZSA9IDEsCj4+ICsJCS5udW0gPSAx
LAo+PiArCQkuYWRkciA9IGNwdV90b19sZTMyKHJlZyksCj4+ICsJCS5kYXRhID0gY3B1X3RvX2xl
MzIodmFsKSwKPj4gKwkJLm1hc2sgPSBjcHVfdG9fbGUzMihtYXNrKSwKPj4gKwl9Owo+Cj5NYXli
ZSBhIGdvb2QgaWRlYSB0byBtYWtlIHRoaXMgY29uc3QgYXMgd2VsbC4KPgoKd2lsbCBkbyBpdCBu
ZXh0IHZlcmlvbgoKPj4gKwlpbnQgZXJyLCBzdGF0dXM7Cj4+ICsKPj4gKwl3bXRfcGFyYW1zLm9w
ID0gQlRNVEtfV01UX1JFR0lTVEVSOwo+PiArCXdtdF9wYXJhbXMuZmxhZyA9IEJUTVRLX1dNVF9S
RUdfV1JJVEU7Cj4+ICsJd210X3BhcmFtcy5kbGVuID0gc2l6ZW9mKHJlZ193cml0ZSk7Cj4+ICsJ
d210X3BhcmFtcy5kYXRhID0gJnJlZ193cml0ZTsKPj4gKwl3bXRfcGFyYW1zLnN0YXR1cyA9ICZz
dGF0dXM7Cj4+ICsKPj4gKwllcnIgPSBtdGtfaGNpX3dtdF9zeW5jKGhkZXYsICZ3bXRfcGFyYW1z
KTsKPj4gKwlpZiAoZXJyIDwgMCkKPj4gKwkJYnRfZGV2X2VycihoZGV2LCAiRmFpbGVkIHRvIHdy
aXRlIHJlZyglZCkiLCBlcnIpOwo+Cj5UaGUgcGxlYXNlIOKAnC4ucmVnICglZCnigJ0gYXMgeW91
IGhhdmUgZm9yIHRoZSBvdGhlciBlcnJvciBtZXNzYWdlLgo+Cgp3aWxsIGRvIGl0IG5leHQgdmVy
c2lvbgoKPj4gKwo+PiArCXJldHVybiBlcnI7Cj4+ICt9Cj4+ICsKPj4gK3N0YXRpYyBpbnQgYnRz
ZGlvX210a19zY29fc2V0dGluZyhzdHJ1Y3QgaGNpX2RldiAqaGRldikgewo+PiArCWNvbnN0IHN0
cnVjdCBidG10a19zY28gc2NvX3NldHRpbmcgPSB7Cj4+ICsJCS5jbG9ja19jb25maWcgPSAweDQ5
LAo+PiArCQkuY2hhbm5lbF9mb3JtYXRfY29uZmlnID0gMHg4MCwKPj4gKwl9Owo+PiArCXN0cnVj
dCBza19idWZmICpza2I7Cj4+ICsJdTMyIHZhbDsKPj4gKwlpbnQgZXJyOwo+PiArCj4+ICsJLyog
RW5hYmxlIFNDTyBvdmVyIEkyUy9QQ00gZm9yIE1lZGlhVGVrIGNoaXBzZXQgKi8KPj4gKwlza2Ig
PSAgX19oY2lfY21kX3N5bmMoaGRldiwgMHhmYzcyLCBzaXplb2Yoc2NvX3NldHRpbmcpLAo+PiAr
CQkJICAgICAgJnNjb19zZXR0aW5nLCBIQ0lfQ01EX1RJTUVPVVQpOwo+PiArCWlmIChJU19FUlIo
c2tiKSkKPj4gKwkJcmV0dXJuIFBUUl9FUlIoc2tiKTsKPj4gKwo+PiArCWtmcmVlX3NrYihza2Ip
Owo+PiArCj4+ICsJZXJyID0gYnRzZGlvX210a19yZWdfcmVhZChoZGV2LCBNVDc5MjFfUElOTVVY
XzAsICZ2YWwpOwo+PiArCWlmIChlcnIgPCAwKQo+PiArCQlyZXR1cm4gZXJyOwo+PiArCj4+ICsJ
dmFsIHw9IDB4MTEwMDAwMDA7Cj4+ICsJZXJyID0gYnRzZGlvX210a19yZWdfd3JpdGUoaGRldiwg
TVQ3OTIxX1BJTk1VWF8wLCB2YWwsIH4wKTsKPj4gKwlpZiAoZXJyIDwgMCkKPj4gKwkJcmV0dXJu
IGVycjsKPj4gKwo+PiArCWVyciA9IGJ0c2Rpb19tdGtfcmVnX3JlYWQoaGRldiwgTVQ3OTIxX1BJ
Tk1VWF8xLCAmdmFsKTsKPj4gKwlpZiAoZXJyIDwgMCkKPj4gKwkJcmV0dXJuIGVycjsKPj4gKwo+
PiArCXZhbCB8PSAweDAwMDAwMTAxOwo+PiArCXJldHVybiBidHNkaW9fbXRrX3JlZ193cml0ZSho
ZGV2LCBNVDc5MjFfUElOTVVYXzEsIHZhbCwgfjApOyB9Cj4+ICsKPj4gc3RhdGljIGludCBidG10
a3NkaW9fc2V0dXAoc3RydWN0IGhjaV9kZXYgKmhkZXYpIHsKPj4Jc3RydWN0IGJ0bXRrc2Rpb19k
ZXYgKmJkZXYgPSBoY2lfZ2V0X2RydmRhdGEoaGRldik7IEBAIC04NjIsNiArOTIyLDE0Cj4+IEBA
IHN0YXRpYyBpbnQgYnRtdGtzZGlvX3NldHVwKHN0cnVjdCBoY2lfZGV2ICpoZGV2KQo+PgkJZXJy
ID0gbXQ3OXh4X3NldHVwKGhkZXYsIGZ3bmFtZSk7Cj4+CQlpZiAoZXJyIDwgMCkKPj4JCQlyZXR1
cm4gZXJyOwo+PiArCj4+ICsJCS8qIEVuYWJsZSBTQ08gb3ZlciBJMlMvUENNICovCj4+ICsJCWVy
ciA9IGJ0c2Rpb19tdGtfc2NvX3NldHRpbmcoaGRldik7Cj4+ICsJCWlmIChlcnIgPCAwKSB7Cj4+
ICsJCQlidF9kZXZfZXJyKGhkZXYsICJGYWlsZWQgdG8gZW5hYmxlIFNDTyBzZXR0aW5nICglZCki
LCBlcnIpOwo+PiArCQkJcmV0dXJuIGVycjsKPj4gKwkJfQo+PiArCj4KPklzIHRoaXMgcmVhbGx5
IGEgZmFpbHVyZSBvciBjb3VsZCB0aGUgY2hpcCBjb250aW51ZSB0byBvcGVyYXRlPyBJdCBqdXN0
IG1lYW5zIGl0IGZhbGxzIGJhY2sgdG8gU0NPIG92ZXIgSENJPwo+CgpJbiBmYWN0LCB0aGUgZmly
bXdhcmUgd2l0aCB0aGUgYnRtdGtzZGlvIGRyaXZlciBkb2VzIG5vdCBzdXBwb3J0IFNDTyBvdmVy
IEhDSS4KCklmIHdlIGZhaWwgdGhlcmUsIHRoZSBjaGlwIHdpbGwgbm90IGJlIGFibGUgdG8gY29u
dGludWUgcnVubmluZyB0aGUgU0NPIHByb2ZpbGUsClNvIEkgcHJlZmVyIHdlIHNob3VsZCBiZSBh
d2FyZSBvZiB0aGlzIHByb2JsZW0gYW5kIHJldHVybiBhbiBlcnJvciBjb2RlIGltbWVkaWF0ZWx5
LgoKQnkgdGhlIHdheSwgdGhlIHJlYXNvbiB3aHkgd2UgZG8gbm90IHN1cHBvcnQgU0NPIG92ZXIg
SENJIGlzIGJ0bXRrc2RpbyBhbmQgd2lmaQpzZGlvIGRyaXZlciB3b3VsZCBjb21wZXRlIGZvciB0
aGUgc2FtZSBTRElPIGJ1cyB0byBzZW5kIGFuZCByZWNlaXZlIGRhdGEuIFRoaXMKd2lsbCBjYXVz
ZSBhIGxvdCBvZiBsYXRlbmN5IGZvciBTQ08gZGF0YSwgc28gd2UgdXNlIGEgZGVkaWNhdGVkIGJ1
cyB0byBtaW5pbWl6ZQp0aGUgbGF0ZW5jeSB0byBlbnN1cmUgYXVkaW8gcXVhbGl0eSBpbiB0aGUg
YWN0dWFsIHByb2R1Y3QuCgo+PgkJYnJlYWs7Cj4+CWNhc2UgMHg3NjYzOgo+PgljYXNlIDB4NzY2
ODoKPgo+UmVnYXJkcwo+Cj5NYXJjZWwKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlh
dGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
