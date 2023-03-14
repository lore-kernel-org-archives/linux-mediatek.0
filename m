Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32107C74A5B
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Mar 2023 12:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fcGM8jfHA6cukAImsuU6JGuk18jVZlFj/sEsOHHZgL8=; b=xkGQHJ0LkL89kyqCd6m7mf6GMx
	45kwhy7blpoBFef4rsXCxwge7s7OWxa8V6EdV4zkseAlEWHAJM4kNjgkg6XZx7Zef/OJu+5h5t5QR
	dKRZfsvAILHhC11+0Pf7gkXILVFwb3ToIUVikaNkvbtgGTFKvyfC3N2s+sX5OCalvTsV0QvL7q156
	Fz/U5Kjh6ctPuu/kpd2YgtRXsHUF0ZNnvFjz1gYdjMCVwlayQ+szZk+bzQWb3rbxamhsQJp1Rmxxh
	fFVNTdEF2hmJFB/QW8ytY+o/i6TuKGfVtKnnVLich/5bYrWFVxpiLGlQMrJU3KYlAxLL/4lZ7Razz
	F6mtGtFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pc3qx-00A7mD-24;
	Tue, 14 Mar 2023 12:34:07 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pc3qv-00A7lg-00;
	Tue, 14 Mar 2023 12:34:06 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pc3qm-0002ps-0V;
	Tue, 14 Mar 2023 13:33:56 +0100
Date: Tue, 14 Mar 2023 12:32:13 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-i2c@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Qii Wang <qii.wang@mediatek.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH 1/2] i2c: mediatek: add support for MT7981 SoC
Message-ID: <ZBBpTS/ayjU1WfE0@makrotopia.org>
References: <cover.1678756608.git.daniel@makrotopia.org>
 <fdbd18ab71693b2b0dcbe1094bcfd1060bf21200.1678756608.git.daniel@makrotopia.org>
 <5f219379-cccb-d8ca-ed23-4106ca3ecf3a@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5f219379-cccb-d8ca-ed23-4106ca3ecf3a@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_053405_038451_FE04531B 
X-CRM114-Status: GOOD (  17.98  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Mar 14, 2023 at 10:26:56AM +0100, AngeloGioacchino Del Regno wrote:
> Il 14/03/23 02:18, Daniel Golle ha scritto:
> > Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> > ---
> >   drivers/i2c/busses/i2c-mt65xx.c | 13 +++++++++++++
> >   1 file changed, 13 insertions(+)
> > 
> > diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
> > index 43dd966d5ef5..54cabd366403 100644
> > --- a/drivers/i2c/busses/i2c-mt65xx.c
> > +++ b/drivers/i2c/busses/i2c-mt65xx.c
> > @@ -431,6 +431,18 @@ static const struct mtk_i2c_compatible mt8168_compat = {
> >   	.max_dma_support = 33,
> >   };
> > +static const struct mtk_i2c_compatible mt7981_compat = {
> > +	.regs = mt_i2c_regs_v3,
> 
> I've found a downstream kernel saying that MT7981 uses `mt_i2c_regs_v2`,
> hence the question:
> 
> Are you sure that this is supposed to be v3?

Yes, I've seen that downstream kernel and it also patches
OFFSET_SLAVE_ADDR to be 0x94 instead of 0x4 (which is the only difference
between v2 and v3 regs).

So yes, I'm sure MT7981 and MT7988 use v3 register layout.

> 
> Regards,
> Angelo
> 
> > +	.pmic_i2c = 0,
> > +	.dcm = 0,
> > +	.auto_restart = 1,
> > +	.aux_len_reg = 1,
> > +	.timing_adjust = 1,
> > +	.dma_sync = 1,
> > +	.ltiming_adjust = 1,
> > +	.max_dma_support = 33
> > +};
> > +
> >   static const struct mtk_i2c_compatible mt7986_compat = {
> >   	.quirks = &mt7622_i2c_quirks,
> >   	.regs = mt_i2c_regs_v1,
> > @@ -516,6 +528,7 @@ static const struct of_device_id mtk_i2c_of_match[] = {
> >   	{ .compatible = "mediatek,mt6577-i2c", .data = &mt6577_compat },
> >   	{ .compatible = "mediatek,mt6589-i2c", .data = &mt6589_compat },
> >   	{ .compatible = "mediatek,mt7622-i2c", .data = &mt7622_compat },
> > +	{ .compatible = "mediatek,mt7981-i2c", .data = &mt7981_compat },
> >   	{ .compatible = "mediatek,mt7986-i2c", .data = &mt7986_compat },
> >   	{ .compatible = "mediatek,mt8168-i2c", .data = &mt8168_compat },
> >   	{ .compatible = "mediatek,mt8173-i2c", .data = &mt8173_compat },
> 
> 

