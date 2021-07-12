Return-Path: <SRS0=CLKU=ME=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2D5BC07E9A
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 10:49:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C632E6101E
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 10:49:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C632E6101E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CbUzUx3NASFE5eiA7w5hqDPP4Yw2OtRAgTPbfjGvfS0=; b=hRIJS+8TxrhsgG
	6NIE5qVL7ZLgsyKamxKJaUBP9G49dwsIyZDx1XK1EuudOO+6JA5lYIjXJrXFV6l+mLusY8Pgn7Wwf
	hY+WdP6maeYCRk4bVkmXqOi8uriLeTRB0JtWeZmOSXF08fOUGd6QZg9l19et3MS31NRkjvjiDJvCv
	fa8d96bZWPmx3Zo04zqhUO6kQmBnc3KzKrZywDbLNjK5vRIcaSG9vEAJz3uh1XppI3moajXzhfLi/
	yPNnhumEaPOCjkzWV8wfNkCY8EQ38iQx9SxMhTJdn9tO47qymLRuAeYYcgX1HxHy1FDjUcOAHQuP3
	AkJyOpo/OspM8Q83/04g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m2tUZ-00727Z-UO; Mon, 12 Jul 2021 10:48:51 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m2tTf-0071Ud-T2; Mon, 12 Jul 2021 10:47:57 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0F6CE61106;
 Mon, 12 Jul 2021 10:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626086875;
 bh=IeWvLG9dBW5i+3dXkgj42gvpmnDrw+Wdi1aLf/mY6BU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Cn+/GGn9yVwf1DMPpHi79I1DSDJZvhgYzbajD1uXbEmo9fwD1GsOIVxKCLwi26Njj
 7V3zwzlEs35hlP3bt30/O2FQtLVBKo1U3wEMKlSSC5WfwAdCjt8KlgSU2cWhz2m5GS
 vFW9jY2dqxCNqlY6DZQWIaNTLVWglkv7w32p3mg3TTyjrcSgbc0cbZ/Hquu+Y0m9Ic
 BM8qvmF71V/sbX3LW2O5kqF972xX62Eayg04IL5FwF/nGguFG20w5EpEANgYTtXBbV
 lRQOBqo2sX7lkXRe4RWtD5l040PN177jCPdWoumvb6Q3kCQ1/+Rgks32Ln/4lp2WdZ
 FUInag9KOpzLA==
From: Mark Brown <broonie@kernel.org>
To: matthias.bgg@gmail.com, tiwai@suse.com,
 Zhang Qilong <zhangqilong3@huawei.com>, perex@perex.cz
Cc: Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 kuninori.morimoto.gx@renesas.com, linux-arm-kernel@lists.infradead.org,
 alsa-devel@alsa-project.org, lgirdwood@gmail.com
Subject: Re: [PATCH -next 0/2] Fix unbalanced pm_runtime_enable in error handle
Date: Mon, 12 Jul 2021 11:46:03 +0100
Message-Id: <162608623153.3192.12439505219680705153.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210618141104.105047-1-zhangqilong3@huawei.com>
References: <20210618141104.105047-1-zhangqilong3@huawei.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210712_034755_989458_252E8ECC 
X-CRM114-Status: GOOD (  11.73  )
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

On Fri, 18 Jun 2021 22:11:02 +0800, Zhang Qilong wrote:
> This two patches fixed the unbalanced PM disable depth. It could
> avoid pm_runtime implementation complains when removing and probing
> again the driver.
> 
> Zhang Qilong (2):
>   ASoC: mediatek: mt8192:Fix Unbalanced pm_runtime_enable in
>     mt8192_afe_pcm_dev_probe
>   ASoC: mediatek: mt8183: Fix Unbalanced pm_runtime_enable in
>     mt8183_afe_pcm_dev_probe
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: mediatek: mt8192:Fix Unbalanced pm_runtime_enable in mt8192_afe_pcm_dev_probe
      commit: 2af2f861edd21c1456ef7dbec52122ce1b581568
[2/2] ASoC: mediatek: mt8183: Fix Unbalanced pm_runtime_enable in mt8183_afe_pcm_dev_probe
      commit: 19f479c37f76e926a6c0bec974a4d09826e32fc6

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
