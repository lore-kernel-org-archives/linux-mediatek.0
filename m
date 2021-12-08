Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C40C7C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Dec 2021 14:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UF4/EOLkHVjfHq3oKEpW063C522np2STTpTSl79CSCM=; b=XH7lUtwKc45lSX
	iD/owMiRim2AC7+1rFl/SVk2gJf9PKRknoE6kjahKlPLsVhiGUIl5JQAF8y84wuUOIjJlb5Ito31c
	tGYy3O433Qnj0MCEaxw/LCMBpe1UWfnJ4aWZQ/NNCbystj+AIeCPmC1UT0W5YuKRz+4fOky2a6aUe
	sK9LEwkhm6u7ptZIaYDF9TrC9U7Sl2fQWKLD2Saz9KhzXkDg8aNYGZpj1kk8UPpyL2U2J3FrnKBuF
	pUVgDIV3Gay0oAsdfX6xar9m1N/a0BwJXbePdYEqszGrU6hj8eq6O3Ba3+m5HohUKBJulbtjfFUyW
	KsCktXExO6IKa8inHJ5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muy5j-00D0Hr-5k; Wed, 08 Dec 2021 14:38:43 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muy5V-00D0C9-Dp; Wed, 08 Dec 2021 14:38:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 63F05CE2047;
 Wed,  8 Dec 2021 14:38:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B87CC00446;
 Wed,  8 Dec 2021 14:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638974302;
 bh=yXfh7LEnE2SBFeZnbDCRhoa2fYrDl431va9ASGoK3xc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ePG6a3u+RKIuDqJvkYwSIhSrvLzAwk4R95Pz004tE+MKwsjneRc5qYZ1ctrybVWOx
 8OvzKebSMPv5AfTSRecr9VYHmJ5hom8mKWPiK9FnmH7VfkC4ixVpbOGT5skIyoPUbQ
 6X/FaLA+Cj3RbknoaO8q1u8ejxdobhWnoj77nH8Z2V2cJmdT6K+LG0ZHWjiJDUakDu
 jDXyyJ1/5leDAVknYJWaR288T5WP0UUwWDa5HNTtHk7VyVQRNVdBZHgBBxOL/J+t8F
 j3oPmxrCA9IppRlr3Yrc5DOkm9tmQJvJY0GHT6+MYvjbAnyRUIzxrM798ub7keO9rN
 Jxz4n1SQ5XnZQ==
Date: Wed, 8 Dec 2021 06:38:20 -0800
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
Subject: Re: [PATCH net-next v7 5/6] stmmac: dwmac-mediatek: add support for
 mt8195
Message-ID: <20211208063820.264df62d@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20211208054716.603-6-biao.huang@mediatek.com>
References: <20211208054716.603-1-biao.huang@mediatek.com>
 <20211208054716.603-6-biao.huang@mediatek.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211208_063829_699543_75B503BD 
X-CRM114-Status: UNSURE (   9.40  )
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

On Wed, 8 Dec 2021 13:47:15 +0800 Biao Huang wrote:
> Add Ethernet support for MediaTek SoCs from the mt8195 family.
> 
> Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

sparse reports whole bunch of warnings like this:

drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c:213:30: warning: dubious: x & !y
drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c:217:30: warning: dubious: x & !y
drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c:228:38: warning: dubious: x & !y
drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c:232:38: warning: dubious: x & !y
drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c:247:46: warning: dubious: x & !y
drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c:255:46: warning: dubious: x & !y
drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c:273:30: warning: dubious: x & !y
drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c:277:30: warning: dubious: x & !y
drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c:375:30: warning: dubious: x & !y
drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c:379:30: warning: dubious: x & !y
drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c:390:43: warning: dubious: x & !y
drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c:397:43: warning: dubious: x & !y
drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c:415:46: warning: dubious: x & !y
drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c:426:46: warning: dubious: x & !y
drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c:439:35: warning: dubious: x & !y
drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c:443:30: warning: dubious: x & !y

Any idea on where these come from?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
