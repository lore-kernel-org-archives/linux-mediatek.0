Return-Path: <SRS0=4WJp=JV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62211C433B4
	for <linux-mediatek@archiver.kernel.org>; Sat, 24 Apr 2021 00:25:29 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D54E16144A
	for <linux-mediatek@archiver.kernel.org>; Sat, 24 Apr 2021 00:25:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D54E16144A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bWYL1exD5tnmKEPS5EV1P9hnAgEvvoJIj5023p2zIcE=; b=RuJNvHRjrkTEkzmm7gGtFo/jn
	XhwBJTHRF2tTuiSnA1q5XtKn4frfy4dZ6e/Bm/QehxoPEb345qOYGJaXOwfySRq78d0YluGLT0/5w
	YcF7H/CY/6hPbC6Q1gHPjDyLE7sthz18NiNO/LRi4BQj23cEjwTC/mbdPKKPK1MGWFyM1rDhjmbnW
	3rNtc7b2fxpW6G24r61TY6DbAG5KK5lW6KAI9f6enqU0v2WYbqtdLIWS356lKWU+Pdb5loEJ8Xquh
	GwQkU99HntBvxmsVYaKm75CxQOvqPBkdZjslmEuphRBZesDOlFfoabVoy2TE+BQPO4ze3Nyu0LKZk
	OuQmBciqA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1la66k-002gLT-Oh; Sat, 24 Apr 2021 00:25:16 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1la66V-002gDj-VF; Sat, 24 Apr 2021 00:25:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-ID:Content-Description;
 bh=3i2LCdb5sRko/cMG1IA45qL5djd2yQoikc1OEP0WRmo=; b=PpoydHHJXOnFy4Z0w7P9Ydqv6s
 xbH57A0MGE/NrJ5uQsrpme/Zq0LTf654g1DJI2iM3eEceojirG8sYsRXGO9D6wUw/vDE4qprFot/q
 tX/odlidjsXj/KqsqBRtTxBzS6wcUsCWM7XxRpk1eRNrCzOj+c6NpfcVDhZ1Y3p3YDyYQQBByQPiq
 fDW4am0HnNd3Posvc/Lk4KgnS+jjtStrmkmOEudcH8w/vVJZYu67I2MVIMlvwQD/V/fQFxqKmv3BE
 PgbnGAI56nnoHijS2AQr/8QLlksXcerOJuTPIIjOMIPgMFtuwgWuCVj7cI5NXjtJPDqHLhHnqXGG9
 hP07/C5g==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1la66T-00EmxF-Iv; Sat, 24 Apr 2021 00:24:58 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 301AA6141C;
 Sat, 24 Apr 2021 00:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619223897;
 bh=JUtYUFPq9g527zehS3r3trQprwKqTKRWX2ZmF5KthfI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=AXIRmdEEXTTTcqBDHEPz1I1nmt8HMK1D2iAXTYn2nwINJpOvTJnFJxd3aPfpCjRym
 wRYr/iZ9HqdNPRslb2DKYUfnoY57wuZDG2BiCzSywUDACGi/yows4t3dKfD/8WdKN0
 TybE6+JBuZqHJwoiRRcCxbBEOmGWoFaJSJhfdSXKoWbzBwz4I+xZMUAmWXhmDEAMKr
 c9wXyBqjLUodk3/krfZdRmb0AZolokR1MTx7xSSTqfgSGqrKClzLBJVae5mQzlCSHm
 sMCdSeVFphtUA1iGX3FgJEQ/HuMwQh9gWHHRTqvY/oedqgG9bj+BUgImEEaEf6DIOL
 oJ8n9bODCW3Fw==
Received: by mail-ed1-f44.google.com with SMTP id h8so19120355edb.2;
 Fri, 23 Apr 2021 17:24:57 -0700 (PDT)
X-Gm-Message-State: AOAM5338opz45QZ+WOJLtQB7FKE0fMvt2o0QSzhqufRMIvxBfFy1GccH
 zzljXv/ngx6XseqhTnyau2DqzLXfrG6uq5z2WA==
X-Google-Smtp-Source: ABdhPJyFg/YGdVA+cnxdfhz7C/WrfEW6PAyHJGolTksIoWi6zl62XnlcHbtRzFYYVuxL2wWnJJTuCSRLpqM2wLP13MY=
X-Received: by 2002:a05:6402:8d4:: with SMTP id
 d20mr7402937edz.49.1619223895851; 
 Fri, 23 Apr 2021 17:24:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210419073244.2678688-1-narmstrong@baylibre.com>
 <20210419073244.2678688-5-narmstrong@baylibre.com>
In-Reply-To: <20210419073244.2678688-5-narmstrong@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 24 Apr 2021 08:24:45 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-N4D2PJR0-YG3r+tLg0kcFZh8zyN=7kBNJsghpZG4nDA@mail.gmail.com>
Message-ID: <CAAOTY_-N4D2PJR0-YG3r+tLg0kcFZh8zyN=7kBNJsghpZG4nDA@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] gpu/drm: mediatek: hdmi: add optional limit on
 maximal HDMI mode clock
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
X-CRM114-CacheID: sfid-20210423_172457_664395_9B28F3D2 
X-CRM114-Status: GOOD (  13.88  )
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
bGlrZSB0aGUgTVQ4MTY3IGhhdmUgYSBoYXJkIGxpbWl0IG9uIHRoZSBtYXhpbWFsIHN1cHBvcnRl
ZCBIRE1JIFRNRFMKPiBjbG9jaywgc28gYWRkIGEgY29uZmlndXJhdGlvbiB2YWx1ZSB0byBmaWx0
ZXIgb3V0IHRob3NlIG1vZGVzLgoKUmV2aWV3ZWQtYnk6IENodW4tS3VhbmcgSHUgPGNodW5rdWFu
Zy5odUBrZXJuZWwub3JnPgoKPgo+IFNpZ25lZC1vZmYtYnk6IEZhYmllbiBQYXJlbnQgPGZwYXJl
bnRAYmF5bGlicmUuY29tPgo+IFNpZ25lZC1vZmYtYnk6IE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ry
b25nQGJheWxpYnJlLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19o
ZG1pLmMgfCA1ICsrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKPgo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYyBiL2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jCj4gaW5kZXggMDUzOTI2MmU2OWQzLi5iYzUwZDk3
ZjI1NTMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMK
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYwo+IEBAIC0xNDksNiAr
MTQ5LDcgQEAgc3RydWN0IGhkbWlfYXVkaW9fcGFyYW0gewo+ICBzdHJ1Y3QgbXRrX2hkbWlfY29u
ZiB7Cj4gICAgICAgICBib29sIHR6X2Rpc2FibGVkOwo+ICAgICAgICAgYm9vbCBjZWFfbW9kZXNf
b25seTsKPiArICAgICAgIHVuc2lnbmVkIGxvbmcgbWF4X21vZGVfY2xvY2s7Cj4gIH07Cj4KPiAg
c3RydWN0IG10a19oZG1pIHsKPiBAQCAtMTIyNiw2ICsxMjI3LDEwIEBAIHN0YXRpYyBpbnQgbXRr
X2hkbWlfYnJpZGdlX21vZGVfdmFsaWQoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSwKPiAgICAg
ICAgIGlmIChoZG1pLT5jb25mLT5jZWFfbW9kZXNfb25seSAmJiAhZHJtX21hdGNoX2NlYV9tb2Rl
KG1vZGUpKQo+ICAgICAgICAgICAgICAgICByZXR1cm4gTU9ERV9CQUQ7Cj4KPiArICAgICAgIGlm
IChoZG1pLT5jb25mLT5tYXhfbW9kZV9jbG9jayAmJgo+ICsgICAgICAgICAgIG1vZGUtPmNsb2Nr
ID4gaGRtaS0+Y29uZi0+bWF4X21vZGVfY2xvY2spCj4gKyAgICAgICAgICAgICAgIHJldHVybiBN
T0RFX0NMT0NLX0hJR0g7Cj4gKwo+ICAgICAgICAgaWYgKG1vZGUtPmNsb2NrIDwgMjcwMDApCj4g
ICAgICAgICAgICAgICAgIHJldHVybiBNT0RFX0NMT0NLX0xPVzsKPiAgICAgICAgIGlmIChtb2Rl
LT5jbG9jayA+IDI5NzAwMCkKPiAtLQo+IDIuMjUuMQo+CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGlu
dXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
