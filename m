Return-Path: <SRS0=l5E7=P7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D6E2C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Nov 2021 21:27:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EAC386112E
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Nov 2021 21:27:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EAC386112E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kQ/7KT9nXe3n6q3c1yzaZJqgbsk7IgG79tzjMKzK6aQ=; b=gKLidVFHNk6YvH
	GPUu1D69Bxk7NRaNG2litAga4p74rZ5kFSzveLKFWhCFEQqNPaoTzBKqBOMNcyN0H0YjT8bpQQIiv
	W5N7GSH3EfKqLQsXVPdFiMi2chUXo02sPctPvCciHbaVYq6PqOx8P1KyUjgFSTXdGjpeBFwOq2nT1
	lzc3rzUIm165pI/Of4Q1inJbt13QZrxv+ySShE/5ByQ1RMJsHC2zUPFh2404o6HA7pmhApkL2qTPo
	SUsn1m6RcpeFM2xvrnIQsyfeeHlrSLAb2lXkpjUDOtUmJ6ogkypX8vBX9XWkcKOt3GWX7c3Yi7myv
	cfIYJfwfKQVI1vFUhSOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mle5D-00BbHy-Nr; Fri, 12 Nov 2021 21:27:39 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mle50-00BbGH-Ne; Fri, 12 Nov 2021 21:27:28 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 25BF0610FF;
 Fri, 12 Nov 2021 21:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636752446;
 bh=eoAl5B/8h3ZtzbA9rB3nBcwncqWuJUxuT/UFumATqZQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=PyDHCooH3k3+HIQuMCsauOX0epOaMV29t1rOZWKdBiawNsX7KVbHe0BZDf+VJwlvD
 3nCRB1RWAkUvTKWfOjJQ7k+Gic5ysfd64D7RTx1Iotg8FUvzvEKiKXxZiaI9OODWFk
 rJQXpWhFujB8vhG+H46Vpwcioq5p1II9amfUdXHq+yqiicVTulezO69s8llcFmmQIo
 tqQjP8G40R9SwbuQPcLVEMNoYRCAYEkPKmrJyk3O4TkHR0xk3SIA4EtHKJ84k/zW8G
 XZ8phQJ+dNfrJ6b37g79SH3cxZg+lTAQ7jS+sCr41cmfZ+YXLMSMJqdkHbCRKJOPKh
 mgpxORkd/4lUw==
From: Mark Brown <broonie@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 lgirdwood@gmail.com
Cc: linux-mediatek@lists.infradead.org, tiwai@suse.com,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
 dafna.hirschfeld@collabora.com, perex@perex.cz, matthias.bgg@gmail.com,
 kuninori.morimoto.gx@renesas.com, kernel@collabora.com
In-Reply-To: <20211111161108.502344-1-angelogioacchino.delregno@collabora.com>
References: <20211111161108.502344-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8173: Fix debugfs registration for
 components
Message-Id: <163675244389.742274.1874559646597511024.b4-ty@kernel.org>
Date: Fri, 12 Nov 2021 21:27:23 +0000
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211112_132726_807155_4639566A 
X-CRM114-Status: GOOD (  10.45  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 11 Nov 2021 17:11:08 +0100, AngeloGioacchino Del Regno wrote:
> When registering the mt8173-afe-pcm driver, we are also adding two
> components: one is for the PCM DAIs and one is for the HDMI DAIs, but
> when debugfs is enabled, we're getting the following issue:
> 
> [   17.279176] debugfs: Directory '11220000.audio-controller' with parent 'mtk-rt5650' already present!
> [   17.288345] debugfs: Directory '11220000.audio-controller' with parent 'mtk-rt5650' already present!
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-linus

Thanks!

[1/1] ASoC: mediatek: mt8173: Fix debugfs registration for components
      commit: 8c32984bc7da29828260ac514d5d4967f7e8f62d

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

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
