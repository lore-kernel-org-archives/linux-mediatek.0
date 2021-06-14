Return-Path: <SRS0=I1M+=LI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A26CC2B9F4
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Jun 2021 19:48:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0843611C0
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Jun 2021 19:48:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F0843611C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=davemloft.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	From:Subject:Cc:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MMXvVjwYU3ebSfymS44yoSGWvi2/4q4OHr32hfeqeG8=; b=aIttTBlnXMA7vW
	Of9/Aq37s7ZT6i9yN4KN0OT6WobhWSDu8cpsDAOLLZFvkeqU+DWxQ+ros99iLreMhgYdO+VDx8e2D
	2KBbXM+y359KM+YfS5ohC6+lRAuwsDibuF6IDrR6FnkY5MnnDVIj6DQoSWVtdmBNmIeU1J3xTeTzO
	qkJ/k/pDJeq3ybGAYLYQQh1Hw49ESzV2sw/sXFZMBprZ14zJminpdp/sHrHkDvCu6zbT/qkIv+mzW
	DKoWvBG3FvOm1PBGS13qMr1QegPzzsRx6suldNcEKdbhc3wOu0jR3DajLWRpwZl2txf6kFWQb3I0E
	LyrqDk9ykbFxoqMW0HSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lssZU-00FwCQ-9Z; Mon, 14 Jun 2021 19:48:32 +0000
Received: from shards.monkeyblade.net ([23.128.96.9] helo=mail.monkeyblade.net)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lssZI-00Fw92-DZ; Mon, 14 Jun 2021 19:48:21 +0000
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 by mail.monkeyblade.net (Postfix) with ESMTPSA id CC35D4D079861;
 Mon, 14 Jun 2021 12:48:14 -0700 (PDT)
Date: Mon, 14 Jun 2021 12:48:11 -0700 (PDT)
Message-Id: <20210614.124811.2218908588950372515.davem@davemloft.net>
To: code@reto-schneider.ch
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org, sr@denx.de, reto.schneider@husqvarnagroup.com,
 nbd@nbd.name, kuba@kernel.org, john@phrozen.org, Mark-MC.Lee@mediatek.com,
 matthias.bgg@gmail.com, linux@armlinux.org.uk, sean.wang@mediatek.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] net: ethernet: mtk_eth_soc: Support custom ifname
From: David Miller <davem@davemloft.net>
In-Reply-To: <20210613115820.1525478-2-code@reto-schneider.ch>
References: <20210613115820.1525478-1-code@reto-schneider.ch>
 <20210613115820.1525478-2-code@reto-schneider.ch>
X-Mailer: Mew version 6.8 on Emacs 27.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.2
 (mail.monkeyblade.net [0.0.0.0]); Mon, 14 Jun 2021 12:48:15 -0700 (PDT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210614_124820_470636_EA4286A6 
X-CRM114-Status: UNSURE (   5.71  )
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

From: Reto Schneider <code@reto-schneider.ch>
Date: Sun, 13 Jun 2021 13:58:19 +0200

> From: Reto Schneider <reto.schneider@husqvarnagroup.com>
> 
> Name the MAC interface name according to the label property. If the
> property is missing, the default name (ethX) gets used.
> 
> Signed-off-by: Reto Schneider <reto.schneider@husqvarnagroup.com>

Please solve naming issues in userspace via udev, thank you.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
