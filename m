Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93C95C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jun 2022 09:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WVBQ3+NVyF061jiDcM3Uye+d2d6l3mv+S0m0UXwl3S4=; b=p9XMcwT4zB46e3
	/rGde2Osk4ihhl+WMirU7gFZHBzE8kcGU0OHK65+zBGseH7bKors312dBZKW4JkUTeCseJFyuNX/9
	CKirU87BtiefW/f6f2gTsX7i8rQS0rb95jJofiJKqOAO3SCcVMgrfAyhhN+1PnSwaconxKKsPmAVQ
	9XMdNtST24Swet6214lKlJDYHDrMhF5wj/E4HsojfdGXJGoeBCiXpq1ul0B86HMKeKZOlGP0pdIGr
	1qhzrYt6QfbG+qO/GzqUM8QhINK/CGU8Je0EA9eCB2lhBsPKn+2YcRryBH2NpYwviVDLXbUhGCt5D
	ycHumq/BP0BCjt/F0b+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwhF4-002Ulx-NP; Thu, 02 Jun 2022 09:35:46 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwhEs-002UfQ-EA; Thu, 02 Jun 2022 09:35:35 +0000
Received: by mail-lf1-x133.google.com with SMTP id s6so6880448lfo.13;
        Thu, 02 Jun 2022 02:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=rBGjBOMnZl6to9efJaumbeOWSvKP8/DOct/QBdXnYoE=;
        b=jvY/M4TcfKUtycVJEjl3vv3zcqK0vVXzP6oHwxbhveiR6Eve6NDt0Von5+VteqUBV0
         0L333UPalxOSb+vAx5ej9FW4zDL3jiSJBKKI5g/bfbegljG05danKDxYAC1Mawnygsr8
         NfvqH2NN74NnI5rLy+2zi6GU0sJ4y2QMkIhCQuT0rdAnmGP6i+nYifRZZ1QarEQWaWqU
         1sFUjgMVvdhRWoctqpRRBSRSxoYCb/XYfFaItHlctIxH4eSOMldKOv1TbUyAo4DKKvuT
         uI9O7Tb6ZGTcE2JxUT1KvCqoqebUvm2IiT9ek+R0V9Lk4hCNqrOX4e+Amz04wcKyd1yK
         Jadg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=rBGjBOMnZl6to9efJaumbeOWSvKP8/DOct/QBdXnYoE=;
        b=ZKfvY4v1mTcwABazqIgQ+D+QI3oj3MNJnr5Ts/Zh0rDnu4hkvBoB9aWnBf7QLoelgG
         taAewjQd1BRD+tv9FLO8mIWC8UB7j3IEiwESCgqCmfvdbO0Glm7sAAlFU1YqTm024W16
         8rw/lJl17J4JGsQqv5eklqsvm7bZvYcVhbiqC2rH72gXa5kB5/lBR6HSwSxnNEekbX/O
         +2Mk32BfdimSxkvcaP78ECxhbE4CYWCk7ZWkKiwXqZUtQl0ufT0WiveMf6N2zLfngleI
         /m+gKywf4xF6LCLZ9BzHs6PLq2zXZLWd3yRS21uGNBnZDZiTThLRkI2tal5bAxyyBSVH
         03HA==
X-Gm-Message-State: AOAM533LJK+u/VMwC+dgXtlSbVJPd1c3SI9OaWLYiTybgTR/RPf5Hy06
	P+R4amLQFBmQrRFaZUieItg1Hy9U106mqCM9iJc=
X-Google-Smtp-Source: ABdhPJwGnEM9jHCmHkWGx92/jl3eJw4zP0SFatjlcRCflAAlB9cVfAhhX5EONP3FSiW4lO0wQLnMioV43pqGQELiTHo=
X-Received: by 2002:a05:6512:2251:b0:478:fc67:b09f with SMTP id
 i17-20020a056512225100b00478fc67b09fmr2833144lfu.196.1654162532575; Thu, 02
 Jun 2022 02:35:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220531102809.11976-1-peterwu.pub@gmail.com> <20220531102809.11976-7-peterwu.pub@gmail.com>
 <CAHp75Vd8taco19vsDmBcCv8euV1SvwSiY5=P9oMkA6zWsjwXxg@mail.gmail.com>
 <20220602062643.GA13824@cyhuang-hp-elitebook-840-g3.rt> <CAHp75Vd-n=oLnhRCK=pR5ybOZbC6BKXrE2jRdwDbH90E4KYFGA@mail.gmail.com>
In-Reply-To: <CAHp75Vd-n=oLnhRCK=pR5ybOZbC6BKXrE2jRdwDbH90E4KYFGA@mail.gmail.com>
From: ChiYuan Huang <u0084500@gmail.com>
Date: Thu, 2 Jun 2022 17:35:15 +0800
Message-ID: <CADiBU3-73ktYfwZD=Dgd+5kWHraOuBkz1=bU_-+NNcxP12gcrQ@mail.gmail.com>
Subject: Re: [PATCH 06/14] leds: mt6370: Add Mediatek MT6370 Indicator support
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: ChiaEn Wu <peterwu.pub@gmail.com>, Lee Jones <lee.jones@linaro.org>, 
	Daniel Thompson <daniel.thompson@linaro.org>, Jingoo Han <jingoohan1@gmail.com>, 
	Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Sebastian Reichel <sre@kernel.org>, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	"Krogerus, Heikki" <heikki.krogerus@linux.intel.com>, Helge Deller <deller@gmx.de>, 
	cy_huang <cy_huang@richtek.com>, alice_chen@richtek.com, chiaen_wu@richtek.com, 
	dri-devel <dri-devel@lists.freedesktop.org>, 
	Linux LED Subsystem <linux-leds@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, 
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>, 
	USB <linux-usb@vger.kernel.org>, linux-iio <linux-iio@vger.kernel.org>, 
	"open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220602_023534_516722_F42F47CB 
X-CRM114-Status: GOOD (  23.11  )
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

QW5keSBTaGV2Y2hlbmtvIDxhbmR5LnNoZXZjaGVua29AZ21haWwuY29tPiDmlrwgMjAyMuW5tDbm
nIgy5pelIOmAseWbmyDkuIvljYg1OjE45a+r6YGT77yaCj4KPiBPbiBUaHUsIEp1biAyLCAyMDIy
IGF0IDg6MjcgQU0gQ2hpWXVhbiBIdWFuZyA8dTAwODQ1MDBAZ21haWwuY29tPiB3cm90ZToKPiA+
IE9uIFdlZCwgSnVuIDAxLCAyMDIyIGF0IDExOjQ4OjU4QU0gKzAyMDAsIEFuZHkgU2hldmNoZW5r
byB3cm90ZToKPiA+ID4gT24gVHVlLCBNYXkgMzEsIDIwMjIgYXQgMToxNiBQTSBDaGlhRW4gV3Ug
PHBldGVyd3UucHViQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiAuLi4KPgo+ID4gPiBXaGF0IGluZGlj
YXRvcj8KPiA+IEl0J3MgUkdCIGN1cmVudCBzaW5rIHR5cGUgTEVEIGRyaXZlciAobWF4aW11bSBz
dXBwb3J0ZWQgY3VycmVudCBpcyBvbmx5IDI0bUEpLgo+Cj4gTWFrZSB5b3VyIGNvbW1pdCBtZXNz
YWdlcyBhIHNsaWdodGx5IG1vcmUgdmVyYm9zZS4KPgpPSywgd2lsbCByZWZpbmUgdGhlIGNvbW1p
dCBtZXNzYWdlIGluIG5leHQuCj4gLi4uCj4KPiA+ID4gPiArI2luY2x1ZGUgPGxpbnV4L29mLmg+
Cj4gPiA+Cj4gPiA+IEFyZSB5b3Ugc3VyZSB0aGlzIGlzIHRoZSBjb3JyZWN0IGhlYWRlcj8gU2Vl
bXMgeW91IG5lZWQKPiA+ID4gbW9kX2RldmljZXRhYmxlLmggaW5zdGVhZC4KPiA+ID4KPiA+IEl0
J3MgdGhlIGNvcnJlY3QgaGVhZGVyIGFuZCBiZSB1c2VkIGZvciB0aGUgc3RydWN0ICdvZl9kZXZp
Y2VfaWQnLgo+Cj4gTm9wZS4gUnVuIHRoZSBmb2xsb3dpbmcgY29tbWFuZAo+ICQgZ2l0IGdyZXAg
LW4gJ3N0cnVjdCBvZl9kZXZpY2VfaWQgeycgLS0gaW5jbHVkZS9saW51eC8KPgpHb3QgaXQsIHRo
YW5rcy4KPiAuLi4KPgo+ID4gPiA+ICtzdHJ1Y3QgbXQ2MzcwX3ByaXYgewo+ID4gPiA+ICsgICAg
ICAgc3RydWN0IG11dGV4IGxvY2s7Cj4gPiA+Cj4gPiA+IERvIHlvdSB1c2UgcmVnbWFwIGxvY2tp
bmc/Cj4gPiA+Cj4gPiBNRkQgcmVnbWFwIHJlZ2lzdGVyIGFscmVhZHkgdGhlIGFjY2VzcyBsb2Nr
Lgo+ID4KPiA+IFRoaXMgbG9jayBpcyBqdXN0IHRvIGd1YXJhbnRlZSBvbmx5IG9uZSB1c2VyIGNh
biBhY2Nlc3MgdGhlIFJHQiByZWdpc3Rlcgo+ID4gcGFydC4KPiA+Cj4gPiBTb3JyeSwgZnJvbSB0
aGUgY29tbWVudCwgZG8geW91IHdhbnQgdXMgdG8gcmVuYW1lIG9yIHJlbW92ZSB0aGlzIGxvY2s/
Cj4KPiBNeSBwb2ludCBpcywgc2luY2UgeW91IGhhdmUgdHdvIGxvY2tzLCBleHBsYWluIHdoeSB5
b3UgbmVlZCBlYWNoIG9mIHRoZW0uCj4KT0ssIHdpbGwgbGVhdmUgYSBjb21tZW50IGxpbmUgdG8g
ZXhwbGFpbiB0aGUgdXNhZ2Ugb2YgdGhpcyBsb2NrLgo+ID4gPiA+ICsgICAgICAgc3RydWN0IGRl
dmljZSAqZGV2Owo+ID4gPgo+ID4gPiA+ICsgICAgICAgc3RydWN0IHJlZ21hcCAqcmVnbWFwOwo+
ID4gPgo+ID4gPiA+ICsgICAgICAgc3RydWN0IHJlZ21hcF9maWVsZCAqZmllbGRzW0ZfTUFYX0ZJ
RUxEU107Cj4gPiA+ID4gKyAgICAgICBjb25zdCBzdHJ1Y3QgcmVnX2ZpZWxkICpyZWdfZmllbGRz
Owo+ID4gPiA+ICsgICAgICAgY29uc3Qgc3RydWN0IGxpbmVhcl9yYW5nZSAqcmFuZ2VzOwo+ID4g
PiA+ICsgICAgICAgc3RydWN0IHJlZ19jZmcgKnJlZ19jZmdzOwo+ID4gPiA+ICsgICAgICAgdW5z
aWduZWQgaW50IGxlZHNfY291bnQ7Cj4gPiA+ID4gKyAgICAgICB1bnNpZ25lZCBpbnQgbGVkc19h
Y3RpdmU7Cj4gPiA+ID4gKyAgICAgICBib29sIGlzX210NjM3MjsKPiA+ID4gPiArICAgICAgIHN0
cnVjdCBtdDYzNzBfbGVkIGxlZHNbXTsKPiA+ID4gPiArfTsKPgo+Cj4gLS0KPiBXaXRoIEJlc3Qg
UmVnYXJkcywKPiBBbmR5IFNoZXZjaGVua28KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRp
YXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
