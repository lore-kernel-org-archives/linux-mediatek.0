Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D4F0C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Dec 2021 01:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dd0TepLSrQs6ObeLwUtODXCKptQZBYtTUagYnp6d3OM=; b=4MeAHdHld7Sqq4
	1auorOO/3rf2jPFN+1qite4v3PEzB3LVP2GF7KHWtDfv0G5cdlWr4RsymqTGGcA6nF/W7wEapLaJO
	26AcuIMAcPcZckOOj29UfTIgofqFl5eWbcku1Sl5vnLvddV6xMhzkvloV0ZbsrCxLhfV0sOse9GWv
	E0akWZvfSzCIVY61YnDEIOcdg7TLAd/F1Ml3/L7WneORs3m2AkoThPIcU4a33JItO9Kok8UXNOZZo
	RkXhku3jxthRbTGtaj3AxzO61+6kDyxjAmk8GFJSZ4SWDvCyRPKujbNqcFqPZ4Q7Jj9FR/i/fXC6J
	joa4dmutv12NtG5+w0Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvUje-000XLq-VZ; Fri, 10 Dec 2021 01:30:06 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvUjc-000XL3-Qr; Fri, 10 Dec 2021 01:30:06 +0000
X-UUID: a2365e09d97e443eba3dff4d9b412987-20211209
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=1ZZO+ETOhfDa+Z01cdd25TwcHTHZC47+w8uPmJpLwqs=; 
 b=iRRcQh+SEOFPdzh0m0f4Ik6IffPiuHF+IvOwARYMCtkrU79k0NSu4nXgoLxMATLkD86WvkiscbPvF0fnzF4YVk1BHk7wVgAQQV2ycESORFr5KBWvelnRlgUoEgJ9xp7P5Gj3mLpvMuXsU73YX0bMOlq0tA7yblUy/e04sgLJNgI=;
X-UUID: a2365e09d97e443eba3dff4d9b412987-20211209
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <biao.huang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1721887010; Thu, 09 Dec 2021 18:29:59 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 9 Dec 2021 17:19:57 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 10 Dec 2021 09:19:55 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 10 Dec 2021 09:19:54 +0800
Message-ID: <37f9979ef59c84525faaa66c40c094a72751c8cb.camel@mediatek.com>
Subject: Re: [PATCH net-next v7 1/6] stmmac: dwmac-mediatek: add platform
 level clocks management
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
Date: Fri, 10 Dec 2021 09:19:55 +0800
In-Reply-To: <2e8ccd43-bba0-9695-8d6d-d37e0b71fa7d@collabora.com>
References: <20211208054716.603-1-biao.huang@mediatek.com>
 <20211208054716.603-2-biao.huang@mediatek.com>
 <2e8ccd43-bba0-9695-8d6d-d37e0b71fa7d@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_173004_903725_59D96CB4 
X-CRM114-Status: UNSURE (   8.82  )
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
On Thu, 2021-12-09 at 11:51 +0100, AngeloGioacchino Del Regno wrote:
> Il 08/12/21 06:47, Biao Huang ha scritto:
> > This patch implements clks_config callback for dwmac-mediatek
> > platform,
> > which could support platform level clocks management.
> > 
> > Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> 
> Sorry, I've sent my ack on v6. Sending it on v7.
> 
> Acked-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
I'll add "acked-by" in next send.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
