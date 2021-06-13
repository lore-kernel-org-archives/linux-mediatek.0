Return-Path: <SRS0=gblj=LH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8570BC48BCF
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Jun 2021 15:52:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DE2A61019
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Jun 2021 15:52:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3DE2A61019
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=reto-schneider.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PKOaJya+ytFJzDDXRffIOO29A5hTtSsI2rpU358PHM8=; b=yA+hQ3Fi7MDAhHJDxKz7zXeRgE
	jjsRijFrBTsOFVwPvNd+TojlzKgORwJF8E/xwo9lRib/+8I8O6+MAKH18Br1BSeDb2TX6gLrDAyJM
	i4PwK2gDRmHhvz/a6fsByJZtc2dmf/Iobxp3peKHIQhYr5H+vfV4DJ92fzFtKyK+SJLp9PTeVplr9
	CFg2lgqS0l6+JNHygsloLKydbBIucm5CcjKIu53AI/0JOcD/PNwJ9REuf6XcVYTy8coHmMhbz6KdO
	3EVLYLZ0GEXXk9MbDFniKKUnToMVeUMX2TzRo2/Z6eyxZC7hFLdPT2EFS/BxIs7nC9HNMgVYMMYao
	O+8+NYeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lsSOp-00AgTa-6g; Sun, 13 Jun 2021 15:51:47 +0000
Received: from mxout017.mail.hostpoint.ch ([2a00:d70:0:e::317])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsSOd-00AgQn-8l; Sun, 13 Jun 2021 15:51:36 +0000
Received: from [10.0.2.46] (helo=asmtp013.mail.hostpoint.ch)
 by mxout017.mail.hostpoint.ch with esmtp (Exim 4.94.2 (FreeBSD))
 (envelope-from <code@reto-schneider.ch>)
 id 1lsSOZ-000Jm9-IU; Sun, 13 Jun 2021 17:51:31 +0200
Received: from [2a02:168:6182:1:d747:8127:5b7a:4266]
 by asmtp013.mail.hostpoint.ch with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2 (FreeBSD)) (envelope-from <code@reto-schneider.ch>)
 id 1lsSOZ-000DQg-Ft; Sun, 13 Jun 2021 17:51:31 +0200
X-Authenticated-Sender-Id: reto-schneider@reto-schneider.ch
Subject: Re: [PATCH v1] gpio: mt7621: Assign base field in gpio_chip
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Stefan Roese <sr@denx.de>, Reto Schneider
 <reto.schneider@husqvarnagroup.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20210613120608.1527394-1-code@reto-schneider.ch>
 <CAHp75Vc5LRRLc-1A5W4BVQ3QQx-+4Y5CUjG3ksosVdPEecEyqA@mail.gmail.com>
From: Reto Schneider <code@reto-schneider.ch>
Message-ID: <db862b9d-2003-08f4-6856-26fb4870caff@reto-schneider.ch>
Date: Sun, 13 Jun 2021 17:51:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAHp75Vc5LRRLc-1A5W4BVQ3QQx-+4Y5CUjG3ksosVdPEecEyqA@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210613_085135_332770_3F60F616 
X-CRM114-Status: GOOD (  15.40  )
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

SGkgQW5keSwKCk9uIDEzLjA2LjIxIDE0OjQ0LCBBbmR5IFNoZXZjaGVua28gd3JvdGU6Cj4gSXQg
c21lbGxzIGxpa2UgYSBmaXhpbmcgbm9uLWV4aXN0aW5nIGJ1Zy4gWWVzLCBJIHVuZGVyc3RhbmQg
dGhhdCB0aGVyZSAKPiBpcyBzb21lIGN1c3RvbSBoYXJkd2FyZSB3aXRoIGN1c3RvbSBmaXJtd2Fy
ZSB3aGljaCBpcyB1c2luZyBMaW51eCBrZXJuZWwgCj4gd2l0aCBzb21lIG5ldmVyIHVwc3RyZWFt
ZWQgcGF0Y2hlcy4gT24gdG9wIG9mIHRoaXMgc3lzZnMgaW50ZXJmYWNlIGlzIAo+IGRlcHJlY2F0
ZWQgZm9yIGFscmVhZHkgYSBmZXcgeWVhcnMgYW5kIHNob3VsZG7igJl0IGJlIGNvbnNpZGVyZWQg
YXMgMXN0IAo+IGNsYXNzIGNpdGl6ZW4uCj4gCj4gVGhhdOKAmXMgc2FpZCwgaWYgdGhlcmUgaXMg
bm8gRml4ZXMgdGFnIHByb3ZpZGVkIHdpdGggY2xlYXIgcG9pbnQgdGhhdCBfYXQgCj4gc29tZSBw
b2ludF8gaXQgd2FzIGxpa2UgdGhpcyBpbiB1cHN0cmVhbSwgSSB3b3VsZCB0ZW5kIHRvIE5BSyB0
aGlzIHBhdGNoLgoKSSBkaWQgc29tZSBkaWdnaW5nIGFuZCBpbmRlZWQsIGl0IHR1cm5lZCBvdXQg
dGhhdCBJIHVzZWQgdGhlIApwcmUtbWFpbmxpbmUgR1BJTyBkcml2ZXIgZnJvbSBPcGVuV1JUIGV2
ZW4gb24gS2VybmVsIDQuMTkgKGZvciB3aGljaCB0aGUgCmN1cnJlbnQgZHJpdmVyIGFscmVhZHkg
Z290IG1haW5saW5lZCkuCgpTdXJlbHkgZG8gYWdyZWUgb24gbm90IGJyZWFraW5nIHRoZSBpbnRl
cmZhY2UgaW4gbWFpbmxpbmUsIGFuZCB0aGUgTkFLLgoKU29ycnkgZm9yIHdhc3RpbmcgeW91ciB0
aW1lIQoKS2luZCByZWdhcmRzLApSZXRvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0
ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
