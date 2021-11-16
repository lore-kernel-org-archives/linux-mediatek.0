Return-Path: <SRS0=fhAu=QD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A197C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Nov 2021 10:06:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 330A4613AD
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Nov 2021 10:06:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 330A4613AD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0oDSYM8NYP5m/2fQ64MbJpCa3q4/QMbQutp7Sk0cGKU=; b=FwxgDf1xgRv71w
	WQrZ8S14ZBjUTVjLqoRfusetCs7X0JaJ2xDvHCieQegQIVponEEK/ZPQKjx0cC334XyOvop89W9T7
	WJd+GOi+jf1ZdeCFbmO3y91WYGr3LdlkdjOyfXfCbtLN2vMiD9vvFvgJZjgz65R9voDlgKLoZAulE
	luUQrsQAXfpqV/EmMamDlxU6qBEWI0MaOXMSi9ht8XQ17KmDhPxT5LhEHZ69T/WcC95rgbdQfGi37
	FKwmp0BS2QpoTrH5pKDnx9WB53qkmkCyaw8OwndE6aMZvDo5BPXsUrXTTCG8T5M8c7xoM1IMWaP1L
	a6bMOutwNH7XogkuLshg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmvMZ-0015a0-F2; Tue, 16 Nov 2021 10:06:51 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmvMJ-0015UQ-Cx; Tue, 16 Nov 2021 10:06:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=v4EyiamS3qEDk/bFSW7Mh8VEL5uiE8CqhMTbRBvandw=; b=DCE3MBVNXDN2bbtu+KNiKwPC6+
 j7wg1tXrVwTRno05bIbEVjz2zXeMcZPVJw84746Qsjw6u+AsSeAmrTfr+3XTx3Y3k4rnwK1+JPGSV
 ZlGfxh/CUTtSI1mORZdI8Q8C49gc5cI7PyVieANZS1K2ePy3kO7sQF5PqLyX5TgtQqr9X78T4B+j+
 8eRtkuJMKEAfA0lkC3iLJEflSWJ4D5+ETAMyAR3HyRDW6YCjhZE4wSSwCBcmfMH3AP1b3HY6XIAM7
 ZajkwjXRkGqGb/RSv/NHLKgHhiW2AwuG8/wxU77s52ExrzBl9pcJdhbReX2qawBjggg68gI0aVqyb
 YLsHG+Hg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:55654)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1mmvMA-0000La-9V; Tue, 16 Nov 2021 10:06:26 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1mmvM7-0001uh-1l; Tue, 16 Nov 2021 10:06:23 +0000
Date: Tue, 16 Nov 2021 10:06:23 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Mark Lee <Mark-MC.Lee@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>
Cc: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: [PATCH net-next 0/4] net: mtk_eth_soc: phylink validate
 implementation updates
Message-ID: <YZOCn1vMUAbhq3j0@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_020635_473769_DC875EDC 
X-CRM114-Status: UNSURE (   6.07  )
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

Hi,

This series converts mtk_eth_soc to fill in the supported_interfaces
member of phylink_config, cleans up the validate() implementation, and
then converts to phylink_generic_validate().

 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 111 ++++++----------------------
 1 file changed, 24 insertions(+), 87 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
