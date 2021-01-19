Return-Path: <SRS0=YRwc=GW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F30FBC433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Jan 2021 08:24:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 992A72311C
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Jan 2021 08:24:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 992A72311C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GSe9oETVtR3H0ht7OG0MCAzJoqlFjYGBvgpInFJYV9E=; b=KZOEBpkMOgMPL9dPOLlQFvMN3
	8mO52lJrKW26ycaiD89v3L6uNwAmtKyrpwOGBZbBqsFCvpyLZFuUEUh6lwLxn5kRA9uAIJAPPEms6
	NdZ/g9fhTPvquSI6oelgFv1xksU+TQuv3IJFX7gUeN68EKk7iuE4jwG4ZCPjvLpPY4jJ/XGFi6Rm5
	+qHrrUm5BZgJVFtf1x1dpCBrCl6nf9Op/WxUc271M3dDtSJhdacv08K2eI34YJymdYqoJMkjz2v6X
	E7Y4I6NZzL4MMW6BInV15Qx8l1mb4pwh+g7UtXfLV2OTHsGU1FZ55rTk5YpVdToAdHCQkV7Er5Kor
	b6M+j2cPQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1mJE-0001iZ-Pl; Tue, 19 Jan 2021 08:24:16 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1mJB-0001hX-7r; Tue, 19 Jan 2021 08:24:14 +0000
Received: by mail-lj1-x22a.google.com with SMTP id u11so20886706ljo.13;
 Tue, 19 Jan 2021 00:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=lzQ4WSBpq2hEo6V0PK/bKozargiQZ72MCs5Zs/PuMUA=;
 b=OdNxzGO0wq9dEmorue2gc6pO6u+B5YkF+JpkTRxuOnkIlCd3O5+rWrcB2CgQnY23Da
 3//2g2/2CiWpNCwJb4J22R8K3Ic2QrEXLck96wfi57ZAh9kUSxTyyshzSiH4Gp7rtazs
 BZn09RytTMren18LIcFijQYa0RaqoGdy6U3jGSfolF0Fdqqz65UQ3gzUGHPVXrZtWMwZ
 NyoEzHMHEEu8IEKauF2NgU+Um+F8VXkpyWGiIcRLO0Hlu93VJEVsQ4sXJ0E9KgaC/G92
 lFs1WfWrQFG5bYLo0U66+iaRht+7FR1cc2TV3iyBDp4x2H/KRV+IJyxjFZLCybXEfmtW
 ZVbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lzQ4WSBpq2hEo6V0PK/bKozargiQZ72MCs5Zs/PuMUA=;
 b=HVXNAM5KrSnNimFKgXKM6SR0LBwISx8mtgxaXacu/K3SU+Pbss2+0Y4Q7lykGXGIEA
 79dfEfkf7AvUkGJ9Knslu6kAFXVuJ4gjFNmuzUPVls1Owpg2monUy+wlmCY+i243rI3k
 LXBqXkvEf8PzVwSFPr4vQRsNEm9x3PF0hKLMQa4I/DrzX54zEjt3n1rAWBHRBVhMtmWt
 MdvjwJyiBAwEKofdhgxc+LaL1OuHtF5EECtnesWSY29X8LuS3+MJYpcFj7IswkCYKYal
 /UrUOCFh9TImfPBhrhieRoy+E4osOrR1Pq/vz0rG2RrGHtuVqNK4UpeGASdz6hMAa30f
 spUg==
X-Gm-Message-State: AOAM5301x7Gv7dkgNCMVq95Y1ew17RmPQGFzm3xePVSL0wvye/SAf0Lt
 TBrMUuvKZpN/NnBwDcN2fiGd7L0DzupFYhUqprk=
X-Google-Smtp-Source: ABdhPJw3SUHClF0Yr/xAP9QfMg0cROH78E5MpdK77ZL6G9aGQ8zQx2aWFdiCVVnBV6y6tt5vnSzns4SbPLZuoZv6wmY=
X-Received: by 2002:a2e:9805:: with SMTP id a5mr1417257ljj.175.1611044648876; 
 Tue, 19 Jan 2021 00:24:08 -0800 (PST)
MIME-Version: 1.0
References: <1610720001-15300-1-git-send-email-u0084500@gmail.com>
 <3a4a88a9-f0e3-2b65-9df4-6c1d4e3f1c14@roeck-us.net>
 <CADiBU38g_E+iH4jTwQfPvJh4=WRH4vzQ12oubGg47gj+CpTU0A@mail.gmail.com>
 <1611041874.12761.13.camel@mhfsdcap03>
In-Reply-To: <1611041874.12761.13.camel@mhfsdcap03>
From: ChiYuan Huang <u0084500@gmail.com>
Date: Tue, 19 Jan 2021 16:23:56 +0800
Message-ID: <CADiBU39fAa30pK5uNCN=sBVZ2pC-ACFqCoY8vKr3+6e+n828tw@mail.gmail.com>
Subject: Re: [PATCH 1/2] usb typec: tcpci: mt6360: Add vsafe0v support and
 external vbus supply control
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210119_032413_284042_13D7177A 
X-CRM114-Status: GOOD (  37.98  )
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
Cc: gene_chen@richtek.com,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg KH <gregkh@linuxfoundation.org>,
 Linux USB List <linux-usb@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>, cy_huang <cy_huang@richtek.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, matthias.bgg@gmail.com,
 Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Q2h1bmZlbmcgWXVuIDxjaHVuZmVuZy55dW5AbWVkaWF0ZWsuY29tPiDmlrwgMjAyMeW5tDHmnIgx
OeaXpSDpgLHkuowg5LiL5Y2IMzozOOWvq+mBk++8mgo+Cj4gT24gTW9uLCAyMDIxLTAxLTE4IGF0
IDE2OjI4ICswODAwLCBDaGlZdWFuIEh1YW5nIHdyb3RlOgo+ID4gR3VlbnRlciBSb2VjayA8bGlu
dXhAcm9lY2stdXMubmV0PiDmlrwgMjAyMeW5tDHmnIgxOOaXpSDpgLHkuIAg5LiK5Y2IMTo0M+Wv
q+mBk++8mgo+ID4gPgo+ID4gPiBPbiAxLzE1LzIxIDY6MTMgQU0sIGN5X2h1YW5nIHdyb3RlOgo+
ID4gPiA+IEZyb206IENoaVl1YW4gSHVhbmcgPGN5X2h1YW5nQHJpY2h0ZWsuY29tPgo+ID4gPiA+
Cj4gPiA+ID4gTVQ2MzYwIG5vdCBzdXBwb3J0IGZvciBUQ1BDIGNvbW1hbmQgdG8gY29udHJvbCBz
b3VyY2UgYW5kIHNpbmsuCj4gPiA+Cj4gPiA+IGRvZXMgbm90Cj4gPiA+Cj4gPiBBY2sKPiA+ID4g
PiBVc2VzIGV4dGVybmFsIDVWIHZidXMgcmVndWxhdG9yIGFzIHRoZSB2YnVzIHNvdXJjZSBjb250
cm9sLgo+ID4gPiA+Cj4gPiA+IFVzZQo+ID4gPgo+ID4gQWNrCj4gPiA+ID4gQWxzbyBhZGRzIHRo
ZSBjYXBhYmlsaXR5IHRvIHJlcG9ydCB2c2FmZTB2Lgo+ID4gPiA+Cj4gPiA+IGFkZAo+ID4gPgo+
ID4gQWNrCj4gPiA+IFNvIGZhciB0aGlzIGRyaXZlciB3b3JrcyB3aXRob3V0IHJlZ3VsYXRvci4g
VW5sZXNzIEkgYW0gbWlzc2luZyBzb21ldGhpbmcsCj4gPiA+IHRoaXMgcGF0Y2ggbWFrZXMgcmVn
dWxhdG9yIHN1cHBvcnQgbWFuZGF0b3J5LCBtZWFuaW5nIGV4aXN0aW5nIGNvZGUgd2lsbCBmYWls
Lgo+ID4gPiBJIGFtIG5vdCBzdXJlIGlmIHRoYXQgaXMgYXBwcm9wcmlhdGUvYWNjZXB0YWJsZS4g
Q2FuIHdlIGJlIHN1cmUgdGhhdCB0aGlzIHdpbGwKPiA+ID4gd29yayBmb3IgZXhpc3RpbmcgdXNl
cnMgb2YgdGhpcyBkcml2ZXIgPwo+ID4gPgo+ID4gWWVzLCBJIGFscmVhZHkgY2hlY2tlZCBhbGwg
dGhlIHNyYy9zbmsgZnVuY3Rpb25hbGl0eSBiYXNlZCBvbiAgdGhlCj4gPiBsYXRlc3QgdHlwZWMg
Y29kZS4KPiA+IEl0J2xsIGJlIGNvbW1vbiBmb3Igb3VyIFRDUEMuIEl0IGRpZG4ndCBzdXBwb3J0
IGZvciBUQ1BDIGNvbW1hbmQuCj4gPiBGcm9tIHRoZSByZWNlbnQgcGF0Y2hlcywgYWN0dWFsbHks
IEkgaGF2ZSB0aGUgbG9jYWwgY2hhbmdlIHRvIHRlc3QgdGhlCj4gPiBzcmMgY2FwYWJpbGl0eS4K
PiA+IEJ1dCBJIGRpZG4ndCBzdWJtaXQgaXQuIEl0J3MgYWxtb3N0IHRoZSBzYW1lIHRvIGFkZCBz
ZXRfdmJ1cyBjYWxsYmFjay4KPiA+IFRoYXQncyB3aHkgSSBzdWJtaXQgdGhpcyBjaGFuZ2UgYWZ0
ZXIgdGNwY2kgJ3NldF92YnVzIGNhbGxiYWNrJyBpcyBhZGRlZC4KPiA+Cj4gPiA+IFRoYW5rcywK
PiA+ID4gR3VlbnRlcgo+ID4gPgo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IENoaVl1YW4gSHVhbmcg
PGN5X2h1YW5nQHJpY2h0ZWsuY29tPgo+ID4gPiA+IC0tLQo+ID4gPiA+ICBkcml2ZXJzL3VzYi90
eXBlYy90Y3BtL3RjcGNpX210NjM2MC5jIHwgMjkgKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysKPiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKykKPiA+ID4gPgo+ID4g
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi90eXBlYy90Y3BtL3RjcGNpX210NjM2MC5jIGIv
ZHJpdmVycy91c2IvdHlwZWMvdGNwbS90Y3BjaV9tdDYzNjAuYwo+ID4gPiA+IGluZGV4IGYxYmQ5
ZTAuLjBlZGY0YjYgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvZHJpdmVycy91c2IvdHlwZWMvdGNwbS90
Y3BjaV9tdDYzNjAuYwo+ID4gPiA+ICsrKyBiL2RyaXZlcnMvdXNiL3R5cGVjL3RjcG0vdGNwY2lf
bXQ2MzYwLmMKPiA+ID4gPiBAQCAtMTEsNiArMTEsNyBAQAo+ID4gPiA+ICAjaW5jbHVkZSA8bGlu
dXgvb2YuaD4KPiA+ID4gPiAgI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPgo+ID4g
PiA+ICAjaW5jbHVkZSA8bGludXgvcmVnbWFwLmg+Cj4gPiA+ID4gKyNpbmNsdWRlIDxsaW51eC9y
ZWd1bGF0b3IvY29uc3VtZXIuaD4KPiA+ID4gPiAgI2luY2x1ZGUgPGxpbnV4L3VzYi90Y3BtLmg+
Cj4gPiA+ID4KPiA+ID4gPiAgI2luY2x1ZGUgInRjcGNpLmgiCj4gPiA+ID4gQEAgLTM2LDYgKzM3
LDcgQEAgc3RydWN0IG10NjM2MF90Y3BjX2luZm8gewo+ID4gPiA+ICAgICAgIHN0cnVjdCB0Y3Bj
aV9kYXRhIHRkYXRhOwo+ID4gPiA+ICAgICAgIHN0cnVjdCB0Y3BjaSAqdGNwY2k7Cj4gPiA+ID4g
ICAgICAgc3RydWN0IGRldmljZSAqZGV2Owo+ID4gPiA+ICsgICAgIHN0cnVjdCByZWd1bGF0b3Ig
KnZidXM7Cj4gPiA+ID4gICAgICAgaW50IGlycTsKPiA+ID4gPiAgfTsKPiA+ID4gPgo+ID4gPiA+
IEBAIC01MSw2ICs1MywyNyBAQCBzdGF0aWMgaW5saW5lIGludCBtdDYzNjBfdGNwY193cml0ZTE2
KHN0cnVjdCByZWdtYXAgKnJlZ21hcCwKPiA+ID4gPiAgICAgICByZXR1cm4gcmVnbWFwX3Jhd193
cml0ZShyZWdtYXAsIHJlZywgJnZhbCwgc2l6ZW9mKHUxNikpOwo+ID4gPiA+ICB9Cj4gPiA+ID4K
PiA+ID4gPiArc3RhdGljIGludCBtdDYzNjBfdGNwY19zZXRfdmJ1cyhzdHJ1Y3QgdGNwY2kgKnRj
cGNpLCBzdHJ1Y3QgdGNwY2lfZGF0YSAqZGF0YSwgYm9vbCBzcmMsIGJvb2wgc25rKQo+ID4gPiA+
ICt7Cj4gPiA+ID4gKyAgICAgc3RydWN0IG10NjM2MF90Y3BjX2luZm8gKm10aSA9IGNvbnRhaW5l
cl9vZihkYXRhLCBzdHJ1Y3QgbXQ2MzYwX3RjcGNfaW5mbywgdGRhdGEpOwo+ID4gPiA+ICsgICAg
IGludCByZXQ7Cj4gPiA+ID4gKwo+ID4gPiA+ICsgICAgIC8qIFRvIGNvcnJlY3RseSBoYW5kbGUg
dGhlIGFscmVhZHkgZW5hYmxlZCB2YnVzIGFuZCBkaXNhYmxlIGl0cyBzdXBwbHkgZmlyc3QgKi8K
PiA+ID4gPiArICAgICBpZiAocmVndWxhdG9yX2lzX2VuYWJsZWQobXRpLT52YnVzKSkgewo+ID4g
PiA+ICsgICAgICAgICAgICAgcmV0ID0gcmVndWxhdG9yX2Rpc2FibGUobXRpLT52YnVzKTsKPiA+
ID4gPiArICAgICAgICAgICAgIGlmIChyZXQpCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAg
IHJldHVybiByZXQ7Cj4gPiA+ID4gKyAgICAgfQo+ID4gPgo+ID4gPiBJcyBpdCByZWFsbHkgYSBn
b29kIGlkZWEgdG8gZGlzYWJsZSB2YnVzIGlmIGl0IGhhcHBlbnMgdG8gYmUgYWxyZWFkeSBlbmFi
bGVkCj4gPiA+IGFuZCB0aGVyZSBpcyAoYW5vdGhlciA/KSByZXF1ZXN0IHRvIGVuYWJsZSBpdCA/
Cj4gPiA+Cj4gPiBZZXMsIGZvciAgdGhlIHN0YXRlIGNoYW5nZSBmcm9tIHNyY19hdHRhY2hfd2Fp
dCB0byBzcmNfYXR0YWNoLAo+ID4gSXQgbmVlZCB0byBtZWV0IHRoZSByZXF1aXJlbWVudCB0aGF0
ICB0aGUgdmJ1cyBpcyBhdCB2c2FmZTB2Lgo+ID4gU28gdG8gZGlzYWJsZSBpdCBmaXJzdCBpcyBu
ZWVkZWQuCj4gPiBBbmQgdG8gcHJldmVudCBvdGhlciB1c2VycyBmcm9tIGVuYWJsaW5nL2Rpc2Fi
bGluZyBleHRlcm5hbCB2YnVzCj4gPiByZWd1bGF0b3IgaW4gYW55IGNhc2UuCj4gPiBJIHRoaW5r
IHdlIG1heSBjaGFuZ2UgcmVndWxhdG9yX2dldCAgdG8gJ3JlZ3VsYXRvcl9nZXRfZXhjbHVzaXZl
Jy4KPiA+IEZyb20gdGhlIGRlc2lnbiwgNXYgcmVndWxhdG9yIG9ubHkgY2FuIGJlIGNvbnRyb2xs
ZWQgdmlhIHR5cGVjIGZyYW1ld29yay4KPiA+IElmIG90aGVyIHVzZXIgdG91Y2ggaXQsIGl0J2xs
IGFmZmVjdCB0aGUgdHlwZWMgc3RhdGUgdHJhbnNpdGlvbi4KPiBIb3cgYWJvdXQgdG8gcHJvY2Vz
cyB0aGUgY2FzZSB0aGF0IGV2ZW4gc3dpdGNoIHVzYiBjb250cm9sbGVyIHRvIGRldmljZQo+IG1v
ZGUsIHBsYXRmb3JtIGFsc28gbmVlZCB0byBrZWVwIHZidXMgb24/IGUuZy4gSXBob25lIENhcnBs
YXkKPgo+Ckl0IG11c3QgYmUgcHJvY2Vzc2VkIGJ5IFVTQlBEIGRhdGEgcm9sZSBzd2FwLgoKVHlw
ZSBDIG9ubHkgZGVjaWRlIHRoZSBpbml0aWFsIHJvbGUgKFNOSzogcG93ZXIgc25rIGFuZCB1ZnA7
IFNSQzoKcG93ZXIgc3JjIGFuZCBERlApLgpPbmx5IFVTQlBEIGNhbiBjaGFuZ2UgdGhlIHBvd2Vy
L2RhdGEvdmNvbm4gcm9sZSBpbmRpdmlkdWFsbHkuCgo+ID4gPiA+ICsKPiA+ID4gPiArICAgICBp
ZiAoc3JjKSB7Cj4gPiA+ID4gKyAgICAgICAgICAgICByZXQgPSByZWd1bGF0b3JfZW5hYmxlKG10
aS0+dmJ1cyk7Cj4gPiA+ID4gKyAgICAgICAgICAgICBpZiAocmV0KQo+ID4gPiA+ICsgICAgICAg
ICAgICAgICAgICAgICByZXR1cm4gcmV0Owo+ID4gPiA+ICsgICAgIH0KPiA+ID4gPiArCj4gPiA+
ID4gKyAgICAgcmV0dXJuIDA7Cj4gPiA+ID4gK30KPiA+ID4gPiArCj4gPiA+ID4gIHN0YXRpYyBp
bnQgbXQ2MzYwX3RjcGNfaW5pdChzdHJ1Y3QgdGNwY2kgKnRjcGNpLCBzdHJ1Y3QgdGNwY2lfZGF0
YSAqdGRhdGEpCj4gPiA+ID4gIHsKPiA+ID4gPiAgICAgICBzdHJ1Y3QgcmVnbWFwICpyZWdtYXAg
PSB0ZGF0YS0+cmVnbWFwOwo+ID4gPiA+IEBAIC0xMzgsNyArMTYxLDEzIEBAIHN0YXRpYyBpbnQg
bXQ2MzYwX3RjcGNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiA+ID4gPiAg
ICAgICBpZiAobXRpLT5pcnEgPCAwKQo+ID4gPiA+ICAgICAgICAgICAgICAgcmV0dXJuIG10aS0+
aXJxOwo+ID4gPiA+Cj4gPiA+ID4gKyAgICAgbXRpLT52YnVzID0gZGV2bV9yZWd1bGF0b3JfZ2V0
KCZwZGV2LT5kZXYsICJ2YnVzIik7Cj4gPiA+ID4gKyAgICAgaWYgKElTX0VSUihtdGktPnZidXMp
KQo+ID4gPiA+ICsgICAgICAgICAgICAgcmV0dXJuIFBUUl9FUlIobXRpLT52YnVzKTsKPiA+ID4g
PiArCj4gPiA+ID4gICAgICAgbXRpLT50ZGF0YS5pbml0ID0gbXQ2MzYwX3RjcGNfaW5pdDsKPiA+
ID4gPiArICAgICBtdGktPnRkYXRhLnNldF92YnVzID0gbXQ2MzYwX3RjcGNfc2V0X3ZidXM7Cj4g
PiA+ID4gKyAgICAgbXRpLT50ZGF0YS52YnVzX3ZzYWZlMHYgPSAxOwo+ID4gPiA+ICAgICAgIG10
aS0+dGNwY2kgPSB0Y3BjaV9yZWdpc3Rlcl9wb3J0KCZwZGV2LT5kZXYsICZtdGktPnRkYXRhKTsK
PiA+ID4gPiAgICAgICBpZiAoSVNfRVJSKG10aS0+dGNwY2kpKSB7Cj4gPiA+ID4gICAgICAgICAg
ICAgICBkZXZfZXJyKCZwZGV2LT5kZXYsICJGYWlsZWQgdG8gcmVnaXN0ZXIgdGNwY2kgcG9ydFxu
Iik7Cj4gPiA+ID4KPiA+ID4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tZWRpYXRlawo=
