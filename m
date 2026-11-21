Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6AB606A320
	for <linux-mediatek@archiver.kernel.org>; Sat, 21 Nov 2026 23:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=R2PyQx3q;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a3eWUBT1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=yugA/hpxPa9PPMqm+bYi6Gf+4noP3z0dciXI3mzgobQ=; b=R2PyQx3q4zM2Nu
	h02tethNgwoO8/zUn30d7T7982R2fTjrcgSUw1lCsmjakZAJUKPVz4BDphF6D92E3UiJO3j+cDkbp
	7LxM7riGmxloW47ZPXSeyqzgiJtMFr1Uo2mW5+bXTM6zfIZEB94SAOiNUQ0Q5ZTIw/bn2LnkAPLbn
	F/Kh8xFT7lKktJylpHl8oSlU8xiFyqgJ2t5oNObcIYzR0Op5S7Wi5TigRyjqm/9I/kk0EH2J7pU1/
	o985G63QozxHfA4iHVzltR20wJ3tdYwnLJCJZiDIC/yUfq0m48GeejcUBxn+6UU8/EOVNL0qn3ZyP
	IedsBry09wIcrqDskPng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUuwJ-00000000YY1-42tt;
	Sat, 21 Nov 2026 23:56:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUuwG-00000000YXG-00Y6;
	Sat, 21 Nov 2026 23:56:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 428B360F05;
	Sat, 21 Nov 2026 23:56:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1CE81F000C0;
	Sat, 21 Nov 2026 23:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795305370;
	bh=yugA/hpxPa9PPMqm+bYi6Gf+4noP3z0dciXI3mzgobQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=a3eWUBT1S4Rk/Vz1dKqOCH51xkD63zScM/huWV7vrW5dzG5FiIEcwXUnml4RWrSCn
	 wVgC5iSF+e9cy+TvFSFSKp1MX3KUm1mKgVG5+4kAdN3Q1gWrZ3tjk5nTNxjt4V/SS1
	 wZiwegcKtFB4e75D0SlwtEecTNbE0R4iPQmOU1DTbW10VTH+PmQdlAIDmwyKW7/3qg
	 3jDPfMMPkzCrwaVCPayKREHZfZSkB6YGnPMXCRKeRoZ2ilNZh8/bPiUoSD4Jluk5nN
	 ZSuee2XktArpyljXsXXihBY9yrGjZRmCVcoOleN3BDdlhDMxCJHdVq5mHMVgfAYTgX
	 B5mGYInSpLArQ==
Date: Sat, 21 Nov 2026 23:56:03 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Cc: rva333@protonmail.com, David Lechner <dlechner@baylibre.com>, Nuno
 =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, "=?UTF-8?B?TsOtY29sYXM=?= F. R.
 A. Prado" <nfraprado@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 0/3] iio: adc: mt6359-auxadc: various fixes
Message-ID: <20261121235603.41ce1ec4@jic23-hlaptop>
In-Reply-To: <20261117-6768-6358-fixes-v2-0-1ffc3c2f3c80@protonmail.com>
References: <20261117-6768-6358-fixes-v2-0-1ffc3c2f3c80@protonmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 17 Nov 2026 19:56:31 +0200
Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org> wrote:

> This patch series fixes various bugs in the mt6359 auxadc driver. For
> some reason, the driver had channel types for temperature or resistance,
> while the ADC can report only voltage. There were also issues with
> battery channel ready bit masking and scale calculation.
> 
> Changes were verified on the mt6358 (mt6768 platform). Compile-tested
> only for others.
> 
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>

Hi Roman,

The series looks fine to me, but as we have fairly active folk
who care about this driver (or at least did recently) I'm going
to wait a while for reviews to come in.

Thanks,

Jonathan

> ---
> Changes in v2:
> - Clarify bit number in the patch 2 commit message (Jonathan)
> - Link to v1: https://patch.msgid.link/20261103-6768-6358-fixes-v1-0-2a868a33152b@protonmail.com
> 
> ---
> Roman Vivchar (3):
>       iio: adc: mt6359-auxadc: correct channel types to IIO_VOLTAGE
>       iio: adc: mt6359-auxadc: mask conversion ready bit in mt6358_read_imp
>       iio: adc: mt6359-auxadc: fix scale calculation
> 
>  drivers/iio/adc/mt6359-auxadc.c | 88 ++++++++++++++++++++---------------------
>  1 file changed, 42 insertions(+), 46 deletions(-)
> ---
> base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
> change-id: 20261103-6768-6358-fixes-fcdc79afae11
> 
> Best regards,
> --  
> rva3 <rva333@protonmail.com>
> 
> 


