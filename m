Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35920C54E64
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Mar 2024 17:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5oV+mP3CN5OMGM5WcRM7PYxNitIAkxl/ZH7sh+O/5Bg=; b=CTsoz1HuFWjNnoeTwzPgRK4UKY
	rlLMxtEWr+vbjTtg3ezsshgHTzUgpGr5Xye1bVS+Ey9cPf3gspKy8/4tYK9UqqfLTwt70/Ad7DHHO
	vRs62GdAtHsWGa9dLR2YxD080PsbwnLl2y6rMD2cr54YCw2AT0elggmybvFk3RZKmC8ozOhquq9Mo
	kF/bzdSwlfW38JRJV12Yl/c528epua+BshZ4rW0DR9dNBfRvTA8jIhuUMTp/IT41r0NKBZhaNf43A
	MXiHxhz1L6V5iGyD4QKUCzadLwDIExW7Q7tRLFJY2hCMt0NOym02FjAZoyLGa3MxH/TEdBsH8c87M
	xyR+T+zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rooNr-000000017Ma-1l86;
	Mon, 25 Mar 2024 17:45:19 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rooNR-00000001774-2rQ5;
	Mon, 25 Mar 2024 17:44:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id F2CDBCE1A1B;
	Mon, 25 Mar 2024 17:44:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFEC3C433C7;
	Mon, 25 Mar 2024 17:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711388691;
	bh=vrzdapfTi0QWEvTbUNO21le5/X7ZUgL1lrdO+CKr7U8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jOR+MgPNGs+t32Qw6dbHyuiRbL3scRwRFhXCgWzXvZrWsOnhhKFpDM+KVYSvdjzVl
	 2llPz4kHkozIB7OFyUtpw6hHej67gAECl2+5D94uUuS4RQUP+uhGND3N6qSPZognKB
	 DIGiDbCZI/s5LL1nQ5EdVFB7REcSDw2N9IqcsZjbsxAAZZbo0dfMkhDOfzrNGubgj6
	 WOT2HJWJyJ8WeGDTHmzdVG+H653cYkxVKwoJ/iKy2/SF07zgqNQ8jJ9+JxuS2m6TZ9
	 kO0Jumlo8V7uqf3ZWlPhvNkE5Nj+3ktHu4Zcd5YDneo7heYzNtFvQZJK1cCnh/964Y
	 1t5eCo3fGKvDQ==
From: Mark Brown <broonie@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Justin Swartz <justin.swartz@risingedge.co.za>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20240316010302.20776-1-justin.swartz@risingedge.co.za>
References: <71533474-eb08-438c-b7ec-5f3277c195fc@sirena.org.uk>
 <20240316010302.20776-1-justin.swartz@risingedge.co.za>
Subject: Re: [PATCH v2] spi: mt7621: allow GPIO chip select lines
Message-Id: <171138868965.327330.16954587667720708033.b4-ty@kernel.org>
Date: Mon, 25 Mar 2024 17:44:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_104454_105551_BB29A23C 
X-CRM114-Status: GOOD (  13.03  )
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

On Sat, 16 Mar 2024 03:03:01 +0200, Justin Swartz wrote:
> Extract a magic number, from mt7621_spi_probe(), used to
> declare the number of chip select lines (which co-incides
> with the native chip select count of 2) to a macro.
> 
> Use the newly defined MT7621_NATIVE_CS_COUNT macro to
> instead populate both the spi_controller's max_native_cs
> and num_chipselect members.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: mt7621: allow GPIO chip select lines
      commit: 2a741cd6ec5899cec054ae27120f490ad57bc6bb

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


