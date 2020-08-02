Return-Path: <SRS0=bt65=BM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BEB3C433DF
	for <linux-mediatek@archiver.kernel.org>; Sun,  2 Aug 2020 00:04:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 483D720789
	for <linux-mediatek@archiver.kernel.org>; Sun,  2 Aug 2020 00:04:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qkbTVdYq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="KTYn7N/G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 483D720789
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fi+sUAyRrz02ITbkAT4gPmSZgtd2bhA5Uh97PI/mr4Q=; b=qkbTVdYqea5KsDcPV0rIl5YWd
	Sd2hsjYzVSAOk/IKkcuFnh0119KJV0kPQkA7mK4rcCd6fU905m/G3bUDUcxjVqp1oF0sXFJ0QhZEy
	4vHDLvBl6jGwdYFg97IwbftdrB2VgO8Okq4uZUUc19hTBwtxwQDs5m/Spbsi/StZsCNrfqX5XiNjh
	/iYrrLMLWu0avq0Ur8ZMFzoCpcUQ6jJUoLit9zQ01db2vHIItPtuJ2BWcodpEkrvNgc8gQf/Tc1jK
	pI+rm8DW3TDhytovJuhwIT6ixUFoFTm/o9pw8Dro9yc3coojc9zRX1lP/U/nC1/BM+B+9JIJmzOrA
	nTSS1067A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k21UA-0005TW-FR; Sun, 02 Aug 2020 00:04:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k21Tz-0005SS-L1; Sun, 02 Aug 2020 00:04:09 +0000
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 44E9B20888;
 Sun,  2 Aug 2020 00:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596326646;
 bh=JJ+DpM+KAOZuKVYWjZfkOfUQpF+6TNlEvjHz1UF+c00=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=KTYn7N/GjGIhXtVvrzRre6FnCOR6YLmXeCDWsarEiAGq/DcFDmT4U05UhytKy1xU6
 N6lo4HsHLkn0WfX4/e07VGWV8UsNeanLkLnOsMBPk2xcoHvxGOsX38OYltJHo3GXSA
 5RNLGnOeffIEeNquBqLJqi+3UIjlrMXUCUeiKcNQ=
Received: by mail-ed1-f47.google.com with SMTP id o10so15123158edh.6;
 Sat, 01 Aug 2020 17:04:06 -0700 (PDT)
X-Gm-Message-State: AOAM532tagkm14FDC5e0Vo1KjUvLpAGniRYXO12V+pU6sdHE2RUP3kUV
 MxPGcULgPjSzNfDAHC12qy/dNKxK3xqKz/X5kg==
X-Google-Smtp-Source: ABdhPJzEn4VLeJrbu0zAJ5dXYiNitDGHrGOIwRHpMThCcrej6wya5Z6fIJtz+Qiy0iNVZ4f24dBD2owi9j+C42hsxo4=
X-Received: by 2002:a50:ccd0:: with SMTP id b16mr9842462edj.148.1596326644838; 
 Sat, 01 Aug 2020 17:04:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200728111800.77641-1-frank-w@public-files.de>
 <20200728111800.77641-2-frank-w@public-files.de>
In-Reply-To: <20200728111800.77641-2-frank-w@public-files.de>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 2 Aug 2020 08:03:53 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8nm0KDHFzOX9+qTTHOUd0Vik063J+rScu_y-hTBTkrCQ@mail.gmail.com>
Message-ID: <CAAOTY_8nm0KDHFzOX9+qTTHOUd0Vik063J+rScu_y-hTBTkrCQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] drm/mediatek: config component output by device
 node port
To: Frank Wunderlich <frank-w@public-files.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200801_200408_227450_5B7E5FC5 
X-CRM114-Status: GOOD (  20.62  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIEZyYW5rOgoKRnJhbmsgV3VuZGVybGljaCA8ZnJhbmstd0BwdWJsaWMtZmlsZXMuZGU+IOaW
vCAyMDIw5bm0N+aciDI45pelIOmAseS6jCDkuIvljYg3OjE45a+r6YGT77yaCj4KPiBGcm9tOiBC
aWJieSBIc2llaCA8YmliYnkuaHNpZWhAbWVkaWF0ZWsuY29tPgo+Cj4gV2UgY2FuIHNlbGVjdCBv
dXRwdXQgY29tcG9uZW50IGJ5IGRlY2l2ZSBub2RlIHBvcnQuCj4gTWFpbiBwYXRoIGRlZmF1bHQg
b3V0cHV0IGNvbXBvbmVudCBpcyBEU0kuCj4gRXh0ZXJuYWwgcGF0aCBkZWZhdWx0IG91dHB1dCBj
b21wb25lbnQgaXMgRFBJLgo+Cj4gd2l0aG91dCB0aGlzIFBhdGNoIGkgZ2V0IHRoaXMgd2Fybmlu
ZzoKPgo+IFdBUk5JTkc6IENQVTogMyBQSUQ6IDcwIGF0IGRyaXZlcnMvZ3B1L2RybS9kcm1fbW9k
ZV9jb25maWcuYzo2MjEgZHJtX21vZGVfY29uZmlnX3ZhbGlkYXRlKzB4MWQ4LzB4MjU4Cj4KPiBT
aWduZWQtb2ZmLWJ5OiBCaWJieSBIc2llaCA8YmliYnkuaHNpZWhAbWVkaWF0ZWsuY29tPgo+Cj4g
YWRkZWQgc21hbGwgZml4ZXMgZm9yIHdhcm5pbmdzCj4KPiBTaWduZWQtb2ZmLWJ5OiBGcmFuayBX
dW5kZXJsaWNoIDxmcmFuay13QHB1YmxpYy1maWxlcy5kZT4KPiBUZXN0ZWQtYnk6IEZyYW5rIFd1
bmRlcmxpY2ggPGZyYW5rLXdAcHVibGljLWZpbGVzLmRlPgo+IC0tLQoKW3NuaXBdCgo+Cj4gLXN0
YXRpYyBjb25zdCBlbnVtIG10a19kZHBfY29tcF9pZCBtdDgxNzNfbXRrX2RkcF9leHRbXSA9IHsK
PiArc3RhdGljIGVudW0gbXRrX2RkcF9jb21wX2lkIG10ODE3M19tdGtfZGRwX2V4dFtdID0gewo+
ICAgICAgICAgRERQX0NPTVBPTkVOVF9PVkwxLAo+ICAgICAgICAgRERQX0NPTVBPTkVOVF9DT0xP
UjEsCj4gICAgICAgICBERFBfQ09NUE9ORU5UX0dBTU1BLAo+IEBAIC00NTksNiArNDY2LDcgQEAg
c3RhdGljIGludCBtdGtfZHJtX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4K
PiAgICAgICAgIC8qIEl0ZXJhdGUgb3ZlciBzaWJsaW5nIERJU1AgZnVuY3Rpb24gYmxvY2tzICov
Cj4gICAgICAgICBmb3JfZWFjaF9jaGlsZF9vZl9ub2RlKHBoYW5kbGUtPnBhcmVudCwgbm9kZSkg
ewo+ICsgICAgICAgICAgICAgICBzdHJ1Y3QgZGV2aWNlX25vZGUgKnBvcnQsICplcCwgKnJlbW90
ZTsKPiAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCAqb2ZfaWQ7Cj4g
ICAgICAgICAgICAgICAgIGVudW0gbXRrX2RkcF9jb21wX3R5cGUgY29tcF90eXBlOwo+ICAgICAg
ICAgICAgICAgICBpbnQgY29tcF9pZDsKPiBAQCAtNTIyLDYgKzUzMCwzMiBAQCBzdGF0aWMgaW50
IG10a19kcm1fcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPgo+ICAgICAgICAg
ICAgICAgICAgICAgICAgIHByaXZhdGUtPmRkcF9jb21wW2NvbXBfaWRdID0gY29tcDsKPiAgICAg
ICAgICAgICAgICAgfQo+ICsKPiArICAgICAgICAgICAgICAgaWYgKGNvbXBfdHlwZSAhPSBNVEtf
RFNJICYmIGNvbXBfdHlwZSAhPSBNVEtfRFBJKSB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAg
cG9ydCA9IG9mX2dyYXBoX2dldF9wb3J0X2J5X2lkKG5vZGUsIDApOwo+ICsgICAgICAgICAgICAg
ICAgICAgICAgIGlmICghcG9ydCkKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNv
bnRpbnVlOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIGVwID0gb2ZfZ2V0X2NoaWxkX2J5X25h
bWUocG9ydCwgImVuZHBvaW50Iik7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgb2Zfbm9kZV9w
dXQocG9ydCk7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgaWYgKCFlcCkKPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOwo+ICsgICAgICAgICAgICAgICAgICAgICAg
IHJlbW90ZSA9IG9mX2dyYXBoX2dldF9yZW1vdGVfcG9ydF9wYXJlbnQoZXApOwo+ICsgICAgICAg
ICAgICAgICAgICAgICAgIG9mX25vZGVfcHV0KGVwKTsKPiArICAgICAgICAgICAgICAgICAgICAg
ICBpZiAoIXJlbW90ZSkKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVl
Owo+ICsgICAgICAgICAgICAgICAgICAgICAgIG9mX2lkID0gb2ZfbWF0Y2hfbm9kZShtdGtfZGRw
X2NvbXBfZHRfaWRzLCByZW1vdGUpOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIGlmICghb2Zf
aWQpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPiArICAgICAg
ICAgICAgICAgICAgICAgICBjb21wX3R5cGUgPSAoZW51bSBtdGtfZGRwX2NvbXBfdHlwZSlvZl9p
ZC0+ZGF0YTsKPiArICAgICAgICAgICAgICAgICAgICAgICBmb3IgKGkgPSAwOyBpIDwgcHJpdmF0
ZS0+ZGF0YS0+bWFpbl9sZW4gLSAxOyBpKyspCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBpZiAocHJpdmF0ZS0+ZGF0YS0+bWFpbl9wYXRoW2ldID09IGNvbXBfaWQpCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHByaXZhdGUtPmRhdGEtPm1haW5fcGF0
aFtpICsgMV0gPQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtdGtf
ZGRwX2NvbXBfZ2V0X2lkKG5vZGUsIGNvbXBfdHlwZSk7Cj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgZm9yIChpID0gMDsgaSA8IHByaXZhdGUtPmRhdGEtPmV4dF9sZW4gLSAxOyBpKyspCj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpZiAocHJpdmF0ZS0+ZGF0YS0+ZXh0X3BhdGhb
aV0gPT0gY29tcF9pZCkKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
cHJpdmF0ZS0+ZGF0YS0+ZXh0X3BhdGhbaSArIDFdID0KPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgbXRrX2RkcF9jb21wX2dldF9pZChub2RlLCBjb21wX3R5cGUpOwo+
ICsgICAgICAgICAgICAgICB9CgpUaGUgcG9ydCBwcm9wZXJ0eSBpcyBub3QgZGVmaW5lZCBpbiBi
aW5kaW5nIGRvY3VtZW50IFsxXSwgc28gZGVmaW5lIGl0CmluIGJpbmRpbmcgZG9jdW1lbnQgZmly
c3QuCgpbMV0gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQv
dG9ydmFsZHMvbGludXguZ2l0L3RyZWUvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZGlzcC50eHQ/aD12NS44LXJjNwoKUmVnYXJkcywK
Q2h1bi1LdWFuZy4KCj4gICAgICAgICB9Cj4KPiAgICAgICAgIGlmICghcHJpdmF0ZS0+bXV0ZXhf
bm9kZSkgewo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9k
cnYuaCBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5oCj4gaW5kZXggYjVi
ZTYzZTUzMTc2Li43ZmNhYWI2NDhiZjEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19kcm1fZHJ2LmgKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RybV9kcnYuaAo+IEBAIC0yMSw5ICsyMSw5IEBAIHN0cnVjdCBkcm1fcHJvcGVydHk7Cj4gIHN0
cnVjdCByZWdtYXA7Cj4KPiAgc3RydWN0IG10a19tbXN5c19kcml2ZXJfZGF0YSB7Cj4gLSAgICAg
ICBjb25zdCBlbnVtIG10a19kZHBfY29tcF9pZCAqbWFpbl9wYXRoOwo+ICsgICAgICAgZW51bSBt
dGtfZGRwX2NvbXBfaWQgKm1haW5fcGF0aDsKPiAgICAgICAgIHVuc2lnbmVkIGludCBtYWluX2xl
bjsKPiAtICAgICAgIGNvbnN0IGVudW0gbXRrX2RkcF9jb21wX2lkICpleHRfcGF0aDsKPiArICAg
ICAgIGVudW0gbXRrX2RkcF9jb21wX2lkICpleHRfcGF0aDsKPiAgICAgICAgIHVuc2lnbmVkIGlu
dCBleHRfbGVuOwo+ICAgICAgICAgY29uc3QgZW51bSBtdGtfZGRwX2NvbXBfaWQgKnRoaXJkX3Bh
dGg7Cj4gICAgICAgICB1bnNpZ25lZCBpbnQgdGhpcmRfbGVuOwo+IC0tCj4gMi4yNS4xCj4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlh
dGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
