Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFC1FC25B76
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Jun 2024 21:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CKACt8Bou24AIgOecG3i1nmMxp/08sXpJ+XLFo6l+UE=; b=vRygkRHhoXgPE72uzbgEy/UbjT
	6382sisp4WC1kXoJwa8TrucNlzCycBlKYV/E6lElPp5AiSNP0YPduPNeiztu8iHHkX4QMHbC/DqRL
	WBaiqISJEHuy9v/OBYKl37kTWfAIJZNBHE6Fj2LA9kmn//MAuYw8vhPZE0bYa4YHYh4yuSahOJ41m
	sMlogUbtZKS7M2pFn5jPSbDqaCl/IUaZ3vVFICrh2e4HsHFhsorrWNXK7Y5aQ9WioqgOcjGLyVoyY
	zyNW5yRiArqnJfABzIkXZGyR+Jrat3R5w3SZsQtJP/460AIpTtXcQqrZeDSpUbLczxSpMJFhf4s0L
	opENRjRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sExpF-00000007Yha-1hJT;
	Wed, 05 Jun 2024 21:05:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sExpA-00000007YfD-0QRR;
	Wed, 05 Jun 2024 21:05:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2C22161A71;
	Wed,  5 Jun 2024 21:05:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEBFFC32782;
	Wed,  5 Jun 2024 21:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717621535;
	bh=HX2FOEXY8UflXmGqEAtTtfooLXB6TYloRO4ddELc9EI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=IotqZlJhbhOy1/VcjrFfU9iEv72PAg2bPladFlnP4BoBgvaeqES5SgqaWt9HzHWOt
	 YUhdH8CWnoLBKRmYu3e7DuPDqeV2dDE90kKVFFx1mOr+170mvT9FqXR8xEVCApXYZD
	 ZEalX9aDgV+/oqNlQbCO0YxeLbDF/hTQp/elWc5Wiyx35JgTuVjedn6Z2pq+V7h2oq
	 KqiKecpswSFCXCeJ5Kc6Mmrp6vNoBzlR2IE3VPQGAM8EQjML3Fe4OffEaRzemgqD+L
	 ttguZbJ0oGhJWZuwiGEDCdbWjzfMQwVM8FPoEFIYddoMH1WQK6YVyNVuwGJqKyknw7
	 5NMtjUWVCWxrQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alper Nebi Yasak <alpernebiyasak@gmail.com>, 
 Hsin-Te Yuan <yuanhsinte@chromium.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20240531-da7219-v1-1-ac3343f3ae6a@chromium.org>
References: <20240531-da7219-v1-1-ac3343f3ae6a@chromium.org>
Subject: Re: [PATCH RFT] ASoC: mediatek: mt8183-da7219-max98357: Fix
 kcontrol name collision
Message-Id: <171762153256.557520.12011428649748199502.b4-ty@kernel.org>
Date: Wed, 05 Jun 2024 22:05:32 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_140536_383934_F951C0C5 
X-CRM114-Status: GOOD (  12.06  )
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

On Fri, 31 May 2024 08:37:54 +0000, Hsin-Te Yuan wrote:
> Since "Headphone Switch" kcontrol name has already been used by da7219,
> rename the control name from "Headphone" to "Headphones" to prevent the
> colision. Also, this change makes kcontrol name align with the one in
> mt8186-mt6366-da7219-max98357.c.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8183-da7219-max98357: Fix kcontrol name collision
      commit: 97d8613679eb53bd0c07d0fbd3d8471e46ba46c1

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


