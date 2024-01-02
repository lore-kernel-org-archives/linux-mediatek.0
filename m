Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30163C47074
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Jan 2024 11:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Subject:To:From:Date:References:
	In-Reply-To:Message-Id:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lVTkJg3cjvcYbcVCRM3jEwk1bpjplmmOC1M0Z0hmekI=; b=FRkNtKMkwh/Box
	JOzS3n1+n9NDBKyBCBPCLKlSKVS3g4HobGThbrbNkIzegwWiWFebZ79c/6FIHI+/8Qm5pwaB7qvw4
	uTLLGEWKvFxQLhQPlO4nLthiQX1/5Pd0AJjl6h9822BL/5PSVdiyQonkyWCaZHdVxZOEk4XaKDJHc
	HssdajWliVBqHQ91WX/SnJX35g3RYX3N87XwAQAU3r6MdunJSuMjan1vgK2Vcs114vZK9R4FCMcf3
	u1BBqFRme+WDtKsfH0PaijSB2ExgYUjBNBM9XOlKoiFqzy4SyABoFG/BiBx0NRgVmW965rK74yJy+
	U4DBG2vXEKjfFb2EV65Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKdD8-007pdR-1B;
	Tue, 02 Jan 2024 11:45:30 +0000
Received: from wout2-smtp.messagingengine.com ([64.147.123.25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKdD3-007pXo-2E;
	Tue, 02 Jan 2024 11:45:28 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 91E4E3200A96;
	Tue,  2 Jan 2024 06:45:22 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Tue, 02 Jan 2024 06:45:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1704195922;
	 x=1704282322; bh=lVTkJg3cjvcYbcVCRM3jEwk1bpjplmmOC1M0Z0hmekI=; b=
	k3OneBTh08tqoscwl4dIXVoPry+kCmejuelbg85RE8OONq6Wrw/7vjBfTg38tW2c
	gy1+TbV2xEOJU4c1CweKIgVKGuYYyM/KPfC6MiatsOWik6KDIBm8U6C4GGa9VBga
	uwYNRqZniFCrE0VRyLtX7JdtUM7XZfZKSlSA3VkZgOvm9m4TEC6shFYVkf5HYJsb
	iJqfe2vtsvrWWEXPybF3Pl4kzgw9Z8kEnyhs6pRpCRzc9De0l6pQnCNbdaWL00zm
	VAPUVdpmp9gxnCpAXYkXx7mwZu4Ep+AKRrKER/ug+8IZfeghmStJ4H9EjDje1wCO
	SpDRtMIw4oTCEbN3WSPc2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1704195922; x=
	1704282322; bh=lVTkJg3cjvcYbcVCRM3jEwk1bpjplmmOC1M0Z0hmekI=; b=u
	iHAKjnpN0YBw68MTQ8mSElSczQ24tUV32LaDWsmNRSJ6u80MFE1aqVNoq1fwh/L/
	+ZffLD3emWtonwtdHtp7ZzpIEnazajW97FYBvm1Cv+OVeTIIb5n6Kvs3QQGQUyre
	ue2udCOUlKkxssR1zVZJeVwaE091oEE/hzT2W+Hhsq+wCdF2wG9PFYyQJ0ZXMmVY
	uc4IfeejW44ZD10NRxqbs+Mxm3sfYw/YBpy47O1b6KTd90lAn0uS37Yuzfx8MJeM
	0MFt6u5OOGdhxPc2ENwKxH1iGotPv4IJ0XxJY1OVPOT5xM5ogfLCgCuTdW+IkFUz
	7AS684kAbdZ0Dc+FJGi+w==
X-ME-Sender: <xms:UfeTZa0cX-zxQaMGagWO0r2MRVFl5kXn7d_UGH98xxXW19-IzWp1Hg>
    <xme:UfeTZdG_tNUXuDecWnemKqtJBTrYTW7JmxGtKYk6LM0eqCj9p0By8Vsbghorj8-3m
    pgrK8r5noOKu7hhjzk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdegvddgfedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeegfeejhedvledvffeijeeijeeivddvhfeliedvleevheejleetgedukedt
    gfejveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:UfeTZS7KV2yZHBfZMjIzr9ASSmLK9Jt3f3LtxdsMauxiUdqUPveQtg>
    <xmx:UfeTZb3VUYx-de1_qkHa2FchWjH4V_Y7G4SBAFYYyjFXO-t4nQrc6w>
    <xmx:UfeTZdGTX3FcGZS_XAPaOxPg8xZmukYHIBGlG_CndY0HhfiaPhW6dw>
    <xmx:UveTZV-8hnN-e1YNJKFFNfk6U1XPReYj7RBSvyWpSQZKI7sokD3ppA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id C69DAB6008D; Tue,  2 Jan 2024 06:45:21 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1364-ga51d5fd3b7-fm-20231219.001-ga51d5fd3
MIME-Version: 1.0
Message-Id: <e0fae82d-aa6c-4341-bc56-1370dcf733b1@app.fastmail.com>
In-Reply-To: <ddbdec9b-f075-4c7e-9411-28baf1e68401@linaro.org>
References: <20231116130816.4932-1-zajec5@gmail.com>
 <a5113b85-e29c-454f-b776-ac7abbca771f@gmail.com>
 <d0734a8f-0b72-4609-a941-da4bdc3e323e@gmail.com>
 <ddbdec9b-f075-4c7e-9411-28baf1e68401@linaro.org>
Date: Tue, 02 Jan 2024 12:45:01 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
 =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>,
 "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 "Matthias Brugger" <matthias.bgg@gmail.com>,
 "Rob Herring" <robh+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
 "Conor Dooley" <conor+dt@kernel.org>
Subject: Re: [PATCH] arm64: dts: mediatek: mt7986: fix reference to PWM in fan node
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_034525_763541_A105289D 
X-CRM114-Status: GOOD (  10.23  )
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
Cc: devicetree@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, linux-mediatek@lists.infradead.org, =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Dec 28, 2023, at 08:14, Krzysztof Kozlowski wrote:
> On 28/12/2023 08:03, Rafa=C5=82 Mi=C5=82ecki wrote:
>> On 14.12.2023 07:43, Rafa=C5=82 Mi=C5=82ecki wrote:
>>> On 16.11.2023 14:08, Rafa=C5=82 Mi=C5=82ecki wrote:
>>>> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>>>
>>> I sent those few trivial fixes weeks ago:
>>> [PATCH] arm64: dts: mediatek: mt7986: fix reference to PWM in fan no=
de
>>> [PATCH 1/2] arm64: dts: mediatek: mt7986: fix SPI bus width properti=
es
>>> [PATCH 2/2] arm64: dts: mediatek: mt7986: fix SPI nodename
>>> [PATCH] arm64: dts: mediatek: mt7986: drop crypto's unneeded/invalid=
 clock name
>>>
>>> Could someone pick them up, please?
>
> This should happen some time ago but...
>>=20
>> Anyone, please?
>
> ... exactly now, this cannot happen. We are way past applying patches
> for the next cycle. Please ping or resend after the merge window.

If these are bugfixes, I still take them, only new functionality
should wait. I still need a reply from the maintainers of course.

      Arnd

