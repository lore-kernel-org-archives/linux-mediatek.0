Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A76ABC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Dec 2021 01:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KzhSv24U7O+AWVIIYg98ZHjHupYZryALcUGDsYLhs3Q=; b=APQ/2m8dGN3RzE
	Em5bcozzNN3iXeM+qyos2zqSCAjSfUR/Y2YzP6QHDfH6802a31wnHQcFVR3SUrJxGlebB0eFN5ld2
	3WH6PgomKSH2/5H4WiGs6WQqrlHb0RDciW2T5D2RkiDn4UEP0JjxZM9B3ekC9EBxsDi+Eae03ZVrI
	xZbMtY/BM980iaZ0QngTG9epboatZsZjXzq3ycCfZSrRoONyZ7cG5R7/jMPqtZPAqVIClLDgqT6y7
	LMZl62Wk/Mfc6JooWjjM0SUqG4xLfOR8RZLTdITTqVWP3evsvbHWj5xKg7QCi24hd+VX+SG080pK4
	GfX94kq1xZZarMgQWGeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mv8Ry-00EfjZ-VI; Thu, 09 Dec 2021 01:42:22 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mv8Ru-00Efil-No; Thu, 09 Dec 2021 01:42:21 +0000
X-UUID: 7f8b3281afc74c9893c2d8a1a4e6fe8f-20211208
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=JEt3XG4GHhG9WFakPdTvxOX/lsmWXLVPAlDuPpzKZro=; 
 b=okq6CjmdpC/VGZ97YGqF9AStRZdzKofxz0leGxwBj+1pfGc/1T67zHe00GHDhNwQQ1fcQokayO6cdMUWbENJcebobO/G3KfH3Re9WNtoX46CWCjl62/XUtodVbu8G51MzWSF0iaGYQjDiK/htxnh0ajm55F446joIriJegqgOLk=;
X-UUID: 7f8b3281afc74c9893c2d8a1a4e6fe8f-20211208
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <biao.huang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2023220695; Wed, 08 Dec 2021 18:42:14 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 8 Dec 2021 17:42:12 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 9 Dec 2021 09:42:10 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 9 Dec 2021 09:42:09 +0800
Message-ID: <5713fa6121effde79c19e0b4475d02389d72d2cc.camel@mediatek.com>
Subject: Re: [PATCH net-next v7 5/6] stmmac: dwmac-mediatek: add support for
 mt8195
From: Biao Huang <biao.huang@mediatek.com>
To: Jakub Kicinski <kuba@kernel.org>
CC: <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu
 <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>, <srv_heupstream@mediatek.com>,
 <macpaul.lin@mediatek.com>, <angelogioacchino.delregno@collabora.com>,
 <dkirjanov@suse.de>
Date: Thu, 9 Dec 2021 09:42:08 +0800
In-Reply-To: <20211208063820.264df62d@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
References: <20211208054716.603-1-biao.huang@mediatek.com>
 <20211208054716.603-6-biao.huang@mediatek.com>
 <20211208063820.264df62d@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211208_174218_808447_18265E2E 
X-CRM114-Status: GOOD (  11.28  )
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

Dear Jakub,

All these warning lines share a similar semantics:
delay_val |= FIELD_PREP(xxx, !!val);

and, should come from the expansion of FIELD_PREP in
include/linux/bitfiled.h:

  FIELD _PREP --> __BF_FILED_CHECK --> "~((_mask) >> __bf_shf(_mask)) &
(_val) : 0,"

===============================================================
__BF_FILED_CHECK {
...
  BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
                   ~((_mask) >> __bf_shf(_mask)) & (_val) : 0, \
                   _pfx "value too large for the field"); \
...
===============================================================

Should I fix it by converting
  delay_val |= FIELD_PREP(ETH_DLY_TXC_ENABLE, !!mac_delay->tx_delay);
to
  en_val = !!mac_delay->tx_delay;
  delay_val |= FIELD_PREP(ETH_DLY_TXC_ENABLE, !!en_val);

or other suggestions for these warnings?

Thanks~

On Wed, 2021-12-08 at 06:38 -0800, Jakub Kicinski wrote:
> On Wed, 8 Dec 2021 13:47:15 +0800 Biao Huang wrote:
> > Add Ethernet support for MediaTek SoCs from the mt8195 family.
> > 
> > Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> > Acked-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> 
> sparse reports whole bunch of warnings like this:
> 
> drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c:213:30: warning:
> dubious: x & !y
> drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c:217:30: warning:
> dubious: x & !y
> drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c:228:38: warning:
> dubious: x & !y
> drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c:232:38: warning:
> dubious: x & !y
> drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c:247:46: warning:
> dubious: x & !y
> drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c:255:46: warning:
> dubious: x & !y
> drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c:273:30: warning:
> dubious: x & !y
> drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c:277:30: warning:
> dubious: x & !y
> drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c:375:30: warning:
> dubious: x & !y
> drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c:379:30: warning:
> dubious: x & !y
> drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c:390:43: warning:
> dubious: x & !y
> drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c:397:43: warning:
> dubious: x & !y
> drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c:415:46: warning:
> dubious: x & !y
> drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c:426:46: warning:
> dubious: x & !y
> drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c:439:35: warning:
> dubious: x & !y
> drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c:443:30: warning:
> dubious: x & !y
> 
> Any idea on where these come from?
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
