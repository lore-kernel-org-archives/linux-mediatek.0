Return-Path: <SRS0=A00R=PR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3E26C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Oct 2021 20:55:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0C3561075
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Oct 2021 20:55:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B0C3561075
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZgrzNYrDMLFkHyxHS5ErDpjPTZLzZB+MlJFxSq3lzGI=; b=ZRHR2A5gnCawRh
	dPAvFwmoSoc3RsdnVNX0De8v4eNxODcRivDAWodpzmLyADzdWWiTQ5qUAMsf4B35AwjqCiwL2Rym5
	AfQfr+kNCW69YLJcML+ERu2DW5eWKUEuMAW6YBVi8a7jNLJJoSPQYGL/sqNDqmbVvfv8PagkVW188
	sYLwv8XeCGnBoaiS5mTu0H3gdz5OKCu4pxxY3gPmpvDxtGi1wRY3LiKmqo37n580regNboP4wuwE3
	AEhwDJokWeUyTTJx3XXlsI6o26RDyTim1ntvPVuF60NjSi6jHTMKpWbkUP2AOAWm7fk0SFjOR2/kE
	hNB1D35VAayw4wP+MnFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgYu1-00CKot-VA; Fri, 29 Oct 2021 20:55:05 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgYtp-00CKnN-GY; Fri, 29 Oct 2021 20:54:54 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4C58861040;
 Fri, 29 Oct 2021 20:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635540893;
 bh=qt4og9Fk7MtpFFfEOnHKFzZTdGtwK1yfX8BOnwu7CqM=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=fX1QFv7/QAAsW97/KCa5wDhm8WTFalr/iCJWWYJ0pjCll+Ky2CeOdXDARLGi/sa1L
 459epb3y2pxuNLu54AVIle9ZWWv8evknCLiVqXRuAcHWcDeKyWnjsoD92WUJ4WPOz9
 UzG8pkcPteVm5mnXbGsnkYGRFEg6khMG3sixGm3tLL+vHr1WyASVngxmta3bpYA75G
 C2D5YwEA3eFUt7Hvs+tUczXLYJYAmiMnQaMb2u4HbZnSDprXkExwVDK+HLv7vqG0bp
 Gf0WoQbBG/bJHTXvpxae1wb9U6a1tYqSR54bERK2sRQlHi/E+gsLRas+9y8QtQhpDd
 JQDD/2IH/4e6Q==
From: Mark Brown <broonie@kernel.org>
To: Trevor Wu <trevor.wu@mediatek.com>, matthias.bgg@gmail.com,
 robh+dt@kernel.org, tiwai@suse.com
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, aaronyu@google.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20210910104405.11420-1-trevor.wu@mediatek.com>
References: <20210910104405.11420-1-trevor.wu@mediatek.com>
Subject: Re: [PATCH 0/2] ASoC: mediatek: Add support for MT8195 sound card
 with rt1011 and rt5682
Message-Id: <163554089106.1997146.15357204802778257361.b4-ty@kernel.org>
Date: Fri, 29 Oct 2021 21:54:51 +0100
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211029_135453_602509_F5A57FEE 
X-CRM114-Status: GOOD (  13.05  )
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

On Fri, 10 Sep 2021 18:44:03 +0800, Trevor Wu wrote:
> This series of patches adds support for mt8195 board with mt6359, rt1011
> and rt5682.
> Patches are based on broonie tree "for-next" branch.
> 
> Trevor Wu (2):
>   ASoC: mediatek: mt8195: add machine driver with mt6359, rt1011 and
>     rt5682
>   dt-bindings: mediatek: mt8195: add mt8195-mt6359-rt1011-rt5682
>     document
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: mediatek: mt8195: add machine driver with mt6359, rt1011 and rt5682
      commit: 0261e36477cfa2608468c1300e30cb667c5e1269
[2/2] dt-bindings: mediatek: mt8195: add mt8195-mt6359-rt1011-rt5682 document
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
