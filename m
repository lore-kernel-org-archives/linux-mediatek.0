Return-Path: <SRS0=o4uA=FA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 302D6C56202
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2020 17:12:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A605B21D1A
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2020 17:12:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Vu7jC2Ff"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A605B21D1A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UVQ2DP8TmPbW1Az4FWmg+Bbikm+v7EwMOQhcTVUt5GQ=; b=Vu7jC2Ff8hU3AD0C6C798/21m
	FSXjNqo/SEWaXBcthCMxjLmH/clzloL2DDaDQVyu/Nm6MhgOMjUHxk4O/RapuktEm/UUosngX6csa
	Wf1sPY9ybTtaCShtB/8mOpIOoDut1tY9S8SL+4oqRfqDpM6DQTLx8EAY4/l+EYmLNl4iWJESse6iE
	H1XcMI2v0rPak0WZFXN7/EBdP/nmVjulr4KGgF5NcVcJdRPA409Zy3Uzvm6MpLBt28tah5Vz8IKtp
	ZNe9/keiWW2WUWkXsF9Fzr0baLGrW8mXv3xlJDZUGdVUtyz8djBlGKfOHpSNV5a0l9H1P2m/bjE6y
	K7lIsS58w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiKoc-0006cf-LA; Thu, 26 Nov 2020 17:12:18 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiKoY-0006bs-Qo; Thu, 26 Nov 2020 17:12:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1E7DB31B;
 Thu, 26 Nov 2020 09:12:06 -0800 (PST)
Received: from [10.57.59.159] (unknown [10.57.59.159])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 472113F23F;
 Thu, 26 Nov 2020 09:12:02 -0800 (PST)
Subject: Re: [PATCH v4 17/24] iommu/mediatek: Add single domain
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Will Deacon <will@kernel.org>
References: <20201111123838.15682-1-yong.wu@mediatek.com>
 <20201111123838.15682-18-yong.wu@mediatek.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <22e49f08-6d23-86cf-bb9c-79d54ce55beb@arm.com>
Date: Thu, 26 Nov 2020 17:11:58 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201111123838.15682-18-yong.wu@mediatek.com>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201126_121214_969211_25751477 
X-CRM114-Status: GOOD (  21.07  )
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
 chao.hao@mediatek.com, kernel-team@android.com, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, Tomasz Figa <tfiga@google.com>,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzk@kernel.org>, anan.sun@mediatek.com,
 Greg Kroah-Hartman <gregkh@google.com>, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2020-11-11 12:38, Yong Wu wrote:
> Defaultly the iova range is 0-4G. here we add a single-domain(0-4G)
> for the previous SoC. this also is a preparing patch for supporting
> multi-domains.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>   drivers/iommu/mtk_iommu.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index bf3f4e0f4748..a7727a3899d1 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -161,6 +161,10 @@ struct mtk_iommu_iova_region {
>   	unsigned long long	size;
>   };
>   
> +static const struct mtk_iommu_iova_region single_domain[] = {
> +	{.iova_base = 0,		.size = SZ_4G},
> +};

Hang on, given how the previous patch works, surely this means you're 
now going to *reserve* the entire address space? That doesn't seem 
right... :/

Robin.

> +
>   /*
>    * There may be 1 or 2 M4U HWs, But we always expect they are in the same domain
>    * for the performance.
> @@ -922,6 +926,8 @@ static const struct mtk_iommu_plat_data mt2712_data = {
>   	.m4u_plat     = M4U_MT2712,
>   	.flags        = HAS_4GB_MODE | HAS_BCLK | HAS_VLD_PA_RNG,
>   	.inv_sel_reg  = REG_MMU_INV_SEL_GEN1,
> +	.iova_region  = single_domain,
> +	.iova_region_nr = ARRAY_SIZE(single_domain),
>   	.larbid_remap = {{0}, {1}, {2}, {3}, {4}, {5}, {6}, {7}},
>   };
>   
> @@ -929,6 +935,8 @@ static const struct mtk_iommu_plat_data mt6779_data = {
>   	.m4u_plat      = M4U_MT6779,
>   	.flags         = HAS_SUB_COMM | OUT_ORDER_WR_EN | WR_THROT_EN,
>   	.inv_sel_reg   = REG_MMU_INV_SEL_GEN2,
> +	.iova_region   = single_domain,
> +	.iova_region_nr = ARRAY_SIZE(single_domain),
>   	.larbid_remap  = {{0}, {1}, {2}, {3}, {5}, {7, 8}, {10}, {9}},
>   };
>   
> @@ -944,6 +952,8 @@ static const struct mtk_iommu_plat_data mt8173_data = {
>   	.flags	      = HAS_4GB_MODE | HAS_BCLK | RESET_AXI |
>   			HAS_LEGACY_IVRP_PADDR,
>   	.inv_sel_reg  = REG_MMU_INV_SEL_GEN1,
> +	.iova_region  = single_domain,
> +	.iova_region_nr = ARRAY_SIZE(single_domain),
>   	.larbid_remap = {{0}, {1}, {2}, {3}, {4}, {5}}, /* Linear mapping. */
>   };
>   
> @@ -951,6 +961,8 @@ static const struct mtk_iommu_plat_data mt8183_data = {
>   	.m4u_plat     = M4U_MT8183,
>   	.flags        = RESET_AXI,
>   	.inv_sel_reg  = REG_MMU_INV_SEL_GEN1,
> +	.iova_region  = single_domain,
> +	.iova_region_nr = ARRAY_SIZE(single_domain),
>   	.larbid_remap = {{0}, {4}, {5}, {6}, {7}, {2}, {3}, {1}},
>   };
>   
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
