Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63312C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Dec 2021 01:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IG2i9KCTZbguWVAn5xXRToSvXH/3rnNjIyLbu8tDgNk=; b=eFFOgzF3xKcWnm
	5egMmXbk/fCok8M7ZtdYtJ6NRwpXkG09al4qjo9XwCk7lyH59jySvo8vw4JJ/Lc20A6/PJEKADLWM
	HiCS0Hb7CkZWDoIgBx3zayZTcPDVdBeeGDcpsWBl4W0hB482H3+t6bRfkQiLX/gBn8JRS2AdEpDvJ
	r24SBhZv/yQDYn8+Y4aJM0ReqBnwAqlFfKn8z9+K68XQu0XGZyF1juOwxBS68cUmMwrq81JYdpmkR
	cVMvWPy1fo4OzWtoQECEdknl0mG9mi66g57Mdj3ZPCwJGutIKbf1ia5udNJ78w+5TQ1UwMghZkxq0
	YS7P+GOVw557oIewqmRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n21WL-0005wu-Dq; Tue, 28 Dec 2021 01:43:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n21W9-0005uJ-ST; Tue, 28 Dec 2021 01:43:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 097046115A;
 Tue, 28 Dec 2021 01:43:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5F37C36AE7;
 Tue, 28 Dec 2021 01:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640655784;
 bh=tm2ezZym6nmRnMFof2gET1bE3Gm3gtZFjJBuqcI1dVs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GpwoqgL3hN+CpF+au5xOM7La9VTu0aFYJ3Ys6SPZYna4fXuZJiSrx2hlzUiMqW9c+
 JjDISMTXh+N0JUjt2CTJ+uX9MsYyafmITaM6ijFMO7moC+6OW1JhU/LlNtmaBtdf/P
 N7kgyybkEsviIrx5FWdOEBKWlqj8bNmiJiPd67v6qlSVScJ1wGjD90SVhl8VBlG9lQ
 t/hlsUx496uH1Fd/+U9TPnULK74z/+6TLLdaRIPHSoyJukiY3/H3EODB78L9MGcFuT
 8WNs6Qk5eY6BI/4MvrHrKf/W5xPWLUKsxDkFVswdJEGrFziUTFMXP+tNN3uY1wYfV5
 pteFO/mhw5u4w==
Date: Mon, 27 Dec 2021 17:43:02 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Felix
 Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>, Sean Wang
 <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>, "David S.
 Miller" <davem@davemloft.net>, Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v7 0/2] net: ethernet: mtk_soc_eth: implement Clause 45
 MDIO access
Message-ID: <20211227174302.79379151@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
In-Reply-To: <Ycpj/cEdjb0BMrny@makrotopia.org>
References: <YcnoAscVe+2YILT8@shell.armlinux.org.uk>
 <YcpVmlb1jFavCBpS@makrotopia.org> <YcpVtjykiS7mgtT5@makrotopia.org>
 <Ycpj/cEdjb0BMrny@makrotopia.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211227_174310_021694_5053DD78 
X-CRM114-Status: GOOD (  15.01  )
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

On Tue, 28 Dec 2021 01:10:21 +0000 Daniel Golle wrote:
> As it turned out some clean-up would be needed, first address return
> value and type of mdio read and write functions in mtk_eth_soc and
> generally clean up and unify both functions.
> Then add support to access Clause 45 phy registers.
> 
> Both commits are tested on the Bananapi BPi-R64 board having MediaTek
> MT7531BE DSA gigE switch using clause 22 MDIO and Ubiquiti UniFi 6 LR
> access point having Aquantia AQR112C PHY using clause 45 MDIO.
> 
> v7: remove unneeded variables and order OR-ed call parameters
> v6: further clean up functions and more cleanly separate patches
> v5: fix wrong variable name in first patch covered by follow-up patch
> v4: clean-up return values and types, split into two commits
> v3: return -1 instead of 0xffff on error in _mtk_mdio_write
> v2: use MII_DEVADDR_C45_SHIFT and MII_REGADDR_C45_MASK to extract
>     device id and register address. Unify read and write functions to
>     have identical types and parameter names where possible as we are
>     anyway already replacing both function bodies.

Please stop reposting this series (1) so often; (2) as a flat response
to an old version. You are completely confusing patch series detection,
at least in patchwork.

Try git send-email and please allow at least 12 hours between postings
for reviewers to comment.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
