Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0295DC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Apr 2022 15:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5ae6QH8wzJh74LS8dFcDFlUOHMhw6x+g+unISAaQ/uI=; b=f33gedPGiER4oC
	HiWobqEn5oON8h+fTV0eWV3Joxlj8qPaomzB/Hp5i7jh3zUXJEWy5WRgYHaZunTio+zvUIdqt1Xu1
	z0W0Tl+2F9TWSANpHUXhy2EksoSF0RsTuTbBSQQxwvGphV/de1GLrb2pDAMbkwkDwT+B5ElNWpTve
	utTjzfMCJ8OddDiputLa3Ohgwow6alsPig3o5OB2EOeF75DxVQEeh3FAqhwCWcWoNRRdZkQAz6jzz
	fzgxSexhfVN0nLx74+o+X8jbT21WwKeFSCQRpu+mO+55J3BWTyUPaW+/IoHF6vcJACdZaini95eL2
	OXFUdfV9wfm4RvBqoBhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neesD-001aDc-CJ; Wed, 13 Apr 2022 15:25:37 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neesA-001aC9-9I
 for linux-mediatek@lists.infradead.org; Wed, 13 Apr 2022 15:25:36 +0000
Received: by mail-ej1-x62c.google.com with SMTP id k23so4710230ejd.3
 for <linux-mediatek@lists.infradead.org>; Wed, 13 Apr 2022 08:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=E/KosFpseT7IWJRZQCnSiS447R6ssnKcrthoESTGiCY=;
 b=Vh4Nsq/68C5HjeI3A+yT1TCrzlxkKT0sfz8S3WArS7wXqU2HMY1kjSoZ15QEZmFtM6
 OFYv1iWTnr+tlMIiILChInAOK+egjDR+MtIwNLJlFgSPS0IaHvcSB/B8FcrmDr+ZyIDg
 IiiQB3pNO94TEGvLWtXS/CjPEk0O7T7J0MsTPVtfkCt+WO4kRbnT4evsF7X3kPB8ayF4
 5J/XJAFVO/Wopdl0EmW8QilO0Iz/XWwoNMkPhoQJPNm2KavV8w9DXemGntKKxv+uKR1E
 Mxe3ylpT7zTGScy4KM865rbxBZMJ4K0dj47qLEXSEyh6zUTCCLXrC6xnjkDTbvcgjPHW
 96/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=E/KosFpseT7IWJRZQCnSiS447R6ssnKcrthoESTGiCY=;
 b=vBtYGyDCUK/ybynvMoREfnmUsujDt+PL/sRmx/JoVfSctNwfYyloKR6enal3Lw9ICv
 YdlzNdMRdes0QuAudgyQiaQlPXfAFADb6Cb3XhmteAmypJkM8WQJKmix153pVMlMBLSa
 3S0BPkcrJVzOgRguwamXguVhHtT62pYy9Ea0JobpXkdKp9Rafmj14X5+sTIVmb8EQ4Ab
 h+EZPw/tfF9yWy48G8k1X1bW/eAb8dj1bsYhAZcZP88JI8/SnHqVcHc5VBlzraO2ynJv
 wEyUWnqbNNZ37QeeyXEv+USt1Eo5WSo8ugc8tCLv/yklSdgWygXIEkiC3UL24FPIC4xn
 vflw==
X-Gm-Message-State: AOAM532+GlL6aBulWyXHm0fmi3GzWh7FF1b9tjgreYoxL7ACp99rMTaf
 O0aPabHB5FTcxwB8uTGVMaXuJQ==
X-Google-Smtp-Source: ABdhPJy/Caleobpyz0qcwl3NnfHCSIKGS22hcXQsHSSVLfDURXci+05UMvKVZOUGgl9LtMNCuV3Fuw==
X-Received: by 2002:a17:907:2d27:b0:6e8:3ea6:7645 with SMTP id
 gs39-20020a1709072d2700b006e83ea67645mr28970048ejc.727.1649863531801; 
 Wed, 13 Apr 2022 08:25:31 -0700 (PDT)
Received: from [192.168.0.205] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 h7-20020a1709060f4700b006e8d0746969sm83440ejj.222.2022.04.13.08.25.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Apr 2022 08:25:30 -0700 (PDT)
Message-ID: <ba7cd13f-d216-0ac6-97e1-6c13f1e15f38@linaro.org>
Date: Wed, 13 Apr 2022 17:25:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 10/14] dt-bindings: pinctrl: rt2880: fix binding name, pin
 groups and functions
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
 <20220413060729.27639-11-arinc.unal@arinc9.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220413060729.27639-11-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_082534_440754_46CA100C 
X-CRM114-Status: GOOD (  17.97  )
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

T24gMTMvMDQvMjAyMiAwODowNywgQXLEsW7DpyDDnE5BTCB3cm90ZToKPiBDaGFuZ2UgYmluZGlu
ZyBuYW1lIGZyb20gcmFsaW5rLHJ0Mjg4MC1waW5tdXggdG8gcmFsaW5rLHJ0Mjg4MC1waW5jdHJs
Lgo+IFRoaXMgaXMgdGhlIGJpbmRpbmcgZm9yIHRoZSBSYWxpbmsgUlQyODgwIHBpbmN0cmwgc3Vi
ZHJpdmVyLgoKV2hhdCBJIGRvbid0IHNlZSBoZXJlIGlzIHdoeSB5b3UgYXJlIGRvaW5nIHRoaXMu
IHBpbm11eC9waW5jdHJsIGhhdmUgdGhlCnNhbWUgbWVhbmluZywgSSBndWVzcz8KCj4gCj4gQ3Vy
cmVudCBwaW4gZ3JvdXAgYW5kIGZ1bmN0aW9uIGJpbmRpbmdzIGFyZSBmb3IgTVQ3NjIxLiBQdXQg
YmluZGluZ3MgZm9yCj4gUlQyODgwIGluc3RlYWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogQXLEsW7D
pyDDnE5BTCA8YXJpbmMudW5hbEBhcmluYzkuY29tPgo+IC0tLQo+ICAuLi5waW5tdXgueWFtbCA9
PiByYWxpbmsscnQyODgwLXBpbmN0cmwueWFtbH0gfCAyNCArKysrKysrKystLS0tLS0tLS0tCj4g
IDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKPiAgcmVu
YW1lIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL3tyYWxpbmsscnQy
ODgwLXBpbm11eC55YW1sID0+IHJhbGluayxydDI4ODAtcGluY3RybC55YW1sfSAoNTYlKQo+IAo+
IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9y
YWxpbmsscnQyODgwLXBpbm11eC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3BpbmN0cmwvcmFsaW5rLHJ0Mjg4MC1waW5jdHJsLnlhbWwKPiBzaW1pbGFyaXR5IGluZGV4
IDU2JQo+IHJlbmFtZSBmcm9tIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5j
dHJsL3JhbGluayxydDI4ODAtcGlubXV4LnlhbWwKPiByZW5hbWUgdG8gRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvcmFsaW5rLHJ0Mjg4MC1waW5jdHJsLnlhbWwKPiBp
bmRleCA5ZGU4YjBjMDc1ZTIuLmM2NTdiYmY5ZmRkYSAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9yYWxpbmsscnQyODgwLXBpbm11eC55YW1s
Cj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvcmFsaW5r
LHJ0Mjg4MC1waW5jdHJsLnlhbWwKPiBAQCAtMSwyMSArMSwyMyBAQAo+ICAjIFNQRFgtTGljZW5z
ZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlCj4gICVZQU1MIDEuMgo+
ICAtLS0KPiAtJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9waW5jdHJsL3JhbGlu
ayxydDI4ODAtcGlubXV4LnlhbWwjCj4gKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVt
YXMvcGluY3RybC9yYWxpbmsscnQyODgwLXBpbmN0cmwueWFtbCMKPiAgJHNjaGVtYTogaHR0cDov
L2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCj4gIAo+IC10aXRsZTogUmFs
aW5rIHJ0Mjg4MCBwaW5tdXggY29udHJvbGxlcgo+ICt0aXRsZTogUmFsaW5rIFJUMjg4MCBQaW4g
Q29udHJvbGxlcgo+ICAKPiAgbWFpbnRhaW5lcnM6Cj4gKyAgLSBBcsSxbsOnIMOcTkFMIDxhcmlu
Yy51bmFsQGFyaW5jOS5jb20+CgpNZW50aW9uIHRoaXMgaW4gY29tbWl0IG1zZy4KCj4gICAgLSBT
ZXJnaW8gUGFyYWN1ZWxsb3MgPHNlcmdpby5wYXJhY3VlbGxvc0BnbWFpbC5jb20+Cj4gIAo+ICBk
ZXNjcmlwdGlvbjoKPiAtICBUaGUgcnQyODgwIHBpbm11eCBjYW4gb25seSBzZXQgdGhlIG11eGlu
ZyBvZiBwaW4gZ3JvdXBzLiBNdXhpbmcgaW5kaXZpdWFsIHBpbnMKPiArICBSYWxpbmsgUlQyODgw
IHBpbiBjb250cm9sbGVyIGZvciBSVDI4ODAgU29DLgo+ICsgIFRoZSBwaW4gY29udHJvbGxlciBj
YW4gb25seSBzZXQgdGhlIG11eGluZyBvZiBwaW4gZ3JvdXBzLiBNdXhpbmcgaW5kaXZpdWFsIHBp
bnMKPiAgICBpcyBub3Qgc3VwcG9ydGVkLiBUaGVyZSBpcyBubyBwaW5jb25mIHN1cHBvcnQuCj4g
IAo+ICBwcm9wZXJ0aWVzOgo+ICAgIGNvbXBhdGlibGU6Cj4gLSAgICBjb25zdDogcmFsaW5rLHJ0
Mjg4MC1waW5tdXgKPiArICAgIGNvbnN0OiByYWxpbmsscnQyODgwLXBpbmN0cmwKCnlvdSBuZWVk
IHRvIGRlcHJlY2F0ZSBvbGQgcHJvcGVydHkgYW5kIGFkZCBhIG5ldyBvbmUuCgoKPiAgCj4gIHBh
dHRlcm5Qcm9wZXJ0aWVzOgo+ICAgICctcGlucyQnOgo+IEBAIC0yOCwxNCArMzAsMTIgQEAgcGF0
dGVyblByb3BlcnRpZXM6Cj4gIAo+ICAgICAgICAgIHByb3BlcnRpZXM6Cj4gICAgICAgICAgICBn
cm91cHM6Cj4gLSAgICAgICAgICAgIGRlc2NyaXB0aW9uOiBOYW1lIG9mIHRoZSBwaW4gZ3JvdXAg
dG8gdXNlIGZvciB0aGUgZnVuY3Rpb25zLgo+IC0gICAgICAgICAgICBlbnVtOiBbaTJjLCBqdGFn
LCBtZGlvLCBwY2llLCByZ21paTEsIHJnbWlpMiwgc2RoY2ksIHNwaSwKPiAtICAgICAgICAgICAg
ICAgICAgIHVhcnQxLCB1YXJ0MiwgdWFydDMsIHdkdF0KPiArICAgICAgICAgICAgZGVzY3JpcHRp
b246IFRoZSBwaW4gZ3JvdXAgdG8gc2VsZWN0Lgo+ICsgICAgICAgICAgICBlbnVtOiBbaTJjLCBz
cGksIHVhcnRsaXRlLCBqdGFnLCBtZGlvLCBzZHJhbSwgcGNpXQo+ICsKPiAgICAgICAgICAgIGZ1
bmN0aW9uOgo+IC0gICAgICAgICAgICBkZXNjcmlwdGlvbjogVGhlIG11eCBmdW5jdGlvbiB0byBz
ZWxlY3QKPiAtICAgICAgICAgICAgZW51bTogW2dwaW8sIGkyYywgaTJzLCBqdGFnLCBtZGlvLCBu
YW5kMSwgbmFuZDIsIHBjaWUgcmVmY2xrLAo+IC0gICAgICAgICAgICAgICAgICAgcGNpZSByc3Qs
IHBjbSwgcmdtaWkxLCByZ21paTIsIHNkaGNpLCBzcGRpZjIsIHNwZGlmMywKPiAtICAgICAgICAg
ICAgICAgICAgIHNwaSwgdWFydDEsIHVhcnQyLCB1YXJ0Mywgd2R0IHJlZmNsaywgd2R0IHJzdF0K
PiArICAgICAgICAgICAgZGVzY3JpcHRpb246IFRoZSBtdXggZnVuY3Rpb24gdG8gc2VsZWN0Lgo+
ICsgICAgICAgICAgICBlbnVtOiBbZ3BpbywgaTJjLCBzcGksIHVhcnRsaXRlLCBqdGFnLCBtZGlv
LCBzZHJhbSwgcGNpXQo+ICAKClRoZXNlIHdlcmUgYWxsIGluY29ycmVjdCBmb3IgcnQyODgwLCBJ
IHVuZGVyc3RhbmQ/CgoKQmVzdCByZWdhcmRzLApLcnp5c3p0b2YKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlz
dApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
