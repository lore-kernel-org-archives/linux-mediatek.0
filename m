Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAC3BC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Dec 2021 02:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wDglHJA34B/jaqnESVvDPCmys02Sup0SbUinOJnJkMY=; b=jPWI+I43eseoBm
	AhfUM6aICFbkbyLriCrN2ztyBG09DCpH2PH9Q8eMQX3ce/eOsZNxT0YweboaLPBJBhSQ5KQndiZiz
	yJRUXsOrG2JtxJ3pjBt42AbgEx/p8YWRu8f9LO4ykIo91cKJFfkZE5HcIlUQfp/fWvZjZV4xvx8O9
	qIaHmFpTpnFCiUtO22tQFZit72OxY3+QnRxOO5VAyVe5PqcTHf6c6vXu08O6885QPKkHOrWHXiK7g
	BJ/TWhTLjl85oazA4raTH8BCGfhFlpNtWGflSbPqec74N1sZ8Gqx0IfnR1BgXelcdeL8I2nzvkP+3
	HM6Itx1C52VEb/EvbV0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzVFH-005I7V-7A; Tue, 21 Dec 2021 02:51:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzVF3-005Hzs-Bh; Tue, 21 Dec 2021 02:51:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D0E1461367;
 Tue, 21 Dec 2021 02:51:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E090C36AE8;
 Tue, 21 Dec 2021 02:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640055064;
 bh=MWsSe+f/4lMO4ek8jRQKfguvVlMxW/ReWXj6iBmyEvg=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=X/O5ikSYgLXRodJDAAnqTOhuyNlIrIuAM9T9rObSgJhXQe5hi4q16Rk8N2mHD8I46
 4USHq6FL8+6WYdYrCJImrmzYsf6nfp5buosLqARxr2fWRfGqN5+8sjW/gF2/AOHuDN
 Dog2B/4btB9HkKiGIiq3W51b/jXTK92gMdlnGMxwG3xz3Sh7R/CsxRkLy8+OlxdBeM
 JRSEktZ+eF9/9Mb94GreDbTS+qVwp48oUZcHjDWOTsNiOUKMLv3XYfTO5ML+36dQTq
 QZdMJA/LXkiKHdsQbgX9e1A4OQEsC29ny2QgaCHsod7CrF/VkaovlZG8lFE0GWPPCz
 fHTFL8WWctCVA==
From: Mark Brown <broonie@kernel.org>
To: linus.walleij@linaro.org, matthias.bgg@gmail.com, robh+dt@kernel.org,
 Tinghan Shen <tinghan.shen@mediatek.com>
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 bayi.cheng@mediatek.com, sean.wang@mediatek.com,
 linux-arm-kernel@lists.infradead.org, gch981213@gmail.com,
 bgolaszewski@baylibre.com, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
In-Reply-To: <20211220121825.6446-1-tinghan.shen@mediatek.com>
References: <20211220121825.6446-1-tinghan.shen@mediatek.com>
Subject: Re: (subset) [PATCH v7 0/4] Add basic SoC support for mediatek mt8195
Message-Id: <164005506109.2648034.14953790658708739553.b4-ty@kernel.org>
Date: Tue, 21 Dec 2021 02:51:01 +0000
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211220_185105_463384_B5799CBA 
X-CRM114-Status: GOOD (  11.38  )
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

On Mon, 20 Dec 2021 20:18:21 +0800, Tinghan Shen wrote:
> This series adds basic SoC support for Mediatek's SoC MT8195.
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[2/4] dt-bindings: spi: spi-mtk-nor: add new clock name 'axi' for spi nor
      commit: 6008cb4c98d935a844edf2f3c13639104f533e30

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
