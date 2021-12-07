Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0056AC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Dec 2021 15:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3QIwUm+J9BtZo03DZYEV1onpc1UFqk/LDndSV+gsMvg=; b=YaPEHrbBQVNRlF
	f39yM5T4GfOr3dBDj7A+IGrssiAqz5sVvMaf4wUCmEbddhfLE1fOWVNyC8Ko1XrRuNDr31Gmr4WcM
	iWZnIgz/YF1jX5eMCFZBX1VueA0SEU6p1ntGavZvnBu51WMGeA1+1zKRvRMPH8LkzWaE/2b9SHoeR
	KOdaXGoTbGITdYNrRaXvY5iiA3otBT3+yeSLOQZBgjvC7DGiKrNWJfjM2Qw+Xw61ZJXTQAMju8Ku7
	nH5iqdJ4pPI56YpQdjirVkxFWFubxaUqKvmd2AHf5B9xYs6BaZVHKkfXLeizckLC4nz5yd3BO6N3S
	e7B3E3YWEj4vGo6lWNRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muc2D-0095g3-F2; Tue, 07 Dec 2021 15:05:37 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mubh7-008zWi-Mr; Tue, 07 Dec 2021 14:43:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 97AE3B817B6;
 Tue,  7 Dec 2021 14:43:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1E8CC341C1;
 Tue,  7 Dec 2021 14:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638888226;
 bh=5MrplqICp5ANCWUEGpUqpG9gDk7l+o1aiuGOgg7OwLM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MNgEtovjWw1rD8htPyN6EHRDRcWb11cI/DCkMpYfFiiMgpppPLre1wTb0FR4a9rAh
 QPgPplm1d1YAA9ZSspKTf3WI5aNuBmqMz5fZK2WsUgqMqNUPWz4vnX2CveZMDQzP0K
 ZjeA72R/viKPgd7+kTan4fK0xUQfR1rG4QxY0zGKFJKeZzqaPV22qaElgEemaEjqv1
 OaZIzech2Ujzn6pEuR0EwSDcjobwOWJkiIYskAZm0YpWsZyzcntB1xJgiwfg2nA0Wh
 WHiIyqnsY+ODFMdJ7cazVOG4hQY6gkYTEm9t6jYXHRIf5rhXfujWbzD9kKUHlMyEO4
 Nnonhwe4p1bSQ==
Date: Tue, 7 Dec 2021 06:43:45 -0800
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
Message-ID: <20211207064345.2c6427a1@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20211207015505.16746-1-biao.huang@mediatek.com>
References: <20211207015505.16746-1-biao.huang@mediatek.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_064349_967502_19DB51A2 
X-CRM114-Status: GOOD (  12.08  )
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

On Tue, 7 Dec 2021 09:54:58 +0800 Biao Huang wrote:
> Changes in v5:
> 1. remove useless inclusion in dwmac-mediatek.c as Angelo's comments.
> 2. add acked-by in "net-next: stmmac: dwmac-mediatek: add support for
>    mt8195" patch

Which tree is this series based on? It doesn't seem to apply to
net-next. Also the net-next in the subjects is misplaced. If the series
is supposed to be merged to net-next the subject should be like:

[PATCH net-next v5 1/7] stmmac: dwmac-mediatek: add platform level clocks management

You can use --subject-prefix="PATCH net-next v6" in git-format-patch to
add the prefix.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
