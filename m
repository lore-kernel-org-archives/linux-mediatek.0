Return-Path: <SRS0=2Vnt=J2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67DB9C433ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Apr 2021 02:24:28 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC28061433
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Apr 2021 02:24:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC28061433
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=c696+yrEivp7Kn8d0IgC++r05EbsecbTFvSxYx63Lc0=; b=SBaJ7bMYvR1f5T2PBDnsrP8wO
	ggfYj0/mDj4+b4RuCH/ERTYaOQ76BFTwoi3YNEYTrGlhK/p69RwumlGm2GdgYxX7R0KA89aZiFt62
	VySDDZwxtgbRsfxZ0hpm0jXBkFKPwk4xgNUMg6sFyQlEYf+Cx2U8dQcKIULgtV8u0uy7hqrYK5Fu0
	R/KBoDHzce02qJVqsdv1xb70o41ezqYZoMwOQ8hLebp2cwnYvKHVkVQzoXXIUgoFjqOqn667PcOks
	DW22BfE7inTdZmL6migPCn/Kcm1WIkFyCRGALwiGFaSGZteN2QRP2yyLtLx4f4OKkUUfrTCQf7r7Q
	CUqdL4sng==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbwLe-004h3m-6x; Thu, 29 Apr 2021 02:24:14 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbwLc-004h3Z-D0; Thu, 29 Apr 2021 02:24:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=o2p9JhCaBswcUrlrtgSrIfMJfhrFP72dGtfQIVy7kuA=; b=JO8VA3zVvXLIx9TwTB+QtffAt/
 qumzjHss5NJR/rmltoOAs2WiJhaQ5pfdiDrpuOS1e2mEr/djiOOGbBmMi24M+/0KBYSk47nsDuboF
 s7i43zDnO9SWa8rwaRdI9SmKRgP9ubvEU0031HJk5ZIN9lBD7sdRRXF84iPhWZrU1JsKDW9UKkOax
 s7TY5Bfy6vjmS6qGeXEF5wuFAoLqgoxvvnRFdeDRFluNAsFZqDDf3FoCoalSLm0XzjjrgVh9EOcM3
 np99cD/YrnZ+8vBgHm1byBVxPJrEfDyFlVcn96e8FATf1ZT2EvNOT8IW1zVNAAJw6WApbcrA6HQk0
 gu2ELV3A==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbwLZ-000K6a-Ep; Thu, 29 Apr 2021 02:24:10 +0000
X-UUID: 5929f72a055e4debb01b02877ac25b7a-20210428
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=o2p9JhCaBswcUrlrtgSrIfMJfhrFP72dGtfQIVy7kuA=; 
 b=Nk+POdjl+28R5hv3z4M9USpXfHwIoN//SqEhyz9DDj6wePk6lczWFMeVJZ0Vl1Sf+CbB8k1FzqdNUrdhMpLpQxBFP/VJFsoQHVwlqrg5jkNd/AwamoHt9PQT6WeVOHVzDzhxbOKiNI0jevmEE92Nz7lpR9BgC2C25uYjmCkg/co=;
X-UUID: 5929f72a055e4debb01b02877ac25b7a-20210428
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1348058443; Wed, 28 Apr 2021 19:24:01 -0700
Received: from MTKMBS33N2.mediatek.inc (172.27.4.76) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 28 Apr 2021 19:23:59 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 MTKMBS33N2.mediatek.inc (172.27.4.76) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 29 Apr 2021 10:23:46 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 29 Apr 2021 10:23:46 +0800
Message-ID: <21aa84ce0681ebc0682d9b9cad5b6180f3b0ea5b.camel@mediatek.com>
Subject: Re: [v2,PATCH 1/3] drm/mediatek: dpi dual edge sample mode support
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Neil Armstrong <narmstrong@baylibre.com>, <chunkuang.hu@kernel.org>,
 <matthias.bgg@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Jitao Shi
 <jitao.shi@mediatek.com>
Date: Thu, 29 Apr 2021 10:23:46 +0800
In-Reply-To: <a1ffcce8-621e-7493-22d4-e28ff09c31a4@baylibre.com>
References: <1618407316-10042-1-git-send-email-rex-bc.chen@mediatek.com>
 <1618407316-10042-2-git-send-email-rex-bc.chen@mediatek.com>
 <a1ffcce8-621e-7493-22d4-e28ff09c31a4@baylibre.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 079D6E7CD5DAD064F57F9898547CAB31CF76F7775DBE867A0942E66CFC3EBF782000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210428_192409_525915_7C95A81B 
X-CRM114-Status: GOOD (  20.86  )
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

On Mon, 2021-04-19 at 09:36 +0200, Neil Armstrong wrote:
> Hi,
> 
> On 14/04/2021 15:35, Rex-BC Chen wrote:
> > DPI can sample on falling, rising or both edge.
> > When DPI sample the data both rising and falling edge.
> > It can reduce half data io pins.
> > 
> > Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> > Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_dpi.c | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > index b05f900d9322..21a3a7b78835 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > @@ -83,6 +83,7 @@ struct mtk_dpi {
> >  	struct pinctrl *pinctrl;
> >  	struct pinctrl_state *pins_gpio;
> >  	struct pinctrl_state *pins_dpi;
> > +	bool ddr_edge_sel;
> >  	int refcount;
> >  };
> >  
> > @@ -121,6 +122,7 @@ struct mtk_dpi_conf {
> >  	unsigned int (*cal_factor)(int clock);
> >  	u32 reg_h_fre_con;
> >  	bool edge_sel_en;
> > +	bool dual_edge;
> >  };
> >  
> >  static void mtk_dpi_mask(struct mtk_dpi *dpi, u32 offset, u32 val,
> > u32 mask)
> > @@ -380,6 +382,15 @@ static void mtk_dpi_config_color_format(struct
> > mtk_dpi *dpi,
> >  	}
> >  }
> >  
> > +static void mtk_dpi_dual_edge(struct mtk_dpi *dpi)
> > +{
> > +	if (dpi->conf->dual_edge) {
> > +		mtk_dpi_mask(dpi, DPI_DDR_SETTING, DDR_EN | DDR_4PHASE,
> > +			     DDR_EN | DDR_4PHASE);
> > +		mtk_dpi_mask(dpi, DPI_OUTPUT_SETTING, dpi->ddr_edge_sel 
> > ? EDGE_SEL : 0, EDGE_SEL);
> > +	}
> > +}
> > +
> 
> By using the downstream code as reference:
> 
> -       clk_set_rate(dpi->pixel_clk, vm.pixelclock);
> +       clk_set_rate(dpi->pixel_clk, vm.pixelclock * (dpi->conf-
> >dual_edge ? 2 : 1));
> 
> is missing in mtk_dpi_set_display_mode()
> 
Hello Neil,

Thanks for helping checking this.
I will add this modification for next patch.

BRs,
Rex-BC Chen
> >  static void mtk_dpi_power_off(struct mtk_dpi *dpi)
> >  {
> >  	if (WARN_ON(dpi->refcount == 0))
> > @@ -518,6 +529,7 @@ static int mtk_dpi_set_display_mode(struct
> > mtk_dpi *dpi,
> >  	mtk_dpi_config_yc_map(dpi, dpi->yc_map);
> >  	mtk_dpi_config_color_format(dpi, dpi->color_format);
> >  	mtk_dpi_config_2n_h_fre(dpi);
> > +	mtk_dpi_dual_edge(dpi);
> >  	mtk_dpi_config_disable_edge(dpi);
> >  	mtk_dpi_sw_reset(dpi, false);
> >  
> > 
> 
> Neil
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
