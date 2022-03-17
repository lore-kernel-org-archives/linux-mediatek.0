Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBB20C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Mar 2022 11:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+Ic/6C6djwepqrkHNVWuXK8O/d8PErm3I909JIJFvJk=; b=Eexs5//G90Xl50
	g6RHf8AuuzZjn8Lgg9e3BXZekGkOojuj+sDnEXxfoquEjBtcrY5E1zrdxIaFqurKT9lJbjX9i1bvY
	d78ivbSR76xTWaxn7obOwUxX0RHo9K1M6/Th8nz8lcbVV46eFvm5VLN87nIqWjUhwxklNINsAJ97q
	dkOJ4Ok2CEXqpLLgk5QAizjo6u1NIihrHq+NjULbWn7gfseLnL5USPrIQf+LXEU17u5iw78ypAiI6
	QyKkIDxYpGmI6518YAfJBL3n9P7d3IP+6u0Y67UZuZu8EsmATxHclvPlkhFFO8X8szvHxt1jJLTUe
	8ez7leEpUdi8V4Hb01Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUoBA-00FoI7-G1; Thu, 17 Mar 2022 11:20:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUoAy-00FoDE-Cw
 for linux-mediatek@lists.infradead.org; Thu, 17 Mar 2022 11:20:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1677E618C2;
 Thu, 17 Mar 2022 11:20:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 76C11C340EC;
 Thu, 17 Mar 2022 11:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647516014;
 bh=UIA6S5+bI123Q5sbQJDY+Ns5uSiqeYzaBozSAYu/4K4=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=Z3ZZuulDBrgB/ZWQVkelumI0w+sVh3lzG1cKOigLf8YoZK9+k8cvjEJXySuxHQwIU
 YQHQTtsz4E61+EAylenGzmklJA1rnFMDYx2/5gtc3odgjHEEZrBmP/DMxQgmxVCuGT
 dZNDIho6Y+6qiPRaAdOKORAabHPpN7fRk/YyJpmrj9PV3NgUzKl8PYyIFlW3hXIz2P
 Ol/i8iXXw9xLFny2UuI1kc2+080I7bUgnibJJON2ktEBDjUuvPdt+pXhw2+AE4UI98
 iuvnPoJg0Jlis2IRn2+Q9x6NHMURWfc1XzEcqCH8F8Jj2qVutzTh2HoRixN8o1aTJt
 IPadvR/zYskIA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 59BE2EAC09C; Thu, 17 Mar 2022 11:20:14 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v5 1/5] Bluetooth: btmtksdio: Fix kernel oops in
 btmtksdio_interrupt
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <164751601436.15552.12891442472636759067.git-patchwork-notify@kernel.org>
Date: Thu, 17 Mar 2022 11:20:14 +0000
References: <d4be9c9c1ce2757bad4df19885d605e97a1ceec8.1647472087.git.objelf@gmail.com>
In-Reply-To: <d4be9c9c1ce2757bad4df19885d605e97a1ceec8.1647472087.git.objelf@gmail.com>
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
X-CRM114-CacheID: sfid-20220317_042016_511305_928C0652 
X-CRM114-Status: UNSURE (   8.01  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello:

This series was applied to bluetooth/bluetooth-next.git (master)
by Marcel Holtmann <marcel@holtmann.org>:

On Thu, 17 Mar 2022 07:15:19 +0800 you wrote:
> From: Yake Yang <yake.yang@mediatek.com>
> 
> Fix the following kernel oops in btmtksdio_interrrupt
> 
> [   14.339134]  btmtksdio_interrupt+0x28/0x54
> [   14.339139]  process_sdio_pending_irqs+0x68/0x1a0
> [   14.339144]  sdio_irq_work+0x40/0x70
> [   14.339154]  process_one_work+0x184/0x39c
> [   14.339160]  worker_thread+0x228/0x3e8
> [   14.339168]  kthread+0x148/0x3ac
> [   14.339176]  ret_from_fork+0x10/0x30
> 
> [...]

Here is the summary with links:
  - [v5,1/5] Bluetooth: btmtksdio: Fix kernel oops in btmtksdio_interrupt
    https://git.kernel.org/bluetooth/bluetooth-next/c/496eab9dde9f
  - [v5,2/5] Bluetooth: mt7921s: Set HCI_QUIRK_VALID_LE_STATES
    https://git.kernel.org/bluetooth/bluetooth-next/c/aeeb8ed27062
  - [v5,3/5] Bluetooth: mt7921s: Add .get_data_path_id
    https://git.kernel.org/bluetooth/bluetooth-next/c/c844ce71d5be
  - [v5,4/5] Bluetooth: mt7921s: Add .btmtk_get_codec_config_data
    https://git.kernel.org/bluetooth/bluetooth-next/c/3cabc5ca2c9d
  - [v5,5/5] Bluetooth: mt7921s: Add WBS support
    https://git.kernel.org/bluetooth/bluetooth-next/c/255a55aaccb1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
