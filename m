Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 348A2C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 22:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sm9yh5/Ee3FMgtSc3jr6z6wrcLHlgeOk0NouV6TIENg=; b=vT73pBK8Py4yG1
	o89gZRHgWa/qJ9oAe4sk8K3LV168XrgRFWHCDiufvz4n31EO1ycFY45mSXgDwKMyBKxXYKWWkorsk
	AMmL0cmkzXDcvuCiv3Rm/Z792UufFmLYOd/3Y9BMHyJAHbwXzN+5XQnaY4g+VL970YMGJktJhCT4j
	vXyGDochd0HnlAAoF6WTiIqaAZ5cCWK+L9zsgKpO5OLWDmCQBG97J0mdzob9ks3mUOlpmZNMG4aYq
	J+1g2meJ3WbRHYfSOSIV9ktcrZg93fOe7DlnZX1bfZkjZnmhcfGtXOTwUsMLa4qWjMymIAstGIsTz
	IBApMNffaKH3gEapl/rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ni1RC-002eyn-5d; Fri, 22 Apr 2022 22:07:38 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ni1R9-002exB-QY
 for linux-mediatek@lists.infradead.org; Fri, 22 Apr 2022 22:07:37 +0000
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-2ebf4b91212so99141107b3.8
 for <linux-mediatek@lists.infradead.org>; Fri, 22 Apr 2022 15:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=rKAG+J5Q8lcvvd/biftxVJOIEqMrFvSTtBVDRerigCk=;
 b=gW2ZtWypeVc/O6j08D9/hby6Pss2xm53tySxwlkDAbxboHmNQ4lXaAVg6r7Pvyy9+J
 dZuggtnxZWNDRqiE5rHib9T8JFdYx6xMSzE7e13VM7rWGhOw8wsnDtBFKEoe7/GbSMRE
 dagY2aApKLUl2NfmqDv3lE7vzROus4LEohYSeX/dDKiKk1VW5LUzkWjlTfBB8azMNGpF
 0jid58yJIinT+wdN3WOcvT8UO9NYeq10Vf6JMU/q1RxVqa1kFUa0/zE5gFPl69uyaUJA
 P1kAw2HwyDZ3ZmY5SOZnFklOXUX/u02XXQcurPb7jq5isIZP/slUEvgRwFRN8I0r+rBO
 GHvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rKAG+J5Q8lcvvd/biftxVJOIEqMrFvSTtBVDRerigCk=;
 b=qjVaNe7yQnBAWweKnhfjHLswK7NwrD8gQ3kgdHgFbT7sHCaa7YHOHPeyKfQtw1UuFE
 iCH3VV3rrj6/SciiN4+WGv4Qd1m1/94a9U0KHXFPteUmxWSLQj8QdVcV7gklrF3Imjjf
 a8XrOprkcT7SJzPBI0HR/q/BCDcoPZHt6pGLfCDZccVtpaGMqpB69mrXruPHoW4eJwOd
 uHPwsf0bvo9wCE/4Ykk/Sodpt2oFc61d/BvFMA+y0hEgezXEjAgOb3ldHyoe97LXspCv
 jWm16hB5/3r0hARyWMdDjswiLxgfEPvtmT3g6wYKHjXZRr/m9GInHPmq1fBn4Vo/vN79
 oT4Q==
X-Gm-Message-State: AOAM530OvlMOiK5Pypcl5s2k87bnrBk+jNvU/mwz5VdREfe3okVTvRXF
 tV4X6Jv9WqXWydI+S+Bwetukx7dSuy6HoCzGV4RFFA==
X-Google-Smtp-Source: ABdhPJyi/ikQ9hdlwSSUnoOGQLb3feHoaGPFFTBFoKKCXX8WPkAGeGuqi/XkQMXnVdVgTorUtasyV/+Uykb/P4sdCpg=
X-Received: by 2002:a81:5dc5:0:b0:2eb:3feb:686c with SMTP id
 r188-20020a815dc5000000b002eb3feb686cmr7290345ywb.268.1650665254777; Fri, 22
 Apr 2022 15:07:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220413060729.27639-1-arinc.unal@arinc9.com>
 <CACRpkdbbMFYNNjAKwhysKpu1JVh2JSB-N=Y8QMx1JvMhCPBpwg@mail.gmail.com>
 <26418320-64e0-3ed2-c792-7f72878b7592@arinc9.com>
 <CAMhs-H_d8jUa4=4eVjQxo+h-XeRgiMYC1H_xYtPLb8jHDVYL2Q@mail.gmail.com>
 <6cdec3bc-4715-29c8-f4a1-df1408940a75@arinc9.com>
In-Reply-To: <6cdec3bc-4715-29c8-f4a1-df1408940a75@arinc9.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 23 Apr 2022 00:07:23 +0200
Message-ID: <CACRpkdbebE3RiviZ3NiVL4W2S1HN7Q21jSma6abup_nEVjX6+w@mail.gmail.com>
Subject: Re: [PATCH 0/14] Refactor Ralink Pinctrl and Add Documentation
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Sergio Paracuellos <sergio.paracuellos@gmail.com>, 
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
X-CRM114-CacheID: sfid-20220422_150735_921111_A762519B 
X-CRM114-Status: GOOD (  10.20  )
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

T24gRnJpLCBBcHIgMjIsIDIwMjIgYXQgODoxNCBBTSBBcsSxbsOnIMOcTkFMIDxhcmluYy51bmFs
QGFyaW5jOS5jb20+IHdyb3RlOgoKPiA+PiBUaGFua3MuIFRoZXJlIGlzIGEgdjIgb2YgdGhpcyBz
ZXJpZXMgd2hpY2ggaGFzIGJlZW4gd2FpdGluZyBmb3IgYSB3ZWVrLAo+ID4+IEkgaG9wZSB0aGF0
IHdhcyB0aGUgb25lIHlvdSBhcHBsaWVkIGFzIHlvdSByZXBsaWVkIHVuZGVyIHYxIChJJ20gbm90
Cj4gPj4gc3VyZSB3aGljaCByZXBvc2l0b3J5IHlvdSBhcHBsaWVkIHRoaXMgc28gSSBjYW4ndCBj
aGVjayBteXNlbGYpLgo+ID4KPiA+IExpbnVzIGFkZHMgcGF0Y2hlcyB0aHJvdWdoIHRoZSBsaW51
eC1waW5jdHJsIHRyZWUgYXMgcGluY3RybCBtYWludGFpbmVyLiBDaGVjazoKPiA+Cj4gPiBodHRw
czovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9saW51c3cvbGludXgt
cGluY3RybC5naXQvbG9nLz9oPWRldmVsCj4KPiBUaGFua3MgU2VyZ2lvLiBJIHNlZSB2MSB3YXMg
YXBwbGllZCwgb29wcy4gV2hhdCB0byBkbz8KCk5vIHByb2JsZW0sIEkgYmFja2VkIGl0IG91dCAo
aGFkIHRvIGJhY2sgb3V0IHNvbWUgc3R1ZmYgcHVsbGVkIG9uIHRvcCB0b28uLi4pCnRoZW4gcmUt
cHVsbGVkIHRoZSBzdHVmZiBJIHB1bGxlZCBvbiB0b3AsIHRoZW4gYXBwbGllZCB2MiBvbiB0b3Au
CkxldCdzIHNlZSBob3cgbXVjaCBJIHNjcmV3ZWQgdXAgOkQKCllvdXJzLApMaW51cyBXYWxsZWlq
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1t
ZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVr
Cg==
