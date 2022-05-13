Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B498C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 May 2022 11:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yg6/ydFOQ2hQUZmqzA3taCTWBAADmjsKqu4RoAryy44=; b=SIBqXWHusdbUVD
	La0T/rlRFy2rbRZBZPJJjWbW454g5B4GPqxqDOgUCSn6KxvjE2nos/kRrJXtaEwk9ISXZSP+WKh6y
	21Cv3dEext6EasHc4iKSdrsqQEKgyF/oF2p5wB+X7t7ggFGyWdGskdJODUkVeOTiyizLm63VQ3lbK
	ImQZdHme+NZzfzFfwWJ9mbhDc91B6LpRTvEDrfxVilvyM8k02Ht3bn89OJfXud6H2DWLva1Mazc8g
	HfpyjCRoblhCN9HlspMCwcbwVQg6QfFW+q/yDwWQkwHIq5g84W9fQ0Pvz0Adka29muLJF3uPlR+WI
	FLxHJjTQSeKr2kU0auOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npTMl-00Fko5-Ri; Fri, 13 May 2022 11:21:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npTMa-00Fkiy-RU
 for linux-mediatek@lists.infradead.org; Fri, 13 May 2022 11:21:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C07EE61D7C;
 Fri, 13 May 2022 11:21:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2E32EC34114;
 Fri, 13 May 2022 11:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652440899;
 bh=NSumgZGJhzw4Um65FRmlw3GUmWdXI8pQPXolPYvlJDM=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=aca5IocmkQXoNRqXxscwpGHGvEvVVEnoPo6+343RDS7hcbE2/NrNNNGEXvCs4BEyn
 DKYRdC0TqZxf8Z04x9n3PArd4q3cJV77Doc2fbugAoTjKyvvr3Q9GQwdUNArX1AKLU
 SuL3MDpJxPq6NG6OvHpTsCHyAhlm/pHwWxrV2eWjJXzIUGU9wc18D2UNgDlyLD+RIM
 5+VBp4JGfmLL85D5gdBdbXDtM37q3k0bz1WbiwUiL8BMOzf0UmPVZjk70KuP7xzaTl
 uoXFh8LCbj2lLzeA7Ijr0CaS8PmO1TYJU2eJD6PYZoyZf9qVwjWXiNfmByiOhh/kVG
 Cyu/aanGBvGQw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 0E0A1F03935; Fri, 13 May 2022 11:21:39 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] Bluetooth: btmtksdio: fix use-after-free at
 btmtksdio_recv_event
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <165244089905.8477.615548709486219646.git-patchwork-notify@kernel.org>
Date: Fri, 13 May 2022 11:21:39 +0000
References: <f8bf12f9682a01de8905d4c0d7a0a1ff0502ba5f.1652307131.git.objelf@gmail.com>
In-Reply-To: <f8bf12f9682a01de8905d4c0d7a0a1ff0502ba5f.1652307131.git.objelf@gmail.com>
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
X-CRM114-CacheID: sfid-20220513_042141_005330_FB1EBC51 
X-CRM114-Status: GOOD (  10.96  )
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

This patch was applied to bluetooth/bluetooth-next.git (master)
by Marcel Holtmann <marcel@holtmann.org>:

On Thu, 12 May 2022 06:22:15 +0800 you wrote:
> From: Sean Wang <sean.wang@mediatek.com>
> 
> We should not access skb buffer data anymore after hci_recv_frame was
> called.
> 
> [   39.634809] BUG: KASAN: use-after-free in btmtksdio_recv_event+0x1b0
> [   39.634855] Read of size 1 at addr ffffff80cf28a60d by task kworker
> [   39.634962] Call trace:
> [   39.634974]  dump_backtrace+0x0/0x3b8
> [   39.634999]  show_stack+0x20/0x2c
> [   39.635016]  dump_stack_lvl+0x60/0x78
> [   39.635040]  print_address_description+0x70/0x2f0
> [   39.635062]  kasan_report+0x154/0x194
> [   39.635079]  __asan_report_load1_noabort+0x44/0x50
> [   39.635099]  btmtksdio_recv_event+0x1b0/0x1c4
> [   39.635129]  btmtksdio_txrx_work+0x6cc/0xac4
> [   39.635157]  process_one_work+0x560/0xc5c
> [   39.635177]  worker_thread+0x7ec/0xcc0
> [   39.635195]  kthread+0x2d0/0x3d0
> [   39.635215]  ret_from_fork+0x10/0x20
> [   39.635247] Allocated by task 0:
> [   39.635260] (stack is not available)
> [   39.635281] Freed by task 2392:
> [   39.635295]  kasan_save_stack+0x38/0x68
> [   39.635319]  kasan_set_track+0x28/0x3c
> [   39.635338]  kasan_set_free_info+0x28/0x4c
> [   39.635357]  ____kasan_slab_free+0x104/0x150
> [   39.635374]  __kasan_slab_free+0x18/0x28
> [   39.635391]  slab_free_freelist_hook+0x114/0x248
> [   39.635410]  kfree+0xf8/0x2b4
> [   39.635427]  skb_free_head+0x58/0x98
> [   39.635447]  skb_release_data+0x2f4/0x410
> [   39.635464]  skb_release_all+0x50/0x60
> [   39.635481]  kfree_skb+0xc8/0x25c
> [   39.635498]  hci_event_packet+0x894/0xca4 [bluetooth]
> [   39.635721]  hci_rx_work+0x1c8/0x68c [bluetooth]
> [   39.635925]  process_one_work+0x560/0xc5c
> [   39.635951]  worker_thread+0x7ec/0xcc0
> [   39.635970]  kthread+0x2d0/0x3d0
> [   39.635990]  ret_from_fork+0x10/0x20
> [   39.636021] The buggy address belongs to the object at ffffff80cf28a600
>                 which belongs to the cache kmalloc-512 of size 512
> [   39.636039] The buggy address is located 13 bytes inside of
>                 512-byte region [ffffff80cf28a600, ffffff80cf28a800)
> 
> [...]

Here is the summary with links:
  - [v2] Bluetooth: btmtksdio: fix use-after-free at btmtksdio_recv_event
    https://git.kernel.org/bluetooth/bluetooth-next/c/0fab6361c4ba

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
