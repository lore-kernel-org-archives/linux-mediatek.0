Return-Path: <SRS0=5OX0=OD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1A9EC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Sep 2021 10:55:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B58776103B
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Sep 2021 10:55:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B58776103B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F3hhiOBTxN+IZhO0vgYy87QiGOpCO5VAQGvAhYCbnmc=; b=p1AlvBhM+vZnQt
	8PALPMKU9D1NjRYSl9SNa+PpW+nG/qTsZNp/IsT3PTm7cEGMEwvE1lT3wZuqhTAWGCTxJkAmiqwXH
	+tB3d9BQI5EdQC76O+ZLscZRwsncnToQkHA0XljEWYvukOhOPo2Qpu+NqROwomTJyhRywADr6bfFD
	316axWJYe7dW4TJ3kaN+ahedJDNZJFlGejnjMBYcfd7KV4u7xlBFTpPauTHEUtR5lkDSGBGoOOJrc
	8fZBC9rD2Xjx/ieKMoO0ta6fRIrB6uxIFfWjUpuW9DpBiP9sIA2YBevP3G8n9IAZPBYZOjPCQWZPT
	mAN4dMTk2vQHV5lS3JQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPjcl-001OsW-M2; Mon, 13 Sep 2021 10:55:43 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPjcL-001OgU-DY; Mon, 13 Sep 2021 10:55:18 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 99AEF6103B;
 Mon, 13 Sep 2021 10:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631530517;
 bh=AkP0jovDemSFw2EtzAagzgwX6j/fQza8GDVZEvdK4KU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kwiRISb7qm2rF6Qf3xhnl9h2vkzcF22YRJ6DEgqXM0Jmprw1wEy0RiF2IySCSWFB8
 4feuhLfIajRQqgCnpkBoKP9VVOFLZwWfHZG+Wn6RanhDKoydLprdoKv4us5v31N6ut
 IUO+YOGpXQDts3AqW7EgXrpLy+Bw4Dntp1RVtZsn9rRf0o5hufCTbivpRQrab/RP1r
 03gjbq6TaakJulvNVbl7V+hyOn+4i7Jcjlypzu/TQd/i1Le8e922lkexi8WJLQIGNk
 bv5ku+5uD7r4D1qFAFuDaDW9UI8wIXqBFAszISN3utlBIRToRYpB5+MnWzE6CpW6gA
 k7zuQrxsr8o+w==
From: Mark Brown <broonie@kernel.org>
To: matthias.bgg@gmail.com, tiwai@suse.com, Trevor Wu <trevor.wu@mediatek.com>
Cc: Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] ASoC: mt8195: remove unnecessary CONFIG_PM
Date: Mon, 13 Sep 2021 11:53:29 +0100
Message-Id: <163152996583.45703.15399781135133859191.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210902071440.6087-1-trevor.wu@mediatek.com>
References: <20210902071440.6087-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210913_035517_522096_417C90A3 
X-CRM114-Status: GOOD (  11.62  )
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

On Thu, 2 Sep 2021 15:14:40 +0800, Trevor Wu wrote:
> The unnecessary conditional inclusion caused the following warning.
> 
> >> sound/soc/mediatek/mt8195/mt8195-afe-pcm.c:3260:32: warning: unused
> >> variable 'mt8195_afe_pm_ops' [-Wunused-const-variable]
>    static const struct dev_pm_ops mt8195_afe_pm_ops = {
>                                   ^
>    1 warning generated.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mt8195: remove unnecessary CONFIG_PM
      commit: 2b9b42c847b83823527a497c323e74d2efced721

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
