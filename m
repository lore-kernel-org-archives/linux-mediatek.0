Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 762C6C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Nov 2022 10:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JRGBzG/ImnCtwxiUot0m0KGqFu/uO3o3OUKSp+RO1cY=; b=R6wJp6BWWEDtgEuz6SRIz8s4OH
	RI+H2QO9t2fY8Af65HDz8gQVQ9ZHKks4vuub3JtZ1BGbu3aMT8laRQ8W1dD9mVbWRagxKnxuXWwja
	71ec6Ozh6rh31dZvTh1droPly6EyV6KqFzAfxV8cfjmHUa4Av+TEEOa+ypEFJZJD7AnQIt9hqNVJk
	N5Ft/3zvEajeeZ1mL1S3bGKdxbyra7cfP5ylGqn7WU2RT5RD7Q9bWIwpttby6wDfYyYDGslEe2Byy
	LhyoCCuN1hgWR/Vq3hoazrbn7PKbwntBksdDdxIFK8ubQz8Ec63MVph2bVj1lLUJmzgaFDxUw3cog
	XuaIiuJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1out4B-009qsV-Ii; Tue, 15 Nov 2022 10:21:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ousgh-009dmY-V1; Tue, 15 Nov 2022 09:57:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7C9F46157E;
	Tue, 15 Nov 2022 09:57:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9D60C433C1;
	Tue, 15 Nov 2022 09:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668506222;
	bh=PSY+LeXq5fcKInvMeGl2Yo5EbcIopd9QnKvQjf6hmOM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=P2dzTxIbcSgBgDHQpVjFUsLkIHyFwd2Bx2wmRZkSV6+AWeyfJ9j0lMjbvZRaBNY2z
	 FCT3O024Pv01gwUFDdiIuDOZLu7m7G2Fzqxe46LQzX6zS2MP4xsQ5s6Yqn8kGHfb+S
	 FL3kyp8+Y92SzQ2X8Nvwn+xyUZVm94XQMDsOXyuwRxDxXH4YTNaocX/ANbRST+k38T
	 8wecaVkesYuamGZtIRjUFuBCOLPx8x54zZe6M834sw5phM/3Irn/MVIInG2pEVQLYp
	 jSVSKIrOSs1Br+sCeYm7/pbBCEnJt6Hhk9lqfhRAJg3XLRWumXMkAiESYWXL0iIDWJ
	 63+yJAFqr0XVg==
From: Mark Brown <broonie@kernel.org>
To: Ikjoon Jang <ikjn@chromium.org>, Bayi Cheng <bayi.cheng@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org
In-Reply-To: <20221114081327.25750-1-bayi.cheng@mediatek.com>
References: <20221114081327.25750-1-bayi.cheng@mediatek.com>
Subject: Re: [PATCH v2] spi: spi-mtk-nor: Optimize timeout for dma read
Message-Id: <166850622037.114886.18108936961480983517.b4-ty@kernel.org>
Date: Tue, 15 Nov 2022 09:57:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.11.0-dev-8af31
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221115_015704_066214_1C52700F 
X-CRM114-Status: GOOD (  14.48  )
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

On Mon, 14 Nov 2022 16:13:27 +0800, Bayi Cheng wrote:
> From: bayi cheng <bayi.cheng@mediatek.com>
> 
> The timeout value of the current dma read is unreasonable. For example,
> If the spi flash clock is 26Mhz, It will takes about 1.3ms to read a
> 4KB data in spi mode. But the actual measurement exceeds 50s when a
> dma read timeout is encountered.
> 
> [...]

Applied to

   broonie/spi.git for-next

Thanks!

[1/1] spi: spi-mtk-nor: Optimize timeout for dma read
      commit: d52a826b40604387d3e24b54e12e404867902fbb

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

