Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC615C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Nov 2022 12:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pcLFnWBpINWdtN55+ZAWI5KlFvFzM1dcp9eZKa44lfM=; b=H9n3H4zjxy1r7afD47cJnymnzn
	QA0C6GM7ZhZ4YoU+XdOBvcP6CQde4EodD/6p28rJFHkYrfKc5sUPROPW9PNCwHCHYGCrHpHxHpuwr
	3QitAvkxkp+pBLF84v2TXWNmco2aYl0d6kFbBmWdSOBl5TKKA+Gcpwaq4AQVq7Gn1DpwBFdtqGP5u
	+EO/2MsJ7YIKMM6oVEzgAD1MHhS7pniGNdyPcfLrPqFqPah5LyS4v4s65HJnFWmKD9T4TG3ZcN/8s
	qvSmGxT67aZSGS6UfTl7Z8WwQadPT6uZaP89l7e2nWUiangqEI41/bYKtEBVLJ1s2dutXrKQfGM6g
	zPpzByMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ove78-00Dn9N-6p; Thu, 17 Nov 2022 12:35:30 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ove6o-00DmrH-2P; Thu, 17 Nov 2022 12:35:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=pcLFnWBpINWdtN55+ZAWI5KlFvFzM1dcp9eZKa44lfM=; b=RzTsbPp4Zb9sDjtBff+KKYW2UD
	/LXYcUXaJo/RYj4lZeRqS4SDWsyGQTiExeLj/+pC40LQL5/xItq7Ib3IG/Xf7ciPuGoOxKrY5WeVC
	da6+2GEfAsoWYcf84/9hZSFYJXIpLBW5Ak979gv+hvNhdv/FQt0yl7B6UOtd9hGUXefj9WDbaPNwP
	SGZ53Yhb+27xHIkoQ8uaGEcH3Jhjb0HORr7RNVTvJOg1HgmJbU0uF9UxIwmP45xciLHOfMq4zXieS
	7TGbuPjzsMvb0OefiWhKH9q8GZltsLqRaGUbwS6b1SfJj6cMmyKrtS+12qy9e4FVztGKXeTaKApBq
	huwq5Reg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35308)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1ove6M-0004US-90; Thu, 17 Nov 2022 12:34:42 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1ove6F-0006no-QH; Thu, 17 Nov 2022 12:34:35 +0000
Date: Thu, 17 Nov 2022 12:34:35 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Liu Jian <liujian56@huawei.com>
Cc: nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
	opensource@vdorst.com, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net] net: ethernet: mtk_eth_soc: fix error handling in
 mtk_open()
Message-ID: <Y3YqW2HApXOcDAE+@shell.armlinux.org.uk>
References: <20221117111356.161547-1-liujian56@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221117111356.161547-1-liujian56@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_043510_143785_7B3B23FD 
X-CRM114-Status: UNSURE (   7.65  )
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

On Thu, Nov 17, 2022 at 07:13:56PM +0800, Liu Jian wrote:
> If mtk_start_dma() fails, invoke phylink_disconnect_phy() to perform
> cleanup. phylink_disconnect_phy() contains the put_device action. If
> phylink_disconnect_phy is not performed, the Kref of netdev will leak.
> 
> Fixes: b8fc9f30821e ("net: ethernet: mediatek: Add basic PHYLINK support")
> Signed-off-by: Liu Jian <liujian56@huawei.com>

Looks sensible to me.

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

