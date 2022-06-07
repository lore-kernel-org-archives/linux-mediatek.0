Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D340BC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jun 2022 10:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8lhA54nKZo+YqKT5apIHn/dLx02TRc8PDgKzfASB488=; b=1E5AEnr/W3DOA4
	qP+imyZ1dKV2147iCdtz9CKywye9Sap4uMYxm4Uxq/2tRtblR82bknlh7f5gbBHQXJBfHe5hx968e
	+rzWIzE/C/J3pohEcuypslHmDCzAe8Agnw5kyuOgwaUeg8C4ShRWZYFPGqmbUS6S9+qfiEZrKQKys
	aNAJq/XwhlHY5aqq1Z/retPjdAVc1Xv95Z1mzJ1hTcXpgAHUyJDPVo5Ms22ylMJR75EL1MSjK5mt0
	b9C2ygFuhNGGxrsNNtwk9PPCgM2Rh+EkrAwIAIZQImOipX2oQYMRKSrG7WgNMJxKR3vUYrxMKSFsx
	wc29hlm+3+oVImO0rk9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyWtR-006sIO-Db; Tue, 07 Jun 2022 10:57:01 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyWrs-006rdW-Hh; Tue, 07 Jun 2022 10:55:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 297BEB81F01;
	Tue,  7 Jun 2022 10:55:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 224E2C385A5;
	Tue,  7 Jun 2022 10:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654599321;
	bh=5JaZ8fuFAsCs3zwfgmDiaQbX9q96F/m3qVELfXvKhnE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=qXg2Eg9uNjPunE55sZ+BYMJ5NTmO6e4w5ByJadfTdStS0+FZjNCqBowUi+6KqvBos
	 JS6jGOP9QNpAodD2mbEStUZdH25C2vWJn0tzp+BTevWrJJp+r+/SjQz+tcPza6VckL
	 B8416lH1ZvjJR5BuckGw7yqkpyq9FEIE095V1z+wU2PqVI1nQ1f9OWWcvKQ1PQ+2aP
	 nIe6QJK0cTSo4R4wJIW/4OKlXCv2y9R/Ie6dxoslCxh8Bd7gioxNdB27ULvAehleCF
	 /zgpb575z90pCyBNr2gD86eS3vvVKc7+2fHKBP38j7CH4pn6gaJoL8qns5iOjyaPj+
	 R94JgD9oKxLzA==
From: Mark Brown <broonie@kernel.org>
To: robh+dt@kernel.org, angelogioacchino.delregno@collabora.com, jiaxin.yu@mediatek.com
Cc: linux-kernel@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com, devicetree@vger.kernel.org, tzungbi@google.com, matthias.bgg@gmail.com, trevor.wu@mediatek.com, julianbraha@gmail.com, aaronyu@google.com, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org
In-Reply-To: <20220523132858.22166-1-jiaxin.yu@mediatek.com>
References: <20220523132858.22166-1-jiaxin.yu@mediatek.com>
Subject: Re: [PATCH v5 00/20] ASoC: mediatek: Add support for MT8186 SoC
Message-Id: <165459931885.399031.2621579592368573898.b4-ty@kernel.org>
Date: Tue, 07 Jun 2022 11:55:18 +0100
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_035524_926269_BFC9E30A 
X-CRM114-Status: GOOD (  17.71  )
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

On Mon, 23 May 2022 21:28:38 +0800, Jiaxin Yu wrote:
> This series of patches adds support for Mediatek AFE of MT8186 Soc.
> Patches are based on broonie tree "for-next" branch.
> 
> Changes since v4:
>   - [v5 07/20]
>     - remove unsusd controls
>   - [v5 09/20]
>     - correct indent error
>   - [v5 10/20]
>   - [v5 13/20]
>   - [v5 14/20]
>     - fix the return value if the value is different from the previous
>       value in mixer controls
>   - [v5 17/20]
>   - [v5 19/20]
>     - correct the compatible name with '_' instead of '-'
>   - [v5 18/20]
>   - [v5 20/20]
>     - correct the yaml after 'pip3 install dtschema --upgrade'
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/20] ASoC: mediatek: mt6366: support for mt6366 codec
        commit: 612c4695e312c753a8b06f6b052cea3d8338e3c3
[02/20] dt-bindings: mediatek: mt6358: add new compatible for using mt6366
        (no commit info)
[03/20] ASoC: mediatek: mt8186: support audsys clock control
        commit: 58949aa35c0f74a98b03864817354d85f452a51c
[04/20] ASoC: mediatek: mt8186: support adda in platform driver
        commit: b65c466220b336f5044c1be75ebc771d087ee7ca
[05/20] ASoC: mediatek: mt8186: support hostless in platform driver
        commit: 55cac93d271166a2aa431d453bf31fdcb19bd5e6
[06/20] ASoC: mediatek: mt8186: support hw gain in platform driver
        commit: 2567ccae9105cbc881828f2ea09954c1b5fd975d
[07/20] ASoC: mediatek: mt8186: support i2s in platform driver
        commit: 2907d261276e09bd84fdc8bad35930a046a99d4d
[08/20] ASoC: mediatek: mt8186: support pcm in platform driver
        commit: 920508f9fe2fc90f19916d74f4c23088030d32e0
[09/20] ASoC: mediatek: mt8186: support src in platform driver
        commit: e118015db7bd0dad1744221d0fe18333ebf9c622
[10/20] ASoC: mediatek: mt8186: support tdm in platform driver
        commit: ae92dcbee8b6a6f63198a2a6fea0fc9f6a0fe07b
[11/20] ASoC: mediatek: mt8186: support audio clock control in platform driver
        commit: 55b423d5623ccd6785429431c2cf5f3e073b73ba
[12/20] ASoC: mediatek: mt8186: support gpio control in platform driver
        commit: cfa9a966f12a91a269e50f1c3237c006ffe2ee9a
[13/20] ASoC: mediatek: mt8186: add misc driver and register definitions
        commit: 80d8cad2e9ce21517d50c7084c12a59d38a778f7
[14/20] ASoC: mediatek: mt8186: add platform driver
        (no commit info)
[15/20] ASoC: mediatek: mt8186: add mt8186-mt6366 common driver
        (no commit info)
[16/20] dt-bindings: mediatek: mt8186: add audio afe document
        (no commit info)
[17/20] ASoC: mediatek: mt8186: add machine driver with mt6366, da7219 and max98357
        (no commit info)
[18/20] dt-bindings: mediatek: mt8186: add mt8186-mt6366-da7219-max98357 document
        (no commit info)
[19/20] ASoC: mediatek: mt8186: add machine driver with mt6366, rt1019 and rt5682s
        (no commit info)
[20/20] dt-bindings: mediatek: mt8186: add mt8186-mt6366-rt1019-rt5682s document
        (no commit info)

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
