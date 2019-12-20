Return-Path: <SRS0=AkNb=2K=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3739C2D0C1
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Dec 2019 03:31:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68C3724680
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Dec 2019 03:31:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZVq0jTCr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="px0bseuQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68C3724680
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=At2RwULQ3GcfcWw1SMtg1rIIOW1+Be/0Sw/HlDoe5Dc=; b=ZVq0jTCrBknzNn
	J4iscCyDHYMl1r21ZfAi0RTMiivXFg4U2WqBeX+4syE6T18laXn5jog1zgirM3h6NVgH0EIQirpbw
	a3sX7MW7LOZfpo6UkRAGlq3A92E9Qbg2dujXM0ZhiNaK6JQo+fB+2c4fsN94wjqNZxTA1VEV6gD7O
	yxoY9mgYLHTsl5/UmuRrFoIBxfYJkOmQJOHEukZHw3rzMm3QZBu9WfbcKuWPFRf8WXhbhN8Ic3hB/
	0TpJ3UNymay16rPjT9EtHLUEHNxOl8EUnuqsemvjw2S4Cxr+TqaZqFoZ4IuVaDZrUvWIIb/2Zc8w1
	TOXIbrDYn8Eg7pZBmPLQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ii90M-0006AI-WF; Fri, 20 Dec 2019 03:31:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ii90J-00068h-T0; Fri, 20 Dec 2019 03:31:05 +0000
X-UUID: af8fdbd600514859863a03a26ff7f2bd-20191219
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=ZTNoH+cktFna9TQBKbYJjzfy16IKAqSff1i5BENu8YA=; 
 b=px0bseuQkM+n2K7EXRSs9ShsEmetHiSnGPebM/JOCKwakL7JarwaFgkM34xoXnmrx6yqCbwKtbOJ6P/tMt5e9dZ4FoVUq2k0G1lkGBVs/xEvNYbSOvYNx0k4J/ZZ35XL4IQi7YFXu4urXvVcB305vo6IgdoWujTsTG8vaqLP+oM=;
X-UUID: af8fdbd600514859863a03a26ff7f2bd-20191219
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1509919885; Thu, 19 Dec 2019 19:31:00 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 19 Dec 2019 19:31:23 -0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 20 Dec 2019 11:30:23 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 20 Dec 2019 11:31:03 +0800
Message-ID: <1576812656.8410.9.camel@mtksdaap41>
Subject: Re: [PATCH v10 06/12] soc: mediatek: Use bp_table for all compatibles
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Nicolas Boichat <drinkcat@chromium.org>
Date: Fri, 20 Dec 2019 11:30:56 +0800
In-Reply-To: <CANMq1KCbmwY_nZTfZcbxYQm27CXdADD48RWQOx0JuTmGBn=y=g@mail.gmail.com>
References: <1576657848-14711-1-git-send-email-weiyi.lu@mediatek.com>
 <1576657848-14711-7-git-send-email-weiyi.lu@mediatek.com>
 <CANMq1KCbmwY_nZTfZcbxYQm27CXdADD48RWQOx0JuTmGBn=y=g@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 95FF981DA9AF05C907E5ED72562D82C4AF1DF851F9A50997CA40046854A7CDD72000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191219_193103_941275_0C0FDF46 
X-CRM114-Status: GOOD (  17.09  )
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
Cc: Rob Herring <robh@kernel.org>, srv_heupstream <srv_heupstream@mediatek.com>,
 James Liao <jamesjj.liao@mediatek.com>, lkml <linux-kernel@vger.kernel.org>,
 Fan Chen <fan.chen@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Sascha Hauer <kernel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2019-12-19 at 11:54 +0800, Nicolas Boichat wrote:
> On Wed, Dec 18, 2019 at 4:31 PM Weiyi Lu <weiyi.lu@mediatek.com> wrote:
> >
> > Only use bp_table for bus protection of all compatibles,
> > instead of mixing bus_prot_mask and bus_prot_reg_update.
> 
> ditto, I'd just squash in the previous patch.
> 

OK, I'll update in next version.

> > Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> > ---
> >  drivers/soc/mediatek/mtk-scpsys.c | 94 ++++++++++++++++++++-------------------
> >  1 file changed, 48 insertions(+), 46 deletions(-)
> >
> > diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
> > index 5699d9f..c438c53 100644
> > --- a/drivers/soc/mediatek/mtk-scpsys.c
> > +++ b/drivers/soc/mediatek/mtk-scpsys.c
> > @@ -11,7 +11,6 @@
> >  #include <linux/platform_device.h>
> >  #include <linux/pm_domain.h>
> >  #include <linux/regulator/consumer.h>
> > -#include <linux/soc/mediatek/infracfg.h>
> >  #include <linux/soc/mediatek/scpsys-ext.h>
> >
> >  #include <dt-bindings/power/mt2701-power.h>
> > @@ -88,7 +87,6 @@
> >   * @ctl_offs: The offset for main power control register.
> >   * @sram_pdn_bits: The mask for sram power control bits.
> >   * @sram_pdn_ack_bits: The mask for sram power control acked bits.
> > - * @bus_prot_mask: The mask for single step bus protection.
> >   * @basic_clk_name: The basic clocks required by this power domain.
> >   * @caps: The flag for active wake-up action.
> >   * @bp_table: The mask table for multiple step bus protection.
> > @@ -99,7 +97,6 @@ struct scp_domain_data {
> >         int ctl_offs;
> >         u32 sram_pdn_bits;
> >         u32 sram_pdn_ack_bits;
> > -       u32 bus_prot_mask;
> >         const char *basic_clk_name[MAX_CLKS];
> >         u8 caps;
> >         struct bus_prot bp_table[MAX_STEPS];
> > @@ -128,7 +125,6 @@ struct scp {
> >         struct regmap *infracfg;
> >         struct regmap *smi_common;
> >         struct scp_ctrl_reg ctrl_reg;
> > -       bool bus_prot_reg_update;
> >  };
> >
> >  struct scp_subdomain {
> > @@ -142,7 +138,6 @@ struct scp_soc_data {
> >         const struct scp_subdomain *subdomains;
> >         int num_subdomains;
> >         const struct scp_ctrl_reg regs;
> > -       bool bus_prot_reg_update;
> >  };
> >
> >  static int scpsys_domain_is_on(struct scp_domain *scpd)
> > @@ -256,12 +251,6 @@ static int scpsys_bus_protect_enable(struct scp_domain *scpd)
> >  {
> >         struct scp *scp = scpd->scp;
> >
> > -       if (scpd->data->bus_prot_mask) {
> > -               return mtk_infracfg_set_bus_protection(scp->infracfg,
> > -                               scpd->data->bus_prot_mask,
> > -                               scp->bus_prot_reg_update);
> > -       }
> > -
> >         return mtk_scpsys_ext_set_bus_protection(scpd->data->bp_table,
> >                         scp->infracfg, scp->smi_common);
> >  }
> > @@ -270,12 +259,6 @@ static int scpsys_bus_protect_disable(struct scp_domain *scpd)
> >  {
> >         struct scp *scp = scpd->scp;
> >
> > -       if (scpd->data->bus_prot_mask) {
> > -               return mtk_infracfg_clear_bus_protection(scp->infracfg,
> > -                               scpd->data->bus_prot_mask,
> > -                               scp->bus_prot_reg_update);
> > -       }
> > -
> >         return mtk_scpsys_ext_clear_bus_protection(scpd->data->bp_table,
> >                         scp->infracfg, scp->smi_common);
> >  }
> > @@ -412,8 +395,7 @@ static int init_basic_clks(struct platform_device *pdev, struct clk **clk,
> >
> >  static struct scp *init_scp(struct platform_device *pdev,
> >                         const struct scp_domain_data *scp_domain_data, int num,
> > -                       const struct scp_ctrl_reg *scp_ctrl_reg,
> > -                       bool bus_prot_reg_update)
> > +                       const struct scp_ctrl_reg *scp_ctrl_reg)
> >  {
> >         struct genpd_onecell_data *pd_data;
> >         struct resource *res;
> > @@ -427,8 +409,6 @@ static struct scp *init_scp(struct platform_device *pdev,
> >         scp->ctrl_reg.pwr_sta_offs = scp_ctrl_reg->pwr_sta_offs;
> >         scp->ctrl_reg.pwr_sta2nd_offs = scp_ctrl_reg->pwr_sta2nd_offs;
> >
> > -       scp->bus_prot_reg_update = bus_prot_reg_update;
> > -
> >         scp->dev = &pdev->dev;
> >
> >         res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > @@ -549,8 +529,10 @@ static void mtk_register_power_domains(struct platform_device *pdev,
> >                 .name = "conn",
> >                 .sta_mask = PWR_STATUS_CONN,
> >                 .ctl_offs = SPM_CONN_PWR_CON,
> > -               .bus_prot_mask = MT2701_TOP_AXI_PROT_EN_CONN_M |
> > -                                MT2701_TOP_AXI_PROT_EN_CONN_S,
> > +               .bp_table = {
> > +                       BUS_PROT(IFR_TYPE, 0, 0, 0x220, 0x228,
> > +                               BIT(2) | BIT(8), BIT(2) | BIT(8)),
> > +               },
> 
> I'm a bit sad we lose the information about the BIT meaning.
> 

I'll keep those information in next version.

> Of course this looks ugly and verbose:
>                       BUS_PROT(IFR_TYPE, 0, 0, 0x220, 0x228,
>                                MT2701_TOP_AXI_PROT_EN_CONN_M |
> MT2701_TOP_AXI_PROT_EN_CONN_S,
>                                MT2701_TOP_AXI_PROT_EN_CONN_M |
> MT2701_TOP_AXI_PROT_EN_CONN_S),
> 
> But if you make "check_clr_mask" a boolean, you wouldn't have to
> repeat the mask twice and you could keep the nice register bit
> definitions.
> 

Thanks for the suggestion, I'll add "ignore_clr_ack" for it in next
version.

> [snip, many similar occurences below]

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
