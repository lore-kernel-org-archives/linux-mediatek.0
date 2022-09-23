Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98081C04A95
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Sep 2022 17:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=00n+uk3oZubbfUX/1ubVA4+TAf0XcTDJQ71HUY+0l68=; b=LfsQTDzdTcxMtjqGDV2vJqvcD6
	yX3Yrn3SwHsLpac6nSOGmhlKIZoAzjjr/QSSWCfKYshZ/BfNXUkt86qJHkWBIUmW/+OY8sDxpcsSb
	ueHU6SqnTJZjdGu2mqlY0Xyu3OSp/yrh++QQUdJHNUEmwoF1tndwNVmJeN7P/XNEj9Of775m5AI2s
	juxPp2uUDsaxih0MMWVVskZo7gnQgRv/MyiT1iGv1bIP7TGWQm3wBcFGObWWD8YJZ8DBKVHOoMfN6
	o31WvALOQP3tpakhlJXqBSOU1h+/57vERAVHVX58FueeEAJfR9wMPfHx+ZGk4mm69WLlorLcwxPvY
	/ubhHAFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obm8x-0053IU-Fl; Fri, 23 Sep 2022 17:07:15 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obm8k-0053EU-Oz; Fri, 23 Sep 2022 17:07:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D6555B8202F;
	Fri, 23 Sep 2022 17:06:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88F15C433D7;
	Fri, 23 Sep 2022 17:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663952816;
	bh=MXUJSh7a67zClSJcrIQ8uTLgyyJ6AiyBVSt6Oo0niKQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=L5ozGfX7+BnlhPf8kYmEvlTmsswimIsTUvxP0A7EOs5QLeAU7DTgyL556orPLCbSQ
	 jWDSDsvBhmTH3Obu+8JS2+MwezNx17WrUScLZMuKMD+XWhecmwFmPDggjej9KMZvnX
	 UWuHqm8QLARl6T/wfwagA01xQoUikW/w0GHMeRwpkbliaQn1Ch7Y/7FHDyWH/0Re1u
	 BAAWQSdgKTny+VsvfMFMgNG+euMZ7dTZICI/UTRKqCw9E3up1m/hdqNDZX3Zz6SE72
	 +2nPq0IsjkKHj1oSnBS4Bs7GbhOi45JXeystji3jfeCscFIE4hsbCNFzKSCiy/++ve
	 RcTxQ5kODrJCw==
From: Mark Brown <broonie@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: tzungbi@google.com, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 perex@perex.cz, tiwai@suse.com, trevor.wu@mediatek.com, linux-arm-kernel@lists.infradead.org, lgirdwood@gmail.com,
 matthias.bgg@gmail.com
In-Reply-To: <20220922103502.49981-1-angelogioacchino.delregno@collabora.com>
References: <20220922103502.49981-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8195-mt6359: Use snd_soc_pm_ops instead of custom ops
Message-Id: <166395281428.610218.2692413378326164473.b4-ty@kernel.org>
Date: Fri, 23 Sep 2022 18:06:54 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_100702_976450_AC5DA41E 
X-CRM114-Status: GOOD (  12.11  )
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

On Thu, 22 Sep 2022 12:35:02 +0200, AngeloGioacchino Del Regno wrote:
> It is possible to use the standard snd_soc_pm_ops for this card:
> remove the custom mt8195_mt6359_pm_ops.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8195-mt6359: Use snd_soc_pm_ops instead of custom ops
      commit: 14ed837b9740cc6ec25910980d67c22894b4ff56

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

