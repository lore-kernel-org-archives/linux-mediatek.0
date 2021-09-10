Return-Path: <SRS0=J3PH=OA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8821C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Sep 2021 16:09:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB37761242
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Sep 2021 16:09:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BB37761242
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dxu0LReFHfq1fAzRcOlRE+5jo/RRAN0MPuQCNxfK48Y=; b=vU1UknP/VCsJLz
	fHE9Ji1xMonCaZkQKibHuRp9Kyh33n3tRZwH9F0Q8rzY1WvmckqD1jN5Rb1RdMLZzAnewz6Q4ATi8
	X+G218bSke6H8qNuR7ZCirL1M/rRSBwry3q2/NIsZfp7IDqnJJHGqpziQ0/VQKJb2geXID1aIDD4l
	Jy7XcB7Gp+bYmHqL8Ni30WD92KDOfQc7TvmpaCM8P0j7VjIz5QMzWvxfco5ilg5zJJJcIKA2ci/Ip
	y3euWH5ysjW1eLYcalcG7NlL4lBlgiWGj3fzLZDskO+dLa0oiw45EMU1hohv9UMzCg79d4zUY6QQ5
	kja6Zyft7dYoP+KVbDeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mOj5u-00D6ba-W7; Fri, 10 Sep 2021 16:09:39 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mOj5i-00D6YW-BS; Fri, 10 Sep 2021 16:09:27 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 122D0611F2;
 Fri, 10 Sep 2021 16:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631290165;
 bh=q4lntEh1mQD2RO96jVSsyccr0dssPljMXQSktMXKMNc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QOcnMIt0OTAiSqdHD8c/NnC5iy1GiRQcQg1NOBMvW2Pc9SDuK7yJrpcr0aCvXsDjp
 3pwr+3JbIa6stkeRAg7V0mbKqunNJIf0fMD8DdH9DLe2EaGtLBjYVIhFlxZTgja4+V
 XhWGGudG1L1ooV0mnhQivMluq+RVvS7e/5A7dfRETkYlizpaJgom0dYxhoqfI3YuBZ
 sf7tkYJZH+ft/WoUyKj2lIx/va1nYhwRPA5BGKVIa7veBJ1RE/bzqTprd9JNN/gXPj
 mFLPpp1jHfAqFCQkGkkh6RsPFBrH9EeUPPGoe+KL9TW2Pwb27Bd1ZYYgCAKEHHlIvx
 MQlezumKf13HQ==
From: Mark Brown <broonie@kernel.org>
To: matthias.bgg@gmail.com, Trevor Wu <trevor.wu@mediatek.com>, tiwai@suse.com
Cc: Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org,
 dan.carpenter@oracle.com, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, bicycle.tsai@mediatek.com,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] ASoC: mediatek: common: handle NULL case in
 suspend/resume function
Date: Fri, 10 Sep 2021 17:08:44 +0100
Message-Id: <163128974013.2897.10752321808133485674.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210902082111.9287-1-trevor.wu@mediatek.com>
References: <20210902082111.9287-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210910_090926_450691_19776D3D 
X-CRM114-Status: GOOD (  11.71  )
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

On Thu, 2 Sep 2021 16:21:11 +0800, Trevor Wu wrote:
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
