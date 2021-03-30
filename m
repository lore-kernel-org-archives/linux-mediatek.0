Return-Path: <SRS0=H7Ok=I4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7A93C433C1
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 16:07:29 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4EB8B619C0
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 16:07:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4EB8B619C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QPOzp0XONVTscOORPDbcbglhjpnkiZV00MPS/yLKJo8=; b=pT2LKsvMLMo3pVra2FOxOLTja
	GD/30fxxj9Vte2WnxLFPwP4M8A/NlkFqhgDJysCWACHvo1k1/V+x1mWYReu8Yaw/oczisSVUYLI38
	so5Pzhwz3wwaRB++xYwqAvtGp3MakdmGu2ZqSAaMXzuhMusWC3d4NggeaG6TdaNYwRgaw1hnexGtt
	eV+gDRg+vT1qpWE8NH3y086mdMcWfx5xWlrrLwm3EdfSKHgnsvlF/0aTLmBL5pahiGtTYZ1L5pRr/
	EihGe5MSTTxRduHOWmsxOuuOvDpRZyPnKAE0Cyd91/yfAgxUlbLmUKOZsI3q+LZ0g/Zavt9JhSJ/d
	cj2X774bA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRGth-004Ipd-HS; Tue, 30 Mar 2021 16:07:17 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRGsg-004Iee-Iy; Tue, 30 Mar 2021 16:06:18 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B7104619C5;
 Tue, 30 Mar 2021 16:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617120372;
 bh=LcfNiuaHxShmpOMM7bIh9+cRZVxKyNwsRLx+S7WkUrE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=N4w0e/X4HD6ZFXJaJbwQbxqRZisLjH28suTfoGysW+F4DGQxOhLGtW2oFkAmJLRnq
 7U4GoiKEwMNXPRduc8MtfuwTZxtKE15qyJo9et2Q5Mvss7RX4o9+zfuzREKMkQAbjs
 8Ob2qYi2YQqfVtCUpWmUDMxJ6OGI+StPD90E/ifgllS7BQAdTDiKtiwBB7o57Omxte
 n8Jdg4HE5d3uxIqMO1e6nl3qPUf5YfBMsPvI4l3WFFTMTPvcgdSX0uBTeIZtn1XIYE
 L+Z4mX/w3bFO8mh3JUOvpBP52Bh4YjtWRQDtZzsxtE4tXh8qbxpcRVUtLvudggygbr
 BmfMozp054VAQ==
From: Mark Brown <broonie@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
 Argus Lin <argus.lin@mediatek.com>, linux-mediatek@lists.infradead.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Colin King <colin.king@canonical.com>,
 linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org
Cc: Mark Brown <broonie@kernel.org>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] ASoC: mediatek: mt6359: Fix spelling mistake
 "reate" -> "create"
Date: Tue, 30 Mar 2021 17:05:50 +0100
Message-Id: <161711993559.12915.3840156650478962312.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210330084710.997731-1-colin.king@canonical.com>
References: <20210330084710.997731-1-colin.king@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_170616_085078_F082D956 
X-CRM114-Status: GOOD (  10.31  )
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

On Tue, 30 Mar 2021 09:47:10 +0100, Colin King wrote:
> There is a spelling mistake in a dev_err error message. Fix it.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt6359: Fix spelling mistake "reate" -> "create"
      commit: f556de6087f0d19825ffcdddc4816f83ddfd35e3

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
