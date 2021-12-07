Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 944D8C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Dec 2021 15:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zmsisLa0E769+wydjo6WgfzadzUT5L7DmMZwAklMerI=; b=EuX4xhItZQsuo6
	pEbXgDmH6FBdh4hHl2FjDnGIYmfDS26XEake9WCLc/ajXBx8U5PnoQkFTt/H6K0fZ4uhbAJbtQcYZ
	wP5b+4sUoWM+ULt21NUxlxykatT1SGjlHW3AO3P8vQMsYauBpDdeM1DeArX56VQ4NOHaL7zk7CXzh
	w2CfBzOci0Wxe/bne7DcksDQFEpZC1oN4001+OXrEsz5ICNuSN8GL0CXBv0hFpMgvFcU0lOnJCN/r
	id9K0H+oSQAU1tv+wGJ9ssB0olSFzE2Q8jwyAkOA+9+gHbZqBqpXR9Oe3AF5RvSKoCNA+0HjnMWuy
	xaLFdsy56/2RkMrRqtCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muc41-0096GP-56; Tue, 07 Dec 2021 15:07:29 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mubji-00906A-5t; Tue, 07 Dec 2021 14:46:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BDF90B817BB;
 Tue,  7 Dec 2021 14:46:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5D30C341C8;
 Tue,  7 Dec 2021 14:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638888388;
 bh=/HDJF3gWZSfW6o+OZuu99jpPVn8cK4i2nf6FoOUbTxM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=EeusCp48Gk375XhLK6HOShNAaNpMwlDhUQp7iOCwJIgCPcXVI5mENIdcbolrKwDYk
 9fE79z0n9kC5vVZKp+zf+iDOwuNpvj1cktBeNQw+fyZxjDksmWKFDXI5N9rAr2NGpy
 za+5qz+/5ejxtvP3teSw4pDtMFH8xng4Q7eO0ziFXwHZtB9oYZMTCZq7fCMIeEyieo
 Wvf9W+UD06uCq12MtQXzr/M6XPJS7DY+DUBYZm2NiVlwW4xVou8VbJNXxWjMeoZvSd
 DzUp1G2/WTqd15GTDwK/vX/23ak+3UjdopLvGFYJ+Y/Tt4n3bA9E1hGMG2b+IZwFcE
 /WDS9J+blHjtw==
Date: Tue, 7 Dec 2021 06:46:27 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Biao Huang <biao.huang@mediatek.com>
Cc: <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, <netdev@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>, <srv_heupstream@mediatek.com>,
 <macpaul.lin@mediatek.com>, <angelogioacchino.delregno@collabora.com>,
 <dkirjanov@suse.de>
Subject: Re: [PATCH v5 0/7] MediaTek Ethernet Patches on MT8195
Message-ID: <20211207064627.5623f3bf@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20211207064345.2c6427a1@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
References: <20211207015505.16746-1-biao.huang@mediatek.com>
 <20211207064345.2c6427a1@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_064630_417110_FF58CDCE 
X-CRM114-Status: GOOD (  16.29  )
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

On Tue, 7 Dec 2021 06:43:45 -0800 Jakub Kicinski wrote:
> On Tue, 7 Dec 2021 09:54:58 +0800 Biao Huang wrote:
> > Changes in v5:
> > 1. remove useless inclusion in dwmac-mediatek.c as Angelo's comments.
> > 2. add acked-by in "net-next: stmmac: dwmac-mediatek: add support for
> >    mt8195" patch  
> 
> Which tree is this series based on? It doesn't seem to apply to
> net-next. Also the net-next in the subjects is misplaced. If the series
> is supposed to be merged to net-next the subject should be like:
> 
> [PATCH net-next v5 1/7] stmmac: dwmac-mediatek: add platform level clocks management
> 
> You can use --subject-prefix="PATCH net-next v6" in git-format-patch to
> add the prefix.

FWIW patch 6 is the one with the conflict: "arm64: dts: mt8195: add
ethernet device node"

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
