Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64634EE57DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Sep 2023 09:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SWZkkuTg/BuSkQPUHBx6Dk2wEK98MqMjQVeRuXREDk8=; b=reFy12IkMTqYJDZF7lNrep6S56
	Wwzs3r2R6bRPjkBDDf2zxskOa5vUMcpdq26fE9mL8Qys5rV/JsmYqSrR8/El57cQWPDDnNYMYOLie
	qKxmY3XVIqzbahprgi3LoFcAxiiEKqhQQ7+Mon9ivwu7xB6EV+b/QdpZDskgavmRYnwnDo0WDyTFh
	eQBswwgXIh96oZeEhSt5m0QDAQqWP/nDPESrS+R+jat0uJS/x86P4zYNB8o+1y+H8XgYau3d0tzfi
	thBkB6m8sQNRhu3NIiG0hWll9aOq9qlTPaEydyLZo/OUPwifagZSxNdHVxWWS/iiTNMDtsX35caQC
	GJY5qk4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfd8K-0000HD-0h;
	Mon, 11 Sep 2023 09:23:04 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfd8H-0000GC-0X;
	Mon, 11 Sep 2023 09:23:02 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CAE3A66072EE;
	Mon, 11 Sep 2023 10:22:58 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694424179;
	bh=UHwwIvbCnmPwOAeZhnAr+duGQyfIPj8XHFbA0W2DbjY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Dy8Xh682R8ONHbLMnOEyDrRRl2ao2HsreyUMg/608Ul5q/MridECqmK26rIieoNh8
	 LPJPsPpETrx1yRIbr/Nud7ykkMsqh4rGO/9Ebf4/tfsfBicS70c6c6azvSTSYFaZKD
	 50K1aH+YoNKwx7sNneNdG9tKPVuurXkYs+DYtzf8g+lXJ4hgY5Tq8fpMUOCakbw6/e
	 BchwfP6XrTe9ABy9NS+SjzwMGGzdt7WtjCbjX+/MSNyFnDGe6RL/S8PnZEMX0FtFLB
	 8V+dFpen1h5pxeE30BminheJHbnxyb2tPpC6HzP2uWfiV6qX7cBcfKmvOx42qZmxx2
	 FKFed9MyRBMUQ==
Message-ID: <28b81a20-5cfa-b474-41c3-c01b7b846e21@collabora.com>
Date: Mon, 11 Sep 2023 11:22:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 1/4] iommu/mediatek: Initialise the secure bank
Content-Language: en-US
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Robin Murphy <robin.murphy@arm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 iommu@lists.linux.dev, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 anan.sun@mediatek.com, yf.wang@mediatek.com, mingyuan.ma@mediatek.com,
 "T . J . Mercier" <tjmercier@google.com>
References: <20230911011751.29906-1-yong.wu@mediatek.com>
 <20230911011751.29906-2-yong.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230911011751.29906-2-yong.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_022301_348404_F532A2C9 
X-CRM114-Status: GOOD (  26.35  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 11/09/23 03:17, Yong Wu ha scritto:
> The lastest IOMMU always have 5 banks, and we always use the last bank
> (id:4) for the secure memory address translation. This patch add a new
> flag (SECURE_BANK_ENABLE) for this feature.
> 
> For the secure bank, its kernel va "base" is not helpful since the
> secure bank registers has already been protected and can only be accessed
> in the secure world. But we still record its register base, because we need
> use it to determine which IOMMU HW the translation fault happen in the
> secure world.
> 
> Signed-off-by: Anan Sun <anan.sun@mediatek.com>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>   drivers/iommu/mtk_iommu.c | 19 +++++++++++++++++--
>   1 file changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index 640275873a27..4a2cffb28c61 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -146,6 +146,7 @@
>   #define TF_PORT_TO_ADDR_MT8173		BIT(18)
>   #define INT_ID_PORT_WIDTH_6		BIT(19)
>   #define CFG_IFA_MASTER_IN_ATF		BIT(20)
> +#define SECURE_BANK_ENABLE		BIT(21)
>   
>   #define MTK_IOMMU_HAS_FLAG_MASK(pdata, _x, mask)	\
>   				((((pdata)->flags) & (mask)) == (_x))
> @@ -162,6 +163,8 @@
>   #define MTK_IOMMU_GROUP_MAX	8
>   #define MTK_IOMMU_BANK_MAX	5
>   
> +#define MTK_IOMMU_SEC_BANKID	4
> +

Is there any SoC (previous, current or future) that may have more than one
secure context bank?

I'm thinking about implementing this differently...

static const struct mtk_iommu_plat_data mt8188_data_vdo = {
	....
	.flags = ..flags.. | ATF_SECURE_BANKS_ENABLE
	.banks_num = 5,
	.banks_enable = {true, false, false, false, true},
	.banks_secure = {false, false, false, false, true},
	....
}

...this would means that you won't need to specify a static SEC_BANKID, as
you'd get that from banks_secure... so that....

>   enum mtk_iommu_plat {
>   	M4U_MT2712,
>   	M4U_MT6779,
> @@ -240,9 +243,13 @@ struct mtk_iommu_plat_data {
>   };
>   
>   struct mtk_iommu_bank_data {
> -	void __iomem			*base;
> +	union {
> +		void __iomem		*base;
> +		phys_addr_t		sec_bank_base;
> +	};
>   	int				irq;
>   	u8				id;
> +	bool				is_secure;
>   	struct device			*parent_dev;
>   	struct mtk_iommu_data		*parent_data;
>   	spinlock_t			tlb_lock; /* lock for tlb range flush */
> @@ -1309,7 +1316,15 @@ static int mtk_iommu_probe(struct platform_device *pdev)
>   			continue;
>   		bank = &data->bank[i];
>   		bank->id = i;
> -		bank->base = base + i * MTK_IOMMU_BANK_SZ;

....this would become:

bank->is_secure = MTK_IOMMU_HAS_FLAG(data->plat_data, ATF_SECURE_BANKS_ENABLE) &&
		  data->plat_data->banks_secure[i];

if (bank->is_secure)
	bank->sec_bank_base = res->start + i * MTK_IOMMU_BANK_SZ;
else
	bank->base = base + i * MTK_IOMMU_BANK_SZ;

> +		if (MTK_IOMMU_HAS_FLAG(data->plat_data, SECURE_BANK_ENABLE) &&
> +		    bank->id == MTK_IOMMU_SEC_BANKID) {
> +			/* Record the secure bank base to indicate which iommu TF in sec world */
> +			bank->sec_bank_base = res->start + i * MTK_IOMMU_BANK_SZ;
> +			bank->is_secure = true;
> +		} else {
> +			bank->base = base + i * MTK_IOMMU_BANK_SZ;
> +			bank->is_secure = false;
> +		}
>   		bank->m4u_dom = NULL;
>   
>   		bank->irq = platform_get_irq(pdev, i);

What do you think?

Cheers,
Angelo

