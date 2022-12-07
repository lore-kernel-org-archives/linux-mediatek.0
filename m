Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4439CC4708E
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Dec 2022 16:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ncUN+O+h7R1S4jtrnjtvDhc+ID3q9CLAYYT0V2YVJoA=; b=ZjLAno8PdZoYQNQhMlf5++G0z5
	wnvnvph7I4YRBXJiHOq7VLkKSujglHTQqlBZbxK0rUBe0wAxBlTjZobYHZL0iQ97EfETemJ+owvWa
	w68MAclZkW31p0/itGl0t7AJ06TnTssy/YZzaABTgSdn4b7dmpHzZ6IiIriRqAx2E0rhXenFQ5kA6
	UOZ3UN5B3InE23qDJk7b9TYxffKKDsUahwGiKeb/25sguVjorN9J6H3n0diHHIlaC32qRA+Oombhn
	XeBOmH4LseubkpbxOg4ftvlLvApamnI3b6eMEs1leVCbpdxkOSbRrjbrWjLnLduZWdou8UDNxB3Mt
	H6LBCX0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2xAj-006YPo-D5; Wed, 07 Dec 2022 16:21:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2xAY-006YGk-Js; Wed, 07 Dec 2022 16:21:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C89C961ADA;
	Wed,  7 Dec 2022 16:21:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78524C433C1;
	Wed,  7 Dec 2022 16:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670430069;
	bh=gD687UUnJea8Yfc6ECxObJUR701yC6QpmwJ0PK2TfFY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=VyU3Y5hy+bQNIm+Jx5Cahbr6ZDz21sn3CCp/2OS2bIKG5n3Z0KzSl00Ggk0s+6Iiy
	 D5dxPqE6NWbwAhjLdJHo87NatU+ry2i+sLDiweaxEBdPgN7e9MzLKJiLVehssk66cc
	 zE840mb2mK834BN2MSPQVO/0ikGbGRfUePV7YVKN0EDIW6odVPWjmlX4vSqnfXvg+x
	 R2Do/Gkw1gvfmZ3OamSkfac9msiCweI9eYquKfELDyuFfhOzGCQ+biWu1Pg5MvFxkG
	 WrzqsqDXc/Cvc6tBqw37SBJ3t75ShuHauf7EkFGYOA1n6jSr+Efj74fnxRPCtvzB9Y
	 x/8MMCG9gsZQQ==
From: Mark Brown <broonie@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>, Ikjoon Jang <ikjn@chromium.org>,
 Bayi Cheng <bayi.cheng@mediatek.com>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Chuanhong Guo <gch981213@gmail.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
In-Reply-To: <20221207055435.30557-1-bayi.cheng@mediatek.com>
References: <20221207055435.30557-1-bayi.cheng@mediatek.com>
Subject:  Re: [PATCH v2] spi: spi-mtk-nor: Add recovery mechanism for dma read timeout
Message-Id: <167043006609.286366.2467608192853584896.b4-ty@kernel.org>
Date: Wed, 07 Dec 2022 16:21:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.11.0-dev-b77ec
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_082114_719390_6DDD5472 
X-CRM114-Status: GOOD (  15.80  )
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

On Wed, 07 Dec 2022 13:54:35 +0800, Bayi Cheng wrote:
> The state machine of MTK spi nor controller may be disturbed by some
> glitch signals from the relevant BUS during dma read, Although the
> possibility of causing the dma read to fail is next to nothing,
> However, if error-handling is not implemented, which makes the feature
> somewhat risky.
> 
> Add an error-handling mechanism here, reset the state machine and
> re-read the data when an error occurs.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: spi-mtk-nor: Add recovery mechanism for dma read timeout
      commit: 8330e9e8269bb76dd502e84efb5f351016512cf8

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

