Return-Path: <SRS0=o4uA=FA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 328B8C56202
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2020 16:44:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1C7320B80
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2020 16:44:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="03N7A/pJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E1C7320B80
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=r3MUX/B2GBz2Z5u5ysQKB0lsdH0LsBxNn0uobr19a0Q=; b=03N7A/pJ2c2udRsFHPk+37ZlF
	fsD7LAk3xB9NPEbCxXcgKn2bDUS5RB/6LK6fCOfFJn39oV63y11OiXbETTW/6A+S6GoykNbm1NvFJ
	R0rDBR5LYNnIzJvpK8q3gdVynWnp19esVK04ygqrprGlOfY6aAYHXz8b+TA8pdE+8EnVGToFlCta5
	ifaFea7ba6J2X9QRxuPFTyFcFFUTx/X933sudNVX2+q5jfU4NG+PnaTBRbp2oA7pB38kV/nLCLaaB
	k4s2KEYOfWKJJmC2YK8XMJ+SS9v7c6k1YqbQgLi/pXU5PJgWlJRHj/+MWFW3fZOTRExux2fdFmyfQ
	DBJdJxQow==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiKNK-00025W-DK; Thu, 26 Nov 2020 16:44:06 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiKNG-00023p-48; Thu, 26 Nov 2020 16:44:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8C5F631B;
 Thu, 26 Nov 2020 08:43:59 -0800 (PST)
Received: from [10.57.59.159] (unknown [10.57.59.159])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 571FC3F23F;
 Thu, 26 Nov 2020 08:43:56 -0800 (PST)
Subject: Re: [PATCH v4 12/24] iommu/mediatek: Move hw_init into attach_device
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Will Deacon <will@kernel.org>
References: <20201111123838.15682-1-yong.wu@mediatek.com>
 <20201111123838.15682-13-yong.wu@mediatek.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <55bb14ef-f674-e55c-0803-43d91093eccb@arm.com>
Date: Thu, 26 Nov 2020 16:43:54 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201111123838.15682-13-yong.wu@mediatek.com>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201126_114402_322210_383CD737 
X-CRM114-Status: GOOD (  21.46  )
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
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 Tomasz Figa <tfiga@google.com>, Greg Kroah-Hartman <gregkh@google.com>,
 linux-kernel@vger.kernel.org, Evan Green <evgreen@chromium.org>,
 chao.hao@mediatek.com, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>,
 anan.sun@mediatek.com, kernel-team@android.com,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2020-11-11 12:38, Yong Wu wrote:
> In attach device, it will update the pagetable base address register.
> Move the hw_init function also here. Then it only need call
> pm_runtime_get/put one time here if m4u has power domain.

Doesn't that mean you'll end up writing most of the registers twice 
every time? (first from mtk_iommu_resume(), then again from 
mtk_iommu_hw_init())

It might be neater to have mtk_iommu_hw_init() simply populate the 
mtk_iommu_suspend_reg data with the initial values at probe time and 
manually call mtk_iommu_resume() if the hardware is already powered up 
at that point. Or maybe just don't bother saving those registers on 
suspend and put the initialisation directly in the resume path.

Robin.

> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>   drivers/iommu/mtk_iommu.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index 55f9b329e637..cfdf5ce696fd 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -125,6 +125,8 @@ struct mtk_iommu_domain {
>   
>   static const struct iommu_ops mtk_iommu_ops;
>   
> +static int mtk_iommu_hw_init(const struct mtk_iommu_data *data);
> +
>   /*
>    * In M4U 4GB mode, the physical address is remapped as below:
>    *
> @@ -380,12 +382,16 @@ static int mtk_iommu_attach_device(struct iommu_domain *domain,
>   {
>   	struct mtk_iommu_data *data = dev_iommu_priv_get(dev);
>   	struct mtk_iommu_domain *dom = to_mtk_domain(domain);
> +	int ret;
>   
>   	if (!data)
>   		return -ENODEV;
>   
>   	/* Update the pgtable base address register of the M4U HW */
>   	if (!data->m4u_dom) {
> +		ret = mtk_iommu_hw_init(data);
> +		if (ret)
> +			return ret;
>   		data->m4u_dom = dom;
>   		writel(dom->cfg.arm_v7s_cfg.ttbr & MMU_PT_ADDR_MASK,
>   		       data->base + REG_MMU_PT_BASE_ADDR);
> @@ -729,10 +735,6 @@ static int mtk_iommu_probe(struct platform_device *pdev)
>   
>   	platform_set_drvdata(pdev, data);
>   
> -	ret = mtk_iommu_hw_init(data);
> -	if (ret)
> -		return ret;
> -
>   	ret = iommu_device_sysfs_add(&data->iommu, dev, NULL,
>   				     "mtk-iommu.%pa", &ioaddr);
>   	if (ret)
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
