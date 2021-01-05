Return-Path: <SRS0=qO9d=GI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67F60C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jan 2021 16:08:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA8AA22CA0
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jan 2021 16:08:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA8AA22CA0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:References:
	In-Reply-To:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JnqmuR4+wBmxBxYTimFwXQitUCcnQj3B9fR27nRYIUE=; b=xNK9v3m1EDkw4r/Zu/daX1zA3
	GSikAZNVmdvYAFEiLGpanzl6FzcRhEOD14v8v+Jp9bAis4leHl+9eaT+DRAkrdM4LIf07H5e0nfb6
	QhlyZLxXSY0JXwLQn0y5oJkmyQC1wEGqcVsy7FKL7ErhyKWGL4nhYgT1AIrrriYBsi1YtHfD6l7W5
	ha7e8NoTkr5b4XdTuQlXBaaErRVpmJIY/FIPZOmJDtQqyFq3CaHw2dLcdfV12k1jZpdGcwfzIiJhi
	6xBaNNNYxBhe44tID2Ptcz6bKZOqJeEqnFZsp2lZ3RERdotOWxxClL+01JIONsKNOoeaTBzkzv3XS
	eioeXnFbg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwosX-0006rz-Q6; Tue, 05 Jan 2021 16:08:13 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwosT-0006r8-K7; Tue, 05 Jan 2021 16:08:10 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 66B0D2226A;
 Tue,  5 Jan 2021 16:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609862887;
 bh=Ds7Ux3fJB9sk2PXSEPGwymkvlgIP6rNtPGxUUwGxUIM=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=AFf8NLyHept3vbYB1LddoUXr4lqxxjVYXbLVU5DW8tGVcMihq5l+IjE0Qvs1FPLKk
 sl+EljIfLj69mBD2KqpQuEr5uTsEWHEeyVkNCS41vA3uQIXTUOT8HWJbH02aKJTnAx
 yMjmoAhAcywlc7qAG06s8Dp0ow+w9bOCR+lwEIviij5YB2fYHQKJNM/itvF23GszZs
 NVKZNCdVHun88PlknuY83o1uKGoEOdTcvzB87+SQYxYgF4y6Ou9TiVM7GWPk20hVen
 tGw28VoLWKrxI4dPxZWzYBezQqwXyH4j8BM7bTKQ8/U4Ma5YxEtwugA3tjEGpn9bhS
 FbvAVLpCWBZJA==
From: Mark Brown <broonie@kernel.org>
To: Ryan Case <ryandcase@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Georgi Djakov <georgi.djakov@linaro.org>, Stephen Boyd <swboyd@chromium.org>,
 Henry Chen <henryc.chen@mediatek.com>
In-Reply-To: <1608790134-27425-1-git-send-email-henryc.chen@mediatek.com>
References: <1608790134-27425-1-git-send-email-henryc.chen@mediatek.com>
Subject: Re: (subset) [PATCH V6 00/13] Add driver for dvfsrc,
 support for active state of scpsys
Message-Id: <160986286072.50149.16225204986666610767.b4-ty@kernel.org>
Date: Tue, 05 Jan 2021 16:07:40 +0000
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210105_110809_936912_367B31DF 
X-CRM114-Status: GOOD (  14.71  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, James Liao <jamesjj.liao@mediatek.com>,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Fan Chen <fan.chen@mediatek.com>,
 linux-mediatek@lists.infradead.org, Arvin Wang <arvin.wang@mediatek.com>,
 Nicolas Boichat <drinkcat@google.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 24 Dec 2020 14:08:41 +0800, Henry Chen wrote:
> This series is based on v5.10-rc1.
> 
> The patchsets add support for MediaTek hardware module named DVFSRC
> (dynamic voltage and frequency scaling resource collector). The DVFSRC is
> a HW module which is used to collect all the requests from both software
> and hardware and turn into the decision of minimum operating voltage and
> minimum DRAM frequency to fulfill those requests.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[11/13] regulator: Regulator driver for the Mediatek DVFSRC
        commit: a0db6b0aa670ba040f959a000ef24dd4238e016b

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
