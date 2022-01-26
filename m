Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E245C2BA4C
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jan 2022 17:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k5Eg3CX1GwrjF9PAhY/sIGRMJcLCuLwO3q0i1AENWjM=; b=pEDF9UAa0niY/i
	Adh7aAxEW+1vyEV8xUJHE94ItnxwkNrlfTtdvcGDbhNtuRAdH6Km3h5Z2WpXxIvOa1GigYj524UFh
	EwcmyMhMDC0WwPgzH0/4ndOwWrJSrPY9L5ASqFnzlymKK7MMuWEUSU0ZKvIrXgHF2mZ6DgA6X+hQ0
	EnmUhcwPznOTT8BmmLQk208j2QpGs35mbg1mqWjKQSdIpdiYrfB2e7cW2Axcw6u35FWORnDjI4vA4
	24RtsIbLSx+kKRzyi61g+1kRpRZcPU2jV0YooyEuw9XS9I/hbpTovPr4EZHTYVkF6eoCRh5xzypFW
	Jsx8rXEzHlev949NzD5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nClgu-00CqJ0-CD; Wed, 26 Jan 2022 17:02:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCkM1-00CL7x-11
 for linux-mediatek@lists.infradead.org; Wed, 26 Jan 2022 15:37:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6D05D61922;
 Wed, 26 Jan 2022 15:37:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD180C340E3;
 Wed, 26 Jan 2022 15:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643211420;
 bh=hNOKklvlwxJZmyMa/W1F50My2/RcSPvGhMZ8nBY8rXk=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=a7LYtmTn1Ixx/Fo0nsIspm48/FpMqc7WLCEnRJXxEzbRRYn2ue6oY9XDL2hX0JdXk
 nSeQ/GpeujgEgvuCBZz6B3AFD55nqN/gtfT/wEZpHt48k/SjwM+L0Cz84a6ghfoOEJ
 XqAiGOS/2GXKvD2YyPSMczrUj8TPwZiFaMtX+qTLSGe+hC2rximJFNtaHouk1PG86Q
 ozmUko7St0lfBCgs3AWLdO+qjlEJkIG0PJsYDJr3MNQemuy+nqesuUIpfTVKkORw8d
 bu6HaY+ufA9gCIQzMgveg702W/kfs8O5Mm8TSaEEqG0zKWVqReyblQNqybl89vZv7t
 nwJRjou4JUfrQ==
From: Mark Brown <broonie@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 guochun.mao@mediatek.com
Cc: srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Bin Zhang <bin.zhang@mediatek.com>,
 project_global_chrome_upstream_group@mediatek.com,
 kernel test robot <lkp@intel.com>, Bayi Cheng <bayi.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Chuanhong Guo <gch981213@gmail.com>
In-Reply-To: <20220126091159.27513-1-guochun.mao@mediatek.com>
References: <20220126091159.27513-1-guochun.mao@mediatek.com>
Subject: Re: [PATCH] spi: spi-mtk-nor: make some internal variables static
Message-Id: <164321141754.490431.3020669404541003433.b4-ty@kernel.org>
Date: Wed, 26 Jan 2022 15:36:57 +0000
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220126_073701_162771_7086173F 
X-CRM114-Status: GOOD (  12.02  )
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

On Wed, 26 Jan 2022 17:11:59 +0800, guochun.mao@mediatek.com wrote:
> From: Guochun Mao <guochun.mao@mediatek.com>
> 
> Variables mtk_nor_caps_mt8173, mtk_nor_caps_mt8186 and
> mtk_nor_caps_mt8192 are not declared.
> Make them static.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: spi-mtk-nor: make some internal variables static
      commit: 474fc2e6395d62758e80b9ea65f61339296355fc

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
