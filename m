Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 464F3CD4853
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Sep 2024 16:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1zUXjmFkV9uDNRQqC52XN+jHy3rlC2Yo7N3geB87M0I=; b=VlM3JBVS1V5FWyQBLF9I0nnT96
	UPg6AOoIidqBcIR57oxNG8dIIwD+JozKSIFcw8MvMFTlPHLD5yc1OVp30tmtnsnJchesjxmUb3zRl
	q7PQDUfh5A0A1wbwzjqiVhoSZibNPPIkLUohVs0mkGPEW0rnZ+Y+iFaQaMW6bs1v3D4Ubae2VIMPH
	SAdgmIoK/zTWSMtUXKIIoSmAHmnyppLxYJERH8ov6c+Pgw/u/dTkTD63kVhnqOmad4bdIwAhgg/U/
	1B25G8xa201sl3At2RS18ZkGHaPdlX3PDrVTidG716Q7hvjWnNvb3YVfWv60jNdEAmTS43p/Q5Wzf
	FxFi10xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slsQN-000000058e7-2ya7;
	Wed, 04 Sep 2024 16:00:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slsMS-000000057m6-303y;
	Wed, 04 Sep 2024 15:56:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=1zUXjmFkV9uDNRQqC52XN+jHy3rlC2Yo7N3geB87M0I=; b=iW1kincfq2N+I45zgHpRc/zzUH
	yjbGMU51w87BCRraOEihFz0zzB/vy/brTo1MxAJxHsNjO+LgSZHbuxhS22JAhPc7oQvO8VE9N01zp
	GfTrnIfpZRY4MzhGdf2WuXIykqMtaQH4/GSyMHZ3TUfC8ifCoG2SuJgbLnHo3SetB13AqSReHrYT9
	8RaZsVXYCdc9yuU6Xh3FD1cBbSf4bc7GLZA9gVIHFOJ07PkMvMLAgMSY1AHKMQTN7l7JkFRJwYiYA
	/EPUKWZV8iMYv75/HzFeSAiAdGD35qSbuH93ff/el+qYsNa7C8z79ef/ddI9MrvhwgNCaiMYAS8Xz
	1shyg4HQ==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1slsMP-00000000ISo-28GS;
	Wed, 04 Sep 2024 15:55:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 861065C568A;
	Wed,  4 Sep 2024 15:55:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EB9CC4CEC2;
	Wed,  4 Sep 2024 15:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725465353;
	bh=EFuL4YqN+HRnd+i7MSZNWWoRMVk6Uny+7W7L5xrMbZU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=eE1XrfpV//GARKx5SVOmW2jSvmIhEtx5BmXWWrCc+JkiZ0TRFJpPTsPsq77bNcNc4
	 uSg3vMsv5BXrGEBxdJHt9ecmMIgHfRxSsZ97kqJb8EIOK3x5MrpKVfVHpOex5vwRav
	 6eZqbKsv0gsxbKoMIL8vvthNEEQDLD593iQ0DIPHQGqFnfaHeXnlJnsFimKslSs+e4
	 BM7gwaRzv58Y53JiPGOMLZ1snM3VcIQqATF23R/S7BL0UMmOxC708MUiWIu/QDsV/P
	 k7erOQIjgBkYUgEzCK7RxidyOcqGhGqzrzw4eyTo9JmC0M44oU+ZSVaVVqJRIfmqGY
	 Gk1y/P1MhDZLg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Liu Jing <liujing@cmss.chinamobile.com>
Cc: perex@perex.cz, matthias.bgg@gmail.com, 
 angelogioacchino.delregno@collabora.com, linus.walleij@linaro.org, 
 bartosz.golaszewski@linaro.org, kuninori.morimoto.gx@renesas.com, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20240903093623.7120-1-liujing@cmss.chinamobile.com>
References: <20240903093623.7120-1-liujing@cmss.chinamobile.com>
Subject: Re: [PATCH] ASoC: mediatek: mt2701-cs42448: Optimize redundant
 code in mt2701_cs42448_machine_probe
Message-Id: <172546535092.70927.12098749632274765487.b4-ty@kernel.org>
Date: Wed, 04 Sep 2024 16:55:50 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_165557_706744_E798ACF8 
X-CRM114-Status: GOOD (  10.11  )
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

On Tue, 03 Sep 2024 17:36:23 +0800, Liu Jing wrote:
> Utilize the defined parameter 'dev' to make the code cleaner.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt2701-cs42448: Optimize redundant code in mt2701_cs42448_machine_probe
      commit: 77e6a5e40aa393492cf3f1d2623d7d1dff7f33de

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


