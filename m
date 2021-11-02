Return-Path: <SRS0=eBCQ=PV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8CCEC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Nov 2021 09:04:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A996C60F70
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Nov 2021 09:04:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A996C60F70
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:Subject:From:References:Cc:To:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=L8lnK+3Uj21aUljGZ+nVTwQAOU8ny1aKQt91Cj+Jwf0=; b=lyhL4VMBuneUyMTk3er/awGF2m
	xKMnZ3ODQ7f8p92vQXnTAzxPbddoURak1F7pu7ANn0gYNss99WpShqlomIk7DlURZjTjgmFI+d68H
	jnMWrai3SsdB0AoPwnKMNzqPL6RI7WZTvv77mkxHgzmWafmNpC4JF6C4U/wWFEqtxpdTG51YYAgPY
	TJIWlsnD+ZMAwbQfLZzLuh+4Y4HdELIpYkxy5K0YFEtXrqUByDP88T1rkiPe43wBA8XJkVX/qlLlR
	xuEgQIGltLtggje+s5lNQG8IZ95EEsHypA66L/TBU7CFBb422zuHPsV1wjSiI5kUvTva0cEySrTga
	CAaHX3/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhpiI-0011vb-Ie; Tue, 02 Nov 2021 09:04:14 +0000
Received: from mga12.intel.com ([192.55.52.136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhpi5-0011ss-Oy; Tue, 02 Nov 2021 09:04:03 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10155"; a="211268484"
X-IronPort-AV: E=Sophos;i="5.87,202,1631602800"; d="scan'208";a="211268484"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2021 02:03:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,202,1631602800"; d="scan'208";a="638121195"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199])
 ([10.237.72.199])
 by fmsmga001.fm.intel.com with ESMTP; 02 Nov 2021 02:03:45 -0700
To: Alan Stern <stern@rowland.harvard.edu>,
 Mathias Nyman <mathias.nyman@intel.com>,
 "Walt Jr. Brake" <mr.yming81@gmail.com>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nishad Kamdar <nishadkamdar@gmail.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Eddie Hung <eddie.hung@mediatek.com>
References: <1618017645-12259-1-git-send-email-chunfeng.yun@mediatek.com>
 <5e907ccd-40bb-2ece-fe05-1a65a74f3aa2@gmail.com>
 <20211101140613.GC1456700@rowland.harvard.edu>
From: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH v2] usb: core: reduce power-on-good delay time of root hub
Message-ID: <3cf46eaf-5443-30df-6d72-b92a6a518afc@linux.intel.com>
Date: Tue, 2 Nov 2021 11:05:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20211101140613.GC1456700@rowland.harvard.edu>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211102_020401_880352_0318228F 
X-CRM114-Status: GOOD (  22.56  )
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

T24gMS4xMS4yMDIxIDE2LjA2LCBBbGFuIFN0ZXJuIHdyb3RlOgo+IE9uIFNhdCwgT2N0IDMwLCAy
MDIxIGF0IDEyOjQ5OjM3UE0gKzA4MDAsIFdhbHQgSnIuIEJyYWtlIHdyb3RlOgo+PiBUaGlzIHBh
dGNoIG1ha2UgVVNCIDMuMSBkZXZpY2UgY2Fubm90IGJlIGRldGVjdGVkLCBhbmQgSSByZXBvcnQg
dGhlIGJ1ZyBbMV0KPj4gdG8gYXJjaGxpbnV4IHRocmVlIG1vbnRoIGFnby4gWWVzdGVyZGF5IEkg
dHJ5IHRvIGZpeCBpdCBteXNlbGYsIGFuZCBhZnRlciBJCj4+IHJldmVydCB0aGlzIHBhdGNoLCBj
b21waWxlIHRoZSBrZXJuZWwgYW5kIHRlc3QsIGl0IHdvcmtzLgo+Pgo+PiBbMV0gaHR0cHM6Ly9i
dWdzLmFyY2hsaW51eC5vcmcvdGFzay83MTY2MD9wcm9qZWN0PTEmcGFnZW51bT0yCj4+Cj4+Cj4+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9jb3JlL2h1Yi5oIGIvZHJpdmVycy91c2IvY29yZS9o
dWIuaAo+PiBpbmRleCAyMmVhMWY0ZjJkNjYuLjczZjQ0ODJkODMzYSAxMDA2NDQKPj4gLS0tIGEv
ZHJpdmVycy91c2IvY29yZS9odWIuaAo+PiArKysgYi9kcml2ZXJzL3VzYi9jb3JlL2h1Yi5oCj4+
IEBAIC0xNDgsMTAgKzE0OCw4IEBAIHN0YXRpYyBpbmxpbmUgdW5zaWduZWQgaHViX3Bvd2VyX29u
X2dvb2RfZGVsYXkoc3RydWN0Cj4+IHVzYl9odWIgKmh1YikKPj4gwqB7Cj4+IMKgwqDCoMKgwqDC
oMKgIHVuc2lnbmVkIGRlbGF5ID0gaHViLT5kZXNjcmlwdG9yLT5iUHdyT24yUHdyR29vZCAqIDI7
Cj4+Cj4+IC3CoMKgwqDCoMKgwqAgaWYgKCFodWItPmhkZXYtPnBhcmVudCkgLyogcm9vdCBodWIg
Ki8KPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGRlbGF5Owo+PiAtwqDC
oMKgwqDCoMKgIGVsc2UgLyogV2FpdCBhdCBsZWFzdCAxMDAgbXNlYyBmb3IgcG93ZXIgdG8gYmVj
b21lIHN0YWJsZSAqLwo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gbWF4
KGRlbGF5LCAxMDBVKTsKPj4gK8KgwqDCoMKgwqDCoCAvKiBXYWl0IGF0IGxlYXN0IDEwMCBtc2Vj
IGZvciBwb3dlciB0byBiZWNvbWUgc3RhYmxlICovCj4+ICvCoMKgwqDCoMKgwqAgcmV0dXJuIG1h
eChkZWxheSwgMTAwVSk7Cj4+IMKgfQo+IAo+IE1hdGhpYXM6Cj4gCj4gSXQgbG9va3MgbGlrZSB0
aGUgYlB3ck9uMlB3ckdvb2QgdmFsdWUgaW4geGhjaS1oY2QncyBodWIgZGVzY3JpcHRvciBpcyAK
PiB0b28gc21hbGwgZm9yIHNvbWUgVVNCIDMuMSBkZXZpY2VzLgo+IAo+IENhbiB5b3UgbG9vayBp
bnRvIHRoaXM/Cj4gCj4gQWxhbiBTdGVybgo+IAoKQXQgZmlyc3QgZ2xhbmNlIHRoZSB4aGNpIHJv
b3RodWIgYlB3ck9uMlB3ckdvb2QgdmFsdWUgbG9va3Mgb2suCnhoY2kgc3BlYyA1LjQuOCBzdGF0
ZXMgc29mdHdhcmUgc2hvdWxkIHdhaXQgMjBtcyBhZnRlciBhc3NlcnRpbmcgUFAsIGJlZm9yZQph
dHRlbXB0aW5nIHRvIGNoYW5nZSB0aGUgc3RhdGUgb2YgdGhlIHBvcnQuCgp4aGNpIGRyaXZlciBz
ZXRzIGRlc2MtPmJQd3JPbjJQd3JHb29kID0gMTA7ICgybXMgaW50ZXJ2YWwsIHNvIGVxdWFscyAy
MG1zICkKCldlIHNob3VsZCBwcm9iYWJseSBnZXQgdGhpcyB3b3JraW5nIGltbWVkaWF0ZWx5LCBz
byBtYXliZSByZXZlcnQgdGhhdCBwYXRjaAp3aGlsZSBsb29raW5nIGludG8gdGhlIHJvb3RjYXVz
ZS4KCldhbHQgSnIuIEJyYWtlLCBpbnN0ZWFkIG9mIHJldmVydGluZyB0aGF0IHBhdGNoLCBjb3Vs
ZCB5b3UgdGVzdCBpZiBjaGFuZ2luZyB0aGUKeGhjaSByb290aHViIGJQd3JPbjJQd3JHb29kIHZh
bHVlIGhlbHBzLgoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2hvc3QveGhjaS1odWIuYyBiL2Ry
aXZlcnMvdXNiL2hvc3QveGhjaS1odWIuYwppbmRleCBhM2Y4NzVlZWE3NTEuLjc1NjIzMWE1NTYw
MiAxMDA2NDQKLS0tIGEvZHJpdmVycy91c2IvaG9zdC94aGNpLWh1Yi5jCisrKyBiL2RyaXZlcnMv
dXNiL2hvc3QveGhjaS1odWIuYwpAQCAtMjU3LDcgKzI1Nyw3IEBAIHN0YXRpYyB2b2lkIHhoY2lf
Y29tbW9uX2h1Yl9kZXNjcmlwdG9yKHN0cnVjdCB4aGNpX2hjZCAqeGhjaSwKIHsKICAgICAgICB1
MTYgdGVtcDsKIAotICAgICAgIGRlc2MtPmJQd3JPbjJQd3JHb29kID0gMTA7ICAgICAgLyogeGhj
aSBzZWN0aW9uIDUuNC45IHNheXMgMjBtcyBtYXggKi8KKyAgICAgICBkZXNjLT5iUHdyT24yUHdy
R29vZCA9IDUwOyAgICAgIC8qIFRoZSAyMG1zIGluIHhoY2kgNS40LjggaXNuJ3QgZW5vdWdoIGZv
ciBVU0IgMy4xICovCiAgICAgICAgZGVzYy0+Ykh1YkNvbnRyQ3VycmVudCA9IDA7CiAKICAgICAg
ICBkZXNjLT5iTmJyUG9ydHMgPSBwb3J0czsKClRoYW5rcwotTWF0aGlhcwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGlu
ZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
