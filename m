Return-Path: <SRS0=IDfX=PQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A64E8C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Oct 2021 01:59:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FAC561130
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Oct 2021 01:59:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5FAC561130
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Oy6lAf2eHGvyQmbZMqKMavw4MeIEMa3f74sNKVkzRzw=; b=pnqBju+gNXIb7N
	OwbjQuTki1QAYvLxzse639drJis4N10aX+2eMk5sVAONhmlRGM1qpKJfxtSLqYKcg9+f3DiUWQCc5
	tRdHBzT0RrDQp1RhOedDSOvP1l3r8lNAM82i9Ja23/vrL3Xb80OpOQ5dCYIhvXpvGDyVoo4MqKaZ5
	pZS40pHvd9b6gKPuJSKic13a1WPc7ZUY5HqupfkJaZEOTsLK+Lh0fUuTVSXbBolqJoAkSolzwo3zj
	2hsR6bXQWrdx7FffwBPkns3LEgY+w6EY8OxOl1p6irRtMZyT1XmlxTHCWrv+6WImAXB0FWFtYDBA7
	CE20J4G+Rki27kBOfjRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfuh0-006hoe-Vs; Thu, 28 Oct 2021 01:58:59 +0000
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfugn-006hn4-RT; Thu, 28 Oct 2021 01:58:47 +0000
Received: by mail-oi1-x22e.google.com with SMTP id y128so6148983oie.8;
 Wed, 27 Oct 2021 18:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7jA9hLIHv4laXHxexzSur1ceGmoR/SqF1PV4WEQNyWQ=;
 b=Z54xrm2gRnEUeTcTgy6Nkyf1v5dmkb0fpPRP2+0t1b699lLzBQS98XejaLKV5HKgRm
 H+f9/M1tAKy2S18OKxIGr2MbpPORPo5JIqUemrOPxZAKC/DcNypewcVe3VA5n9Wwhy7I
 5rqSsOtVDqFdYsMUpcUfa9XA1Vg1RTSNdqUPAUpaj5l8HCvm23MnLkhV2S32ODoBRXNa
 uhr3jtIr0ljqaNLH3c3HIZ3qoUfSFO8Ev4AI31BgJcwH6KC8baGgm/0nvd57THdQNwAa
 RUgvVWzHCVAzbz4tJ2mJD8HoCRSSJL2FjiNuxU9CVbqnWtmrSq3TsrNOAqKI4IYJ+ipf
 PIbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7jA9hLIHv4laXHxexzSur1ceGmoR/SqF1PV4WEQNyWQ=;
 b=YW4BYXOtWFgEKg6d2FHfwViWeJZQwRTopDzPhnWXJcS+7nIecfKYmtQyBj+csB1b+0
 fXXLazLg1iCx3NYsvjY1sWPcJj2NMwq7FTX27ni25R/4mxGAWT3PhlOXdaM4q/kNDUYP
 lW9v33xjtlBpc50f20kidRJCUG1saxmmyUtnhR/LTuPGCcri5JIOioSo+A5CfClgL3Sd
 VWvw5F2v0ZpHIQY8BuY0WvU/Aoion7MX+rWPMZm7DYHt1LtxQALAQQMzWaNfbzLtKfPL
 WzJFQDT8eXeeyQPIBqXUaV7mrvpOCoe/zPh9Fqm+m8IP0ZR5ZpSxpQbv15JBjW7pXu8N
 94ZA==
X-Gm-Message-State: AOAM53258ZsMTOhX+z2evU8BI3LbdcAP8wkHF9cTLzkee3oAvNJrEO2Y
 gvWLoWEwb+qh+VeJmg+sbOx55A9WYxu75OIZhFfHn8Np750sFg==
X-Google-Smtp-Source: ABdhPJzc4Eg531WD9FCIFPO/5/Z8QggwFWCwun14/4nZpu/HeSctOteECf6GvkujIih+6j1+vvTExofrv8BRz9dLyzo=
X-Received: by 2002:a05:6808:f13:: with SMTP id
 m19mr6332500oiw.37.1635386324816; 
 Wed, 27 Oct 2021 18:58:44 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1635333327.git.siyanteng@loongson.cn>
 <abead7ae64e1a0cc96a09647a5facf30d03381aa.1635333327.git.siyanteng@loongson.cn>
 <CAMhs-H8m0Un+njhw0nZKUrxzMxqfpj8YwGb==7GAoV=Kq-ey=w@mail.gmail.com>
In-Reply-To: <CAMhs-H8m0Un+njhw0nZKUrxzMxqfpj8YwGb==7GAoV=Kq-ey=w@mail.gmail.com>
From: yanteng si <siyanteng01@gmail.com>
Date: Thu, 28 Oct 2021 09:58:32 +0800
Message-ID: <CAEensMx+veP1rWUQ0XZkOjveHU9P+2L_RXGBTc_YtOg0YN6-jA@mail.gmail.com>
Subject: Re: [PATCH 2/2] PCI: mt7621: Export mips_cm/cpc/gcr_* to modules
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: Yanteng Si <siyanteng@loongson.cn>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, 
 Rob Herring <robh@kernel.org>, kw@linux.com,
 Bjorn Helgaas <bhelgaas@google.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 linux-pci <linux-pci@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "open list:MIPS" <linux-mips@vger.kernel.org>, 
 Huacai Chen <chenhuacai@kernel.org>, sterling <sterlingteng@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_185845_924895_06DA6810 
X-CRM114-Status: GOOD (  19.48  )
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

U2VyZ2lvIFBhcmFjdWVsbG9zIDxzZXJnaW8ucGFyYWN1ZWxsb3NAZ21haWwuY29tPiDkuo4yMDIx
5bm0MTDmnIgyN+aXpeWRqOS4iSDkuIvljYg3OjQ15YaZ6YGT77yaCj4KPiBIaSwKPgo+IE9uIFdl
ZCwgT2N0IDI3LCAyMDIxIGF0IDE6MzIgUE0gWWFudGVuZyBTaSA8c2l5YW50ZW5nMDFAZ21haWwu
Y29tPiB3cm90ZToKPiA+Cj4gPiBtb2Rwb3N0IGNvbXBsYWlucyBvbmNlIHRoZXNlIGRyaXZlcnMg
YmVjb21lIG1vZHVsZXMuCj4gPgo+ID4gRVJST1I6IG1vZHBvc3Q6ICJtaXBzX2NtX3VubG9ja19v
dGhlciIgW2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNpZS1tdDc2MjEua29dIHVuZGVmaW5lZCEK
PiA+IEVSUk9SOiBtb2Rwb3N0OiAibWlwc19jcGNfYmFzZSIgW2RyaXZlcnMvcGNpL2NvbnRyb2xs
ZXIvcGNpZS1tdDc2MjEua29dIHVuZGVmaW5lZCEKPiA+IEVSUk9SOiBtb2Rwb3N0OiAibWlwc19j
bV9sb2NrX290aGVyIiBbZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2llLW10NzYyMS5rb10gdW5k
ZWZpbmVkIQo+ID4gRVJST1I6IG1vZHBvc3Q6ICJtaXBzX2NtX2lzNjQiIFtkcml2ZXJzL3BjaS9j
b250cm9sbGVyL3BjaWUtbXQ3NjIxLmtvXSB1bmRlZmluZWQhCj4gPiBFUlJPUjogbW9kcG9zdDog
Im1pcHNfZ2NyX2Jhc2UiIFtkcml2ZXJzL3BjaS9jb250cm9sbGVyL3BjaWUtbXQ3NjIxLmtvXSB1
bmRlZmluZWQhCj4gPgo+ID4gTGV0J3MganVzdCBleHBvcnQgdGhlbS4KPiA+Cj4gPiBTaWduZWQt
b2ZmLWJ5OiBZYW50ZW5nIFNpIDxzaXlhbnRlbmdAbG9vbmdzb24uY24+Cj4gPiAtLS0KPiA+ICBh
cmNoL21pcHMva2VybmVsL21pcHMtY20uYyAgfCA1ICsrKysrCj4gPiAgYXJjaC9taXBzL2tlcm5l
bC9taXBzLWNwYy5jIHwgMSArCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykK
Pgo+IFRoaXMgUEFUQ0ggaGFzIHRoZSBwcmVmaXggIlBDSTogbXQ3NjIxOiAiIGJ1dCB0aGUgY2hh
bmdlcyBoZXJlIGFyZSBhbGwKPiBtaXBzIGtlcm5lbCB0aGluZ3MuIFNvIEkgZ3Vlc3MgaXQgaXMg
YmV0dGVyIHRvIGhhdmUgIk1JUFM6IGNtL2NwYzoKPiBleHBvcnQgc29tZSBtaXNzaW5nIHN5bWJv
bHMgdG8gYmUgYWJsZSB0byB1c2UgdGhlbSBmcm9tIGRyaXZlciBjb2RlIgpPSyxUaGFua3MhCj4g
b3Igc29tZXRoaW5nIHNpbWlsYXIuIEkgYW0gbm90IHRoZSBiZXN0IHdpdGggd29yZHMgOikuCk1l
IHRvby4gPl88Cj4KPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9taXBzL2tlcm5lbC9taXBzLWNt
LmMgYi9hcmNoL21pcHMva2VybmVsL21pcHMtY20uYwo+ID4gaW5kZXggOTBmMWMzZGYxZjBlLi5i
MDdmMjAzMjMxMzIgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL21pcHMva2VybmVsL21pcHMtY20uYwo+
ID4gKysrIGIvYXJjaC9taXBzL2tlcm5lbC9taXBzLWNtLmMKPiA+IEBAIC0xMiw4ICsxMiwxMSBA
QAo+ID4gICNpbmNsdWRlIDxhc20vbWlwc3JlZ3MuaD4KPiA+Cj4gPiAgdm9pZCBfX2lvbWVtICpt
aXBzX2djcl9iYXNlOwo+ID4gK0VYUE9SVF9TWU1CT0wobWlwc19nY3JfYmFzZSk7Cj4KPiBFWFBP
UlRfU1lNQk9MX0dQTD8KT0suIFRoYW5rcyEKPgo+ID4gKwo+ID4gIHZvaWQgX19pb21lbSAqbWlw
c19jbV9sMnN5bmNfYmFzZTsKPiA+ICBpbnQgbWlwc19jbV9pczY0Owo+ID4gK0VYUE9SVF9TWU1C
T0wobWlwc19jbV9pczY0KTsKPiA+Cj4gPiAgc3RhdGljIGNoYXIgKmNtMl90cls4XSA9IHsKPiA+
ICAgICAgICAgIm1lbSIsICAiZ2NyIiwgICJnaWMiLCAgIm1taW8iLAo+ID4gQEAgLTM1Myw2ICsz
NTYsNyBAQCB2b2lkIG1pcHNfY21fbG9ja19vdGhlcih1bnNpZ25lZCBpbnQgY2x1c3RlciwgdW5z
aWduZWQgaW50IGNvcmUsCj4gPiAgICAgICAgICAqLwo+ID4gICAgICAgICBtYigpOwo+ID4gIH0K
PiA+ICtFWFBPUlRfU1lNQk9MKG1pcHNfY21fbG9ja19vdGhlcik7Cj4KPiBkaXR0by4KT0suIFRo
YW5rcyEKPgo+ID4KPiA+ICB2b2lkIG1pcHNfY21fdW5sb2NrX290aGVyKHZvaWQpCj4gPiAgewo+
ID4gQEAgLTM2OSw2ICszNzMsNyBAQCB2b2lkIG1pcHNfY21fdW5sb2NrX290aGVyKHZvaWQpCj4g
Pgo+ID4gICAgICAgICBwcmVlbXB0X2VuYWJsZSgpOwo+ID4gIH0KPiA+ICtFWFBPUlRfU1lNQk9M
KG1pcHNfY21fdW5sb2NrX290aGVyKTsKPgo+IGRpdHRvLgpPSy4gVGhhbmtzIQo+Cj4gPgo+ID4g
IHZvaWQgbWlwc19jbV9lcnJvcl9yZXBvcnQodm9pZCkKPiA+ICB7Cj4gPiBkaWZmIC0tZ2l0IGEv
YXJjaC9taXBzL2tlcm5lbC9taXBzLWNwYy5jIGIvYXJjaC9taXBzL2tlcm5lbC9taXBzLWNwYy5j
Cj4gPiBpbmRleCA4ZDI1MzUxMjNmMTEuLmRmZDNkNThmZDQxMiAxMDA2NDQKPiA+IC0tLSBhL2Fy
Y2gvbWlwcy9rZXJuZWwvbWlwcy1jcGMuYwo+ID4gKysrIGIvYXJjaC9taXBzL2tlcm5lbC9taXBz
LWNwYy5jCj4gPiBAQCAtMTMsNiArMTMsNyBAQAo+ID4gICNpbmNsdWRlIDxhc20vbWlwcy1jcHMu
aD4KPiA+Cj4gPiAgdm9pZCBfX2lvbWVtICptaXBzX2NwY19iYXNlOwo+ID4gK0VYUE9SVF9TWU1C
T0wobWlwc19jcGNfYmFzZSk7Cj4KPiBkaXR0by4KT0suIFRoYW5rcyEKClRoYW5rcywKeWFudGVu
Zwo+Cj4gPgo+ID4gIHN0YXRpYyBERUZJTkVfUEVSX0NQVV9BTElHTkVEKHNwaW5sb2NrX3QsIGNw
Y19jb3JlX2xvY2spOwo+ID4KPiA+IC0tCj4gPiAyLjI3LjAKPiA+Cj4KPiBUaGFua3MsCj4gICAg
IFNlcmdpbyBQYXJhY3VlbGxvcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tZWRpYXRlawo=
