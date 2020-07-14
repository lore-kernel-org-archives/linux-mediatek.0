Return-Path: <SRS0=0yQJ=AZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BAD1C433E8
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2020 16:40:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 282C72222E
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2020 16:40:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g4rxHYJH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="eJOIHq8t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 282C72222E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Subject:References:In-Reply-To:To:From:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1mQLaOFFbiL4cENsl18g0Gw3jGrr9/pxyS/+m8T9KoY=; b=g4rxHYJHGTJm84DyXZbeg9jrm4
	LmQ0y1VpbvtCEK5dRNgGD3zwoE0/v2QFZ5HByENP3Y9Ab0H7GmjfT4HcCl2+aqyHgV4YYSTRlVKLr
	huuq+58rDJF9+hG7B4WNlI6npU6DwQONG5/vQqIfNqUcDbHV12c6A5AadhcYfCWatu9XLd58pWJSQ
	inf4VoLMfKmQ8ofeqV8MXiNd8pipHd9MnDR64ae/4/21ZVPx96Cz8vZF1hmI8HlH0nk4A6kXmXwHv
	VgO8rxYqJdNNFl47GIaoTAS0Sn6hDnJ/MBUjNNyoi4YJBa7feZMTJ7y55QTqAdo1byj7hhWOHnkVT
	Eezj3s6Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvNye-0002tu-Vg; Tue, 14 Jul 2020 16:40:21 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvNyX-0002rK-OY; Tue, 14 Jul 2020 16:40:14 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7496D22518;
 Tue, 14 Jul 2020 16:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594744813;
 bh=5ROMkjndgTXBfRd8iNvaYi1+yKgNxf3IbZnmlJVZUIE=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=eJOIHq8tP1EqHl27xdM5g/trk8Z94WPTDIHKZvJBwbDi3UheUV7gZH6sCZCmhvU9T
 /ONV8HJJw2woP2n2D7DqQJXBnmVDMNg3tL3+3jQIDB3EA5CqCjQD4COUD/MS5fuZ0k
 Nb05ynAV8BWSB318JQGlrf7OSTd8ndAqzaLP/3fc=
Date: Tue, 14 Jul 2020 17:40:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Michal Simek <michal.simek@xilinx.com>, Pratyush Yadav <p.yadav@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-spi@vger.kernel.org,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>
In-Reply-To: <20200623183030.26591-1-p.yadav@ti.com>
References: <20200623183030.26591-1-p.yadav@ti.com>
Subject: Re: [PATCH v10 00/17] mtd: spi-nor: add xSPI Octal DTR support
Message-Id: <159474480413.1281.3968081256686085875.b4-ty@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200714_124013_900905_D3F231E8 
X-CRM114-Status: GOOD (  13.13  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Sekhar Nori <nsekhar@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 24 Jun 2020 00:00:13 +0530, Pratyush Yadav wrote:
> This series adds support for octal DTR flashes in the spi-nor framework,
> and then adds hooks for the Cypress Semper and Mircom Xcella flashes to
> allow running them in octal DTR mode. This series assumes that the flash
> is handed to the kernel in Legacy SPI mode.
> 
> Tested on TI J721e EVM with 1-bit ECC on the Cypress flash.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/4] spi: spi-mem: allow specifying whether an op is DTR or not
      commit: 4c5e2bba30e49b970a0fd07b43e0b7a3b5fd5ea7
[2/4] spi: spi-mem: allow specifying a command's extension
      commit: caf72df48be32c39f74287976ae843501ae06949
[3/4] spi: atmel-quadspi: reject DTR ops
      commit: 5c81c275582c9d9c66d2f928591a2065f2528231
[4/4] spi: spi-mtk-nor: reject DTR ops
      commit: 4728f073bfc66b8b555274ef0d7741d7f5a48947

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
