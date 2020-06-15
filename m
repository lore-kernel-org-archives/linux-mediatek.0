Return-Path: <SRS0=oIsV=74=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77DFFC433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Jun 2020 23:41:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 510CF20714
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Jun 2020 23:41:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XZ6unAh+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="FMytGS/l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 510CF20714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Subject:
	References:In-Reply-To:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RmRTXU0tdbsvX33yzedCGthKVjdLHyFotu8kCd26ujY=; b=XZ6unAh+tDJKmF
	VvU7dAtVZa4gV5Xd2D9qOBcuBTe3UZ2gFS03BvPKPvEOfIEMZyfm4kHTOWb4J3xVVj6ur+EyDN2B8
	ZjLDd98+3ZEgsrDVzO4xdfqJnU1fegeFw/drStu7cmn1jqxaY2nsX99qUjYdGrb5QBL0G7M7Ccb/7
	ixdPYOGO3mkDYhhRFkU/K88x4yK9HKdMM/YQqRtgp6mhJirkJurtdU4Cyp+Vmh9cld/PwVHNTe16G
	IFAmC9eHiZh38ZPeMsuA+6zDh4gYE0q23rLNhEaEFgQeHnHX0Cn9ay1I6M/3K0IeiC2NJcXy8TF+3
	nu4FhfBXuKYSUM4nqPSw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jkyix-0000pw-I7; Mon, 15 Jun 2020 23:41:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jkyim-0000h1-NX; Mon, 15 Jun 2020 23:40:58 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C3B46208C7;
 Mon, 15 Jun 2020 23:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592264456;
 bh=wmMrTJlDcXeeLr5UjbU5+uAWskHZyXjosJMgpE4Z/Ys=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=FMytGS/l9Q7rfRAWWuUJCjK4MdsYQ2tN5IbvduDrZtNhidlx8yhZFOPzGNUGHL5GW
 v9X3c71oALhFIQgqNdVKcPZ89EWHihH25poCzcxKLBrGUYKbqvAn3F1mFvdoO5iYbY
 0icsalBe+CJcIfNBdvnAOTaxIYIvjfkZiwZSGleI=
Date: Tue, 16 Jun 2020 00:40:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>, lgirdwood@gmail.com,
 matthias.bgg@gmail.com, tiwai@suse.com, hariprasad.kelam@gmail.com
In-Reply-To: <1591353222-18576-1-git-send-email-jiaxin.yu@mediatek.com>
References: <1591353222-18576-1-git-send-email-jiaxin.yu@mediatek.com>
Subject: Re: [PATCH v2 0/2] ASoC: mediatek: mt6358: support DMIC one-wire mode
Message-Id: <159226439189.27409.5559737025420657238.b4-ty@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200615_164056_785895_BD93B35D 
X-CRM114-Status: UNSURE (   9.20  )
X-CRM114-Notice: Please train this message.
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
Cc: alsa-devel@alsa-project.org, howie.huang@mediatek.com,
 linux-kernel@vger.kernel.org, tzungbi@google.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 5 Jun 2020 18:33:40 +0800, Jiaxin Yu wrote:
> v2 changes:
> 	1. Uses a DT property to select DMIC mode instead of a mixer control.
> 
> v1 changes:
> 	1. Uses a mixer control to select DMIC mode.
> 	2. patchwork list:
> 		https://patchwork.kernel.org/patch/11578309
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: mediatek: mt6358: support DMIC one-wire mode
      commit: c46fc800948c2d0afb548ca12453b837aa1ac880
[2/2] ASoC: dt-bindings: mediatek: mt6358: add dmic-mode property
      commit: 6323f13b4d927f52f339f7122676de0b0d1da3c3

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
