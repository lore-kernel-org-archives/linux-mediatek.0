Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3E06C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Dec 2021 04:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nND5erX/BmmQn94R0CI8E3q8SQxhAWIUD9xQwpp637Y=; b=27hTl/hllghQma
	XVf0osbwU18C5p2rIovnbT1MuMmMq+g1AFsuabP3T2bSx+atomnHsGR82QXWVVtjcfAHUh35SOu7x
	Zh97DTelkvtpJTqrLDOFxcjQ0SnKB8ybak2kVXQIqV4n8MMaP99/GBufTszz3ux6qMMJsnWm2tM5t
	E2+bi38yhxwWzr4q9PjzpZ9YexdK/biI/58QxQ3QOLXolPWw+0S7DjB0nHElq/d21xd9rYLE1gR/1
	dca5+9j6Pu8mDsQFmdR3FCNVtPkUb9rKl4UfxddSPQrOPTYTnrXDr2h2iA63SbH/4gfmSox/GF6eV
	z2QCDT6z4bOfUxG2yBcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muoEQ-00B9TF-4X; Wed, 08 Dec 2021 04:07:02 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muoCM-00B8Z5-6v; Wed, 08 Dec 2021 04:04:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DD631B81F61;
 Wed,  8 Dec 2021 04:04:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF090C00446;
 Wed,  8 Dec 2021 04:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638936292;
 bh=1r558GTEUAd1QgB8UN7qYm8RGcn1C0as6rGvCpBhBdg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=c01kKm4/EQD7+IVBOaAq4j4UcZQ8YLSq5USj5LOyOi9aX3+mCathluYcIjJ6SABi9
 g6J0suXdmg7hRkpTD9nD0lhFCoZ9yuz+Zha87gSo0B81XoZ5LO2IcTmUehjajCNvuc
 gWt2m4OLGEn4G+74hnr4wyEQsmZFGPgbqs+BzyXw+cYqOnnDz2TV5GBHl/eUIEKH0w
 ZnrENM1w3kmAGUmCml5MsV3rywh3o9w0nWgWiDRJzkVXkx4/Cj2N/skV24SooOyIGW
 vkgg4brNMcg56vFmOwqGqJSy8a5uKsKViW1Bz5YusbPYnG2t6+OaJWJFmi9JoUMoEz
 F8gDOIWeoA5Xw==
Date: Tue, 7 Dec 2021 20:04:50 -0800
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
Subject: Re: [PATCH net-next v6 5/6] stmmac: dwmac-mediatek: add support for
 mt8195
Message-ID: <20211207200450.093f94a8@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20211208030354.31877-6-biao.huang@mediatek.com>
References: <20211208030354.31877-1-biao.huang@mediatek.com>
 <20211208030354.31877-6-biao.huang@mediatek.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_200454_432441_15E05BFB 
X-CRM114-Status: UNSURE (   8.85  )
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

On Wed, 8 Dec 2021 11:03:53 +0800 Biao Huang wrote:
> Add Ethernet support for MediaTek SoCs from the mt8195 family.
> 
> Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c:439:3: warning: variable 'gtxc_delay_val' is uninitialized when used here [-Wuninitialized]
                gtxc_delay_val |= FIELD_PREP(MT8195_DLY_GTXC_ENABLE, !!mac_delay->tx_delay);
                ^~~~~~~~~~~~~~
drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c:369:20: note: initialize the variable 'gtxc_delay_val' to silence this warning
        u32 gtxc_delay_val, delay_val = 0, rmii_delay_val = 0;
                          ^
                           = 0
1 warning generated.
drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c:439:3: warning: variable 'gtxc_delay_val' is uninitialized when used here [-Wuninitialized]
                gtxc_delay_val |= FIELD_PREP(MT8195_DLY_GTXC_ENABLE, !!mac_delay->tx_delay);
                ^~~~~~~~~~~~~~
drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c:369:20: note: initialize the variable 'gtxc_delay_val' to silence this warning
        u32 gtxc_delay_val, delay_val = 0, rmii_delay_val = 0;
                          ^
                           = 0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
