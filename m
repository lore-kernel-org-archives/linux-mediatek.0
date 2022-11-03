Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97304C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Nov 2022 16:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8cRJ60cg22guiNplzQ4hK5+cCB7aMwleA62ZqIvtAY0=; b=MHx5baa9cfDXACw5F44MIWOWwR
	gSHsCg9kLJhM83vMveUJZuF9CLJEI+9k2hqAmr27eny0/cUWZ3kUklG+4/5jJpNjyvyNi9A1jvpDx
	Ey7MvmyDJHVleE6pRnP6gMg3nzRpyo1PJEglTUxQphKbHLIrPOfGdZ5PY36miqFiCh7iVaJonSjTS
	KLJEbrNCggYnqNXaeRubHUw2i+TyInbXPaCFrj65NuhmkcKHqRYzLa0zGLQtwntOB519Rgfq8qTib
	LucGTqF56xkGV4tV+qDl+ZuKE0nW2P/LqV2B9mn4u8Qpgi4UMUVbaMNK3oId+SZOdvCigkgGW8qPW
	5Ej48rog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqdXE-000sSj-LY; Thu, 03 Nov 2022 16:57:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqdBD-000jgH-PO; Thu, 03 Nov 2022 16:35:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3D9A161F76;
	Thu,  3 Nov 2022 16:34:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EEE6C433C1;
	Thu,  3 Nov 2022 16:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667493298;
	bh=1bZ5ecY99o5UCyVe5TJENub+Nw0ProKQsUg0Kzu1JqE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=pugZWxZ9sd4FvO2QFlxG9DmTHqxW4pdt/8PogD0nqELib+B3eDWJ9EODZMUR2gkPL
	 KrlGbkb1P8WSQtMx/VTEAVT/OsN3wZHdq9oS4wTpmEESU3jvi0LNNtErqmoBdpR1az
	 ULQ8shjm6AlB3aiF7at8TcfzDNQsYoz1ka3Fy85bV/g8cIaNCWf0+M55mK9amjXCkN
	 N8G6/lQF7oaGbn7YigJBZpNssJdE6pvy9smhewO20ZosFHWSkfuoK5aeHGmT9e5KKG
	 TpH+euxB27/8szBsd7idR6kly0fbnP1Rbjp1fNmNLXzG4rRXd2eThTGmWdUztwoKBo
	 3H9nCFVoUSrsg==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Cc: Jaroslav Kysela <perex@perex.cz>, devicetree@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 "chunxu . li" <chunxu.li@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 Nícolas F . R . A . Prado <nfraprado@collabora.com>, Takashi Iwai <tiwai@suse.com>, linux-mediatek@lists.infradead.org,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20221102125936.2176748-1-ajye_huang@compal.corp-partner.google.com>
References: <20221102125936.2176748-1-ajye_huang@compal.corp-partner.google.com>
Subject: Re: [PATCH v6 0/2] Modify documentation and machine driver for mt8186_rt1019_rt5682s sound card
Message-Id: <166749329508.480833.14513589396076855857.b4-ty@kernel.org>
Date: Thu, 03 Nov 2022 16:34:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221103_093459_902397_D0B32C44 
X-CRM114-Status: GOOD (  15.12  )
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

On Wed, 2 Nov 2022 20:59:34 +0800, Ajye Huang wrote:
> v6:
> - dmic codec driver:
>   - Modify "FrontMic" to "Front Mic" and "RearMic" to "Rear Mic"
>     to consisit with commit 3cfbf07c6d27 mentioned in description.
> 
> v5:
> - Documentation:
>   - Add #include <dt-bindings/gpio/gpio.h> in order to use
>     GPIO_ACTIVE_HIGH.
>   - Remove the change-id in message.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: mediatek: dt-bindings: modify machine bindings for two MICs case
      commit: f8639c385f7e8325b73c83a6ec0865f8c036e1ad
[2/2] ASoC: mediatek: mt8186-rt5682: Modify machine driver for two DMICs case
      commit: e14657c0f0022e02c8f25fa9c56afae3d3db9e77

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

