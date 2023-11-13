Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F358C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Nov 2023 03:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SVdqDj3HlhYsbXXqk0Yj979CZEa8yBVqJwx2WyD4j3g=; b=Uz7+c6JL0YmEbAepXAnSMx+Hhc
	DbNnKmNpQCI81TqtjRQnGlEDaFJBwlcN94utZW1e7Gry5sOc4tu7gFg0jYQW0y2U6qXNIUpKMua3O
	5hOe00GyU5RN2MFr/TTr6vIgoQpv4IFpd6qsYc5u2iOnJm5OX9/UbyHN5yM7k3cq4lirxS7sHgQJW
	i/siKGPxUI+D3EeTl4d8QjR6ebVlyT+qRnd6eTx0SaBdh3fWOWHI+VQnsDnbl08h0ewtyaR2DE9N0
	GStqSNlpxy2O6g5KCDmjs9GBL4ejhQRHQb1pvn+ppOtKYG9SOAY1XARR0ofrT9OdMJJnk112z9qJ3
	e/wmxX1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2NYR-00D7xI-0u;
	Mon, 13 Nov 2023 03:24:03 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2NYM-00D7v0-1T;
	Mon, 13 Nov 2023 03:24:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0A6AD60C66;
	Mon, 13 Nov 2023 03:23:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 46C41C433B7;
	Mon, 13 Nov 2023 03:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699845835;
	bh=sTORHFHs64nriYPghaE5on9s96E8KHDcO2AObOHSmYs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=bR1Jq+W7c7tQOEqWMzeeY8RXV+14qqgrDGSEnoFOBf3JAOnMTf6CT7qCg10U0nR0P
	 zQzr1cxfpGj+A1f3T5pDsHW2cIgf0D/bSgWVEWXkH5ohWPzIH/9/iepkE9PjSyz9gC
	 jmrDMsciwX/JQ++Cd1yKWAiMyva+22B8Y4Nyr6Al8AZDNmkcmBMrZwHy8agT7BH3V4
	 GxqmlHUYQz2BxWBYea9u+wF8bm5G/JXACqmX1paJ8AaaB7kKKHFIIUai0XBiz+m0Nc
	 JTNijb89KFoGOaIW3f/8C167H5XzHY21wha3qfX4tQgh+vXZdYdYLzaXrSGv25CNfh
	 31jNlqn+wLybg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 26A71C04DD9;
	Mon, 13 Nov 2023 03:23:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 00/11] pwm: Some random cleanups
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: <169984583515.27851.15324455433917462968.git-patchwork-notify@kernel.org>
Date: Mon, 13 Nov 2023 03:23:55 +0000
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
X-CRM114-CacheID: sfid-20231112_192358_558702_E2481274 
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

This patch was applied to chrome-platform/linux.git (for-kernelci)
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



