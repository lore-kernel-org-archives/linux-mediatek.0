Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B93E1C54EE9
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Sep 2022 16:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yWXSG4Yli06kSi42oAtuHhgepB/kOSDoGFF2eOgHVK0=; b=NE9pHCcpHfmJROd0nKhXAyRlDr
	W50Hmjgpge3fnmxKrlagfA7CiJWSH0s7nrQB+467Fw/FeIilETMJPG7hcr/VSBm2Bh8shpEqf7dzZ
	tSwtI3Bw42Sw7REU89VuQoRNsLdK3GtRr7lnjiVBuGVxkj4Z0iNnSuAhXZxqFgW9fqyDF8t5NykyX
	dTZyM8h9SXFsh0q0E++Ka09YASB/NDWaEyB3QVPm4zAeHB7MN4Rwk6Pu+jf5AgNWmPz6amoHt9k/g
	WwTZE/kPt5a7TdYHJWhjrRrvV12UB6UtuTPpEZ9kl8Cc+LSmog9LoIMg6PnlT2iKSNS1zchJWgJfZ
	SbTQ0PSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY8Xt-00D7mg-J4; Tue, 13 Sep 2022 16:13:57 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY8X2-00D6zv-V5; Tue, 13 Sep 2022 16:13:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 32264614FA;
	Tue, 13 Sep 2022 16:13:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25259C4347C;
	Tue, 13 Sep 2022 16:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663085582;
	bh=PG0muHFwpwSU/4bNe3BCzAEY7GVjsF3WIAKqtwzCkSk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Du/ntLa7sphhQazStEIJb2YN/ATuWn2pLiL7EUcerVj8XfCHo3n3gHGs+el6h/Cn5
	 +uNJbJucIUEg/mkHdFroh/hlMx83VvN/r1LP+EJBFk9o7byDzlO9vvOLF3CbDZ6jqO
	 66IbCXDW93Y9AMHM7jjyxRd7YxAjor+ge1XbR3E6USojQcK/sCu3pnTVhNPpV0BSY6
	 4lOwUtFUqJ8/S0fAPfTk79p8mGZSlVWiFlsob53ZeNG8Glvw1fymc1+I45ln91VNsb
	 s0Hnt3zidFOLydNiq8lZGVC5j4qOyvFrobRplDbfNJW3yfphZ7ejCORyODS6cs9Wkt
	 f76CmYFOTn2sg==
From: Mark Brown <broonie@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>, Nícolas F. R. A. Prado <nfraprado@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, Tzung-Bi Shih <tzungbi@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-mediatek@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, Takashi Iwai <tiwai@suse.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 devicetree@vger.kernel.org, kernel@collabora.com, Chunxu Li <chunxu.li@mediatek.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Miaoqian Lin <linmq006@gmail.com>,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <20220908161154.648557-1-nfraprado@collabora.com>
References: <20220908161154.648557-1-nfraprado@collabora.com>
Subject: Re: [PATCH 00/10] ASoC: mediatek: Set i2s clock sharing from machine drivers
Message-Id: <166308557689.242391.16022261619344306074.b4-ty@kernel.org>
Date: Tue, 13 Sep 2022 17:12:56 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-7dade
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_091305_157867_1E42232F 
X-CRM114-Status: GOOD (  17.53  )
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

On Thu, 8 Sep 2022 12:11:44 -0400, Nícolas F. R. A. Prado wrote:
> The i2s ports on MediaTek SoCs only support a single data lane. In order
> to achieve full-duplex operation thus two i2s ports, one for input and
> one for output, need to be used together and sharing a single clock from
> one of the ports.
> 
> This clock sharing setting was previously read by the sound platform
> driver from the devicetree, but given that the input/output pairing is
> closely related to which codecs are connected to which ports, the
> machine sound driver can infer and set it, so that no DT property is
> required.
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[01/10] ASoC: mediatek: mt8192: Allow setting shared clocks from machine driver
        commit: 8ae4fcfd5b11b5c33154732fcad99ad0f5843ce2
[02/10] ASoC: mediatek: mt8192-mt6359: Make i2s9 share the clock from i2s8
        commit: 3ffb9fa3963964a730c34f48e502ac0625efc145
[03/10] ASoC: mediatek: mt8192: Remove clock share parsing from DT
        commit: 9ccd51ce396a46d9d4d0c87aa6a82dd26a2f281a
[04/10] ASoC: mediatek: mt8183: Allow setting shared clocks from machine driver
        commit: fea84890e5c1fb65ae8e25b2f9b86363af1f45f2
[05/10] ASoC: mediatek: mt8183: Configure shared clocks
        commit: 4583392a135cc30409f5a6ceebb8374e550b03e0
[06/10] ASoC: mediatek: mt8183: Remove clock share parsing from DT
        commit: cbebe67859a0e8d51e578fdd9f927f8ef2504ba4
[07/10] arm64: dts: mediatek: kukui: Remove i2s-share properties
        commit: b3821f7839c2ec322926d16557aff29f4be1f4dc
[08/10] ASoC: mediatek: mt8186: Allow setting shared clocks from machine driver
        commit: 4132a778e806f77c2bd01a9a34b07edc9dd99d76
[09/10] ASoC: mediatek: mt8186: Configure shared clocks
        commit: 9986bdaee4776c5d595933cace9d54c6bc084e91
[10/10] ASoC: mediatek: mt8186: Remove clock share parsing from DT
        commit: 62da80c6a124dd68b12c4d2197ecc74b79823571

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

