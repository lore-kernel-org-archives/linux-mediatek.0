Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76CB0C54EED
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Jan 2023 13:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SKU1DrcN/hIJaCwuRpKC6q5K3r53OFXutdxMIgqgMjY=; b=XGyxLrLvgf7E2AHSBmrLAxA/5e
	VDcW5Z1w23Qa5Ze1542L1uRK7EZ74VRfS0im96yOLZ7u2tWw8lq89Riv/7zet8FWfXOnZNJTOTdqK
	gjF6u0bHRsNziTMXmhisC8l74vv5ttNBqyQz+7MTDxBiKK9/yJ2SR6EQgPo0z4ybslRPE+n4nuneY
	7a5Q5P/6USQHg2uLd3twl0W6WHVOrKHKttb/E1oVeHV0xycElliJBgcG275Au7moyhlwykDqI9SJf
	ggIaW36z0zfNjH1QwKfHhfIYN96z9v/wsATpaw1t/BoEkCR76nuXI8y3LrfaMXWLAP4XgKs+CxM7j
	dqCHuGeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMU90-003fHi-Bd; Mon, 30 Jan 2023 13:24:22 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMU8I-003fGh-Oe
	for linux-mediatek@lists.infradead.org; Mon, 30 Jan 2023 13:23:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 9D5D0B8108F;
	Mon, 30 Jan 2023 13:05:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 957ADC433D2;
	Mon, 30 Jan 2023 13:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1675083927;
	bh=hostjZC2cEK6LQ7/wLXYkG/d8rmJJWmNJeHg4Ky6HiI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i+/EzoL/ErHS0sycIQKw8F9/zjfidNjF7sAEoPDorZnBCw0uhB7nuIdlz4cxtnwob
	 TnhjatbH398JUB6IHc4lLBfORlb8qhO0BFKFIyPJO9kSUDqCnp/FfAoXF+KF3cYUsf
	 Dv4ezOLYtzH3Hrgjz/u2KU/6jQ4PL4nHzEk/kGu8=
Date: Mon, 30 Jan 2023 14:05:22 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
Cc: stable@vger.kernel.org, Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Kalle Valo <kvalo@codeaurora.org>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alexey Khoroshilov <khoroshilov@ispras.ru>,
	lvc-project@linuxtesting.org
Subject: Re: [PATCH 5.10 1/1] mt76: fix mt7615_init_tx_queues() return value
Message-ID: <Y9fAkt/5BRist//g@kroah.com>
References: <20230130123655.86339-1-n.zhandarovich@fintech.ru>
 <20230130123655.86339-2-n.zhandarovich@fintech.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230130123655.86339-2-n.zhandarovich@fintech.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_052338_960523_E6D771B5 
X-CRM114-Status: GOOD (  13.71  )
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

On Mon, Jan 30, 2023 at 04:36:55AM -0800, Nikita Zhandarovich wrote:
> mt7615_init_tx_queues() returns 0 regardless of how final
> mt7615_init_tx_queue() performs. If mt7615_init_tx_queue() fails (due to
> memory issues, for instance), parent function will still erroneously
> return 0.
> 
> This change takes into account ret value of mt7615_init_tx_queue()
> when finishing up mt7615_init_tx_queues().
> 
> Fixes: 04b8e65922f6 ("mt76: add mac80211 driver for MT7615 PCIe-based chipsets")
> Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
> 
>  drivers/net/wireless/mediatek/mt76/mt7615/dma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

What is the git commit id of this upstream?

And I can't apply this as-is for the obvious reason it would mess up the
changelog, how did you create this?

confused,

greg k-h

