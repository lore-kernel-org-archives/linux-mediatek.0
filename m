Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E471DC43334
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jun 2022 10:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7eeNs3aeLsezCM1PThzDmm3Fr7dz1Ms4xVzxbcXpQf0=; b=M1k5oMB74eKCD7
	zRWrquEDSw29zBNsfQFIJZQ8SrzaRgANUuCAPhy0HqZKqFCy98kCEu+5MUR1xBQy/7YsULnj658kJ
	d5D8Iyf8JEGQIpNLf2pa0ECOXg4WKupXKsmdqy9lNlA3KEanaEc3Mlwb5C3cvkn84NWPgF09GW/6k
	JOGwwRPgyYdPcK/OQ7GGXh8GmpITJMVyfPRdraxvkYYrJDqFJThEB/B18BWHutAReQvClmlFKJegm
	zm21It2fgk0rpqWNsdpKpY/SIm5WOOatZ9NuF9/EjOAzL3Q+fWZyd0RAHqa+oz4IvOk/lcgKlbViw
	Afw08q4u9wYUo2qeG94g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyWeu-006knZ-PV; Tue, 07 Jun 2022 10:42:00 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyWec-006kdk-LR
	for linux-mediatek@lists.infradead.org; Tue, 07 Jun 2022 10:41:44 +0000
Received: by mail-wm1-x332.google.com with SMTP id a10so6549164wmj.5
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Jun 2022 03:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=qw8JacEfJNF9P2iNLjQzkAXW/8/vZkXuOjt3GnWBvjw=;
        b=hyDSvJIfh0LYoaLEeqkmPROm1N2u7R8cMpaut6DZYA8pNoxIG7jthQ5F82HOCMq2rG
         fYjscsLiZQgKk+uyZcbEemQ19fmtnvUYc1F4ZnC8f0xbYYmnoXgHcdlVqTkkiGAZFBqw
         9s6rtFDUlnRG2c31zUx4ljO2jYpPUAnFu2CD7zbQdqqR7D+ujyFr+ex7gPKhkrnSR44Y
         KTeHSqWku7fvSZxcJb7rgNvOQP8DFieQ2czxXmC8Grj3rVCEqXal1Ce2ctYVkpSgaPKD
         4Q++EwprNd3zbAp7TC5+zWZnPLhJLp5WeJfaaKmzs3WBKvfUaGGXdb6qII//hNYJ6OuU
         10vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=qw8JacEfJNF9P2iNLjQzkAXW/8/vZkXuOjt3GnWBvjw=;
        b=OQgujy9ddGy0mBC1ftPQRrm7/1MsLxcoQ+vUy99NCHrQ/OjSzhOSGUB/BA01HtQa+t
         hl3a4gQfiF5SWJLSW+pabKXohAuSzNX3X9HOpEZ7DZVh0iafH2hHzHRlrhbJjJtW1Xz5
         PiF5VVPQBchvuidb+RjFRmvgxnBXT0oGRytTdKy9x/vCa1avcZ6A1LnrD1AtLeYTN01W
         VtZMFRUZhY4lVbWCQtKKPpEHsizczMPGU8RVPMFZr2u9+eR168Mnh+vzt23tvUbpct69
         OPBLFhp+P+vQLVZDIScSpHNZIrUa5AsuTKqVLFIow+lLCptztspT5QaaojdoKjUO5U8+
         zZ0g==
X-Gm-Message-State: AOAM532G2MXDGJqP5WILjzgHtdnFGvTvX/hld+ibL+6HL/iAWVXticBh
	IoqCJobtGX0ew+thc/UkxmXLGQ==
X-Google-Smtp-Source: ABdhPJz0rzj4eqfRw2wspCI3jipVGst2fbnr65Qmu05TDb5e0ptD3uTC6nEhOxZyIE8KFnMOZnH58g==
X-Received: by 2002:a05:600c:3c8f:b0:39b:808c:b5cb with SMTP id bg15-20020a05600c3c8f00b0039b808cb5cbmr28760884wmb.11.1654598498995;
        Tue, 07 Jun 2022 03:41:38 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id n22-20020a05600c3b9600b00397342e3830sm27940708wms.0.2022.06.07.03.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 03:41:38 -0700 (PDT)
Date: Tue, 7 Jun 2022 11:41:36 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: ChiaEn Wu <peterwu.pub@gmail.com>
Cc: lee.jones@linaro.org, jingoohan1@gmail.com, pavel@ucw.cz,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
	gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
	lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net,
	heikki.krogerus@linux.intel.com, deller@gmx.de,
	ChiYuan Huang <cy_huang@richtek.com>, alice_chen@richtek.com,
	chiaen_wu@richtek.com, dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org
Subject: Re: [RESEND 14/14] video: backlight: mt6370: Add Mediatek MT6370
 support
Message-ID: <20220607104136.cfnpwo6ajqiuafbf@maple.lan>
References: <20220531111900.19422-1-peterwu.pub@gmail.com>
 <20220531111900.19422-15-peterwu.pub@gmail.com>
 <20220601094623.jnwh2fgsqepy72tc@maple.lan>
 <CABtFH5+-o=cML_VCSY9frJwEU_TnZt0+myJebi8J7BpP+BOqOw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABtFH5+-o=cML_VCSY9frJwEU_TnZt0+myJebi8J7BpP+BOqOw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_034142_763033_67D575FE 
X-CRM114-Status: GOOD (  36.41  )
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

T24gRnJpLCBKdW4gMDMsIDIwMjIgYXQgMDM6MTQ6NTZBTSArMDgwMCwgQ2hpYUVuIFd1IHdyb3Rl
Ogo+IERhbmllbCBUaG9tcHNvbiA8ZGFuaWVsLnRob21wc29uQGxpbmFyby5vcmc+IOaWvCAyMDIy
5bm0NuaciDHml6Ug6YCx5LiJIOS4i+WNiDU6NDblr6vpgZPvvJoKPiA+Cj4gPiBPbiBUdWUsIE1h
eSAzMSwgMjAyMiBhdCAwNzoxOTowMFBNICswODAwLCBDaGlhRW4gV3Ugd3JvdGU6Cj4gPiA+ICsj
ZGVmaW5lIE1UNjM3MF9EVF9QUk9QX0RFQ0woX25hbWUsIF90eXBlLCBfcmVnLCBfbWFzaywgX21h
eCwgX2ludikgICBcCj4gPiA+ICt7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiA+ICsgICAgIC5uYW1lID0gIm1l
ZGlhdGVrLGJsZWQtIiAjX25hbWUsICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4g
Pgo+ID4gSSdkIHJhdGhlciBoYXZlIHRoZSB3aG9sZSBEVCBwcm9wZXJ0eSBpbiB0aGUgbWFjcm8g
KGJlY2F1c2UgaXQgaGVscHMKPiA+IHdpdGggZ3JlcGFiaWxpdHkpLgo+IAo+IERvIHlvdSBtZWFu
IHRoZSBfbmFtZSBwYXJhbWV0ZXIgbXVzdCBiZSB0aGUgZnVsbCBuYW1lIG9mIHRoZSBEVAo+IHBy
b3BlcnR5IGFuZCBkbyBub3QgdXNlICIjIiB0byBjb25jYXQgbGlrZSBmb2xsb3dpbmcgZXhhbXBs
ZT8KPiAKPiAvLyBpbiBkZWNsYXJlCj4gICAgICAgICAgICAgLm5hbWUgPSBfbmFtZSwKPiAvLyBp
biB1c2UKPiAgICAgICAgICAgICBNVDYzNzBfRFRfUFJPUF9ERUNMKG1lZGlhdGVrLGJsZWQtcHdt
LWVuYWJsZSwgLi4uLi4uKQoKWWVzLCBJIHdvdWxkIHByZWZlciB0aGlzIGZvcm0sIGFsdGhvdWdo
LCBhcyBkaXNjdXNzZWQgYmVsb3csIEkgZG9uJ3QgcmVhbGx5Cmxpa2UgTVQ2MzcwX0RUX1BST1Bf
REVDTCgpLgoKCj4gPiA+ICsgICAgIC50eXBlID0gTVQ2MzcwX1BBUlNFX1RZUEVfIyNfdHlwZSwg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiA+ICsgICAgIC5yZWcgPSBfcmVnLCAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiA+
ICsgICAgIC5tYXNrID0gX21hc2ssICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBcCj4gPiA+ICsgICAgIC5tYXhfdmFsID0gX21heCwgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiA+ICsgICAgIC5pbnZlcnQg
PSBfaW52LCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBc
Cj4gPiA+ICt9Cj4gPiA+ICsKPiA+ID4gK3N0YXRpYyBpbnQgbXQ2MzcwX2luaXRfYmFja2xpZ2h0
X3Byb3BlcnRpZXMoc3RydWN0IG10NjM3MF9wcml2ICpwcml2LAo+ID4gPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgYmFja2xpZ2h0X3Byb3BlcnRpZXMg
KnByb3BzKQo+ID4gPiArewo+ID4gPiArICAgICBzdHJ1Y3QgZGV2aWNlICpkZXYgPSBwcml2LT5k
ZXY7Cj4gPiA+ICsgICAgIHU4IHByb3BfdmFsOwo+ID4gPiArICAgICB1MzIgYnJpZ2h0bmVzczsK
PiA+ID4gKyAgICAgdW5zaWduZWQgaW50IG1hc2ssIHZhbDsKPiA+ID4gKyAgICAgc3RhdGljIGNv
bnN0IHN0cnVjdCB7Cj4gPiA+ICsgICAgICAgICAgICAgY2hhciAqbmFtZTsKPiA+ID4gKyAgICAg
ICAgICAgICBlbnVtIG10NjM3MF9wcm9wX3R5cGUgdHlwZTsKPiA+ID4gKyAgICAgICAgICAgICB1
bnNpZ25lZCBpbnQgcmVnOwo+ID4gPiArICAgICAgICAgICAgIHVuc2lnbmVkIGludCBtYXNrOwo+
ID4gPiArICAgICAgICAgICAgIHU4IG1heF92YWw7Cj4gPiA+ICsgICAgICAgICAgICAgYm9vbCBp
bnZlcnQ7Cj4gPiA+ICsgICAgIH0gdmVuZG9yX29wdF9wcm9wc1tdID0gewo+ID4gPiArICAgICAg
ICAgICAgIE1UNjM3MF9EVF9QUk9QX0RFQ0wocHdtLWVuYWJsZSwgQk9PTCwgTVQ2MzcwX1JFR19C
TF9QV00sCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBNVDYzNzBfQkxf
UFdNX0VOX01BU0ssIDEsIGZhbHNlKSwKPiA+ID4gKyAgICAgICAgICAgICBNVDYzNzBfRFRfUFJP
UF9ERUNMKHB3bS1oeXMtZW5hYmxlLCBCT09MLCBNVDYzNzBfUkVHX0JMX1BXTSwKPiA+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIE1UNjM3MF9CTF9QV01fSFlTX0VOX01BU0ss
IDEsIGZhbHNlKSwKPiA+ID4gKyAgICAgICAgICAgICBNVDYzNzBfRFRfUFJPUF9ERUNMKHB3bS1o
eXMtc2VsLCBVOCwgTVQ2MzcwX1JFR19CTF9QV00sCj4gPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBNVDYzNzBfQkxfUFdNX0hZU19TRUxfTUFTSywgMywgZmFsc2UpLAo+ID4g
PiArICAgICAgICAgICAgIE1UNjM3MF9EVF9QUk9QX0RFQ0wob3ZwLWxldmVsLXNlbCwgVTgsIE1U
NjM3MF9SRUdfQkxfQlNUQ1RSTCwKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIE1UNjM3MF9CTF9PVlBfU0VMX01BU0ssIDMsIGZhbHNlKSwKPiA+ID4gKyAgICAgICAgICAg
ICBNVDYzNzBfRFRfUFJPUF9ERUNMKG92cC1zaHV0ZG93biwgQk9PTCwgTVQ2MzcwX1JFR19CTF9C
U1RDVFJMLAo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgTVQ2MzcwX0JM
X09WUF9FTl9NQVNLLCAxLCB0cnVlKSwKPiA+ID4gKyAgICAgICAgICAgICBNVDYzNzBfRFRfUFJP
UF9ERUNMKG9jcC1sZXZlbC1zZWwsIFU4LCBNVDYzNzBfUkVHX0JMX0JTVENUUkwsCj4gPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBNVDYzNzBfQkxfT0NfU0VMX01BU0ssIDMs
IGZhbHNlKSwKPiA+ID4gKyAgICAgICAgICAgICBNVDYzNzBfRFRfUFJPUF9ERUNMKG9jcC1zaHV0
ZG93biwgQk9PTCwgTVQ2MzcwX1JFR19CTF9CU1RDVFJMLAo+ID4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgTVQ2MzcwX0JMX09DX0VOX01BU0ssIDEsIHRydWUpLAo+ID4gPiAr
ICAgICB9LCAqcHJvcF9ub3c7Cj4gPiA+ICsgICAgIGludCBpLCByZXQ7Cj4gPiA+ICsKPiA+ID4g
KyAgICAgLyogdmVuZG9yIG9wdGlvbmFsIHByb3BlcnRpZXMgKi8KPiA+ID4gKyAgICAgZm9yIChp
ID0gMDsgaSA8IEFSUkFZX1NJWkUodmVuZG9yX29wdF9wcm9wcyk7IGkrKykgewo+ID4gPiArICAg
ICAgICAgICAgIHByb3Bfbm93ID0gdmVuZG9yX29wdF9wcm9wcyArIGk7Cj4gPiA+ICsKPiA+ID4g
KyAgICAgICAgICAgICBzd2l0Y2ggKHByb3Bfbm93LT50eXBlKSB7Cj4gPiA+ICsgICAgICAgICAg
ICAgY2FzZSBNVDYzNzBfUEFSU0VfVFlQRV9CT09MOgo+ID4gPiArICAgICAgICAgICAgICAgICAg
ICAgaWYgKGRldmljZV9wcm9wZXJ0eV9yZWFkX2Jvb2woZGV2LCBwcm9wX25vdy0+bmFtZSkpCj4g
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZhbCA9IDE7Cj4gPiA+ICsgICAgICAg
ICAgICAgICAgICAgICBlbHNlCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZh
bCA9IDA7Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICBicmVhazsKPiA+ID4gKyAgICAgICAg
ICAgICBjYXNlIE1UNjM3MF9QQVJTRV9UWVBFX1U4Ogo+ID4gPiArICAgICAgICAgICAgICAgICAg
ICAgcmV0ID0gZGV2aWNlX3Byb3BlcnR5X3JlYWRfdTgoZGV2LCBwcm9wX25vdy0+bmFtZSwKPiA+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZw
cm9wX3ZhbCk7Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAvKiBQcm9wZXJ0eSBub3QgZXhp
c3QsIGtlZXAgdmFsdWUgaW4gZGVmYXVsdCAqLwo+ID4gPiArICAgICAgICAgICAgICAgICAgICAg
aWYgKHJldCkKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4g
PiA+ICsKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgIHZhbCA9IG1pbl90KHU4LCBwcm9wX3Zh
bCwgcHJvcF9ub3ctPm1heF92YWwpOwo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgYnJlYWs7
Cj4gPiA+ICsgICAgICAgICAgICAgZGVmYXVsdDoKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAg
IHJldHVybiAtRUlOVkFMOwo+ID4gPiArICAgICAgICAgICAgIH0KPiA+ID4gKwo+ID4gPiArICAg
ICAgICAgICAgIGlmIChwcm9wX25vdy0+aW52ZXJ0KQo+ID4gPiArICAgICAgICAgICAgICAgICAg
ICAgdmFsID0gcHJvcF9ub3ctPm1heF92YWwgLSB2YWw7Cj4gPiA+ICsKPiA+ID4gKyAgICAgICAg
ICAgICB2YWwgPDw9IGZmcyhwcm9wX25vdy0+bWFzaykgLSAxOwo+ID4gPiArCj4gPiA+ICsgICAg
ICAgICAgICAgcmV0ID0gcmVnbWFwX3VwZGF0ZV9iaXRzKHByaXYtPnJlZ21hcCwgcHJvcF9ub3ct
PnJlZywKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcHJvcF9u
b3ctPm1hc2ssIHZhbCk7Cj4gPiA+ICsgICAgICAgICAgICAgaWYgKHJldCkKPiA+ID4gKyAgICAg
ICAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4gPiA+ICsgICAgIH0KPiA+Cj4gPiBJcyBpdCBy
ZWFsbHkgd29ydGggYWxsIHRoaXMgdHJpY2t5IGNvZGUgZm9yIDcgcHJvcGVydGllcz8KPiA+Cj4g
PiBUaGUgY29kZSB3b3VsZCBiZSBtdWNoIGVhc2llciB0byByZWFkIGFuZCBtYWludGFpbiBpZiBp
dCB3ZXJlIGNvZGVkCj4gPiBkaXJlY3RseS4gRm9yIGV4YW1wbGUsIHRoZSBpbnZlcnRlZCBib29s
ZWFuIGNvZGUgaXMgaGFyZCB0byByZWFkIGFuZAo+ID4gY2FuIGJlIHdyaXR0ZW4gZGlyZWN0bHkg
YXM6Cj4gPgo+ID4KPiA+ICAgICAgICAgdmFsID0gZGV2aWNlX3Byb3BlcnR5X3JlYWRfYm9vbChk
ZXYsICJtZWRpYXRlayxibGVkLW92cF9zaHV0ZG93biIpOwo+ID4gICAgICAgICByZXQgPSByZWdt
YXBfdXBkYXRlX2JpdHMocHJpdi0+cmVnbWFwLCBNVDYzNzBfUkVHX0JMX0JTVF9DVFJMLAo+ID4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgTVQ2MzcwX0JMX09WUF9FTl9NQVNLLAo+
ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgTVQ2MzcwX0JMX09WUF9FTl9NQVNL
ICogIXZhbCk7Cj4gPiAgICAgICAgIGlmIChyZXQpCj4gPiAgICAgICAgICAgICAgICAgcmV0dXJu
IHJldDsKPiA+Cj4gPiBUaGUgZGlyZWN0IGNvZGVkIGFwcHJvYWNoIHdpbGwgcHJvYmFibHkgYWxz
byBwYXkgb2ZmIGlmIHlvdSBzd2l0Y2gKPiA+IHRoZSBiaW5kaW5ncyBvdmVyIHRvIG1pY3Jvdm9s
dHMvbWljcm9hbXBzIHNpbmNlIGl0IGJlY29tZXMgbXVjaCBtb3JlCj4gPiBuYXR1cmFsIHRvIGNh
bGwgb3V0IHRvIGEgbG9va3VwIGZ1bmN0aW9uIHRvIGNvbnZlcnQgaXQgaW50byBhIHJlZ2lzdGVy
Cj4gPiB2YWx1ZS4KPiA+Cj4gCj4gVGhlIHB1cnBvc2Ugb2YgbXkgY29kZSBpcyB0cnlpbmcgdG8g
YXZvaWQgdGhlIHJlcGVhdCBjb2RlIGluIHRoaXMKPiBmdW5jdGlvbi4gQW5kIGZvciBsb29wIGNh
biBoZWxwIHRvIGRlY3JlYXNlIHRoZSBsaW5lcyBvZiBjb2RlCj4gZWZmZWN0aXZlbHksIHRoYXQn
cyB3aHkgSSB1c2UgdGhlc2UgY29kZSB0byBwYXJzZSB0aGUgRFQgcHJvcGVydGllcy4KCkknbSBu
b3QgcmVhbGx5IGNvbnZpbmNlZCB0aGF0IGlzIHVzZXMgZmV3ZXIgbGluZXMgb2YgY29kZS4gSXQK
Y2VydGFpbmx5IHdvdWxkIGlmIHRoZXJlIHdlcmUgYSB2ZXJ5IGxhcmdlIG51bWJlciBvZiBwcm9w
ZXJ0aWVzCmJ1dCBoZXJlIHRoZXJlIGlzIG9ubHkgc2V2ZW4uCgpIb3dldmVyIEkgZ3Vlc3Mgd2hh
dCBJJ20gcmVhbGx5IGNvbXBsYWluaW5nIGFib3V0IGlzIGhvdyBoYXJkIGl0IGlzIHRvCnJlYWQg
dGhlIGZvciBsb29wLiBXZSBoYXZlIHRvIHN0dWR5IHRoZSBtYWNyb3MsIGtlZXAgdHJhY2sgc2l4
IGRpZmZlcmVudAphcmd1bWVudHMgcGVyIHByb3BlcnR5IGFuZCByZXZpZXcgdGhlIGNvbXBsZXgg
bG9naWMgb2YgdGhlIGZvciBsb29wCih3aGljaCBmb3IgZXhhbXBsZSBoYW5kbGVzIGludmVydGVk
IHU4J3MgdGhhdCBkb24ndCBhY3R1YWxseSBleGlzdCkuCgpUbyBiZSBjbGVhciwgaXQncyBub3Qg
dGhhdCBsb29wcyBhcmVuJ3QgdXNlZnVsIGZvciByZWR1Y2luZyBib2lsZXJwbGF0ZQpjb2RlLiBU
aGV5IGNhbiBiZS4gSG93ZXZlciB0cnlpbmcgdG8gaGFuZGxlIGJvb2xlYW5zIGFuZCBpbnRlZ2Vy
cyBpbiB0aGUKKnNhbWUqIGxvb3AgZW5kcyB1cCBuZWVkbGVzc2x5IGhhcmQgdG8gcmVhZC4KCkFs
c28sIEkgdGhpbmsgdGhhdCBpZi93aGVuIHlvdSBhZG9wdCBtaWNyb2FtcHMvbWljcm92b2x0cyB0
aGVuIHRoZQpoYXJkLXRvLXJlYWQgcHJvYmxlbSB3aWxsIGdldCBldmVuIHdvcnNlIHVubGVzcyB5
b3UgZ2V0IGxvb3BzIHRvIGRvIG9ubHkKb25lIHRoaW5nIQoKCkRhbmllbC4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxp
bmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
