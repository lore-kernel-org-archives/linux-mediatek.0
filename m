Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1C9FEE4997
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Sep 2024 11:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4hlZsBmd042+gTKAAPeUaLJ+KJOfYx5Nlngd9RXoSI0=; b=aCZuSz61lKzqS5l+UnuUoPo7wP
	vA+52lvk/x5Y3Yt741NWIC2FL4nQCDIm/GWAnnCI4SvbOxVIs3Y9UzqKagcAt7kmQpaUHHW0PhF2k
	Gkwmmmwx3A2CHwrtZzY8+SHF5yrKfTJV5nWqAddhbrVCaZ44yJ3tsZYxYhawDau8D3lJIDtHp18Vr
	De4kAjSm0qsP1gRo4L3RtiEGyPFHSisfSt16nCzoH+d7i1XCmt7s+Atat3xXvvLsWJGtPWoBpvNi1
	ZrQADmwInQxfC81P+zMXppVI7FtgKjTxMdgQUkoWPHHkdE0Y/p1iG+AEhJ13r0bxzj4Ks+lArofUc
	98IjrMKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soLNy-00000009Gl3-278z;
	Wed, 11 Sep 2024 11:19:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soLKX-00000009G3J-0QvS;
	Wed, 11 Sep 2024 11:16:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A30355C0235;
	Wed, 11 Sep 2024 11:16:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07E99C4CED0;
	Wed, 11 Sep 2024 11:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726053371;
	bh=+9YGffMsMXeBQxGd6pj0nRY4lcme7KcL7cz/QhK3qLE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=entOCY4gxiGfMjOTEplOiIV50YZLhSpYJf+hbp+c1rABmMT8Fm3JOA37NN6sWNVre
	 ZiCQyRkTnBvSabXXl/xDp/6mq3TS0GUp1aLmuKqBStcOE7TqXw4sa+CB/JISz1ETQr
	 KFYuSXdZsPegF4t0jD9fPEAkk0/QC2+6SVNucBtB9RHRtfNUs2XviYE2KnIyQ9doVQ
	 g3l5PnlzSjHzjd6WinytjPvfuz127sPh3yked0uNggqBaZAM34i2cKmNXIJoI5O6Ed
	 qumfgrZmbYVV/a6/E0G4Y7eAGiTKQCNnZMpPikXvcJ8LoUwRMGfwuJ8eZlDF4nG1P2
	 JoHwd/2hQ86hQ==
From: Mark Brown <broonie@kernel.org>
To: Support Opensource <support.opensource@diasemi.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
In-Reply-To: <20240909-regulator-const-v1-0-8934704a5787@linaro.org>
References: <20240909-regulator-const-v1-0-8934704a5787@linaro.org>
Subject: Re: [PATCH 00/17] regulator: Few constifications of static data
Message-Id: <172605336975.30061.1450890402175817381.b4-ty@kernel.org>
Date: Wed, 11 Sep 2024 12:16:09 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_041613_318579_53CED726 
X-CRM114-Status: GOOD (  11.67  )
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

On Mon, 09 Sep 2024 15:51:11 +0200, Krzysztof Kozlowski wrote:
> Few cleanups (safer code), built tested.  Last two patches should
> probably be tested.
> 
> Best regards,
> Krzysztof
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[01/17] regulator: da9052: Constify static data
        commit: 9653007e7d878609be205ced4803ca57be341845
[02/17] regulator: da9055: Constify static data
        commit: dfa9e708c63e7833c61f551069d3ff4b03af7895
[03/17] regulator: da9063: Constify static data
        commit: 0601c1e5c4a1162c909675233645889237b003a2
[04/17] regulator: da9121: Constify static data
        commit: b3f1e8e32ef579907fe0c0c9c102bb13883454d6
[05/17] regulator: da9211: Constify static data
        (no commit info)
[06/17] regulator: hi6421: Constify static data
        commit: b94afa51cad448d7d9bcb600ce267153132369ad
[07/17] regulator: hi6421v600: Constify static data
        commit: 5ec424afc95ab2490ae28b3e7756e6e9b271a5f0
[08/17] regulator: tps65023: Constify static data
        commit: 7fb636dc26d6fc532fbc96fc74847afedc128154
[09/17] regulator: max77826: Drop unused 'rdesc' in 'struct max77826_regulator_info'
        commit: 653976707d03f9c8e07f1c7733f27c89a1d5eb1c
[10/17] regulator: max77826: Constify static data
        commit: 96d7ee7cb01203ae0b6078631738754424d89cf8
[11/17] regulator: mtk-dvfsrc: Constify static data
        commit: 90b94a05b6cd54b6ae65d09df86d7b602a228ae1
[12/17] regulator: pcap: Constify static data
        commit: 7f1bfca46b1524a774d03eccd8042935c453843a
[13/17] regulator: pfuze100: Constify static data
        commit: 6f4fd2b8a5c08656d293ed491335747ff3d34104
[14/17] regulator: qcom-refgen: Constify static data
        commit: 7eb5d065ec6725d7da9a4f7ba71b6ff4aaf7eb42
[15/17] regulator: hi6421v530: Drop unused 'eco_microamp'
        commit: e9c7ff34c26d009c2f7c3d51236ed5a808dbc0d7
[16/17] regulator: hi6421v530: Use container_of and constify static data
        commit: 7dd36b3287182bc889953f7741bdcef037109210
[17/17] regulator: max77650: Use container_of and constify static data
        commit: c4d6a804713ac080841d1711a98ae1a6ecaede38

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


