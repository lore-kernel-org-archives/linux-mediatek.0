Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19124EE57DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Sep 2023 15:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wVWsXaNxn2xnWZNATEKQ/YPa1vhzBTYwO2O0LMIPSQQ=; b=UP5sQUcQgQ7r602jnnKw3PtPbn
	1x1u3CTeZgoiac6eORkZnXq7dF0kdiCaUxTHlsROBLeG53TipPF+XwBkmk7LcSUaRR8h5l2vQQxLS
	gizk966rIwXbbefvDfINQbXPAulN8szniJktoqOLWE+Maq+VZ1tcKmEmaHu1UdiMleKZ+PfHCOzBC
	ox79eBTUo02PFRSKOxbjuHV5venL7+JgAjpgtGli/DrDY0VlufYw357UVbr2ruLcxY//GC2QLaJSP
	pPvYutKBYRo4ovoPMbuDNI8Lqjex7jE8PZfdwb+Hei61WdrBA4wTVPjPONjtd5XFMCUnWNBQ2kdke
	lbSifu0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfiWX-000pC2-0D;
	Mon, 11 Sep 2023 15:08:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfiWU-000pB0-03;
	Mon, 11 Sep 2023 15:08:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 83BCD61208;
	Mon, 11 Sep 2023 15:08:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BA0AC433C9;
	Mon, 11 Sep 2023 15:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694444901;
	bh=QQhUsR8kda3/hj6CcImnvWnHoUxICmdWDtUfw+d0L2k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=oMnmqdvCbB/b9eUNHcCKrZgBIXAfEa4l3Ut8F+Krr/A+TO4Qp5xFRdmhtzOYMkOQW
	 98qwiW7ihtvdhmXn9/JMY3cAkCWfkf2RS329FQiqevC0xj5zMYEDcJaG1IoD/tdcm4
	 kpZWOr1Vyd7e3Vmm3u4QL91seR/p4ZlqPgFodnlHBoxj1eBGPhSgK/yrDWOIq40+f5
	 aUnUpUTw2aMPaIA27iibLEyT3mePx5Lnjot6mQy4HcSMzruUmZLyKo9qd8lzteD46Z
	 2M1fvO80IowMc9BrQIeMCwHpPKkPdDJZ3fzLDWpXm32vUmqUZe+eAU80MyQvPY7gmH
	 AOdhADl4GZdow==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Julia Lawall <Julia.Lawall@inria.fr>
Cc: kernel-janitors@vger.kernel.org, Zhang Rui <rui.zhang@intel.com>, 
 Amit Kucheria <amitk@kernel.org>, linux-pm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, 
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 linuxppc-dev@lists.ozlabs.org, linux-mmc@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-media@vger.kernel.org
In-Reply-To: <20230907095521.14053-1-Julia.Lawall@inria.fr>
References: <20230907095521.14053-1-Julia.Lawall@inria.fr>
Subject: Re: (subset) [PATCH 00/11] add missing of_node_put
Message-Id: <169444489227.1851820.10212594180854433279.b4-ty@kernel.org>
Date: Mon, 11 Sep 2023 16:08:12 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_080822_101006_6837DC2C 
X-CRM114-Status: GOOD (  10.15  )
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

On Thu, 07 Sep 2023 11:55:10 +0200, Julia Lawall wrote:
> Add of_node_put on a break out of an of_node loop.
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[10/11] ASoC: rsnd: add missing of_node_put
        commit: 28115b1c4f2bb76e786436bf6597c5eb27638a5c

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


