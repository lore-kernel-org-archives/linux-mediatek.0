Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC37FC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Apr 2022 15:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JyhyxkYxR12RMfajHDJgi4uChIo1yvyhzb1KAlYfVro=; b=isPoCK1Xyi9J6+
	KLhH56SOB2eMLNzZmhrGnNc9XrnR9ro6FaPkj/wQ6VJMegQRXSOq2Fymt0gD2rq4APUsa95IY2em8
	8qduuq9EasKJz3yv4YqQAYKVTY5p2KDAT4pZcjiT0W1V+LQUGSmnVv8Km235fhXLi24fn7l+WiFbj
	mM9XsJJWVliTIxkCPeO+y+/YiBXvvGxa9TigU/U4CKJ0ajDbWi6d/CPk4cMg6eT2odmTmOLkLIga+
	vZqLaiVPnW8LSY/CB3l+SkT1OXbGNEwHSGtSbF3jSGR9z5UKsz9ksCF/dRx4qBYJDWvCGMmlmZnKz
	XSe6GfxkSDOrG6+YRBHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nef3r-001ci9-6j; Wed, 13 Apr 2022 15:37:39 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nef3o-001cgh-32
 for linux-mediatek@lists.infradead.org; Wed, 13 Apr 2022 15:37:37 +0000
Received: by mail-ed1-x52a.google.com with SMTP id u18so2884307eda.3
 for <linux-mediatek@lists.infradead.org>; Wed, 13 Apr 2022 08:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=PO/0MDUIRM3Z0h3PU4eYcvsEMMdjUT2V3VaPhr9z/E0=;
 b=uZu249qTy6MNrhwunH7p+LQXhXmrsO80rWgRpnSw5DiD3hbfKGkKdgwP4qCDhJcosG
 1id+AiwWFRQcUvt2is2rxDrfiNygmFCzfPjtkHQyWo9o/8aKwYt2NFGSUaheYFAnv0qw
 G9zfjPYM47uYz8+FcXJPtTEPc/DGp0TCuUDiaHpGYbU1tFZnTCVzfVXxfRBkv760CyRq
 lS+Q++xqPwB0O+09Gie6Y9JUnHWESMIY45tGEWA5ACGtR/BAl6R5tuY6OKbP/gveeIXZ
 rftEEHVAopdd1PKcPDXKBuFXrQORYK+u4GsFj4JYX9g5NALffkMyFfnPBE4fQ8WZLOlh
 +1HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PO/0MDUIRM3Z0h3PU4eYcvsEMMdjUT2V3VaPhr9z/E0=;
 b=0CSUllXI2zIKi94DWDaBeLNnmi3oXo69K1Mj42evP5e25jdmmTO1Ji0nmjUyDchD5e
 n2h5/afPdfRi/2/45Rctp55j0urF55sU7z2EIK0ZMjO2xYSLBqjMHh/Rj3R/B4pTMsdc
 ng8I08x1Lwt8IbIRiKBXiMusK2vg8L7jBLgvbJ4NtjQkyg15pHmpujDkD84/+fPBjulT
 BdEETxiix5Izt1eK4NmmJZVX7rqFmyh1+cKzFUwyy6UvO7RmqzPeAUe5gWl1h/9qAQNR
 TACwOsuu9RcMcyHDgnG6vrOajO4MW2hyrkVBzGeDwwOm2w6KladMTcFzqSEcAKT4Lzw7
 YO6g==
X-Gm-Message-State: AOAM53324GYOGWY6KvVsrpRogMjjNoEaRukzhAgHS3k5MNlsvlO6sIZf
 KI9bkoH1TvVF+RqokvLd/ucvybLBWclnZHal
X-Google-Smtp-Source: ABdhPJxyKrAG9rRVE8mRj679SzmDmAD8xVhn9EsmeCnZGHfphrC6B5qUeqw3KRrzN0aSvsQWiRckTA==
X-Received: by 2002:aa7:da8d:0:b0:41d:71be:d8bd with SMTP id
 q13-20020aa7da8d000000b0041d71bed8bdmr20584914eds.71.1649864252388; 
 Wed, 13 Apr 2022 08:37:32 -0700 (PDT)
Received: from [192.168.0.205] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 dn7-20020a17090794c700b006e8b176143bsm102985ejc.155.2022.04.13.08.37.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Apr 2022 08:37:31 -0700 (PDT)
Message-ID: <41fa58ee-728b-7f0d-eea7-448c59641d85@linaro.org>
Date: Wed, 13 Apr 2022 17:37:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 11/14] dt-bindings: pinctrl: add binding for Ralink MT7620
 pinctrl
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
 <20220413060729.27639-12-arinc.unal@arinc9.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220413060729.27639-12-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_083736_246611_EEE6DC3A 
X-CRM114-Status: GOOD (  18.52  )
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

T24gMTMvMDQvMjAyMiAwODowNywgQXLEsW7DpyDDnE5BTCB3cm90ZToKPiBBZGQgYmluZGluZyBm
b3IgdGhlIFJhbGluayBNVDc2MjAgcGluIGNvbnRyb2xsZXIgZm9yIE1UNzYyMCwgTVQ3NjI4IGFu
ZAo+IE1UNzY4OCBTb0NzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFyxLFuw6cgw5xOQUwgPGFyaW5j
LnVuYWxAYXJpbmM5LmNvbT4KPiAtLS0KPiAgLi4uL3BpbmN0cmwvcmFsaW5rLG10NzYyMC1waW5j
dHJsLnlhbWwgICAgICAgIHwgODcgKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdl
ZCwgODcgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvcmFsaW5rLG10NzYyMC1waW5jdHJsLnlhbWwKPiAK
PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwv
cmFsaW5rLG10NzYyMC1waW5jdHJsLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvcGluY3RybC9yYWxpbmssbXQ3NjIwLXBpbmN0cmwueWFtbAo+IG5ldyBmaWxlIG1vZGUg
MTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi4wMTU3OGI4YWEyNzcKPiAtLS0gL2Rldi9udWxs
Cj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvcmFsaW5r
LG10NzYyMC1waW5jdHJsLnlhbWwKPiBAQCAtMCwwICsxLDg3IEBACj4gKyMgU1BEWC1MaWNlbnNl
LUlkZW50aWZpZXI6IEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UKPiArJVlBTUwgMS4yCj4g
Ky0tLQo+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL3BpbmN0cmwvcmFsaW5r
LG10NzYyMC1waW5jdHJsLnlhbWwjCj4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9t
ZXRhLXNjaGVtYXMvY29yZS55YW1sIwo+ICsKPiArdGl0bGU6IFJhbGluayBNVDc2MjAgUGluIENv
bnRyb2xsZXIKPiArCj4gK21haW50YWluZXJzOgo+ICsgIC0gQXLEsW7DpyDDnE5BTCA8YXJpbmMu
dW5hbEBhcmluYzkuY29tPgo+ICsgIC0gU2VyZ2lvIFBhcmFjdWVsbG9zIDxzZXJnaW8ucGFyYWN1
ZWxsb3NAZ21haWwuY29tPgo+ICsKPiArZGVzY3JpcHRpb246Cj4gKyAgUmFsaW5rIE1UNzYyMCBw
aW4gY29udHJvbGxlciBmb3IgTVQ3NjIwLCBNVDc2MjggYW5kIE1UNzY4OCBTb0NzLgo+ICsgIFRo
ZSBwaW4gY29udHJvbGxlciBjYW4gb25seSBzZXQgdGhlIG11eGluZyBvZiBwaW4gZ3JvdXBzLiBN
dXhpbmcgaW5kaXZpdWFsIHBpbnMKClJ1biBzcGVsbGNoZWNrIG9uIG9yaWdpbmFsIGJpbmRpbmdz
LCBkb24ndCBjb3B5IHNhbWUgdHlwb3MuCgo+ICsgIGlzIG5vdCBzdXBwb3J0ZWQuIFRoZXJlIGlz
IG5vIHBpbmNvbmYgc3VwcG9ydC4KPiArCj4gK3Byb3BlcnRpZXM6Cj4gKyAgY29tcGF0aWJsZToK
PiArICAgIGNvbnN0OiByYWxpbmssbXQ3NjIwLXBpbmN0cmwKPiArCj4gK3BhdHRlcm5Qcm9wZXJ0
aWVzOgo+ICsgICctcGlucyQnOgo+ICsgICAgdHlwZTogb2JqZWN0Cj4gKyAgICBwYXR0ZXJuUHJv
cGVydGllczoKPiArICAgICAgJ14oLiotKT9waW5tdXgkJzoKCldoeSBkbyB5b3UgaGF2ZSB0d28g
bGV2ZWxzIGhlcmU/IHBpbnMtPnBpbm11eC0+YWN0dWFsIHBpbiBjb25maWd1cmF0aW9uPwpDYW5u
b3QgYmUgc29tZXRoaW5nIGxpa2UgYnJjbSxiY202MzZ4IGhhcz8KCj4gKyAgICAgICAgdHlwZTog
b2JqZWN0Cj4gKyAgICAgICAgZGVzY3JpcHRpb246IG5vZGUgZm9yIHBpbmN0cmwuCj4gKyAgICAg
ICAgJHJlZjogcGlubXV4LW5vZGUueWFtbCMKPiArCj4gKyAgICAgICAgcHJvcGVydGllczoKPiAr
ICAgICAgICAgIGdyb3VwczoKPiArICAgICAgICAgICAgZGVzY3JpcHRpb246IFRoZSBwaW4gZ3Jv
dXAgdG8gc2VsZWN0LgoKSSB3b25kZXIgd2hlcmUgZG8geW91IGNvbmZpZ3VyZSBwYXJ0aWN1bGFy
IHBpbnMgYmVjYXVzZSB0aGVzZSBhcmUKZ3JvdXBzLi4uIEl0J3MgYSBiaXQgY29uZnVzaW5nIHRv
IGNvbmZpZ3VyZSAiaTJjIiBncm91cCBpbnRvICJpMmMiIC0KbG9va3Mgb2J2aW91cy4KCj4gKyAg
ICAgICAgICAgIGVudW06IFsKPiArICAgICAgICAgICAgICAjIEZvciBNVDc2MjAgU29DCj4gKyAg
ICAgICAgICAgICAgZXBoeSwgaTJjLCBtZGlvLCBuZF9zZCwgcGEsIHBjaWUsIHJnbWlpMSwgcmdt
aWkyLCBzcGksIHNwaSByZWZjbGssIHVhcnRmLCB1YXJ0bGl0ZSwgd2R0LCB3bGVkLAo+ICsKPiAr
ICAgICAgICAgICAgICAjIEZvciBNVDc2MjggYW5kIE1UNzY4OCBTb0NzCj4gKyAgICAgICAgICAg
ICAgZ3BpbywgaTJjLCBpMnMsIHAwbGVkX2FuLCBwMGxlZF9rbiwgcDFsZWRfYW4sIHAxbGVkX2tu
LCBwMmxlZF9hbiwgcDJsZWRfa24sIHAzbGVkX2FuLAo+ICsgICAgICAgICAgICAgIHAzbGVkX2tu
LCBwNGxlZF9hbiwgcDRsZWRfa24sIHBlcnN0LCBwd20wLCBwd20xLCByZWZjbGssIHNkbW9kZSwg
c3BpLCBzcGkgY3MxLCBzcGlzLCB1YXJ0MCwKPiArICAgICAgICAgICAgICB1YXJ0MSwgdWFydDIs
IHdkdCwgd2xlZF9hbiwgd2xlZF9rbiwKPiArICAgICAgICAgICAgXQo+ICsKPiArICAgICAgICAg
IGZ1bmN0aW9uOgo+ICsgICAgICAgICAgICBkZXNjcmlwdGlvbjogVGhlIG11eCBmdW5jdGlvbiB0
byBzZWxlY3QuCj4gKyAgICAgICAgICAgIGVudW06IFsKPiArICAgICAgICAgICAgICAjIEZvciBN
VDc2MjAgU29DCj4gKyAgICAgICAgICAgICAgZXBoeSwgZ3BpbywgZ3BpbyBpMnMsIGdwaW8gdWFy
dGYsIGkyYywgaTJzIHVhcnRmLCBtZGlvLCBuYW5kLCBwYSwgcGNpZSByZWZjbGssIHBjaWUgcnN0
LAo+ICsgICAgICAgICAgICAgIHBjbSBncGlvLCBwY20gaTJzLCBwY20gdWFydGYsIHJlZmNsaywg
cmdtaWkxLCByZ21paTIsIHNkLCBzcGksIHNwaSByZWZjbGssIHVhcnRmLCB1YXJ0bGl0ZSwKPiAr
ICAgICAgICAgICAgICB3ZHQgcmVmY2xrLCB3ZHQgcnN0LCB3bGVkLAo+ICsKPiArICAgICAgICAg
ICAgICAjIEZvciBNVDc2MjggYW5kIE1UNzY4OCBTb0NzCj4gKyAgICAgICAgICAgICAgYW50ZW5u
YSwgZGVidWcsIGdwaW8sIGkyYywgaTJzLCBqdGFnLCBwMGxlZF9hbiwgcDBsZWRfa24sIHAxbGVk
X2FuLCBwMWxlZF9rbiwgcDJsZWRfYW4sCj4gKyAgICAgICAgICAgICAgcDJsZWRfa24sIHAzbGVk
X2FuLCBwM2xlZF9rbiwgcDRsZWRfYW4sIHA0bGVkX2tuLCBwY2llLCBwY20sIHBlcnN0LCBwd20s
IHB3bTAsIHB3bTEsCj4gKyAgICAgICAgICAgICAgcHdtX3VhcnQyLCByZWZjbGssIHJzdmQsIHNk
eGMsIHNkeGMgZDUgZDQsIHNkeGMgZDYsIHNkeGMgZDcsIHNwaSwgc3BpIGNzMSwgc3Bpcywgc3df
ciwgdWFydDAsCj4gKyAgICAgICAgICAgICAgdWFydDEsIHVhcnQyLCB1dGlmLCB3ZHQsIHdsZWRf
YW4sIHdsZWRfa24sIC0sCgpBbGwgdGhlc2UgbGluZXMgZG8gbm90IGZpdCBpbiA4MC1jaGFyYWN0
ZXIgbGltaXQuIExpbnV4IGNvZGluZyBzdHlsZQpzdGlsbCBleHBlY3RzIHRoaXMgaW4gbW9zdCBv
ZiBjYXNlcy4KCj4gKyAgICAgICAgICAgIF0KPiArCgpCZXN0IHJlZ2FyZHMsCktyenlzenRvZgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVk
aWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
