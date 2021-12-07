Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF724C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Dec 2021 01:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AlZOI8NBhYeS28+7OXX5OJAB0OAjQtMAARu9bCO2yTg=; b=4jzdBF8hejrtOU
	SKbUbA5SHrsncEhcXfb1Iq+zlbNoWWGouWt4b4qg+gWVTW4PEj18O7O/i6dmmVHakzqXcdIdexOd3
	f2kjSxTH8vFGhuV65dTvLDYv2cep7CbaV35uFWRpbyWBjVgHhAP1jp/uw5EdPRJPSya/jKvW17ESO
	5BujcBByk6z0d/SxqsoZw49DAwOwAy/Ko0bD1mjKMf1RGl8Cn4zTPQysRd1lMRnPnXCZbh9lnCVXt
	NXYPXkyxH2lDMYKy7Py5mBDa4TI8uTTmzcCSL4B8utuSysQOziADvdFZEn94B7VBN0/WCbAb4ZXwc
	ZUw9ujvxnrWhsUT3DDpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muPbP-006che-9B; Tue, 07 Dec 2021 01:49:07 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muPbM-006cgA-Ab; Tue, 07 Dec 2021 01:49:05 +0000
X-UUID: ae6ff24cde1c4f9fb4cb2b497d2d4d70-20211206
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=5TqzGfDJSklDX44XMBIA/ykNHsD+dGmD9/tWrIY+fjY=; 
 b=PNQuW8hwaV3CPXj/ZdP36tj6CV04V+lESRQjva8hsXj07O3nP25vanoZB/Dv7tkgNVbQKRiGXreNt1IkAEpWBLk9OB6L0Mw1kAFLb1eFvsrVogq7UcVh4AqUF0mXuJ/xM12lS40OOFQdOfW/QNLzFmaqr9oDv7LvznA5wxy+j/8=;
X-UUID: ae6ff24cde1c4f9fb4cb2b497d2d4d70-20211206
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <biao.huang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1969880611; Mon, 06 Dec 2021 18:49:03 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 6 Dec 2021 17:39:00 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 7 Dec 2021 09:38:59 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 7 Dec 2021 09:38:58 +0800
Message-ID: <d807b5784357ca7656b496b275ef87bf0e4b8100.camel@mediatek.com>
Subject: Re: [PATCH v4 5/7] net-next: stmmac: dwmac-mediatek: add support
 for mt8195
From: Biao Huang <biao.huang@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Rob Herring
 <robh+dt@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, <netdev@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-stm32@st-md-mailman.stormreply.com>, <srv_heupstream@mediatek.com>,
 <macpaul.lin@mediatek.com>, <dkirjanov@suse.de>
Date: Tue, 7 Dec 2021 09:38:58 +0800
In-Reply-To: <0efc7cfd-f048-3c69-0ef3-5904c245f914@collabora.com>
References: <20211203063418.14892-1-biao.huang@mediatek.com>
 <20211203063418.14892-6-biao.huang@mediatek.com>
 <0efc7cfd-f048-3c69-0ef3-5904c245f914@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_174904_400123_FE4F3708 
X-CRM114-Status: UNSURE (   8.49  )
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

Dear Angelo,
	Thanks for your comments~
On Mon, 2021-12-06 at 16:22 +0100, AngeloGioacchino Del Regno wrote:
> Il 03/12/21 07:34, Biao Huang ha scritto:
> > Add Ethernet support for MediaTek SoCs from the mt8195 family.
> > 
> > Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> 
> Acked-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
I'll add it in next send.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
