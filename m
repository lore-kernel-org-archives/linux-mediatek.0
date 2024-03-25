Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED3BCD11DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Mar 2024 02:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xXFT/5nmwt+aZ01Yjvvw2edOycAJO3N51t8bkQyYwjY=; b=TdYw2Ia61vhrJCO03pOg8zVWs7
	LNgsg4y3pFDW/CrTENcR5d1/72oCXf8zGUwxE/zXjxJVylsElvLjXLHSHvts1tbtPdi7ihUt/zTg7
	f0TQyOQbHu6iAWq8h3pVPrS/7CGirJqpJMSVSxGia7AG99fUpnd3GZqRGFZFirjNVIV1ImvdI8GCa
	DijIdyRlYNLSJ6YWJGyXAMmk6+/mIKGWYxWhAg19QH9hyP3CNEir2DXddr8MlBkChbhk6zyacFJz9
	p+qv+eupR+PalJzeKkYp0/qbCDPFU/iqspRWoxTMS/lQ9nmRwrripsZPpow0bl63/7+TpWrfiRwia
	9L5c3m4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roZpq-0000000EbEj-1cOP;
	Mon, 25 Mar 2024 02:13:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roZpl-0000000EbBJ-3urE;
	Mon, 25 Mar 2024 02:13:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 36E7960DFE;
	Mon, 25 Mar 2024 02:13:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C2673C3278B;
	Mon, 25 Mar 2024 02:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711332787;
	bh=5wz/G6BX39xadTRq0vFfWqYZDZhSRjYlx0kuuawdnUY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=bf4PA4AJ6lFivhLpGcubQoBLV61qpUeFb5CEvCqEnG+WnZVpdTtq1TuutfbOOTnK8
	 KUbnm61riFCmr43khH6NJi+4O1d75Ldpm05eeetUHo1B1Wi5vnJupujdw46EbtGMoy
	 guqa2zX2JJk5Oa+qv/Oa+zEqgpaecqGNAMw04MelD+IQ2unKuY71gotTmBa86UnRwW
	 nytA2WM5NsQWo/cY8jD0IUH2Bh9n9HuqLCO+m9hyxg0EyTrdg7l7WlHXTeT9aqwg9v
	 uuNMse2kFdLrJV17V0aMiyoJc+5+ucfT+2/0JNrcXygvVB5vKNmDS3mjGr2f763QO+
	 WAOcXVm6tj7Rw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B4277D2D0E4;
	Mon, 25 Mar 2024 02:13:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] treewide,
 serdev: change receive_buf() return type to size_t
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: <171133278773.9916.16472744560807510288.git-patchwork-notify@kernel.org>
Date: Mon, 25 Mar 2024 02:13:07 +0000
References: <20240122180551.34429-1-francesco@dolcini.it>
In-Reply-To: <20240122180551.34429-1-francesco@dolcini.it>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: gregkh@linuxfoundation.org, jirislaby@kernel.org,
 linux-bluetooth@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 greybus-dev@lists.linaro.org, linux-iio@vger.kernel.org,
 netdev@vger.kernel.org, chrome-platform@lists.linux.dev,
 platform-driver-x86@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-sound@vger.kernel.org, francesco.dolcini@toradex.com,
 luiz.dentz@gmail.com, johan@kernel.org, elder@kernel.org, jic23@kernel.org,
 lee@kernel.org, kuba@kernel.org, pabeni@redhat.com, edumazet@google.com,
 davem@davemloft.net, krzysztof.kozlowski@linaro.org, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com, bleung@chromium.org, tzungbi@kernel.org,
 robh@kernel.org, Jonathan.Cameron@huawei.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240324_191310_038288_6AAE5C73 
X-CRM114-Status: GOOD (  10.71  )
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
by Greg Kroah-Hartman <gregkh@linuxfoundation.org>:

On Mon, 22 Jan 2024 19:05:51 +0100 you wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> receive_buf() is called from ttyport_receive_buf() that expects values
> ">= 0" from serdev_controller_receive_buf(), change its return type from
> ssize_t to size_t.
> 
> The need for this clean-up was noticed while fixing a warning, see
> commit 94d053942544 ("Bluetooth: btnxpuart: fix recv_buf() return value").
> Changing the callback prototype to return an unsigned seems the best way
> to document the API and ensure that is properly used.
> 
> [...]

Here is the summary with links:
  - [v2] treewide, serdev: change receive_buf() return type to size_t
    https://git.kernel.org/chrome-platform/c/fed99212acae

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



