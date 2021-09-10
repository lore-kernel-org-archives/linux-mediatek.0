Return-Path: <SRS0=J3PH=OA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6981BC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Sep 2021 16:10:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37C356121D
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Sep 2021 16:10:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 37C356121D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=26QEStZpvQajEmRVXcTN9SR2b7nhrbTVQEyv7t1RtMQ=; b=hoWtYJuX2g+xX5
	0PnFSozzHxhlzXBj+Z6p5cYFeZ0n2eR/7xDtjbSTWJ/A+11oNbDeijpqAC0hGEydmm8JcMbO0TIem
	xocW6szbr4KyTWTC9XU/gbItuqisXo6uZmEIk6kzDXxFWNGSbv+cpBBzCp+fzFpIK4+LB0iC8AxoS
	6yco71O+MNX274zxMI0GihkHRoYfu5nhZF2qUKlvRrCi8pT8Q50bdj3hZY+nKuCVczoeuA1p+/G4s
	SVrJP2O1CsPRpcDHWlHVauZ0/i0Cz39f3EXQhuxD9uzPAnImmvB+23dPUnBXOp/6fwlbcE1L4NqpG
	yKkpQ33ZrUrjN5yNyvtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mOj66-00D6ep-9k; Fri, 10 Sep 2021 16:09:50 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mOj5k-00D6Z3-CW; Fri, 10 Sep 2021 16:09:29 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9A12E6120E;
 Fri, 10 Sep 2021 16:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631290168;
 bh=6iwvSZ8jp5kA04e1JPK/6mq3OGC3NvF1BQ05VjMVO44=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pcC5QJb8RtxJmQaU4B5d5Mdkn6sEJg/KPx0G91ox3184J8N9EzSFWxk1eXPcICBee
 5lf5KiqJ4ZGpyLfB9y4kmS1RDe1WrgMXHcvTgNxxhK/efnCZlLHkJ3hIKBmQWcJEIq
 rhW/CKt+6BNFS5Ag+AT3v2njZlt8s2Qq+w8uswkVawHiDsBYHyR7KI9yVvbR+HYWn0
 36TfFaWGnw9VSy83g2InmoTMWH+YX6o0/Y224ROLV844IKkTqdGfXcygRq7SrJQp+4
 9mTUQwhdbb/hUZkwEXUyiBcH6+eB+64m72ZG2vma4t0LBvc+/vTohNZPz+hMQ5f/Hu
 x8AqofQYhapoA==
From: Mark Brown <broonie@kernel.org>
To: matthias.bgg@gmail.com, Trevor Wu <trevor.wu@mediatek.com>, tiwai@suse.com
Cc: Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org,
 dan.carpenter@oracle.com, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2] ASoC: mediatek: common: handle NULL case in
 suspend/resume function
Date: Fri, 10 Sep 2021 17:08:45 +0100
Message-Id: <163128974014.2897.15699318985041527361.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210910092613.30188-1-trevor.wu@mediatek.com>
References: <20210910092613.30188-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210910_090928_479849_8C7C7F20 
X-CRM114-Status: GOOD (  11.79  )
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

On Fri, 10 Sep 2021 17:26:13 +0800, Trevor Wu wrote:
> When memory allocation for afe->reg_back_up fails, reg_back_up can't
> be used.
> Keep the suspend/resume flow but skip register backup when
> afe->reg_back_up is NULL, in case illegal memory access happens.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: common: handle NULL case in suspend/resume function
      commit: 1dd038522615b70f5f8945c5631e9e2fa5bd58b1

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
