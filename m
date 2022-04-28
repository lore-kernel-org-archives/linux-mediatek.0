Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AB0DC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Apr 2022 14:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=izvpM4A6K2AJt2eYx6P1byaj1HeFwKTIKIeTfucHCh0=; b=r4QpMNNOwK48zU
	6bMp7+fGvuaiht2TZm3L7RiXmi6v42kEffzcZ9rD/cDu6lwAd6B8mVVtS1sxiA+P8C8DmwZUEOuvy
	ZjVf1wC6L6G4VbjnPIDWonMaQf9k2FOvopAeB/BYagGntttk2YRwVYlDQYUqzwVcXmLfJNWLOTneV
	4dSTNNGjT6XS6llosYnXt8FO+4pdZ+erCcX+swcfmg9gN27XGuBHEE6yT7efkS6SgvpHV38EP2VcX
	PfXPtD6LvvMIM0wp5zvBCwa4Qk28GlYvQBI3M2DVptOV7DATHodzXnBWA+x5/sqipEo75V1wnFZ/g
	CfNDx1FdjOOMKhVsQCPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nk4yg-007Qfq-St; Thu, 28 Apr 2022 14:18:43 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nk4un-007Of4-5C; Thu, 28 Apr 2022 14:14:43 +0000
Received: by mail-wm1-x336.google.com with SMTP id
 o12-20020a1c4d0c000000b00393fbe2973dso4442389wmh.2; 
 Thu, 28 Apr 2022 07:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=S0n4vT9BhMHU2WQlHRXLpp/KRrHRQlF2a1BLW87KTmk=;
 b=gAo2hOkVIKXQN2B46GdYlRrzaZTgfNHy4B0UwKMLWDwYy2hqdunAn+f4J1YAWxsIkI
 f/NTIomFneugwkvTqguhSHUAGUWJYzufBW+YNSTDGQ8CVjSXpvcRptzF3ErfhV+eF50K
 RDmPIYaFrwTxpnF5W66kw9Bcl51jKC9OE+kX3jJi5GnpnBg2EG/tXzi7CSngM83SWpzy
 lOt5/qMLQkGXXCzNURX9+mfmuFM9fieJWVR3yX10BwivUYDaIeab7/nNE5PSylJDnUUh
 8Jm/YJcbi4GrShGruqoOvtAqyRFa7BdZtg37hxbiQUEgKlmg6oyXt3IQFbUJyr2zFTfY
 gfbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=S0n4vT9BhMHU2WQlHRXLpp/KRrHRQlF2a1BLW87KTmk=;
 b=ykaJARpLww4OmpwJY+cYvc0xkzYESyi1SKay6yPCmoCOiV1O7odzpt5AU+YYaiVsoo
 sRUDwKHUZtwhYKEBScPwWZ4tFbEesBUOT3romgItcVgHGQGmVw/yjmO41SZh2xygBXZh
 svU4z0//2uUe2PtXOS7s8kbltBPlhI8ANfnRmwApWmst7HCRb54mWeojmOIsA5zg3uNG
 HfPv1M3mQEBPExDn9WsWzldBcqkQOi7adGe9nq6DlJowpCkuM+z4XVonxP2jjTP4y4HG
 2VwKlJyMEMjE4OLpkaam/XQZkDES+CCfH34YY8E2GBnnjqCNY/eFeBPzzqap2AOxzlGH
 A0qg==
X-Gm-Message-State: AOAM531mVzw6RGBmzQYdscd2hBfVGe8sRnIzODSSecHjQjP+M3xa4XW/
 xP3oEpnQH0wgsSLSpRuo3RA=
X-Google-Smtp-Source: ABdhPJwUdgNeXIVbLSeg3t/l9hijtw5yJRrMD2iH8BHIePXx5Ru7c5WskYH6AKHZcKUO2GzrZkH9SQ==
X-Received: by 2002:a05:600c:1548:b0:392:8e1a:18c3 with SMTP id
 f8-20020a05600c154800b003928e1a18c3mr31451311wmg.102.1651155276124; 
 Thu, 28 Apr 2022 07:14:36 -0700 (PDT)
Received: from [192.168.0.43] (static-35-180-85-188.ipcom.comunitel.net.
 [188.85.180.35]) by smtp.gmail.com with ESMTPSA id
 f66-20020a1c3845000000b00393e84ea043sm54451wma.44.2022.04.28.07.14.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Apr 2022 07:14:35 -0700 (PDT)
Message-ID: <cc7cc7a8-c7a2-56a1-47bf-6c553c200b33@gmail.com>
Date: Thu, 28 Apr 2022 16:14:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 31/34] iommu/mediatek: Get the proper bankid for multi
 banks
Content-Language: en-US
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Herring <robh+dt@kernel.org>, Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Tomasz Figa <tfiga@chromium.org>, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux-foundation.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 youlin.pei@mediatek.com, anan.sun@mediatek.com, xueqi.zhang@mediatek.com,
 yen-chang.chen@mediatek.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 mingyuan.ma@mediatek.com, yf.wang@mediatek.com, libo.kang@mediatek.com,
 chengci.xu@mediatek.com
References: <20220407075726.17771-1-yong.wu@mediatek.com>
 <20220407075726.17771-32-yong.wu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220407075726.17771-32-yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_071441_426995_3AE10233 
X-CRM114-Status: GOOD (  32.36  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 07/04/2022 09:57, Yong Wu wrote:
> We preassign some ports in a special bank via the new defined
> banks_portmsk. Put it in the plat_data means it is not expected to be
> adjusted dynamically.
> 
> If the iommu id in the iommu consumer's dtsi node is inside this
> banks_portmsk, then we switch it to this special iommu bank, and
> initialise the IOMMU bank HW.
> 
> Each a bank has the independent pgtable(4GB iova range). Each a bank
> is a independent iommu domain/group. Currently we don't separate different
> iova ranges inside a bank.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   drivers/iommu/mtk_iommu.c | 39 ++++++++++++++++++++++++++++++++++++---
>   1 file changed, 36 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index 0828cff97625..d42b3d35a36e 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -191,6 +191,7 @@ struct mtk_iommu_plat_data {
>   
>   	u8                  banks_num;
>   	bool                banks_enable[MTK_IOMMU_BANK_MAX];
> +	unsigned int        banks_portmsk[MTK_IOMMU_BANK_MAX];
>   	unsigned char       larbid_remap[MTK_LARB_COM_MAX][MTK_LARB_SUBCOM_MAX];
>   };
>   
> @@ -467,6 +468,30 @@ static irqreturn_t mtk_iommu_isr(int irq, void *dev_id)
>   	return IRQ_HANDLED;
>   }
>   
> +static unsigned int mtk_iommu_get_bank_id(struct device *dev,
> +					  const struct mtk_iommu_plat_data *plat_data)
> +{
> +	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
> +	unsigned int i, portmsk = 0, bankid = 0;
> +
> +	if (plat_data->banks_num == 1)
> +		return bankid;
> +
> +	for (i = 0; i < fwspec->num_ids; i++)
> +		portmsk |= BIT(MTK_M4U_TO_PORT(fwspec->ids[i]));
> +
> +	for (i = 0; i < plat_data->banks_num && i < MTK_IOMMU_BANK_MAX; i++) {
> +		if (!plat_data->banks_enable[i])
> +			continue;
> +
> +		if (portmsk & plat_data->banks_portmsk[i]) {
> +			bankid = i;
> +			break;
> +		}
> +	}
> +	return bankid; /* default is 0 */
> +}
> +
>   static int mtk_iommu_get_iova_region_id(struct device *dev,
>   					const struct mtk_iommu_plat_data *plat_data)
>   {
> @@ -619,13 +644,14 @@ static int mtk_iommu_attach_device(struct iommu_domain *domain,
>   	struct list_head *hw_list = data->hw_list;
>   	struct device *m4udev = data->dev;
>   	struct mtk_iommu_bank_data *bank;
> -	unsigned int bankid = 0;
> +	unsigned int bankid;
>   	int ret, region_id;
>   
>   	region_id = mtk_iommu_get_iova_region_id(dev, data->plat_data);
>   	if (region_id < 0)
>   		return region_id;
>   
> +	bankid = mtk_iommu_get_bank_id(dev, data->plat_data);
>   	mutex_lock(&dom->mutex);
>   	if (!dom->bank) {
>   		/* Data is in the frstdata in sharing pgtable case. */
> @@ -802,6 +828,7 @@ static struct iommu_group *mtk_iommu_device_group(struct device *dev)
>   	struct mtk_iommu_data *c_data = dev_iommu_priv_get(dev), *data;
>   	struct list_head *hw_list = c_data->hw_list;
>   	struct iommu_group *group;
> +	unsigned int bankid, groupid;
>   	int regionid;
>   
>   	data = mtk_iommu_get_frst_data(hw_list);
> @@ -812,12 +839,18 @@ static struct iommu_group *mtk_iommu_device_group(struct device *dev)
>   	if (regionid < 0)
>   		return ERR_PTR(regionid);
>   
> +	bankid = mtk_iommu_get_bank_id(dev, data->plat_data);

I think code readability would be improved if we add a new function like 
mtk_iommu_get_id which call mtk_iommu_get_bankid and if necessary 
mtk_iommu_get_regionid.

>   	mutex_lock(&data->mutex);
> -	group = data->m4u_group[regionid];
> +	/*
> +	 * If the bank function is enabled, each a bank is a iommu group/domain.
> +	 * otherwise, each a iova region is a iommu group/domain.

While at it:
"If the bank function is enabled, each bank is a iommu group/domain. Otherwise, 
each iova region is a iommu group/domain."

Regards,
Matthias

> +	 */
> +	groupid = bankid ? bankid : regionid;
> +	group = data->m4u_group[groupid];
>   	if (!group) {
>   		group = iommu_group_alloc();
>   		if (!IS_ERR(group))
> -			data->m4u_group[regionid] = group;
> +			data->m4u_group[groupid] = group;
>   	} else {
>   		iommu_group_ref_get(group);
>   	}

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
