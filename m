Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D2A2C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Apr 2022 08:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UKNE2zC+Dgr8BvaITnSYEsW6a4O7TVOPJ2o475cRJ3s=; b=033dsBmN5W+yjD
	Yes+NaBRVU4c3MwLVWYSF+rDo1NT6hyd/Xd6F6NUG920KCzHLTBaVHKczuVqvc/ZHF/sHYxC0erm4
	Lt5x5IKZ3hj1YhHYjusDeN/rLUjGLAfgyPIuoGhv/YoPpikmt35KwpXiznGQ5P1a/4htQGCTcapmN
	WHo+ktq3lhLbCz+IPIZlVqvu+9KazaJP0h1KMFR+5sqnQTBBqUg9gxRij2lp36qlMvyIWOL5X72iK
	btlTcgoxetBgdemLxR2X3+XlLbSXEZWKaIAZAC6Z7Zvv9XxJjdVutFyBDPlUKQvZsDsDHxfiAYtn4
	07VNJKkXyQ4a+4YPnCag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngj2R-002FZT-C8; Tue, 19 Apr 2022 08:16:43 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngj1W-002Exv-NC; Tue, 19 Apr 2022 08:15:48 +0000
X-UUID: 943d7e2c2c28493088133dee712aed57-20220419
X-UUID: 943d7e2c2c28493088133dee712aed57-20220419
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 656877133; Tue, 19 Apr 2022 01:15:39 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 19 Apr 2022 01:15:37 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 19 Apr 2022 16:15:36 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 19 Apr 2022 16:15:36 +0800
Message-ID: <438d21a46fffebdf858c327c92155b5b91646376.camel@mediatek.com>
Subject: Re: [PATCH 3/7] clk: mediatek: reset: Merge and revise reset
 register function
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Chen-Yu Tsai <wenst@chromium.org>
CC: <mturquette@baylibre.com>, <sboyd@kernel.org>, <matthias.bgg@gmail.com>,
 <p.zabel@pengutronix.de>, <angelogioacchino.delregno@collabora.com>,
 <chun-jie.chen@mediatek.com>, <yong.liang@mediatek.com>,
 <runyang.chen@mediatek.com>, <linux-kernel@vger.kernel.org>,
 <allen-kh.cheng@mediatek.com>, <linux-clk@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Tue, 19 Apr 2022 16:15:36 +0800
In-Reply-To: <CAGXv+5GQR27+iomwHfwYb0gB_QVTZSy6TaZ+1qViMmNPka3Yjw@mail.gmail.com>
References: <20220418132154.7401-1-rex-bc.chen@mediatek.com>
 <20220418132154.7401-4-rex-bc.chen@mediatek.com>
 <CAGXv+5GQR27+iomwHfwYb0gB_QVTZSy6TaZ+1qViMmNPka3Yjw@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_011546_812246_303C6EB3 
X-CRM114-Status: GOOD (  18.21  )
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

On Tue, 2022-04-19 at 15:26 +0800, Chen-Yu Tsai wrote:
> On Mon, Apr 18, 2022 at 9:22 PM Rex-BC Chen <rex-bc.chen@mediatek.com
> > wrote:
> > 
> > Merge the reset register function of v1 and v2 into one function.
> > - Input the version number to determine which version we will use.
> > - Add return value of reset register function for error handling.
> 
> Please do this in a separate patch. Also you are adding error
> messages
> for when of_clk_add_provider() fails, which is not mentioned either.
> 
> Most of these platform drivers require a good cleanup of their error
> handling anyway. It might be a good idea to tackle them later. Or if
> they look the same, you could try using coccinelle to do a bulk
> cleanup.
> 
> 
> Thanks
> ChenYu

Hello ChenYu,

I will separate the error handle in another patch.
I think I will just add a return value. As for cleanup the clock error 
handling flow, it's not the purpose of this series.

BRs,
Rex
> 
> > - Rename reset register function to "mtk_clk_register_rst_ctrl"


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
