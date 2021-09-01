Return-Path: <SRS0=BCEy=NX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A634C4320A
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Sep 2021 18:16:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 666DF610CA
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Sep 2021 18:16:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 666DF610CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O/we9rRvIm/3XFGWPhXmpy1ui9k3zi3+tp6yNy6fEHU=; b=fS5SeU6Udas4Pw
	AyPb5D71VTAnrwp8qZY7seO8YsopA/NfEzOZJ9Kqm7Yw7mshl2q+zkkE6nLG8T0jlrL3wVRCoVoiw
	GpcMSvtVV/jqMpAAW4u7aL4sd3WXHoJXyAWMlsa92BiL71iGAtMkXUvVvA5Z5yHM5vk5z4X5CUv/k
	YLRFll4dbISqZMh5rwtgT/xP+Sj8CExzQqg1fP4cv1ECvt6K2G+g+2JEyx8Gwa6qlpSx4CaloO9L+
	Yb0fR2aYR2th2nDpCyVajPcawaDA9VpASDEkGw2K/Y2OCyrXo7AocH0SpblF7ds+czMdxyPI4jeIf
	Z2U/MaLvWAc0WbBNh/9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLUmL-006wf3-K4; Wed, 01 Sep 2021 18:16:05 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLUls-006wRV-00; Wed, 01 Sep 2021 18:15:38 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 139AE610CA;
 Wed,  1 Sep 2021 18:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630520135;
 bh=F3PsqF8kI1YopDkw1jrsG80A5fXXJVkd7n6uEtryW9U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mZgKgvjQxxELJfFRNv8ApXFEG4ksWKr9Tfr1mg9T5x3awqaB/7OTXIneqIer7IJrt
 BYg6f0CJAbffLI1fhSMN5dFH6YNjSnqrhPBetHlUjpqXls383MYDIMauBtnhMcz2YB
 V8iOEe1Tib8zZYZIvGJBTl6UYEpaKOgrB6L1dZaWFx9ukY2zz9XZOWhwP83Ygyni5x
 sLYnix6tC1keHVU/UKCj3ZZ1OWowQpbJHI+/M/RVmkGBTXGddFV+JpiMIbzP4J3kwI
 ZTgdisv9fetcQiNr39m4ZBVXn0uTTy+/LoP3LHQzwD3y9C18Tt4kCpuPvjismuEk+V
 ywQwwkHU6WOVQ==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, matthias.bgg@gmail.com, Trevor Wu <trevor.wu@mediatek.com>
Cc: Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 rdunlap@infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org
Subject: Re: [PATCH] ASoC: mediatek: mt8195: add MTK_PMIC_WRAP dependency
Date: Wed,  1 Sep 2021 19:14:47 +0100
Message-Id: <163051912509.21630.1658074283329712845.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210831021303.5230-1-trevor.wu@mediatek.com>
References: <20210831021303.5230-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210901_111536_143806_EDC11E3F 
X-CRM114-Status: GOOD (  12.50  )
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

On Tue, 31 Aug 2021 10:13:03 +0800, Trevor Wu wrote:
> randconfig builds show the warning below,
> 
> WARNING: unmet direct dependencies detected for SND_SOC_MT6359
>    Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && MTK_PMIC_WRAP [=n]
>    Selected by [y]:
>    - SND_SOC_MT8195_MT6359_RT1019_RT5682 [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && I2C [=y] && SND_SOC_MT8195 [=y]
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8195: add MTK_PMIC_WRAP dependency
      commit: cd5e4efde23ad8050921672ed777ec3f7aa310ec

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
