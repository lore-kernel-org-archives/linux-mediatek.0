Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BAFFC7EE23
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 May 2023 17:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lv5QNHuju3URLbLLjdxLxfQClLwp/hPTcikAQxhhgTA=; b=X4NxACMaMjVZCfQUP8zqhcpfAQ
	9e6C3LM6HCXF5MkECjGylTw40Y5ygrlAqwBmcr/5N9e6ljU0iG/BY1Km3NmWKM+TKPD8Z0rbYa8Ig
	dxz2hHiBz/Y99N2FO4fjM/2tsiuc3mTG5NnnJdVZ+0nwsAJ0giy+NiliWfRmoD66PnyiAdFp7XDwk
	vGPjiI6Clt16NHrDi7dVWIYtDBXBixpUU70CkDWZNOlCSk/vPG8ptA91K2s8nsGZoFuAygUquzMgT
	bJeq0XC0MIaRXAtXHJTXN1xGW9YR4+yu7AyGotNd3fB97pjY4OL9FEtgADHE9zNdRQyZljWVaJ2xZ
	2KoEM+Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzhIj-00DcaI-2V;
	Thu, 18 May 2023 17:20:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzhId-00DcZ7-3D;
	Thu, 18 May 2023 17:20:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C8CC665119;
	Thu, 18 May 2023 17:20:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC832C433EF;
	Thu, 18 May 2023 17:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684430420;
	bh=piOq5yMlSJS5vyyMJbxfeW2jBDmCAz3nZ9BEF7MQFns=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=l2dQIRYABelwZpNXnjfqP2r6MmhIcv4jS3+TCeML5UpseyRQk91f1zUpvu4CHzOtp
	 Du1cAZP4IG6qlTLUOkWgbEhCLi88RKyAl2pzn68l3oXV27ChA16srcBEWS37JQK6OJ
	 9fDrz0KL6kb89bhq5SDIMAS9+yyFNmGaFA+8SWJbjNvwuVbw6eRsuD1ZrQtBlyu6VF
	 Nay2Qwk285GUkFGngih/Y4UfP/MVn4JsYzpDiiAYlZa61AviwjnrgCyQ6eQBCu48dK
	 igDrXLLP77ewA/vSuPz6/9mRD+7K3TdflZ5jplI8spMX2j+foB+OAXyT+iopP69oOW
	 hA37MOEQWqptw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: perex@perex.cz, tiwai@suse.com, matthias.bgg@gmail.com, 
 nfraprado@collabora.com, wenst@chromium.org, alsa-devel@alsa-project.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, kernel@collabora.com
In-Reply-To: <20230517151516.343037-1-angelogioacchino.delregno@collabora.com>
References: <20230517151516.343037-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8192-mt6359: Remove " Jack" from
 Headphone pin name
Message-Id: <168443041576.472592.13647493326207546899.b4-ty@kernel.org>
Date: Fri, 19 May 2023 02:20:15 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_102024_098140_46C9AE0C 
X-CRM114-Status: GOOD (  13.33  )
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

On Wed, 17 May 2023 17:15:16 +0200, AngeloGioacchino Del Regno wrote:
> Function jack_kctl_name_gen() will remove the redundant " Jack" from
> the name, if present, and then it will add it back, so that all of
> the controls are named "(pin-name) Jack".
> 
> Remove " Jack" from the Headphone pin name to spare some CPU cycles.
> 
> This commit brings no functional changes.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8192-mt6359: Remove " Jack" from Headphone pin name
      commit: cbbc0ec6dea09c815f1d1ef0abaf3f2ec89ff11f

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


