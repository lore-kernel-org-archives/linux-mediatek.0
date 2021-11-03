Return-Path: <SRS0=yT6o=PW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD4A3C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Nov 2021 20:36:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F1CC6103B
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Nov 2021 20:36:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7F1CC6103B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Rdv3KkLxgxpo535rYzeF8IrFUPorpzthGWynoF4efMg=; b=CrPYy/wdVOhetGexhcWtAhy7+Y
	RFDVqGI1lpZMZlixOmpllrmk0KXLEDllcTGre+KpBX1ZGV2SvgMVrSuMpgy9JEh0meCQtNXvDqEUv
	HeRI3+uYK3mP6UGA1fHLSq+Xx2pdiFINPcHTT325ASJUYPtkxODM5kNSGggyQGRT9Wn+0muG/do4u
	iJMuQzhndZy6Kqjd11QN/hiMdmLNhTgWtmsiXlEHLQd7li7ycOJDOWDzCLqptjaP0xl07SALHXhtT
	IyWqRihX3ztCArN1CSX+HFQPp6VMbAw9QKFfVXYU//naCsjVxRyD6Kr5MZ3Kehj9UbSYJwgoF1rcn
	tRhX5eoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miMzj-006WsO-0b; Wed, 03 Nov 2021 20:36:27 +0000
Received: from mga04.intel.com ([192.55.52.120])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miMzU-006WoK-Ho; Wed, 03 Nov 2021 20:36:14 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10157"; a="230313462"
X-IronPort-AV: E=Sophos;i="5.87,206,1631602800"; d="scan'208";a="230313462"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2021 13:36:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,206,1631602800"; d="scan'208";a="639057499"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199])
 ([10.237.72.199])
 by fmsmga001.fm.intel.com with ESMTP; 03 Nov 2021 13:36:08 -0700
Subject: Re: [PATCH v2] usb: core: reduce power-on-good delay time of root hub
To: "Walt Jr. Brake" <mr.yming81@gmail.com>,
 Alan Stern <stern@rowland.harvard.edu>,
 Mathias Nyman <mathias.nyman@intel.com>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nishad Kamdar <nishadkamdar@gmail.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Eddie Hung <eddie.hung@mediatek.com>
References: <1618017645-12259-1-git-send-email-chunfeng.yun@mediatek.com>
 <5e907ccd-40bb-2ece-fe05-1a65a74f3aa2@gmail.com>
 <20211101140613.GC1456700@rowland.harvard.edu>
 <3cf46eaf-5443-30df-6d72-b92a6a518afc@linux.intel.com>
 <62d0ac30-f2b9-f58c-cb1e-215ccb455753@gmail.com>
From: Mathias Nyman <mathias.nyman@linux.intel.com>
Message-ID: <13d55059-9f66-8599-54fc-46698bae41d1@linux.intel.com>
Date: Wed, 3 Nov 2021 22:37:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <62d0ac30-f2b9-f58c-cb1e-215ccb455753@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211103_133612_634963_A4C224D8 
X-CRM114-Status: GOOD (  23.35  )
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

T24gMi4xMS4yMDIxIDIyLjI5LCBXYWx0IEpyLiBCcmFrZSB3cm90ZToKPiBPbiAyLzExLzIwMjEg
MTc6MDUsIE1hdGhpYXMgTnltYW4gd3JvdGU6Cj4+IE9uIDEuMTEuMjAyMSAxNi4wNiwgQWxhbiBT
dGVybiB3cm90ZToKPj4+IE9uIFNhdCwgT2N0IDMwLCAyMDIxIGF0IDEyOjQ5OjM3UE0gKzA4MDAs
IFdhbHQgSnIuIEJyYWtlIHdyb3RlOgo+Pj4+IFRoaXMgcGF0Y2ggbWFrZSBVU0IgMy4xIGRldmlj
ZSBjYW5ub3QgYmUgZGV0ZWN0ZWQsIGFuZCBJIHJlcG9ydCB0aGUgYnVnIFsxXQo+Pj4+IHRvIGFy
Y2hsaW51eCB0aHJlZSBtb250aCBhZ28uIFllc3RlcmRheSBJIHRyeSB0byBmaXggaXQgbXlzZWxm
LCBhbmQgYWZ0ZXIgSQo+Pj4+IHJldmVydCB0aGlzIHBhdGNoLCBjb21waWxlIHRoZSBrZXJuZWwg
YW5kIHRlc3QsIGl0IHdvcmtzLgo+Pj4+Cj4+Pj4gWzFdIGh0dHBzOi8vYnVncy5hcmNobGludXgu
b3JnL3Rhc2svNzE2NjA/cHJvamVjdD0xJnBhZ2VudW09Mgo+Pj4+Cj4+Pj4KPj4+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy91c2IvY29yZS9odWIuaCBiL2RyaXZlcnMvdXNiL2NvcmUvaHViLmgKPj4+
PiBpbmRleCAyMmVhMWY0ZjJkNjYuLjczZjQ0ODJkODMzYSAxMDA2NDQKPj4+PiAtLS0gYS9kcml2
ZXJzL3VzYi9jb3JlL2h1Yi5oCj4+Pj4gKysrIGIvZHJpdmVycy91c2IvY29yZS9odWIuaAo+Pj4+
IEBAIC0xNDgsMTAgKzE0OCw4IEBAIHN0YXRpYyBpbmxpbmUgdW5zaWduZWQgaHViX3Bvd2VyX29u
X2dvb2RfZGVsYXkoc3RydWN0Cj4+Pj4gdXNiX2h1YiAqaHViKQo+Pj4+IMKgwqB7Cj4+Pj4gwqDC
oMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBkZWxheSA9IGh1Yi0+ZGVzY3JpcHRvci0+YlB3ck9uMlB3
ckdvb2QgKiAyOwo+Pj4+Cj4+Pj4gLcKgwqDCoMKgwqDCoCBpZiAoIWh1Yi0+aGRldi0+cGFyZW50
KSAvKiByb290IGh1YiAqLwo+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVy
biBkZWxheTsKPj4+PiAtwqDCoMKgwqDCoMKgIGVsc2UgLyogV2FpdCBhdCBsZWFzdCAxMDAgbXNl
YyBmb3IgcG93ZXIgdG8gYmVjb21lIHN0YWJsZSAqLwo+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHJldHVybiBtYXgoZGVsYXksIDEwMFUpOwo+Pj4+ICvCoMKgwqDCoMKgwqAgLyog
V2FpdCBhdCBsZWFzdCAxMDAgbXNlYyBmb3IgcG93ZXIgdG8gYmVjb21lIHN0YWJsZSAqLwo+Pj4+
ICvCoMKgwqDCoMKgwqAgcmV0dXJuIG1heChkZWxheSwgMTAwVSk7Cj4+Pj4gwqDCoH0KPj4+IE1h
dGhpYXM6Cj4+Pgo+Pj4gSXQgbG9va3MgbGlrZSB0aGUgYlB3ck9uMlB3ckdvb2QgdmFsdWUgaW4g
eGhjaS1oY2QncyBodWIgZGVzY3JpcHRvciBpcwo+Pj4gdG9vIHNtYWxsIGZvciBzb21lIFVTQiAz
LjEgZGV2aWNlcy4KPj4+Cj4+PiBDYW4geW91IGxvb2sgaW50byB0aGlzPwo+Pj4KPj4+IEFsYW4g
U3Rlcm4KPj4+Cj4+IEF0IGZpcnN0IGdsYW5jZSB0aGUgeGhjaSByb290aHViIGJQd3JPbjJQd3JH
b29kIHZhbHVlIGxvb2tzIG9rLgo+PiB4aGNpIHNwZWMgNS40Ljggc3RhdGVzIHNvZnR3YXJlIHNo
b3VsZCB3YWl0IDIwbXMgYWZ0ZXIgYXNzZXJ0aW5nIFBQLCBiZWZvcmUKPj4gYXR0ZW1wdGluZyB0
byBjaGFuZ2UgdGhlIHN0YXRlIG9mIHRoZSBwb3J0Lgo+Pgo+PiB4aGNpIGRyaXZlciBzZXRzIGRl
c2MtPmJQd3JPbjJQd3JHb29kID0gMTA7ICgybXMgaW50ZXJ2YWwsIHNvIGVxdWFscyAyMG1zICkK
Pj4KPj4gV2Ugc2hvdWxkIHByb2JhYmx5IGdldCB0aGlzIHdvcmtpbmcgaW1tZWRpYXRlbHksIHNv
IG1heWJlIHJldmVydCB0aGF0IHBhdGNoCj4+IHdoaWxlIGxvb2tpbmcgaW50byB0aGUgcm9vdGNh
dXNlLgo+Pgo+PiBXYWx0IEpyLiBCcmFrZSwgaW5zdGVhZCBvZiByZXZlcnRpbmcgdGhhdCBwYXRj
aCwgY291bGQgeW91IHRlc3QgaWYgY2hhbmdpbmcgdGhlCj4+IHhoY2kgcm9vdGh1YiBiUHdyT24y
UHdyR29vZCB2YWx1ZSBoZWxwcy4KPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2hvc3Qv
eGhjaS1odWIuYyBiL2RyaXZlcnMvdXNiL2hvc3QveGhjaS1odWIuYwo+PiBpbmRleCBhM2Y4NzVl
ZWE3NTEuLjc1NjIzMWE1NTYwMiAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy91c2IvaG9zdC94aGNp
LWh1Yi5jCj4+ICsrKyBiL2RyaXZlcnMvdXNiL2hvc3QveGhjaS1odWIuYwo+PiBAQCAtMjU3LDcg
KzI1Nyw3IEBAIHN0YXRpYyB2b2lkIHhoY2lfY29tbW9uX2h1Yl9kZXNjcmlwdG9yKHN0cnVjdCB4
aGNpX2hjZCAqeGhjaSwKPj4gwqAgewo+PiDCoMKgwqDCoMKgwqDCoMKgIHUxNiB0ZW1wOwo+PiDC
oCAtwqDCoMKgwqDCoMKgIGRlc2MtPmJQd3JPbjJQd3JHb29kID0gMTA7wqDCoMKgwqDCoCAvKiB4
aGNpIHNlY3Rpb24gNS40Ljkgc2F5cyAyMG1zIG1heCAqLwo+PiArwqDCoMKgwqDCoMKgIGRlc2Mt
PmJQd3JPbjJQd3JHb29kID0gNTA7wqDCoMKgwqDCoCAvKiBUaGUgMjBtcyBpbiB4aGNpIDUuNC44
IGlzbid0IGVub3VnaCBmb3IgVVNCIDMuMSAqLwo+PiDCoMKgwqDCoMKgwqDCoMKgIGRlc2MtPmJI
dWJDb250ckN1cnJlbnQgPSAwOwo+PiDCoCDCoMKgwqDCoMKgwqDCoMKgIGRlc2MtPmJOYnJQb3J0
cyA9IHBvcnRzOwo+Pgo+PiBUaGFua3MKPj4gLU1hdGhpYXMKPiAKPiBNYXRoaWFzOgo+IAo+IFNv
cnJ5IHRvIHJlcGx5IGxhdGVseS4gSSB0ZXN0IHdpdGggeW91ciBwYXRjaCwgaXQgd29ya3MuCj4g
Cj4gSSBhbHNvIHRlc3Qgd2l0aCBzZXR0aW5nIGJQd3JPbjJQd3JHb29kIHRvIDQ1LCBhbmQgaXQg
bm90IHdvcmsuCj4gCj4gU2VlbXMgdGhhdCB0aGUgbWluaW1hbCB2YWx1ZSBzaG91bGQgYmUgNTAg
Zm9yIHRoaXMgY2FzZS4KPiAKClRoYW5rcyBmb3IgdGVzdGluZywgYW5kIGZvciBjaGVja2luZyB0
aGF0IDkwbXMgd2FpdCBpc24ndCBlbm91Z2gKCi1NYXRoaWFzCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QK
TGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
