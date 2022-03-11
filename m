Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C29A1C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Mar 2022 20:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VV6XWKvK13KNJiFjoaIySRafrR0wsbSSRMTJmSC9F+0=; b=u66HNioeUiLJjW
	HZbMVo0IAiWLHgvXLE83BTWvhbgfRe6JDLZS+hjI6NFx28Pm5zbg4PMQCm8K89M8cImY73r6yUDT+
	qa5OiGjqQ5XyNekhJzhL2s2I+I7VRhgj15+FGgasB57DoqSyQOlw/okNxVFB6XFgGhYoNHruG5IWr
	vG40T+0gpNjnr7TRcF56a/Rp3LNiVtjs2IDRlBVovOGvhRrniPYZigdtAzD8e9Uj7yN65cNbLvWkp
	SVImcD+YMBImg2DIy4ljlZHVOto8zsOfWlFl8N09NNfn+fwg74f7wjHZcFhsi+MSIxjE/YP4RgnUA
	t9ZSZ/AUs3/ErDDEOIIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSlmq-000Aq5-NA; Fri, 11 Mar 2022 20:22:56 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSlmb-000Al4-K6; Fri, 11 Mar 2022 20:22:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D4024B82CF4;
 Fri, 11 Mar 2022 20:22:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E7A0C340EC;
 Fri, 11 Mar 2022 20:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647030158;
 bh=ij5VNrvsFSwVimJAGBzflRTGoXGWzMpxgzmX4BZ5YPM=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=HHNaw7dTrZhU8k9UkXkpKfOG0tJZfuBuqv9Cnw/jdFmXn7Roa1c5D0seA0jWQQE3+
 PPperXekmJv4dIX8v++kZu5+di4c56v490qAun1wq/d2+gvDWT42ko/5Hck3Ac9VF3
 5hroXOwdq3hyDD+PpEvHbgi7iDGJea/QZ2BPhuxIHTAhiTRPVQchCF3adPou0k2X0d
 KCaRlbsFteozlEa0juMWWUChr1gWNL0Py1EA5ReWQuqsP5ireRzSV4ZvjOe5Ka6+e9
 pby/qGRugO9UdzPT6P3j4XCQnHSejOORcX8XORNW+iuIhmeMhyQW5JafYtRWmCx4rr
 9NnHSLA9zMqYg==
From: Mark Brown <broonie@kernel.org>
To: Trevor Wu <trevor.wu@mediatek.com>, tiwai@suse.com, matthias.bgg@gmail.com,
 robh+dt@kernel.org
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 aaronyu@google.com, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 yc.hung@mediatek.com
In-Reply-To: <20220308072435.22460-1-trevor.wu@mediatek.com>
References: <20220308072435.22460-1-trevor.wu@mediatek.com>
Subject: Re: (subset) [PATCH 0/5] ASoC: mediatek: Add support for MT8195 sound
 card with max98390 and rt5682
Message-Id: <164703015624.264137.9730451216130586080.b4-ty@kernel.org>
Date: Fri, 11 Mar 2022 20:22:36 +0000
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220311_122241_845180_F91DCA8F 
X-CRM114-Status: GOOD (  16.39  )
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

On Tue, 8 Mar 2022 15:24:30 +0800, Trevor Wu wrote:
> This series of patches adds support for mt8195 board with mt6359, max98390
> and rt5682.
> 
> Reset controller is included because mt8195 etdm is used to play sound via
> max98390 before kernel boot.
> 
> In addition, the common part of machine driver is extracted for
> simplification.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: mediatek: mt8195: add reset controller
      commit: f67084148dac015d059c64f25e57abd0ab18946c
[2/5] dt-bindings: mediatek: mt8195: add reset property
      commit: ee7f79a81a27c47088fe0af95788621644826d91

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
