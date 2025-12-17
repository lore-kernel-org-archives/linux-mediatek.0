Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28928D66BBB
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Dec 2025 21:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HTgcJ3JDE6oyAjd5gstmemy0H+CfydiephQhFoKwlok=; b=Y5S1VvDJYrv4LxIMZ1pO9kXodX
	dczugDOdr3kP3jTezP/M5j3s28BEAn/3sTxCnXe1FGYIHSw0f/xTQ/TdnaESnjFe4+ooKvgFolHMF
	rwbXOz0yQk7e6wk9UaqP8xcCL0a4Go7/pJzkZXn/XHE8IY69WytjVWOGENwpgJ46T9HWNnddeW+mH
	L2qQCnbNHF1BgmEizOjw+RwEtX4dQv07W7rWFooc1+lq2ScI/jGSj91F8h8M4GRjdQiCQoqKB1mf/
	mK0v03qoiXb7bJuaavWptUl/rwXTQHRaFyGU8H7xbie2mXb0ac9xoEgfmQgbD/AHWppkHGLrgjl7i
	fSAW+HQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVzSa-00000007S4t-25vm;
	Wed, 17 Dec 2025 21:53:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVzSU-00000007S0D-190r;
	Wed, 17 Dec 2025 21:53:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 32B0460010;
	Wed, 17 Dec 2025 21:53:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDF2AC4CEF5;
	Wed, 17 Dec 2025 21:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766008399;
	bh=UCzOVnhibMnWPlBXhx4p/WVY6oTEg2ZCCaY1+lBNRUk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=TKrp47vecXXm8Alqv23BqANjFRdpQgr3QrOIFu4017A2BUICYKXy9kTfstQ1vdP93
	 y06uwfcgY7KFw5zWRCIGbRRrTitYeDHB7Cpz1Nm04yKueg+7L26hPvdHhGrJHm8wsd
	 M5OPj3G+OZOHn90h7tB12YarfXdcR/m5zvamBo3uwlKQIm3X6cZWB5U65SKHv7sX5h
	 8vnN1FqydXS0xd4d6j2J1yxytkODNkIQ/HKhrb6MT3Dm7p4cwQS7yCxuXmebzK5nPb
	 sQlG5WrcIOY0KZ669slYeKL8IiEwF4pzs6rT3mmxdVVPjtix/Gs8aueJFY1Jv1SZsO
	 PtToKTQtEhrdw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F363A3809A34;
	Wed, 17 Dec 2025 21:50:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] Bluetooth: btmtksdio: Use pm_ptr instead of #ifdef
 CONFIG_PM
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <176600820978.2253459.8850743046203821977.git-patchwork-notify@kernel.org>
Date: Wed, 17 Dec 2025 21:50:09 +0000
References: <20251217112033.3309281-3-u.kleine-koenig@baylibre.com>
In-Reply-To: <20251217112033.3309281-3-u.kleine-koenig@baylibre.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=3Cu=2Ekleine-koenig=40baylibre=2Ecom=3E?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: marcel@holtmann.org, luiz.dentz@gmail.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux-bluetooth@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
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

Hello:

This patch was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Wed, 17 Dec 2025 12:20:33 +0100 you wrote:
> This increases build coverage and allows to drop an #ifdef.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
> ---
> Hello,
> 
> I found the patch opportunity while looking in this driver for a different
> reason.
> 
> [...]

Here is the summary with links:
  - Bluetooth: btmtksdio: Use pm_ptr instead of #ifdef CONFIG_PM
    https://git.kernel.org/bluetooth/bluetooth-next/c/fd52b1d0ad7d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



