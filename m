Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 570CCC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Apr 2022 07:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OaKDpQ5rlbtj+uGP/6CRvpQ8iB04zXSMmXve68wHGWU=; b=bEfrjItibSVZqp
	qzfH9ZrsTLM0DxfH/BRgrll/aIHUFpRTBJkCwuQxSDWILXCT498TjwNL6L724VX3AAzTBRC8YG0dE
	WPyyd/3PCaitmnOuVaOYt2KRuBfyW1An/gjH0WaRP1tmGkaZT9ME0oOc/70KFsPf3vV5HEdJ7clJp
	Gn1xO0MXG9rgBRiIaafxNPaFUKnsi8rfZn2PubHabYsRWU9nEpVLNbNZsKAo0VMCMKrzEncY2XudY
	DtgOpeoGvBh9YMwIVw0GHs8EB0Bz5f8anOytaPsnQLjGBglKJJftbZeQd3lW6lNwxoiAekDN5Ztsw
	peF1DDO29oxdSexbZLlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndoMA-007AR5-JR; Mon, 11 Apr 2022 07:21:02 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndoLx-007ALX-2O; Mon, 11 Apr 2022 07:20:50 +0000
Received: by mail-qk1-x733.google.com with SMTP id j6so9934786qkp.9;
 Mon, 11 Apr 2022 00:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=q6vyTc8/oFhCp1GfrwTsSBr2He1wLigdJcEnNoAKosg=;
 b=kwCqakyaFMN+byP2t+Fi2f2Y8uhWZmz9S0Ct/eCDBkoFz8Dnogv9u9+TeMdc0/32Pg
 3D6ewWycN2/q5Bzsntz6u0B464UNJ/O7UcTzdIIO1QvYSlQXWIeghFKDaB5j0fnEylfJ
 hpWhEX7nMtY9rmJ7oTdcerfZByrIetauv2buhWp/sXb4oK/v172PdHAqWedr1p9vvvmJ
 INAswljoglFGcyD08cUgw1s+6dvMqNamizvEgk1qff0LHYEHY9WkLc38TE0oyX4p4xWS
 SUxq0e+9z+VU/Q3yQN3/j6bJwwp6V0xIbsuMaw9/wv4iV8yr8ozPz78Eq8bJ933WcEeM
 iksQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=q6vyTc8/oFhCp1GfrwTsSBr2He1wLigdJcEnNoAKosg=;
 b=yIz2d4CKau4AWutZiYrMG3K6sQAFX/5LGdwIIYnxR2F6GnA6J2HOv6QBw6105YukWC
 32dr+qQIG2cJboNgErlQiIBaON8IUrp8UEjaxf5wodsTuLj598c66KOJ25xf0TUuJ40F
 ZkxVXki9dNQ+YEc36cK96wHayNft1EjVqeT9G1cZt4xb+9D9oJfIXwAWhtanzYO7hRAK
 tN2aaFYn9URnSjAoL7SktYnGIkbjePLH29uVrj8MWCxqeHYMA6RndZ8hYNClC6IsjKEJ
 Rue3G6DR/GssGaCVcm6t/jXcU0ZYQ5DYmi8MTelgAwbfJm5kJHgHuljINReznaY/WrPr
 q3Qg==
X-Gm-Message-State: AOAM5334k4zkgv9nuW/RXeBgoHwnkz2lo9EqSWa463gf6EKI65NbcJ7Z
 vmhEl6Y5kmBmiUGxQ2uSgANZpxV7hxD/d8wx0Gw=
X-Google-Smtp-Source: ABdhPJy7b/4YKAfADpzu2413Pe5i9Ft/m1HUzLmUGqxmdCWzkWDl2RhjuZg0gzWj7i3qjJUq9TRPuqm5259eUn7bhtI=
X-Received: by 2002:a05:620a:bd5:b0:67d:15ed:2fcd with SMTP id
 s21-20020a05620a0bd500b0067d15ed2fcdmr21094484qki.81.1649661647007; Mon, 11
 Apr 2022 00:20:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220410203138.22513-1-arinc.unal@arinc9.com>
 <20220410203138.22513-2-arinc.unal@arinc9.com>
In-Reply-To: <20220410203138.22513-2-arinc.unal@arinc9.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Mon, 11 Apr 2022 09:20:36 +0200
Message-ID: <CAMhs-H8Jheq4wttOXbdHsspkQtZvOauKiK5kxezz7sDDC_Zdhw@mail.gmail.com>
Subject: Re: [PATCH 2/3] mips: dts: mt7621: mux phy4 to gmac1 for GB-PC1
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 "open list:MIPS" <linux-mips@vger.kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_002049_148619_D500D1C0 
X-CRM114-Status: UNSURE (   9.70  )
X-CRM114-Notice: Please train this message.
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

T24gU3VuLCBBcHIgMTAsIDIwMjIgYXQgMTA6MzIgUE0gQXLEsW7DpyDDnE5BTCA8YXJpbmMudW5h
bEBhcmluYzkuY29tPiB3cm90ZToKPgo+IE11eCB0aGUgTVQ3NTMwIHN3aXRjaCdzIHBoeTQgdG8g
dGhlIFNvQydzIGdtYWMxIG9uIHRoZSBHQi1QQzEgZGV2aWNldHJlZS4KPiBUaGlzIGFjaGlldmVz
IDIgR2JwcyB0b3RhbCBiYW5kd2lkdGggdG8gdGhlIENQVSB1c2luZyB0aGUgc2Vjb25kIFJHTUlJ
Lgo+Cj4gU2lnbmVkLW9mZi1ieTogQXLEsW7DpyDDnE5BTCA8YXJpbmMudW5hbEBhcmluYzkuY29t
Pgo+IC0tLQo+ICAuLi4vYm9vdC9kdHMvcmFsaW5rL210NzYyMS1nbnViZWUtZ2ItcGMxLmR0cyAg
IHwgMTggKysrKysrKysrKy0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25z
KCspLCA4IGRlbGV0aW9ucygtKQoKUmV2aWV3ZWQtYnk6IFNlcmdpbyBQYXJhY3VlbGxvcyA8c2Vy
Z2lvLnBhcmFjdWVsbG9zQGdtYWlsLmNvbT4KClRoYW5rcywKICAgIFNlcmdpbyBQYXJhY3VlbGxv
cwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
bWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRl
awo=
