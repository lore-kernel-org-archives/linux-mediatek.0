Return-Path: <SRS0=Nu0C=6Z=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C903C47255
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2020 06:13:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F27B9207DD
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2020 06:13:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="maXzLk/H";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="oQESTFDj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F27B9207DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qdt2mqOsdEOuVew/jxEnhTzztRan/Kn0O5ntMcvzjJg=; b=maXzLk/HOSJh3G
	klnbe9tCp+psusUp11d1WZGJpTxz3SLpsh2rmz4jtQ3N8hARJfWSzLPW1Fp8ClXP/U/K894TzZyKS
	1sbuiLN5x5ndWqaN8IE+nGkJOr0mY2NOX6L2NPIuI+hSv5Xvmq3g9gWMbHMqS1kRxezBDzPPKVJoy
	UnIFeGcE4EFaKlFeSV0ep1l+IQOMgfG4Hf9OQcNKaeeE/Fk5IBjBBawqzLBZrJ31bDI2NUC5kJcpm
	Mg6FSFcdjiugEazTK0Loj4aPn6YDqJp8LUf3RpGli4fjm60+xQhva2SZfehV+98VZxMfKitOKjVkg
	A8Zeq/H+ozHEuO1JUaKA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jY1gS-0005qs-B6; Mon, 11 May 2020 06:13:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jY1g1-0005GA-Q3; Mon, 11 May 2020 06:12:35 +0000
X-UUID: e8d7c648059a4f7681b5f0e8d8eb5209-20200510
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Lsl8lnD7OWKP4jCPIL+fIGfMyXwcqWyWiC/ejlNhD8w=; 
 b=oQESTFDjCnAE78tcpXC+QY0W1SxBdNbWuhPTIdOz9O3zspoBPQejEVhz+IrErc8LOyu/mr2MvABtsyjG9AD6E/Rs9jF6UF4iQ5qaKgKeWycdh5HThhkiqulD6wPK9tMft2PzW5ydJySxMUpBSGGzKROJuL3Ny4/vmc/hTZpqaPQ=;
X-UUID: e8d7c648059a4f7681b5f0e8d8eb5209-20200510
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1774483; Sun, 10 May 2020 22:12:27 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 10 May 2020 23:02:25 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 11 May 2020 14:02:27 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 11 May 2020 14:02:27 +0800
Message-ID: <1589176947.21832.9.camel@mtksdaap41>
Subject: Re: [PATCH v14 03/11] soc: mediatek: Add basic_clk_name to
 scp_power_data
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Date: Mon, 11 May 2020 14:02:27 +0800
In-Reply-To: <7ad67855-a3f8-f979-8849-3765bd8289d3@collabora.com>
References: <1588752963-19934-1-git-send-email-weiyi.lu@mediatek.com>
 <1588752963-19934-4-git-send-email-weiyi.lu@mediatek.com>
 <7ad67855-a3f8-f979-8849-3765bd8289d3@collabora.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: DC61A680C42B6E7D8C79A5AE02CAC469C3B32FE8863099B2CB8B03AD60D641312000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200510_231233_850040_E1534C59 
X-CRM114-Status: GOOD (  24.22  )
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
Cc: James Liao <jamesjj.liao@mediatek.com>,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com, Rob
 Herring <robh@kernel.org>, Enric Balletbo Serra <eballetbo@gmail.com>,
 linux-kernel@vger.kernel.org, Fan Chen <fan.chen@mediatek.com>,
 linux-mediatek@lists.infradead.org, Sascha Hauer <kernel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On Wed, 2020-05-06 at 23:01 +0200, Enric Balletbo i Serra wrote:
> Hi Weiyi,
> 
> Thank you for your patch.
> 
> On 6/5/20 10:15, Weiyi Lu wrote:
> > Try to stop extending the clk_id or clk_names if there are
> > more and more new BASIC clocks. To get its own clocks by the
> > basic_clk_name of each power domain.
> > And then use basic_clk_name strings for all compatibles, instead of
> > mixing clk_id and clk_name.
> > 
> > Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> > Reviewed-by: Nicolas Boichat <drinkcat@chromium.org>
> > ---
> >  drivers/soc/mediatek/mtk-scpsys.c | 134 ++++++++++++--------------------------
> >  1 file changed, 41 insertions(+), 93 deletions(-)
> > 
> > diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
> > index f669d37..c9c3cf7 100644
> > --- a/drivers/soc/mediatek/mtk-scpsys.c
> > +++ b/drivers/soc/mediatek/mtk-scpsys.c
> > @@ -78,34 +78,6 @@
> >  #define PWR_STATUS_HIF1			BIT(26)	/* MT7622 */
> >  #define PWR_STATUS_WB			BIT(27)	/* MT7622 */
> >  
> > -enum clk_id {
> > -	CLK_NONE,
> > -	CLK_MM,
> > -	CLK_MFG,
> > -	CLK_VENC,
> > -	CLK_VENC_LT,
> > -	CLK_ETHIF,
> > -	CLK_VDEC,
> > -	CLK_HIFSEL,
> > -	CLK_JPGDEC,
> > -	CLK_AUDIO,
> > -	CLK_MAX,
> > -};
> > -
> > -static const char * const clk_names[] = {
> > -	NULL,
> > -	"mm",
> > -	"mfg",
> > -	"venc",
> > -	"venc_lt",
> > -	"ethif",
> > -	"vdec",
> > -	"hif_sel",
> > -	"jpgdec",
> > -	"audio",
> > -	NULL,
> > -};
> > -
> >  #define MAX_CLKS	3
> >  
> >  /**
> > @@ -116,7 +88,7 @@ enum clk_id {
> >   * @sram_pdn_bits: The mask for sram power control bits.
> >   * @sram_pdn_ack_bits: The mask for sram power control acked bits.
> >   * @bus_prot_mask: The mask for single step bus protection.
> > - * @clk_id: The basic clocks required by this power domain.
> > + * @basic_clk_name: The basic clocks required by this power domain.
> >   * @caps: The flag for active wake-up action.
> >   */
> >  struct scp_domain_data {
> > @@ -126,7 +98,7 @@ struct scp_domain_data {
> >  	u32 sram_pdn_bits;
> >  	u32 sram_pdn_ack_bits;
> >  	u32 bus_prot_mask;
> > -	enum clk_id clk_id[MAX_CLKS];
> > +	const char *basic_clk_name[MAX_CLKS];
> 
> I only reviewed v13, so sorry if this was already discussed. I am wondering if
> would be better take advantage of the devm_clk_bulk_get() function instead of
> kind of reimplementing the same, something like this
> 
> 	const struct clk_bulk_data *basic_clocks;
> 

I thought it should be const struct clk_bulk_data
basic_clocks[MAX_CLKS]; instead of const struct clk_bulk_data
*basic_clocks; in struct scp_domain_data data type

> >  	u8 caps;
> >  };
> >  
> > @@ -411,12 +383,19 @@ static int scpsys_power_off(struct generic_pm_domain *genpd)
> >  	return ret;
> >  }
> >  
> > -static void init_clks(struct platform_device *pdev, struct clk **clk)
> > +static int init_basic_clks(struct platform_device *pdev, struct clk **clk,
> > +			const char * const *name)
> >  {
> >  	int i;
> >  
> > -	for (i = CLK_NONE + 1; i < CLK_MAX; i++)
> > -		clk[i] = devm_clk_get(&pdev->dev, clk_names[i]);
> > +	for (i = 0; i < MAX_CLKS && name[i]; i++) {
> > +		clk[i] = devm_clk_get(&pdev->dev, name[i]);
> > +
> > +		if (IS_ERR(clk[i]))
> > +			return PTR_ERR(clk[i]);
> > +	}
> 
> You will be able to remove this function, see below ...
> 
> > +
> > +	return 0;
> >  }
> >  
> >  static struct scp *init_scp(struct platform_device *pdev,
> > @@ -426,9 +405,8 @@ static struct scp *init_scp(struct platform_device *pdev,
> >  {
> >  	struct genpd_onecell_data *pd_data;
> >  	struct resource *res;
> > -	int i, j;
> > +	int i, ret;
> >  	struct scp *scp;
> > -	struct clk *clk[CLK_MAX];
> >  
> >  	scp = devm_kzalloc(&pdev->dev, sizeof(*scp), GFP_KERNEL);
> >  	if (!scp)
> > @@ -481,8 +459,6 @@ static struct scp *init_scp(struct platform_device *pdev,
> >  
> >  	pd_data->num_domains = num;
> >  
> > -	init_clks(pdev, clk);
> > -
> >  	for (i = 0; i < num; i++) {
> >  		struct scp_domain *scpd = &scp->domains[i];
> >  		struct generic_pm_domain *genpd = &scpd->genpd;
> > @@ -493,17 +469,9 @@ static struct scp *init_scp(struct platform_device *pdev,
> >  
> >  		scpd->data = data;
> >  
> > -		for (j = 0; j < MAX_CLKS && data->clk_id[j]; j++) {
> > -			struct clk *c = clk[data->clk_id[j]];
> > -
> > -			if (IS_ERR(c)) {
> > -				dev_err(&pdev->dev, "%s: clk unavailable\n",
> > -					data->name);
> > -				return ERR_CAST(c);
> > -			}
> > -
> > -			scpd->clk[j] = c;
> > -		}
> > +		ret = init_basic_clks(pdev, scpd->clk, data->basic_clk_name);
> > +		if (ret)
> > +			return ERR_PTR(ret);
> 
> Just call:
> 
> 	ret = devm_clk_bulk_get(&pdev->dev, ARRAY_SIZE(basic_clocks),
> 				data->basic_clocks);
> 	if (ret)
> 		return ERR_PTR(ret);
> 
> >  
> >  		genpd->name = data->name;
> >  		genpd->power_off = scpsys_power_off;
> > @@ -560,7 +528,6 @@ static void mtk_register_power_domains(struct platform_device *pdev,
> >  		.ctl_offs = SPM_CONN_PWR_CON,
> >  		.bus_prot_mask = MT2701_TOP_AXI_PROT_EN_CONN_M |
> >  				 MT2701_TOP_AXI_PROT_EN_CONN_S,
> > -		.clk_id = {CLK_NONE},
> >  		.caps = MTK_SCPD_ACTIVE_WAKEUP,
> >  	},
> >  	[MT2701_POWER_DOMAIN_DISP] = {
> > @@ -568,7 +535,7 @@ static void mtk_register_power_domains(struct platform_device *pdev,
> >  		.sta_mask = PWR_STATUS_DISP,
> >  		.ctl_offs = SPM_DIS_PWR_CON,
> >  		.sram_pdn_bits = GENMASK(11, 8),
> > -		.clk_id = {CLK_MM},
> > +		.basic_clk_name = {"mm"},
> 
> 		.basic_clocks[] = {
> 			{ .id = "mm" },
> 		};
> 

Those basic clocks without given a name (name: null) would get incorrect
clock via clk_bulk_get(...) due to 

/**
 * of_parse_clkspec() - Parse a DT clock specifier for a given device
node
 * @np: device node to parse clock specifier from
 * @index: index of phandle to parse clock out of. If index < 0, @name
is used
 * @name: clock name to find and parse. If name is NULL, the index is
used

And the index is 0 here in this callstack

I guess something need to be improved before we use the clk_bulk_ APIs.


> >  		.bus_prot_mask = MT2701_TOP_AXI_PROT_EN_MM_M0,
> >  		.caps = MTK_SCPD_ACTIVE_WAKEUP,
> >  	},
> > @@ -578,7 +545,7 @@ static void mtk_register_power_domains(struct platform_device *pdev,
> >  		.ctl_offs = SPM_MFG_PWR_CON,
> >  		.sram_pdn_bits = GENMASK(11, 8),
> >  		.sram_pdn_ack_bits = GENMASK(12, 12),
> > -		.clk_id = {CLK_MFG},
> > +		.basic_clk_name = {"mfg"},
> 
> 		.basic_clocks[] = {
> 			{ .id = "mfg" },
> 		};
> 
> >  		.caps = MTK_SCPD_ACTIVE_WAKEUP,
> >  	},
> >  	[MT2701_POWER_DOMAIN_VDEC] = {
> > @@ -587,7 +554,7 @@ static void mtk_register_power_domains(struct platform_device *pdev,
> >  		.ctl_offs = SPM_VDE_PWR_CON,
> >  		.sram_pdn_bits = GENMASK(11, 8),
> >  		.sram_pdn_ack_bits = GENMASK(12, 12),
> > -		.clk_id = {CLK_MM},
> > +		.basic_clk_name = {"mm"},
> 
> ...
> 
> [snip]


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
