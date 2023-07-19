Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0041FC001DE
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 13:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/tTGexhA5lNmtVlmLguqK/TKdm89A/yt8clx0r4pt9M=; b=CkSdiwbbBPhNEDQkRPjm4dwyMR
	9Gg6uXGeHMmYP0WN4kiDcMK6EWjJedum9K9XeZK5VaxkGPBxEh9CXI36m/Wy7G0wpr7TPCzsK3nYI
	Y4S8v9dNMw7e+eM390Ts4WFJaB2VEJPcc7pUcUH87wzPnl58NTmyZcLkF49Hsp2HO5YxWW+Mznoj+
	hgN/9aFGfOGr+p1pnpu+0tL2eTfVQ7PB3LfugGYDD9yyLG/F8k8R+er8O04EaHJvUQMSeChIC6alS
	byVCzR+cSY6Kd5xHQ6SP+/1x1/Zwq3Ppks05IKuSq+J/TlkDqdnW0vIkxq8DwrSutgri3H7PcMkaX
	2DUELy2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM6nQ-007Udh-1W;
	Wed, 19 Jul 2023 13:00:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM6nM-007UcY-2j;
	Wed, 19 Jul 2023 13:00:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8F5596131A;
	Wed, 19 Jul 2023 13:00:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CCAFC433C8;
	Wed, 19 Jul 2023 13:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689771642;
	bh=vTRTi8gePGQh/v/SApP6VdgisFuhvR4V4ouD65IvxwQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Y0H1OEXL/5HzI2GvKdCbZZ5lX64S2dYzS441FtomQqJZrAdhgYgPTOG3Y9Hcfr9AJ
	 SU5+SMqBOXZ6o36ULFel0jrL4YTcPhx73RVmfx0akqMFf/fmQRhtnmGjbYbiLiojCa
	 PhvpZTbkq4DFce3erI+clBoPAyZeCQHld7UGFC1neK0n5YZP3X+xpFvL+sb6dOLFiD
	 Gu5Dvq6d/v+fvm4IKbYBdRMjYK502U+ONKAB3qKI+OqAiZJzz5SKnaSWpV1aSRViQ6
	 PmJAcRx71fbxaO55kKmMs9JB6f3/CITiM2QyxkFABDi2WTRUnHetFqqfguUnei/Q0O
	 Lm09LgMRk8E4A==
From: Mark Brown <broonie@kernel.org>
To: Yang Li <yang.lee@linux.alibaba.com>
Cc: lgirdwood@gmail.com, matthias.bgg@gmail.com, 
 angelogioacchino.delregno@collabora.com, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Abaci Robot <abaci@linux.alibaba.com>
In-Reply-To: <20230718003255.124594-1-yang.lee@linux.alibaba.com>
References: <20230718003255.124594-1-yang.lee@linux.alibaba.com>
Subject: Re: [PATCH -next] regulator: Remove duplicated include in
 mt6359-regulator.c
Message-Id: <168977164102.32923.17335159942963668524.b4-ty@kernel.org>
Date: Wed, 19 Jul 2023 14:00:41 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_060044_944699_BA813B08 
X-CRM114-Status: GOOD (  11.39  )
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

On Tue, 18 Jul 2023 08:32:55 +0800, Yang Li wrote:
> ./drivers/regulator/mt6359-regulator.c: linux/platform_device.h is included more than once.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: Remove duplicated include in mt6359-regulator.c
      commit: 6023fffc3e276d1ab0d1262ea9be3b720325fede

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


