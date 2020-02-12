Return-Path: <SRS0=vX0G=4A=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98796C35242
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Feb 2020 02:56:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C659206DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Feb 2020 02:56:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Jyom94lF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ijjN9Etd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C659206DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5joStFW+ISusGo5lmaGZ0eU5Q8iLoMsY10Se91SpRYQ=; b=Jyom94lFD6YddN
	HBJv972N5NOSvJnJDPsfGmFHc+CPN3TLCb36fM43X8z1yRlhiFhSigJ1GlTVQnpphoaepZi86ntov
	6AReqLnBbzaQ4rUrXRzBAeT1vcSKEAbE2W35BwSQEjD8bT5f98xeTRPGu1eHhYp1t9qgg8rctxQWA
	kMGKEQMB9ohn05PNRWq8zSEtY9I00XGD3FXQrnAFqJ6LpU4Vptz++mTgKVJ0x7wZtwl+q9B3LmWxY
	YJsstBIaitDF5LfAj2TkzeyGXDxeCpjvLS4AZ/lJSShzCH6pK/HVapmyNVCGTTrOhwNovt96ufqp/
	itBAy4Q+NbSBUAolA/kw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j1iCP-0003rW-Jk; Wed, 12 Feb 2020 02:56:25 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1iCA-0003ad-Ny; Wed, 12 Feb 2020 02:56:13 +0000
X-UUID: cb2e618a2df34012b6396992f3356235-20200211
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=QdBTe7gC7JKil+2UQTfobpCtMYtklWuvZOCuYuWCF58=; 
 b=ijjN9EtdiE3PCggNx3sotA+exutjRy8H6hFdUmOsLIUuRM7nh2HVMp3r0dbOTUp2c7J8QiX/p2aB3v2uSg2vZhEjOGmGdlvJiPeT3CQCFA4edw6AZTtpvZ3saikPg6UwpDhR0Uvp51b/stl8VhCWpgsZbecaE7uYvNY8K4gn628=;
X-UUID: cb2e618a2df34012b6396992f3356235-20200211
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2082554948; Tue, 11 Feb 2020 18:56:04 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 11 Feb 2020 18:56:11 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 12 Feb 2020 10:54:24 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 12 Feb 2020 10:55:02 +0800
Message-ID: <1581476161.22901.36.camel@mtksdaap41>
Subject: Re: [PATCH v11 07/10] soc: mediatek: Add extra sram control
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Date: Wed, 12 Feb 2020 10:56:01 +0800
In-Reply-To: <28fcf690-74cb-b7cd-a53b-e54be71457b9@gmail.com>
References: <1576813564-23927-1-git-send-email-weiyi.lu@mediatek.com>
 <1576813564-23927-8-git-send-email-weiyi.lu@mediatek.com>
 <28fcf690-74cb-b7cd-a53b-e54be71457b9@gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200211_185610_814769_BA615958 
X-CRM114-Status: GOOD (  19.74  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Rob Herring <robh@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>,
 srv_heupstream@mediatek.com, James Liao <jamesjj.liao@mediatek.com>,
 linux-kernel@vger.kernel.org, Fan Chen <fan.chen@mediatek.com>,
 linux-mediatek@lists.infradead.org, Sascha Hauer <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2020-02-11 at 18:04 +0100, Matthias Brugger wrote:
> 
> On 20/12/2019 04:46, Weiyi Lu wrote:
> > For some power domains like vpu_core on MT8183 whose sram need to
> > do clock and internal isolation while power on/off sram.
> > We add a flag "sram_iso_ctrl" in scp_domain_data to judge if we
> > need to do the extra sram isolation control or not.
> > 
> > Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> > Reviewed-by: Nicolas Boichat <drinkcat@chromium.org>
> > ---
> >  drivers/soc/mediatek/mtk-scpsys.c | 24 ++++++++++++++++++++++--
> >  1 file changed, 22 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
> > index 32be4b3..1972726 100644
> > --- a/drivers/soc/mediatek/mtk-scpsys.c
> > +++ b/drivers/soc/mediatek/mtk-scpsys.c
> > @@ -56,6 +56,8 @@
> >  #define PWR_ON_BIT			BIT(2)
> >  #define PWR_ON_2ND_BIT			BIT(3)
> >  #define PWR_CLK_DIS_BIT			BIT(4)
> > +#define PWR_SRAM_CLKISO_BIT		BIT(5)
> > +#define PWR_SRAM_ISOINT_B_BIT		BIT(6)
> >  
> >  #define PWR_STATUS_CONN			BIT(1)
> >  #define PWR_STATUS_DISP			BIT(3)
> > @@ -86,6 +88,8 @@
> >   * @name: The domain name.
> >   * @sta_mask: The mask for power on/off status bit.
> >   * @ctl_offs: The offset for main power control register.
> > + * @sram_iso_ctrl: The flag to judge if the power domain need to do
> > + *                 the extra sram isolation control.
> >   * @sram_pdn_bits: The mask for sram power control bits.
> >   * @sram_pdn_ack_bits: The mask for sram power control acked bits.
> >   * @basic_clk_name: The basic clocks required by this power domain.
> > @@ -98,6 +102,7 @@ struct scp_domain_data {
> >  	const char *name;
> >  	u32 sta_mask;
> >  	int ctl_offs;
> > +	bool sram_iso_ctrl;
> 
> Why don't we put that into the caps variable? We have plenty of space left there
> and if needed we can bump up its value from u8 to u32.
> 

Thanks for reminding, I'll put into caps in next version.

> >  	u32 sram_pdn_bits;
> >  	u32 sram_pdn_ack_bits;
> >  	const char *basic_clk_name[MAX_CLKS];
> > @@ -233,6 +238,14 @@ static int scpsys_sram_enable(struct scp_domain *scpd, void __iomem *ctl_addr)
> >  			return ret;
> >  	}
> >  
> > +	if (scpd->data->sram_iso_ctrl)	{
> > +		val = readl(ctl_addr) | PWR_SRAM_ISOINT_B_BIT;
> > +		writel(val, ctl_addr);
> > +		udelay(1);
> > +		val &= ~PWR_SRAM_CLKISO_BIT;
> > +		writel(val, ctl_addr);
> > +	}
> > +
> >  	return 0;
> >  }
> >  
> > @@ -242,8 +255,15 @@ static int scpsys_sram_disable(struct scp_domain *scpd, void __iomem *ctl_addr)
> >  	u32 pdn_ack = scpd->data->sram_pdn_ack_bits;
> >  	int tmp;
> >  
> > -	val = readl(ctl_addr);
> > -	val |= scpd->data->sram_pdn_bits;
> > +	if (scpd->data->sram_iso_ctrl)	{
> > +		val = readl(ctl_addr) | PWR_SRAM_CLKISO_BIT;
> > +		writel(val, ctl_addr);
> > +		val &= ~PWR_SRAM_ISOINT_B_BIT;
> > +		writel(val, ctl_addr);
> > +		udelay(1);
> 
> Why do we need to wait here?
> 

It's the restriction of sram isolation for both enable and disable stage
and we've confirmed 1us is safe.

> > +	}
> > +
> > +	val = readl(ctl_addr) | scpd->data->sram_pdn_bits;
> >  	writel(val, ctl_addr);
> >  
> >  	/* Either wait until SRAM_PDN_ACK all 1 or 0 */
> > 
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
