Return-Path: <SRS0=O+qu=CH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8D83C433E6
	for <linux-mediatek@archiver.kernel.org>; Sat, 29 Aug 2020 00:33:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9765220838
	for <linux-mediatek@archiver.kernel.org>; Sat, 29 Aug 2020 00:33:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qNM9950Q";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Slr/pUQw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9765220838
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XKqn2bQvcH2YaTOuHCn8navOf/cCIz0zrd9jMKAdi9Q=; b=qNM9950QWrRPMCwg2v2ZWEs3M
	BtEwMz1R+MpabfMcvdH/MqEnSdHj69WZNb15dNYQKJRe61vTng9Co/k5fSLeRels9bm4FBaFmdJTT
	LIzpZ+6zkfeESLhch3RMrZbUS7i/c8Lvs+sT9/hJljwL3qpKj6iITlWlM6hSue7OkoeH1qLRAewLa
	TRCrLyZZHydIoTy7WCcivNWxBnvF027QPDXlZWfSH2ipL/d75YGXBq6PegbtgsX1dJDvw0iFtulw4
	JlOZo3RSvG2/kgSuwhTwpCyPtgq+427eIt0Ygo+Fmt0KuN9t5O6JsyoK1czfv6SEu+BeMCsBDk8md
	+896EeS6w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBonk-0002Er-CI; Sat, 29 Aug 2020 00:33:00 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBonf-0002Bn-C6; Sat, 29 Aug 2020 00:32:56 +0000
Received: by mail-lj1-x243.google.com with SMTP id m22so743026ljj.5;
 Fri, 28 Aug 2020 17:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Q4A82mtCc9iYOPIj+bFVS82orE8e7VuC4YeTmwqXG+s=;
 b=Slr/pUQw1t8UoOJU5VeyQFoLenqR1BiUzrqhrKMZPQm1JTSd9RDdmgv/9dp0l3ZECq
 1Elsglq7MQTihUZs+t1cJk090e/IlIY0KpcVfxclo8MMPcUGU+rhMhPtbiuSQeAwVxOc
 bhZbNqsV4fwiVy5SpmVnOHDZC2tl7M/sbhjp0Tg31MFghgWP5vHyNOEquslTpmtX/Kjp
 XFndJp+fJ1xcr32Ranos15HzQvHehl+K18zTSooU5F6ff7miuMaviXGeoVimyeSK/ceg
 ZN4ZYY7vGAwwuURaELHDrwPGt5RcqiIU609+zli4m0GeoWgRS29l99SP43aBC2dJb/hM
 fHCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Q4A82mtCc9iYOPIj+bFVS82orE8e7VuC4YeTmwqXG+s=;
 b=bD7ZeyeFmXNzqMjRtaCxSjUzlMuxsNSc3TSh/uKoZYkIeGDYFjeF4G092DYEH7BGyy
 M8KXPEtxBhumMoY/ICx7JmEfLuFwcbtBcayaiIwRgiLB4JuUk3sEZReKzvM8zGxF3KhC
 decRPB2wH15jtev17/7jZU8IsaP8LYyvdx+ZbOg7ZMIi8lLdzsa44BDkbQLDTPvgGxKI
 UYvYqTM8FS2XpkQ4FMnEtpSfxkZNWdku19lAE4j8/h+wGIOcYjHMqxcsGewK7jcItU5P
 P+CiOIsazPBgY3VCM0UCa03VEFT/EhItHww6J/kuiNLwpF5qBSgIJRfULek6NwH2M6zo
 zyiA==
X-Gm-Message-State: AOAM530lI5etdRQG2JLQGVfwfqxAb6XCrBrONgji1KjtMj4/x1LgiEcu
 LOoZYZrZrdoOc26+B4KlKEPS2Jl7mMKEMz8YUHEoCLlVysQ=
X-Google-Smtp-Source: ABdhPJwxuZiutFx6DCExGhPgSPZJudtRPRCwk1BePpD0DQiw64l4IZB7D68PBza2Vy1/AVUPcTaoe8fyijJJOoczAPQ=
X-Received: by 2002:a2e:b009:: with SMTP id y9mr496183ljk.119.1598661173880;
 Fri, 28 Aug 2020 17:32:53 -0700 (PDT)
MIME-Version: 1.0
References: <1598610636-4939-1-git-send-email-u0084500@gmail.com>
 <1598610636-4939-2-git-send-email-u0084500@gmail.com>
 <20200828220520.GA3482472@bogus>
In-Reply-To: <20200828220520.GA3482472@bogus>
From: ChiYuan Huang <u0084500@gmail.com>
Date: Sat, 29 Aug 2020 08:32:42 +0800
Message-ID: <CADiBU3-pd7nvtf2_1ssYVLQc4HOHX6PUyyx6GiJ_gH-4DaGmog@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] usb typec: mt6360: Add MT6360 Type-C DT binding
 documentation
To: Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200828_203255_442632_845C9674 
X-CRM114-Status: GOOD (  22.20  )
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
Cc: gene_chen@richtek.com, devicetree@vger.kernel.org,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, cy_huang <cy_huang@richtek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 matthias.bgg@gmail.com, Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Um9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4g5pa8IDIwMjDlubQ45pyIMjnml6Ug6YCx5YWt
IOS4iuWNiDY6MDXlr6vpgZPvvJoKPgo+IE9uIEZyaSwgQXVnIDI4LCAyMDIwIGF0IDA2OjMwOjM2
UE0gKzA4MDAsIGN5X2h1YW5nIHdyb3RlOgo+ID4gRnJvbTogQ2hpWXVhbiBIdWFuZyA8Y3lfaHVh
bmdAcmljaHRlay5jb20+Cj4gPgo+ID4gQWRkIGEgZGV2aWNldHJlZSBiaW5kaW5nIGRvY3VtZW50
YXRpb24gZm9yIHRoZSBNVDYzNjAgVHlwZS1DIGRyaXZlci4KPiA+Cj4gPiB1c2IgdHlwZWM6IG10
NjM2MDogUmVuYW1lIERUIGJpbmRpbmcgZG91bWVudCBmcm9tIG10NjM2MCB0byBtdDYzNngKPiA+
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBDaGlZdWFuIEh1YW5nIDxjeV9odWFuZ0ByaWNodGVrLmNvbT4K
PiA+IC0tLQo+ID4gIC4uLi9iaW5kaW5ncy91c2IvbWVkaWF0ZWssbXQ2MzYwLXRjcGMueWFtbCAg
ICAgICAgIHwgNzMgKysrKysrKysrKysrKysrKysrKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA3
MyBpbnNlcnRpb25zKCspCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy91c2IvbWVkaWF0ZWssbXQ2MzYwLXRjcGMueWFtbAo+ID4KPiA+IGRp
ZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL21lZGlhdGVr
LG10NjM2MC10Y3BjLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNi
L21lZGlhdGVrLG10NjM2MC10Y3BjLnlhbWwKPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiBp
bmRleCAwMDAwMDAwMC4uOWU4YWIwZAo+ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9tZWRpYXRlayxtdDYzNjAtdGNwYy55YW1s
Cj4gPiBAQCAtMCwwICsxLDczIEBACj4gPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQ
TC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpCj4gPiArJVlBTUwgMS4yCj4gPiArLS0tCj4gPiAr
JGlkOiAiaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvdXNiL21lZGlhdGVrLG10NjM2MC10
Y3BjLnlhbWwjIgo+ID4gKyRzY2hlbWE6ICJodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hl
bWFzL2NvcmUueWFtbCMiCj4gPiArCj4gPiArdGl0bGU6IE1lZGlhdGVrIE1UNjM2MCBUeXBlLUMg
UG9ydCBTd2l0Y2ggYW5kIFBvd2VyIERlbGl2ZXJ5IGNvbnRyb2xsZXIgRFQgYmluZGluZ3MKPiA+
ICsKPiA+ICttYWludGFpbmVyczoKPiA+ICsgIC0gQ2hpWXVhbiBIdWFuZyA8Y3lfaHVhbmdAcmlj
aHRlay5jb20+Cj4gPiArCj4gPiArZGVzY3JpcHRpb246IHwKPiA+ICsgIE1lZGlhdGVrIE1UNjM2
MCBpcyBhIG11bHRpLWZ1bmN0aW9uYWwgZGV2aWNlLiBJdCBpbnRlZ3JhdGVzIGNoYXJnZXIsIEFE
QywgZmxhc2gsIFJHQiBpbmRpY2F0b3JzLAo+ID4gKyAgcmVndWxhdG9ycyAoQlVDS3MvTERPcyks
IGFuZCBUeXBlQyBQb3J0IFN3aXRjaCB3aXRoIFBvd2VyIERlbGl2ZXJ5IGNvbnRyb2xsZXIuCj4g
PiArICBUaGlzIGRvY3VtZW50IG9ubHkgZGVzY3JpYmVzIE1UNjM2MCBUeXBlLUMgUG9ydCBTd2l0
Y2ggYW5kIFBvd2VyIERlbGl2ZXJ5IGNvbnRyb2xsZXIuCj4gPiArCj4gPiArcHJvcGVydGllczoK
PiA+ICsgIGNvbXBhdGlibGU6Cj4gPiArICAgIGVudW06Cj4gPiArICAgICAgLSBtZWRpYXRlayxt
dDYzNjAtdGNwYwo+ID4gKwo+ID4gKyAgaW50ZXJydXB0cy1leHRlbmRlZDoKPgo+IFVzZSAnaW50
ZXJydXB0cycuIFRoZSB0b29saW5nIHdpbGwgYXV0b21hdGljYWxseSBzdXBwb3J0Cj4gJ2ludGVy
cnVwdHMtZXh0ZW5kZWQnLgpPa2F5Lgo+Cj4gPiArICAgIG1heEl0ZW1zOiAxCj4gPiArCj4gPiAr
ICBpbnRlcnJ1cHQtbmFtZXM6Cj4gPiArICAgIGl0ZW1zOgo+ID4gKyAgICAgIC0gY29uc3Q6IFBE
X0lSUUIKPiA+ICsKPiA+ICtwYXR0ZXJuUHJvcGVydGllczoKPiA+ICsgICJjb25uZWN0b3IiOgo+
ID4gKyAgICB0eXBlOiBvYmplY3QKPiA+ICsgICAgJHJlZjogLi4vY29ubmVjdG9yL3VzYi1jb25u
ZWN0b3IueWFtbCMKPiA+ICsgICAgZGVzY3JpcHRpb246Cj4gPiArICAgICAgUHJvcGVydGllcyBm
b3IgdXNiIGMgY29ubmVjdG9yLgo+ID4gKwo+ID4gK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxz
ZQo+ID4gKwo+ID4gK3JlcXVpcmVkOgo+ID4gKyAgLSBjb21wYXRpYmxlCj4gPiArICAtIGludGVy
cnVwdHMtZXh0ZW5kZWQKPiA+ICsgIC0gaW50ZXJydXB0LW5hbWVzCj4gPiArCj4gPiArZXhhbXBs
ZXM6Cj4gPiArICAtIHwKPiA+ICsgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2ludGVycnVwdC1j
b250cm9sbGVyL2lycS5oPgo+ID4gKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvdXNiL3BkLmg+
Cj4gPiArICAgIGkyYzAgewo+ID4gKyAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47Cj4gPiAr
ICAgICAgICAjc2l6ZS1jZWxscyA9IDwwPjsKPiA+ICsKPiA+ICsgICAgICAgIG10NjM2MEAzNCB7
Cj4gPiArICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDYzNjAiOwo+ID4gKyAg
ICAgICAgICAgIHJlZyA9IDwweDM0PjsKPiA+ICsKPiA+ICsgICAgICAgICAgICB0Y3BjIHsKPiA+
ICsgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDYzNjAtdGNwYyI7Cj4g
PiArICAgICAgICAgICAgICAgIGludGVycnVwdHMtZXh0ZW5kZWQgPSA8JmdwaW8yNiAzIElSUV9U
WVBFX0xFVkVMX0xPVz47Cj4gPiArICAgICAgICAgICAgICAgIGludGVycnVwdC1uYW1lcyA9ICJQ
RF9JUlFCIjsKPiA+ICsKPiA+ICsgICAgICAgICAgICAgICAgY29ubmVjdG9yIHsKPgo+IFdoZXJl
J3MgdGhlIGRhdGEgY29ubmVjdGlvbnM/IFRoZSBhc3N1bXB0aW9uIG9mIHRoZSBiaW5kaW5nIGlz
IHRoZSBVU0IKPiAoMiBhbmQgMykgY29ubmVjdGlvbnMgY29tZSBmcm9tIHRoZSBwYXJlbnQgaWYg
dGhlcmUncyBubyBncmFwaCB0byB0aGUKPiBVU0IgY29udHJvbGxlcihzKS4KTVQ2MzYwIGlzIG9u
bHkgYSBzdWJwbWljLiBUeXBlQyBwYXJ0IG9ubHkgaGFuZGxlIHRoZSBDQyBsb2dpYyB0byBzdXBw
b3J0IFVTQlBELgpGb3IgdGhlIHVzYiBjb25uZWN0aW9uIGxpa2UgYXMgdXNiaHMvdXNic3MsICBp
dCBuZWVkIHRvIGJlIGhhbmRsZWQKYnkvY29ubmVjdCB0byBhcHBsaWNhdGlvbiBwcm9jZXNzb3Ig
c2lkZS4KTElrZSBhcyBjb25uZWN0b3IvdXNiLWNvbm5lY3Rvci55YW1sIGRlY3JpYmVkLCBpdCAg
c3BlY2lmeSB0aGUgcG9ydApwcm9wZXJ0eSB0byBiaW5kIFVTQiBIUy9TUy4KCj4KPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gInVzYi1jLWNvbm5lY3RvciI7Cj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgbGFiZWwgPSAiVVNCLUMiOwo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgIGRhdGEtcm9sZSA9ICJkdWFsIjsKPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgICBwb3dlci1yb2xlID0gImR1YWwiOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgIHRy
eS1wb3dlci1yb2xlID0gInNpbmsiOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgIHNvdXJj
ZS1wZG9zID0gPFBET19GSVhFRCg1MDAwLCAxMDAwLCBQRE9fRklYRURfRFVBTF9ST0xFIHwgUERP
X0ZJWEVEX0RBVEFfU1dBUCk+Owo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgIHNpbmstcGRv
cyA9IDxQRE9fRklYRUQoNTAwMCwgMjAwMCwgUERPX0ZJWEVEX0RVQUxfUk9MRSB8IFBET19GSVhF
RF9EQVRBX1NXQVApPjsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICBvcC1zaW5rLW1pY3Jv
d2F0dCA9IDwxMDAwMDAwMD47Cj4gPiArICAgICAgICAgICAgICAgIH07Cj4gPiArICAgICAgICAg
ICAgfTsKPiA+ICsgICAgICAgIH07Cj4gPiArICAgIH07Cj4gPiArLi4uCj4gPiAtLQo+ID4gMi43
LjQKPiA+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1l
ZGlhdGVrCg==
