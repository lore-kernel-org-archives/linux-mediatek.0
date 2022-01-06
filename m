Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19D9AC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Jan 2022 20:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eBcTGSusMrQFR2M8ogy7e3YdURw4pHs07t+ZXuHQg18=; b=StlUgpif6/1eq3
	qcwPb8lzF/ChgKAMWVDqLX7BcM620LKsDxMvJS+71KMtsRKFKsXlD7ZdUj8iCElMcXIPAVhyLKPMW
	vLbtYT0rI1Ntdp6kyUnqrWG/IEXI1T6HBx9XxAUUSyo0xY0+cC2pftDhVGj08h9IhKWeQWFdqaOEi
	PVkFZvyujGXN1w+g0E1gTiQDEuAn1AK02XB3R6Xe46mKMelPpWuiNMWBQChRPUfxb1QxFa22ez/Ow
	CsF1lYZqaJEVPJ3KSEbkpc09ZCX0GDRie1LqYEWZblSwFSS2N54zfFu56ZwSiCswlbMlFPzg/Lt9O
	OzxBFbkQxb4hZqSXQxVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5ZNS-001L6L-MT; Thu, 06 Jan 2022 20:28:50 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5ZNH-001L3Y-2U; Thu, 06 Jan 2022 20:28:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BACB8B823F7;
 Thu,  6 Jan 2022 20:28:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF730C36AE5;
 Thu,  6 Jan 2022 20:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641500916;
 bh=b/lnSyPUZvmRkpkf3M9HGG79TwkLoB+cQSoOb4PH7Ec=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=qtGk2179/FtqC4QB0oJSeU9ORB8b6AkTj8Uu/cjbWBOesVnIv6M1j51qdox3CyQZU
 yUqH/OYdl2+fLjx6Yu9iXaj/VRjvCSIMPBaXLaP0iwA2/m1JYfEBAH2QJySWNUt5Fn
 VROc59x/OES7coCycWFV4u6KTQ8Y5JGfXeRSzwh27KOFSv/F68ITLR9hjApzvm4tfi
 xSa966zi0N8LwR0wfDogdIzmmCMSefu3kUseKTgFyloiZJ9nPzoziOpdtt0vhGNT6p
 0UNoq6XCW3UDcjhI+G70PmXnYbzWtzrb0OVRyrSmQb+c/h3d2ox6AUf19UZ2uhbzxe
 TBXtK5zzFRtJA==
From: Mark Brown <broonie@kernel.org>
To: Chuanhong Guo <gch981213@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bayi Cheng <bayi.cheng@mediatek.com>, Rob Herring <robh@kernel.org>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
In-Reply-To: <20220106182518.1435497-9-robh@kernel.org>
References: <20220106182518.1435497-9-robh@kernel.org>
Subject: Re: [PATCH] spi: dt-bindings: mediatek,
 spi-mtk-nor: Fix example 'interrupts' property
Message-Id: <164150091444.2243644.7719770746568612726.b4-ty@kernel.org>
Date: Thu, 06 Jan 2022 20:28:34 +0000
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220106_122839_274440_4C11820C 
X-CRM114-Status: GOOD (  11.74  )
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

On Thu, 6 Jan 2022 12:25:17 -0600, Rob Herring wrote:
> A phandle for 'interrupts' value is wrong and should be one or more numbers.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: dt-bindings: mediatek,spi-mtk-nor: Fix example 'interrupts' property
      commit: 3e718b44756e2829e7189a9504aa7a6d7f394d6c

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
