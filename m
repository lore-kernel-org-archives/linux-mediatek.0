Return-Path: <SRS0=2t6o=GD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5216C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Dec 2020 13:29:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 749A7223E8
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Dec 2020 13:29:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 749A7223E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:References:
	In-Reply-To:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=A4t/M6xKyNODnfgNjwWrIU+rc7kzSCt6EoA/DdySCVQ=; b=di105bR8b8OeOzaUjH6lsjl+z
	hfKteSyUgIWUsPQ1LqtpPRWTk2Xvgrdk4R7EdkZzvgEcdlOweMREeoNq15LSyToCZJ/qZHnTCKVxX
	b0KEvfcZGezCjcxq4ClUa4rMFEuCYJY4cuEuFiaHJNToUSONnQyxaglOUTVo8wXHqKmZjVBtNbLMV
	Bn7hfKtKenq2B5MS4sDwjmYHPLczJL1eBCtA0b40TX6VOn46OniysUmg6ioWYXLhAgfg/Q2iumkly
	TdFf+o2cAnl4VcqMKhOTRiXj//xbzdNchJZCXWDB0QIYt+jIDilEsFv4mDWtCTDi/KRGLQoT3dgna
	SnDGgbz2Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kuy0j-0007Cq-9R; Thu, 31 Dec 2020 13:29:01 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kuy0d-0007CI-Mv; Thu, 31 Dec 2020 13:28:56 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 309CE223E0;
 Thu, 31 Dec 2020 13:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609421332;
 bh=K56VJyy27x0kGr4SNtwCRlFlFSdH8USKotViNClcc8s=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=P3AvGcGR0QvXm9N/JFSFfPexBrn4t4zGYbbibSrhJ1N3C9Jw7JmHB1JptbONJKUGb
 gFzzWqvc68i/mbItQTs/vqisNp1oaTflQQAl/jZ/Q0Fmlu25EAPuWMx6mdyDynTo7V
 idb9sFcQ+xZlgs/FjYdzaWzKKL/IetF1tLyzQRI9h/5Fei+/yxio/ggjRs2K/8jR5D
 aOFYwp5XX0fW/E7Ub3XL/ddbmIYn6kFQOBfvtfNW5iCKZyBagpjNaWdIbRD2OkrKye
 94i0Nn5Hs6h4FshBOIMkAZpAwFRyQY7wl6VE9uFwmjSOtUroHKpdh3zF/sWe4bNXrs
 eOnGzyNMqZsiA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Arnd Bergmann <arnd@kernel.org>
In-Reply-To: <20201230154345.639122-1-arnd@kernel.org>
References: <20201230154345.639122-1-arnd@kernel.org>
Subject: Re: [PATCH] ASoC: mediatek: add MTK_PMIC_WRAP dependency
Message-Id: <160942130384.56416.5738350943602041009.b4-ty@kernel.org>
Date: Thu, 31 Dec 2020 13:28:23 +0000
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201231_082855_924897_481411B4 
X-CRM114-Status: GOOD (  10.55  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>,
 Takashi Iwai <tiwai@suse.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 linux-kernel@vger.kernel.org, Tzung-Bi Shih <tzungbi@google.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 30 Dec 2020 16:43:34 +0100, Arnd Bergmann wrote:
> Randconfig builds often show harmless warnings like
> 
> WARNING: unmet direct dependencies detected for SND_SOC_MT6359
>   Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && MTK_PMIC_WRAP [=n]
>   Selected by [y]:
>   - SND_SOC_MT8192_MT6359_RT1015_RT5682 [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && I2C [=y] && SND_SOC_MT8192 [=y]
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: add MTK_PMIC_WRAP dependency
      commit: c1cbbea9c4db41eb69a831d8b07da52e05b1d1e8

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
