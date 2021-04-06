Return-Path: <SRS0=k4UB=JD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 794B4C433B4
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 15:47:40 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21791613A7
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 15:47:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21791613A7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iH1VIwP/OwyLcHfonCv8MC/P84SwRfPSFiEHpplpRjc=; b=OD9n1nj7nRpAjzIbf+92rkBSe
	PTCO8JbVu8BFQzmafHubEkXod4ieYhnENmMQXEBFqiqHyStdKMdhzbSgKTBgLnt0eifTE8PhD/z/I
	1z1oqYE+jkeDiVMZYBod0WMp+7YJBGXfKJc7CBMRft+MervBGxGFHmWGHmp1lS+Wjs2m3rN4r13XD
	q688LT9aDOewmvNEfBtp5k9KxrFl7HHCkc2S2Uoe/Gg4hdUY/W0S+B3mVvAiy0kHU5aOFz0cQ3Qnc
	SHLkbOwVG7qgBwuaUePFYNjE2HQztIcamfB9YnTCNEoQV6b9GIu7YEGI4E5dMSOufO2aGwzuwP5l5
	SmqNFuD+g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTnvM-002xGL-E4; Tue, 06 Apr 2021 15:47:28 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTnvI-002xFg-Fz
 for linux-mediatek@lists.infradead.org; Tue, 06 Apr 2021 15:47:26 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 06400613A7
 for <linux-mediatek@lists.infradead.org>; Tue,  6 Apr 2021 15:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617724041;
 bh=DFaOWabX6uQJ7AB1bWPr2ONxe1vKEsQZrlZeDjFgyJE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=iKTHjVScP3g8MRFsXhwXqxpDVchRxvLeFA1FG6RctDDEjc0dAh1cg3sZLnyyceOHO
 oqER5iZfkB5hdh7DkWmuuKWBbEX0ZWXXoIA//skgZKROsJOYxUDhcXJf+eaG93ZXpY
 XdbKq9QZoinEcjgCw7UnY7ecXPM98QDTYcfzbAyCH+3wInac01i3tGxyIjy0kZ97na
 4NNtT9TdH///1r36bSojvOWr+wb2umBUzundjPre9Z5Tg0jvFlQlG6nyDJrqCvInF8
 xPurIbVlvdd3LLVDbHDvR8BO8tfhCI3/1KPu4HUwbfBilzjC1QcAIZg3FL0N6C0SPR
 5e1GFjZBWOlcA==
Received: by mail-ej1-f41.google.com with SMTP id r12so22729974ejr.5
 for <linux-mediatek@lists.infradead.org>; Tue, 06 Apr 2021 08:47:20 -0700 (PDT)
X-Gm-Message-State: AOAM532tcygYUlRdwAX+qyCMvZgdosb0npwc4o5kNNU8V+aRmvJwtAkO
 7spSyosfiW2X7Omhta/1GUyO5QuY2HxQhDQK7Q==
X-Google-Smtp-Source: ABdhPJxSwuv5A1N5e6l0r3zr4OOt2uoKpaG87wBCP8goBoJPv9P4enuywxUM1fm+tIMiIDXlHvq+vFNKavllmgy4s60=
X-Received: by 2002:a17:907:629c:: with SMTP id
 nd28mr35315677ejc.267.1617724039596; 
 Tue, 06 Apr 2021 08:47:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210406141819.1025864-1-dqfext@gmail.com>
 <20210406141819.1025864-2-dqfext@gmail.com>
In-Reply-To: <20210406141819.1025864-2-dqfext@gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 6 Apr 2021 23:47:08 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8snSTcguhyB9PJBWydqNaWZL3V4zXiYULVp5n48fN24w@mail.gmail.com>
Message-ID: <CAAOTY_8snSTcguhyB9PJBWydqNaWZL3V4zXiYULVp5n48fN24w@mail.gmail.com>
Subject: Re: [RFC net-next 1/4] net: phy: add MediaTek PHY driver
To: DENG Qingfang <dqfext@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, Andrew Lunn <andrew@lunn.ch>, 
 Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Landen Chao <Landen.Chao@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Sean Wang <sean.wang@mediatek.com>, Vivien Didelot <vivien.didelot@gmail.com>, 
 Vladimir Oltean <olteanv@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-staging@lists.linux.dev, 
 DTML <devicetree@vger.kernel.org>, netdev@vger.kernel.org, 
 Weijie Gao <weijie.gao@mediatek.com>, Chuanhong Guo <gch981213@gmail.com>, 
 =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_164724_927191_56FB6B71 
X-CRM114-Status: GOOD (  14.39  )
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

SGksIFFpbmdmYW5nOgoKREVORyBRaW5nZmFuZyA8ZHFmZXh0QGdtYWlsLmNvbT4g5pa8IDIwMjHl
ubQ05pyINuaXpSDpgLHkuowg5LiL5Y2IMTA6MTnlr6vpgZPvvJoKPgo+IEFkZCBzdXBwb3J0IGZv
ciBNZWRpYVRlayBQSFlzIGZvdW5kIGluIE1UNzUzMCBhbmQgTVQ3NTMxIHN3aXRjaGVzLgo+IFRo
ZSBpbml0aWFsaXphdGlvbiBwcm9jZWR1cmUgaXMgZnJvbSB0aGUgdmVuZG9yIGRyaXZlciwgYnV0
IGR1ZSB0byBsYWNrCj4gb2YgZG9jdW1lbnRhdGlvbiwgdGhlIGZ1bmN0aW9uIG9mIHNvbWUgcmVn
aXN0ZXIgdmFsdWVzIHJlbWFpbnMgdW5rbm93bi4KPgo+IFNpZ25lZC1vZmYtYnk6IERFTkcgUWlu
Z2ZhbmcgPGRxZmV4dEBnbWFpbC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvbmV0L3BoeS9LY29uZmln
ICAgIHwgICA1ICsrCj4gIGRyaXZlcnMvbmV0L3BoeS9NYWtlZmlsZSAgIHwgICAxICsKPiAgZHJp
dmVycy9uZXQvcGh5L21lZGlhdGVrLmMgfCAxMDkgKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKwo+ICAzIGZpbGVzIGNoYW5nZWQsIDExNSBpbnNlcnRpb25zKCspCj4gIGNyZWF0
ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL25ldC9waHkvbWVkaWF0ZWsuYwo+Cj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvbmV0L3BoeS9LY29uZmlnIGIvZHJpdmVycy9uZXQvcGh5L0tjb25maWcKPiBpbmRl
eCBhNjE1YjM2NjBiMDUuLmVkZDg1OGNlYzllYyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL25ldC9w
aHkvS2NvbmZpZwo+ICsrKyBiL2RyaXZlcnMvbmV0L3BoeS9LY29uZmlnCj4gQEAgLTIwNyw2ICsy
MDcsMTEgQEAgY29uZmlnIE1BUlZFTExfODhYMjIyMl9QSFkKPiAgICAgICAgICAgU3VwcG9ydCBm
b3IgdGhlIE1hcnZlbGwgODhYMjIyMiBEdWFsLXBvcnQgTXVsdGktc3BlZWQgRXRoZXJuZXQKPiAg
ICAgICAgICAgVHJhbnNjZWl2ZXIuCj4KPiArY29uZmlnIE1FRElBVEVLX1BIWQoKVGhlcmUgYXJl
IG1hbnkgTWVkaWF0ZWsgcGh5IGRyaXZlcnMgaW4gWzFdLCBzbyB1c2UgYSBzcGVjaWZpYyBuYW1l
LgoKWzFdIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3Rv
cnZhbGRzL2xpbnV4LmdpdC90cmVlL2RyaXZlcnMvcGh5L21lZGlhdGVrP2g9djUuMTItcmM2CgpS
ZWdhcmRzLApDaHVuLUt1YW5nLgoKPiArICAgICAgIHRyaXN0YXRlICJNZWRpYVRlayBQSFlzIgo+
ICsgICAgICAgaGVscAo+ICsgICAgICAgICBTdXBwb3J0cyB0aGUgTWVkaWFUZWsgc3dpdGNoIGlu
dGVncmF0ZWQgUEhZcy4KPiArCj4gIGNvbmZpZyBNSUNSRUxfUEhZCj4gICAgICAgICB0cmlzdGF0
ZSAiTWljcmVsIFBIWXMiCj4gICAgICAgICBoZWxwCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgt
bWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
