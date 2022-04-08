Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BB72C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Apr 2022 14:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CM5IzfEj9r+J+pLZnkvreUDg6QrO453V5RLZUdRTLpo=; b=IdGUEI7sox/Xq6
	MdHJxXvBJ06ZK7XjHMFEOA+Onerh0jH6GmLX3h34CGJUhHV6haK4GX9OSTYYB5fQDKgFAKKJkz8u5
	jGFTe3AAJu6J7KlxFD0WEvZ7+rfh3zLKQnhO1VLRX+yd9c+Y1hDTuT83AuExmhE2gia7EqYUpbejK
	b5QRc9Kn0R5GkGksRMG8l4OaR1vEkIyrkLY5AIDk7SnpFQPTqTjSbwRmAeZy9zGxqSpEfRtSNwtWE
	C8tgSKJn3Te4hb//Kb2mr067vhA4WnLGdqcsCTiXVIPPwy+d3tOoO7kwWdKV+BHfZS8o6lga4k+bY
	GZedXC8JWQOEFNMnVr1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncptt-0003sT-Ol; Fri, 08 Apr 2022 14:47:49 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncptI-0003YP-Js; Fri, 08 Apr 2022 14:47:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id F30FDB82BA2;
 Fri,  8 Apr 2022 14:47:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E70E6C385A3;
 Fri,  8 Apr 2022 14:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649429229;
 bh=IwyesdrCp1niEjDWDNUAqbKnkJMKAvXX2yXj5TkCb5U=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=jBhtWnLcFL+4IX3ZZTGAVNw1bNVCXHpqkx6yx54N4/PRy24zrnvvbtaiJbmRqfxXa
 RrmrOFf1HgmW1oWzxDGiGNyvp4W7TUH/DThIJOPV6uPcW7Y67gGHD9HokjcTn7Yqod
 s8oFqNiED6ufEOrvibZQYUTjooA/b178HSY/a0/r8pZrtrIzGrdLHB79Aivi59oJvh
 FPggIXpKFyvbzBE9aZb15rxhtzRqDgZuBJ61X50Ifl7/ZG2qRJgxbcymOp+bZH1pox
 iCgKBNgJ2dWymFacuT6u1MrWyYfb7/Y6UAJYdiDFSkxHuOrl9LRBJmxUAcptd3Dmfb
 TC9nJg6Unh+Ig==
From: Mark Brown <broonie@kernel.org>
To: tzungbi@google.com, robh+dt@kernel.org, jiaxin.yu@mediatek.com,
 nfraprado@collabora.com
Cc: trevor.wu@mediatek.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, aaronyu@google.com, matthias.bgg@gmail.com,
 alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linmq006@gmail.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 angelogioacchino.delregno@collabora.com
In-Reply-To: <20220406100514.11269-1-jiaxin.yu@mediatek.com>
References: <20220406100514.11269-1-jiaxin.yu@mediatek.com>
Subject: Re: [v9 0/4] ASoC: mediatek: mt8192: support rt1015p_rt5682s
Message-Id: <164942922666.1424253.184773384356622992.b4-ty@kernel.org>
Date: Fri, 08 Apr 2022 15:47:06 +0100
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_074712_848538_DCD4EA85 
X-CRM114-Status: GOOD (  14.23  )
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

On Wed, 6 Apr 2022 18:05:10 +0800, Jiaxin Yu wrote:
> The series reuses mt8192-mt6359-rt1015-rt5682.c for supporting machine
> driver with rt1015p speaker amplifier and rt5682s headset codec.
> 
> Changes from v8:
>   - fix typos.
> 
> Changes from v7:
>   - "mediatek,hdmi-codec" is an optional property, the code and the
>     binding document should match.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: dt-bindings: mt8192-mt6359: add new compatible and new properties
      commit: 1efe7eca170d344c5101c69ac51df6982de764e4
[2/4] ASoC: mediatek: mt8192: refactor for I2S3 DAI link of speaker
      commit: e1e408e60e856b99782b26308a9dc3937b1ba8bf
[3/4] ASoC: mediatek: mt8192: refactor for I2S8/I2S9 DAI links of headset
      commit: f8910fb4985a00c0a1e6932dc5bda6181c549b76
[4/4] ASoC: mediatek: mt8192: support rt1015p_rt5682s
      commit: 7a80167b08f52e7b5eaa18a9d515efdcff9085fc

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
