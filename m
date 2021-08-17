Return-Path: <SRS0=tEpm=NI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BAEBC4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Aug 2021 09:51:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51A98601FA
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Aug 2021 09:51:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 51A98601FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Iiw/h+sENOH2YAHbqCTKQ13KtaaHG2lKVqPR1/9cPag=; b=zDp8hNdIIf9j2P
	5myLS+HcRmPP0LyS5W0kAE8iRcfntjhCSHpgXg89uddsA9huFoDTVxjvNE79QQUyhW/CSHZY94wk6
	iuCRvjcDLYd+q+pM3KLj0daBe1e0wPf0WpjC3kmmg3tMKAB8AkIxK3mKpAlUgLeeT4YBZochiDsB+
	SgFkH46TmcnYlQ93IMTVPQsCg1vTlKjGJKk5q3+2bmVOul8anoRsjP6BmYWK5uhhASX7Xn39LVTZL
	dOv8MPnXa0/dtUk20LDBDGjNouCyxVe3cU00iLMiTDjFyegqBcURw3JFz9FeHzfpA50YKgKuKTyyI
	J+GuCuRFpqshLN7qzIqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFvkN-001vcH-Ns; Tue, 17 Aug 2021 09:51:03 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFvkK-001vZv-1I; Tue, 17 Aug 2021 09:51:02 +0000
X-UUID: 8b06a0a58930456786ceaa957480392f-20210817
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=9piB8QNC7LNa64Cxv1P75hKgH9XVdHP2w7RePzDZ4fk=; 
 b=L5qIzwW7xyWjnugL4FtfxyaoU+iRv2v9Z8ocrmBLkYwkivPEblb+9rcsU0gP5D8NUCnNLx36o175HB62DABE34JR9JvUptKIIqGmCYqeL9PiFrPjJn1OfQNYqf/G+SD0s86dlLJBKjCatg0r6zVVqkrEO8vODPnIj8YdfkezQXg=;
X-UUID: 8b06a0a58930456786ceaa957480392f-20210817
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1730695374; Tue, 17 Aug 2021 02:50:58 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 17 Aug 2021 02:50:57 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 17 Aug 2021 17:50:44 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 17 Aug 2021 17:50:44 +0800
Message-ID: <1629193844.19746.2.camel@mtksdaap41>
Subject: Re: [RFC PATCH 2/5] drm/mediatek: dpi: Add dpintf support
From: CK Hu <ck.hu@mediatek.com>
To: Markus Schneider-Pargmann <msp@baylibre.com>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>
Date: Tue, 17 Aug 2021 17:50:44 +0800
In-Reply-To: <20210816192523.1739365-3-msp@baylibre.com>
References: <20210816192523.1739365-1-msp@baylibre.com>
 <20210816192523.1739365-3-msp@baylibre.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_025100_098880_2484A259 
X-CRM114-Status: GOOD (  25.17  )
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

Hi, Markus:

On Mon, 2021-08-16 at 21:25 +0200, Markus Schneider-Pargmann wrote:
> dpintf is the displayport interface hardware unit. This unit is similar
> to dpi and can reuse most of the code.
> 
> This patch adds support for mt8195-dpintf to this dpi driver. Main
> differences are:
>  - Some features/functional components are not available for dpintf
>    which are now excluded from code execution once is_dpintf is set
>  - dpintf can and needs to choose between different clockdividers based
>    on the clockspeed. This is done by choosing a different clock parent.
>  - There are two additional clocks that need to be managed. These are
>    only set for dpintf and will be set to NULL if not supplied. The
>    clk_* calls handle these as normal clocks then.
>  - Some register contents differ slightly between the two components. To
>    work around this I added register bits/masks with a DPINTF_ prefix
>    and use them where different.
> 
> Based on a separate driver for dpintf created by
> Jason-JH.Lin <jason-jh.lin@mediatek.com>.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c      | 282 ++++++++++++++++++++----
>  drivers/gpu/drm/mediatek/mtk_dpi_regs.h |  12 +
>  2 files changed, 247 insertions(+), 47 deletions(-)
> 

[snip]

>  
> +static void mtk_dpi_set_pixel_clk_parent(struct mtk_dpi *dpi,
> +					 unsigned int factor)
> +{
> +	struct clk *new_parent;
> +
> +	switch (factor) {
> +	case 16:
> +		new_parent = dpi->tvd_clks[MTK_DPI_TVDPLL_D16].clk;
> +		break;
> +	case 8:
> +		new_parent = dpi->tvd_clks[MTK_DPI_TVDPLL_D8].clk;
> +		break;
> +	case 4:
> +		new_parent = dpi->tvd_clks[MTK_DPI_TVDPLL_D4].clk;
> +		break;
> +	case 2:
> +		new_parent = dpi->tvd_clks[MTK_DPI_TVDPLL_D2].clk;
> +		break;
> +	default:
> +		new_parent = NULL;
> +	}
> +	if (new_parent)
> +		clk_set_parent(dpi->pixel_clk, new_parent);

I prefer that dpi->pixel_clk provide set_rate() interface, and let clock
driver to control the parent of dpi->pixel_clk.

Regards,
CK

> +}
> +
>  static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
>  				    struct drm_display_mode *mode)
>  {
> @@ -465,6 +568,8 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
>  	drm_display_mode_to_videomode(mode, &vm);
>  	pll_rate = vm.pixelclock * factor;
>  
> +	mtk_dpi_set_pixel_clk_parent(dpi, factor);
> +
>  	dev_dbg(dpi->dev, "Want PLL %lu Hz, pixel clock %lu Hz\n",
>  		pll_rate, vm.pixelclock);
>  


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
