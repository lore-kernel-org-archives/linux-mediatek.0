Return-Path: <SRS0=rPqH=BG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4B07C433E4
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2020 09:03:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0BFE20759
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2020 09:03:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3D+jnTKu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ZgI9h+UK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0BFE20759
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=V5a51WIfVnwu5ZuPD2gzn9YzubSYDn/yfdBOsLKXrVg=; b=3D+jnTKuiXEn6Z4obH8sOsYKQ
	eMyB2anTZNQe8cYfee6Ebdf0VHVFnVIrQg+ACT7YTtxNz/6BSHwESV1KU/y7QQSUQ1uUJi0nOAgSm
	wF2zUipsc5pagvfmjXWkATawuhIdUfnSx6D46LlvrkeiXS46w3nSRzYB1HPmM3HpqZfjEt2XQpm6U
	UTpFQJYqiy4jPRWsuQz9mSqmTQ9Gef6+N7FC5du5Yoks9vv+pYYzuff9LUTWq47V3uADH562NbqXX
	8j1sc50Dg7QIkDGO4LydAFSK3uJS03N9FZ4J3DSbXAxlxYeAXrczcf9Ms4UrAi7B8+SAVmzM/2qHt
	YcXF/Ix9A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jzz2n-0004e2-Dg; Mon, 27 Jul 2020 09:03:37 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jzz2k-0004cK-64; Mon, 27 Jul 2020 09:03:35 +0000
X-UUID: 46c8434962d8492e93fdd115f16ff95c-20200727
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=q34zqKlfJT1egqrpS4Z0LW4UkZCQFjyQJ1hrO1Kt++w=; 
 b=ZgI9h+UKWglEk0XdcMk9Gvl0k/YZofx2sAXTKmU2qOT2tvgKLzUmDB5J9qC0/lkZOnQVUsUeBK2kF9AwBUjQkVW50LKkydkAWOd2BhnX4b2wyZtGen7zLJvZRb0E/AyCMsvlNyF9hFSuoQZjBguhDeXhciKHsXPi5VQCzMrHtf4=;
X-UUID: 46c8434962d8492e93fdd115f16ff95c-20200727
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <chao.hao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 259411113; Mon, 27 Jul 2020 00:52:12 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 27 Jul 2020 01:52:00 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 27 Jul 2020 16:51:59 +0800
Received: from [10.15.20.246] (10.15.20.246) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 27 Jul 2020 16:51:58 +0800
Message-ID: <1595839778.2350.4.camel@mbjsdccf07>
Subject: Re: [PATCH 11/21] iommu/mediatek: Add power-domain operation
From: chao hao <Chao.Hao@mediatek.com>
To: Yong Wu <yong.wu@mediatek.com>
Date: Mon, 27 Jul 2020 16:49:38 +0800
In-Reply-To: <20200711064846.16007-12-yong.wu@mediatek.com>
References: <20200711064846.16007-1-yong.wu@mediatek.com>
 <20200711064846.16007-12-yong.wu@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200727_050334_421582_C900DFF2 
X-CRM114-Status: GOOD (  29.17  )
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
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org, Nicolas
 Boichat <drinkcat@chromium.org>, cui.zhang@mediatek.com,
 srv_heupstream@mediatek.com, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, Tomasz Figa <tfiga@google.com>,
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 chao hao <"Chao. Hao"@mediatek.com>, ming-fan.chen@mediatek.com,
 anan.sun@mediatek.com, Will
 Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, 2020-07-11 at 14:48 +0800, Yong Wu wrote:
> In the previous SoC, the M4U HW is in the EMI power domain which is
> always on. the latest M4U is in the display power domain which may be
> turned on/off, thus we have to add pm_runtime interface for it.
> 
> we should enable its power before M4U hw initial. and disable it after HW
> initialize.
> 
> When the engine work, the engine always enable the power and clocks for
> smi-larb/smi-common, then the M4U's power will always be powered on
> automatically via the device link with smi-common.
> 
> Note: we don't enable the M4U power in iommu_map/unmap for tlb flush.
> If its power already is on, of course it is ok. if the power is off,
> the main tlb will be reset while M4U power on, thus the tlb flush while
> m4u power off is unnecessary, just skip it.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  drivers/iommu/mtk_iommu.c | 54 ++++++++++++++++++++++++++++++++++-----
>  1 file changed, 47 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index 931fdd19c8f3..03a6d66f4bef 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -20,6 +20,7 @@
>  #include <linux/of_irq.h>
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/slab.h>
>  #include <linux/spinlock.h>
>  #include <asm/barrier.h>
> @@ -172,6 +173,19 @@ static struct mtk_iommu_domain *to_mtk_domain(struct iommu_domain *dom)
>  	return container_of(dom, struct mtk_iommu_domain, domain);
>  }
>  
> +static int mtk_iommu_rpm_get(struct device *dev)
> +{
> +	if (pm_runtime_enabled(dev))
> +		return pm_runtime_get_sync(dev);
> +	return 0;
> +}
> +
> +static void mtk_iommu_rpm_put(struct device *dev)
> +{
> +	if (pm_runtime_enabled(dev))
> +		pm_runtime_put_autosuspend(dev);
> +}
> +
>  static void mtk_iommu_tlb_flush_all(void *cookie)
>  {
>  	struct mtk_iommu_data *data = cookie;
> @@ -193,6 +207,11 @@ static void mtk_iommu_tlb_flush_range_sync(unsigned long iova, size_t size,
>  	u32 tmp;
>  
>  	for_each_m4u(data) {
> +		/* skip tlb flush when pm is not active */
> +		if (pm_runtime_enabled(data->dev) &&
> +		    !pm_runtime_active(data->dev))
> +			continue;
> +
>  		spin_lock_irqsave(&data->tlb_lock, flags);
>  		writel_relaxed(F_INVLD_EN1 | F_INVLD_EN0,
>  			       data->base + data->plat_data->inv_sel_reg);
> @@ -377,15 +396,20 @@ static int mtk_iommu_attach_device(struct iommu_domain *domain,
>  {
>  	struct mtk_iommu_data *data = dev_iommu_priv_get(dev);
>  	struct mtk_iommu_domain *dom = to_mtk_domain(domain);
> +	int ret;
>  
>  	if (!data)
>  		return -ENODEV;
>  
>  	/* Update the pgtable base address register of the M4U HW */
>  	if (!data->m4u_dom) {
> +		ret = mtk_iommu_rpm_get(dev);
> +		if (ret < 0)
> +			return ret;
>  		data->m4u_dom = dom;
>  		writel(dom->cfg.arm_v7s_cfg.ttbr & MMU_PT_ADDR_MASK,
>  		       data->base + REG_MMU_PT_BASE_ADDR);
> +		mtk_iommu_rpm_put(dev);
>  	}
>  
>  	mtk_iommu_config(data, dev, true);
> @@ -543,10 +567,14 @@ static int mtk_iommu_hw_init(const struct mtk_iommu_data *data)
>  	u32 regval;
>  	int ret;
>  
> -	ret = clk_prepare_enable(data->bclk);
> -	if (ret) {
> -		dev_err(data->dev, "Failed to enable iommu bclk(%d)\n", ret);
> -		return ret;
> +	/* bclk will be enabled in pm callback in power-domain case. */
> +	if (!pm_runtime_enabled(data->dev)) {
> +		ret = clk_prepare_enable(data->bclk);
> +		if (ret) {
> +			dev_err(data->dev, "Failed to enable iommu bclk(%d)\n",
> +				ret);
> +			return ret;
> +		}
>  	}
>  
>  	if (data->plat_data->m4u_plat == M4U_MT8173) {
> @@ -728,7 +756,15 @@ static int mtk_iommu_probe(struct platform_device *pdev)
>  
>  	platform_set_drvdata(pdev, data);
>  
> +	if (dev->pm_domain)
> +		pm_runtime_enable(dev);

hi yong,

If you put "pm_runtime_enable" here, it maybe not device_link with
smi_common for previous patch: 
if(i || !pm_runtime_enabled(dev))
    continue;

Whether put it up front?

best regards,
chao

> +
> +	ret = mtk_iommu_rpm_get(dev);
> +	if (ret < 0)
> +		return ret;
> +
>  	ret = mtk_iommu_hw_init(data);
> +	mtk_iommu_rpm_put(dev);
>  	if (ret)
>  		return ret;
>  
> @@ -801,6 +837,10 @@ static int __maybe_unused mtk_iommu_resume(struct device *dev)
>  		dev_err(data->dev, "Failed to enable clk(%d) in resume\n", ret);
>  		return ret;
>  	}
> +
> +	/* Avoid first resume to affect the default value of registers below. */
> +	if (!m4u_dom)
> +		return 0;
>  	writel_relaxed(reg->wr_len_ctrl, base + REG_MMU_WR_LEN_CTRL);
>  	writel_relaxed(reg->misc_ctrl, base + REG_MMU_MISC_CTRL);
>  	writel_relaxed(reg->dcm_dis, base + REG_MMU_DCM_DIS);
> @@ -809,13 +849,13 @@ static int __maybe_unused mtk_iommu_resume(struct device *dev)
>  	writel_relaxed(reg->int_main_control, base + REG_MMU_INT_MAIN_CONTROL);
>  	writel_relaxed(reg->ivrp_paddr, base + REG_MMU_IVRP_PADDR);
>  	writel_relaxed(reg->vld_pa_rng, base + REG_MMU_VLD_PA_RNG);
> -	if (m4u_dom)
> -		writel(m4u_dom->cfg.arm_v7s_cfg.ttbr & MMU_PT_ADDR_MASK,
> -		       base + REG_MMU_PT_BASE_ADDR);
> +	writel(m4u_dom->cfg.arm_v7s_cfg.ttbr & MMU_PT_ADDR_MASK,
> +	       base + REG_MMU_PT_BASE_ADDR);
>  	return 0;
>  }
>  
>  static const struct dev_pm_ops mtk_iommu_pm_ops = {
> +	SET_RUNTIME_PM_OPS(mtk_iommu_suspend, mtk_iommu_resume, NULL)
>  	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(mtk_iommu_suspend, mtk_iommu_resume)
>  };
>  

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
