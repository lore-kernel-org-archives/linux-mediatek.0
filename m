Return-Path: <SRS0=YCpt=D3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 404D0C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Oct 2020 09:03:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACA892224F
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Oct 2020 09:03:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jlaAn+h/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gTWnFQUc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ACA892224F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8CB5k652PHAlMncLB5fTYOJyJNKoei2WuvpVjGZZiCg=; b=jlaAn+h/TV3CEcFK/mOPErPzE
	w1TLrHTE3tPMmicuYIOTmCC4UL+SLXQEN5dzJhOuaIVp/MzYPRmvnPYsS8MCVvn2Hecrm1iNfTyut
	chD7zc5b3jCTdaljgMjVioEcJ6ZeFsSyJXetUxfRY1MnVJGdAtCHWR7hlpRhQQ9bm67IlMUc7tzLQ
	WsOQLs3F2pD1EuZBbpFtDfcZ/GLP0+yi3+VGadn2zv/sx8T/8xvl94b1KUWqfjF6GHgpexucBnAn8
	z/f9fUBER/1H6k26IQkcoH5u5R2JXe+mOLKRZ7aCXZkgloEcQ97OdUlufiduFj5IBw7iYvcvFyRie
	HWWAlC6Ww==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUnY6-0005ze-0V; Tue, 20 Oct 2020 09:03:18 +0000
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUnY1-0005y1-1I; Tue, 20 Oct 2020 09:03:14 +0000
Received: by mail-oi1-x242.google.com with SMTP id l4so1372989oii.13;
 Tue, 20 Oct 2020 02:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Gxiv9N5I/0koEZElvdg9/A3+iy5K5rnbjK1iEcbGa6w=;
 b=gTWnFQUcx4oDfYYGX7NhU5btKE6deZ7W4mcHkGsZIFyUVPZ7MXpEeIkXcqYCiVlHmt
 1UhX0gZV/uvWhQelB0tNQVz+6ZcUi1ij4LqZDydl3tNT5a0gsL9h3DL87WaMs/PlEJjW
 We8PdAIVl7tF+4vvN4f0PpjZ+V0zp84H7vY+k3BAH+eDyXN2AvL0OeO7539Mq9Upx9vj
 duA2ztsx9s0nLU5a1120UnRJ7eg57/gbcVCQFJhmNxkKIW72obHeaqP66d9e4BxN/S87
 +OA2YDPOxNQEelAr1Hq4KLj+SsyHVg6Fwdbi0sdbXonVsFbuZm3S2aUv81hUzz6jVdGh
 KcHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Gxiv9N5I/0koEZElvdg9/A3+iy5K5rnbjK1iEcbGa6w=;
 b=Rtv8YuXtfCLpw2uq8Ah0owTiss2Fp/qsYgVOUB+ebiesl8qmyILfBcOKHCyM3qA7gK
 euDuCrjFHApoXTM+9QgjYOM9jipDZwKOYAWeYKhf/MK/Ktm386+9dNTQ9SJUhH9PeN5T
 rnwgdlGmI0+0xaOSssyKAD+zCscgljGn6r+Fr3dpxI+Dz3p+hcrs36FcjbVXfJc7VP6B
 e90qz8To2Zn0uKDT7p/WsxRzEE/5njOcFphU4x+nVhfxvmfIEeCcQdVPEKEO9onkS7Jt
 jc/nK53cUnRlfWTjemGMJ6kD2rVts0+RWR5BntjNAajgviAriG2+5ZEvJeTDtH1qeV1B
 QrSQ==
X-Gm-Message-State: AOAM532rJkeN03VwoQti3FSD5NRRiR9+TESiaeRtazNHgmYWid7CVx9f
 zIjjqaD9L6vX/0kW1jAYy0avC8cmNqJyLxzOUn0=
X-Google-Smtp-Source: ABdhPJyYU82Q33GbVTHqUDSRmku/z4g0TgkTPtIKZk+UhIWZK4qKLMOEI7kJfpP70jxfQ0fbewqrBHkXUx+/NmdItnw=
X-Received: by 2002:aca:7541:: with SMTP id q62mr1078293oic.51.1603184591254; 
 Tue, 20 Oct 2020 02:03:11 -0700 (PDT)
MIME-Version: 1.0
References: <1600859910-15855-1-git-send-email-gene.chen.richtek@gmail.com>
 <20201016153823.GA9890@kozik-lap>
In-Reply-To: <20201016153823.GA9890@kozik-lap>
From: Gene Chen <gene.chen.richtek@gmail.com>
Date: Tue, 20 Oct 2020 17:03:00 +0800
Message-ID: <CAE+NS35gb_KWq3s-M9apxgr7wnNRyn7iPto8J8ZwA-jsgT=paw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: power: Add bindings document for Charger
 support on MT6360 PMIC
To: Krzysztof Kozlowski <krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201020_050313_107977_D13C5C16 
X-CRM114-Status: GOOD (  22.90  )
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
Cc: Gene Chen <gene_chen@richtek.com>, devicetree <devicetree@vger.kernel.org>,
 linux-pm@vger.kernel.org, sre@kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

S3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0BrZXJuZWwub3JnPiDmlrwgMjAyMOW5tDEw5pyIMTbm
l6Ug6YCx5LqUIOS4i+WNiDExOjM45a+r6YGT77yaCj4KPiBPbiBXZWQsIFNlcCAyMywgMjAyMCBh
dCAwNzoxODoyOVBNICswODAwLCBHZW5lIENoZW4gd3JvdGU6Cj4gPiBGcm9tOiBHZW5lIENoZW4g
PGdlbmVfY2hlbkByaWNodGVrLmNvbT4KPiA+Cj4gPiBBZGQgYmluZGluZ3MgZG9jdW1lbnQgZm9y
IENoYXJnZXIgc3VwcG9ydCBvbiBNVDYzNjAgUE1JQwo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEdl
bmUgQ2hlbiA8Z2VuZV9jaGVuQHJpY2h0ZWsuY29tPgo+ID4gLS0tCj4gPiAgLi4uL2JpbmRpbmdz
L3Bvd2VyL3N1cHBseS9tdDYzNjBfY2hhcmdlci55YW1sICAgICAgfCA0NCArKysrKysrKysrKysr
KysrKysrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDQ0IGluc2VydGlvbnMoKykKPiA+ICBjcmVh
dGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Bvd2VyL3N1
cHBseS9tdDYzNjBfY2hhcmdlci55YW1sCj4gPgo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9wb3dlci9zdXBwbHkvbXQ2MzYwX2NoYXJnZXIueWFtbCBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wb3dlci9zdXBwbHkvbXQ2MzYwX2No
YXJnZXIueWFtbAo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+IGluZGV4IDAwMDAwMDAuLjcx
MWZjMTkKPiA+IC0tLSAvZGV2L251bGwKPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9wb3dlci9zdXBwbHkvbXQ2MzYwX2NoYXJnZXIueWFtbAo+ID4gQEAgLTAsMCAr
MSw0NCBAQAo+ID4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1Ig
QlNELTItQ2xhdXNlKQo+ID4gKyVZQU1MIDEuMgo+ID4gKy0tLQo+ID4gKyRpZDogaHR0cDovL2Rl
dmljZXRyZWUub3JnL3NjaGVtYXMvcG93ZXIvc3VwcGx5L210NjM2MF9jaGFyZ2VyLnlhbWwjCj4g
PiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwj
Cj4gPiArCj4gPiArdGl0bGU6IEJhdHRlcnkgY2hhcmdlciBkcml2ZXIgZm9yIE1UNjM2MCBQTUlD
IGZyb20gTWVkaWFUZWsgSW50ZWdyYXRlZC4KPiA+ICsKPiA+ICttYWludGFpbmVyczoKPiA+ICsg
IC0gR2VuZSBDaGVuIDxnZW5lX2NoZW5AcmljaHRlay5jb20+Cj4gPiArCj4gPiArZGVzY3JpcHRp
b246IHwKPiA+ICsgIFRoaXMgbW9kdWxlIGlzIHBhcnQgb2YgdGhlIE1UNjM2MCBNRkQgZGV2aWNl
Lgo+ID4gKyAgUHJvdmlkZXMgQmF0dGVyeSBDaGFyZ2VyLCBCb29zdCBmb3IgT1RHIGRldmljZXMg
YW5kIEJDMS4yIGRldGVjdGlvbi4KPiA+ICsKPiA+ICtwcm9wZXJ0aWVzOgo+ID4gKyAgY29tcGF0
aWJsZToKPiA+ICsgICAgY29uc3Q6IG1lZGlhdGVrLG10NjM2MC1jaGcKPiA+ICsKPiA+ICsgIHZp
bm92cDoKPiA+ICsgICAgZGVzY3JpcHRpb246Cj4gPiArICAgICAgTWF4aW11bSBDSEdJTiByZWd1
bGF0aW9uIHZvbHRhZ2UuCj4KPiAxLiBZb3UgbmVlZCB0byBkZXNjcmliZSB0aGUgdHlwZS4KPiAy
LiBVc2UgcHJvcGVyIHVuaXQgc3VmZml4IChzZWUgcHJvcGVydHktdW5pdHMudHh0KS4KPiAzLiBJ
cyB0aGlzIGEgY3VzdG9tIHByb3BlcnR5PyBJZiB5ZXMsIGl0IG1pc3NlcyB2ZW5kb3IgcHJlZml4
LiBJZiBub3QsCj4gICAgbW9zdCBsaWtlbHkgdGhlcmUgaXMgYWxyZWFkeSBzdWNoIHByb3BlcnR5
LiBSZXVzZS4KPgoKQUNLCgo+ID4gKwo+ID4gKyAgdXNiLW90Zy12YnVzOgo+ID4gKyAgICAgICRy
ZWY6IC9zY2hlbWFzL3JlZ3VsYXRvci9yZWd1bGF0b3IueWFtbCMKPgo+IDEuIFdyb25nIGluZGVu
dGF0aW9uLgo+IDIuIE5hbWUgc2hvdWxkIGJlIG1vcmUgb3IgbGVzcyBnZW5lcmljLCBzbyBtYXli
ZQo+ICAgICJ1c2Itb3RnLXZidXMtcmVndWxhdG9yIi4KPgoKQUNLCgo+ID4gKwo+ID4gK3JlcXVp
cmVkOgo+ID4gKyAgLSBjb21wYXRpYmxlCj4KPiBObyBhZGRyZXNzL3JlZz8gSG93IGRvZXMgaXQg
YmluZD8KPgoKVGhpcyBtb2R1bGUgaXMgcGFydCBvZiB0aGUgTVQ2MzYwIE1GRCBkZXZpY2UuCnNl
ZSBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL210NjM2MC55YW1sLCB3aGlj
aCBpcwpyZXZpZXdpbmcgYnkgTUZEIHJldmlld2VyLgoKU2hvdWxkIEkgYWRkIHRoaXMgdG8gZGVz
Y3JpcHRpb24/Cgo+ID4gKwo+ID4gK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQo+ID4gKwo+
ID4gK2V4YW1wbGVzOgo+ID4gKyAgLSB8Cj4gPiArICAgIG10NjM2MF9jaGc6IGNoZyB7Cj4KPiBz
L2NoZy9jaGFyZ2VyLwo+CgpBQ0sKCj4gPiArICAgICAgY29tcGF0aWJsZSA9ICJtZWRpYXRlayxt
dDYzNjAtY2hnIjsKPiA+ICsgICAgICB2aW5vdnAgPSA8MTQ1MDAwMDA+Owo+Cj4gRW1wdHkgbGlu
ZSBicmVhawo+CgpBQ0sKCj4gQmVzdCByZWdhcmRzLAo+IEtyenlzenRvZgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGlu
ZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
