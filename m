Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C322FC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Mar 2022 15:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X0YUNyZlYveLQ1cv3T1TlzC35tNnqrHWRIblsKEflXc=; b=Airz/ulcH07V0V
	pq90Y5jTbF4RgGK8vhu5TaCfolmymr9DvlywzkjzPF7epYDUB/XraN8qaLuclX5Hvkv+cuFw72dNF
	u+PGdrA3Qd+bJPyJw9mprGB+ZWHBz5CXEzDEEoP2dAmvYnf2X8PbF0NpHow0ur+EBAQ9rx8ZAM8Nu
	e7c6b6u/HJjx+K2EXk47WGED3zVcc0xc94/3nPZ2ew4TsL62xjagsTYsQmJT+bW/uUueKU8rd2Z4V
	xJ0tFnoCiaJdyJtL6fr4lZ6mOYfqYOZfsnyFjmdWi/87V+4oMt4ryU3FDZRSmj6c9ISn+f6oaOS//
	0HRjRahYMESURn05/dvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQ9x8-00AkiS-Mw; Fri, 04 Mar 2022 15:34:46 +0000
Received: from coyote.holtmann.net ([212.227.132.17] helo=mail.holtmann.org)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQ9x5-00Akgn-F6
 for linux-mediatek@lists.infradead.org; Fri, 04 Mar 2022 15:34:45 +0000
Received: from smtpclient.apple (p5b3d2910.dip0.t-ipconnect.de [91.61.41.16])
 by mail.holtmann.org (Postfix) with ESMTPSA id 5D89DCECCC;
 Fri,  4 Mar 2022 16:34:40 +0100 (CET)
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.60.0.1.1\))
Subject: Re: [PATCH 2/2] Bluetooth: btmtksdio: Fix kernel oops when sdio
 suspend.
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <939606fc0825aa17729ab9a1400f3993043fa2d3.1645573830.git.objelf@gmail.com>
Date: Fri, 4 Mar 2022 16:34:40 +0100
Cc: Johan Hedberg <johan.hedberg@gmail.com>,
 =?utf-8?B?Ik1hcmstWVcgQ2hlbiAo6Zmz5o+a5paHKSI=?= <Mark-YW.Chen@mediatek.com>, 
 Soul.Huang@mediatek.com, YN.Chen@mediatek.com, Leon.Yen@mediatek.com,
 Eric-SY.Chang@mediatek.com, Deren.Wu@mediatek.com, km.lin@mediatek.com,
 robin.chiu@mediatek.com, Eddie.Chen@mediatek.com, ch.yeh@mediatek.com,
 posh.sun@mediatek.com, ted.huang@mediatek.com, Eric.Liang@mediatek.com,
 Stella.Chang@mediatek.com, Tom.Chou@mediatek.com, steve.lee@mediatek.com,
 jsiuda@google.com, frankgor@google.com, jemele@google.com,
 abhishekpandit@google.com, michaelfsun@google.com, mcchou@chromium.org,
 shawnku@google.com, linux-bluetooth@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Yake Yang <yake.yang@mediatek.com>
Message-Id: <0E9BE045-5600-4EBC-8461-8779967E6B7B@holtmann.org>
References: <dba1c05e4bfdf53e631ff134eaa9449e2ad5deef.1645573830.git.objelf@gmail.com>
 <939606fc0825aa17729ab9a1400f3993043fa2d3.1645573830.git.objelf@gmail.com>
To: Sean Wang <sean.wang@mediatek.com>
X-Mailer: Apple Mail (2.3693.60.0.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_073443_705327_D4BBA358 
X-CRM114-Status: UNSURE (   9.32  )
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

Hi Sean,

> Do not kfree the skb when the skb failed to send with __hci_cmd_sync
> 
> 2435.241210] Call trace:
> [ 2435.241224]  kfree_skb+0x20/0x140
> [ 2435.241240]  btmtksdio_sdio_wakeup+0x8c/0xcc
> [ 2435.241360]  hci_suspend_notifier+0x108/0x184
> [ 2435.241377]  notifier_call_chain_robust+0x58/0xd8
> [ 2435.241390]  blocking_notifier_call_chain_robust+0x54/0x84
> [ 2435.241402]  pm_notifier_call_chain_robust+0x2c/0x4c
> [ 2435.241414]  suspend_prepare+0x40/0x238
> [ 2435.241425]  enter_state+0xec/0x3a8
> [ 2435.241436]  pm_suspend+0x60/0xcc
> [ 2435.241446]  state_store+0xb8/0x114
> [ 2435.241460]  kobj_attr_store+0x18/0x2c
> [ 2435.241473]  sysfs_kf_write+0x44/0x58
> [ 2435.241486]  kernfs_fop_write_iter+0xf4/0x190
> [ 2435.241500]  vfs_write+0x2b0/0x2e4
> [ 2435.241511]  ksys_write+0x80/0xec
> [ 2435.241523]  __arm64_sys_write+0x24/0x30
> [ 2435.241538]  el0_svc_common+0xf0/0x1d8
> [ 2435.241550]  do_el0_svc_compat+0x28/0x54
> [ 2435.241564]  el0_svc_compat+0x10/0x1c
> [ 2435.241574]  el0_sync_compat_handler+0xa8/0xcc
> [ 2435.241586]  el0_sync_compat+0x188/0x1c0
> [ 2435.241606] Code: a9014ff4 910003fd b40002c0 aa0003f3 (b84d4c08)
> [ 2435.241619] ---[ end trace d496539b850baf14 ]---
> 
> Fixes: ce64b3e94919  ("Bluetooth: mt7921s: Support wake on bluetooth")
> Co-developed-by: Sean Wang <sean.wang@mediatek.com>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> Signed-off-by: Yake Yang <yake.yang@mediatek.com>
> ---
> drivers/bluetooth/btmtksdio.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
