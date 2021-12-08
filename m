Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B76DC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Dec 2021 16:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=33LCB/LwkO1Au0IguY8QmOz36kkIMm6DMyuyxXsMSF8=; b=N1O/I8HEVVQhZ6
	EnPIiSxYPAcSN+1SHzPVsT0lWxHoIzl9tx3QG4EJyCGwD8Da6bgTUM24XhLB6Tze5Eshb1PYuf+0r
	RdWCSHkumIGoljwm4tRIvZ6BvXYRj938apTxPYv+mzd+hu9XSTMGQDBFZG15s/g8T5xw8AhrV9SiC
	0gtOjgPVBDdWNIrWHf+7542g7gwR9SUCAQK0dM7vSOU2E0EoOtFRCeA6PbqqQrHTF4vwvume9/Jjl
	Rq1etgtSaFZi16jOzESqZ972Q13Inio1YmJhcjQ+Ip0rVy4X3fLcK093oM6+4VxoWYUVOBtxV68Tl
	555iI5hv24HY74fmV/Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mv05t-00DcOn-HU; Wed, 08 Dec 2021 16:47:01 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mv05q-00DcNm-5O
 for linux-mediatek@lists.infradead.org; Wed, 08 Dec 2021 16:46:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 40F5CB821C5;
 Wed,  8 Dec 2021 16:46:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E42E6C341CA;
 Wed,  8 Dec 2021 16:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638982015;
 bh=9sl05KB/Wmmgh8hTPjQUEeSxpALKqcfSoRdKFAet8JE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=jviW+zWdyQMn66S2HDRfLnruwnaF/rvB2sTf6cUubb2j/WeBPnBxg+jBODq/Yazcq
 PL37dID/7dbpv8PmDmpvDE/kfVygra/a6mFTfrnE8Cj9nyuRW7Sr/pOxIRqYor1pvw
 Nygz5xsy5FY/XPvRMl9H86HyR6OaRNVf5V3LMl8ht+0FnEcC7yHVvKftoEwssktbJi
 dkczjxvBRmec4SCBi8QKibf5jEiJHBpO2svaiU0ug3PD/9awHakYEtUlrUR1qG144M
 DnT5zuVDPpquo3M4MsRxXel+7oOB6ukjlLO/btpp+HG+pMNvIMDQg87kNkiybQ+fLW
 TnrWzsXEJcAZQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Cc: Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 linux-mediatek@lists.infradead.org, Trevor Wu <trevor.wu@mediatek.com>,
 Bixuan Cui <cuibixuan@huawei.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org
In-Reply-To: <20211208151145.GA29257@kili>
References: <20211208151145.GA29257@kili>
Subject: Re: [PATCH] ASoC: mediatek: mt8195: silence uninitialized variable
 warning
Message-Id: <163898201265.3880815.10727023271133668606.b4-ty@kernel.org>
Date: Wed, 08 Dec 2021 16:46:52 +0000
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211208_084658_392222_26C3778B 
X-CRM114-Status: GOOD (  11.95  )
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

On Wed, 8 Dec 2021 18:11:45 +0300, Dan Carpenter wrote:
> Smatch complains that we might hit the continue path on every iteration
> through the loop.
> 
>     sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c:831
>       mt8195_mt6359_rt1019_rt5682_card_late_probe()
>     error: uninitialized symbol 'sof_comp'.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8195: silence uninitialized variable warning
      commit: 9abc21c966619d6ead27fd48481966014fdc680f

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
