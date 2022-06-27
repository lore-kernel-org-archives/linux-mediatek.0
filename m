Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFC0DC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jun 2022 23:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hzDr0I0MvQEYq1F6ZWdHEWqZJGcXRcrrPh8TC7so3yc=; b=qztqTo36gQ3FM6d5YT8i/7Fjjp
	tfL6wSHFbLVWqFCYwFereiLtnLkBR9B9F34ZbGm+7/yORgvQbI8rWEmYqJmZWlBzLArQrYCypXXn7
	1jMJ0oio8zsQWxm2PyJF/WxhnDf0v3rQWLyPYfZfNXVBf9TkHnEknmhsFb65+MCY7B6472dkC8y32
	2nC6rKn0w269YTZRMeSOkuo0D6YPHsDbj9atxhAIMZOEe7DjqjSQKn2lTdAklSDcqgxvgFf3IV8K+
	u/7RgdcEsRwppRbAxB6NQWQTTzgDl/7ABXkbky7f+5qfQ20hVfimnzzY5ELyJ+qGnpbcmVU9hDDaT
	Zvbv9b9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5xiO-003BXT-Bf; Mon, 27 Jun 2022 23:00:20 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5xiL-003BWl-GG
	for linux-mediatek@lists.infradead.org; Mon, 27 Jun 2022 23:00:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 07C3AB80F98;
	Mon, 27 Jun 2022 23:00:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B91F4C34115;
	Mon, 27 Jun 2022 23:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656370813;
	bh=Cz/mDLhtdOHDanqNZb29JFI8MUxivS35BpGxClMYb/4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=vIUOwrANsGFnJKMs0wcS/+4g7TJ2Tl/KKXsuhRKu5Nl1vZinaHOcdIT6f9kx+AJkx
	 rWuU8NZcpnQajR+O47at7kYCtapC5ZqMMV7SJmiZA2KygQQ9WG+y//e6AgAjf81diB
	 s414gD+9B8inUlu8XZlHD/ET+4EHqEuWusj2M9hNT3dxaEzdKsET24RKpfofSas4Iu
	 GwhnGYniaG2r5OFkRFVRBDGWZEoFkc1Vod/VqmpdINNDl+crmHsKlKHTqGY+uVvAXQ
	 cqL0Zuddg8rlH+eoXzGmV6Qo0HHIZ//m/IkUhW0cTuk4N4wbktHXQB+0oerAgzv+RO
	 GFCTLIEkGQlgg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 96E0DE49BBA;
	Mon, 27 Jun 2022 23:00:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3] Bluetooth: btmtksdio: Add in-band wakeup support
From: patchwork-bot+bluetooth@kernel.org
Message-Id:  <165637081361.14351.14905070415572630432.git-patchwork-notify@kernel.org>
Date: Mon, 27 Jun 2022 23:00:13 +0000
References: <848d3d5baf23eb78411a9672b8973ae3c593db98.1656285304.git.objelf@gmail.com>
In-Reply-To: <848d3d5baf23eb78411a9672b8973ae3c593db98.1656285304.git.objelf@gmail.com>
To: Sean Wang <sean.wang@mediatek.com>
Cc: marcel@holtmann.org, johan.hedberg@gmail.com, Soul.Huang@mediatek.com,
 YN.Chen@mediatek.com, Leon.Yen@mediatek.com, Eric-SY.Chang@mediatek.com,
 Deren.Wu@mediatek.com, km.lin@mediatek.com, robin.chiu@mediatek.com,
 Eddie.Chen@mediatek.com, ch.yeh@mediatek.com, posh.sun@mediatek.com,
 ted.huang@mediatek.com, Eric.Liang@mediatek.com, Stella.Chang@mediatek.com,
 Tom.Chou@mediatek.com, steve.lee@mediatek.com, jsiuda@google.com,
 frankgor@google.com, abhishekpandit@google.com, michaelfsun@google.com,
 mcchou@chromium.org, shawnku@google.com, linux-bluetooth@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 yake.yang@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_160017_722615_AA1E10AE 
X-CRM114-Status: UNSURE (   9.48  )
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

On Mon, 27 Jun 2022 07:27:36 +0800 you wrote:
> From: Sean Wang <sean.wang@mediatek.com>
> 
> Commit ce64b3e94919 ("Bluetooth: mt7921s: Support wake on bluetooth")
> adds the wake on bluethooth via a dedicated GPIO.
> 
> Extend the wake-on-bluetooth to use the SDIO DAT1 pin (in-band wakeup),
> when supported by the SDIO host driver.
> 
> [...]

Here is the summary with links:
  - [v3] Bluetooth: btmtksdio: Add in-band wakeup support
    https://git.kernel.org/bluetooth/bluetooth-next/c/681ec6abcd7f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



