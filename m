Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D62C6C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 May 2022 08:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IedhRDwKaUu62SOONBxbeKwkHM/por+shRbT5BTy3F4=; b=2vPV73xYNcUVb1
	OpMX2dxuYNd2G0Nuv9svanRFPFY7zQk+SMKmEmz6EvM7+kCWVsgiYSBpFRzNFmWrOnp6QKYi3iOEr
	D8UtS7re2NYpLrUEZ3d56Dy9y3CoCIouoQpfcTnOEHk2/iOhfTgbxaPbaE/EzO4ITQg91ategfIQ+
	vyBaQ7pMLQAAOyklS2/NhSoqZ6MhDD6uMrKXU8azRRUT2amlvL3xBz+ynfzDKYFzVu9hHiFqsnyBM
	SCS1C034/YijbHIh10XdgllTgNLPoiazKasdhDsc0XO+NGeVh/2iQcoipjwVDjZiC0VmHHThGZ/7K
	R/2jpe5jhgpZxcDxYGzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvarN-005vqC-DD; Mon, 30 May 2022 08:34:45 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvar6-005vjd-MU; Mon, 30 May 2022 08:34:30 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: kholk11)
	with ESMTPSA id B78A41F42694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1653899662;
	bh=qUCGQiwcmmxHUZWpHYZduseXroEBbLWvH0gOBqAZRus=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OegG5mkCCC00NQZCKbWpWKo/eyoZEns6uPwDCnhGm7pcarfTCq/jkMWxjMvPVBKvA
	 TrOUXwCPnkWP5PtrHHJO/2MRxVMWbhUA2wAqy34QewdTSuhv0o48C/+JBJBNFb6fJh
	 kFzJwwRaQDt6p/C9Tip+aJ5zPMfs7yOuas8lRHaUTeQNu+waJ1EMHeNuRUGCtmxDum
	 4Xs3pkjATcmTNICMZReOTqhAPi4eSG54/WfHM+G4N4AwE1VSpCXbkbJT6/YCs0xogC
	 +SqFChfGfaWZscKKXbY0UmcLBzhQTDRwxAJh261kwsstOLUvPhP+61x6ghWe4V3l5l
	 1FSrHDNDPuE7g==
Message-ID: <74a6159b-40d0-bbc3-5b4a-ebf6ed98bac7@collabora.com>
Date: Mon, 30 May 2022 10:34:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v1 0/2] MT8192 pinctrl properties adjustments
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: kernel@collabora.com,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20220525155714.1837360-1-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220525155714.1837360-1-nfraprado@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_013428_883800_BF124546 
X-CRM114-Status: GOOD (  12.42  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SWwgMjUvMDUvMjIgMTc6NTcsIE7DrWNvbGFzIEYuIFIuIEEuIFByYWRvIGhhIHNjcml0dG86Cj4g
Cj4gVGhlIHR3byBwYXRjaGVzIGluIHRoaXMgc2VyaWVzIHN1YnN0aXR1dGUgcHJvcGVydGllcyBp
biB0aGUgbXQ4MTkyCj4gcGluY3RybCBkdC1iaW5kaW5nIGZvciBvbmVzIHdoaWNoIGhhdmUgYSBj
bGVhcmVyIG1lYW5pbmcgYW5kIGFyZSBtb3JlCj4gc3RhbmRhcmRpemVkLiBBdCB0aGlzIHBvaW50
IHRoZXJlJ3Mgbm8gRFQgdXNpbmcgdGhlIG10ODE5MiBwaW5jdHJsCj4gYmluZGluZywgc28gaWYg
c3VjaCBjaGFuZ2VzIGFyZSB0byBiZSBtYWRlLCB0aGV5IG5lZWQgdG8gaGFwcGVuIG5vdy4KPiAK
PiAKPiBOw61jb2xhcyBGLiBSLiBBLiBQcmFkbyAoMik6Cj4gICAgZHQtYmluZGluZ3M6IHBpbmN0
cmw6IG10ODE5MjogQWRkIGRyaXZlLXN0cmVuZ3RoLW1pY3JvYW1wCj4gICAgZHQtYmluZGluZ3M6
IHBpbmN0cmw6IG10ODE5MjogVXNlIGdlbmVyaWMgYmlhcyBpbnN0ZWFkIG9mIHB1bGwtKi1hZHYK
PiAKPiAgIC4uLi9iaW5kaW5ncy9waW5jdHJsL3BpbmN0cmwtbXQ4MTkyLnlhbWwgICAgICB8IDU4
ICsrKysrKy0tLS0tLS0tLS0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCsp
LCA0MCBkZWxldGlvbnMoLSkKPiAKCkhleSBOaWMsCgpBcyB5b3Uga25vdywgSSBkZWZpbml0ZWx5
IGFncmVlIHdpdGggdGhlc2UgY2hhbmdlcywgYnV0IHRoZXkgZG9uJ3QgZGVzZXJ2ZQp0byBnZXQg
YW55IEZpeGVzIHRhZzogYmFja3BvcnRpbmcgc2hvdWxkIGJlIHVzZWxlc3MgaW4gdGhpcyBjYXNl
Li4uIGFuZCB5b3UKYW55d2F5IGFyZW4ndCBmaXhpbmcgYSBmYXVsdHkgYmluZGluZy4KCkNoZWVy
cyEKQW5nZWxvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW1lZGlhdGVrCg==
