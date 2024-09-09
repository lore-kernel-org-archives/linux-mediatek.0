Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4EF9ECE577
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Sep 2024 17:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cnoB+2O0v2dUqRa/4oFPuPEfvXEnYfKrsqe2ib63Ozw=; b=OVlAnZHR4fvEdtMuZrMXG59Huy
	vwv1bqWCaQxwgeD62A2wWtDlSr1T3OvxtiUvZL4HvGrwo/R5thvFF7pQ6c99JNXy7It6AEfmX4/Ip
	no6Ax9ul6Lj8S1IFklpbHS2DGOJL8c61qaPXx6sHGB19rhqCU6k5fHDxBLfkvcysoVJwOeUsO1iWB
	+6DiJkX1mTrCH4yAPpr5pLFhsrfYZTThliFpOXmI+yDZJNCQ8tnbcHXUT6AQ4EOnQILnxvCuOygv4
	i6Toim1s5XC4Bbd1ZrgpPDXunhuqx6388gZ9kiQIv4kK1HWuwQtrEYRlaPkdV3Hg+W8CwnIRNvIh/
	L6HAtrqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sni3U-00000002nd4-2POj;
	Mon, 09 Sep 2024 17:20:00 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sni2P-00000002nHK-1rbt;
	Mon, 09 Sep 2024 17:18:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BBF3CA41B29;
	Mon,  9 Sep 2024 17:18:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFE17C4CEC8;
	Mon,  9 Sep 2024 17:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725902331;
	bh=0my6CiCfO1YSLi/x8EJebBhnlxug1KH7Le/Dp6Hn1rI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jAh2/l396k5GbqfjNSaQBy3Jg/M415D6WaNic28NqN6ztZY8NtKkWpPtdeuUSedUt
	 dqkxeuQytTySmAQGoW2SS4Uy3WoBhaavUZP4QaZtEjGeGMLPkR8BClNcFuhH2wJ4vH
	 bdfTI4rv626NwLhGgae9ILHX85IGVthJ0E6EY1ICS/lQ0Eyg9wNFyVGfiTFsRdwFQ9
	 99VzDnoAaa4/FzpNhPL7jz+hk6p2PoCfu8sPBYtpcrjFoNTudw4/tcVkW/91zmwiDL
	 uK57Q/UWQ6MoAS/z8OMre954Of2e2QSOJoFb1pY5z67geJu2IWWc5nvzRVUJ6cb1kH
	 UvLW8+V0HRcJA==
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20240907200053.3027553-1-arnd@kernel.org>
References: <20240907200053.3027553-1-arnd@kernel.org>
Subject: Re: [PATCH] ASoC: mediatek: mt8365: remove unused
 mt8365_i2s_hd_str
Message-Id: <172590232608.1707146.10719220040805343879.b4-ty@kernel.org>
Date: Mon, 09 Sep 2024 18:18:46 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_101853_581558_4E681901 
X-CRM114-Status: GOOD (  12.71  )
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

On Sat, 07 Sep 2024 20:00:38 +0000, Arnd Bergmann wrote:
> The mt8365_i2s_enum and mt8365_i2s_hd_str variables are not
> used anywhere, but cause a warning when building with C=1
> or when enabling -Wunused-const-variable:
> 
> sound/soc/mediatek/mt8365/mt8365-dai-i2s.c:781:27: error: 'mt8365_i2s_hd_str' defined but not used [-Werror=unused-const-variable=]
>   781 | static const char * const mt8365_i2s_hd_str[] = {
>       |                           ^~~~~~~~~~~~~~~~~
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8365: remove unused mt8365_i2s_hd_str
      commit: 876dec03fdfb7eeb592d01a95ba292c9e53b324b

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


