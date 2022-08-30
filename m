Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66B85ECAAD1
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Aug 2022 14:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:Cc:To:From:Date:References:In-Reply-To:Message-Id:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xk0iP9p8EoqfJWpbJFk5kvmDlQGAXQw5xPFb6y+jgAM=; b=QtGIh6YIS3z+RqBuXFv4+aCBt4
	r7P9JUNkJAOaCP6ccUDi7gcQgnqT5KRvT4c9naTIRrvsESP33pJwbwvlzRm0FiE5w1QsBVlp73Y9t
	xrPAhghVz2ZI0eR6yTwXVUgVaAE//cOyQT6K6vdetZ0jW+fCkTRaQV97lsP2MQxT0psR6qBn+zzAc
	5rrPdmJ6VTBVbCkSx1XKd5z4BxZ79xx4BmgNErZmw0HRkkNN27j43q8qnQ65npf7hC1jgVy4wV2Bw
	rE0NvEQxAp/2YKDL5IapRiB1vTI2BBqs89yd6/4lmFmQT72lKvblFOLDG1eDDKFHxH/EDkkOljGpv
	5sAIULFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT1yR-00HWXB-78; Tue, 30 Aug 2022 14:12:15 +0000
Received: from wnew3-smtp.messagingengine.com ([64.147.123.17])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT1yF-00HWSv-SI; Tue, 30 Aug 2022 14:12:05 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailnew.west.internal (Postfix) with ESMTP id B53782B05CF0;
	Tue, 30 Aug 2022 10:11:49 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Tue, 30 Aug 2022 10:11:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1661868709; x=
	1661872309; bh=Xk0iP9p8EoqfJWpbJFk5kvmDlQGAXQw5xPFb6y+jgAM=; b=k
	uEOLz8l/kQu7cSnss0zUjbGipIeY11IBJoHAFsNyuRZs4ZYNwUVbKTDxDKEnz1om
	NkawnAKmhFZ5qGQU2s4NAQhGkOkx0aCMYI3DCpiS6rnLvSDBqCb/oEJ/g+az6qLh
	Xv1+83+xSQBgTu8q+rWDqEPQ/aT5IEiPjneLONKhs7B+H96vKt2/0ezlROJJN5bf
	UYYUcvt1D6ZHB5cMnpJ8JNm0beiM8uB4gNbnIGv+eocWOfQ4tknsTU7wX/foyXSn
	uVZHcpsvIwDwDjkgAi++kckoUzxgcw3j28ef6e3W+XkOkKNezlqj4r15Wu+2pi4P
	rzYsXauwqNEkWVRfKVU9w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=i56a14606.fm1; t=
	1661868709; x=1661872309; bh=Xk0iP9p8EoqfJWpbJFk5kvmDlQGAXQw5xPF
	b6y+jgAM=; b=wbwEvHkzkppP6ffLKkFOwMd6WONP31JIZpF3rIPmE+lkvjrMB5c
	xollh6A0B7v+Z6G8iWWvQ0OE9B+chocJ4pG4+2mBm4Q5lIaR1cWnwsLudtfqO4C6
	2LT01au7jn7KGHLEWJgjaO3z8R7rqud/ElaTQpJPJSOwPtoaCj2jAzsAigmqmOuw
	TFT72JIuFActYbQsaujloXepyqS0YBf52OUpJpIbEQOBNqb7nJL5LxHcgDwbuCaE
	k7sUCkdOp+QvtX77VaiuJEqc5W/Yubxgpj+AG4sH9m5ecDAMagwtgPfnqPAdCwgX
	3ysYuUUfKsRokHZdnT3/qTvR5c9zgThT1aQ==
X-ME-Sender: <xms:oRoOYz1wVhQ5sL0bVD69N6Z8mIpvC6i4BbaN1J-KTgpXlNDz7z2qSQ>
    <xme:oRoOYyG01ve87dtKqhtDMLBdyEOtTTvZvsJ4TOGhKh0SwcGEjOt4FD4C6BRWUOuPU
    a5YesQTH2CCUb54g8Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdekfedgjeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeegfeejhedvledvffeijeeijeeivddvhfeliedvleevheejleetgedukedt
    gfejveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:ohoOYz6wDBBZmQCwKLU-R1VYy1jgvBYdpemR56Q-Xr1ltrtEm1qB3Q>
    <xmx:ohoOY40qyr1fgz6gHUZrarUt6aUtCuvCjuhLB2Izrt821weUZPuCjw>
    <xmx:ohoOY2GQji3q3ajZBpAAbac2sBJWgS6orhW5fD0j5neoF9RtadjuaQ>
    <xmx:pRoOY9E6EFVkAZ44Qf1p4ypF5hZhZdmFDU-BEgaxxWR3-2SeOTaFyutdFeY>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id D7C26B60086; Tue, 30 Aug 2022 10:11:45 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-841-g7899e99a45-fm-20220811.002-g7899e99a
Mime-Version: 1.0
Message-Id: <3e2937cd-ba93-4f82-b27f-7d1e061843c7@www.fastmail.com>
In-Reply-To: <20220830134059.18744-1-zajec5@gmail.com>
References: <20220830134059.18744-1-zajec5@gmail.com>
Date: Tue, 30 Aug 2022 16:11:25 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>,
 "Srinivas Kandagatla" <srinivas.kandagatla@linaro.org>
Cc: "Russell King" <linux@armlinux.org.uk>, "Andy Gross" <agross@kernel.org>,
 "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konrad.dybcio@somainline.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 "Viresh Kumar" <viresh.kumar@linaro.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>,
 "Amit Kucheria" <amitk@kernel.org>,
 "Thara Gopinath" <thara.gopinath@gmail.com>,
 "Daniel Lezcano" <daniel.lezcano@linaro.org>,
 "Zhang Rui" <rui.zhang@intel.com>, "Joel Stanley" <joel@jms.id.au>,
 "Florian Fainelli" <f.fainelli@gmail.com>,
 "Thierry Reding" <treding@nvidia.com>,
 "Dmitry Osipenko" <digetx@gmail.com>, "Mark Brown" <broonie@kernel.org>,
 "Stephan Gerhold" <stephan@gerhold.net>,
 "Michael Walle" <michael@walle.cc>, "Shawn Guo" <shawnguo@kernel.org>,
 "Geert Uytterhoeven" <geert+renesas@glider.be>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
 "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>,
 "Marcel Ziswiler" <marcel.ziswiler@toradex.com>,
 "Biju Das" <biju.das.jz@bp.renesas.com>, "Vinod Koul" <vkoul@kernel.org>,
 "H . Nikolaus Schaller" <hns@goldelico.com>,
 "Kees Cook" <keescook@chromium.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: Re: [PATCH V2 1/2] nvmem: prefix all symbols with NVMEM_
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_071203_968712_818104DE 
X-CRM114-Status: UNSURE (   8.78  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Aug 30, 2022, at 3:40 PM, Rafa=C5=82 Mi=C5=82ecki wrote:
> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>
> This unifies all NVMEM symbols. They follow one style now.
>
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> ---
>  arch/arm/configs/multi_v7_defconfig |  6 +++---
>  arch/arm/configs/qcom_defconfig     |  2 +-
>  arch/arm64/configs/defconfig        | 10 +++++-----
>  arch/mips/configs/ci20_defconfig    |  2 +-
>  drivers/cpufreq/Kconfig.arm         |  2 +-
>  drivers/nvmem/Kconfig               | 24 ++++++++++++------------
>  drivers/nvmem/Makefile              | 24 ++++++++++++------------
>  drivers/soc/mediatek/Kconfig        |  2 +-
>  drivers/thermal/qcom/Kconfig        |  2 +-

Looks good to me. I assume this will get merged through
the nvmem tree, so for arch/arm*/configs/*:

Acked-by: Arnd Bergmann <arnd@arndb.de>

