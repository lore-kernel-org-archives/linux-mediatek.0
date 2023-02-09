Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5678C636D3
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Feb 2023 19:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QR+AMCekWs5rX00hK7X9a5BzDp72BlyuwXxEFWLSSEU=; b=MffeLQbMUbS2bFdIEVaiH5Fc7C
	FTQxxzKT8RE62aSwUBh6W5RcBDxGBh0i0wsicco1tRjQNL3ky/B1yLdvjZUinkuO4KTclADIEGNc4
	HoF/tFBTs78xDkYbu5Ei25mzAI4Sjij8vtYbnzMsrM4L+vvQtpdrCSDy7gpRR1wGM0JlUw4dx/73J
	RNA2IbRr3gDOMc/9A88ra59Q4cBZCQ/PQcKkl7NZ0R1pA3Kij0OQflEGRJMkMFriifMprmDduswqa
	PeqSpmACz77vIaiZ0+Ld0Csk4lMJcEJOt949LHlNQ7Og7iIdasB++rXlkbtmK8S2yznj+epcFFJ5M
	YG7Ou/IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQCRc-002z0q-J7; Thu, 09 Feb 2023 19:18:56 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQCRS-002yz6-BN; Thu, 09 Feb 2023 19:18:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id DBA22B82292;
	Thu,  9 Feb 2023 19:18:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CE50C433D2;
	Thu,  9 Feb 2023 19:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675970323;
	bh=mDkzITMeQax7M/mdpkLZOTnU0VTywWzADEO1NFt7WtI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=I5qAoAZlJ9ktZK+svpS08bNObcipk6QOo528BUt0+E0F/IbWtNriGeVTjYWXmhIi8
	 xc9Q+c3W+39q0AnwG6PKz1lglgKQSdbOMz5x8L21aRTpLYqbmnn2AN9TYQ1f9dUHav
	 KUj2fgjx0OzhFJwCR0RjuYkFcExiWDXSfSlxEkFptutZ99LeA4ds9f28eHkdcEueCM
	 +RvxK5Wkk5mN5/y3nZgEyxHrE2vOGk/GE23D1c4qxvvAHw5gImOqMG04DkWMp9uedJ
	 zEhwd6gzST5oXrtSowKOb7KZyZGBaIQcWZ5AEmeeVlElZsMnsyOrbfHgmUE9djggEC
	 II+2tN3RKcm2A==
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Xiangsheng Hou <xiangsheng.hou@mediatek.com>
Cc: Chuanhong Guo <gch981213@gmail.com>, linux-spi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 benliang.zhao@mediatek.com, bin.zhang@mediatek.com
In-Reply-To: <20230201020921.26712-1-xiangsheng.hou@mediatek.com>
References: <20230201020921.26712-1-xiangsheng.hou@mediatek.com>
Subject: Re: [PATCH v6 0/5] Add MediaTek MT7986 SPI NAND support
Message-Id: <167597032096.933619.6758508358414336782.b4-ty@kernel.org>
Date: Thu, 09 Feb 2023 19:18:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_111846_565726_A122D01F 
X-CRM114-Status: GOOD (  14.75  )
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

On Wed, 01 Feb 2023 10:09:16 +0800, Xiangsheng Hou wrote:
> This patch series split from bellow series which pick-up spi relevant patches
> https://lore.kernel.org/all/20230130030656.12127-1-xiangsheng.hou@mediatek.com.
> This series add MediaTek MT7986 SPI NAND controller support, add read latch
> latency, smaple delay adjust and add optional nfi_hclk.
> 
> Changes since V5:
>  - Split spi relevant patches from previous series V4
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/5] spi: mtk-snfi: Change default page format to setup default setting
      commit: 2b1e19811a8ecc776d15da4ca89df48db6974d66
[2/5] spi: mtk-snfi: Add optional nfi_hclk which is needed for MT7986
      commit: e40fa328551dd67d14e5dc3e4ed82b5b770f027f
[3/5] dt-bindings: spi: mtk-snfi: Add compatible for MT7986
      commit: 8aa2ef233fa3b985ced1ed31b86fddddfd6be4b2
[4/5] spi: mtk-snfi: Add snfi sample delay and read latency adjustment
      commit: 1d36c99062bf4e809271cc534486342442508d4a
[5/5] dt-bindings: spi: mtk-snfi: Add read latch latency property
      commit: 351c02cb740472c659145b0027e77a3353e58185

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


