Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDA28C28B30
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Mar 2025 19:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6vXgmYO6jAESBk/+0eG5q1NE+gBOXDy0zHCkzyh71bY=; b=FLPBVrZzMwjybWx31Nvnu4XX3P
	CXZ0JmMAkoFB+HVdbwWb9ZtMeeQBnXXv4C82dw4E3LGra3arAgqtYeN8usEmRPlsqhsjCrbl7/ot9
	bLIJ66nSbJ8HOwLR+xQKciwOihjXDYwkzlZKRTS6JltRq9RHDNjjvHANTZ2tHYkEKVZqMUzMxLjKy
	0lnPT6fgnYVd1frtYD74trg/NRY3VJCNRsB5b070Bad5gM/lGF+rWhZdlF+o9FLx6lpBtD/aJXwIl
	OL8QKeQdzlk/xZBdO/zYgS8RB8YPBjsQY1lI+guFWisaCgxI8ToPO+zECfduTQboaktfhEJ05quxG
	9Pf5oJgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvL7l-0000000D0Zq-1gmH;
	Thu, 20 Mar 2025 19:00:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvL7j-0000000D0Y5-0hjz
	for linux-mediatek@lists.infradead.org;
	Thu, 20 Mar 2025 19:00:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 52CFB44D79;
	Thu, 20 Mar 2025 19:00:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D753C4CEF2;
	Thu, 20 Mar 2025 19:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742497210;
	bh=0xn17N6DJYWebRRn/jGVYxuRuDM3bLIVEkKZ0yC1gSk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=dK/8lUE0pIBRM1oes/UzSveRKsx48zKR1OhoGrXEP3EEJKy9VHS7LkDGnWDtT6BIn
	 6OWtqTer6kGgr2tvFa/++YgwhlhpWZFS6Ca79XLgujVJv4jzncCKiafILc2+ITPaEd
	 +sOxjn7YswZEpbI7mujcnPW6w33q30lqgrPhAIJBk8JpGrCrb9WMKN9fm+32h/kHi8
	 r9izj9p1agWYw8AwcEyVCqECw2iqkQQh4ZqotAUUg4MeT3WrOwfBG2E5opO9mMV4Dn
	 OKwIE3YTomr3l7XmUBUgOK599Lrqjn+pbWAI25xMp7ej9AovcYNpo5IvT7cmEbqL5I
	 3dOdf5ZypjPcw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AF0683806654;
	Thu, 20 Mar 2025 19:00:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] Bluetooth: btmtk: Remove the resetting step before
 downloading the fw
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <174249724626.1878155.10663828087577774363.git-patchwork-notify@kernel.org>
Date: Thu, 20 Mar 2025 19:00:46 +0000
References: <20250315022730.11071-1-hao.qin@mediatek.com>
In-Reply-To: <20250315022730.11071-1-hao.qin@mediatek.com>
To: Hao Qin <hao.qin@mediatek.com>
Cc: marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
 sean.wang@mediatek.com, deren.Wu@mediatek.com, aaron.hou@mediatek.com,
 chris.lu@mediatek.com, steve.lee@mediatek.com,
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_120011_227050_ECF8B8E2 
X-CRM114-Status: UNSURE (   8.20  )
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

This patch was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Sat, 15 Mar 2025 10:27:30 +0800 you wrote:
> Remove the resetting step before downloading the fw, as it may cause
> other usb devices to fail to initialise when connected during boot
> on kernels 6.11 and newer.
> 
> Signed-off-by: Hao Qin <hao.qin@mediatek.com>
> ---
>  drivers/bluetooth/btmtk.c | 10 ----------
>  1 file changed, 10 deletions(-)

Here is the summary with links:
  - Bluetooth: btmtk: Remove the resetting step before downloading the fw
    https://git.kernel.org/bluetooth/bluetooth-next/c/aca3e8a5c46f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



