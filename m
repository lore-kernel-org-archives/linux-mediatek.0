Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01724C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Dec 2021 05:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vZxkV1gKCzAP47s1GXf1rH59uhIg8DybvRbqowgxFoY=; b=bFFMfmBkVG27Rx
	4Hi1tLJ1sfAFYuDZRZ9LSlnzfXoFqy+rejc3lR01P0DwNR7Q/BnJeX7owM6AI2TtqHeq4ui4Suh0W
	Fwmt11fYXQlesjxhhuXLeUifPc0nMmUkiFaoR794EfkWu8FpBxex0qoYIMbTWzTI8SSfQN9QKQ54P
	vKxyuK3f8ckShZEgTf3vOciOorBjmxpRCYmkttT12vy1UreN5Ls93og0M2k2XfJ6otM7d2tP9Vi0B
	oonXu9wVj1fP1Cxz3VXzdp2bchDLPRl5T9Y3zOrfXdFpwP/euO9/x/uswHVOn7jgm3iG8KbFazVdI
	zMHLdKqfCK1/jZvaVfJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mupkv-00BLCT-ER; Wed, 08 Dec 2021 05:44:41 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mupkq-00BLBi-EK; Wed, 08 Dec 2021 05:44:39 +0000
X-UUID: 7136578864fa4a14948a8606ac575a27-20211207
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=cREHopv2I0vmXpVmvz4oR9TOg4BtDWc6c9ra60cPwdA=; 
 b=on6EpM+AbDWjXT9jBYfizWJCj0ANlmQ2lRClcyvzjau6jLEswATkMDxC2n+Jf7eH/Hn8wFNaxc50vr5dX8Lrf297nDFRa3C5Qd1a9FV3ISNodXlBbTdJ8gy8GPRzWkCG4DBeeTDDIroPg6tDvqyLOBm6Ak72pvuDJdQXpcMjwKM=;
X-UUID: 7136578864fa4a14948a8606ac575a27-20211207
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <biao.huang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 353695532; Tue, 07 Dec 2021 22:44:32 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 7 Dec 2021 21:34:30 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 8 Dec 2021 13:34:28 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 8 Dec 2021 13:34:27 +0800
Message-ID: <9d559afc6ae7c5f85bff222aa0c326f3f3e46fcf.camel@mediatek.com>
Subject: Re: [PATCH net-next v6 5/6] stmmac: dwmac-mediatek: add support for
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
Date: Wed, 8 Dec 2021 13:34:23 +0800
In-Reply-To: <20211207200450.093f94a8@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
References: <20211208030354.31877-1-biao.huang@mediatek.com>
 <20211208030354.31877-6-biao.huang@mediatek.com>
 <20211207200450.093f94a8@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_214437_934764_4572021B 
X-CRM114-Status: GOOD (  10.66  )
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
	Thanks for your comments.
On Tue, 2021-12-07 at 20:04 -0800, Jakub Kicinski wrote:
> On Wed, 8 Dec 2021 11:03:53 +0800 Biao Huang wrote:
> > Add Ethernet support for MediaTek SoCs from the mt8195 family.
> > 
> > Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> > Acked-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> 
> drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c:439:3: warning:
> variable 'gtxc_delay_val' is uninitialized when used here [-
> Wuninitialized]
>                 gtxc_delay_val |= FIELD_PREP(MT8195_DLY_GTXC_ENABLE,
> !!mac_delay->tx_delay);
>                 ^~~~~~~~~~~~~~
> drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c:369:20: note:
> initialize the variable 'gtxc_delay_val' to silence this warning
>         u32 gtxc_delay_val, delay_val = 0, rmii_delay_val = 0;
>                           ^
>                            = 0
> 1 warning generated.
> drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c:439:3: warning:
> variable 'gtxc_delay_val' is uninitialized when used here [-
> Wuninitialized]
>                 gtxc_delay_val |= FIELD_PREP(MT8195_DLY_GTXC_ENABLE,
> !!mac_delay->tx_delay);
>                 ^~~~~~~~~~~~~~
> drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c:369:20: note:
> initialize the variable 'gtxc_delay_val' to silence this warning
>         u32 gtxc_delay_val, delay_val = 0, rmii_delay_val = 0;
>                           ^
>                            = 0
I'll fix the uninitialized warning in next send.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
