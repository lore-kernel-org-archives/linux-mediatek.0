Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C587C43334
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jun 2022 13:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=toQqq7IdxY4EfDeGR2mZ10s7ZL7tn9LNX5xa5e3NIM8=; b=e1YPm7EE/PteDK
	3oei0r0hBMhszaSXDFGDX08tXJNozh1qvmCqfU+c3zraLAGaxvVL1Y7qL/1MRUngl1RXKdBJq1BBe
	IiVg30OAKPe82yZEh8xM9CkA311E6WjN/8xNXv7jk3LJhtvLU8/bpKonTpHMxBTnJD7/4qfmPwzZv
	1wYapQTytOG8GHhoyTbKEaG1dGsWvJ4kscRzrUN5oaExpqjFJWyS9U6Hb7q5vfoyLEkqSahqEctYP
	g0qJ4VpoGFA3L3GijFgqW1nZ3cAYNT5W1sr5nkVXf7jkXpgkK1KuJ1mWNs2NoR6vXZktdsrY3D9xI
	/hg9aToLdfuPBxuiIpow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwlL1-003UYq-0B; Thu, 02 Jun 2022 13:58:11 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwlKp-003UVB-9s; Thu, 02 Jun 2022 13:58:00 +0000
Received: by mail-ej1-x634.google.com with SMTP id q21so10172543ejm.1;
        Thu, 02 Jun 2022 06:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=lCjXd1DtLAOiKDUVepuP3tVKlqmoM9phz1lypZW4eiM=;
        b=eKXUR7kiBU80Kt1ivUsBYC1Vp5ABsZgOFlwcUTfYnL3EYaoBLLC4llE6qNCbLYkoPK
         yV/E9DUt2ifgfA2Nbk6ykWpgQhfm9txSuz+Z9LmYA2e0QtK14BpQdaIg86EMFNfuUWkx
         hMXNoGeRpp7Hw5ALo7uCiIN/Vg+bFN+64MnxIrSs4784P1udBgejLUQnnHasBXCy/VJv
         Hraq92Husrz3Xf7aLdubPKJuxySVXpGPA0CZZLKoHOr29+EvAoDaQOSqIfuA/pA2wdFl
         oxnZHqbsTfLFBaxgW2BGhnhwkC0uMC12x04YUFSe3zvFWWisWKPD/j9A/tTeJZTOCSWO
         kQFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=lCjXd1DtLAOiKDUVepuP3tVKlqmoM9phz1lypZW4eiM=;
        b=g0X8rZqcxDLk2OfyiM3tidSDzgqUmxNIS///7sLb818r095mmiBxyo3H1y/z0tihCj
         4WHsl9l0NXsHxWQ8I+hKJiEDrB1m4HtyurQLtovmXvpfMmKV5l7fiDo2oLkHi3TMUqsX
         DGryZa8lb86ACiA6bDRKAgCI3f6wp/m7qIVh5GNmKLLNdufX7gVCLPVpSRZNo/18qnjQ
         Uf17N4IURRIKA+t95Zjtq5hwGC/O3QtpHjiOXGk4J33Jj3heky4icY9FnxxPhUiKIvzM
         4i/CI8YteE+B8RhIC1h3YDUd5OnfOu5q2c4zQq8lJILu4F442YqAsnV4dw8cJPYaUDT6
         qvJw==
X-Gm-Message-State: AOAM531uxsI+QJBuXLFuLImWbghGq3FJEv2mSE7aTDRheKwIaYccdBIA
	p8OcpilPWHz4hdCANHJDQ4EDgsq4QdAV60zBqnM=
X-Google-Smtp-Source: ABdhPJw17vPxP2UwrASUkgWE75bkBumiXi0yzz2upgIbMhdhBA7mECqviI1+XnRf2zU0lOm4Q01q8wM9WsX0p02cGPY=
X-Received: by 2002:a17:907:6e04:b0:6f4:d6f3:c72a with SMTP id
 sd4-20020a1709076e0400b006f4d6f3c72amr4545345ejc.636.1654178277156; Thu, 02
 Jun 2022 06:57:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220531102809.11976-1-peterwu.pub@gmail.com> <20220531102809.11976-8-peterwu.pub@gmail.com>
 <CAHp75VdUQqihr=AX-wEUD05jY1ReL63hMCL+eaqmjkN8CsS_Vg@mail.gmail.com> <CA+hk2fasiriGHepNjsnPCqTMJOgAEbVHACmWrDRZY7cHPcOQqA@mail.gmail.com>
In-Reply-To: <CA+hk2fasiriGHepNjsnPCqTMJOgAEbVHACmWrDRZY7cHPcOQqA@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 2 Jun 2022 15:57:19 +0200
Message-ID: <CAHp75Vf=ATRfaaaGFuuPHuQj6wTjnRPBw4W5WYfgYuUP-A-L=g@mail.gmail.com>
Subject: Re: [PATCH 07/14] leds: flashlight: mt6370: Add Mediatek MT6370
 flashlight support
To: szuni chen <szunichen@gmail.com>
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
X-CRM114-CacheID: sfid-20220602_065759_383053_113A5395 
X-CRM114-Status: GOOD (  17.59  )
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

T24gVGh1LCBKdW4gMiwgMjAyMiBhdCAyOjA3IFBNIHN6dW5pIGNoZW4gPHN6dW5pY2hlbkBnbWFp
bC5jb20+IHdyb3RlOgo+IEFuZHkgU2hldmNoZW5rbyA8YW5keS5zaGV2Y2hlbmtvQGdtYWlsLmNv
bT4g5pa8IDIwMjLlubQ25pyIMeaXpSDpgLHkuIkg5LiL5Y2INTo1N+Wvq+mBk++8mgo+ID4gT24g
VHVlLCBNYXkgMzEsIDIwMjIgYXQgMTozMiBQTSBDaGlhRW4gV3UgPHBldGVyd3UucHViQGdtYWls
LmNvbT4gd3JvdGU6CgouLi4KCj4gPiA+ICsgICAgICAgY29uc3QgY2hhciAqIGNvbnN0IHN0YXRl
c1tdID0geyAib2ZmIiwgImtlZXAiLCAib24iIH07Cj4gPiA+ICsgICAgICAgY29uc3QgY2hhciAq
c3RyOwo+ID4gPiArICAgICAgIGludCByZXQ7Cj4gPiA+ICsKPiA+ID4gKyAgICAgICBpZiAoIWZ3
bm9kZV9wcm9wZXJ0eV9yZWFkX3N0cmluZyhpbml0X2RhdGEtPmZ3bm9kZSwKPiA+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiZGVmYXVsdC1zdGF0ZSIsICZzdHIp
KSB7Cj4gPiA+ICsgICAgICAgICAgICAgICByZXQgPSBtYXRjaF9zdHJpbmcoc3RhdGVzLCBBUlJB
WV9TSVpFKHN0YXRlcyksIHN0cik7Cj4gPiA+ICsgICAgICAgICAgICAgICBpZiAocmV0IDwgMCkK
PiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0ID0gU1RBVEVfT0ZGOwo+ID4gPiArCj4g
PiA+ICsgICAgICAgICAgICAgICBsZWQtPmRlZmF1bHRfc3RhdGUgPSByZXQ7Cj4gPiA+ICsgICAg
ICAgfQo+ID4KPiA+IGZ3bm9kZV9wcm9wZXJ0eV9tYXRjaF9zdHJpbmcoKT8KPiBTb3JyeSwgYnV0
IEkgdGhpbmsgdGhlIHVzZSBvZiB0aGlzIGZ1bmN0aW9uIGlzIGRpZmZlcmVudCBmcm9tIG15IHRh
cmdldC4KPiBJIHdhbnQgdG8gcmVhZCB0aGUgc3RyaW5nIG9mIHRoZSAiZGVmYXVsdC1zdGF0ZSIg
cHJvcGVydHkgYW5kIGZpZ3VyZQo+IG91dCBpZiB0aGUgc3RyaW5nIGlzIGluIHRoZSBzdGF0ZXMg
YXJyYXkuCj4gQnV0IHRoZSBmd25vZGVfcHJvcGVydHlfbWF0Y2hfc3RyaW5nIGFpbWVkIHRvIGZp
Z3VyZSBvdXQgaWYgdGhlIHN0YXRlCj4gaW4gdGhlIHByb3BlcnR5IGFycmF5Lgo+IE9uZSBpcyBh
IHByb3BlcnR5IGFycmF5IGFuZCBhbm90aGVyIG9uZSBpcyBhIHN0YXRlIGFycmF5LgoKQWgsIGlu
ZGVlZC4gTmV2ZXJ0aGVsZXNzIHlvdSBtYXkgcmVkdWNlIHRoZSBjb2RlIGJhc2UgYnkgZG9pbmcg
bGlrZQp0aGUgZm9sbG93aW5nIChJIHdvbmRlciB3aGF0IHlvdXIgY29kZSBkbyBpZiB0aGVyZSBp
cyBubyBkZWZhdWx0LXN0YXRlCnByb3BlcnR5KToKCiAgbGVkLT5kZWZhdWx0X3N0YXRlID0gU1RB
VEVfT0ZGOyAvLyBpdCdzIGJ5IGRlZmF1bHQgb2ZmIHNpbmNlCmt6YWxsb2MoKSwgc28gSSBkb24n
dCBzZWUgd2h5IHdlIG5lZWQgdGhpcyBsaW5lIGF0IGFsbC4KCiAgZndub2RlX3Byb3BlcnR5X3Jl
YWRfc3RyaW5nKGluaXRfZGF0YS0+Zndub2RlLCAiZGVmYXVsdC1zdGF0ZSIsICZzdHIpOwogIHJl
dCA9IG1hdGNoX3N0cmluZyhzdGF0ZXMsIEFSUkFZX1NJWkUoc3RhdGVzKSwgc3RyKTsKICBpZiAo
cmV0ID49IDApCiAgICBsZWQtPmRlZmF1bHRfc3RhdGUgPSByZXQ7CgoKLS0gCldpdGggQmVzdCBS
ZWdhcmRzLApBbmR5IFNoZXZjaGVua28KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRl
a0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
