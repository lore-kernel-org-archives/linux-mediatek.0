Return-Path: <SRS0=vV1m=M2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 146BAC4338F
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 23:22:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C54F560F94
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 23:22:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C54F560F94
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rXtxal5qY+0pRA4FxK3YDcr1dQif7flv0IEpdhtx5ZA=; b=vdpSM4iim/6wHU
	KyAVGb5w//p6l3ImVjO0rELq6V1Pbdi+UOQUFf9lOhkGUIXgN+fDu1glGkya1EU79F7Qot52tEwlB
	m6+wVFXu3mxtHpQA/NrZM2+844uKlrbvr7kZz2/nd1jGiw3FyHU5XwHTO1XiD8xyWiCEGAyg3QGUg
	CfNW3c9ZuUZxs4FpzJPC8fRbUG9uN8l+hpC1WKZgghQrOLkN9pLh107XEZWdiaQApKoND1p/WG2s6
	s3D7TeN9Iwd6tQtUBft9kCV0yg6jX4NncGG5zXw/fWYzLyOnIWPaeeVTQoMqH0bZn6pUz8hBgQH+0
	JcmI13O2gA8urhHw0jZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mB3jv-004Q9k-Sm; Tue, 03 Aug 2021 23:22:27 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mB3jj-004Q8c-H5; Tue, 03 Aug 2021 23:22:16 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B9DEE60F70;
 Tue,  3 Aug 2021 23:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628032935;
 bh=GTOm5i1eFHoZWIAtLq1pJZHY6UHGcU6XPXFTbm98e/U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Cj8bEyOJUkIviH1NJ3QclFfyphJQRwILTKSm3c2b5TLXM45hugfp6A7A3h6XQUw6P
 yf+TdP3Bxgd6iDmefErVAbpLy2KfVGfIDTtKg85qHtoYpTZciBGJxRTGTuW/zYuuD3
 TwF2oVrn20cEitvmEWQgs28YgN1KlqskTuJEy+cYYADGx2qgmRRqntsG2iCuRP89qu
 B7K1BCHC2isZiL8PXj1w6swkOPiYQxTCO1ebgfummAq+L4hWSTuMU5ADo+NodE8qXE
 siZnQ0DBwb9jElkkuV6e7FzBRh2Y+xRYLffJK7ghP31685BDiJ1xGJCJ6S7a/4C3/W
 VC4eOE6hikbLg==
From: Mark Brown <broonie@kernel.org>
To: Argus Lin <argus.lin@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Colin Ian King <colin.king@canonical.com>, alsa-devel@alsa-project.org
Subject: Re: [PATCH] ASoC: mediatek: mt6359: convert to use
 module_platform_driver
Date: Wed,  4 Aug 2021 00:22:00 +0100
Message-Id: <162803121460.44131.10692737941162516565.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210531051203.228567-1-nobuhiro1.iwamatsu@toshiba.co.jp>
References: <20210531051203.228567-1-nobuhiro1.iwamatsu@toshiba.co.jp>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210803_162215_624297_82EAB9AA 
X-CRM114-Status: GOOD (  12.46  )
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

On Mon, 31 May 2021 14:12:03 +0900, Nobuhiro Iwamatsu wrote:
> Simplify the code by using module_platform_driver macro for
> mt6359-accdet.
> 
> 
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt6359: convert to use module_platform_driver
      commit: edcade2e5e942453f001bd7a0d31f55059cec34f

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
