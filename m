Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37730C3ABBC
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 May 2025 21:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zgmYvXadLes/aaQVGDqBlJcqTMY0YA4Y28DDv3jcOmo=; b=xVZeezGI6skX5OrQ+fG1/cT0Ic
	gcxZuVhFeIpgxAIkmfF9p3HykIB+B6OeLNYNz4xFzqtfSUY+K7zWra4+rv7xaF1k3KBRrYk/a2Mc4
	83JCxM7+fh4vIJ9e0VNW4VReD91vrCIcIPsF/cy8hUG+GlB/00xCzkx28UVkwIZSKR71h1c1GasCx
	xhtNd6rPT+pl8GVaxKIxuzy5QmQwJtImlCiRn3Rf6qb4n+SNv2w025NmezTv0hNidZT9IlworC5tF
	iBKzZY80LZ3Ga9jYJtSs9LZYa8j3gNhCE5tDL+xrS1FFRT68gNOCuDtFfFBW1Vu5RkUwuV6ljDX6F
	oj9P7m4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDUy0-00000004v3M-1IjL;
	Fri, 09 May 2025 21:09:12 +0000
Received: from fhigh-a5-smtp.messagingengine.com ([103.168.172.156])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDUkV-00000004ti4-3pxf;
	Fri, 09 May 2025 20:55:17 +0000
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 0167511400AB;
	Fri,  9 May 2025 16:55:14 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-05.internal (MEProxy); Fri, 09 May 2025 16:55:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1746824113;
	 x=1746910513; bh=zgmYvXadLes/aaQVGDqBlJcqTMY0YA4Y28DDv3jcOmo=; b=
	fsIVmiSM4GKMMNKiZWvJLuRcTRRNszlucN7FmoVf2Vga4OXXSEMn3BuvkPLsf/uj
	nzyVmMZNVwllFHmgeD0BD0a7p8tMNoOuqdyUlkaNdAO6MXnd4Sfj8/9FAFnxyzry
	abLGRXqrq06DtoTaopdQ9dw3p3/m4LGjcBnOBIQfCjN/Ozfcxe21lRHbLcV4rowO
	wCaf+0ae5zxYC5+YHYrhTQX+RWkWIjT3qQsdhaKsDu9WF1T1pCYUQot+bf6ftLr4
	M4ExVJXgJtYhm5Ger7lYs8J63jGIisP66eqSv2+WCKnlOy3T/8J+CMNmFtYWEbIs
	2CQsP1r3OxbYXl+e/ps/CA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1746824113; x=
	1746910513; bh=zgmYvXadLes/aaQVGDqBlJcqTMY0YA4Y28DDv3jcOmo=; b=W
	nfJHMrON2XFRbUJS4T8+5OwwjjJ4rrgFwot8GFyode6oPwZAJ5Fvfhm8H2HwlhJ4
	MtBPh5+pwRmyNneTiHcCGmmvkzvxP/p/fpO5E3KMISsVZ08mGSTnN5+Kd3sBwI0a
	egRxZOIFb4ngZu3iPaUkQzLBHjSdt61NGv5/X1WFX/JS+w2NQYACriJf7aHuHoQ4
	l9RQ44WI0Xo1e2/Qi+W8cYIHNcljC9ICLfPKoK5J/WvkAlbrKr6i8DJOjFQbE327
	zNNyyec02On8HMb//eDXxfVwwc//yGzp4xwnqBhnKeGvJjTB6De7KVFj2aru08fw
	TMgmJBnFJx7OyAuwQpNNg==
X-ME-Sender: <xms:sWseaIbOb3soMwrIbDfzPWKMc6t5IjINtUTrWO53ZKPkJaODIu2-gg>
    <xme:sWseaDZvpeFqNzj4hsjw_Dx2yIQxN6zyDBDSHuG3qiotiZE9fdfYVeVqCDAS-gBZv
    mHhnGq0fmzigN3rLlM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvleefieefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    iedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghnghgvlhhoghhiohgrtggthh
    hinhhordguvghlrhgvghhnohestgholhhlrggsohhrrgdrtghomhdprhgtphhtthhopegr
    rhhmsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmrghtthhhihgrshdrsghggheskh
    gvrhhnvghlrdhorhhgpdhrtghpthhtohepshhotgeskhgvrhhnvghlrdhorhhgpdhrtghp
    thhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrg
    gurdhorhhgpdhrtghpthhtoheplhhinhhugidqmhgvughirghtvghksehlihhsthhsrdhi
    nhhfrhgruggvrggurdhorhhg
X-ME-Proxy: <xmx:sWseaC82gwYE0RATIolHnlqRKjrYUTKkbDNRu3Gyz-lIjLMV0qPT8A>
    <xmx:sWseaCq4w6L_fDMsB1G0IgIZP0-6cWBgIX8VYPt2KvBnjaHVZXvhdA>
    <xmx:sWseaDrqxpNjezemPCREIFT100etOLcbirUOrzynxXyIKaSszQp1xw>
    <xmx:sWseaARzgFxupy2JqEB0FVlATP9cBBD9QMud8MFeQrsnyaDhNGK14A>
    <xmx:sWseaIB_vIpA2tRWCJl6GxdVgLTd-aICtuIrrLbgT9FPeQHvgAVTrGAl>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 71A271C20067; Fri,  9 May 2025 16:55:13 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T486ad80ea708375f
Date: Fri, 09 May 2025 22:54:53 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 arm <arm@kernel.org>, soc <soc@kernel.org>
Cc: matthias.bgg@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Message-Id: <7e8718b0-df78-44a6-a102-89529d6abcce@app.fastmail.com>
In-Reply-To: <20250506091736.125733-1-angelogioacchino.delregno@collabora.com>
References: <20250506091736.125733-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [GIT,PULL,1/2] MediaTek ARM64 DTS updates for v6.16
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_135516_692003_7B384060 
X-CRM114-Status: GOOD (  12.48  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, May 6, 2025, at 11:17, AngeloGioacchino Del Regno wrote:

>    - Since SCP firmwares are available on linux-firmware, the
>      necessary nodes for the dual-core SCP were added to devicetree
>      along with the firmware-name property in mt8390-genio-common,
>      enabling hardware video encoders and decoders on the MediaTek
>      Genio 510 and Genio 700 EVKs.

This looks wrong to me: the devicetree should never care about
particular file names in a Linux repository.

Usually what happens is that the device driver must work with
a particular firmware version, so the driver is the one that
constructs a name based on what firmware is knows and what
hardware it is running on, so a newer version of the driver
can attempt to load a newer firmware that may be incompatible
with the old driver.

The other patches in the branch all look fine to me.

Can you resend the pull request without these patches and
try to come up with a different approach?

     Arnd

