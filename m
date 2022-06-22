Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1963CC43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jun 2022 17:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u4uGiqcUmksnv3vMPCZSQkWtsOE4MGcSXS1JwMvlxko=; b=zNYftWf/6eKlFGzrCASZDCC0XA
	GQHu85rLMXGzx1IzSzwAlZyrl8AtMF7fvsgHN6q2x/nTSxN+PtmYkZXZvjPBUePc3jwPyYFs5y8r6
	5ZCxd4Wh2RytbVAFlwNyvZovSshET7t3KpcrRS+DVhz96U3Xx2Rf5HVPsMegL2C7dPVR0H7f9I2PI
	XAXsW/XNVx2D9USwSkkBfi16BGzwtPFnXgXs4qYQp41xYTB8F7NcPwmR2g6h59Yryh4V6BVC2K4zY
	p6cguk8o4pCoLGiWr12AtxwHYpuy3JRhst3K2a6lh3OFr0d6xggvEYEUh97xRMHzRYM3DQmx8N+yC
	n3uwO9WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o44Bc-00Bhti-S9; Wed, 22 Jun 2022 17:30:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o44BG-00Bhnp-6G; Wed, 22 Jun 2022 17:30:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 885D261C3D;
	Wed, 22 Jun 2022 17:30:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11686C34114;
	Wed, 22 Jun 2022 17:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655919016;
	bh=B9aUHJD3yJ+AfE8Llrw6Si0We0sEP5bH4s0Gorml2mU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=PbhL7BDbL8ugnS61MPkvlHVei8H0YXV25HEjOO4yIEagzWBsXsOQ43PjjMKF0CX6J
	 ztJjPP2SmofIZ+HgK8jFO5IDlrxo4pYcGT/0CEKmmgiT55cI04oI5mocctHOa89ZlF
	 BOArjVrYOPZAwqwTyUt3vvSKqCxPZKlifuRsNd2EBMV06VeUDxtPNpAmtZeg0/11XO
	 sIWLN5Zf6egJM3q5ctgUFJ7SXIDZMepAXFX433At2osHWiVd632iOy5gMd+2foB0HV
	 ccFbiozoNwwY1oQSAHsHbAkp8VMo2bAXyJeX7tC3F5nhea+qZgBfizUkhP1H1dbK3o
	 PbAVgLkTVaCXQ==
From: Mark Brown <broonie@kernel.org>
To: kai.vehmanen@linux.intel.com, peter.ujfalusi@linux.intel.com, ranjani.sridharan@linux.intel.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, matthias.bgg@gmail.com, robh+dt@kernel.org, yc.hung@mediatek.com, cujomalainey@chromium.org, yung-chuan.liao@linux.intel.com, tinghan.shen@mediatek.com, daniel.baluta@nxp.com, allen-kh.cheng@mediatek.com, krzysztof.kozlowski+dt@linaro.org, pierre-louis.bossart@linux.intel.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org, Project_Global_Chrome_Upstream_Group@mediatek.com, sound-open-firmware@alsa-project.org
In-Reply-To: <20220622062245.21021-1-tinghan.shen@mediatek.com>
References: <20220622062245.21021-1-tinghan.shen@mediatek.com>
Subject: Re: [PATCH v4 0/4] Add MT8186 ADSP dt-binding
Message-Id: <165591901017.1405752.13178281441778356298.b4-ty@kernel.org>
Date: Wed, 22 Jun 2022 18:30:10 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220622_103018_308220_0F0B49F9 
X-CRM114-Status: GOOD (  13.53  )
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

On Wed, 22 Jun 2022 14:22:41 +0800, Tinghan Shen wrote:
> v3 -> v4:
> 1. Update commit message of patch 1/4
> 2. Add review tag to path 3/4
> 
> v2 -> v3:
> 1. Change mbox-names to rx/tx for both mt8186 and mt8195.
> 2. Update description of mbox-names
> 3. Use static string array instead of kasprintf
> 4. Align clock names in dsp driver with dt-bindings
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] dt-bindings: dsp: mediatek: Use meaningful names for mbox
      commit: 009b21f392759ca7be91bc4be9d9534f6cee2878
[2/4] firmware: mediatek: Use meaningful names for mbox
      commit: 74bbdd632637628fef8f651bddc5d17aeb7eb46a
[3/4] dt-bindings: dsp: mediatek: Add mt8186 dsp document
      commit: 99370c4ea3d0cee8445f6a1104f25667e3fd47ba
[4/4] ASoC: SOF: mediatek: Align mt8186 clock names with dt-bindings
      commit: acaeb8c62fd1b2b57be1523b8d5b1d64a1a9dc38

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

