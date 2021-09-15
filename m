Return-Path: <SRS0=Ndyv=OF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63D06C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Sep 2021 15:23:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A1DA60F5B
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Sep 2021 15:23:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2A1DA60F5B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+skovrzhPU6UGbnluRdbLrE8JQtoYL8UHVVAVCfpp08=; b=rBumzlJE6/8H6p
	3NzMV/vh71VJrhPrYz4OGwtnqUCOQBiZsC49Q5hiuIaDiJ9tTgq1ZobM6/i30iOn+2KrYmMr1WfIz
	xoJ3uQrBtASrfUQKxiQ1FQFOUhm0yWaQ+fkoaiWfNZ7jcsYJVwX59/z8eglIgHf41mCOrzUY0fNeV
	7SZ0CIDjiyP5ygo5oT7AUkvBnMRbn4scVNNjCmmuOuEGpad7JblR2xfNEWXmpautYNw4Oqz/M47Cb
	mcafQzjoylUDOsJDfJ3Dhq4yNrqviEgGiiqmkeuDY0rQV+Nh3Vz/YrFH0oAXKr7fVLV2H72JH3IBg
	159iRHCfZHbSJHp2Dzvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQWkc-009OxB-2u; Wed, 15 Sep 2021 15:23:06 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQWkJ-009OsN-Li; Wed, 15 Sep 2021 15:22:49 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D3738611C6;
 Wed, 15 Sep 2021 15:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631719367;
 bh=wfCrkPF9uiip+dMt9hQgVwVQGgywxVqYrYAQt4PemHc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uS+lULv9jwBDnz23rHC++bq3uxzQPTAOTeaM7Hvgi2cgl/5P9k5vGozDCXPjHhLvF
 oIz+FfbTEOYlfUYzuXXYMDgcsAjpfUilNTPlG+MSHOoZZ+b1rtIbWFKOsVG1NNUd8Y
 gEOtXaFuEIIZf5MkKeo5BFSAHDFcrgIg5joODAAQrPlLrkFplB/4YysjMa2ZRHnhdM
 Fy1hIRyMsYXW0WH3sI9tLTVismpNYEDDU6+V45+XLoy3ebV9KsZwmjdcZS6kFzGgAF
 LXG3QnezUEE6r9R6YvVr20JIZNWznKObj2yiW7xQ9fYWz5Nz0a0AWTzdi2xNDSfe6e
 JiRsmbq6kp6NQ==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 alsa-devel@alsa-project.org, Colin King <colin.king@canonical.com>,
 linux-mediatek@lists.infradead.org, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org
Cc: Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] ASoC: mediatek: mt8195: make array adda_dai_list static
 const
Date: Wed, 15 Sep 2021 16:21:47 +0100
Message-Id: <163171901943.9674.10990878164291138218.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210915105027.10805-1-colin.king@canonical.com>
References: <20210915105027.10805-1-colin.king@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210915_082247_773272_4D9D5220 
X-CRM114-Status: GOOD (  12.49  )
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

On Wed, 15 Sep 2021 11:50:27 +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Don't populate the array adda_dai_list on the stack but instead it
> static const. Also makes the object code smaller by 33 bytes:
> 
> Before:
>    text	   data	    bss	    dec	    hex	filename
>   28271	  11640	      0	  39911	   9be7	mt8195/mt8195-dai-adda.o
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8195: make array adda_dai_list static const
      commit: ce3f9357638720f4a78f6a6e481941c37f33bceb

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
