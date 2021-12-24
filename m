Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DF2DC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Dec 2021 16:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MPAzuhWd2jmH5G1IvMsPirytHwj9v/8dEG7UWt53Ucc=; b=fubxhKwIIz1AZx
	B9/OuS1p7YJWfcl4mR/YZwV3LMhPyQQCnf1tZ8vOBgTCWNnuhKeYwiDW1BiBA9P0KtQTLcForCrOK
	PJ+pykQD/1hWGVA/F4N2+0bYf717/H3MN4tTDs1GwUIuvai+eagj/HZJK7kFnYMt3rxA7/jSe9ezY
	A44F6rp3OJFi8C8zc5l0K9TK+Yp+UJQ8Da+0AsJ6QiMqG8MujGbDSfE+0Cg4Mkde4lDASifAN/u1j
	sKAJk1iETna0AdQWiGWE6XY0v4J0JKfAOSfp/VljBd9SpX21DJFcCDiOmikpTRyc1tuph+7DTda4t
	FcX5a4GgAxjlc1I6r4pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0nGa-00EJ9S-7N; Fri, 24 Dec 2021 16:18:00 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0nGG-00EJ2Y-5h; Fri, 24 Dec 2021 16:17:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BFFAFB82339;
 Fri, 24 Dec 2021 16:17:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9657C36AF6;
 Fri, 24 Dec 2021 16:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640362658;
 bh=F8xnkK+XpNG5NYxvlj4BQZhPsYtY54y6CQF2ovCcV/Y=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=gzWNJU/3nh3+RRe1YRafjKNiCEuPqx3j7N6ua573I6A5go4D/y3I7yEXM7ekKdhK5
 xnCCCNw+OaqbEhM3lYyPInWwnXidOB4Gy0HFr/i6ApgkWkSkzCWg5fFNtmYSR1bWG7
 eoZBwDwgHVyQaJbKYCq/aI9pbSW0REthSsATgqZjPA/9nCMKjvZJpZlWDzvJ07HgJj
 LSnKAFv4yr3/bKRfH2T/vrDfTsoXqSQmSoDWLE5x6X/rKLGEuarqEGfeDIKBXGiXdQ
 5uwOopUUi4rIVREeXjuWIDqUUGFyUen5J8G0h/O+b+WxX35uWX1SCIf37Du6SQbY7L
 gZmQaY3Oi3f6A==
From: Mark Brown <broonie@kernel.org>
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>, lgirdwood@gmail.com,
 matthias.bgg@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20211222015157.1025853-1-jiasheng@iscas.ac.cn>
References: <20211222015157.1025853-1-jiasheng@iscas.ac.cn>
Subject: Re: [PATCH v2] isoc: mediatek: Check for error clk pointer
Message-Id: <164036265653.3720027.11806563702893486753.b4-ty@kernel.org>
Date: Fri, 24 Dec 2021 16:17:36 +0000
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211224_081740_401444_9A66C8D2 
X-CRM114-Status: GOOD (  16.97  )
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

On Wed, 22 Dec 2021 09:51:57 +0800, Jiasheng Jiang wrote:
> On Wed, Dec 22, 2021 at 01:57:15AM +0800, Mark Brown wrote:
> >> +	for (i = CLK_NONE + 1; i < CLK_MAX; i++) {
> >>  		clk[i] = devm_clk_get(&pdev->dev, clk_names[i]);
> >> +		if (IS_ERR(clk[i]))
> >> +			return PTR_ERR(clk[i]);
> >
> > This now pays attention to the error code here which is good but...
> >
> >> -	init_clks(pdev, clk);
> >> +	ret = init_clks(pdev, clk);
> >> +	if (ret)
> >> +		return ERR_PTR(-ENOMEM);
> >
> > ...then discards it here with a random most likely inappropriate error
> > code.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] isoc: mediatek: Check for error clk pointer
      commit: 9de2b9286a6dd16966959b3cb34fc2ddfd39213e

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
