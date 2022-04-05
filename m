Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99A57C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Apr 2022 09:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EmOkfgvkIbgCWxJVcss1myJ5u2Xc0dK9d6r8CiWdF2k=; b=LmtcHyEhWNmZxl
	FDKev9/sJQrWjc/8u5ZrAKqoUgfSYKSoSJo6QXItsEHLmqYj4DtzvqFfzWLLBOySOSgSnF084+zn6
	RgrP34q1KMtqE3wPKHlEUmkUUonFXfSzSMOKGTKzrBEnrqnT2Sce+AxPdyVChOP7OUCdtwgrtZN5c
	6wR1t/wj81ueKWKdozEUGUdybx3WA3KGTFUMhE1/mUCt25O/gDvHerJmj0iOHhQBEscf7M3DrMGY/
	Ehh6nOo02bfNoNiFaR0SICVgGCrinNjPWTWGzTSAVFtWaU0O6tvc4za4rBq3Uk0vtgCpCNja+0/hj
	BZofDG991k91DjmeIlXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbfX1-000Pue-Lg; Tue, 05 Apr 2022 09:31:23 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbfWn-000Pnh-Ao; Tue, 05 Apr 2022 09:31:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 619ACB81C6E;
 Tue,  5 Apr 2022 09:31:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81404C385A2;
 Tue,  5 Apr 2022 09:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649151066;
 bh=YypSHEp1rOHcihtmVFUWRUSVBqn1rhBtj2pQDDhyoOI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=OQgUIMa2+Jl5ZN/tEN/rPzkKmhEaurR5d+v0K2yZR31kmlkdJkgvJ1UiBhBzt5RSM
 ydqLwdVnexufAh7HFSeU/S0f2WHs6PYKrJOB1GpykjS42ntFc3btzZzVpLYEU8V481
 5xnHiBquaMN7puc//Amlvcf2iRbUseZUCom+xKF66Nm87x/vy11Phosp0dENqtVdkG
 WkgGsQd1vJpfhYNB0H0g8IcYzxPeMSwSGV1XxmNF3AtxqaHR9nCMjA6iQ+TduCEobD
 z/Dt03CLIwASXP+0esQU+i1N9gdzwE5cTKsr/P7p7sOhaxmLVUNB7FtbmJC7ECnRTw
 yeHets5eAbOyw==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, trevor.wu@mediatek.com, robh+dt@kernel.org,
 matthias.bgg@gmail.com
Cc: aaronyu@google.com, tzungbi@google.com, linux-mediatek@lists.infradead.org,
 yc.hung@mediatek.com, angelogioacchino.delregno@collabora.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 alsa-devel@alsa-project.org, miles.chen@mediatek.com,
 devicetree@vger.kernel.org
In-Reply-To: <20220324053851.27350-1-trevor.wu@mediatek.com>
References: <20220324053851.27350-1-trevor.wu@mediatek.com>
Subject: Re: [PATCH v4 0/6] ASoC: mediatek: Add support for MT8195 sound card
 with max98390 and rt5682
Message-Id: <164915106325.276574.14625118005435337786.b4-ty@kernel.org>
Date: Tue, 05 Apr 2022 10:31:03 +0100
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220405_023109_557009_19B9C820 
X-CRM114-Status: GOOD (  16.04  )
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

On Thu, 24 Mar 2022 13:38:45 +0800, Trevor Wu wrote:
> This series of patches adds support for mt8195 board with mt6359, max98390
> and rt5682.
> 
> To prevent from copy-paste components, mt8195 machine drivers and
> dt-bindings are merged in the patch.
> 
> Patches are based on broonie tree "for-next" branch.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: mediatek: mt8195: revise mt8195-mt6359-rt1019-rt5682.c
      commit: 4dbc714fe07641e7a07731f82152448ef09f3002
[2/6] ASoC: mediatek: mt8195: merge machine driver
      commit: 094e30efa444a118a535cb67ec000bbee9f8d150
[3/6] ASoC: dt-bindings: mediatek: mt8195: merge mt8195 machine yaml
      commit: dc16399078aea4c98f17aa99f0cdea9d5ac9c4a9
[4/6] ASoC: mediatek: mt8195: rename card controls
      commit: 3a0323c26c6720447fd5eff6495c1aea514b77d5
[5/6] ASoC: mediatek: mt8195: add machine support for max98390 and rt5682
      commit: 86a6b9c9dffff1bd653d582cfc5138da75e5f7b0
[6/6] ASoC: dt-bindings: mediatek: mt8195: support mt8195-mt6359-max98390-rt5682
      commit: cae34da5323b6ce4d0dc365d1b971f838dcff318

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
