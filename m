Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1C66C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jan 2022 11:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DhWxRdgwN1XWFdVpzGohp3z6Bz54Wd2yd35VmpYN7cc=; b=I2C3vqd8TAJ77/fQ4XlYWWvUDU
	ZPEBD6Dew7bW+8eknggfirJFLdReoegdajdRYceEQCpSiiXOc9waZRsw5CEh+gDvSFku2gl1xMSmb
	QBzjyaZ/I9fI5tYNQsZrRDYtESeuYJPafHb9wElmhG5669sroWQdU+Jl1ON9XhftdjRe8l8+tC/Ju
	Vk4IfA3T0IRBQyoYqbQakVVgzPszcnK9XANtqHEjbyw3owX2SlRiJmp6i6nkUZhF3TE8irT7E5dJF
	mlghZJBvWIRbJQ6etpgJV05OPoA//gw2LX+CwWuGqz88f4UhRAdVIFXrD4al6Gn13pwFhwzvUNH1/
	MV9LPSfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nD2s3-00FPaN-1a; Thu, 27 Jan 2022 11:23:19 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nD2qE-00FOmR-MM; Thu, 27 Jan 2022 11:21:28 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 5C85F1F450BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1643282485;
 bh=3BQWjA3nBp0sP7zgUSrad36ylixDnLmcqKRaTEEAMiM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=TqymkiTkmc8ouV09E5rSvKQgI1FdJ0efS27pK79aps2Jzy7Z8w/Cy0sDkt8Yn9gFO
 KGMCLUBeNBWSc5d+ZeCKWEwex3xbBOCP4CNz28lYh1Fi7qKWXjkkQusXvM2/mUT8LE
 Wa2H+R+DwBAgfDM6IOoGwx9cOkPsIgj7mGW3g/pFQskGpDN3uaaEJyglRNEh9Rb2mK
 XBmZeF9jONOMblSQQygM6bv8s/ecqlK1rrkjNVkqNffmePAeiOMJUkylg17LZCVPuK
 e6tEGjEP6a9LpBl4OFu6G3DSTcKyWWfs4QJsLckJsJhdTG07bQOJoz8zABH0/KTkil
 g9B6Tw63fHj6A==
Subject: Re: [PATCH v4 32/35] iommu/mediatek: Get the proper bankid for multi
 banks
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Tomasz Figa <tfiga@chromium.org>, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux-foundation.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 youlin.pei@mediatek.com, anan.sun@mediatek.com, xueqi.zhang@mediatek.com,
 yen-chang.chen@mediatek.com, mingyuan.ma@mediatek.com, yf.wang@mediatek.com,
 libo.kang@mediatek.com, chengci.xu@mediatek.com
References: <20220125085634.17972-1-yong.wu@mediatek.com>
 <20220125085634.17972-33-yong.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <0dce6a25-6e45-efcc-3235-b8b7be81ea4f@collabora.com>
Date: Thu, 27 Jan 2022 12:21:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220125085634.17972-33-yong.wu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_032126_932600_514F72F2 
X-CRM114-Status: GOOD (  18.79  )
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

Il 25/01/22 09:56, Yong Wu ha scritto:
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
> ---
>   drivers/iommu/mtk_iommu.c | 39 ++++++++++++++++++++++++++++++++++++---
>   1 file changed, 36 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index 22586d1aed72..c6de9304bbc6 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -191,6 +191,7 @@ struct mtk_iommu_plat_data {
>   
>   	u8                  banks_num;
>   	bool                banks_enable[MTK_IOMMU_BANK_MAX];
> +	unsigned int        banks_portmsk[MTK_IOMMU_BANK_MAX];

I would prefer to see u32 here instead... but maybe that's just a
personal preference, it doesn't really matter.

In any case:
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
