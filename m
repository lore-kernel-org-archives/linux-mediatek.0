Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1D56C27C53
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jun 2024 08:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Subject:Cc:To:
	From:Date:References:In-Reply-To:Message-Id:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d8ymq7h+SupUPB1TveszzEzISILgzgA3jwE5Eb5tOo8=; b=scroMnp9DX5wHPER1YgEw//2tf
	52inI+oW3m2ycGN+nzEUnSTxz1PyUBRV6hjAFf7mhugySinUXCx4wen+eqmSnvkv7fi9Cm/+AeRkF
	uTIbGF90aMNK6K5pFgimlKNkhFHEOOKKh1cm2eMy0xTY+SP6CFXmHNun2pkreaVd7MAIlIOZmn/+m
	vsuWKNzKKXU9FPt6Jo+CpXbpt7n3bikpcz9No2DQtfXqBSq+N/xftyhq/mSq3aEMU1jQ8Edcos5Cu
	yW9FN88vqPraVf6ntvYzT+iLZ0Pi6hvJ05hbLK5e+CeX9T9mBDH0Wq/MYuNgA61g/Fxv3V31OFx9o
	2z5qONaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHJCT-0000000BfaK-14VZ;
	Wed, 12 Jun 2024 08:19:21 +0000
Received: from fout4-smtp.messagingengine.com ([103.168.172.147])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHJCO-0000000BfZI-0Yca;
	Wed, 12 Jun 2024 08:19:17 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id 8EFBB1380193;
	Wed, 12 Jun 2024 04:19:14 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Wed, 12 Jun 2024 04:19:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1718180354; x=1718266754; bh=d8ymq7h+Su
	pUPB1TveszzEzISILgzgA3jwE5Eb5tOo8=; b=cLtineVW9mr/pV8qARMG2jgqOS
	+5XYZXEOoVSCYDVQdas5V5ZBdf2YV8Ae2k+/bfx5LJBmWNSlh+OD/PB6uaXZqZ1s
	HqM7g8ErabNRspnQ5XaLsJJIMTk4qDzcn1fxXZc1rLMmGOzrBwv9sERSPA9oZVJd
	dJYIq+G18nb+nZ6cb0+gVXzUAYWyTaM9q7r+mi093YKkcCSHyARHElKBGoAh6oG1
	ARAWdmKtLhgi2qPFun7jQJSKdRWfISSeSFnk/dMQ5hBxkvnglD7Wk7lHbkllfccz
	jm1CId6N41DKpfjjNLvyf64Bfh5zByI+lyffSQYm+vUAx3+SKp3MKRedsIdw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1718180354; x=1718266754; bh=d8ymq7h+SupUPB1TveszzEzISILg
	zgA3jwE5Eb5tOo8=; b=Ep5NWYR1umrudPmeDMu5zJ40VHbQhuNrWLLvsC+AvDGa
	Ck9he2H8ZwTc6/uvUGegKIv2tFoXhYR9e+TnP1ke5YFTfMJroMsqXBBpzqRlrBia
	iFM/8hmBILSkGNuM1NI1x0TWb0MeZnagFm0w9+XzKck4c+V+Bik0oCNkDsiMQG2Z
	N0h5j+Bqy0j1p2EC0pT5OP2MRr7dOh84/TvhpDyaM6zrote36lO4UFZIAbJiJa8M
	1zPvdIf5yCKhMiuobjI/RW4mb45QndV2UKaFmeYbKcIR/c7O2dA1eyvdY3QCxbMo
	cRGITwOdyhbL6XgPr77iZ6MU9r9zzezjADrlvQ4oTg==
X-ME-Sender: <xms:AlppZgyhzFuOFYwRPkvpuRiZVMiS-XWloRkTwKptMs84lMwYsWPx2w>
    <xme:AlppZkR21xV8qOeULUtzpTHFseQBiudMO_FFYipXMIq_UButUWe2g6weD_C0MR7d4
    PCrFDq_UpeaehILs9s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedugedgtddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:AlppZiXLDtfOBZktVAvgWTF0ksGBBajqeywK6hU7pK4KVR_NpZtQzw>
    <xmx:AlppZugoz3yNYqwEzCEGHKewNaDkoVoQ5PDYt7-4D4MYXPI3Mi2pEA>
    <xmx:AlppZiCfGGV2Q67Gjfk5v1vObUSV_TRM2ODFvniUt5bHjHGuoH3_mQ>
    <xmx:AlppZvIc2Rx6ZYp0hZvwZI9EhosZMfB1rLtQ6dyuTqbMl2X4fCH39w>
    <xmx:AlppZq6qYlLxPN7FqNnVAsjF9zzvF184QZ0j8p5vaNoOR26uVR5RX2Xe>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 00598B6008D; Wed, 12 Jun 2024 04:19:13 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-515-g87b2bad5a-fm-20240604.001-g87b2bad5
MIME-Version: 1.0
Message-Id: <cfad60ae-3dee-4c03-84c0-734f1fa59ff2@app.fastmail.com>
In-Reply-To: <ea604d75-e571-4d63-a7e2-aa1393588c75@collabora.com>
References: <20240611-md-drivers-soc-v1-1-8f0fc9fff234@quicinc.com>
 <a314c676-3dbd-46f8-826a-2e59367d30ce@linaro.org>
 <ea604d75-e571-4d63-a7e2-aa1393588c75@collabora.com>
Date: Wed, 12 Jun 2024 10:18:53 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Jeff Johnson" <quic_jjohnson@quicinc.com>,
 "Kevin Hilman" <khilman@baylibre.com>,
 "Jerome Brunet" <jbrunet@baylibre.com>,
 "Martin Blumenstingl" <martin.blumenstingl@googlemail.com>,
 "Shawn Guo" <shawnguo@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>,
 "Fabio Estevam" <festevam@gmail.com>, "Linus Walleij" <linusw@kernel.org>,
 "Imre Kaloz" <kaloz@openwrt.org>, "Matthias Brugger" <matthias.bgg@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] soc: add missing MODULE_DESCRIPTION() macros
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_011916_456949_3641EEAE 
X-CRM114-Status: GOOD (  11.43  )
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

On Wed, Jun 12, 2024, at 10:12, AngeloGioacchino Del Regno wrote:

> MediaTek:
> Reviewed-by: AngeloGioacchino Del Regno 
> <angelogioacchino.delregno@collabora.com>
>
> ...but I'm not sure how we should apply this? :-)
>
> Either Arnd takes it directly, or you split it per-soc... and I don't have any
> preference anyway.
>
> (P.S.: Added Arnd to the loop)

I think in this case it makes sense to keep it as a single
patch, no need to clutter up the git log with identical
one-line changes.

Jeff, can you send this to soc@kernel.org (cc:lakml)
once you feel you have enough Acks? That will put it
into my patchwork queue.

      Arnd

