Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F5F2C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Mar 2022 00:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H0c0PzwWOY+rPcNpDKFrNNOF0JO7F6Dk9FE9Q9BfkVE=; b=FNS7/d2/oADDMA
	n0VQvXu+uIiwompU4lf2NgW8BxJQBGIAdilA+v3rMfJXLaCxxJHi3n+iDZw8WGX87p0WjQyOziaay
	P0UVBgcAY/A4LyYg2azLTMbvoQVdQ5GohPLoLEqIvcMYWOXqu3KoLDn7/TXBfsyp6OoFn8hcrhXrC
	icX3MrqTqpOQotPGhryqXxOGz2+ib2l7/TpLczKuPqsczLecudfYYRg1moNo+JvPPISys931WATMA
	TByAG86ay7m68LJtkR3sTncVdlZF+nlhudfm/aV7thJlitS+GQjEtksNTizH2DhMXSNrAoA4h4jun
	c59o4DoRGmjrNPK+4+Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYzel-00AY2A-EH; Tue, 29 Mar 2022 00:24:19 +0000
Received: from new3-smtp.messagingengine.com ([66.111.4.229])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYzeX-00AXyV-Bm; Tue, 29 Mar 2022 00:24:07 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id AA157580367;
 Mon, 28 Mar 2022 20:24:01 -0400 (EDT)
Received: from imap49 ([10.202.2.99])
 by compute5.internal (MEProxy); Mon, 28 Mar 2022 20:24:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; bh=YVcOcYXKVU4PEK
 ENIKD3lZlfbqMF8OkXUPWQPtT0ZzA=; b=GV8iKIgkifB/LyajStlhIzzaA2PqSU
 rEPGZBnWRziuDMlxEaU3fjhl0DHmyiueo1E3rsDwPrq1dyaythjr8LeJ4NZ3kmFH
 v7J0UO7b64vG5VRtrXZ/OicN/3vDmtLy+M6As/zf5/EYH2TO2OF+YIkppderpdcN
 ocuY8KYW/dUFglcgTgXnC/6f5bvCH2TNkniwuNDGczxXDBDNnP2nHRX3u9u0y3Go
 2HHhDpJUS8OMLXTkUmRtrROlDXASYpEdp57tTxY7G7Ci6RHcafVgGiKZGpjbHNDZ
 //P9ySL7tvarTkKke+QN7H1PCcvhD3CsMcxHphO+TJq7W+71Q2wgIxYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=YVcOcYXKVU4PEKENIKD3lZlfbqMF8OkXUPWQPtT0Z
 zA=; b=MfUF/QO1w2kk8LobJGDnDjGmGT9HUgvaIsBRcZJH4NP16C60y/NJslTt7
 orhhkgHh49rbOiH30mg+9nD++QY3WWgzSB2sDT9Qr4nBx6DPKrUBtQOsEMz/dHsj
 tnZTX8+5b3lvOKKTTCyQClpi0fsj22EquswXftZXPkMfoj2QCv1jAapgIQLAxfMF
 S0z3hjnx7eO2S93c8UZottn5LmdiG0YcFFuK5zB8/ar7yCvc0Jy0dFV5KjDfSzzb
 3LrydgytiTwdKd8S3tKaPDcolfNGWpjEyPMA80KKZ8LEsNOU94avhhnY8yVPYBI+
 z15/ibq45vK+JxVduu76w45M0nzjQ==
X-ME-Sender: <xms:oFFCYs9K0yagZswp7rFBq_h4vFfHgzOKyc_TzBu90N89g92vvi8M3A>
 <xme:oFFCYkvw9h1jnh95ii6UH3c9xPcsfcQHqQiMHfK2AbFZHDfMquci3iY3KqTCG7jHE
 woyrhqOfmB1RNSngg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudehkedgfedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedftehn
 ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
 frrghtthgvrhhnpedvgeekheegfedvhfethefhudetteegueeggfeiieegueehkedugedt
 kefglefgheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:oVFCYiAKjCQA5Zb05U61crJ5MlOJCJLgZQqyWNA7a6PSqL49ds9rcQ>
 <xmx:oVFCYsd7HLs87jVXkH1pk4ddv_005tSApo64HS9hBsjced9RxeZQlg>
 <xmx:oVFCYhNCDSxTTbHGsk6l4iYUYPZLYU9gbpl7DI-t2s9QTshCOjdDqA>
 <xmx:oVFCYjVxoE5j7ipqETgwLEOiheaMjFzqbcptYMrhCgrHpWjYJYVlwQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id E057EF6043F; Mon, 28 Mar 2022 20:24:00 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4911-g925b585eab-fm-20220323.003-g925b585e
Mime-Version: 1.0
Message-Id: <d5e6c96b-5882-4602-93cb-b08a65bfa37e@www.fastmail.com>
In-Reply-To: <D9AFAC3C-46CA-4C40-8559-FD6934411CAB@goldelico.com>
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <YkG2RPrtPaBNXb7a@latitude>
 <D9AFAC3C-46CA-4C40-8559-FD6934411CAB@goldelico.com>
Date: Tue, 29 Mar 2022 10:53:40 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "H. Nikolaus Schaller" <hns@goldelico.com>,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 "Ansuel Smith" <ansuelsmth@gmail.com>
Cc: "Rob Herring" <robh+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 "OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
 linux-actions@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Linux-OMAP <linux-omap@vger.kernel.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@axis.com, linux-aspeed@lists.ozlabs.org,
 linux-rpi-kernel@lists.infradead.org, chrome-platform@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, kernel@dh-electronics.com,
 linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org,
 linux-tegra@vger.kernel.org, linux-oxnas@groups.io,
 linux-arm-msm@vger.kernel.org, linux-unisoc@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-realtek-soc@lists.infradead.org
Subject: Re: [RFC PATCH 0/1] Categorize ARM dts directory
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220328_172405_892959_35F5D919 
X-CRM114-Status: UNSURE (   5.79  )
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

CgpPbiBUdWUsIDI5IE1hciAyMDIyLCBhdCAwMDoyMCwgSC4gTmlrb2xhdXMgU2NoYWxsZXIgd3Jv
dGU6Cj4+IEFtIDI4LjAzLjIwMjIgdW0gMTU6MjEgc2NocmllYiBKb25hdGhhbiBOZXVzY2jDpGZl
ciA8ai5uZXVzY2hhZWZlckBnbXgubmV0PjoKPj4gCj4+IE9yIG1heWJlIGJjbSBpbnN0ZWFkIG9m
IGJyb2FkY29tLiBOb3Qgc3VyZSB3aGljaCBpcyBwcmVmZXJyZWQgYnkKPj4gQnJvYWRjb20gcGVv
cGxlLgo+Cj4gTWF5YmUgaXQgc2hvdWxkIGFsd2F5cyBmb2xsb3cgdGhlIGxpc3Qgb2YgdmVuZG9y
IHByZWZpeGVzIGFzIHdlIGFyZSAKPiB0YWxraW5nIGFib3V0IERUUz8KCisxIChpZiB3ZSdyZSBh
Y3R1YWxseSBnb2luZyB0byBkbyB0aGlzKS4gVGhhdCB3b3VsZCBuZXV0ZXIgbW9zdCB0aGUgCm1p
c3Rha2VzIGFuZCBkaXNjdXNzaW9uIGFuZCBjYW4gYmUgZXh0cmFjdGVkIGZyb20gdGhlIGR0cyBm
aWxlcyAKdGhlbXNlbHZlcy4KCkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlh
dGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
