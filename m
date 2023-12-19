Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F1F9C41535
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Dec 2023 18:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b/W7/aZxha7m2nzXiZyiT6emNWaz+AV5it5qsyI5mzM=; b=NnzVb5XNSftzXdEjrIUVE4NAaP
	ocmkk61dy/Uq3xDDuAzHJQ7IpWhjJ1TYT44ApRyfWns+8PeR5syRnVyGgwKExjDE/L26gnvcw3Q0C
	tmIW86W34jQcyjL8UkRws+ElE6QbWMmdqZPHd7HE5RtuFEl2w9W2tHH/6DnqgRJdQ0hsbSgSGUOPN
	7C6dCRWCFujVTkh0C5vFpmdnVnYqaebuLNJESUOMGyAx05KDshhbE6Uln9wFjb7Co/EqdtYOz3oPm
	BqUCWgHDIZhsqBib8jVb+7o5ojBNimi9nKPWak1u4ygX98poN/zHq+Fpm5rVIvnjxE7SpL81mHgSb
	xLPrYSeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFeUW-00F81v-39;
	Tue, 19 Dec 2023 18:06:52 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFeUT-00F80B-2Y;
	Tue, 19 Dec 2023 18:06:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A80E9CE1AB7;
	Tue, 19 Dec 2023 18:06:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43950C433C7;
	Tue, 19 Dec 2023 18:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703009207;
	bh=IWT2Spi6n0YyBL0I+YwiyQRgCtOdqTF4PJPYvAzCjzY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=R9CH5/2NspkbtdqFagwiq5zBc5sVYhM42iB3WpampU9sH7ckPux2kVwx236hn98e1
	 74Xx/Oem6yQi+an/Rx/rmNxigMcM73wA889coHTybKA7z28ovoJS6FiADhu5q+tLSc
	 olJ8QRrOOHuHYohzLBQEXx42+Dtmij7U2GlVEvJrcxu0Ew4vSdJG38lpIxxi/XrOu6
	 jLgtru4XMquwVV//KL8WNVxNWphIIUxKO1j1vW1P3Kkynx1Cxui9DNnTpMbistCujw
	 yw1C8n7D59VUplKbTbv+jbyxDxXamF2GNszgVcJzudVL1Vv5eIfNHV3SJW7Holopbw
	 fQ5s+Ftcd9L0w==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, robh+dt@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 perex@perex.cz, tiwai@suse.com, trevor.wu@mediatek.com, 
 allen-kh.cheng@mediatek.com, kuninori.morimoto.gx@renesas.com, 
 Rui Zhou <zhourui@huaqin.corp-partner.google.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20231212123050.4080083-1-zhourui@huaqin.corp-partner.google.com>
References: <20231212123050.4080083-1-zhourui@huaqin.corp-partner.google.com>
Subject: Re: [v9 0/4] add es8326 dt-bindings, commonize headset codec API,
 es8326 support and Enable dual amp for rt5682s
Message-Id: <170300920399.125466.9978354781339951707.b4-ty@kernel.org>
Date: Tue, 19 Dec 2023 18:06:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-5c066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_100650_054320_7F6E21F7 
X-CRM114-Status: GOOD (  12.67  )
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

On Tue, 12 Dec 2023 20:30:46 +0800, Rui Zhou wrote:
> Add dt-bindings for es8326 and codec es8326 support.
> Remove duplicate code, commonize headset codec init/exit API.
> At the same time, Enable dual amp max98390 for rt5682s.
> 
> Changes in v9:
> - PATCH 3/4: Add comment for MAX98390_TWO_AMP.
> - Link to v8: https://lore.kernel.org/all/20231208070933.720324-1-zhourui@huaqin.corp-partner.google.com/
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: dt-bindings: mt8188-mt6359: add es8326 support
      commit: ea244b35a4da60a92d0e3be528f82ebcbcf10753
[2/4] ASoC: mediatek: mt8188-mt6359: commonize headset codec init/exit api
      commit: 1a268000b03a162bd5feb7fce1c130f1b31602b5
[3/4] ASoC: mediatek: mt8188-mt6359: add es8326 support
      commit: e794a894427b1d64f2ebff24f003c60373d68c2c
[4/4] ASoC: mediatek: mt8188-mt6359: Enable dual amp for mt8188-rt5682s
      commit: 3423c3db22e9213acd279ff3800bb1e91aa2ac89

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


