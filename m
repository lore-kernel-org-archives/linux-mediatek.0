Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EAADC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Mar 2022 13:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yLLQwPKu2XxnBBKR3T/2bRGMPSIeKxfkMpUm4FfGT0c=; b=IF+CvkbTfIW653
	9CtHkh6Kf8EAgnJOBXbmB2HW7xvsKbxSVrbakh4PCEbEj7cA8mdVK2eFm7FQHnFOuP57rKAPqCvkX
	1CN4b2QQvxZl009PBNU3JHEKcUi52PG8ZJuBVG2+KXwm1UPEBzv9KY6JeLRyCT4E/CNlG80LQ2Za/
	fr8E9jIAwN6xxehvP8TByixqLdiW9AdL77L/HXJ5ZflQT4yrFOO/qwOXzI3Bx5kKm1k4ZpyUIxiWJ
	mSlJBqi2cL+0ZXpedUyxGwdQIYGhXl2EJs7EKfRYjsJ4zl1vhkf0rrdQeKj4FDif1qf5K+yKaaGxQ
	54EsbKlHEgRrdyxAnrVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPlaB-006VS7-Am; Thu, 03 Mar 2022 13:33:27 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPlZy-006VPi-Ta; Thu, 03 Mar 2022 13:33:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 486FDB8254C;
 Thu,  3 Mar 2022 13:33:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EAC9C004E1;
 Thu,  3 Mar 2022 13:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646314391;
 bh=p2C7b5c/cUQV9McqiJLePU5w1eCpvl0FqwxxR66KW3c=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Hfiz7SzlXv23kTOu2VKGxKVgiYhP4fTT7098Cx4jimhp/UBzWjBSlsmpA4PwCP0BI
 ZDn+4+G8eE+Iiin/G+HGlKI6JW89ENHtP3szsQLgOSJpIUUy5K/pMmyikLSpu5n+uo
 FmBzmcY/4fnqIXvljAWbFHPO9duZuh4Eu92asbi6E0Ok1Q2k1rV1FNfj3DydPqGydM
 LzbDei8LBdviYQKbIAqDRRTnXwVO0YP7vKSG0beUdQgR9lz7BV30dEfxK9bfzRBjRR
 4BOUrXs9w/KhHeeD6RZ4xWEsRaFwbg8sAZhSs3AY+RxNozi4NlZ9Im31Fupzl18zwG
 Hb8uFwEI84NCg==
From: Mark Brown <broonie@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Cc: linux-mediatek@lists.infradead.org, perex@perex.cz,
 devicetree@vger.kernel.org, trevor.wu@mediatek.com, tzungbi@google.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com, matthias.bgg@gmail.com,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20220302013533.29068-1-jiaxin.yu@mediatek.com>
References: <20220302013533.29068-1-jiaxin.yu@mediatek.com>
Subject: Re: [v2] ASoC: bt-sco: fix bt-sco-pcm-wb dai widget don't connect to
 the endpoint
Message-Id: <164631438805.1870788.7887428309950116158.b4-ty@kernel.org>
Date: Thu, 03 Mar 2022 13:33:08 +0000
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220303_053315_146134_D61DE492 
X-CRM114-Status: GOOD (  14.95  )
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

On Wed, 2 Mar 2022 09:35:33 +0800, Jiaxin Yu wrote:
> This patch fix the second dai driver's dai widget can't connect to the
> endpoint. Because "bt-sco-pcm" and "bt-sco-pcm-wb" dai driver have the
> same stream_name, so it will cause they have the same widget name.
> Therefor it will just create only one route when do snd_soc_dapm_add_route
> that only find the widget through the widget name.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: bt-sco: fix bt-sco-pcm-wb dai widget don't connect to the endpoint
      commit: 8f2b025abc31bc15d38657d1286d7470bbbd5efa

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
