Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE927C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jan 2022 10:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JvR/rp9mfE3WgBY01QOGzPfVcPDAzNViqAsKTh0qsxQ=; b=4g+b6SyshoYEYA
	uN1F50lBr8n3wVL0wlEwLeJ1AHN+z32ajQkviCVi4uUs+PyKL7OdLiAhRVNIE6BtXdfwde4ZbTekJ
	5TYZhv9dE2rQIE5C71jyx3RlYT0cdgd/Q9AFxaKRYay4KA9u2gdMXwnJLghlokLsyFFJ22fGjoMlm
	fo/pjm+nJZ8elLVgQpuxUYYwWn6JI+CwYaKndCt9V9Mjx/cp7KvsWprE8vDXkC0HWrDmpC+oU8AOJ
	4b6yOa5+Ow7JpJO04LgW8jD4NxgDSDwtP7iX1wovucd4lhDlieCzrTiHPMkyKC2N8zuZLcn16NVIj
	KSzTod2FCF1zh5gq8JNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCJWz-007YJX-IM; Tue, 25 Jan 2022 10:58:33 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCJWv-007YHX-48
 for linux-mediatek@lists.infradead.org; Tue, 25 Jan 2022 10:58:32 +0000
X-UUID: a621f49bc85e417895a4bae281fdc03b-20220125
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=KixU75rOsVu+o/VSeFXlq3ZGeD/E9Mlif6mOsBsDRKY=; 
 b=bdrAW9T/JPRG0JiaaQa7qrNeBJxK7CRrvoIddUG95ZW8CcztVnto2zRWSs7n0ieM0IZyJ4yiqTcb6XSUr8DqsEOqWkiZCW/gxOf7FJKQuXYjJasQtUsrz+rPOouR0pmEqr5WBwXh6qIFB/iQL7Vjse94HW0RwZ25492H3hMILgE=;
X-UUID: a621f49bc85e417895a4bae281fdc03b-20220125
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <guochun.mao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1651268570; Tue, 25 Jan 2022 03:58:24 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 Jan 2022 02:58:22 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 25 Jan 2022 18:58:21 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 25 Jan 2022 18:58:20 +0800
Message-ID: <f654b80aeaa496163c52c241a78e6fc8231d780f.camel@mediatek.com>
Subject: Re: [PATCH v2 0/4] add new SoC mt8186 support for spi-mtk-nor
From: Guochun Mao <guochun.mao@mediatek.com>
To: Mark Brown <broonie@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Rob Herring <robh+dt@kernel.org>
CC: <srv_heupstream@mediatek.com>, Zhen Zhang <zhen.zhang@mediatek.com>, "Bin
 Zhang" <bin.zhang@mediatek.com>, Chuanhong Guo <gch981213@gmail.com>,
 <project_global_chrome_upstream_group@mediatek.com>, Bayi Cheng
 <bayi.cheng@mediatek.com>, <linux-mediatek@lists.infradead.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>
Date: Tue, 25 Jan 2022 18:58:20 +0800
In-Reply-To: <164310607135.75071.3179089148153080235.b4-ty@kernel.org>
References: <20220118142820.2729-1-guochun.mao@mediatek.com>
 <164310607135.75071.3179089148153080235.b4-ty@kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_025830_590063_9C606642 
X-CRM114-Status: GOOD (  23.74  )
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


Hi Mark, Angelo, Rob,

Thank you very much.

Guochun


On Tue, 2022-01-25 at 10:21 +0000, Mark Brown wrote:
> On Tue, 18 Jan 2022 22:28:16 +0800, guochun.mao@mediatek.com wrote:
> > These patches is mainly for adding mt8186 support.
> > The spi nor controller of mt8186 has some differences,
> > it needs one more clk, axi_s, for dma feature.
> > And also needs one extra dummy bit when read flash registers.
> > 
> > The version 2 patches fix some typos for bindings file,
> > correct return value of probe function in spi-mtk-nor.c file,
> > and add some comments to explain why add extra dummy bit.
> > 
> > [...]
> 
> Applied to
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git
> for-next
> 
> Thanks!
> 
> [1/4] dt-bindings: spi: add mt8186-nor compatible string
>       commit: ceab11a3c0d620d9ec2c032fd8014615cf7934ec
> [2/4] spi: spi-mtk-nor: improve device table for adding more
> capabilities
>       commit: 5b177234e9fde7d4208e8163debc109b86e3f68d
> [3/4] spi: spi-mtk-nor: add new soc mt8186 support
>       commit: 4e8bfe5cdf77621cb4e7b196448ceeff20d9d6a6
> [4/4] spi: spi-mtk-nor: add axi_s clock for mt8186
>       commit: 58b0a653b8dac40bbeb01a2c8a230aa8f84a7530
> 
> All being well this means that it will be integrated into the linux-
> next
> tree (usually sometime in the next 24 hours) and sent to Linus during
> the next merge window (or sooner if it is a bug fix), however if
> problems are discovered then the patch may be dropped or reverted.
> 
> You may get further e-mails resulting from automated or manual
> testing
> and review of the tree, please engage with people reporting problems
> and
> send followup patches addressing any issues that are reported if
> needed.
> 
> If any updates are required or you are submitting further changes
> they
> should be sent as incremental updates against current git, existing
> patches will not be replaced.
> 
> Please add any relevant lists and maintainers to the CCs when
> replying
> to this mail.
> 
> Thanks,
> Mark
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
