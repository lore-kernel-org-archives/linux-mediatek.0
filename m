Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 771CEC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Apr 2022 05:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PpGNQUDFiKh3RnJxn/sr0Sg4zdWGRbhpuX9B1nQw2xo=; b=mioVlkwsfptBNB
	1LNyjCdtken8YTm3Zt4weV5IOK2IM5Szp8foauMcpJNH8oMONCFocUJ+3/a/L6CyvjQo2wUGj4bWp
	O60MCxSOQ01Cr+LrXcTeqEBo/2USM9uigJvuiOcBWOsWstGR1PkO151Vtrwg9o4irI4kKkNSuwoCa
	/mv6KsRac59UD1hJlPsX+G6dgYRO2c5JNyrdLb0Nf5JODzogfU7TI4JktG9AIZ5+PkL4rVQ1GvKDu
	hFyPL1aT9F07276a6ZUQ0y5xD/1GG1ggZPUhOSeC3vAZ4nUxciL8weojeYVulWrCbFTxK2ZuFsSjg
	OaQsbcz02fjOBcFHWdJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njwRM-004hSR-Ad; Thu, 28 Apr 2022 05:11:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njwRJ-004hQu-40; Thu, 28 Apr 2022 05:11:42 +0000
X-UUID: 85dfa06bea2f4753bdc8687131a1c355-20220427
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:ec6381c7-3049-44a1-81be-0b3f0ff2072b, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:abaec5c6-85ee-4ac1-ac05-bd3f1e72e732,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 85dfa06bea2f4753bdc8687131a1c355-20220427
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1703030428; Wed, 27 Apr 2022 22:11:32 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 27 Apr 2022 22:08:40 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 Apr 2022 13:08:37 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 28 Apr 2022 13:08:37 +0800
Message-ID: <de775aae07da3ff855d5bf95da996977efadda23.camel@mediatek.com>
Subject: Re: [PATCH V4 07/15] clk: mediatek: reset: Support nonsequence base
 offsets of reset registers
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <mturquette@baylibre.com>, <sboyd@kernel.org>, <matthias.bgg@gmail.com>,
 <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>
CC: <p.zabel@pengutronix.de>, <chun-jie.chen@mediatek.com>,
 <wenst@chromium.org>, <runyang.chen@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Thu, 28 Apr 2022 13:08:37 +0800
In-Reply-To: <c643d877-bc0a-a92c-d366-bd27bf580739@collabora.com>
References: <20220427030950.23395-1-rex-bc.chen@mediatek.com>
 <20220427030950.23395-8-rex-bc.chen@mediatek.com>
 <c643d877-bc0a-a92c-d366-bd27bf580739@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220427_221141_193497_DCBC3B0A 
X-CRM114-Status: GOOD (  26.64  )
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

On Wed, 2022-04-27 at 15:38 +0200, AngeloGioacchino Del Regno wrote:
> Il 27/04/22 05:09, Rex-BC Chen ha scritto:
> > The bank offsets are not serial for all reset registers.
> > For example, there are five infra reset banks for MT8192: 0x120,
> > 0x130,
> > 0x140, 0x150 and 0x730.
> > 
> > To support this,
> > - Change reg_ofs to rst_bank_ofs which is a pointer to base offsets
> > of
> >    the reset register.
> > - Add a new define RST_NR_PER_BANK to define reset number for each
> >    reset bank.
> > 
> > Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> > ---
> >   drivers/clk/mediatek/clk-mt2701-eth.c |  6 ++++--
> >   drivers/clk/mediatek/clk-mt2701-g3d.c |  6 ++++--
> >   drivers/clk/mediatek/clk-mt2701-hif.c |  6 ++++--
> >   drivers/clk/mediatek/clk-mt2701.c     | 11 +++++++----
> >   drivers/clk/mediatek/clk-mt2712.c     | 15 +++++++++------
> >   drivers/clk/mediatek/clk-mt7622-eth.c |  6 ++++--
> >   drivers/clk/mediatek/clk-mt7622-hif.c |  6 ++++--
> >   drivers/clk/mediatek/clk-mt7622.c     | 11 +++++++----
> >   drivers/clk/mediatek/clk-mt7629-eth.c |  6 ++++--
> >   drivers/clk/mediatek/clk-mt7629-hif.c |  6 ++++--
> >   drivers/clk/mediatek/clk-mt8135.c     | 11 +++++++----
> >   drivers/clk/mediatek/clk-mt8173.c     | 11 +++++++----
> >   drivers/clk/mediatek/clk-mt8183.c     | 14 ++++++++++++--
> >   drivers/clk/mediatek/reset.c          | 11 ++++++-----
> >   drivers/clk/mediatek/reset.h          |  6 ++++--
> >   15 files changed, 87 insertions(+), 45 deletions(-)
> > 
> 
> ..snip..
> 
> > diff --git a/drivers/clk/mediatek/clk-mt2701.c
> > b/drivers/clk/mediatek/clk-mt2701.c
> > index 70a934faa529..ebb1b9975ab0 100644
> > --- a/drivers/clk/mediatek/clk-mt2701.c
> > +++ b/drivers/clk/mediatek/clk-mt2701.c
> > @@ -735,18 +735,21 @@ static const struct mtk_fixed_factor
> > infra_fixed_divs[] = {
> >   	FACTOR(CLK_INFRA_CLK_13M, "clk13m", "clk26m", 1, 2),
> >   };
> >   
> > +static u16 infrasys_rst_ofs[] = { 0x30, 0x34, };
> > +static u16 perfcfg_rst_ofs[] = { 0x0, 0x4, };
> 
> Typo: perfcfg -> pericfg ... here and in some more files :))
> 

Hello Angelo,

Thanks for your review!

I will fix them.

> > +
> >   static const struct mtk_clk_rst_desc clk_rst_desc[] = {
> >   	/* infrasys */
> >   	{
> >   		.version = MTK_RST_SIMPLE,
> > -		.rst_bank_nr = 2,
> > -		.reg_ofs = 0x30,
> > +		.rst_bank_ofs = infrasys_rst_ofs,
> > +		.rst_bank_nr = ARRAY_SIZE(infrasys_rst_ofs),
> >   	},
> >   	/* pericfg */
> >   	{
> >   		.version = MTK_RST_SIMPLE,
> > -		.rst_bank_nr = 2,
> > -		.reg_ofs = 0x0,
> > +		.rst_bank_ofs = perfcfg_rst_ofs,
> > +		.rst_bank_nr = ARRAY_SIZE(perfcfg_rst_ofs),
> >   	},
> >   };
> >   
> > diff --git a/drivers/clk/mediatek/clk-mt2712.c
> > b/drivers/clk/mediatek/clk-mt2712.c
> > index cef7c79788ec..2a9d70dd97d6 100644
> > --- a/drivers/clk/mediatek/clk-mt2712.c
> > +++ b/drivers/clk/mediatek/clk-mt2712.c
> > @@ -1258,18 +1258,21 @@ static const struct mtk_pll_data plls[] = {
> >   		0, 31, 0x0300, 4, 0, 0, 0, 0x0304, 0),
> >   };
> >   
> > +static u16 infrasys_rst_ofs[] = { 0x30, 0x34, };
> > +static u16 perfcfg_rst_ofs[] = { 0x0, 0x4, };
> > +
> >   static const struct mtk_clk_rst_desc clk_rst_desc[] = {
> > -	/* infra */
> > +	/* infrasys */
> 
> Instead of renaming these here, if you really want this renamed, can
> you please
> do that in patch [06/15]?
> 

I will remove them.

> >   	{
> >   		.version = MTK_RST_SIMPLE,
> > -		.rst_bank_nr = 2,
> > -		.reg_ofs = 0x30,
> > +		.rst_bank_ofs = infrasys_rst_ofs,
> > +		.rst_bank_nr = ARRAY_SIZE(infrasys_rst_ofs),
> >   	},
> 
> ..snip..
> 
> > diff --git a/drivers/clk/mediatek/reset.h
> > b/drivers/clk/mediatek/reset.h
> > index 91358e8cb851..83840ecf8b27 100644
> > --- a/drivers/clk/mediatek/reset.h
> > +++ b/drivers/clk/mediatek/reset.h
> > @@ -9,6 +9,8 @@
> >   #include <linux/reset-controller.h>
> >   #include <linux/types.h>
> >   
> > +#define RST_NR_PER_BANK 32
> > +
> >   /**
> >    * enum mtk_reset_version - Version of MediaTek clock reset
> > controller.
> >    * @MTK_RST_SIMPLE: Use the same registers for bit set and clear.
> > @@ -24,12 +26,12 @@ enum mtk_reset_version {
> >   /**
> >    * struct mtk_clk_rst_desc - Description of MediaTek clock reset.
> >    * @version: Reset version which is defined in enum
> > mtk_reset_version.
> > - * @reg_ofs: Base offset of the reset register.
> > + * @rst_bank_ofs: Pointer to base offsets of the reset register.
> 
> Instead of generically saying that this is a pointer, it would be
> more
> appropriate to say that this is a pointer to an array containing base
> offsets (etc).
> 

ok, I will modify it.

BRs,
Rex

> Thanks,
> Angelo
> 
> >    * @rst_bank_nr: Quantity of reset bank.
> >    */
> >   struct mtk_clk_rst_desc {
> >   	u8 version;
> > -	u16 reg_ofs;
> > +	u16 *rst_bank_ofs;
> >   	u32 rst_bank_nr;
> >   };
> >   


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
