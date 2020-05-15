Return-Path: <SRS0=cOAS=65=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9C19C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 May 2020 13:12:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52F1620709
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 May 2020 13:12:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iVNRg+E4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 52F1620709
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MpsrjJMo3JMfuemPV2w8JJbVeRl2BZZVpjTaWa/aGFY=; b=iVNRg+E4yu4i4b
	TOA2qkzBX0pIUQjxzk1FcwvNPOws0CyeyUl/8hRnGv2CTIBXhkmLhNSkFOqxqTxzZmw7JPjJtDvuw
	5znYb9Gl7CdTY0RYb/xDhxBy1Kn+ux9kEYCxn4X0EG8gAcIPeoC4ARulLTly7QqhFUECIEC2kXqN3
	ytd68yGuJdumgpo/h8bgFpy7G9ynnq/kNWPasrT5FZ1xEtDFhV1l/XWUwJVex9RmZkgd9r+A3KviQ
	SW8PefSqypwKCWUU4RWwyY3DSXoWvsJPySvq3KMkBuXOcWhd29tIp1Zn3eDF8O7fFc4mu2mtHvlFo
	B3oo5ydNeV7lQwsZvByQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZa8d-0000Um-QE; Fri, 15 May 2020 13:12:31 +0000
Received: from mout.kundenserver.de ([212.227.126.134])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZa8S-0000IZ-5F; Fri, 15 May 2020 13:12:21 +0000
Received: from mail-qv1-f50.google.com ([209.85.219.50]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MuVOM-1jHMpO35qk-00rY6X; Fri, 15 May 2020 15:12:16 +0200
Received: by mail-qv1-f50.google.com with SMTP id ee19so1000347qvb.11;
 Fri, 15 May 2020 06:12:16 -0700 (PDT)
X-Gm-Message-State: AOAM530eVEliJ+0+Me68etlkkNzeEW9nzPtwZ0wLV2Jty0PZhwFRwM1a
 w/KCUEIHsRdnOa/sGxk32dj8f1aXpSrw7CPGrs0=
X-Google-Smtp-Source: ABdhPJzL0kbPaWt/UYw2Uz2rNIXYk/KnlaMI5B0hSICGSdegHY/AByOI15lsImUtudCP8+CPlNhdx49cfpzs91/rvyQ=
X-Received: by 2002:a05:6214:1392:: with SMTP id
 g18mr3170818qvz.210.1589548335328; 
 Fri, 15 May 2020 06:12:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200514075942.10136-1-brgl@bgdev.pl>
 <20200514075942.10136-11-brgl@bgdev.pl>
 <CAK8P3a3=xgbvqrSpCK5h96eRH32AA7xnoK2ossvT0-cLFLzmXA@mail.gmail.com>
 <CAMRc=MeypzZBHo6dJGKm4JujYyejqHxtdo7Ts95DXuL0VuMYCw@mail.gmail.com>
 <CAK8P3a0u53rHSW=72CnnbhrY28Z+9f=Yv2K-bbj5OD+2Ds4unA@mail.gmail.com>
 <CAMRc=Mf_vYt1J-cc6aZ2-Qv_YDEymVoC7ZiwuG9BrXoGMsXepw@mail.gmail.com>
In-Reply-To: <CAMRc=Mf_vYt1J-cc6aZ2-Qv_YDEymVoC7ZiwuG9BrXoGMsXepw@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 15 May 2020 15:11:59 +0200
X-Gmail-Original-Message-ID: <CAK8P3a13k+X0XkkX=12x+22qVt_xxTBZr52ONQGdAY2T6XbpyA@mail.gmail.com>
Message-ID: <CAK8P3a13k+X0XkkX=12x+22qVt_xxTBZr52ONQGdAY2T6XbpyA@mail.gmail.com>
Subject: Re: [PATCH v3 10/15] net: ethernet: mtk-eth-mac: new driver
To: Bartosz Golaszewski <brgl@bgdev.pl>
X-Provags-ID: V03:K1:75D78YQUbOLJjGX9MURtany/McPDB3RCDnppMewfrV6Hk772FAT
 qZjFKbUBQ3aKZtiuPj/VGahuLhA+VbX2tB7uvV44yS4yDenTBLbEKP8ygCf650wMw8t7vPg
 SXo4SPU7/wXgtk6qvMk9mrADlaTJgYz4oqrbxdUGYHJyHzyBYkqQOe7LyMVN7RisTErR/Iy
 pndqFZ72pHj/Ke0MpgEYw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:KUfYQLkjYrI=:AXwvA2913a9A6IHswJKZbF
 ZVSpG32bYvwSjKKjsJ4PxX+WnyoDqYI3CzJ3oKUIIQ7sYlglHyLU/FNA9P8tAIav5BZqbbtiV
 98DU19TJrD0fb4NBC0Q5kyRh6sLXcly7S8IanGF/A5OAfSwPQ8YfZDsof8fbGufVlqwydkvx7
 2y2Cis8YTA8RFmm1ij5QfeutcxDeRaWkb4CPtEEnxrpkaXeWU2kUm/D2SK1xQjfR2xMcfgewG
 PgDZ8gRpMtrjhGtMOmPX9kxNZQM17vvzpmL7Fa7Mye6uJonVBFuRlt15mWVHJnMyBuT/muL63
 63Ar4XuzltF2dS3BfvvNV4pSaRVd3/zHC2KXDxWv5NUKlVlqpZJioUT0fCHEJvC/f27e8PUFw
 zS/dlG1SfS/i5OmQzqpQR/hWXaVJp8zx7pimF120VxyY6ypeG9tprIFDdrLX+UPQsWL+cFHsw
 vGFemCWeJ3M6KU1EjhQMeY4xqNN6ttJ+Gg1i4vj6QI8Kh6XoTUa07DbrF5jbWwf176T/uoC9W
 aKP4cHYkc7w0mUEPVyKznw48mJOTgjbiHR0+UjnJdVMOA3+KZgLD5EdlCrpWP7qU66lpyjaLS
 2SYwOZdx8evAubFH07jA6ntqUDfuSxGpeT4VOF2H4oeKtq9Q3tFLFAkhI1Y0aNR0J3axr397B
 ZBqgBLSn9MctfuokuDUBLn3Ye7j4SlUmvhHtyqog2UGud5tattjLbCi+sUrUKCYYBLJXMAHCw
 kaego8DDIt057E+Sn3TLko+i9UiFWZb4TnizY1LXGkhNGHNKbL9pXZJ0VGAnysPPPA8GQnjcr
 PzuF38tc+EwhCcsrx/rtMP421fhlUjKSK7GaA+AsXIyHoIzi44=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200515_061220_571374_70C8738C 
X-CRM114-Status: GOOD (  19.73  )
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
Cc: Edwin Peer <edwin.peer@broadcom.com>, DTML <devicetree@vger.kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Stephane Le Provost <stephane.leprovost@mediatek.com>,
 Jonathan Corbet <corbet@lwn.net>, Networking <netdev@vger.kernel.org>,
 Sean Wang <sean.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Pedro Tsai <pedro.tsai@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 Andrew Perepech <andrew.perepech@mediatek.com>,
 John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, "David S . Miller" <davem@davemloft.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBNYXkgMTUsIDIwMjAgYXQgMjo1NiBQTSBCYXJ0b3N6IEdvbGFzemV3c2tpIDxicmds
QGJnZGV2LnBsPiB3cm90ZToKPiBwdC4sIDE1IG1haiAyMDIwIG8gMTQ6MDQgQXJuZCBCZXJnbWFu
biA8YXJuZEBhcm5kYi5kZT4gbmFwaXNhxYIoYSk6Cj4gPiBPbiBGcmksIE1heSAxNSwgMjAyMCBh
dCA5OjExIEFNIEJhcnRvc3ogR29sYXN6ZXdza2kgPGJyZ2xAYmdkZXYucGw+IHdyb3RlOgoKPiA+
ID4gPgo+ID4gPiA+IEl0IGxvb2tzIGxpa2UgbW9zdCBvZiB0aGUgc3R1ZmYgaW5zaWRlIG9mIHRo
ZSBsb29wIGNhbiBiZSBwdWxsZWQgb3V0Cj4gPiA+ID4gYW5kIG9ubHkgZG9uZSBvbmNlIGhlcmUu
Cj4gPiA+ID4KPiA+ID4KPiA+ID4gSSBkaWQgdGhhdCBpbiBvbmUgb2YgdGhlIHByZXZpb3VzIHN1
Ym1pc3Npb25zIGJ1dCBpdCB3YXMgcG9pbnRlZCBvdXQKPiA+ID4gdG8gbWUgdGhhdCBhIHBhcmFs
bGVsIFRYIHBhdGggbWF5IGZpbGwgdXAgdGhlIHF1ZXVlIGJlZm9yZSBJIHdha2UgaXQuCj4gPgo+
ID4gUmlnaHQsIEkgc2VlIHlvdSBwbHVnZ2VkIHRoYXQgaG9sZSwgaG93ZXZlciB0aGUgd2F5IHlv
dSBob2xkIHRoZQo+ID4gc3BpbmxvY2sgYWNyb3NzIHRoZSBleHBlbnNpdmUgRE1BIG1hbmFnZW1l
bnQgYnV0IHRoZW4gZ2l2ZSBpdAo+ID4gdXAgaW4gZWFjaCBsb29wIGl0ZXJhdGlvbiBmZWVscyBs
aWtlIHRoaXMgaXMgbm90IHRoZSBtb3N0IGVmZmljaWVudAo+ID4gd2F5Lgo+ID4KPgo+IE1heWJl
IG15IHRoaW5raW5nIGlzIHdyb25nIGhlcmUsIGJ1dCBJIGFzc3VtZWQgdGhhdCB3aXRoIGEgc3Bp
bmxvY2sKPiBpdCdzIGJldHRlciB0byBnaXZlIG90aGVyIHRocmVhZHMgdGhlIGNoYW5jZSB0byBy
dW4gaW4gYmV0d2VlbiBlYWNoCj4gaXRlcmF0aW9uLiBJIGRpZG4ndCBiZW5jaG1hcmsgaXQgdGhv
dWdoLgoKSXQgZGVwZW5kcy4gWW91IHdhbnQgdG8gYXZvaWQgbG9jayBjb250ZW50aW9uICh0d28g
dGhyZWFkcyB0cnlpbmcgdG8KZ2V0IHRoZSBsb2NrIGF0IHRoZSBzYW1lIHRpbWUpIGJ1dCB5b3Ug
YWxzbyB3YW50IHRvIGF2b2lkIGJvdW5jaW5nCmFyb3VuZCB0aGUgc3BpbmxvY2sgYmV0d2VlbiB0
aGUgY2FjaGVzLgoKSW4gdGhlIGNvbnRlbnRpb24gY2FzZSwgd2hhdCBJIHRoaW5rIHdvdWxkIGhh
cHBlbiBoZXJlIGlzIHRoYXQgdGhlCmNsZWFudXAgdGhyZWFkIGdpdmVzIHVwIHRoZSBsb2NrIGFu
ZCB0aGUgeG1pdCBmdW5jdGlvbiBnZXRzIGl0LCBidXQKdGhlbiB0aGUgY2xlYW51cCB0aHJlYWQg
aXMgc3Bpbm5pbmcgYWdhaW4sIHNvIHlvdSBhcmUgc3RpbGwgYmxvY2tlZApvbiBvbmUgb2YgdGhl
IHR3byBDUFVzIGJ1dCBhbHNvIHBheSB0aGUgb3ZlcmhlYWQgb2Ygc3luY2hyb25pemluZwpiZXR3
ZWVuIHRoZSB0d28uCgpIb2xkaW5nIHRoZSBsb2NrIHRoZSB3aG9sZSB0aW1lIHdvdWxkIHNwZWVk
IHVwIGJvdGggdGhlIGdvb2QgY2FzZQoobm8gY29udGVudGlvbikgYW5kIHRoZSBiYWQgY2FzZSAo
Ym91bmNpbmcgdGhlIGxvY2spIGEgbGl0dGxlIGJpdApiZWNhdXNlIGl0IHNhdmVzIHNvbWUgb3Zl
cmhlYWQuIEhvbGRpbmcgdGhlIGxvY2sgZm9yIHNob3J0ZXIKdGltZXMgKGkuZS4gbm90IGR1cmlu
ZyB0aGUgY2FjaGUgb3BlcmF0aW9ucykgd291bGQgcmVkdWNlIHRoZQphbW91bnQgb2YgbG9jay1j
b250ZW50aW9uIGJ1dCBub3QgaGVscCBpbiB0aGUgZ29vZCBjYXNlLgoKTm90IG5lZWRpbmcgYSBs
b2NrIGF0IGFsbCBpcyBnZW5lcmFsbHkgYmVzdCwgYnV0IGdldHRpbmcgaXQgcmlnaHQKaXMgdHJp
Y2t5IDstKQoKICAgICAgQXJuZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tZWRpYXRlawo=
