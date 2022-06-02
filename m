Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95AB5C43334
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jun 2022 12:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wtshWAiA8v6kPycJtgk03QY3wBjcxOdz62up9IaWFh8=; b=E/8RgkZ1ol0M7l
	spwJF5k9GjFjrLGNwKeJ64FuyB0zd3KNa6fTtirlQdz9pMZLqJeBiI81PbQ2hUFOm2cIZTwM9Mm0x
	aZsLa/cOT860fzR+ygCQreF1qr2x9NhC0vJZMEiE2ipIpFeM2A0OCxtUDHsnFbpZ9Fy93sZ+juOLZ
	QYYmER9a4k8DaHocgojp55AUrF8a9gN7iUl+0T27PHqErNyHQhohKJZRakiTkH7+Luj2DC4JPevHf
	B/+aLZ4GBUvPrhSK91riiOPWgxA/QCCR6rrfOa2xi+ADVWBGWcXruNGodrXel6y7lAUVPUfeHhE6V
	ojsGQUJMZGJhj8g13K8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwjcf-003847-UU; Thu, 02 Jun 2022 12:08:18 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwjbo-0037bG-0l; Thu, 02 Jun 2022 12:07:26 +0000
Received: by mail-pf1-x42b.google.com with SMTP id 187so4584820pfu.9;
        Thu, 02 Jun 2022 05:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=XwcwX6loUblFTwI5Bhmlqw2TBVsxdFoQXDJc3TovI80=;
        b=k7esYmpY4T8Q9KWtH0jxmxeHnbiHqRF3LqvsK/4Ug3Jqt1gx+19gOZth9lZtzHsVKs
         z65zFnDsir6/cGI09w4DESfFBhn0W5yFwcDHUhGt52REfaoXr8Lc3VEDfnfNLuP0/o4D
         QhmI2Ziwo2TGGYdyx1kXgJ3Stahlm838VXMAuafTcApdKShsfEtVjX9TkbD+0Bn3YGXN
         cu4WTkIfORLzLsRbi8XMZ5t129tM/R0mlJLffyFB4beE1GnzDQtiOj8V92AdJoeaUJkr
         MOUy0Z8FtpbwiXb1/kULCSN9k82OaEpM+B4qbR683RScjbId31DRofz7DKXeQlDpP1zH
         wMRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=XwcwX6loUblFTwI5Bhmlqw2TBVsxdFoQXDJc3TovI80=;
        b=bzSfOU4DBIcs85vQxZVWPkoUuJvlUWhaHwWw585HmSlHs2vDe6nz4bVF8NOWhbuFup
         YRW0uAd7R4yY4/Bfh2IQovLO9a7XMSX5CcjJMOMoeoMS53BU2DWHPX/L3L77mvvgE443
         lafNRwL6ArFqs/kOufy4WqkN9M/oUED8oAc0505Mw9LhFifGj2psCXHCiXZsZJzwaAMa
         40UZlM6wy08d+tG1w2vxRwLvKaJ8DXNteiwvC+yTcbvfMmwckyAnYhWBkDKZnP2oe+gR
         5lIhGrXS+FkxnVVhw9Bek39SffgA+nWe6VAckPsGj+3eTchdZrDLefhiDM6mEqBkkEnc
         VyYA==
X-Gm-Message-State: AOAM532mhL9HZ3/LPyTxDdyGyBrZl8nDW+8b94pzcywj+8bvyk7mx6s2
	tQlB2GNhxMfZs1WBGR2j7Z5LEAuHamGT5axdnug=
X-Google-Smtp-Source: ABdhPJwLN3JLAZweJSj8I9PDnQ5t3UDnCmJ6jzOmk2NgYlJRjY/uTSAVQc8mkFdLPGGc+2hlm0r13u/yFcGFZ+aEYy0=
X-Received: by 2002:a63:2c15:0:b0:3f6:6a5f:8f0a with SMTP id
 s21-20020a632c15000000b003f66a5f8f0amr3954364pgs.76.1654171639739; Thu, 02
 Jun 2022 05:07:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220531102809.11976-1-peterwu.pub@gmail.com> <20220531102809.11976-8-peterwu.pub@gmail.com>
 <CAHp75VdUQqihr=AX-wEUD05jY1ReL63hMCL+eaqmjkN8CsS_Vg@mail.gmail.com>
In-Reply-To: <CAHp75VdUQqihr=AX-wEUD05jY1ReL63hMCL+eaqmjkN8CsS_Vg@mail.gmail.com>
From: szuni chen <szunichen@gmail.com>
Date: Thu, 2 Jun 2022 20:07:08 +0800
Message-ID: <CA+hk2fasiriGHepNjsnPCqTMJOgAEbVHACmWrDRZY7cHPcOQqA@mail.gmail.com>
Subject: Re: [PATCH 07/14] leds: flashlight: mt6370: Add Mediatek MT6370
 flashlight support
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: ChiaEn Wu <peterwu.pub@gmail.com>, Lee Jones <lee.jones@linaro.org>, 
	Daniel Thompson <daniel.thompson@linaro.org>, Jingoo Han <jingoohan1@gmail.com>, 
	Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Sebastian Reichel <sre@kernel.org>, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	"Krogerus, Heikki" <heikki.krogerus@linux.intel.com>, Helge Deller <deller@gmx.de>, cy_huang@richtek.com, 
	alice_chen@richtek.com, chiaen_wu@richtek.com, 
	dri-devel <dri-devel@lists.freedesktop.org>, 
	Linux LED Subsystem <linux-leds@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, 
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>, 
	USB <linux-usb@vger.kernel.org>, linux-iio <linux-iio@vger.kernel.org>, 
	"open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220602_050724_120808_C12A4195 
X-CRM114-Status: GOOD (  22.34  )
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

VGhhbmsgeW91IGZvciB0aGUgdmFsdWFibGUgc3VnZ2VzdGlvbi4KCkFuZHkgU2hldmNoZW5rbyA8
YW5keS5zaGV2Y2hlbmtvQGdtYWlsLmNvbT4g5pa8IDIwMjLlubQ25pyIMeaXpSDpgLHkuIkg5LiL
5Y2INTo1N+Wvq+mBk++8mgo+Cj4gT24gVHVlLCBNYXkgMzEsIDIwMjIgYXQgMTozMiBQTSBDaGlh
RW4gV3UgPHBldGVyd3UucHViQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gRnJvbTogQWxpY2Ug
Q2hlbiA8YWxpY2VfY2hlbkByaWNodGVrLmNvbT4KPiA+Cj4gPiBBZGQgTWVkaWF0ZWsgTVQ2Mzcw
IGZsYXNobGlnaHQgc3VwcG9ydAo+Cj4gU2FtZSBjb21tZW50cyBhYm91dCB0aGUgY29tbWl0IG1l
c3NhZ2UuCj4KPiAuLi4KPgo+ID4gKyNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4K
PiA+ICsjaW5jbHVkZSA8bGludXgvcHJvcGVydHkuaD4KPiA+ICsjaW5jbHVkZSA8bGludXgvcmVn
bWFwLmg+Cj4KPiArIGJsYW5rIGxpbmU/ClRoYW5rcywgdGhpcyB3aWxsIGJlIHJlZmluZWQgaW4g
dGhlIG5ldyB2ZXJzaW9uLgo+Cj4gPiArI2luY2x1ZGUgPG1lZGlhL3Y0bDItZmxhc2gtbGVkLWNs
YXNzLmg+Cj4KPiArIGJsYW5rIGxpbmUKVGhhbmtzLCB0aGlzIHdpbGwgYmUgcmVmaW5lZCBpbiB0
aGUgbmV3IHZlcnNpb24uCj4KPiA+ICtlbnVtIHsKPiA+ICsgICAgICAgTVQ2MzcwX0xFRF9GTEFT
SDEsCj4gPiArICAgICAgIE1UNjM3MF9MRURfRkxBU0gyLAo+ID4gKyAgICAgICBNVDYzNzBfTUFY
X0xFRFMKPiA+ICt9Owo+Cj4gLi4uCj4KPiA+ICsgICAgICAgc3RydWN0IG10NjM3MF9sZWQgKmxl
ZCA9IGNvbnRhaW5lcl9vZihmbF9jZGV2LCBzdHJ1Y3QgbXQ2MzcwX2xlZCwKPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmbGFzaCk7Cj4KPiA+ICsgICAg
ICAgc3RydWN0IG10NjM3MF9sZWQgKmxlZCA9IGNvbnRhaW5lcl9vZihmbF9jZGV2LCBzdHJ1Y3Qg
bXQ2MzcwX2xlZCwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBmbGFzaCk7Cj4KPiBNYWtlIGEgaGVscGVyIG91dCBvZiB0aGlzCj4KPiAgICNkZWZpbmUg
dG9fbXQ2MzdfbGVkKCkgIGNvbnRhaW5lcl9vZigpCj4KPiBhbmQgcmV1c2UuClRoYW5rcywgdGhp
cyB3aWxsIGJlIHJlZmluZWQgaW4gdGhlIG5ldyB2ZXJzaW9uLgo+Cj4gLi4uCj4KPiA+ICsgICAg
ICAgLyoKPiA+ICsgICAgICAgICogRm9yIHRoZSBmbGFzaCB0dXJuIG9uL29mZiwgSFcgcmFtcHBp
bmcgdXAvZG93biB0aW1lIGlzIDVtcy81MDB1cywKPgo+IHJhbXBpbmcKPgo+ID4gKyAgICAgICAg
KiByZXNwZWN0aXZlbHkKPgo+IFBlcmlvZCEKVGhhbmtzLCB0aGlzIHdpbGwgYmUgcmVmaW5lZCBp
biB0aGUgbmV3IHZlcnNpb24uCj4KPiA+ICsgICAgICAgICovCj4KPiAuLi4KPgo+ID4gKyAgICAg
ICBjb25zdCBjaGFyICogY29uc3Qgc3RhdGVzW10gPSB7ICJvZmYiLCAia2VlcCIsICJvbiIgfTsK
PiA+ICsgICAgICAgY29uc3QgY2hhciAqc3RyOwo+ID4gKyAgICAgICBpbnQgcmV0Owo+ID4gKwo+
ID4gKyAgICAgICBpZiAoIWZ3bm9kZV9wcm9wZXJ0eV9yZWFkX3N0cmluZyhpbml0X2RhdGEtPmZ3
bm9kZSwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgImRlZmF1
bHQtc3RhdGUiLCAmc3RyKSkgewo+ID4gKyAgICAgICAgICAgICAgIHJldCA9IG1hdGNoX3N0cmlu
ZyhzdGF0ZXMsIEFSUkFZX1NJWkUoc3RhdGVzKSwgc3RyKTsKPiA+ICsgICAgICAgICAgICAgICBp
ZiAocmV0IDwgMCkKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldCA9IFNUQVRFX09GRjsK
PiA+ICsKPiA+ICsgICAgICAgICAgICAgICBsZWQtPmRlZmF1bHRfc3RhdGUgPSByZXQ7Cj4gPiAr
ICAgICAgIH0KPgo+IGZ3bm9kZV9wcm9wZXJ0eV9tYXRjaF9zdHJpbmcoKT8KU29ycnksIGJ1dCBJ
IHRoaW5rIHRoZSB1c2Ugb2YgdGhpcyBmdW5jdGlvbiBpcyBkaWZmZXJlbnQgZnJvbSBteSB0YXJn
ZXQuCkkgd2FudCB0byByZWFkIHRoZSBzdHJpbmcgb2YgdGhlICJkZWZhdWx0LXN0YXRlIiBwcm9w
ZXJ0eSBhbmQgZmlndXJlCm91dCBpZiB0aGUgc3RyaW5nIGlzIGluIHRoZSBzdGF0ZXMgYXJyYXku
CkJ1dCB0aGUgZndub2RlX3Byb3BlcnR5X21hdGNoX3N0cmluZyBhaW1lZCB0byBmaWd1cmUgb3V0
IGlmIHRoZSBzdGF0ZQppbiB0aGUgcHJvcGVydHkgYXJyYXkuCk9uZSBpcyBhIHByb3BlcnR5IGFy
cmF5IGFuZCBhbm90aGVyIG9uZSBpcyBhIHN0YXRlIGFycmF5Lgo+Cj4gLi4uCj4KPiA+ICsgICAg
ICAgaWYgKCFjb3VudCB8fCBjb3VudCA+IE1UNjM3MF9NQVhfTEVEUykgewo+ID4gKyAgICAgICAg
ICAgICAgIGRldl9lcnIoJnBkZXYtPmRldiwKPiA+ICsgICAgICAgICAgICAgICAiTm8gY2hpbGQg
bm9kZSBvciBub2RlIGNvdW50IG92ZXIgbWF4IGxlZCBudW1iZXIgJWx1XG4iLCBjb3VudCk7Cj4g
PiArICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4KPiByZXR1cm4gZGV2X2Vycl9wcm9i
ZSguLi4pOwpUaGFua3MsIHdpbGwgcmVmaW5lIGluIHRoZSBuZXcgdmVyc2lvbgo+Cj4gPiArICAg
ICAgIH0KPgo+Cj4gLS0KPiBXaXRoIEJlc3QgUmVnYXJkcywKPiBBbmR5IFNoZXZjaGVua28KPgo+
ClNpbmNlcmVseSwKQWxpY2UgQ2hlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVr
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tZWRpYXRlawo=
