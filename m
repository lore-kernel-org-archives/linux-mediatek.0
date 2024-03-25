Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 754B9C47DD9
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Mar 2024 01:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Np3utDMMYgLTqdKqORxO4tiX0QGF5QCsO9DhtNWWUoc=; b=MrI/dBRlFVvG26jmSm7OZzoVam
	obLCQM+3vbBGKrKsMYCuQWHojQkNb1MUws7kCWQ82Z9MRla90m85vIXDIqaZnV2uAwBITfrREWwhd
	ChK6182Ng7ArHR0II5MrWEjLrV848MBAc4UORvd9yw339/mk0S6vvAeIBO4SK7fkNF/1G0yMXUcqR
	ieJ5CzrL642ySYY8y+Y8ft5lrzdZmp7rGyYhbxjXwWNQOiZMCDxd99dRyk+1OwkCJUq9Lv4U3S22J
	uZCFnPQqhkXLkEcEqMDCIELYFYysRZWb6DSIRibIKTkizrDLBEjCE4UP7ybkDOISs8our/YMb1ufj
	eeAacL+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roZYB-0000000EW6T-30ze;
	Mon, 25 Mar 2024 01:54:59 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roZXk-0000000EVrG-09gP;
	Mon, 25 Mar 2024 01:54:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 10B90CE0FE2;
	Mon, 25 Mar 2024 01:54:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B6E65C3278A;
	Mon, 25 Mar 2024 01:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711331662;
	bh=6oSruhpUUM/JsOE/DmTpdI2vwwDBrgPZ0a067ebg71g=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=H5v5+h49ENxYpO4Qx7Bxhx6rXvKE1uOYwWRPMuOMKAAAGjbVLOwiVpxBUGFp5tgD0
	 bRdst26F9hDjh7YUZUwWr0x2cAfYNRnj+dxtl/ne6glopIwxX+aoKUy6CJcxbWbaUd
	 MNr0+9gadKcBt3ZsPaHE1sxCHjuCpj1s5bpqLzxDj5YOy3Dta1gaLkaSqBQAzpz4LX
	 MIdCzDsNSrkQbOQKie0yC9qHiPkAzdY9UedzZ5MflJ7Du/7ighdOEZfL1lo9oLnp14
	 irlDyqzxpGP8P9NN8Jv7v8MMGYjdEJEFqvc3HShkoC9g70mAo7FfNU3xI07MtYbvbK
	 tzSw6JGLkISEA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A9007D2D0E0;
	Mon, 25 Mar 2024 01:54:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] treewide,
 serdev: change receive_buf() return type to size_t
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: <171133166268.9916.3624245768126440750.git-patchwork-notify@kernel.org>
Date: Mon, 25 Mar 2024 01:54:22 +0000
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
X-CRM114-CacheID: sfid-20240324_185432_278432_0D8B4BCA 
X-CRM114-Status: GOOD (  10.70  )
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



