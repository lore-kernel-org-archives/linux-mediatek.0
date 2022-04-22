Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3919C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 05:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/89zv3la+/g6ND1sPlhHCYs/5oQfDX4MnEwlu1v/ywA=; b=BuvQpu9+Nti6QM
	bPVKDi0QVvZOvfPSnJ/GsrK9h/ymyRuBqoQCzECpzpmh0XAGcnv0cZHrlTpHE7N3lafEhrkf9wagM
	1f/21+2jyaGYYtLIVIQc1sZPfYFNNe+p1antKEj3P76L1lk6DXx0wGy35ediNpyS4l5jyDqzH0qXM
	DHOVMR6Kaam97D3Afb3bP89io28ei5NFVBOtdKtHKUmepydgkViCVdHUoy5Z59eyOUI1HLk89RiwH
	zJbZM5tlhmN3yumfzAjELOHqHIWVWaHx2OBfvOYF091JsdEJX/hIpAONNCYxDiBOM49jHIVQqe9X3
	viGLB0fq4YsfML2zxkIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhlk1-00GDpY-Q0; Fri, 22 Apr 2022 05:22:01 +0000
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhljq-00GDoQ-RJ; Fri, 22 Apr 2022 05:21:52 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id b17so5280394qvp.6;
 Thu, 21 Apr 2022 22:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hL4RE3KhpgsczmHCd82s+GTL+VM0PpuQ4vRV61iW2so=;
 b=oPZH6cT4eFog/QoZgdRzBGjRtrP5yokMOG7gimEQZYOF7B251XF9oEC/ehKdXpeV7r
 zuMYbACCZhfqN61KvP1Wp39J8ZIJo2B98SXecewmZsXgjiwGEto+p5mHd4V6Sln7eClG
 AxsThV3BEZYUACZQL8eELE8ilrKOuG/WIkPz+jI/bjspk6PdlfmUBxnpkgrLznGnz2BF
 v+MPPtX6MDBsK/W1UKQNU4Q0T/HQUvrdsHKqvmbj2C67mK+dCE6ubv46ZMaWr2M0YFTB
 qWo8b9Anc495wTdv+1IkBVNMe1d4eLZK11PsqP1czTCeFj7PadIFsssut8OWcMJlJz2L
 LWnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hL4RE3KhpgsczmHCd82s+GTL+VM0PpuQ4vRV61iW2so=;
 b=qD55ccSN/CrJKwCfy8ly+cX0GbJvHh/PE2l5GqNR305SOXQ5qYDYPMaswBzMfIq1EW
 +zCAgB3mVT+3Ukid6xtDxZtWeMJiv39YJ6oiFzlgnlqhhF4RCvpS8qpTa76Vn/h605zw
 4/l98Ddr4jneMyMkUDqlXibwyaHOadGbDCMBYYMI39abLYNLj2VWBibvzaDfXyKh0Kae
 eU7wLC9EOuCIZXCc9VkHPnJdd2NHluZLhgoa9o2Uno2iwO06N15PDrPE17fV7jmddOAB
 72TVcdk+gf1tmDP+4bYSCC7ZoEYGM61hvLqmQFgt9RlC6d4ubDgxRW2CydcDj908X7m0
 wovQ==
X-Gm-Message-State: AOAM530QLp2wMwsFXdVnyKkHnxcKr9BbsRuY7POmJwvQA/nZr6fUbBj6
 6thHJnAinKPnAczTi0x/7SxXI8iDNyhQyG5CBpo=
X-Google-Smtp-Source: ABdhPJyN3psO4kSFD8fbsmu96H/8mfECMCXljvl609zKdqflOH2NZhqDBoliBbIsFDfFk1+o+6RwvksmzjIoHhXMH/I=
X-Received: by 2002:a05:6214:d0e:b0:446:716a:fff2 with SMTP id
 14-20020a0562140d0e00b00446716afff2mr2099927qvh.38.1650604908751; Thu, 21 Apr
 2022 22:21:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220413060729.27639-1-arinc.unal@arinc9.com>
 <CACRpkdbbMFYNNjAKwhysKpu1JVh2JSB-N=Y8QMx1JvMhCPBpwg@mail.gmail.com>
 <26418320-64e0-3ed2-c792-7f72878b7592@arinc9.com>
In-Reply-To: <26418320-64e0-3ed2-c792-7f72878b7592@arinc9.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Fri, 22 Apr 2022 07:21:38 +0200
Message-ID: <CAMhs-H_d8jUa4=4eVjQxo+h-XeRgiMYC1H_xYtPLb8jHDVYL2Q@mail.gmail.com>
Subject: Re: [PATCH 0/14] Refactor Ralink Pinctrl and Add Documentation
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
 Luiz Angelo Daros de Luca <luizluca@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, erkin.bozoglu@xeront.com, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 "open list:MIPS" <linux-mips@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_222150_944172_98932E9F 
X-CRM114-Status: GOOD (  21.95  )
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

SGkgQXJpbsOnLAoKT24gVGh1LCBBcHIgMjEsIDIwMjIgYXQgNDo0NCBQTSBBcsSxbsOnIMOcTkFM
IDxhcmluYy51bmFsQGFyaW5jOS5jb20+IHdyb3RlOgo+Cj4gT24gMjEvMDQvMjAyMiAxNzoyNywg
TGludXMgV2FsbGVpaiB3cm90ZToKPiA+IE9uIFdlZCwgQXByIDEzLCAyMDIyIGF0IDg6MDggQU0g
QXLEsW7DpyDDnE5BTCA8YXJpbmMudW5hbEBhcmluYzkuY29tPiB3cm90ZToKPiA+Cj4gPj4gVGhp
cyBwYXRjaCBzZXJpZXMgYnJpbmdzIGNvbXBsZXRlIHJlZmFjdG9yaW5nIHRvIHRoZSBSYWxpbmsg
cGluY3RybCBkcml2ZXIKPiA+PiBhbmQgaXRzIHN1YmRyaXZlcnMuCj4gPgo+ID4gSSBqdXN0IG1l
cmdlZCBhbGwgdGhlIHBhdGNoZXMsIHRoZSBjb21tZW50cyBzZWVtIG1pbm9yIGFuZCBhbnkgZnVy
dGhlcgo+ID4gZml4ZXMgY2FuIGNlcnRhaW5seSBiZSBkb25lIG9uIHRvcCBvZiB0aGlzLiBBbnlv
bmUgaW50ZXJlc3RlZCBpbiByYWxpbmsKPiA+IHdvcmtpbmcgbmljZWx5IGlzIGxpa2VseSBpbiB0
aGUgdGhyZWFkIGFuZCB3ZSBtb3N0bHkgY2FyZSBhYm91dCB0aGF0IHRoaXMKPiA+IHdvcmtzIGZv
ciBPcGVuV3J0LCBhbmQgaWYgaXQgd29ya3MgZm9yIHRoZW0gd2UgYXJlIGhhcHB5Lgo+ID4KPiA+
PiAgICBtaXBzOiBkdHM6IHJhbGluazogbXQ3NjIxOiB1c2UgdGhlIG5ldyBjb21wYXRpYmxlIHN0
cmluZyBmb3IgTVQ3NjIxIHBpbmN0cmwKPiA+Cj4gPiBUaGlzIHdhcyBhIGJpdCBzY2FyeSBzaW5j
ZSB3ZSB1c3VhbGx5IHRha2UgdGhlc2UgdGhyb3VnaCB0aGUgcmVzcGVjdGl2ZQo+ID4gU29DIHRy
ZWUsIGJ1dCBJIGp1c3QgYXBwbGllZCBpdCBhbnl3YXksIGl0IG1ha2VzIGxvZ2ljYWwgc2Vuc2Ug
aW4gdGhlCj4gPiBzZXJpZXMuCj4gPgo+ID4gSSBob3BlIGl0IHdpbGwgbm90IGxlYWQgdG8gY29u
ZmxpY3RzLgo+ID4KPiA+IEdvb2Qgd29yayB3aXRoIHRoaXMgc2VyaWVzIQo+Cj4gVGhhbmtzLiBU
aGVyZSBpcyBhIHYyIG9mIHRoaXMgc2VyaWVzIHdoaWNoIGhhcyBiZWVuIHdhaXRpbmcgZm9yIGEg
d2VlaywKPiBJIGhvcGUgdGhhdCB3YXMgdGhlIG9uZSB5b3UgYXBwbGllZCBhcyB5b3UgcmVwbGll
ZCB1bmRlciB2MSAoSSdtIG5vdAo+IHN1cmUgd2hpY2ggcmVwb3NpdG9yeSB5b3UgYXBwbGllZCB0
aGlzIHNvIEkgY2FuJ3QgY2hlY2sgbXlzZWxmKS4KCkxpbnVzIGFkZHMgcGF0Y2hlcyB0aHJvdWdo
IHRoZSBsaW51eC1waW5jdHJsIHRyZWUgYXMgcGluY3RybCBtYWludGFpbmVyLiBDaGVjazoKCmh0
dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2xpbnVzdy9saW51
eC1waW5jdHJsLmdpdC9sb2cvP2g9ZGV2ZWwKCkJlc3QgcmVnYXJkcywKICAgIFNlcmdpbyBQYXJh
Y3VlbGxvcwo+Cj4gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LWFy
bS1rZXJuZWwvbGlzdC8/c2VyaWVzPTYzMjM3MAo+Cj4gQXLEsW7DpwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBs
aXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
