Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45CADC04AA7
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Sep 2023 15:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=27VaMGM9f3wx0w3Q31SehiqSVkRYdre7rbwRW+HKwmI=; b=Qe/aLMhXI6FVbC7SQntxAzZ1mU
	hN9Kua1t5qlZS4AuvYrvkFPIuhhxrdYhBkt4sdC9/fQ3ZPXJlCoRNWzv3QyqtC3Xuh1+9qKtHbvgL
	esCH+OXz7J32aBvDMgbxpc12l0/26uQh9C7Ac6u+oB26uWZii9Yfnjxp3NiiTQUJpxRqeoH6zMqYt
	8HetvctjZv8UZY+MLCfe+9wyb9Rhe26kfW8CJXCsYs4QzNxAJvVUaNvs83euaUSxhktargMJlgnD4
	/VijdIxfvJmkzZc7KyfQxKO22XJgvreu/Q+unuNORlSr97RVz1exstc+E/wbB9UlOn3mE3BhDg18K
	3NNokRQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qizZs-003ZLc-1L;
	Wed, 20 Sep 2023 15:57:24 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qizZo-003ZKF-2x;
	Wed, 20 Sep 2023 15:57:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 834B8B81DD5;
	Wed, 20 Sep 2023 15:57:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6055C433C7;
	Wed, 20 Sep 2023 15:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695225438;
	bh=pB4XNqlP7pg+a9UE5lhowbM1SsYWcw8dZscEk4AuXlk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=qc+be3qOzO6VB+dZL4dfLkCb7wkLMLG0vl/oxiGCveaxOQcDgBbgyLORlBQK/eVIB
	 OtuJqCoB8Pqqw6O1zcY3SSKqIi9VR9n9Uhxamjgtno7SefbM0C/HilakhQ64Ht9ZhP
	 jiUjMiyPMEZd4bF5iyo4YQee2BbRU4/cOPXs02EhVUcXlBj2Dfhyo4ecRKucKa5qrS
	 RmIYhZ+AnESLwFZEq04c48G1xCxKY32MLXaEI+l8/jEbfuD39mzTW909Tf4QPAKcib
	 Bf9KAjGbAGu6a9icOi8RHRhjiGBmeABgOLO8YtTLLOhTZ1KGLHG5PCyHtHFKSRu6Vs
	 KFo2jEHqdnCkQ==
From: Mark Brown <broonie@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: Zhiyong Tao <zhiyong.tao@mediatek.com>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20230920085336.136238-1-wenst@chromium.org>
References: <20230920085336.136238-1-wenst@chromium.org>
Subject: Re: [PATCH v2] regulator: mt6358: split ops for buck and linear
 range LDO regulators
Message-Id: <169522543613.83620.1878609936860596842.b4-ty@kernel.org>
Date: Wed, 20 Sep 2023 16:57:16 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_085721_128563_BD11C09B 
X-CRM114-Status: GOOD (  14.40  )
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

On Wed, 20 Sep 2023 16:53:34 +0800, Chen-Yu Tsai wrote:
> The buck and linear range LDO (VSRAM_*) regulators share one set of ops.
> This set includes support for get/set mode. However this only makes
> sense for buck regulators, not LDOs. The callbacks were not checking
> whether the register offset and/or mask for mode setting was valid or
> not. This ends up making the kernel report "normal" mode operation for
> the LDOs.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: mt6358: split ops for buck and linear range LDO regulators
      commit: 7e37c851374eca2d1f6128de03195c9f7b4baaf2

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


