Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B796C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Mar 2022 14:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hupR0UhZe0Ci6DJUZ97fqyF1BrywerBHl+FNq7KA3iY=; b=1Fcfu3mUjy+ZuF
	bGdgfNg4HvRLsHfWeWQV1/Rynir7iNOK8kTnEEpEnh2HUbLF81OV3E9wm6/kcNlGVOFVtgAjrw9Ze
	zdHRJWm3IzpgMW7P1VnAtBEEkG+WxZhuCJpFEuEMWWGd2bZhUlWn5x9zN09c3uuPGXtdgg7e6cw5L
	0QIVeWdz8wYqwXDb2bRRQ5VTGM4ZNPmLX4sgYy6ZC94YlHWzgV5MB7/am7Z/jaJlC0zdN0ayJAeJ1
	MhBIHN9qt1TNWvPvoFUt3SbwuBSmvmHk87JDNO8PqAdqrI3yrA204I9bJ/zGx05xQwq5UI7t2ERXE
	0/YDELJZylA7RvtzlTCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUrK0-00GTNL-Gz; Thu, 17 Mar 2022 14:41:48 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUrIb-00GSPT-FD; Thu, 17 Mar 2022 14:40:23 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id D03801F4553E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647528017;
 bh=Cesbt6p5WFob0le5pX7ODJlISn8Jpc+6x+rij6eji3A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=b1PDqsPe7a5WBBMFJBlXg/tGajNYV6rCJ+tQ2XjUO8eNFGxZ8fsciKUccfOKWrW0w
 M5qnA7hoiZcwaS+7hIo1ZbR+zyRmQ2kstSUHEoFcpre8vIUAHlvh35eN+RMKnI6fbw
 fT+MObMAZLQ6KZvDqMpzI9JBcn7gTRa8MjNToo7pW0pEiaBukmBktsWWCW4qJqSlpN
 dB9k6oBI4JADyITu1raH78ex+b3s4hwC3914sExai+KYTv9+wGPUOGNGTlIwjzDjXW
 d7hnN/pCRjYuB8+qcePFPqiO8+yinyfQWnQrubofENnapV1tFzWsa8JdmG3ZlKYUfN
 k+aQi3t9U6VJw==
Date: Thu, 17 Mar 2022 10:40:12 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Maya Matuszczyk <maccraft123mc@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v1 06/10] arm64: dts: mediatek: asurada: Add keyboard
 mapping for the top row
Message-ID: <20220317144012.m7efcweyyqj3jtyt@notapiano>
References: <20220316151327.564214-1-nfraprado@collabora.com>
 <20220316151327.564214-7-nfraprado@collabora.com>
 <CAO_Mup+XApZBaSQLqBBxBPY5U1kOoRNwcWBhoaS+p_gCPx3XCg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAO_Mup+XApZBaSQLqBBxBPY5U1kOoRNwcWBhoaS+p_gCPx3XCg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220317_074021_668802_1B223984 
X-CRM114-Status: GOOD (  22.72  )
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

SGkgTWF5YSwKCk9uIFdlZCwgTWFyIDE2LCAyMDIyIGF0IDA1OjQyOjIwUE0gKzAxMDAsIE1heWEg
TWF0dXN6Y3p5ayB3cm90ZToKPiDFm3IuLCAxNiBtYXIgMjAyMiBvIDE2OjI2IE7DrWNvbGFzIEYu
IFIuIEEuIFByYWRvCj4gPG5mcmFwcmFkb0Bjb2xsYWJvcmEuY29tPiBuYXBpc2HFgihhKToKPiA+
Cj4gPiBDaHJvbWVib29rcycgZW1iZWRkZWQga2V5Ym9hcmRzIGRpZmZlciBmcm9tIHN0YW5kYXJk
IGxheW91dHMgZm9yIHRoZQo+ID4gdG9wIHJvdyBpbiB0aGF0IHRoZXkgaGF2ZSBzaG9ydGN1dHMg
aW4gcGxhY2Ugb2YgdGhlIHN0YW5kYXJkIGZ1bmN0aW9uCj4gPiBrZXlzLiBNYXAgdGhlc2Uga2V5
cyB0byBhY2hpZXZlIHRoZSBmdW5jdGlvbmFsaXR5IHRoYXQgaXMgcGljdHVyZWQgb24KPiA+IHRo
ZSBwcmludG91dHMuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogTsOtY29sYXMgRi4gUi4gQS4gUHJh
ZG8gPG5mcmFwcmFkb0Bjb2xsYWJvcmEuY29tPgo+ID4gUmV2aWV3ZWQtYnk6IEFuZ2Vsb0dpb2Fj
Y2hpbm8gRGVsIFJlZ25vIDxhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+
Cj4gPiAtLS0KPiA+Cj4gPiAgLi4uL2Jvb3QvZHRzL21lZGlhdGVrL210ODE5Mi1hc3VyYWRhLmR0
c2kgICAgIHwgMjkgKysrKysrKysrKysrKysrKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyOSBp
bnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVk
aWF0ZWsvbXQ4MTkyLWFzdXJhZGEuZHRzaSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsv
bXQ4MTkyLWFzdXJhZGEuZHRzaQo+ID4gaW5kZXggYmQyNzMwYWI2MjY2Li4xZDFhNGI5YTk4OWEg
MTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5Mi1hc3Vy
YWRhLmR0c2kKPiA+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTkyLWFz
dXJhZGEuZHRzaQo+ID4gQEAgLTUyNSwzICs1MjUsMzIgQEAgJnVhcnQwIHsKPiA+Cj4gPiAgI2lu
Y2x1ZGUgPGFybS9jcm9zLWVjLWtleWJvYXJkLmR0c2k+Cj4gPiAgI2luY2x1ZGUgPGFybS9jcm9z
LWVjLXNicy5kdHNpPgo+ID4gKwo+ID4gKyZrZXlib2FyZF9jb250cm9sbGVyIHsKPiA+ICsgICAg
ICAgZnVuY3Rpb24tcm93LXBoeXNtYXAgPSA8Cj4gPiArICAgICAgICAgICAgICAgTUFUUklYX0tF
WSgweDAwLCAweDAyLCAwKSAgICAgICAvKiBUMSAqLwo+ID4gKyAgICAgICAgICAgICAgIE1BVFJJ
WF9LRVkoMHgwMywgMHgwMiwgMCkgICAgICAgLyogVDIgKi8KPiA+ICsgICAgICAgICAgICAgICBN
QVRSSVhfS0VZKDB4MDIsIDB4MDIsIDApICAgICAgIC8qIFQzICovCj4gPiArICAgICAgICAgICAg
ICAgTUFUUklYX0tFWSgweDAxLCAweDAyLCAwKSAgICAgICAvKiBUNCAqLwo+ID4gKyAgICAgICAg
ICAgICAgIE1BVFJJWF9LRVkoMHgwMywgMHgwNCwgMCkgICAgICAgLyogVDUgKi8KPiA+ICsgICAg
ICAgICAgICAgICBNQVRSSVhfS0VZKDB4MDIsIDB4MDQsIDApICAgICAgIC8qIFQ2ICovCj4gPiAr
ICAgICAgICAgICAgICAgTUFUUklYX0tFWSgweDAxLCAweDA0LCAwKSAgICAgICAvKiBUNyAqLwo+
ID4gKyAgICAgICAgICAgICAgIE1BVFJJWF9LRVkoMHgwMiwgMHgwOSwgMCkgICAgICAgLyogVDgg
Ki8KPiA+ICsgICAgICAgICAgICAgICBNQVRSSVhfS0VZKDB4MDEsIDB4MDksIDApICAgICAgIC8q
IFQ5ICovCj4gPiArICAgICAgICAgICAgICAgTUFUUklYX0tFWSgweDAwLCAweDA0LCAwKSAgICAg
ICAvKiBUMTAgKi8KPiA+ICsgICAgICAgPjsKPiA+ICsgICAgICAgbGludXgsa2V5bWFwID0gPAo+
ID4gKyAgICAgICAgICAgICAgIE1BVFJJWF9LRVkoMHgwMCwgMHgwMiwgS0VZX0JBQ0spCj4gPiAr
ICAgICAgICAgICAgICAgTUFUUklYX0tFWSgweDAzLCAweDAyLCBLRVlfUkVGUkVTSCkKPiA+ICsg
ICAgICAgICAgICAgICBNQVRSSVhfS0VZKDB4MDIsIDB4MDIsIEtFWV9aT09NKQo+ID4gKyAgICAg
ICAgICAgICAgIE1BVFJJWF9LRVkoMHgwMSwgMHgwMiwgS0VZX1NDQUxFKQo+ID4gKyAgICAgICAg
ICAgICAgIE1BVFJJWF9LRVkoMHgwMywgMHgwNCwgS0VZX1NZU1JRKQo+ID4gKyAgICAgICAgICAg
ICAgIE1BVFJJWF9LRVkoMHgwMiwgMHgwNCwgS0VZX0JSSUdIVE5FU1NET1dOKQo+ID4gKyAgICAg
ICAgICAgICAgIE1BVFJJWF9LRVkoMHgwMSwgMHgwNCwgS0VZX0JSSUdIVE5FU1NVUCkKPiA+ICsg
ICAgICAgICAgICAgICBNQVRSSVhfS0VZKDB4MDIsIDB4MDksIEtFWV9NVVRFKQo+ID4gKyAgICAg
ICAgICAgICAgIE1BVFJJWF9LRVkoMHgwMSwgMHgwOSwgS0VZX1ZPTFVNRURPV04pCj4gPiArICAg
ICAgICAgICAgICAgTUFUUklYX0tFWSgweDAwLCAweDA0LCBLRVlfVk9MVU1FVVApCj4gPiArCj4g
PiArICAgICAgICAgICAgICAgQ1JPU19TVERfTUFJTl9LRVlNQVAKPiA+ICsgICAgICAgPjsKPiA+
ICt9Owo+ID4gLS0KPiA+IDIuMzUuMQo+ID4KPiBJJ20gaG9uZXN0bHkgYSBiaXQgY29uZnVzZWQg
YWJvdXQgZnVuY3Rpb24gb2YgdGhpcy4KPiBEb2VzIHRoaXMgY2hhbmdlIHRoZSByZXBvcnRlZCBr
ZXkgY29kZXMgdmlhIGV2ZGV2IGludGVyZmFjZT8KClllcy4KCj4gT3IgaXMgdGhpcyBqdXN0IGEg
aGludCB0byB1c2Vyc3BhY2U/IElmIHllcywgd291bGQgbGliaW5wdXQgcmVwb3J0Cj4ga2V5IHBy
ZXNzZXMgYXMgRi1rZXlzIG9yIHRoZSBjdXN0b20gZnVuY3Rpb24ga2V5cz8KPiBXb3VsZCB1c2Vy
cyBiZSBhYmxlIHRvIHVzZSB0aGUgdXN1YWwga2V5IGNvbWJpbmF0aW9uIHRvIHN3aXRjaAo+IGJl
dHdlZW4gVFRZcz8KPiBXb3VsZCBwcm9ncmFtcyByZXF1aXJpbmcgRi1rZXlzIHN0aWxsIHdvcms/
CgpOb3Qgd2l0aCB0aGlzIGtleWJvYXJkLCBzaW5jZSB0aGUgZW1iZWRkZWQga2V5Ym9hcmQgb24g
Q2hyb21lYm9va3MgZG9lc24ndCBoYXZlCkYta2V5cy4KClRoaXMgcGF0Y2ggaXMganVzdCBzZXR0
aW5nIHRoZSBrZXltYXAgcHJlc2VudCBvbiB0aGlzIHBsYXRmb3JtLCBzbyB0aGF0IHRoZQpkZXZp
Y2V0cmVlIGNvcnJlY3RseSBkZXNjcmliZXMgdGhlIGhhcmR3YXJlLgoKVGhhbmtzLApOw61jb2xh
cwoKPiAKPiBCZXN0IHJlZ2FyZHMsCj4gTWF5YSBNYXR1c3pjenlrCj4gCj4gPgo+ID4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+IExpbnV4LW1lZGlh
dGVrIG1haWxpbmcgbGlzdAo+ID4gTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwo+
ID4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRp
YXRlawoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRp
YXRlawo=
