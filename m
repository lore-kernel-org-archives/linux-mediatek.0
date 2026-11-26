Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA43606A31E
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2026 21:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hM5Ia8tZ;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BCaiHIt6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=5Kzpid4RLm/541vknBbiSpsgz96CflLOK7rHjgv23pI=; b=hM5Ia8tZIJcUWQ
	Hqh3Zj5RvwRGZ7JpBh4LIK+cFGgb9lRjICklgBou4P3062aafnCmcxv5Dsr+/kOwmOVSZ1HjuJNqz
	ge6gBWIIeijPxPYpHuiPYp7VrqoHDRxNJ3JrdSQlVpwMivKevkbgSfoXhD77ee7wx0aglG/nXRlyH
	3jc4tCXodLyNsecM2whSQTt2ZcD3j4UGWK2vmb0KVNXPLTLMr18xRsWdW8KX2pANG3AAdh9Zuo+Rt
	zp/3vb9melBtaRNXv3lryywLLzaOu3RtsoofDvtLGipka9M2hM21b7KW5KORPcZptzTSGPuRAuGJd
	gHIXgm2g1Y+7ZuGrsGfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWgw4-0000000EY3a-2BlG;
	Thu, 26 Nov 2026 21:23:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWgw3-0000000EY3N-09Rq;
	Thu, 26 Nov 2026 21:23:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2DC926022A;
	Thu, 26 Nov 2026 21:23:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C2B61F00897;
	Thu, 26 Nov 2026 21:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795728197;
	bh=5Kzpid4RLm/541vknBbiSpsgz96CflLOK7rHjgv23pI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=BCaiHIt6JQl0pKTeR7oir9kH6/VRwOk66jC8Lakml5kQXxM/bsIIulL6wNEiFYTNL
	 v7c5FpxDbbQROOP6Egyukx7h6LD0Ef38w09+5qGiT9sO2+aOxOuC9Ojpb2Ie0Xxkzf
	 b+wnzDj1eiFI1WOiIfYoO7YvAFYWS/pQJa3w0COFDMzDi9ALyxjEqyhWHPKWg8s77a
	 NRdRxtBcARIGZlJ67E5B0clv2xurFlI3SiWCSM7MOjhIoUoGINhIIiEW8lXsUO59TQ
	 utoBiuD1GLAmTPn8kQtSijHrtY44+QY9I+eVGEm6kcSYRFGWABr00qrKEQrcQd/5On
	 x4Ihv1Wn47D4Q==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Elkin Cruz <elkin@google.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 llvm@lists.linux.dev, irogers@google.com
In-Reply-To: <20261120192237.2870582-1-elkin@google.com>
References: <20261120192237.2870582-1-elkin@google.com>
Subject: Re: [PATCH 0/2] ASoC: mediatek: clear afe->regmap on
 devm_regmap_init_mmio() error
Message-Id: <179572175011.838304.10101662458233835065.b4-ty@b4>
Date: Thu, 26 Nov 2026 19:35:50 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1579; i=broonie@kernel.org;
 h=from:subject:message-id; bh=3p1Ore9hafy1yDB9rebMEMzGAj4tc6cIfEocpWtEBT4=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI5FjsybN5705/rolj9xORgjeXptw9ufuP1qkqbsTAk/
 8VZrqe9HaUsDGJcDLJiiixxWdwv60ter+E7uLANZg4rE9gQLk4BmIjlVUaGxx++dvV2X39dtkm7
 Tnst18HwVXHca796TZoocVB527bWWEaGF6xpOw+1WFXt12dbe55x5fwZSw1nPbt/f9OC24vOLTJ
 8wwMA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 20 Nov 2026 19:22:35 +0000, Elkin Cruz wrote:
> ASoC: mediatek: clear afe->regmap on devm_regmap_init_mmio() error
> 
> I am trying out a new Clang static analysis linter for ERR_PTR/NULL
> handling, and it flagged this code as possibly buggy. The findings were triaged
> and fixed with an AI coding assistant, then checked against linux-next (not
> runtime-tested on hardware).
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/2] ASoC: mediatek: mt8196: clear afe->regmap on devm_regmap_init_mmio() error
      https://git.kernel.org/broonie/sound/c/4d5ed6cd0a14
[2/2] ASoC: mediatek: mt8189: clear afe->regmap on devm_regmap_init_mmio() error
      https://git.kernel.org/broonie/sound/c/18246650ab69

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


