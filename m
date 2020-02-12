Return-Path: <SRS0=vX0G=4A=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D744C35242
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Feb 2020 02:56:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE1B4206DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Feb 2020 02:56:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t2ochMop";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="csWWydTs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE1B4206DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hoqFLWvr45e+TsI+nWi08BaL1Brxmmt16zvJ6HU0m2E=; b=t2ochMopV/IA5g
	IwHxKpuuf9Zy8PnVGhxLb2tA2eRL4OH6Qt37U3+0OTZAEnwS5cW3MZvmURf6ngtx1X56N9TgVP/hU
	Gni6Xqtq+oLieU9LOxqqI+j7uxCs8gUs96UiUIExoUM/nJgkTYUZCSJZMHw83GTZYRGbdV2Rw8Dk3
	OyypY0/nPjghiQb2oxgYIPH5GDKbGAXZvD/3uSPX98uQSrnvtZl25hXrGJGJa8ZViHHVk9hvQBsci
	tpV1vILU1KuUk4hSxGl+esKGG7azpyd/8dFmkyGtbeg7tdcS2QVVLvcq+eNHzYyXkdYyc4Sw0X4GI
	s7cgg5vHNjDVWBtMKsTg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j1iBt-0003Cy-VH; Wed, 12 Feb 2020 02:55:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1iBq-0003C6-KU; Wed, 12 Feb 2020 02:55:52 +0000
X-UUID: 1519654140784ce3b1c3a4e0c2e249ca-20200211
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=CVp4/457QAcB9wBguvlF+YzoJtmCC32/wC6AaT16HVE=; 
 b=csWWydTsu9ngEofcRv1BJ8GYM40V4EBgriQHAkrEENY4+pA2bFucqKgk/PKLfXqOipK51R8bzH7afcoKLQMJqvYR2oo3iIn9DxHPdTzW+ZYW4Ek0W/UiCR0kckrKJtrbRCHsCi7fFRFL0sjiAoshSEmzUpVGioEDuJAfNG20LHc=;
X-UUID: 1519654140784ce3b1c3a4e0c2e249ca-20200211
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 535903644; Tue, 11 Feb 2020 18:55:45 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 11 Feb 2020 18:55:53 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 12 Feb 2020 10:53:20 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 12 Feb 2020 10:54:43 +0800
Message-ID: <1581476141.22901.34.camel@mtksdaap41>
Subject: Re: [PATCH v11 06/10] soc: mediatek: Add subsys clock control for
 bus protection
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Date: Wed, 12 Feb 2020 10:55:41 +0800
In-Reply-To: <b9ad8252-36e7-dacd-9040-de14e13f34f8@gmail.com>
References: <1576813564-23927-1-git-send-email-weiyi.lu@mediatek.com>
 <1576813564-23927-7-git-send-email-weiyi.lu@mediatek.com>
 <b9ad8252-36e7-dacd-9040-de14e13f34f8@gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 54481D8A4ABDDD25C5769B993302F1CFD271ED756CD3293C7E88ACD64CF27E212000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200211_185550_694171_F0A4D9DF 
X-CRM114-Status: GOOD (  32.66  )
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

On Tue, 2020-02-11 at 18:54 +0100, Matthias Brugger wrote:
> 
> On 20/12/2019 04:46, Weiyi Lu wrote:
> > Add subsys CG control flow before/after the bus protect control
> > due to bus protection need SMI bus relative CGs enabled to feedback
> > its ack.
> > 
> 
> Sorry, I don't understand the commit message. Can you please rephrase and
> explain better what this change is for.
> 

OK! I'll reword it.

> > Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> > Reviewed-by: Nicolas Boichat <drinkcat@chromium.org>
> > ---
> >  drivers/soc/mediatek/mtk-scpsys.c | 72 +++++++++++++++++++++++++++++++++++++--
> >  1 file changed, 70 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
> > index 763ca58..32be4b3 100644
> > --- a/drivers/soc/mediatek/mtk-scpsys.c
> > +++ b/drivers/soc/mediatek/mtk-scpsys.c
> > @@ -79,6 +79,7 @@
> >  #define PWR_STATUS_WB			BIT(27)	/* MT7622 */
> >  
> >  #define MAX_CLKS	3
> > +#define MAX_SUBSYS_CLKS 10
> >  
> >  /**
> >   * struct scp_domain_data - scp domain data for power on/off flow
> > @@ -88,6 +89,8 @@
> >   * @sram_pdn_bits: The mask for sram power control bits.
> >   * @sram_pdn_ack_bits: The mask for sram power control acked bits.
> >   * @basic_clk_name: The basic clocks required by this power domain.
> > + * @subsys_clk_prefix: The prefix name of the clocks need to be enabled
> > + *                     before releasing bus protection.
> >   * @caps: The flag for active wake-up action.
> >   * @bp_table: The mask table for multiple step bus protection.
> >   */
> > @@ -98,6 +101,7 @@ struct scp_domain_data {
> >  	u32 sram_pdn_bits;
> >  	u32 sram_pdn_ack_bits;
> >  	const char *basic_clk_name[MAX_CLKS];
> > +	const char *subsys_clk_prefix;
> >  	u8 caps;
> >  	struct bus_prot bp_table[MAX_STEPS];
> >  };
> > @@ -108,6 +112,7 @@ struct scp_domain {
> >  	struct generic_pm_domain genpd;
> >  	struct scp *scp;
> >  	struct clk *clk[MAX_CLKS];
> > +	struct clk *subsys_clk[MAX_SUBSYS_CLKS];
> >  	const struct scp_domain_data *data;
> >  	struct regulator *supply;
> >  };
> > @@ -301,16 +306,22 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
> >  	val |= PWR_RST_B_BIT;
> >  	writel(val, ctl_addr);
> >  
> > -	ret = scpsys_sram_enable(scpd, ctl_addr);
> > +	ret = scpsys_clk_enable(scpd->subsys_clk, MAX_SUBSYS_CLKS);
> 
> Why can't we enable the subsystem clocks together with the rest just after
> enabeling the regulator?
> 

Subsys CG could only be enabled when its own power domain is already
turned ON, and vice versa.
In the dt-binding doc we mentioned there would have two groups of
clocks.
e.g.,
BASIC clocks need to be enabled before enabling the corresponding power
domain.
SUBSYS clocks need to be enabled before releasing the bus protection.

> >  	if (ret < 0)
> >  		goto err_pwr_ack;
> >  
> > +	ret = scpsys_sram_enable(scpd, ctl_addr);
> > +	if (ret < 0)
> > +		goto err_sram;
> > +
> >  	ret = scpsys_bus_protect_disable(scpd);
> >  	if (ret < 0)
> > -		goto err_pwr_ack;
> > +		goto err_sram;
> >  
> >  	return 0;
> >  
> > +err_sram:
> > +	scpsys_clk_disable(scpd->subsys_clk, MAX_SUBSYS_CLKS);
> >  err_pwr_ack:
> >  	scpsys_clk_disable(scpd->clk, MAX_CLKS);
> >  err_clk:
> > @@ -337,6 +348,8 @@ static int scpsys_power_off(struct generic_pm_domain *genpd)
> >  	if (ret < 0)
> >  		goto out;
> >  
> > +	scpsys_clk_disable(scpd->subsys_clk, MAX_SUBSYS_CLKS);
> > +
> 
> Same here, why can't we disable the clocks in the scpsys_clk_disable call?
> 
> >  	/* subsys power off */
> >  	val = readl(ctl_addr);
> >  	val |= PWR_ISO_BIT;
> > @@ -374,6 +387,48 @@ static int scpsys_power_off(struct generic_pm_domain *genpd)
> >  	return ret;
> >  }
> >  
> > +static int init_subsys_clks(struct platform_device *pdev,
> > +		const char *prefix, struct clk **clk)
> > +{
> > +	struct device_node *node = pdev->dev.of_node;
> > +	u32 prefix_len, sub_clk_cnt = 0;
> > +	struct property *prop;
> > +	const char *clk_name;
> > +
> > +	if (!node) {
> > +		dev_err(&pdev->dev, "Cannot find scpsys node: %ld\n",
> > +			PTR_ERR(node));
> > +		return PTR_ERR(node);
> > +	}
> > +
> > +	prefix_len = strlen(prefix);
> > +
> > +	of_property_for_each_string(node, "clock-names", prop, clk_name) {
> > +		if (!strncmp(clk_name, prefix, prefix_len) &&
> > +				(clk_name[prefix_len] == '-')) {
> > +			if (sub_clk_cnt >= MAX_SUBSYS_CLKS) {
> > +				dev_err(&pdev->dev,
> > +					"subsys clk out of range %d\n",
> > +					sub_clk_cnt);
> > +				return -ENOMEM;
> 
> EINVAL maybe, ENOMEM seems wrong here.
> 

OK, I'll fix with correct error.

> > +			}
> > +
> > +			clk[sub_clk_cnt] = devm_clk_get(&pdev->dev,
> > +						clk_name);
> 
> Here we get hit by the bad design of this driver in the first place. As we need
> the subsystem-name (eg mm-0, mm-1) to group clocks to one scp_domain.
> I think we should better try to model the domains and subdomains in DTS and add
> their clocks to it. This way we can also get rid of the scp_subdomain which can
> hit it's limit anytime soon when we have a chip with a sub-subdomain.
> That will need a new driver, but as it seems the mt8183 and the mt6765 have a
> more complex design I think it is worth it.
> 
> That said, given that you are in v11 already I understand that your motivation
> to start over isn't the biggest. The problem is, any new driver will have new
> bindings and won't work with older DTS. So adding a lot of stuff on top of a not
> really nice driver isn't something I'm very keen on. On the other hand you
> already put a lot of work into this solution.
> 
> My proposal, I'll try to bake up a new driver this week. If I fail to deliver,
> it's up to you to decide if you want to go on with the approach in this series
> or try to work on the new one.

> Regards,
> Matthias
> 

Thanks for considering our request.

> > +
> > +			if (IS_ERR(clk[sub_clk_cnt])) {
> > +				dev_err(&pdev->dev,
> > +					"Subsys clk get fail %ld\n",
> > +					PTR_ERR(clk[sub_clk_cnt]));
> > +				return PTR_ERR(clk[sub_clk_cnt]);
> > +			}
> > +			sub_clk_cnt++;
> > +		}
> > +	}
> > +
> > +	return sub_clk_cnt;
> > +}
> > +
> >  static int init_basic_clks(struct platform_device *pdev, struct clk **clk,
> >  			const char * const *name)
> >  {
> > @@ -466,6 +521,7 @@ static struct scp *init_scp(struct platform_device *pdev,
> >  		struct scp_domain *scpd = &scp->domains[i];
> >  		struct generic_pm_domain *genpd = &scpd->genpd;
> >  		const struct scp_domain_data *data = &scp_domain_data[i];
> > +		int clk_cnt;
> 
> clk_cnt sounds to me like clock count, but the variable actually is only used to
> check the return value of init_subsys_clks. Please rename it to ret or something
> like this.
> 

OK, I'll fix it.

> >  
> >  		pd_data->domains[i] = genpd;
> >  		scpd->scp = scp;
> > @@ -476,6 +532,18 @@ static struct scp *init_scp(struct platform_device *pdev,
> >  		if (ret)
> >  			return ERR_PTR(ret);
> >  
> > +		if (data->subsys_clk_prefix) {
> > +			clk_cnt = init_subsys_clks(pdev,
> > +					data->subsys_clk_prefix,
> > +					scpd->subsys_clk);
> > +			if (clk_cnt < 0) {
> > +				dev_err(&pdev->dev,
> > +					"%s: subsys clk unavailable\n",
> > +					data->name);
> > +				return ERR_PTR(clk_cnt);
> > +			}
> > +		}
> > +
> >  		genpd->name = data->name;
> >  		genpd->power_off = scpsys_power_off;
> >  		genpd->power_on = scpsys_power_on;
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
