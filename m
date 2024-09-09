Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF706ECE577
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Sep 2024 15:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GoO+4rDRvCidQRTP8YhAtcXrJfxeBaE4233p62tPSHM=; b=P6mng1AjEUJeUyS9YY9sJIKXFr
	vPSLu1JdGW8WIv7ctkIZv/YyrdfP0BVyZr0qx3YQKp93vp7FdXEgytGoyQICYcHzrdthQkemL8GxI
	4u+eUE73a3Hsz1C/SZIINDC+ophyUOSY9W9ygdXu722TDk2Tl9vWPfA27Zd4BOjmVowCtvx1sslwQ
	NWvkKIP0ht0fcgEXKvuqzQMm2wMPcLnR5fjLOCz7w2KcTHjX8b4aSqEb6xxAPna9bbgawHMFD5wAC
	dyJxA489w0dBdUvO+coZ9eG7V/vGY0Sv3hll/4gOtk/0DxyqVvr5bSofxnkRq3OJVOgtwqbAFU5Ju
	krWAfa7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sngeB-00000002YLD-2apS;
	Mon, 09 Sep 2024 15:49:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sngd9-00000002Y4w-1J6T;
	Mon, 09 Sep 2024 15:48:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0FCBC5C0248;
	Mon,  9 Sep 2024 15:48:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96BB4C4CEC7;
	Mon,  9 Sep 2024 15:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725896922;
	bh=qfF7BKhca1F+Onm/J8eJruSRocelnXBb7AnYSAEGGaA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uyKuSPXOPYkkj+DggQ50Xf1c3S2H6Zk2LBlEGt6YzrWZWoxcUEPYL2xP1VjzcSotm
	 qB+c4mj5YmhFZnITiT1SqtHX0mBxWt/TWjIw3l+QC7L5J1q8+6vZVYYbzEsWsaluAr
	 XYn57CW/oBUbNWVovYhPEQnJG39d4qogu5A5mURt9vu8iLTK7Wpy9fp6qkrm4DZoDH
	 vwJDINfHktHCa07Vk5tSalYnVwmQR6bLEYoDBabhzawZTyoGAhDXcyVZVd50Eav62u
	 B2Dgp/L+4oNN9rA5tUWhsN4W1JTB4f4pT2ZiboCzDBdb96JWWtIBW8j0vAt7YDDIi+
	 MXgfttRIOcQ5A==
Date: Mon, 9 Sep 2024 08:48:39 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 0/7] ASoC: mt8365: Fix -Werror builds
Message-ID: <20240909154839.GA59917@thelio-3990X>
References: <20240907-asoc-fix-mt8365-build-v1-0-7ad0bac20161@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240907-asoc-fix-mt8365-build-v1-0-7ad0bac20161@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_084843_466184_2EB432FE 
X-CRM114-Status: GOOD (  10.95  )
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

On Sat, Sep 07, 2024 at 01:53:25AM +0100, Mark Brown wrote:
> Nathan reported that the newly added mt8365 drivers were causing a
> number of warnings which break -Werror builds, these were only visible
> on arm64 since the drivers did not have COMPILE_TEST enabled.  Fix this
> and some other minor stuff I noticed while doing so.
> ---
> Mark Brown (7):
>       ASoC: mt8365: Open code BIT() to avoid spurious warnings
>       ASoC: mt8365: Remove spurious unsigned long casts
>       ASoC: mt8365: Remove unused prototype for mt8365_afe_clk_group_48k()
>       ASoC: mt8365: Make non-exported functions static
>       ASoC: mt8365: Remove unused variables
>       ASoC: mt8365: Remove unused DMIC IIR coefficient configuration
>       ASoC: mt8365: Allow build coverage

Thanks for this. It appears to resolve all the issues from a build of
allmodconfig for arm, arm64, and x86.

Tested-by: Nathan Chancellor <nathan@kernel.org> # build

Cheers,
Nathan

