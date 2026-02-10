Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B529EF0704
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Feb 2026 16:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wtYKz9DZ9OmCr2jawKIcM7UjhwlVK2jwWRthCX3yHHc=; b=dYJTQTyFjdZC+fWDKs16th8mdL
	b071wLjpQVtaGJWrjQ6LUaXfYIScd023W5Jz84r6v2jOzos/ayWFfVZkyS11JODTDdVh06EaTpEnM
	A3gGBl3+55MqTnxZNwRLDfLCpjGrCdPj51sxiEw5JKNGMRdUzFp532qgezakdXu5gSSeO7hbH8sKR
	MFEHm5DOv/VV6K914QxnjUHyHErRsCyACOkUFVEhwjcOdV5gz5A5yLt++hh4eZ6tlB6KnRmQeopOo
	oflfIuP8OLqDJZo5qv8Ba1oVMxwTUeDf1/GK0grTzYre5PJ1NAoTkMJD9vk8veVbkrBcrKLTUEZQF
	mAaQkM/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpqST-0000000HDMg-2qec;
	Tue, 10 Feb 2026 16:19:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpqSR-0000000HDLW-0IIV;
	Tue, 10 Feb 2026 16:19:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6C70943DE1;
	Tue, 10 Feb 2026 16:19:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A22C5C116C6;
	Tue, 10 Feb 2026 16:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770740362;
	bh=ZJqOCWTAIrRuyAoY45qHcqTE8451yB5SKL/tec9M0p0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=PDKg51NqNRpnHna5J8H7l2Z7tf3hV15X62gj355S1cPdzhUbCiUzgeiNxctSsuuRR
	 wmSuAX/kHbEdbwLx7OYeSGrLt9QrVelVytwH1aes4yLPxiGUAhmM/fNgKPulVR4Nwr
	 x5+9kTeJn7lZ1CkJHa5TnR+Xa5cX2qbhZO673DcPT1GSgsSqH7d9RsqQbsKuGQ6bEg
	 wa32/VXpIdCucOLuJYbrtqH+wtaBqydJH/GKyh/2/FdnBGNhVbIXbO6sHnnzcot3rW
	 XtzNpRGmurIaCD2K0T8b9ojBJjD/VdYhsl09WqKsZR/zg+o0upVRkVjaMEsPxJSFTp
	 fuuRGtzAVlYTw==
From: Mark Brown <broonie@kernel.org>
To: linux-mediatek@lists.infradead.org, Adam Ford <aford173@gmail.com>
Cc: angelogioacchino.delregno@collabora.com, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Laura Nao <laura.nao@collabora.com>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
In-Reply-To: <20260210053708.17239-1-aford173@gmail.com>
References: <20260210053708.17239-1-aford173@gmail.com>
Subject: Re: (subset) [PATCH 1/5] pmdomain: mediatek: Fix power domain
 count
Message-Id: <177074035936.275824.8148864726689689381.b4-ty@kernel.org>
Date: Tue, 10 Feb 2026 16:19:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_081923_147451_387BCD87 
X-CRM114-Status: GOOD (  10.97  )
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

On Mon, 09 Feb 2026 23:37:01 -0600, Adam Ford wrote:
> The wrong value of the number of domains is wrong which leads to
> failures when trying to enumerate nested power domains.
> 
>  PM: genpd_xlate_onecell: invalid domain index 0
>  PM: genpd_xlate_onecell: invalid domain index 1
>  PM: genpd_xlate_onecell: invalid domain index 3
>  PM: genpd_xlate_onecell: invalid domain index 4
>  PM: genpd_xlate_onecell: invalid domain index 5
>  PM: genpd_xlate_onecell: invalid domain index 13
>  PM: genpd_xlate_onecell: invalid domain index 14
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[4/5] regulator: mt6363: Fix interrmittent timeout
      commit: 1a4b0c999101b2532723f9bd9818b70ffa7580f4

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


