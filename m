Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 074A9C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Mar 2022 03:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GUcKj0lmMjXOyzDYLE2uHWTX2rKTHXhBCtmD9YSUc8I=; b=OU/DWIB9sk6h8V
	su7JWh6fGI0Glk8hnNCvZKh9odOQblRz2NFOimpRJexruXzlqfyf9LmRBv5tMv3FcPFuwGl9wsHJW
	rM1uVMBQ8G5Mc6nMfmytd4Eevy9Yj62GFHqcSn91UK/taQgLXyhMyxjcQ4r8Jd0rPKiVLtyZ5G7xI
	+eu2Amecj8bCIVgCKw/uCFONfW5UPMRNBy7tja/KPzeb9RCOQp6zGGrmgCQqz1LWmM7HYEX+LjjYn
	l5aCWuHhYrgFsiBBoXcaG0Ry51iYUdEBx5XH9BrmhV7AfR/Q9Qv0koDVeCESELN69/M/MLPsRs6eB
	+wIJ6nc/J+gUwL14qIPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPbqT-0054Zt-3G; Thu, 03 Mar 2022 03:09:37 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPbqG-0054YT-BS; Thu, 03 Mar 2022 03:09:26 +0000
X-UUID: 344b8f0992c045f693306ce2f3ec6cfd-20220302
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=FYoFu46Ri/P04jWalAqKzU/zPnHaFA7v/wBJHfwyBso=; 
 b=Ss/HdpeMYep0qA4P9oXjsUQSCWSRuv4mJ5gD4ifagoEUYLXe9Q+5mY00xauUwZELceqhaIpkyycEFvbrjRl2vTw8ly86DaXVn2zyo/xespV+2ZJ4l53xMO2UE5Y5fywjxINOm0Vpr8Ijerb+lrNCyscXLR+9BN3zhwaKFmwnPNc=;
X-UUID: 344b8f0992c045f693306ce2f3ec6cfd-20220302
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <xinlei.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1996339880; Wed, 02 Mar 2022 20:09:18 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 2 Mar 2022 19:09:16 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 3 Mar 2022 11:09:03 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 3 Mar 2022 11:09:02 +0800
Message-ID: <dab8913e9a50110fd13650e14f35f13a30239013.camel@mediatek.com>
Subject: Re: [PATCH v1,2/3] drm/mediatek: Add TOPCKGEN select mux control
 dpi_clk
From: xinlei.lee <xinlei.lee@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <matthias.bgg@gmail.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <jitao.shi@mediatek.com>, <allen-kh.cheng@mediatek.com>,
 <rex-bc.chen@mediatek.com>
Date: Thu, 3 Mar 2022 11:09:17 +0800
In-Reply-To: <6db20053-71dc-d0e3-aac9-de5da1d7ba9e@collabora.com>
References: <1645782833-27875-1-git-send-email-xinlei.lee@mediatek.com>
 <1645782833-27875-3-git-send-email-xinlei.lee@mediatek.com>
 <6db20053-71dc-d0e3-aac9-de5da1d7ba9e@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220302_190924_426200_EF5C79B8 
X-CRM114-Status: GOOD (  29.08  )
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

On Wed, 2022-03-02 at 10:07 +0100, AngeloGioacchino Del Regno wrote:
> Il 25/02/22 10:53, xinlei.lee@mediatek.com ha scritto:
> > From: Xinlei Lee <xinlei.lee@mediatek.com>
> > 
> > Dpi_clk is controlled by the mux selected
> > by TOPCKGEN and APMIXEDSYS can support small resolution.
> > 
> > Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Hello Xinlei,
> 
> as it was pointed out by reviewers in the MT8195 DisplayPort series,
> that is
> adding the same logic that you are proposing in this patch, the clock
> parent
> selection should be performed by the clock drivers, I'd say in the
> callback
> .set_rate_and_parent(), and not by the mtk_dpi driver.
> 
> Please fix this in the proper drivers (clocks!) instead.
> 
> Thanks,
> Angelo
> 
> > ---
> >   drivers/gpu/drm/mediatek/mtk_dpi.c | 38
> > ++++++++++++++++++++++++++----
> >   1 file changed, 34 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > index 4554e2de1430..bad686817e29 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > @@ -63,6 +63,14 @@ enum mtk_dpi_out_color_format {
> >   	MTK_DPI_COLOR_FORMAT_YCBCR_422_FULL
> >   };
> >   
> > +enum TVDPLL_CLK {
> > +	TVDPLL_PLL = 0,
> > +	TVDPLL_D2 = 2,
> > +	TVDPLL_D4 = 4,
> > +	TVDPLL_D8 = 8,
> > +	TVDPLL_D16 = 16,
> > +};
> > +
> >   struct mtk_dpi {
> >   	struct drm_encoder encoder;
> >   	struct drm_bridge bridge;
> > @@ -73,6 +81,7 @@ struct mtk_dpi {
> >   	struct clk *engine_clk;
> >   	struct clk *pixel_clk;
> >   	struct clk *tvd_clk;
> > +	struct clk *pclk_src[5];
> >   	int irq;
> >   	struct drm_display_mode mode;
> >   	const struct mtk_dpi_conf *conf;
> > @@ -459,6 +468,7 @@ static int mtk_dpi_set_display_mode(struct
> > mtk_dpi *dpi,
> >   	struct videomode vm = { 0 };
> >   	unsigned long pll_rate;
> >   	unsigned int factor;
> > +	struct clk *clksrc = NULL;
> >   
> >   	/* let pll_rate can fix the valid range of tvdpll (1G~2GHz) */
> >   	factor = dpi->conf->cal_factor(mode->clock);
> > @@ -473,11 +483,26 @@ static int mtk_dpi_set_display_mode(struct
> > mtk_dpi *dpi,
> >   
> >   	vm.pixelclock = pll_rate / factor;
> >   	if ((dpi->output_fmt == MEDIA_BUS_FMT_RGB888_2X12_LE) ||
> > -	    (dpi->output_fmt == MEDIA_BUS_FMT_RGB888_2X12_BE))
> > -		clk_set_rate(dpi->pixel_clk, vm.pixelclock * 2);
> > -	else
> > -		clk_set_rate(dpi->pixel_clk, vm.pixelclock);
> > +	    (dpi->output_fmt == MEDIA_BUS_FMT_RGB888_2X12_BE)) {
> > +		if (factor == 8)
> > +			clksrc = dpi->pclk_src[2];
> > +		else if (factor == 4)
> > +			clksrc = dpi->pclk_src[1];
> > +		else
> > +			clksrc = dpi->pclk_src[1];
> > +		}
> > +	else {
> > +		if (factor == 8)
> > +			clksrc = dpi->pclk_src[3];
> > +		else if (factor == 4)
> > +			clksrc = dpi->pclk_src[2];
> > +		else
> > +			clksrc = dpi->pclk_src[2];
> > +	}
> >   
> > +	clk_prepare_enable(dpi->pixel_clk);
> > +	clk_set_parent(dpi->pixel_clk, clksrc);
> > +	clk_disable_unprepare(dpi->pixel_clk);
> >   
> >   	vm.pixelclock = clk_get_rate(dpi->pixel_clk);
> >   
> > @@ -893,6 +918,11 @@ static int mtk_dpi_probe(struct
> > platform_device *pdev)
> >   		return ret;
> >   	}
> >   
> > +	dpi->pclk_src[1] = devm_clk_get_optional(dev, "tvdpll_d2");
> > +	dpi->pclk_src[2] = devm_clk_get_optional(dev, "tvdpll_d4");
> > +	dpi->pclk_src[3] = devm_clk_get_optional(dev, "tvdpll_d8");
> > +	dpi->pclk_src[4] = devm_clk_get_optional(dev, "tvdpll_d16");
> > +
> >   	dpi->irq = platform_get_irq(pdev, 0);
> >   	if (dpi->irq <= 0)
> >   		return -EINVAL;
> 
> 

Hi Angelo:

Thanks for your review, I would like to explain why I operate clk in
dpi driver.
A patch I mentioned on the cover: 
http://lists.infradead.org/pipermail/linux-mediatek/2016-May/005281.html
It contains instructions:

+ * The dpi0_sel clock should not propagate rate changes to its parent
+ * clock so the dpi driver can have full control over PLL and divider.

My understanding is that the clk driver will no longer perform the
set_rate_and_parent() operation on dpi_clk, but will hand over the
control to the dpi driver.
The current modification may be to synchronize the previous clk
modification.
Can we operate clk on dpi driver for this reson?

Best Regards!
xinlei
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
