Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B7B3C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jan 2022 10:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5dtkngUERyc2WGV45Vaff2uTC1pL4a/R57XZdITILWg=; b=vEi4jMYRITDlvO
	KimaUh9psOPpH8cXCzp08wiEudgYtBdnXNaLnRXo3Vugie9e7/jiqjj0Zh5JcMO74HdId7LYz0zd2
	OV3kXBFH1tv+Jjr4idJCLjpVCBVxAczWO0gWjmF85+nVbeSWY0Abg+18uqHBWKQgs8/3bkihZ+F1I
	AqOMATSqOUp4DVIf1cejl98OR0KdpQTCF8LD/4DH6zvcdrMTjTANAsmSimpVDVEGxHef0l/UcwEp4
	q+yIAf4hE8OwzcKcmSERUyvTQsjEClmX7eehRLFLYrEDhkNFMOKOda+/V0/K2cysZ8cc7uNLP83+r
	W9xltKWKBwxQPu3VMWLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCIxe-007PtI-RD; Tue, 25 Jan 2022 10:22:02 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCIwv-007Pb5-Ga
 for linux-mediatek@lists.infradead.org; Tue, 25 Jan 2022 10:21:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 98488B81711;
 Tue, 25 Jan 2022 10:21:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8984C340E8;
 Tue, 25 Jan 2022 10:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643106074;
 bh=ros5s0vRsnHc7zyzxb4MpRvGfwf7Ajrp+evc8rcz8ds=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=jPs9DCrOJCKJhGEyLtBauCBxj84a3iQ1IT3sqtvcnWXzx7jc2GuxF1G9QUiuQGtsB
 bkeDrj+2ZU/XCF5mW4JqON4C8jRDs4LXQrXvX4miVy6xBdYIx0Ch8O+ikVkjfr2bcz
 s7eevpu/oOW2Sim8bx1sd8PhmoDVEpPPeRuRByPAn6rHkkTBtEuOORw5MPkYZx0azJ
 Xe2O//uPwgRm8I836B7WGyRj0M0RidKvJtifAIxHUJHDUoakokjbI4cgbJv8xS/FCU
 1Zo3kIZzRPQloSsCqJuIAOBfGVsMVmyhcY+OQVNrrRHP2wo7ccwSdu6TfmYJ6ZxPIJ
 LZ6KCx1/h9+Dg==
From: Mark Brown <broonie@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 guochun.mao@mediatek.com, Rob Herring <robh+dt@kernel.org>
Cc: srv_heupstream@mediatek.com, Zhen Zhang <zhen.zhang@mediatek.com>,
 Bin Zhang <bin.zhang@mediatek.com>, Chuanhong Guo <gch981213@gmail.com>,
 project_global_chrome_upstream_group@mediatek.com,
 Bayi Cheng <bayi.cheng@mediatek.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220118142820.2729-1-guochun.mao@mediatek.com>
References: <20220118142820.2729-1-guochun.mao@mediatek.com>
Subject: Re: [PATCH v2 0/4] add new SoC mt8186 support for spi-mtk-nor
Message-Id: <164310607135.75071.3179089148153080235.b4-ty@kernel.org>
Date: Tue, 25 Jan 2022 10:21:11 +0000
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_022117_755348_B166B5A5 
X-CRM114-Status: GOOD (  16.34  )
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

On Tue, 18 Jan 2022 22:28:16 +0800, guochun.mao@mediatek.com wrote:
> These patches is mainly for adding mt8186 support.
> The spi nor controller of mt8186 has some differences,
> it needs one more clk, axi_s, for dma feature.
> And also needs one extra dummy bit when read flash registers.
> 
> The version 2 patches fix some typos for bindings file,
> correct return value of probe function in spi-mtk-nor.c file,
> and add some comments to explain why add extra dummy bit.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/4] dt-bindings: spi: add mt8186-nor compatible string
      commit: ceab11a3c0d620d9ec2c032fd8014615cf7934ec
[2/4] spi: spi-mtk-nor: improve device table for adding more capabilities
      commit: 5b177234e9fde7d4208e8163debc109b86e3f68d
[3/4] spi: spi-mtk-nor: add new soc mt8186 support
      commit: 4e8bfe5cdf77621cb4e7b196448ceeff20d9d6a6
[4/4] spi: spi-mtk-nor: add axi_s clock for mt8186
      commit: 58b0a653b8dac40bbeb01a2c8a230aa8f84a7530

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
