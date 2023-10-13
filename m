Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C2A8CDB47E
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Oct 2023 20:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Subject:Cc:To:
	From:Date:References:In-Reply-To:Message-Id:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=06mxbtZACsI2mVsJaW6iWZzyglMNLK41Ina8KQ/hz3Q=; b=Ts+G9ZVUmeaFt7Pr2McWXjTqir
	6U4BP9H3Vi54TajgpR7tAzDYYXzbWN6jEr2HLJdlEQCFQ6eFvkUOoxhpaqFaOHi18phS7DOSe2MEJ
	nj7JhllsiCd5uIHpO8cin5NQ4uSXnUs2T0ZBvNBJ4aqZsCTYC2KyQ1GLIE/qeVG1sYbX401qnFGHJ
	tXeOW3FeutSw4TDqqUqzzHYGbwnbs4FmIZ74Xq6fHGwlAbcMnueG2pEqGGRpfkAGJqQNFql4IHyRw
	G+5OamhsoG3+CCo2Hj248e66LmhxnJVWl9NpQ1/3szzu++G+if4dFxuVlycGboaLFXX/a+f5LI48w
	lFLZx1hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qrOxq-004FCq-3B;
	Fri, 13 Oct 2023 20:40:54 +0000
Received: from out4-smtp.messagingengine.com ([66.111.4.28])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qrOxm-004FBs-38;
	Fri, 13 Oct 2023 20:40:52 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id D07E95C00E5;
	Fri, 13 Oct 2023 16:40:46 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Fri, 13 Oct 2023 16:40:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1697229646; x=1697316046; bh=06
	mxbtZACsI2mVsJaW6iWZzyglMNLK41Ina8KQ/hz3Q=; b=a5cLWoeD6+VBwKuKKc
	BeEzZSu9MaU1Nvn/JVAPtb8BlKUJAMkHd/SflSCJvR0Yj+xkMGmeD2z2ul717X3m
	V2q1GGxyje9Q5JNYOAt5veH0TCIxe/Cc6XPMPevdnv5Z6B7i754B+vYajPMJkMXY
	O5EgnvtCWt090WxE49g8YcG9b0vxNPvBFhrLOxrUZ3faukLlqexS1crs8mallkde
	LMi4XqYBL2AIzjC8lghtUejmF0gBdTiwOcs+coG/sGaBZKRLRLEnjSe1U5O+utqj
	NLGqzpVoLc5F5f4mTVTZDUsDC4t/676N69RtbJ+Rop8lAJHPZrLFCLq6UEUcjF8r
	UNqQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1697229646; x=1697316046; bh=06mxbtZACsI2m
	VsJaW6iWZzyglMNLK41Ina8KQ/hz3Q=; b=bmgO8zJQvS07tKEapmtUHCrU6YQzK
	gM8GiHzcsemm1nmFr1ch2890ov6ltYqo5MgUnw7wOdxgdYy3Z5Xvdb7fAtsntt4v
	Jjbu6H/riZcMCYKxFZckz4+SwmDJX7EC7kr+jBlAV4G8EgJFoS9N3nhYSDJalepO
	2vUaeVxZzIFA2aKwDfUrLQw8fWGjMLcETkGtxDnGS6lq4N7mERBBYwWuMJCfNc0T
	o5eTHTP4teDong198h88yPItbQQEliB53YY9pBximD/2b0tC4/L80g8tIMP0g/n4
	H4CfjM5IqdvVIcFrpfbODzENuiMXfI74jGGKEQjYFFjf65ybCxGBYIvlg==
X-ME-Sender: <xms:TaspZSUfMd2VWe8fMwzwnuVtU_eKAt0EGuN0hXJbnxNYHLuasDrRNA>
    <xme:TaspZemc92PHOpzKJXIxqsdkYA0r8q4zo6Q0XrMRhENVXkYx2cdOWZhVdMXSTdhp6
    L-hBKWnxSQFHEgc2r8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrieefgdduvdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:TaspZWZ9k7PGSQ1HsltnUKO-s-ggZGrzy3kAL9Ym4Lgm8TaSeKV4YA>
    <xmx:TaspZZV0YUvciXFEuXekFbDtG2Rh8ajqgantqWHDNzbe5nIHTqIPZQ>
    <xmx:TaspZclF3JLWrUPj9kD64Y_VBdVwXHHeyaMH9NUKkgws0wvrKLnfSw>
    <xmx:TqspZWUzFr3wEPZ0QMw-4jWg-88E0u_Wx-IpWBL-TyC02xwfitnFcA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id A2C0DB60089; Fri, 13 Oct 2023 16:40:45 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1019-ged83ad8595-fm-20231002.001-ged83ad85
MIME-Version: 1.0
Message-Id: <ae62c7e0-3e72-403c-abb4-569573037980@app.fastmail.com>
In-Reply-To: <7a877ad9-481f-bad8-5cad-5d013c6cd70d@gmail.com>
References: <7a877ad9-481f-bad8-5cad-5d013c6cd70d@gmail.com>
Date: Fri, 13 Oct 2023 22:40:25 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Matthias Brugger" <matthias.bgg@gmail.com>, arm <arm@kernel.org>,
 "SoC Team" <soc@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 "Alexandre Mergnat" <amergnat@baylibre.com>, "Chen-Yu Tsai" <wens@csie.org>,
 "Macpaul Lin" <macpaul.lin@mediatek.com>,
 =?UTF-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Subject: Re: [GIT PULL] arm64: dts: mediatek: Updates for v6.7
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231013_134051_435795_5B0A8CCC 
X-CRM114-Status: GOOD (  16.32  )
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

On Mon, Oct 9, 2023, at 12:34, Matthias Brugger wrote:
> Hi Arnd and Olof,
>
> Please find below a few patches for the 64 bit DTS files targeted for v6.7.
>
> The patches were picked up with the help from Angelo.
> With these changes we have now support for the Genio 1200 EVK board for IoT 
> applications. Also the MT8365 from the same business line has much more support 
> of peripherals.
> Also support for the new 4th revision of the Acer Chromebook 514 was added. The 
> difference with older board is the audio codec used.
> On the Mobile phone side of things, support for the Helio X10, which is used by 
> the Sony Xperia M5 got support for the display.

Hi Matthias,

The contents all look good and I'm happy to merge them, but I noticed that
the branch is based on -rc4, while my soc/dt branch is based on -rc3.

Pulling it in would slightly mess up the git history and the 'git request-pull'
output because of the backmerge of the mainline contents. Do you
have a hard dependency on something that went into rc4, or can you
rebase the branch to -rc3 or earlier?

I usually recommend using -rc1 as a base unless there is an important
dependency on something that was merged later.

      Arnd

