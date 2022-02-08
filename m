Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FD1FC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Feb 2022 15:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LXavZMQfEfD4isOpwH/3Jn0RDSIUQ96aPSAfD9i1HYA=; b=wFDz/KD09/jifC
	ZJ59eiTUL1cEMtFL2UaEC6KdyzRftQH1mIDHefxVBnJswczqGr/RRqSBqYR/V1n+GU71TJDEyLNaN
	M2y5qbJMO7BdGCHfLX41Uq03JspiswL22Lw/ydVDkMjZ1jBmRXrQ16v//9TGvNulSGreDY6lUR7lM
	Y2QiUP2d4OH8yKMHGdg/po8K+8o9UZnRmdBHfgJbnx8VX8VT4dZHobhVKwM+hBQXPNGmeZwI1J9Jm
	g3Eoxpwflqil4wlqwhe2jAAkDntaxZpvzwgnLYTFYevmlUS0dTs4v4oY5hlOByTIxtc7SM3vk+D8f
	gMpAg4jiz2vO21gxMs4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHS6V-00EOmk-C8; Tue, 08 Feb 2022 15:08:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHS5y-00EObv-QH; Tue, 08 Feb 2022 15:07:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 32784614D5;
 Tue,  8 Feb 2022 15:07:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFE89C004E1;
 Tue,  8 Feb 2022 15:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644332873;
 bh=Uibn/nvs0txEM63mxxzdwPuACyNUqPDkvUBxEIrRbIc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=NC7Qh1J10M9MCJz3CTRwMU4YPt9o5AZCdi7awXjbgZisY17tNXlQbZZy7/9F/jXWY
 rY+mtmCnaK4VxyEH4nOHEgtYNgZpMePFcxmnyZI92sC2wp1lxsVtddHWdM29wBoq2H
 Sere8vMTpqMPkYJmKWRcdGRz6Gzyk2rzbul7RVmUVfhNje4ek5mzlK/XBgnlaAYETT
 07n5jLkCHjXOHWLG6E3P7GAQq02qISeIvz1NnKZPeXgKuENJT/oFpuJH29Srb0lVf2
 ndy+/s1qYakvW7ar58cl6bCPJX8aKdxFVXc1M3AaghUqQKvaG9unu3y406dZarbfnx
 uNoRO5UR6DwhQ==
From: Mark Brown <broonie@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>,
 Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220207160923.3911501-1-linux@roeck-us.net>
References: <20220207160923.3911501-1-linux@roeck-us.net>
Subject: Re: [PATCH v2] ASoC: Revert "ASoC: mediatek: Check for error clk
 pointer"
Message-Id: <164433287142.2964899.6109148874743045900.b4-ty@kernel.org>
Date: Tue, 08 Feb 2022 15:07:51 +0000
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_070754_948076_0C1035E0 
X-CRM114-Status: GOOD (  14.66  )
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
Cc: James Liao <jamesjj.liao@mediatek.com>, Kevin Hilman <khilman@baylibre.com>,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>, linux-kernel@vger.kernel.org,
 Daniel Golle <daniel@makrotopia.org>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 7 Feb 2022 08:09:23 -0800, Guenter Roeck wrote:
> This reverts commit 9de2b9286a6d ("ASoC: mediatek: Check for error clk
> pointer").
> 
> With this patch in the tree, Chromebooks running the affected hardware
> no longer boot. Bisect points to this patch, and reverting it fixes
> the problem.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-linus

Thanks!

[1/1] ASoC: Revert "ASoC: mediatek: Check for error clk pointer"
      commit: 946eb87114af37c9c13c618a7c1cdaca936905fa

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
