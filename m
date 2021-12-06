Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E9EC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Dec 2021 08:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HnhPYGM4Iomv9YEm0mFiJAGsRrUolRikXjaId8dhWJ4=; b=YTvGp4AeWFK7V3
	GP9SmWYNG49kBSNdD0R3aT+iJFeOkLiNCRPT4VFPlfKU2zoxc2Jo9khtdapdf19JO82qK+qLHomT7
	ybJ/p8M5UX4IE/+8DI19uYVlG5TEW0xSNoux2zdMawvQXjiFj17FP2I8Ct7AIBxlB8EayXPLw4hDi
	0jOmNolux8Bss7Dxx0egnvluz0LjamgrqW1Ttehdtdkfv2aVApUbvXC/5Le6b8bTzhY8KUtLLtBa5
	fT5lqmMzN1lPN6rLrXaYbgi8a5Hjc/k4MMAW7ZmWTH6CRg7KSPd4nsc6Hp01mVe1Nl80RO/Aszonh
	SMmwAn5/PLvlwgf4bxCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mu9AO-002sSn-Gz; Mon, 06 Dec 2021 08:16:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mu9AH-002sPh-Mi; Mon, 06 Dec 2021 08:16:07 +0000
X-UUID: a7f75b5b0d414f38a6579fe71b61a8c9-20211206
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Gwi9NQMi+aJlqofRC9/2Cdnnhql1ssg2h7PD3Qu6tws=; 
 b=Z08QStxoNbqTiW1WRshvSqF8wGbc7Gv6bihg6mJxnWv1F1KZbkNuOgvRuOcHG0WnUAJHvmesy3d4QAGLM7KenLjfassalmT3Jwgi8OqjEfvDTzhZHRmThBWFjoCTJyp7dG1pOr5iHICqFILsgnnEK1raH/8tUBLYSgD6clsjZpI=;
X-UUID: a7f75b5b0d414f38a6579fe71b61a8c9-20211206
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2122527805; Mon, 06 Dec 2021 01:15:58 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 6 Dec 2021 00:15:56 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 6 Dec 2021 16:15:54 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 6 Dec 2021 16:15:53 +0800
Message-ID: <303eaeb2d371c96def8e5f0284495b1762879905.camel@mediatek.com>
Subject: Re: [PATCH 3/4] memory: mtk-smi: Add sleep ctrl function
From: Yong Wu <yong.wu@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, "Tomasz
 Figa" <tfiga@chromium.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <iommu@lists.linux-foundation.org>, <youlin.pei@mediatek.com>,
 <anan.sun@mediatek.com>, <lc.kan@mediatek.com>, <yi.kuo@mediatek.com>,
 <anthony.huang@mediatek.com>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>
Date: Mon, 6 Dec 2021 16:15:53 +0800
In-Reply-To: <9631fe7c-b878-79b0-1680-80b0be089429@canonical.com>
References: <20211203064027.14993-1-yong.wu@mediatek.com>
 <20211203064027.14993-4-yong.wu@mediatek.com>
 <9631fe7c-b878-79b0-1680-80b0be089429@canonical.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_001603_197924_7A5365FD 
X-CRM114-Status: GOOD (  36.27  )
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

On Sat, 2021-12-04 at 12:48 +0100, Krzysztof Kozlowski wrote:
> On 03/12/2021 07:40, Yong Wu wrote:
> > sleep control means that when the larb go to sleep, we should wait
> > a bit
> 
> s/go/goes/
> 
> > until all the current commands are finished. thus, when the larb
> > runtime
> 
> Please start every sentence with a capital letter.
> 
> > suspend, we need enable this function to wait until all the existed
> 
> s/suspend/suspends/
> s/we need enable/we need to enable/
> 
> > command are finished. when the larb resume, just disable this
> > function.
> 
> s/command/commands/
> s/resume/resumes/
> 
> > This function only improve the safe of bus. Add a new flag for this
> 
> s/improve/improves/
> s/the safe/the safety/
> 
> > function. Prepare for mt8186.
> 
> In total it is hard to parse, really.

Will fix them in next version.

Thanks for reviewing so detailedly. Sorry. I didn't pay attention to
the grammar before.

> 
> > 
> > Signed-off-by: Anan Sun <anan.sun@mediatek.com>
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > ---
> >  drivers/memory/mtk-smi.c | 39 +++++++++++++++++++++++++++++++++++-
> > ---
> >  1 file changed, 35 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
> > index b883dcc0bbfa..4b59b28e4d73 100644
> > --- a/drivers/memory/mtk-smi.c
> > +++ b/drivers/memory/mtk-smi.c
> > @@ -8,6 +8,7 @@
> >  #include <linux/device.h>
> >  #include <linux/err.h>
> >  #include <linux/io.h>
> > +#include <linux/iopoll.h>
> >  #include <linux/module.h>
> >  #include <linux/of.h>
> >  #include <linux/of_platform.h>
> > @@ -32,6 +33,10 @@
> >  #define SMI_DUMMY			0x444
> >  
> >  /* SMI LARB */
> > +#define SMI_LARB_SLP_CON                0x00c
> > +#define SLP_PROT_EN                     BIT(0)
> > +#define SLP_PROT_RDY                    BIT(16)
> > +
> >  #define SMI_LARB_CMD_THRT_CON		0x24
> >  #define SMI_LARB_THRT_RD_NU_LMT_MSK	GENMASK(7, 4)
> >  #define SMI_LARB_THRT_RD_NU_LMT		(5 << 4)
> > @@ -81,6 +86,7 @@
> >  
> >  #define MTK_SMI_FLAG_THRT_UPDATE	BIT(0)
> >  #define MTK_SMI_FLAG_SW_FLAG		BIT(1)
> > +#define MTK_SMI_FLAG_SLEEP_CTL		BIT(2)
> >  #define MTK_SMI_CAPS(flags, _x)		(!!((flags) & (_x)))
> >  
> >  struct mtk_smi_reg_pair {
> > @@ -371,6 +377,24 @@ static const struct of_device_id
> > mtk_smi_larb_of_ids[] = {
> >  	{}
> >  };
> >  
> > +static int mtk_smi_larb_sleep_ctrl(struct device *dev, bool
> > to_sleep)
> > +{
> 
> Make two functions instead. There is no single code reuse (shared)
> between sleep and resume. In the same time bool arguments are
> confusing
> when looking at caller and one never knows whether true means to
> resume
> or to sleep. Having two functions is obvious. Obvious code is easier
> to
> read and maintain.

Make sense. Thanks for this suggestion.

> 
> > +	struct mtk_smi_larb *larb = dev_get_drvdata(dev);
> > +	int ret = 0;
> > +	u32 tmp;
> > +
> > +	if (to_sleep) {
> > +		writel_relaxed(SLP_PROT_EN, larb->base +
> > SMI_LARB_SLP_CON);
> > +		ret = readl_poll_timeout_atomic(larb->base +
> > SMI_LARB_SLP_CON,
> > +						tmp, !!(tmp &
> > SLP_PROT_RDY), 10, 1000);
> > +		if (ret)
> > +			dev_warn(dev, "sleep ctrl is not
> > ready(0x%x).\n", tmp);
> > +	} else {
> > +		writel_relaxed(0, larb->base + SMI_LARB_SLP_CON);
> > +	}
> > +	return ret;
> > +}
> > +
> >  static int mtk_smi_device_link_common(struct device *dev, struct
> > device **com_dev)
> >  {
> >  	struct platform_device *smi_com_pdev;
> > @@ -477,24 +501,31 @@ static int __maybe_unused
> > mtk_smi_larb_resume(struct device *dev)
> >  {
> >  	struct mtk_smi_larb *larb = dev_get_drvdata(dev);
> >  	const struct mtk_smi_larb_gen *larb_gen = larb->larb_gen;
> > -	int ret;
> > +	int ret = 0;
> 
> This line does not have a sense.

Yes. This is unhelpful. Will remove this.

> 
> >  
> >  	ret = clk_bulk_prepare_enable(larb->smi.clk_num, larb-
> > >smi.clks);
> > -	if (ret < 0)
> > +	if (ret)
> 
> Why changing this?

The successful return value should be 0. I will use a independent patch
for this.

> 
> Best regards,
> Krzysztof
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
