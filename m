Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41084C4167B
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Nov 2023 03:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rvm9gnX//5y+xVrrDH6LZxrmH8wa9hMD0YGGB9u5xcE=; b=0y7YpCT39jOZL2Rhl8orh+FPwN
	50TbajEQ9G+ncPIG6g+1RkqhPghtr3yYwgszhLWkmD8Ge0JuD+luY95dD4UjsMfnM8G4l00o9SQ46
	r68mgDhZgTCMnaqm3MzWCNkUuJjwSQyfsrZP9/sDiyEajfrEAvjhYD8sTdt+4S1KMIywuWrhf+hrE
	HCXQeNqYCC/KCd5YxqTCJRsIqLPanai1mkl5qpmT/hVWKAd1yLlz9b0R0qvCcDDuae46i4FFrEB2m
	wFuPlKjKzcU2jS1a6cHgfz9d7QqvaNhaZBxPCvbKbGLicSOhaCeIP0/OiwD4nZoX0R/W9UO3CT7r8
	+51pHHhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2Nqb-00D9Dx-0U;
	Mon, 13 Nov 2023 03:42:49 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2NqW-00D9CE-0d;
	Mon, 13 Nov 2023 03:42:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 758F8CE1053;
	Mon, 13 Nov 2023 03:42:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5D424C433A9;
	Mon, 13 Nov 2023 03:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699846957;
	bh=cJ8SO9nHStzpr3oXPb7av3bgl8Tcpca5hNprBHV/N28=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=C8SpIn2tY/7fXB31TZP/dWpZaDTw/62k6g4tlpCvWJe8qHTZfpYQjd3y+YLI5nBE4
	 fyMvoUDNzIKMT8JJ5Htho8s5Uu1M8SGAWp0XQkPn7PcoaByfme0zMmW72J514kWAHG
	 F9wQN1jdfwOmPTG140W0KtlGwo0cojQpZv/2bwzMExIlYnRHulwVjpET5nR08M2bdc
	 TqtirqbOAnA4XVobjw23mWE5BVPFVlg7xxZ+Bqr78n52VXqisW5Spz+H272fvkcS2h
	 KX9KoAsq+DQks/aCCs9wbtN03+2gZROK5W/4Om0F8XmTERr2gL2HcZe54Bu6JDxuzZ
	 r9MQS+Ox++w/g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 42EF0E32713;
	Mon, 13 Nov 2023 03:42:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 00/11] pwm: Some random cleanups
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: <169984695726.27851.13669359459890665308.git-patchwork-notify@kernel.org>
Date: Mon, 13 Nov 2023 03:42:37 +0000
References: <20230929161918.2410424-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230929161918.2410424-1-u.kleine-koenig@pengutronix.de>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=3Cu=2Ekleine-koenig=40pengutronix=2Ede=3E?=@ci.codeaurora.org
Cc: thierry.reding@gmail.com, rjui@broadcom.com, sbranden@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, linux-pwm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
 florian.fainelli@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux-mediatek@lists.infradead.org,
 orsonzhai@gmail.com, baolin.wang@linux.alibaba.com, zhang.lyra@gmail.com,
 krzysztof.kozlowski@linaro.org, alim.akhtar@samsung.com,
 linux-samsung-soc@vger.kernel.org, bleung@chromium.org, groeck@chromium.org,
 chrome-platform@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231112_194244_410638_90F4C6EF 
X-CRM114-Status: UNSURE (   8.61  )
X-CRM114-Notice: Please train this message.
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

Hello:

This patch was applied to chrome-platform/linux.git (for-next)
by Thierry Reding <thierry.reding@gmail.com>:

On Fri, 29 Sep 2023 18:19:07 +0200 you wrote:
> Hello,
> 
> this is a set of patches I based my efforts for closing a race condition
> in the pwm core on. I thought I already sent them out, but it seems I
> didn't. So here they come!
> 
> Best regards
> Uwe
> 
> [...]

Here is the summary with links:
  - [11/11] pwm: cros-ec: Simplify using devm_pwmchip_add() and dev_err_probe()
    https://git.kernel.org/chrome-platform/c/896c450960f5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



