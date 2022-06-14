Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1F38C43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jun 2022 10:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I7DVpQcIEZi1qkgnP8a67LIfKFoTUAITTPXtqVaM7kc=; b=PE3ulsHq8Cmuvd
	SXCdoCVI3qm6EovzaemjYtmm4S1qURti47vOiyZuVj3c5DcUeBpKIeTjgWhWD8CmttcozBy0Ji+49
	KQvNQ/OBrP3J9OFdjgGMP7dL0DWW2UZ5yuULklz7VrwH+mFcPamEfy7D0kDK5NDglPf8Ob1Yi7F3E
	JtG9RzVUd/667zbrpKGPS9KEEfU+Flg/vmx+7HKWGXazm7me54TuRc4OGIDrooUwGlO/btsCc+Bhs
	dMCeliRjn0jl9EO66pHZpAdISttFrIMirrlRYpIdcVFeT0ZVzKXKYq7KvAomxKPsRG+9tkvWPVbJ4
	WQNlJuGB1KTFWrpdSiuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o13je-0091ji-7l; Tue, 14 Jun 2022 10:25:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o13ja-0091hZ-RL
	for linux-mediatek@lists.infradead.org; Tue, 14 Jun 2022 10:25:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 054F460C97;
	Tue, 14 Jun 2022 10:25:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1194C341C0;
	Tue, 14 Jun 2022 10:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655202314;
	bh=/4wjBN/XD9r9d8fn277nelFLTt+axEseUdjXrsmW1cU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=JdeSQWXLchu9QxQUVDqhSTbVyAhOjuRuArsn0syriXa+9Qq9BrxzCpSbML5WI6MvX
	 rieOOwWnvg/qq0YjsQmfXXIgeK6bx8mQHr+Cp7jItHCN2TGh12ndouxY2FFFPOMzoV
	 OIj9Mb9xNVeeg7e7EYjwZAe452Iwx8BRu9WNpRbfAaEvucIA6+u0M2XLRpTQgF4owu
	 hkJKkhk4nlzqH98aZNLkIRN8piFSAYzExErE7j+l41MzNbTwRZ3EqFPXUSTgcaT58B
	 RjsjdaMcL3qclOjPvMSkjIE7/PkiKj4D6GIXIZdSp95ObCXd5jSt0nEnh7dDi9Gs33
	 rlAatUrbYIFqw==
From: Mark Brown <broonie@kernel.org>
To: ckeepax@opensource.cirrus.com, samuel@sholland.org
Cc: linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev, patches@opensource.cirrus.com, jernej.skrabec@gmail.com, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, wens@csie.org, lgirdwood@gmail.com, matthias.bgg@gmail.com
In-Reply-To: <20220613161552.481337-1-ckeepax@opensource.cirrus.com>
References: <20220613161552.481337-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH 1/2] ASoC: sun8i-codec: Partial revert to fix clock specifiers
Message-Id: <165520231251.3607327.1586830877046934824.b4-ty@kernel.org>
Date: Tue, 14 Jun 2022 11:25:12 +0100
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220614_032518_946561_9F405298 
X-CRM114-Status: GOOD (  14.13  )
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

On Mon, 13 Jun 2022 17:15:51 +0100, Charles Keepax wrote:
> Recent updates accidentally updated the clock producer/consumer
> specifiers on this device as part of refactoring the CPU side of the DAI
> links. However, this device sits on the CODEC side and shouldn't have
> been updated. Partially revert the changes keeping the switch to the new
> clock terminology but going back to the CODEC defines.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: sun8i-codec: Partial revert to fix clock specifiers
      commit: beb89d1d49e9ae1188356d6e37581e5f0b5f62b4
[2/2] ASoC: mediatek: mt8186: Use new direct clock defines
      commit: 845a215558647acd4290dd773b9c0de62c123335

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
