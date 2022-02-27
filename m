Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E9DC433F5
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Feb 2022 17:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SFPoaCtRXgh5t4/FHSbFYUgKbl0MVsgS1K49BYokdFU=; b=dxjCV8kKfUbYmQ
	BuSl4twkGy48U8jrMiQhbS11o+jYPrgAiGdw004edY2J/kCDPZNrkm6cYqvYBBC78oHxGhuPmAZUe
	yX9RQWSLkHqWUzxheVVzZVXijTPQxwittEeDdRD1SWgqSWY7zKIGUTleVjU6eBSpX6t1tZxr1fMNJ
	gLS7+MBod/KSphHy9LSQtbGfuk057q6yp1lsWwsM9fsYKtYxhZJiFl6cIm2k9tYwk+cegoWqnjPzn
	wJxft84IpknNhtQcZ0L+p7+ihOv16WvsdSWk9oduIgAH9ejAPczV+SToCIWtbO+ju9A59cGpHKKZk
	KLARlbJ8mfuj8Kgn3jrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOMvo-009qn8-5V; Sun, 27 Feb 2022 17:02:00 +0000
Received: from smtp08.smtpout.orange.fr ([80.12.242.130]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOMvk-009qmG-O1
 for linux-mediatek@lists.infradead.org; Sun, 27 Feb 2022 17:01:58 +0000
Received: from [192.168.1.18] ([90.126.236.122]) by smtp.orange.fr with ESMTPA
 id OMvbnV3p641cbOMvbnynb3; Sun, 27 Feb 2022 18:01:50 +0100
X-ME-Helo: [192.168.1.18]
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sun, 27 Feb 2022 18:01:50 +0100
X-ME-IP: 90.126.236.122
Message-ID: <5477fb05-d72f-ccc0-1c07-8f2f40d9dde0@wanadoo.fr>
Date: Sun, 27 Feb 2022 18:01:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] iio: adc: mt6360: strengthen return check of
 mt6360_adc_read_channel
Content-Language: en-US
To: jic23@kernel.org, lars@metafoo.de, matthias.bgg@gmail.com,
 nathan@kernel.org, ndesaulniers@google.com, linus.walleij@linaro.org,
 ardeleanalex@gmail.com, Tom Rix <trix@redhat.com>
Cc: linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, Tom Rix <trix@redhat.com>
References: <20220227164357.84742-1-trix@redhat.com>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20220227164357.84742-1-trix@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220227_090156_943898_1DF91475 
X-CRM114-Status: GOOD (  18.36  )
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

TGUgMjcvMDIvMjAyMiDDoCAxNzo0MywgdHJpeC1IK3dYYUh4ZjdhTFFUMGRaUitBbGZBQHB1Ymxp
Yy5nbWFuZS5vcmcgYSAKw6ljcml0wqA6Cj4gRnJvbTogVG9tIFJpeCA8dHJpeC1IK3dYYUh4Zjdh
TFFUMGRaUitBbGZBQHB1YmxpYy5nbWFuZS5vcmc+Cj4gCj4gQ2xhbmcgc3RhdGljIGFuYWx5c2lz
IHJlcG9ydHMgdGhpcyBpc3N1ZQo+IG10NjM2MC1hZGMuYzoyNzc6MjA6IHdhcm5pbmc6IEFzc2ln
bmVkIHZhbHVlIGlzCj4gICAgZ2FyYmFnZSBvciB1bmRlZmluZWQKPiAgICBkYXRhLnZhbHVlc1tp
KytdID0gdmFsOwo+ICAgICAgICAgICAgICAgICAgICAgXiB+fn4KPiAKPiB2YWwgaXMgc2V0IGJ5
IGEgc3VjY2Vzc2Z1bCBjYWxsIHRvIG02MzYwX2FkY19yZWFkX2NoYW5uZWwoKS4KPiBBIG5lZ2F0
aXZlIHJldHVybiBpcyBjaGVja2VkIGJ1dCB3aXRoaW4gbTYzNjBfYWRjX3JlYWRfY2hhbm5lbCwK
PiBhIG5vbiB6ZXJvIGNoZWNrIGlzIGRvbmUuCj4gU3RyZW5ndGhlbiB0aGUgY2hlY2sgdG8gbm9u
IHplcm8uCgpIaSwgbXkgdW5kZXJzdGFuZGluZyBvZiBtNjM2MF9hZGNfcmVhZF9jaGFubmVsKCkg
aXMgdGhhdCBvbiBzdWNjZXNzLCBpdCAKcmV0dXJucyBJSU9fVkFMX0lOVCAoaS5lLiAxKS4KClNv
LCBJIHRoaW5rIHRoYXQgd2l0aCB5b3VyIHBhdGNoLCB3ZSB3aWxsIG5vdyBhbHdheXMgZmFpbCBi
ZWNhdXNlICdyZXQnIAppcyBuZXZlciAwIGF0IHRoaXMgcG9pbnQuCgpDSgoKPiAKPiBTaWduZWQt
b2ZmLWJ5OiBUb20gUml4IDx0cml4LUgrd1hhSHhmN2FMUVQwZFpSK0FsZkFAcHVibGljLmdtYW5l
Lm9yZz4KPiAtLS0KPiAgIGRyaXZlcnMvaWlvL2FkYy9tdDYzNjAtYWRjLmMgfCAyICstCj4gICAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9paW8vYWRjL210NjM2MC1hZGMuYyBiL2RyaXZlcnMvaWlvL2FkYy9tdDYz
NjAtYWRjLmMKPiBpbmRleCAwN2MwZTY3NjgzOTEwLi45ZmI2ZGMzMDVhMzkyIDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvaWlvL2FkYy9tdDYzNjAtYWRjLmMKPiArKysgYi9kcml2ZXJzL2lpby9hZGMv
bXQ2MzYwLWFkYy5jCj4gQEAgLTI2OSw3ICsyNjksNyBAQCBzdGF0aWMgaXJxcmV0dXJuX3QgbXQ2
MzYwX2FkY190cmlnZ2VyX2hhbmRsZXIoaW50IGlycSwgdm9pZCAqcCkKPiAgIAltZW1zZXQoJmRh
dGEsIDAsIHNpemVvZihkYXRhKSk7Cj4gICAJZm9yX2VhY2hfc2V0X2JpdChiaXQsIGluZGlvX2Rl
di0+YWN0aXZlX3NjYW5fbWFzaywgaW5kaW9fZGV2LT5tYXNrbGVuZ3RoKSB7Cj4gICAJCXJldCA9
IG10NjM2MF9hZGNfcmVhZF9jaGFubmVsKG1hZCwgYml0LCAmdmFsKTsKPiAtCQlpZiAocmV0IDwg
MCkgewo+ICsJCWlmIChyZXQpIHsKPiAgIAkJCWRldl93YXJuKCZpbmRpb19kZXYtPmRldiwgIkZh
aWxlZCB0byBnZXQgY2hhbm5lbCAlZCBjb252ZXJzaW9uIHZhbFxuIiwgYml0KTsKPiAgIAkJCWdv
dG8gb3V0Owo+ICAgCQl9CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tZWRpYXRlawo=
