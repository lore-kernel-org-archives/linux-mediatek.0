Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 632D1C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 May 2022 06:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3nuYm+oapdx5wWtqW68bj7xpLAcihST5uUYuGmtWolk=; b=vaxt1Yx2qRrDuZ
	8xKMZrIUjsppaQsUBo6+tZI9XqbSfGcvO+ChERa9z4e9mXF+gNxBCvXPCcEGNpUC1gTgfEeoyG132
	tYaYvaGzwDWZvROBQsAlZk2CroBHp99x3tuccAlj4XR78jzPwerkMo+3AEEK128cah7245hgM38uB
	yq8+fHyhbqWsbUQ7afW2ZU93uTTWnRUlWa/1n7S3+drgiVs2CdLPT+KuMyyXNGlLxQwY62KKadBmQ
	FjYiSf5qGzY8gILkgm24P6WLDZqZOwYuj/XLhk9lFUthzdwoZ56+wMpNPj1pgRkDOcA1cFzJ0e/Xv
	hPH9hCAJJ07hKfYY0sKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqUBf-006BdA-3p; Mon, 16 May 2022 06:26:35 +0000
Received: from mout-u-107.mailbox.org ([91.198.250.252])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqUBd-006BZl-3c
 for linux-mediatek@lists.infradead.org; Mon, 16 May 2022 06:26:34 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-u-107.mailbox.org (Postfix) with ESMTPS id 4L1q5V1TT4z9sy0;
 Mon, 16 May 2022 08:26:22 +0200 (CEST)
Message-ID: <fe4d398e-978c-6784-e3f6-01b83da3f249@denx.de>
Date: Mon, 16 May 2022 08:26:20 +0200
MIME-Version: 1.0
Subject: Re: [PATCH -next v2 1/2] i2c: mt7621: fix missing
 clk_disable_unprepare() on error in mtk_i2c_probe()
Content-Language: en-US
To: Yang Yingliang <yangyingliang@huawei.com>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org
Cc: matthias.bgg@gmail.com, wsa@the-dreams.de, christophe.jaillet@wanadoo.fr
References: <20220514023148.305457-1-yangyingliang@huawei.com>
From: Stefan Roese <sr@denx.de>
In-Reply-To: <20220514023148.305457-1-yangyingliang@huawei.com>
X-Rspamd-Queue-Id: 4L1q5V1TT4z9sy0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220515_232633_336004_5E04C338 
X-CRM114-Status: GOOD (  19.09  )
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

T24gMTQuMDUuMjIgMDQ6MzEsIFlhbmcgWWluZ2xpYW5nIHdyb3RlOgo+IEZpeCB0aGUgbWlzc2lu
ZyBjbGtfZGlzYWJsZV91bnByZXBhcmUoKSBiZWZvcmUgcmV0dXJuCj4gZnJvbSBtdGtfaTJjX3By
b2JlKCkgaW4gdGhlIGVycm9yIGhhbmRsaW5nIGNhc2UuCj4gCj4gRml4ZXM6IGQwNDkxM2VjNWY4
OSAoImkyYzogbXQ3NjIxOiBBZGQgTWVkaWFUZWsgTVQ3NjIxLzc2MjgvNzY4OCBJMkMgZHJpdmVy
IikKPiBTaWduZWQtb2ZmLWJ5OiBZYW5nIFlpbmdsaWFuZyA8eWFuZ3lpbmdsaWFuZ0BodWF3ZWku
Y29tPgoKUmV2aWV3ZWQtYnk6IFN0ZWZhbiBSb2VzZSA8c3JAZGVueC5kZT4KClRoYW5rcywKU3Rl
ZmFuCgo+IC0tLQo+ICAgICB2MjogYWRkIHJldHVybiAwIGluIG5vcm1hbCBwYXRoLgo+IC0tLQo+
ICAgZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1tdDc2MjEuYyB8IDEwICsrKysrKysrLS0KPiAgIDEg
ZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtbXQ3NjIxLmMgYi9kcml2ZXJzL2kyYy9idXNz
ZXMvaTJjLW10NzYyMS5jCj4gaW5kZXggNDVmZTRhN2ZlMGMwLi45MDFmMGZiMDRmZWUgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1tdDc2MjEuYwo+ICsrKyBiL2RyaXZlcnMv
aTJjL2J1c3Nlcy9pMmMtbXQ3NjIxLmMKPiBAQCAtMzA0LDcgKzMwNCw4IEBAIHN0YXRpYyBpbnQg
bXRrX2kyY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAgCj4gICAJaWYg
KGkyYy0+YnVzX2ZyZXEgPT0gMCkgewo+ICAgCQlkZXZfd2FybihpMmMtPmRldiwgImNsb2NrLWZy
ZXF1ZW5jeSAwIG5vdCBzdXBwb3J0ZWRcbiIpOwo+IC0JCXJldHVybiAtRUlOVkFMOwo+ICsJCXJl
dCA9IC1FSU5WQUw7Cj4gKwkJZ290byBlcnJfZGlzYWJsZV9jbGs7Cj4gICAJfQo+ICAgCj4gICAJ
YWRhcCA9ICZpMmMtPmFkYXA7Cj4gQEAgLTMyMiwxMCArMzIzLDE1IEBAIHN0YXRpYyBpbnQgbXRr
X2kyY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAgCj4gICAJcmV0ID0g
aTJjX2FkZF9hZGFwdGVyKGFkYXApOwo+ICAgCWlmIChyZXQgPCAwKQo+IC0JCXJldHVybiByZXQ7
Cj4gKwkJZ290byBlcnJfZGlzYWJsZV9jbGs7Cj4gICAKPiAgIAlkZXZfaW5mbygmcGRldi0+ZGV2
LCAiY2xvY2sgJXUga0h6XG4iLCBpMmMtPmJ1c19mcmVxIC8gMTAwMCk7Cj4gICAKPiArCXJldHVy
biAwOwo+ICsKPiArZXJyX2Rpc2FibGVfY2xrOgo+ICsJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGky
Yy0+Y2xrKTsKPiArCj4gICAJcmV0dXJuIHJldDsKPiAgIH0KPiAgIAoKVmllbGUgR3LDvMOfZSwK
U3RlZmFuIFJvZXNlCgotLSAKREVOWCBTb2Z0d2FyZSBFbmdpbmVlcmluZyBHbWJILCAgICAgIE1h
bmFnaW5nIERpcmVjdG9yOiBXb2xmZ2FuZyBEZW5rCkhSQiAxNjUyMzUgTXVuaWNoLCBPZmZpY2U6
IEtpcmNoZW5zdHIuNSwgRC04MjE5NCBHcm9lYmVuemVsbCwgR2VybWFueQpQaG9uZTogKCs0OSkt
ODE0Mi02Njk4OS01MSBGYXg6ICgrNDkpLTgxNDItNjY5ODktODAgRW1haWw6IHNyQGRlbnguZGUK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1l
ZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
