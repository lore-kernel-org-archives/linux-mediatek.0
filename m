Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A12CAC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Apr 2022 14:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a+Pl7ZB6s0WO8pO+h9O1tksLXPVJwpTmu4D5WNjmt7U=; b=otgJ0yY7wR077h
	TK96Nri4Cmnx8BAL/08gApxMMfEOqfomMFNEsZtDGFrqS/KVfYEfiDARnE4Pg30aXM27nlkQnIhxB
	1JPtc8yn0LlVTvRr6+gjFZzdilwCBsx6i2lYTZueAMRG2/oMpCmvswTWQzCe1NExJneqSYooYxnHL
	h5Ob7DzU8N/d1uKvE2usdNnU5fre6k1wvJifdn7FrLeI5XnAW0OUAelBmvD0r9CD1ZyDU9X04l2nQ
	MP3NwVv3lvhNHYL6/qbzC+jLRZHn9b/l/aN8zq2zENN6byPmaGFWjxOQrtohu2a+ID9hijTj4rSxf
	lZl+f8OJSyNv5csC1PMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nk5aD-007Ycu-0o; Thu, 28 Apr 2022 14:57:29 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nk5a0-007YaI-QD; Thu, 28 Apr 2022 14:57:18 +0000
Received: by mail-lf1-x136.google.com with SMTP id k12so9089585lfr.9;
 Thu, 28 Apr 2022 07:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=edaPhOqJ6sNMjVlH4NUtpjaeXKOnbtBwCPOsuCBJZKU=;
 b=YfTcS3mTCtPbXgS8Mwgqg8cvzUAYE7YiXXqaZMlJMg6VhBO0FpM4yubZ5zDlAEJeuj
 Opn7DtAg0Lyfl7G6/w/ZoaDy6IqOeHkqdmHFm7+L/6y8wXYDN3zzf49jG856cDtCkdoj
 VM0y4iuzePK/m9x6gD1bW5WejAuEXrFHWlfWumymOhIsWoorhrvFSANFrJo7ra2oSRTj
 3H+wdUUR8J+cJ8UQ6Z22bhnfGtTTGpsiDNLu4CvozwQfPtN/5RyI2I4o5gUnQ9yd0ltR
 3/76dovmgnl4nZBok+n2ZmwSYaN7oprqbMTMMQboH4149gdOLG22zYmLhfpENXufD7fu
 U+Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=edaPhOqJ6sNMjVlH4NUtpjaeXKOnbtBwCPOsuCBJZKU=;
 b=eIK6/aXsfHj0ntFvL0YmLrRzNoNDQl6D5TIh/K8cNPM13JxCeiVt+l9feaMOG91Fi2
 WXuoKaA3nOxp4xPThh2cGl2ojY7+bYkKgesPOyr04s65CO50xMOz/7n4FjovgChHoQ6p
 Ngh03gxNNVVVG6oGKPAKAyYiETZJIkJc1IDqlrKRJoyvL2dTRSNL6mGslPtZKKhSrS9B
 6FphwdiApEzIn3L07QEbl+zpJwP91q2zUSKPFvyAbI1M+ZUEZ+EeN+QMrZmjX5RawKmg
 Uh2Eh5kxcmXxoYQmqyJ9pbTFA/7UEY3Us0DaHvQ3UxgB7W2P4ann3cnf5L02X2hBrY7u
 +LLg==
X-Gm-Message-State: AOAM532VHQkT+fruMpMXlEemJ2iD5e2+x4nqOvQ+TsPXICphkqqXUvB/
 OCwHmkT1ZKN5zuRiBdHPC6w2egN4kD3KAgtHB6aAGd6np3A=
X-Google-Smtp-Source: ABdhPJwkh8xMJd2euFGqJq9Hf7/7jfpX7aEFfs+lWsLvXi1VgE0Dv6VL3djM8Zbk5sBL4KDSrsXefOB4aMTVp46BlNA=
X-Received: by 2002:a19:fc0e:0:b0:471:ff7d:ab35 with SMTP id
 a14-20020a19fc0e000000b00471ff7dab35mr17334833lfi.345.1651157833665; Thu, 28
 Apr 2022 07:57:13 -0700 (PDT)
MIME-Version: 1.0
References: <1651138365-17362-1-git-send-email-u0084500@gmail.com>
 <1651138365-17362-5-git-send-email-u0084500@gmail.com>
 <CANhJrGN8avK7mehqVDHVCjBzoG3RU4CykHEaFdQqt40_LjSh1A@mail.gmail.com>
In-Reply-To: <CANhJrGN8avK7mehqVDHVCjBzoG3RU4CykHEaFdQqt40_LjSh1A@mail.gmail.com>
From: ChiYuan Huang <u0084500@gmail.com>
Date: Thu, 28 Apr 2022 22:57:01 +0800
Message-ID: <CADiBU39sgh-6=KmXgbuhNmL4QAQhdHpPz5nEDwffev8x+MQKpA@mail.gmail.com>
Subject: Re: [PATCH 4/4] leds: flash: mt6360: Add mt6360 isnk channel hardwre
 breath mode support
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, Matthias Brugger <matthias.bgg@gmail.com>, 
 ChiYuan Huang <cy_huang@richtek.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, 
 Gene Chen <gene_chen@richtek.com>,
 Linux LED Subsystem <linux-leds@vger.kernel.org>, 
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_075716_892722_3536E9B0 
X-CRM114-Status: GOOD (  19.05  )
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

TWF0dGkgVmFpdHRpbmVuIDxtYXp6aWVzYWNjb3VudEBnbWFpbC5jb20+IOaWvCAyMDIy5bm0NOac
iDI45pelIOmAseWbmyDkuIvljYg3OjUx5a+r6YGT77yaCj4KPiBIaSBDaGlZdWFuIQo+Cj4gT24g
VGh1LCBBcHIgMjgsIDIwMjIgYXQgMTowMyBQTSBjeV9odWFuZyA8dTAwODQ1MDBAZ21haWwuY29t
PiB3cm90ZToKPiA+IEZyb206IENoaVl1YW4gSHVhbmcgPGN5X2h1YW5nQHJpY2h0ZWsuY29tPgo+
ID4KPiA+IEFkZCBtdDYzNjAgaXNuayBjaGFubmVsIGhhcmR3YXJlIGJyZWF0aCBtb2RlIHN1cHBv
cnQuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQ2hpWXVhbiBIdWFuZyA8Y3lfaHVhbmdAcmljaHRl
ay5jb20+Cj4gPgo+ID4gK3N0YXRpYyBpbnQgbXQ2MzYwX2dlbl9icmVhdGhfcmVnX2NvbmZpZyhz
dHJ1Y3QgbGVkX3BhdHRlcm4gKnBhdHRlcm4sIHUzMiBsZW4sCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgdTggKnZhbHMsIGludCB2YWxfbGVuKQo+ID4gK3sKPiA+
ICsgICAgICAgc3RhdGljIGNvbnN0IHN0cnVjdCBsaW5lYXJfcmFuZ2UgdHJhbmdlc1tNVDYzNjBf
SUxFRF9SQU5HRV9NQVhdID0gewo+ID4gKyAgICAgICAgICAgICAgIHsgMTI1LCAwLCAxNSwgMjUw
IH0sIC8qIHRyL2YxMiBhbmQgdG9uLCB1bml0OiBtaWxsaXNlY29uZCAqLwo+ID4gKyAgICAgICAg
ICAgICAgIHsgMjUwLCAwLCAxNSwgNTAwIH0sIC8qIHRvZmYsIHVuaXQ6IG1pbGxpc2Vjb25kICov
Cj4gPiArICAgICAgIH07Cj4KPiBJdCdzIG5pY2UgdG8gc2VlIHlvdSBhcmUgdXNpbmcgdGhlIGxp
bmVhcl9yYW5nZXMgaGVscGVycyBoZXJlISBKdXN0IGEKPiBtaW5vciByZW1hcmsgLSBkbyB5b3Ug
dGhpbmsgeW91IGNvdWxkIHVzZSBmaWVsZCBuYW1lcyBpbiBsaW5lYXJfcmFuZ2VzCj4gaW5pdGlh
bGl6YXRpb25zPyBUaGF0IHdvdWxkIG1ha2UgaXQgbGVzcyBsaWtlbHkgdGhlIGRyaXZlciBicmVh
a3MgaWYKPiBzb21lb25lIGNoYW5nZXMgdGhlIHN0cnVjdCBsaW5lYXJfcmFuZ2UgZGVmaW5pdGlv
bi4gRWcsIHVzZSBzb21ldGhpbmcKPiBsaWtlOgo+Cj4gc3RhdGljIGNvbnN0IHN0cnVjdCBsaW5l
YXJfcmFuZ2UgdHJhbmdlc1tNVDYzNjBfSUxFRF9SQU5HRV9NQVhdID0gewo+ICAgICAgICAgLyog
dHIvZjEyIGFuZCB0b24sIHVuaXQ6IG1pbGxpc2Vjb25kICovCj4gICAgICAgICB7IC5taW4gPSAx
MjUsIC5taW5fc2VsID0gMCwgLm1heF9zZWwgPSAxNSwgLnN0ZXAgPSAyNTAgfSwKPiAgICAgICAg
IC8qIHRvZmYsIHVuaXQ6IG1pbGxpc2Vjb25kICovCj4gICAgICAgICB7IC5taW4gPSAyNTAsIC5t
aW5fc2VsID0gMCwgLm1heF9zZWwgPSAxNSwgLnN0ZXAgPSA1MDAgfSwKPiB9Owo+Cj4gRG8geW91
IHRoaW5rIHRoYXQgd291bGQgd29yaz8KU3VyZSwgaXQgd29ya3MuClRvIHNwZWNpZnkgdGhlIGZp
ZWxkIG5hbWUgY2FuIGJlIGNvbXBhdGlibGUgaWYgdGhlIHN0cnVjdCBjaGFuZ2VzIGluIHRoZSBm
dXR1cmUuClRoYW5rcy4KPgo+IEJlc3QgUmVnYXJkcwo+IC0tIE1hdHRpCj4KPiAtLQo+Cj4gTWF0
dGkgVmFpdHRpbmVuCj4gTGludXgga2VybmVsIGRldmVsb3BlciBhdCBST0hNIFNlbWljb25kdWN0
b3JzCj4gT3VsdSBGaW5sYW5kCj4KPiB+fiBXaGVuIHRoaW5ncyBnbyB1dHRlcmx5IHdyb25nIHZp
bSB1c2VycyBjYW4gYWx3YXlzIHR5cGUgOmhlbHAhIH5+Cj4KPiBEaXNjdXNzIC0gRXN0aW1hdGUg
LSBQbGFuIC0gUmVwb3J0IGFuZCBmaW5hbGx5IGFjY29tcGxpc2ggdGhpczoKPiB2b2lkIGRvX3dv
cmsoaW50IHRpbWUpIF9fYXR0cmlidXRlX18gKChjb25zdCkpOwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0
CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
