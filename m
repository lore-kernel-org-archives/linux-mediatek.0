Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC104C4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Apr 2024 09:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ft7G21HT2tgyn+UvUy591l4hG5CUmk/sRU+kMIjlRY0=; b=aniwv05gKzQGYbOgKTi97SGJbG
	Yqlopcmcy9ixvOIsAvj9XGoclifLs0HQSFjovY8c2tKoRQJ7zQPYmqJZpq7013bDLZsro19fOlrnq
	dO/7kteKF2nd8e+q7e6oXso5GJOF/PPvT4lNYurSZTyBe94JjbnuyDscROWjx4M1iohUMxQSw9QHy
	xHctBPL8baaa4pp5VnYjAxWnyGhvwi96oNewYdeyTjnFy2+xD93w5GRh7Ld8iybvsWMBgvhmc/Wfm
	09Y6Z6q6KyQdTj7hMycvwnyd5bsebBMaP/SNTv1qyDgaSX1uuZ86r205acKhgVXBI73uzUF8RDxwO
	KoRrWYag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzCCA-0000000Gcnu-1BTK;
	Tue, 23 Apr 2024 09:12:10 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzCC7-0000000GcmO-1dfw
	for linux-mediatek@lists.infradead.org;
	Tue, 23 Apr 2024 09:12:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 39397CE0EBC;
	Tue, 23 Apr 2024 09:12:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38067C116B1;
	Tue, 23 Apr 2024 09:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713863522;
	bh=P1+SzEkEbUxqtmErfXAFNFg5Ku/NbRzwah/IbK5buKo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=OG3we8e63RR7aBIv4n3fJsal430Fth8ths23XaenqeJbGWSq2YgbxSpP4Qik2ypcz
	 0Q7BlU1KlIKV6QK1Pvr8dIuo7kNyPFBA4xq5E/qjRcvyLaoWwQyh82l7QWTSIcioUs
	 M5dAk6rbW1dWFx6LTBEag3wvlmzx8i+uCwjKAVMj47HWYGFsBm2PqBkgRjG40tnRru
	 4aeAm5wBMls8vR1MasCo5fQlPArDTcqQP6Wh9hxoNbY9PT4u4X4vzr+0AT553Mmu6c
	 1PiJaHrKw1xsbNpV84wYeroaE4Vi9DzJe7KQh+qY2y1Wj0Ycj632uo3VX7v9+V8Zud
	 ulsYPhpYaFMnQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
 conor+dt@kernel.org, matthias.bgg@gmail.com, 
 angelogioacchino.delregno@collabora.com, 
 Kartik Agarwala <agarwala.kartik@gmail.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20240421033129.13076-1-agarwala.kartik@gmail.com>
References: <20240421033129.13076-1-agarwala.kartik@gmail.com>
Subject: Re: [PATCH v2] ASoC: dt-bindings: mt2701-wm8960: Convert to
 dtschema
Message-Id: <171386351991.1781735.5122768330810491305.b4-ty@kernel.org>
Date: Tue, 23 Apr 2024 18:11:59 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_021207_726922_E1D81065 
X-CRM114-Status: UNSURE (   8.49  )
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

On Sun, 21 Apr 2024 09:01:31 +0530, Kartik Agarwala wrote:
> Convert mt2701-wm890 bindings from text to dtschema. This is used by
> MediaTek mt7623a/n SoC.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: mt2701-wm8960: Convert to dtschema
      commit: ab371a026a1a4ad81817d82ba433c19934082894

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


