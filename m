Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 872D7C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Dec 2022 13:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WWq8c4X0wTwa9D+MtK9E3e6717+lCzuV67S3Ts9era8=; b=qR/qHlpCxbpdSGB6Rh8BvCvqut
	5oeRSUw7okYlUBGv4kQdTaoftAQNoSGAXavhdMnWzVmP5IYQbeOzMody91cvB0mmZFuqcbiQiC/U7
	03chUhun5XppFSzwuaVxIEFyOMpAwdIJPUqH6luP7A0DyANeuyHANybstybK3JsbIEkvU8wqoC8+u
	U7F+ZtTgwTtYY2nqlS4+xKDrXmf6ZIEK3L1wID83iiKP95CoU8ehXTrN4SCXGwF4g6ZvdmKVUGU9F
	0EgE2QZFFg4ISthjkxx4trpctCOcxAV559VX54zMSiAAr0ee4GJnkhszgFruP7ja9FTne3qpdZkC+
	vnNGa6Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5Rwk-00Gqx2-RO; Wed, 14 Dec 2022 13:37:18 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5Rrp-00Gn79-Jk; Wed, 14 Dec 2022 13:32:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 78AABB818B4;
	Wed, 14 Dec 2022 13:32:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A0F4C433F0;
	Wed, 14 Dec 2022 13:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671024728;
	bh=MphwCkdn5QeL6NXAHvFCBDgfGRjYo4fTYVGRBnJWEds=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=cIOEbsqRHqjMOlAPyTV/Ir2Y0AEY8qo8+9DDbN37lq0TrAIjYb0GrhgS//Hn+/2fL
	 bO8gIZT+JpDLcB1pT9QPRMpWyIrbDMVZEAeI5J2jfbTA9Jdg6oAcBgnGKfFfbc9B5K
	 tWFDEHn7zA09v/1f4yAVdAuh1bMtNweT9F6ShleOUozzvI1MD4z4uPX0t27NsxvciB
	 vgK+PyI52BJ2JwCPcBgPSyr65TNsak8L60vEq6+3WzupSVI89es1kVTzP/u0y4mTfB
	 P2PLIBUfjGaPWBMqCB6F+fUug+q9Kw4wbSU1A7vvjQhEmYO4P3lY3eekb9r8l2MStC
	 eEYWEou34JQTw==
From: Mark Brown <broonie@kernel.org>
To: YC Hung <yc.hung@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tzung-Bi Shih <tzungbi@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Trevor Wu <trevor.wu@mediatek.com>,
 "Nicolas F . R . A . Prado" <nfraprado@collabora.com>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Curtis Malainey <cujomalainey@chromium.org>,
 whalechang@google.com
In-Reply-To: <20221209031053.8444-1-yc.hung@mediatek.com>
References: <20221209031053.8444-1-yc.hung@mediatek.com>
Subject:  Re: [PATCH] ASoC: mediatek: mt8195: add sof be ops to check audio active
Message-Id: <167102472482.27755.57467344519009874.b4-ty@kernel.org>
Date: Wed, 14 Dec 2022 13:32:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.11.0-dev-7e003
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221214_053213_852217_37F06150 
X-CRM114-Status: GOOD (  12.85  )
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

On Fri, 09 Dec 2022 11:10:53 +0800, YC Hung wrote:
> In MT8195 SOF design, both DSP and audio driver would access audio
> registers. Before DSP accesses audio registers, audio power and clock
> should be enabled. DSP will hang up if DSP access audio register but
> audio power and clock are disabled. Therefore, we add audio pm runtime
> active checking before accessing audio registers in SOF BE's callback
> hw_params function to avoid this situation.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8195: add sof be ops to check audio active
      commit: 83f1b7f39af73b01edf098fe3141404670703281

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

