Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2617C27C4F
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jun 2024 21:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5l7x9aAqDzxHxwR2g3OU5wLebjxnC0fb3/JI1PyQoNg=; b=yNVerkphLCMJV07EEhIeEkxRfY
	lL7lGf9eKY6ck0J3jt3j94XPCng//LM6aeZYMRB+yFtiypeqkkfhDMIHqAv752DK6DRYhNDgn3VWP
	bguUBhJr89ApYlDzWVhmxjUbqM8jzN33U8b/DaJG0gFY+vrdmt2EgbQj62buXcJ7MwACrvl+hPO1d
	Av01KKGXw29spqTWJWdNCvGYPBEznmVUFQ4uuXIsyTVRvduoIpqZnPGCy/lm7EJNW/oB5YaGYp8PF
	mkt9IwcDuPmRfyv+jOvbSXA0FEiWFdxLAuUVye9dNibl9X5O27f0NOLT8bCRKXZAPXzWAxiuWHHu9
	euYOUd5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGmom-00000006ZLz-0Hsq;
	Mon, 10 Jun 2024 21:44:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGmoh-00000006ZLL-3Sp5;
	Mon, 10 Jun 2024 21:44:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EBA5760AEE;
	Mon, 10 Jun 2024 21:44:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D158C2BBFC;
	Mon, 10 Jun 2024 21:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718055878;
	bh=3BXOX0ljI6tNSqx92AFSk3H/yMBw5v/Qa/zHQ9YUkFA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=XSGYEQp3r1jJLpJfLHQslf+NUVz5XxFW2PajcFIwslRtHEVMsMIYpRqu9ClqPyQs8
	 eR8nvxO8kcguTXrJi/j5zpLMZNDc9rgdykVlZAiYBqNhXLDGMej/um58msjlbkwh6U
	 gJIjQQZKhyu3Ozrr9pwdIeeYyrzfIyTnS/fjtQpURlwKGtjQZnCCQkzGOrjWn/sUQc
	 ROfBZCR5kD7f7sGjNPQr+N63mmpHFv6MtcZfXqqLoB2QkEsSglsSy5ob+xVMhjKSCO
	 Frexzip9MxpdEOvNXS+zf1SdXNpwMD30BWolc2THJL5ioiblGEhr6+hYM/dNkECnBm
	 a/N0tvxh9TrRQ==
From: Mark Brown <broonie@kernel.org>
To: Support Opensource <support.opensource@diasemi.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
In-Reply-To: <20240608-md-drivers-regulator-v1-1-da338665db7a@quicinc.com>
References: <20240608-md-drivers-regulator-v1-1-da338665db7a@quicinc.com>
Subject: Re: [PATCH] regulator: add missing MODULE_DESCRIPTION() macro
Message-Id: <171805587223.166318.11260864139732628777.b4-ty@kernel.org>
Date: Mon, 10 Jun 2024 22:44:32 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-4c370
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_144440_088185_4DDF39BD 
X-CRM114-Status: GOOD (  13.14  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, 08 Jun 2024 21:53:29 -0700, Jeff Johnson wrote:
> On x86, make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/regulator/da9121-regulator.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/regulator/max20411-regulator.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/regulator/rt4831-regulator.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/regulator/tps6286x-regulator.o
> 
> Add the missing invocation of the MODULE_DESCRIPTION() macro to all files
> which have a MODULE_LICENSE(). This includes mtk-dvfsrc-regulator.c, which
> did not produce a warning with the x86 allmodconfig, since it may cause
> this warning with other configurations.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: add missing MODULE_DESCRIPTION() macro
      commit: 8a2744f2955a584188a82d631937aa365d4ea966

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


