Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 134A2C7618A
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Mar 2023 18:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L0WXBKFncXttiHWwMYkyoyndkZ2+vuPq03GRqkgEqWE=; b=g6Kd27wshqlBF2Pq+8goZKhxXJ
	S/g9MfM2KsLUtNp/HEyUZ9oGRaGjoePUmb2uFDZfVKJn/d86gPIyaoherc2ls08NFMJ1/vDmD1+zp
	SBAW+26uHx1x6dluleY21kj/anS0MtaMpiCC2YV1goYnRI1GCqZwdlcqIzt9P/nbQGP8VMwEfQlYl
	oXfK9bUaWkBjLv0BSOvfIHtQeiPdzU9A/4DKyUbht7GxfsAiCsuZOX+P5/2f3vdOw+Lfdt1AxZWw7
	I23GyxqQOr6Qijb2/85pWS0mwaBwg08xcZ52J9JhmQGR55ZBMo4dHx0Xk9iGUTfh3vsdn8J0aSTAC
	G2zAhChg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peKZQ-00AB8b-0m;
	Mon, 20 Mar 2023 18:49:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peKZM-00AB6M-1D;
	Mon, 20 Mar 2023 18:49:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 934CF617B8;
	Mon, 20 Mar 2023 18:49:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99AAFC433EF;
	Mon, 20 Mar 2023 18:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679338159;
	bh=CZ1ZHhw3PAwUSr1RFLcjb3EwDHIuncqBo8djo22GoX0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=EYP4qmc6qfu6EjAznMtGQhzvJWIyu3VfimKLlctzdcfkx90GWy1byGmGknYl4Wy5g
	 f+OLUhEcWq38tykmJqJIVnJz28QPzTaDnJ6XIYxqlkkp+9L2WfLHuAXUFWnBl5fsGx
	 vVlpIjPg+eps9cXh5RCYhPtsN+fzjAfxxyGhriaE+Agzrw6x5xDP+/cxv++/m3krAL
	 10jcJcCFpfXnnqwkt5hSPWszQX0vG7p+Eaw4x7M1nSqDFRZYaA6zPrTgxkQpLW1txu
	 Mnw2mcHnjmIvUVv9qyzJ9JAlzkduVPg+8OWsNvJv0HSL8W707B0ZYzsevQ0j3gwXua
	 oC8ObwL0L1waA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Support Opensource <support.opensource@diasemi.com>, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Saravanan Sekar <sravanhome@gmail.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Florian Fainelli <f.fainelli@gmail.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Robert Marko <robert.marko@sartura.hr>, 
 Luka Perkov <luka.perkov@sartura.hr>, Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 chrome-platform@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, patches@opensource.cirrus.com
In-Reply-To: <20230317233616.3968003-1-robh@kernel.org>
References: <20230317233616.3968003-1-robh@kernel.org>
Subject: Re: [PATCH] regulator: dt-bindings: Drop unneeded quotes
Message-Id: <167933815234.201304.14593009652707828902.b4-ty@kernel.org>
Date: Mon, 20 Mar 2023 18:49:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bd1bf
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_114920_455905_184C1EB2 
X-CRM114-Status: GOOD (  12.83  )
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

On Fri, 17 Mar 2023 18:36:14 -0500, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: dt-bindings: Drop unneeded quotes
      commit: cff5c895137cb5c3d48811881f111b17c444e2d5

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


