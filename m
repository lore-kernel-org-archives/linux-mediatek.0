Return-Path: <SRS0=m4qr=PB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8721C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Oct 2021 16:32:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C4366113D
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Oct 2021 16:32:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2C4366113D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=holtmann.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8rtOurfma3jP1vhu5lM0nteoCQIOwFah+xgTEP/xXAE=; b=Ry4tNB5b0XNAwR
	n9YtSShTb1wAqgDlkpvuF+o2GNYswixFGike/Zyv1LSkMlRWPH4Iwvq8RnOytyfe1AxQl0o/Ztp1n
	c2S4et7D/9WQe1CffR6f+pjt8QcbjZ0BO3fz9v1Qle2mZVgZ1ZXxWCjDCSlFSGm2qnTsIZWrtPBzv
	eUjbd59AjhmCw/KdoJfjKk300yjhdk99E6RKqLB+Gn5phsZNQChf7cx9c+seMnaD6lCc0Hl0BehRS
	Clr5Wv9e+zL85X8C850mU9diOqqiJBvcsHU4m7QNHZyPephdg0iZXrHi6cm6qzhI/EN1xHx9jsSCp
	0xHUcL3fgXirpYMy39Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mahBJ-00032p-VT; Wed, 13 Oct 2021 16:32:41 +0000
Received: from coyote.holtmann.net ([212.227.132.17] helo=mail.holtmann.org)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mahBH-00030g-6Z
 for linux-mediatek@lists.infradead.org; Wed, 13 Oct 2021 16:32:40 +0000
Received: from smtpclient.apple (p4ff9f2d2.dip0.t-ipconnect.de
 [79.249.242.210])
 by mail.holtmann.org (Postfix) with ESMTPSA id C9108CECFA;
 Wed, 13 Oct 2021 18:32:30 +0200 (CEST)
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH] Bluetooth: btusb: fix memory leak in
 btusb_mtk_submit_wmt_recv_urb()
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20211013162204.13919-1-mark-yw.chen@mediatek.com>
Date: Wed, 13 Oct 2021 18:32:30 +0200
Cc: Johan Hedberg <johan.hedberg@gmail.com>, will-cy.lee@mediatek.com,
 linux-bluetooth <linux-bluetooth@vger.kernel.org>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Message-Id: <75730B1E-4A50-4DC5-8D1A-84CE58C04E72@holtmann.org>
References: <20211013162204.13919-1-mark-yw.chen@mediatek.com>
To: mark-yw.chen@mediatek.com
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211013_093239_437995_BCCB220C 
X-CRM114-Status: UNSURE (   8.21  )
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

Hi Mark,

> Driver should free `usb->setup_packet` to avoid the leak.
> 
> $ cat /sys/kernel/debug/kmemleak
> unreferenced object 0xffffffa564a58080 (size 128):
>    backtrace:
>        [<000000007eb8dd70>] kmem_cache_alloc_trace+0x22c/0x384
>        [<000000008a44191d>] btusb_mtk_hci_wmt_sync+0x1ec/0x994
>    [btusb]
>        [<00000000ca7189a3>] btusb_mtk_setup+0x6b8/0x13cc
>    [btusb]
>        [<00000000c6105069>] hci_dev_do_open+0x290/0x974
>    [bluetooth]
>        [<00000000a583f8b8>] hci_power_on+0xdc/0x3cc [bluetooth]
>        [<000000005d80e687>] process_one_work+0x514/0xc80
>        [<00000000f4d57637>] worker_thread+0x818/0xd0c
>        [<00000000dc7bdb55>] kthread+0x2f8/0x3b8
>        [<00000000f9999513>] ret_from_fork+0x10/0x30
> 
> Signed-off-by: Mark-YW.Chen <mark-yw.chen@mediatek.com>
> ---
> drivers/bluetooth/btusb.c | 5 +++++
> 1 file changed, 5 insertions(+)

patch has been applied to bluetooth-next tree.

Regards

Marcel


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
