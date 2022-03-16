Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6608C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Mar 2022 02:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sckMZCA3jaqsdgvROOjF1qeHYIOg5gXpjMXemOrn0Z8=; b=IvQprrLv5JSbk4
	naumQdGdRo755Ti6R1+XVC3Sz/U7yQyRml22rAdUEHJk7ig5j9Fx8lA+WW/7HPgqb5cdKRSEM3dON
	LBdZF79Djy+U1AtBtJoUWTBY7iHCHs4rLTulBBxoZKK7YNjIABw355A5N5Hr8bcC9Vrv/O/N/BTSS
	ujQ97f6ipwvnBXNurqOIMGJUsvCaUoUITuX6PPzo/PpLeZG7zgQO4G4ka89ebEWpvsOLQAF6PZZ55
	5XFNO9X/PZgVo1yg+GbbV4+vjBgTHPjBSv7DB5AJa+MjrreLX/Uml3XruitV4njaUWnCcxTksjSaa
	1XEuQklaeOjFWZ18pAEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUJ4F-00B9ay-IG; Wed, 16 Mar 2022 02:07:15 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUJ43-00B9Y5-BK; Wed, 16 Mar 2022 02:07:05 +0000
X-UUID: cc8bee268d934d08a6a064d97604dceb-20220315
X-UUID: cc8bee268d934d08a6a064d97604dceb-20220315
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 409967302; Tue, 15 Mar 2022 19:06:38 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Mar 2022 19:06:36 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 16 Mar 2022 10:06:29 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 16 Mar 2022 10:06:29 +0800
Message-ID: <bcaf699311146a108ded176ef20874fa20e56165.camel@mediatek.com>
Subject: Re: [PATCH v6 2/2] remoteproc: mediatek: Support mt8186 scp
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
 <angelogioacchino.delregno@collabora.com>
CC: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Tinghan Shen <tinghan.shen@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-remoteproc@vger.kernel.org>
Date: Wed, 16 Mar 2022 10:06:29 +0800
In-Reply-To: <20220315151349.GA2479752@p14s>
References: <20220315124747.30144-1-allen-kh.cheng@mediatek.com>
 <20220315124747.30144-3-allen-kh.cheng@mediatek.com>
 <20220315151349.GA2479752@p14s>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_190703_437261_15AC6104 
X-CRM114-Status: GOOD (  28.95  )
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

On Tue, 2022-03-15 at 09:13 -0600, Mathieu Poirier wrote:
> On Tue, Mar 15, 2022 at 08:47:47PM +0800, Allen-KH Cheng wrote:
> > From: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
> > 
> > Add SCP support for mt8186
> 
> V5 of this patchset is already in rproc-next and as such this one
> does not
> apply.
> 
> > 
> > Signed-off-by: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
> > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> 
> As far as I can see from the mailing list interactions, Angelo did
> not review
> the new section about cache initialisation and yet his RoB is
> present.  And to
> make matters worse he was not on the recipient list, which I have
> corrected.
> 
> Thanks,
> Mathieu
> 
Hi Mathieu,

Thanks for your friendly reminder.

I'll pay more attention to that next time.

Thanks,
Allen

> > ---
> >  drivers/remoteproc/mtk_common.h |  3 +++
> >  drivers/remoteproc/mtk_scp.c    | 42
> > +++++++++++++++++++++++++++++++++
> >  2 files changed, 45 insertions(+)
> > 
> > diff --git a/drivers/remoteproc/mtk_common.h
> > b/drivers/remoteproc/mtk_common.h
> > index 5ff3867c72f3..71ce4977cb0b 100644
> > --- a/drivers/remoteproc/mtk_common.h
> > +++ b/drivers/remoteproc/mtk_common.h
> > @@ -32,6 +32,9 @@
> >  #define MT8183_SCP_CACHESIZE_8KB	BIT(8)
> >  #define MT8183_SCP_CACHE_CON_WAYEN	BIT(10)
> >  
> > +#define MT8186_SCP_L1_SRAM_PD_P1	0x40B0
> > +#define MT8186_SCP_L1_SRAM_PD_p2	0x40B4
> > +
> >  #define MT8192_L2TCM_SRAM_PD_0		0x10C0
> >  #define MT8192_L2TCM_SRAM_PD_1		0x10C4
> >  #define MT8192_L2TCM_SRAM_PD_2		0x10C8
> > diff --git a/drivers/remoteproc/mtk_scp.c
> > b/drivers/remoteproc/mtk_scp.c
> > index dcddb33e9997..11be6b4235eb 100644
> > --- a/drivers/remoteproc/mtk_scp.c
> > +++ b/drivers/remoteproc/mtk_scp.c
> > @@ -383,6 +383,35 @@ static void mt8192_power_off_sram(void __iomem
> > *addr)
> >  		writel(GENMASK(i, 0), addr);
> >  }
> >  
> > +static int mt8186_scp_before_load(struct mtk_scp *scp)
> > +{
> > +	/* Clear SCP to host interrupt */
> > +	writel(MT8183_SCP_IPC_INT_BIT, scp->reg_base +
> > MT8183_SCP_TO_HOST);
> > +
> > +	/* Reset clocks before loading FW */
> > +	writel(0x0, scp->reg_base + MT8183_SCP_CLK_SW_SEL);
> > +	writel(0x0, scp->reg_base + MT8183_SCP_CLK_DIV_SEL);
> > +
> > +	/* Turn on the power of SCP's SRAM before using it. Enable 1
> > block per time*/
> > +	mt8192_power_on_sram(scp->reg_base + MT8183_SCP_SRAM_PDN);
> > +
> > +	/* Initialize TCM before loading FW. */
> > +	writel(0x0, scp->reg_base + MT8183_SCP_L1_SRAM_PD);
> > +	writel(0x0, scp->reg_base + MT8183_SCP_TCM_TAIL_SRAM_PD);
> > +	writel(0x0, scp->reg_base + MT8186_SCP_L1_SRAM_PD_P1);
> > +	writel(0x0, scp->reg_base + MT8186_SCP_L1_SRAM_PD_p2);
> > +
> > +	/*
> > +	 * Set I-cache and D-cache size before loading SCP FW.
> > +	 * SCP SRAM logical address may change when cache size setting
> > differs.
> > +	 */
> > +	writel(MT8183_SCP_CACHE_CON_WAYEN | MT8183_SCP_CACHESIZE_8KB,
> > +	       scp->reg_base + MT8183_SCP_CACHE_CON);
> > +	writel(MT8183_SCP_CACHESIZE_8KB, scp->reg_base +
> > MT8183_SCP_DCACHE_CON);
> > +
> > +	return 0;
> > +}
> > +
> >  static int mt8192_scp_before_load(struct mtk_scp *scp)
> >  {
> >  	/* clear SPM interrupt, SCP2SPM_IPC_CLR */
> > @@ -874,6 +903,18 @@ static const struct mtk_scp_of_data
> > mt8183_of_data = {
> >  	.ipi_buf_offset = 0x7bdb0,
> >  };
> >  
> > +static const struct mtk_scp_of_data mt8186_of_data = {
> > +	.scp_clk_get = mt8195_scp_clk_get,
> > +	.scp_before_load = mt8186_scp_before_load,
> > +	.scp_irq_handler = mt8183_scp_irq_handler,
> > +	.scp_reset_assert = mt8183_scp_reset_assert,
> > +	.scp_reset_deassert = mt8183_scp_reset_deassert,
> > +	.scp_stop = mt8183_scp_stop,
> > +	.scp_da_to_va = mt8183_scp_da_to_va,
> > +	.host_to_scp_reg = MT8183_HOST_TO_SCP,
> > +	.host_to_scp_int_bit = MT8183_HOST_IPC_INT_BIT,
> > +};
> > +
> >  static const struct mtk_scp_of_data mt8192_of_data = {
> >  	.scp_clk_get = mt8192_scp_clk_get,
> >  	.scp_before_load = mt8192_scp_before_load,
> > @@ -900,6 +941,7 @@ static const struct mtk_scp_of_data
> > mt8195_of_data = {
> >  
> >  static const struct of_device_id mtk_scp_of_match[] = {
> >  	{ .compatible = "mediatek,mt8183-scp", .data = &mt8183_of_data
> > },
> > +	{ .compatible = "mediatek,mt8186-scp", .data = &mt8186_of_data
> > },
> >  	{ .compatible = "mediatek,mt8192-scp", .data = &mt8192_of_data
> > },
> >  	{ .compatible = "mediatek,mt8195-scp", .data = &mt8195_of_data
> > },
> >  	{},
> > -- 
> > 2.18.0
> > 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
