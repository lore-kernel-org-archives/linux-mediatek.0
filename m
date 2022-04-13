Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52796C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Apr 2022 15:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wvoacC4IXd7bKfGi5lmtz0PsBEkN5/lVA9z7SXIJhB8=; b=NRopiWXTE0huHG
	l7cCF2Zq49TqcVJL6Pez6BO3D7dgARPSDfkwkSXYIcEJF9FnE5pL/WgQUPCPQ+0w0mL900+H//7YR
	zXWOZx05FFfVYF7ezItRlRa3WloX1c4U9XgqdbFml8OG2L13H2lTo8m+P2fzlFlQxeZAMyjhykl9v
	u5A7ccJV7yk+JbBR7bLXy4tDLedhUeR4qSVWDlV99UNIIyrGoH2EcK1FeU+1/Rc5KMRF+yDKiOJ5o
	02bTx5XqNLk84ByjihvRK51YkRC68XPgxTJalJfXET9faj417i1qYytehUkvv+cCQALlDAVZnRnqP
	uG8BT50VC7CAo4hopX2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neeuH-001aYR-Uc; Wed, 13 Apr 2022 15:27:45 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neeuG-001aXP-5h
 for linux-mediatek@lists.infradead.org; Wed, 13 Apr 2022 15:27:45 +0000
Received: by mail-ed1-x529.google.com with SMTP id z99so2835362ede.5
 for <linux-mediatek@lists.infradead.org>; Wed, 13 Apr 2022 08:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=FTu8nhpVPh5fCRzBhXpfj9kU4anJdDZdibBzSiYag/s=;
 b=kQ3skXsasLue6DVfv5y0FVEuxEDxG29Y1+8D8hwBIbSTT92Og5I/A8u7aa66H86CJh
 CTIQSnSYgU4/qo9oWpjORiObR3Was1RTWBru1doFnE8zXrEMb/qKPP8eTbTHhElU0GLe
 1vvO2N+LYhMuf/VG3LHuzlUdwGL5VElXRSg6dqIEoTlptbpYL5cnHeND+lmFVatTOhI9
 bYi6Pj/EZeidXIZV3QsK6lvx1Q0PMO8pNrA5/dXuPU2Y0OKbfG+MribaoA8zWd/q6eie
 xpLB37J7pD536qO/VO+N9y84bf8yf/YSD8hbxMCZq+Pta05qyjpnFF64F/rQv2rB+NSk
 JryQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FTu8nhpVPh5fCRzBhXpfj9kU4anJdDZdibBzSiYag/s=;
 b=06Z1ItPAZDsHtP5XqfENWjAHqZoakpPZzbuQ7CGVcQgLGuDTbbEzzo4yl668fxty5n
 aynEyPYNnJuHvLyfNC950Tm7q+P+LOzWKMv3FVWqtCNdC103sDnp164+GPztuD1ulLO8
 nMvddQvbQS8X6NVJ31wDUQIQKQJq2P6YEZuIiKMWd9HGUu+0mYXYCZVPaH5C5lq62Ek6
 o7qCccFPVQPDEu+j5ejkox/ANFck+yTiXvmsGY8hmyD9abl1lIeF2VsIroU3vcdeBTdU
 UpnfrkLaP5kwyRT5C/SNUQDZFphc45K+6nCYYySt6qKWbyuTm7AFFUPmObXezUN1TkXx
 8rdw==
X-Gm-Message-State: AOAM531i++ik5VPT7Sh0ehDNyiac5MaoPkhh7vpo+EdeygK6saWxtb1z
 4YRShLmWGxep5+aW+3acinfU0A==
X-Google-Smtp-Source: ABdhPJxLBhlLRJV5EZ81MU7GCxLdWOBxTjQoEXFFGHWBBg0qfHICCPTgJ254wpt2+5hAPHYiEZitKw==
X-Received: by 2002:a05:6402:27d0:b0:419:5184:58ae with SMTP id
 c16-20020a05640227d000b00419518458aemr45052546ede.314.1649863659774; 
 Wed, 13 Apr 2022 08:27:39 -0700 (PDT)
Received: from [192.168.0.205] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 r3-20020aa7cb83000000b0041b573e2654sm1300328edt.94.2022.04.13.08.27.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Apr 2022 08:27:39 -0700 (PDT)
Message-ID: <b415523c-34e3-28a1-bcce-4682e7c67e77@linaro.org>
Date: Wed, 13 Apr 2022 17:27:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 09/14] mips: dts: ralink: mt7621: use the new compatible
 string for MT7621 pinctrl
Content-Language: en-US
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Luiz Angelo Daros de Luca <luizluca@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: erkin.bozoglu@xeront.com, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org
References: <20220413060729.27639-1-arinc.unal@arinc9.com>
 <20220413060729.27639-10-arinc.unal@arinc9.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220413060729.27639-10-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_082744_271032_54D9D5F9 
X-CRM114-Status: GOOD (  14.46  )
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

T24gMTMvMDQvMjAyMiAwODowNywgQXLEsW7DpyDDnE5BTCB3cm90ZToKPiBVc2UgdGhlIG5ldyBj
b21wYXRpYmxlIHN0cmluZyAicmFsaW5rLG10NzYyMS1waW5jdHJsIiBmb3IgdGhlIFJhbGluayBN
VDc2MjEKPiBwaW5jdHJsIHN1YmRyaXZlciBvbiBtdDc2MjEuZHRzaS4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBBcsSxbsOnIMOcTkFMIDxhcmluYy51bmFsQGFyaW5jOS5jb20+Cj4gLS0tCj4gIGFyY2gv
bWlwcy9ib290L2R0cy9yYWxpbmsvbXQ3NjIxLmR0c2kgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL21p
cHMvYm9vdC9kdHMvcmFsaW5rL210NzYyMS5kdHNpIGIvYXJjaC9taXBzL2Jvb3QvZHRzL3JhbGlu
ay9tdDc2MjEuZHRzaQo+IGluZGV4IDMyMjI2ODQ5MTVhYy4uZWUyZWM3OGM4OTUyIDEwMDY0NAo+
IC0tLSBhL2FyY2gvbWlwcy9ib290L2R0cy9yYWxpbmsvbXQ3NjIxLmR0c2kKPiArKysgYi9hcmNo
L21pcHMvYm9vdC9kdHMvcmFsaW5rL210NzYyMS5kdHNpCj4gQEAgLTE1MSw3ICsxNTEsNyBAQCBz
cGkwOiBzcGlAYjAwIHsKPiAgCX07Cj4gIAo+ICAJcGluY3RybDogcGluY3RybCB7Cj4gLQkJY29t
cGF0aWJsZSA9ICJyYWxpbmsscnQyODgwLXBpbm11eCI7Cj4gKwkJY29tcGF0aWJsZSA9ICJyYWxp
bmssbXQ3NjIxLXBpbmN0cmwiOwoKVGhlIGNoYW5nZSBpcyBub24tYmlzZWN0YWJsZSBhbmQgY2F1
c2VzIGlzc3VlcyBhbGwgb3RoZXIgdXNlcnMgb2YgRFQKKG90aGVyIHByb2plY3RzLCBzeXN0ZW1z
IGV0YykuIFRoaXMgaXMgZGlzY291cmFnZWQgaW4gZ2VuZXJhbCwgc28geW91CnNob3VsZCBkZXNj
cmliZSBpdC4gVGhlIGNvbW1pdCBtc2cgbGFja3MgYW5zd2VyIHRvIHRoZSBtYWluIHF1ZXN0aW9u
OgpXaHk/IFlvdSBmb2N1c2VkIG9ubHkgb24gd2hhdCB5b3UgYXJlIGRvaW5nLCBidXQgd2h5IHlv
dSBhcmUgZG9pbmcgaXMKYWN0dWFsbHkgbW9yZSBpbXBvcnRhbnQgZm9yIHN1Y2ggY2hhbmdlLgoK
QmVzdCByZWdhcmRzLApLcnp5c3p0b2YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRl
a0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
