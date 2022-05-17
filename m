Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13DAEC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 May 2022 09:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1GZ29x+hYoMW7c4bPKLUI8y1dWRwzrSLBdNRxlxl3k8=; b=PftOrdDzT8FfOL
	uS+IGKC4d2oSg1oms8uj+o5t3Pwje0MB9zNJLFZOwSWv9sJ+AaHdQjoV8RSXdi0lYZzGMHEZee0J9
	ahVsD3E/yNID6shsTmFI5Jyf7MY8Y1LCyhgLKR0UnaX4IwmCEQKJda8qD/RBbRBfNJH8w6/r/Q8PH
	ZNCoiHjyBSR9MrbqUbx2YM7465A7XD+g0SYKhK8Xs9a/xV+w/jiNd8yr84kxaTcw/vXnRaiHIhfYq
	sP0mgdNnbjgrVP0PZ0awYggmOB74nBSSYjZkFqMbkOqeXYIcNeST1yRux4sbgtAS50NlAk8z48qmR
	InN9Enjmsog2630NNCtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqtay-00CmDa-L5; Tue, 17 May 2022 09:34:24 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqtaj-00Cm8l-Sj; Tue, 17 May 2022 09:34:11 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id D2C471F41931
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652780048;
 bh=JjX9Dpbd4y1EXZipRCq/V3m9lUaqIH2abh5TZEersWk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Tj/Q8V7mKAB5+fGOWGQCHAnVuvw8P1FBI9Ra5pfptpnWws0QqJ91j7TQKAvKE7i48
 uorjFjEd75UwKFbJabdDiCtyobnix20H2s95vsJXIL1TIdlbCIsdImqDtlk429FZKV
 /CQBrknPD6Gk2U8SEL1MbWr+6VD1HNs/Y4JqXX7nul9z8pao1hjseT7jNdtHXSxq2O
 5eclHFhAX7a61k32AJKv3bXAW7ChaXkOMaR2nM08wrG2h4ITtYp+NBs95PfykSEAhD
 DpIWEjPIjtyheC7kRdyHOkBMr7M773aRCObe6ysI8eXl5XD9s4+nEkLPqOG7y9NZUi
 jE3CwplldaasA==
Message-ID: <03ac9b18-cb5d-5ff6-d220-f2f4062cea7e@collabora.com>
Date: Tue, 17 May 2022 11:34:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3 3/5] soc: mediatek: pwrap: Move and check return value
 of platform_get_irq()
Content-Language: en-US
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, nfraprado@collabora.com,
 rex-bc.chen@mediatek.com, zhiyong.tao@mediatek.com
References: <20220516124659.69484-1-angelogioacchino.delregno@collabora.com>
 <20220516124659.69484-4-angelogioacchino.delregno@collabora.com>
 <ad736290-2e01-f867-d2ec-867a4385005a@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <ad736290-2e01-f867-d2ec-867a4385005a@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_023410_107266_12CF0C3D 
X-CRM114-Status: GOOD (  24.22  )
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

SWwgMTcvMDUvMjIgMTE6MTgsIE1hdHRoaWFzIEJydWdnZXIgaGEgc2NyaXR0bzoKPiAKPiAKPiBP
biAxNi8wNS8yMDIyIDE0OjQ2LCBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToKPj4g
TW92ZSB0aGUgY2FsbCB0byBwbGF0Zm9ybV9nZXRfaXJxKCkgZWFybGllciBpbiB0aGUgcHJvYmUg
ZnVuY3Rpb24KPj4gYW5kIGNoZWNrIGZvciBpdHMgcmV0dXJuIHZhbHVlOiBpZiBubyBpbnRlcnJ1
cHQgaXMgc3BlY2lmaWVkLCBpdAo+PiB3b3VsZG4ndCBtYWtlIHNlbnNlIHRvIHRyeSB0byBjYWxs
IGRldm1fcmVxdWVzdF9pcnEoKSBzbywgaW4gdGhhdAo+PiBjYXNlLCB3ZSBjYW4gc2ltcGx5IHJl
dHVybiBlYXJseS4KPj4KPj4gTW92aW5nIHRoZSBwbGF0Zm9ybV9nZXRfaXJxKCkgY2FsbCBhbHNv
IG1ha2VzIGl0IHBvc3NpYmxlIHRvIHVzZQo+PiBvbmUgbGVzcyBnb3RvLCBhcyBjbG9ja3MgYXJl
bid0IHJlcXVpcmVkIGF0IHRoYXQgc3RhZ2UuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEFuZ2Vsb0dp
b2FjY2hpbm8gRGVsIFJlZ25vIDxhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5j
b20+Cj4+IFJldmlld2VkLWJ5OiBOw61jb2xhcyBGLiBSLiBBLiBQcmFkbyA8bmZyYXByYWRvQGNv
bGxhYm9yYS5jb20+Cj4+IFRlc3RlZC1ieTogTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gPG5mcmFw
cmFkb0Bjb2xsYWJvcmEuY29tPgo+PiAtLS0KPj4gwqAgZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRr
LXBtaWMtd3JhcC5jIHwgNSArKysrLQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3NvYy9tZWRpYXRl
ay9tdGstcG1pYy13cmFwLmMgCj4+IGIvZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLXBtaWMtd3Jh
cC5jCj4+IGluZGV4IDg1MjUxNDM2NmYxZi4uMzMyY2JjYWJjMjk5IDEwMDY0NAo+PiAtLS0gYS9k
cml2ZXJzL3NvYy9tZWRpYXRlay9tdGstcG1pYy13cmFwLmMKPj4gKysrIGIvZHJpdmVycy9zb2Mv
bWVkaWF0ZWsvbXRrLXBtaWMtd3JhcC5jCj4+IEBAIC0yMjA0LDYgKzIyMDQsMTAgQEAgc3RhdGlj
IGludCBwd3JhcF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+PiDCoMKgwqDC
oMKgIGlmICghd3JwKQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FTk9NRU07Cj4+ICvC
oMKgwqAgaXJxID0gcGxhdGZvcm1fZ2V0X2lycShwZGV2LCAwKTsKPj4gK8KgwqDCoCBpZiAoaXJx
IDwgMCkKPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiBpcnE7Cj4+ICsKPj4gwqDCoMKgwqDCoCBw
bGF0Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2LCB3cnApOwo+PiDCoMKgwqDCoMKgIHdycC0+bWFzdGVy
ID0gb2ZfZGV2aWNlX2dldF9tYXRjaF9kYXRhKCZwZGV2LT5kZXYpOwo+PiBAQCAtMjMxNiw3ICsy
MzIwLDYgQEAgc3RhdGljIGludCBwd3JhcF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpw
ZGV2KQo+PiDCoMKgwqDCoMKgIGlmIChIQVNfQ0FQKHdycC0+bWFzdGVyLT5jYXBzLCBQV1JBUF9D
QVBfSU5UMV9FTikpCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBwd3JhcF93cml0ZWwod3JwLCB3cnAt
Pm1hc3Rlci0+aW50MV9lbl9hbGwsIFBXUkFQX0lOVDFfRU4pOwo+PiAtwqDCoMKgIGlycSA9IHBs
YXRmb3JtX2dldF9pcnEocGRldiwgMCk7Cj4gCj4gRm9yIGJldHRlciByZWFkYWJpbGl0eSBvZiB0
aGUgY29kZSBJJ2QgcHJlZmVyIHRvIGtlZXAgcGxhdGZvcm1fZ2V0X2lycSBuZXh0IHRvIAo+IGRl
dm1fcmVxdWVzdF9pcnEuIEkgdW5kZXJzdGFuZCB0aGF0IHlvdSBkaWQgdGhpcyBjaGFuZ2Ugc28g
dGhhdCB5b3UgZG9uJ3QgaGF2ZSB0byBjb2RlCj4gaWYgKGlycSA8IDApIHsKPiAgwqDCoMKgIHJl
dCA9IGlycTsKPiAgwqDCoMKgIGdvdG8gZXJyX291dDI7Cj4gfQo+IAo+IE9yIGRvIEkgbWlzcyBz
b21ldGhpbmc/Cj4gCgpUaGF0J3MgZm9yIHRoZSBzYWtlIG9mIHJlZHVjaW5nIGdvdG9zIGluIHRo
ZSBjb2RlLi4uIGJ1dCB0aGVyZSdzIGEgYmlnZ2VyCnBpY3R1cmUgdGhhdCBJIGhhdmVuJ3QgZXhw
bGFpbmVkIGluIHRoaXMgY29tbWl0IGFuZCB0aGF0IHdpbGwgY29tZSBsYXRlcgpiZWNhdXNlIEkg
Y3VycmVudGx5IGRvbid0IGhhdmUgdGhlIG5lY2Vzc2FyeSB0aW1lIHRvIHBlcmZvcm0gYSAiZGVj
ZW50Igp0ZXN0aW5nLgoKQXMgSSB3YXMgZXhwbGFpbmluZyAtIHRoZSBiaWdnZXIgcGljdHVyZXMg
aW1wbGllcyBhZGRpbmcgYSBuZXcgZnVuY3Rpb24gZm9yCmNsb2NrIHRlYXJkb3duLCB0aGF0IHdl
IHdpbGwgYWRkIGFzIGEgZGV2bSBhY3Rpb246CgpkZXZtX2FkZF9hY3Rpb25fb3JfcmVzZXQoJnBk
ZXYtPmRldiwgcHdyYXBfY2xrX2Rpc2FibGVfdW5wcmVwYXJlLCB3cnApCgouLi5zbyB0aGF0IHdl
IHdpbGwgYmUgYWJsZSB0byByZW1vdmUgKmFsbCogZ290b3MgZnJvbSB0aGUgcHJvYmUgZnVuY3Rp
b24uCgpTb3VuZHMgZ29vZD8KCkNoZWVycywKQW5nZWxvCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGlu
dXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
