Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D429C47DD9
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Jan 2024 16:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TvJQ+VNoFOw5guEoSwEO7SxTPbiyZAALa01hRuPsGhI=; b=odH0/IH0CSYPEEGNf+F7a6sTpP
	pyF/OynR+tELQoHTejrKN2keZcRvOI3RqoUhvGRZ65WAM7tWi0BZDYzDecCJs9OXFudF8lw1dcso0
	YNAoAc5cIl9UcylzePEiBpDFgUGvgyXSg/v/eMK2lJs5G3vAg7YH726gm3JNzeGN66hDqUfOo0czB
	p7BabPt3QGT3dOIgWFTqqv+B7dsiCT8mlqwUTejREBzosGYBgxhEgqTZXv+CSJhrgwETCvl73QIo+
	uF60ICXkQwAgZynuO2aWuyJY+RSXroOE4mWjqCz2mrwVbnm46f+KPWSXHzLadcteAdDLASTeeGxVu
	d5lUib8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRxUR-00D3eK-0r;
	Mon, 22 Jan 2024 16:49:39 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRxUN-00D3dB-2g;
	Mon, 22 Jan 2024 16:49:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 3E24CB80ED9;
	Mon, 22 Jan 2024 16:49:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3A9CC433F1;
	Mon, 22 Jan 2024 16:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705942173;
	bh=ZWx120GF+mtkovrvKrkQnTHL7QRGC23VzcOTEmMjqxE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=HZXghkqIolE1qQF6hEOhY70ikFFsjVKVG/ShxPnUb31xdT2lb6O7bzG2/SvoTYr4G
	 BtLvWSmaj3+xLw21ELaWNVmxyJ5Wy0RFo6zE6hdjkHMtHCdTq9nk0czByRAXDRd6/T
	 zxLMJ8w3eyQC4F1j+4Sl7FAeIHF9T7aWPqZYtcF6fzjlslj0kfV280IKtkS0iLHYim
	 CJ4tCYcJeZmk/q1ue8L/IzHt1B4ZPuGl8L5YpQxaLG/7e9DwidDvR7GEFMcEeIWcZ+
	 YneTh9dJWjQh8w8/Puv78NMu2yCq8drbFdhVe8SDWXKYY7rIZK2taTIkKeyw8sAfxE
	 xN9Kb8QI6d11Q==
From: Mark Brown <broonie@kernel.org>
To: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 Ruihai Zhou <zhouruihai@huaqin.corp-partner.google.com>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 wenst@chromium.org
In-Reply-To: <20240108120802.7601-1-zhouruihai@huaqin.corp-partner.google.com>
References: <20240108120802.7601-1-zhouruihai@huaqin.corp-partner.google.com>
Subject: Re: [PATCH] spi: spi-mt65xx: Support sleep pin control
Message-Id: <170594217171.69518.999967037682880271.b4-ty@kernel.org>
Date: Mon, 22 Jan 2024 16:49:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-5c066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_084936_002382_BED7BA7D 
X-CRM114-Status: UNSURE (   8.87  )
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

On Mon, 08 Jan 2024 20:08:02 +0800, Ruihai Zhou wrote:
> Supports configuring sleep pin control during system suspend to prevent
> potential power leakage and additional power consumption.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: spi-mt65xx: Support sleep pin control
      commit: 4247d7f2ca564bbede54054da1f35a359bb061bd

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


