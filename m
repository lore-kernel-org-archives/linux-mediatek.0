Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F082EB64DA
	for <linux-mediatek@archiver.kernel.org>; Sun, 16 Jul 2023 12:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TLFU3WF0UOCgMKC3xzAs49ZdgFu9dN3zojFFrnsWtfQ=; b=W5gcaH2ffzD8dAohCVjqPqQxaj
	npT80+WS6cBqfj9IknC7K9gIQUJxjj9mnH9lA8nSFGrrFQQZXUQ4skO/Bg1bHGz7e1jDnbkXYDYDW
	pH2kNzuom1iSM97wBECNFiQJVaMwFFT5SJNV8qj7JbzyBzwgrH0RGU3INuiQVo42lG5vJkWERjfZn
	VJsN3Dx6ltQrZTrv5U2bg5ICQnrbGcnSXN6tQAGxGH6OP7NxRmXHlMrRQfQRAH/2SQsCPiS79Ehig
	SY7Ww+D8sVbx+CfN9kcz8Nh6+ErnUjyi4RaNuAu787N2jy1sI/EiXsQ5zo+fEYVVekd68pDqqfRci
	ay7mOH8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qL1EE-00BGW7-1x;
	Sun, 16 Jul 2023 12:51:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qL1Dy-00BGNn-1b;
	Sun, 16 Jul 2023 12:51:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AE76A60C99;
	Sun, 16 Jul 2023 12:51:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13645C433C8;
	Sun, 16 Jul 2023 12:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689511899;
	bh=S4v2KgibSFbKIsZlQ38KnV9FNhJrX3MV15+dg8ot1js=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=OoMtJPxf7SjsyC9RQZnYmoXwB+n88i+P2G7rOdEkw9RoB5uPg/I4n3t5iPuRiosl7
	 2DKBw0lWtczzb/MSi1ChJDKVVNFP0HzTJfvccGdVovQ/JWfHEXZgCB7TSBCh6XDGnk
	 t4Ug7X+hqG2YWshHr22sGhHjvUj7QsXPsSB1bnj/cxB67nvFpCy+WaWJw0Z1IaDS+L
	 oRxrO9IXemmp0UhqbC8v+VikVtD2cij0PEFzv02BHOI1xfwe1MqZtrinSrrhoGJ5tE
	 jME9UYXynE+aatcqiQxhDW/iIqWj9LuvckE+Zs4neqN20A0+uX/INMlL3Lv7OxkyEj
	 FudMxeewLMnKw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Cristian Ciocaltea <cristian.ciocaltea@gmail.com>, 
 Chen-Yu Tsai <wens@csie.org>, Saravanan Sekar <sravanhome@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Tony Lindgren <tony@atomide.com>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
 Sudeep Holla <sudeep.holla@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-actions@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-omap@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
In-Reply-To: <20230714174930.4063320-1-robh@kernel.org>
References: <20230714174930.4063320-1-robh@kernel.org>
Subject: Re: [PATCH] regulator: Explicitly include correct DT includes
Message-Id: <168951189379.112004.11594538020708568822.b4-ty@kernel.org>
Date: Sun, 16 Jul 2023 13:51:33 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230716_055142_840572_1FD677D4 
X-CRM114-Status: GOOD (  13.39  )
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

On Fri, 14 Jul 2023 11:49:28 -0600, Rob Herring wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: Explicitly include correct DT includes
      commit: 045a44d4c9b32578aacf0811063e5bb741c7c32c

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


