Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB42BC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jun 2022 13:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D98n50WIlQfWw2TAcm7VOPc8AvsAF2qLNTb64mYaQ34=; b=W8ud8T4ZZZPopn
	chA7a2ICDz121Cz8Zv1fYl7lODFdsQvU9AfiVCsKwuYAvCBkFwgXAsP9nSTG1kuvP4ABH/lpIKd8V
	Gi5B1G2FhEkMEcFaGjH2iY6JKZRwwwHYuIVZSy96TMRe35Z1x1oj3JwL1RzD7jQKNQghB5FCcVISO
	/mjXyZCYjr2AIHGdP4J+E+JfPUwWkVaO+aLG3lbcnhN0bhPKwCcH/oe3c/SMhX9smCcp0g3+IKijA
	YO73BFQGF4Yr+1IbEtYEpp+Yv6tpvFf1ri6xuG1L8gSI7Z5TvwKbAOYRXm+WyWRJn3sYSFskR6370
	XGrWlzP+hZ1gYmVUJ6TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwOGS-00GF5q-QB; Wed, 01 Jun 2022 13:19:56 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwOGE-00GF0S-1n; Wed, 01 Jun 2022 13:19:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id EB385B819C1;
	Wed,  1 Jun 2022 13:19:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AE54C385A5;
	Wed,  1 Jun 2022 13:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654089578;
	bh=AB7EZgXlN9wIn76rEJlVjIqNkZbMCh4G/EPQNV4hDR8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=RmH1k1IdRE52GGhRi6NwB/MUQcH15odU8MF6mBRtcHhq6b5eInXHD47F/E4obFqIN
	 Nm7y0FRyStwxrARgI4gSk3QyGCsZaGxdBibmuLjl4yVNZHhl6bUaLpPXLov5/Gq1od
	 cRJVdUAeLleeiAaGDGgWqGfiOfuMQT4hN/SVxL9zRUBLvKehwdJRsKJZ9h8rtYH32l
	 V3fIUMiPfaZqxn6czqK9RN8CtP+i3b7Ev8jhm1ge1uN6RVFtmShMdev4+JGLLE0k20
	 WPkvpyLthHchAwCxYajAF/7etV36lh4cpE2BH78R2vbxQO9Fnt8gwWx2tiNVEUOQNR
	 IXj0GM7xPHx+g==
From: Mark Brown <broonie@kernel.org>
To: hsin-hsiung.wang@mediatek.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, lgirdwood@gmail.com, matthias.bgg@gmail.com, fparent@baylibre.com
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
In-Reply-To: <20220529154613.337559-1-fparent@baylibre.com>
References: <20220529154613.337559-1-fparent@baylibre.com>
Subject: Re: [PATCH] dt-bindings: regulator: mt6315-regulator: fix invalid allowed mode
Message-Id: <165408957615.3063838.14643425310508733291.b4-ty@kernel.org>
Date: Wed, 01 Jun 2022 15:19:36 +0200
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_061942_285770_13124EBF 
X-CRM114-Status: GOOD (  13.18  )
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

On Sun, 29 May 2022 17:46:13 +0200, Fabien Parent wrote:
> In the binding example, the regulator mode 4 is shown as a valid mode,
> but the driver actually only support mode 0 to 2:
> 
> This generates an error in dmesg when copy/pasting the binding example:
> [    0.306080] vbuck1: invalid regulator-allowed-modes element 4
> [    0.307290] vbuck2: invalid regulator-allowed-modes element 4
> 
> [...]

Applied to

   broonie/regulator.git for-linus

Thanks!

[1/1] dt-bindings: regulator: mt6315-regulator: fix invalid allowed mode
      commit: 28cbc2d4c54c09a427b18a1604740efb6b2cc2d6

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
