Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D36AC43219
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Apr 2022 09:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lqGRB/PF9q6nfFgO0Nvfrkhae2bjZ3BNmGGWS8vad1M=; b=vkl/r3QyzoRIZG
	uBAX5AgYnEu12IpNTkHqYFMyEL55DUQlxspIzhNCUQ339kgxrsT1rsQP27bWwTZWEIPhOmipmfOSA
	ogDlCeQiYAAgc/FilGbDZlV5sZ4pMo6UQcMbUsJvQjU/1TNvhIqeZjqX3gEnnnlktmvYOzoUVWpRw
	GMRNEkiNkvyKG5P9dqXHni2/eqySLIMSOKwO/pCfZ3s/SIBi2WjaVPaW4GaruPpZ2hNZEKyNur1ac
	O+i0qTnGlnlXoBRiHg2fn2lpIoQuEInvMkub0ZeDdu4B1oz08y/Zo3LSOEZalLyOa1xOTqzE9bHKM
	n35T6amqh1aAaxH5lfug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbfYQ-000QgW-9W; Tue, 05 Apr 2022 09:32:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbfXt-000QJj-3a; Tue, 05 Apr 2022 09:32:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 98607616D5;
 Tue,  5 Apr 2022 09:32:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 117A1C385A9;
 Tue,  5 Apr 2022 09:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649151136;
 bh=Ep4IX5zQgCVW0s4Bsx2dOmJ9bxMmB3cMCg3WQ6oFitA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=DKZLbHrqwXMwQzuR+wNT6n+G+9rXglYwug01mCcWWbXmoIQfO/Vpe70kT0YFazhyK
 HpOqieISwH+oDXSYGB0qR6MK7w44XVnjMRZxG4zq+FfU+Kc11T9nMNyNbLuzdr+uoE
 AzuomW8eVIVETeykPaZ/8CHMDyIjMSoNCbYs43EN+sL2GzIRO3QtfI2rF2Xf6RbCHJ
 oJXDMRIWYXUgwy4POFFvax9loMOSMD3MAgqtqVW3lY5SWBMTsRKqoeTzqqlexxj65r
 PZzqgRvA9WUKcV4lthROWr0zndnyyXA3K6MzFB4OmMuaT3M/kWHlWtZa6CvyTuJxi4
 4IA3mMAdxEtnA==
From: Mark Brown <broonie@kernel.org>
To: robh+dt@kernel.org, johnson.wang@mediatek.com
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-kernel@vger.kernel.org
In-Reply-To: <20220401080212.27383-1-johnson.wang@mediatek.com>
References: <20220401080212.27383-1-johnson.wang@mediatek.com>
Subject: Re: [RESEND v2 0/2] Add support for MediaTek PMIC MT6366
Message-Id: <164915113479.276837.8566634203471784091.b4-ty@kernel.org>
Date: Tue, 05 Apr 2022 10:32:14 +0100
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220405_023217_240165_902F159A 
X-CRM114-Status: GOOD (  14.79  )
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

On Fri, 1 Apr 2022 16:02:10 +0800, Johnson Wang wrote:
> This patchset adds support for MediaTek PMIC MT6366.
> MT6366 is the primary PMIC for MT8186 and probably other SOCs.
> 
> Resend v2:
> - rebase on Linux 5.17
> 
> Changes in v2:
> - rebase on Linux 5.17-rc8
> - change subject line
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/2] regulator: mt6366: Add support for MT6366 regulator
      commit: d077002c9d07dc6f64d07a362202a1e1081b2f6c
[2/2] dt-bindings: regulator: Add BUCK and LDO document for MT6358 and MT6366
      (no commit info)

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
