Return-Path: <SRS0=4WJp=JV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61CBBC433B4
	for <linux-mediatek@archiver.kernel.org>; Sat, 24 Apr 2021 00:24:58 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D291561462
	for <linux-mediatek@archiver.kernel.org>; Sat, 24 Apr 2021 00:24:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D291561462
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=o8ZuK6NlXeJSdtgB7orhRd4wIsSP9yk2qVSgG5HJwzw=; b=oabDEVqJIAxbmHT2uQH9WzrGD
	vPYIPNFlfB/k8v8JIZZxl6XiSTKrrLfxJeqHLlm1d6aQA3233Z82Z8nyumO/Usp7OxeSrRNJQsv8Q
	buA9ZHpFGOgojkWJWEaNjPs9debusNQmPEyYdfd1gExSCSqGbWtVVOaX2TqIQYivvrUk1q0aNS/kl
	PEU9XHuuQcAgE3BFKCHpmSp4QNkegNuh/l2usQ9oHkIH4KE82GVAIl6NzaDXFfR4nMUbAo++Zz5Yv
	3pz2qJfQUjAJxQRrFhKekccigEz4Yhhe+VQsBHXOQ1ww0hhxvAvTTPSqXA6008EjzNVy0xfmrzPou
	4/cc09RMA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1la66F-002g2q-T5; Sat, 24 Apr 2021 00:24:45 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1la65x-002fyk-20; Sat, 24 Apr 2021 00:24:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-ID:Content-Description;
 bh=VhoqQQbIRqjh4MBEhhCIm6/JhKLio3ikd+DhPmaJQrc=; b=LQyz1LC5QFMwvYRBQf97Xhi0lh
 As8KcvX2EYYNUd0G3c1NOub1Bt9gae5o/oDpNnb7CwfrUseKoBtYasQ/e5JgAqvsXEl/Ukboywhg4
 Y+Y17VIxpMSw6tIOwxLZhBmktlpQbzBUhQ46a3U0qpIyS0ID98O295ySGDfR/pDMmzBsMY5+EIMKQ
 HyK2DcxF8T5eG4kZEjj0CtbmAzm7cvpLf2HIiwqdJR2OGTbintEwQhVs+rqaC9FCob9RYVIBT8JH0
 1G4wJyZOlpjJAZYe7wQPrRntbDCWD78oTszlkCbalZg1s6h3PFgbp8TlSfJxPj5N5IlTtO/hc/e0T
 fqVZRvhA==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1la65u-00Emvb-JJ; Sat, 24 Apr 2021 00:24:23 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2298A6144A;
 Sat, 24 Apr 2021 00:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619223862;
 bh=wRZ97aExQGMljYinJjx9Cgnv5qDIbGXWDbTgklJB4Mk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ZjXRx4dnOx0OSXtmerXzW7K9oIl5SDba/icm4FTlwwLIz1J4ULaGYJm7moi+6tAbn
 Omiov5p8waK59kVjX689Bwg+Tv8BjnwYBq3wVr3yesUrptBWS1jLerGbO4jthOr2yF
 cmdRgvOCK4rxaGlQH6BLv4uHA/iYFO4ddgSejxbFWsK7eWAjFC3veeN634Nw+cu/9J
 AqUuWvEfgGhqaFlbM8EjcXHTLnzAjnX/Z698MCMKiYr1bLYm1o9gUK/kV6frwn9U1M
 fBt7M0HNCSrEqrAQkjWnZrPbiMEqd3uUpwbSL2qDmXyn9/xNHq+tEclTb/EcYYcNQP
 Oy0tK5kg55OuA==
Received: by mail-ej1-f42.google.com with SMTP id v6so74902471ejo.6;
 Fri, 23 Apr 2021 17:24:22 -0700 (PDT)
X-Gm-Message-State: AOAM533Pz0v9VhKo8Cci9eGbC42jst16R7aoDl3sU8+4uaOdhWHvrFsI
 C5+Dn3ldLDFApD46H4NBf7Y9fMsga03sPzu7jA==
X-Google-Smtp-Source: ABdhPJwQgBu332eS8r8LCjd2EB6/UqPbtWe9kyT/JTkGqbYDpWNQ9/R+U3T9w831o7oRhYXepsheJyUkpMaP6CCmw7U=
X-Received: by 2002:a17:907:9485:: with SMTP id
 dm5mr6893874ejc.194.1619223860799; 
 Fri, 23 Apr 2021 17:24:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210419073244.2678688-1-narmstrong@baylibre.com>
 <20210419073244.2678688-4-narmstrong@baylibre.com>
In-Reply-To: <20210419073244.2678688-4-narmstrong@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 24 Apr 2021 08:24:10 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8g0voFQb22RrvMdYst7U0SZOUE+U5oab5bGJXD0nJsJQ@mail.gmail.com>
Message-ID: <CAAOTY_8g0voFQb22RrvMdYst7U0SZOUE+U5oab5bGJXD0nJsJQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] gpu/drm: mediatek: hdmi: add check for CEA modes
 only
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>,
 Fabien Parent <fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210423_172422_677394_65DF0174 
X-CRM114-Status: GOOD (  13.83  )
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

SGksIE5laWw6CgpOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+IOaWvCAy
MDIx5bm0NOaciDE55pelIOmAseS4gCDkuIvljYgzOjMz5a+r6YGT77yaCj4KPiBTb21lIFNvQ3Mg
bGlrZSB0aGUgTVQ4MTY3IGFyZSBub3QgdmFsaWRhdGVkIGFuZCBzdXBwb3J0ZWQgZm9yIEhETUkg
bW9kZXMKPiBvdXQgb2YgSERNSSBDRUEgbW9kZXMsIHNvIGFkZCBhIGNvbmZpZ3VyYXRpb24gYm9v
bGVhbiB0byBmaWx0ZXIgb3V0Cj4gbm9uLUNFQSBtb2Rlcy4KClJldmlld2VkLWJ5OiBDaHVuLUt1
YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4KCj4KPiBTaWduZWQtb2ZmLWJ5OiBGYWJp
ZW4gUGFyZW50IDxmcGFyZW50QGJheWxpYnJlLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBOZWlsIEFy
bXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfaGRtaS5jIHwgNCArKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2Vy
dGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hk
bWkuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jCj4gaW5kZXggZGVhNDZk
NjZlNzEyLi4wNTM5MjYyZTY5ZDMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19oZG1pLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWku
Ywo+IEBAIC0xNDgsNiArMTQ4LDcgQEAgc3RydWN0IGhkbWlfYXVkaW9fcGFyYW0gewo+Cj4gIHN0
cnVjdCBtdGtfaGRtaV9jb25mIHsKPiAgICAgICAgIGJvb2wgdHpfZGlzYWJsZWQ7Cj4gKyAgICAg
ICBib29sIGNlYV9tb2Rlc19vbmx5Owo+ICB9Owo+Cj4gIHN0cnVjdCBtdGtfaGRtaSB7Cj4gQEAg
LTEyMjIsNiArMTIyMyw5IEBAIHN0YXRpYyBpbnQgbXRrX2hkbWlfYnJpZGdlX21vZGVfdmFsaWQo
c3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSwKPiAgICAgICAgICAgICAgICAgICAgICAgICByZXR1
cm4gTU9ERV9CQUQ7Cj4gICAgICAgICB9Cj4KPiArICAgICAgIGlmIChoZG1pLT5jb25mLT5jZWFf
bW9kZXNfb25seSAmJiAhZHJtX21hdGNoX2NlYV9tb2RlKG1vZGUpKQo+ICsgICAgICAgICAgICAg
ICByZXR1cm4gTU9ERV9CQUQ7Cj4gKwo+ICAgICAgICAgaWYgKG1vZGUtPmNsb2NrIDwgMjcwMDAp
Cj4gICAgICAgICAgICAgICAgIHJldHVybiBNT0RFX0NMT0NLX0xPVzsKPiAgICAgICAgIGlmICht
b2RlLT5jbG9jayA+IDI5NzAwMCkKPiAtLQo+IDIuMjUuMQo+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QK
TGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
