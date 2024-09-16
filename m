Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E183DC3ABA2
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Sep 2024 12:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ei0ium1MCUUUGe54CzDUP04YlhtR8nH7VscSqjhPZEs=; b=RFnFrPnfgTLvJBet3m1CnhA1jc
	E2XcMdGdjJAXp1nl6GW1N1o+dXsHsKZdgC7xbSm2kE87d/qBdTNzSDbbknlnYs5iczyq2dWcWBli+
	J6BIAAXjj9/iaCF7Ov6Ow7LRPa3ALXGKjJOGXPG/QlG2d3C9/W0bCVLu2sm11XGcQzF4mLKqnFLc4
	ivt/LteA9JKzHz7NdlcywlgRdBPBN9vNSENkKRzIAc9FSzUTOOWla64LEmpj8y54CQ/wQjliqgP4t
	OxvNL42R9hulPBJFJirZR79ayMsbXDaQ1My5mswJW/VoX07cXojrLb1HFVR6nWHa0KxJzXbJpp8YQ
	YZt+XoZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqAYz-00000003weZ-22D4;
	Mon, 16 Sep 2024 12:10:41 +0000
Received: from a7-51.smtp-out.eu-west-1.amazonses.com ([54.240.7.51])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqAWx-00000003wLl-2QFy;
	Mon, 16 Sep 2024 12:08:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1726488511;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=OooH+41iO90Tusfnqtf1TfTh4krJ+CGZLGsHn5PLQVU=;
	b=Zvt4VME9/g8VE8VKeVXka5X20vim6vdxt3oztuzlpSFQkXdJ5z6XHupvPicLKhCb
	KG2wqpaCFyMzMjOd1IZRAlzW5KKlM//rvNUaAuv1xWW/tq99VgWICsscZuNdCqPHHtn
	l0vZOD7HNHXFVMBOJ+Y13WWaSbkvBoWMgiksoCyyAej5iz9TX3F/vCRf++To3P3VVS2
	xrWfT14bSx6j/gv8BYOyWaenhtg1j2ALkeE02RKhE/WkjPQjF907Do2NY5ld5ILOOS5
	z38WmYPsyZrbDkN1dzF63vVGE1kFe5BeKdn20KogAl2KhLvcLgMRuTmz8FzIlfdUP0k
	qmPLVawi0w==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1726488511;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
	bh=OooH+41iO90Tusfnqtf1TfTh4krJ+CGZLGsHn5PLQVU=;
	b=kNn3ntPkfPdJr9bJeqpk0ifm/Div1qxv04VNfBTSN7j60WxO0IpHTkNgrvYZHncZ
	zq2DHGhlOmQ4XlQFH43Ua3e8SXXlxL/5eHiwxJtkafanppKBAkef5QjbtfR+ggW5JRn
	OobnB2LRRO3igNMbYLDUezdwFwamiMPeFdnpF1+8=
Message-ID: <01020191fabc03c6-26136e10-99af-4efb-97cc-46532280e694-000000@eu-west-1.amazonses.com>
Date: Mon, 16 Sep 2024 12:08:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] clk: Provide devm_clk_bulk_get_all_enabled() helper
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
	Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	Jingoo Han <jingoohan1@gmail.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org
References: <20240914-clk_bulk_ena_fix-v1-0-ce3537585c06@collabora.com>
 <20240914-clk_bulk_ena_fix-v1-1-ce3537585c06@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240914-clk_bulk_ena_fix-v1-1-ce3537585c06@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.09.16-54.240.7.51
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240916_050835_800525_AFE8135A 
X-CRM114-Status: GOOD (  25.40  )
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

Il 14/09/24 20:04, Cristian Ciocaltea ha scritto:
> Commit 265b07df758a ("clk: Provide managed helper to get and enable bulk
> clocks") added devm_clk_bulk_get_all_enable() function, but missed to
> return the number of clocks stored in the clk_bulk_data table referenced
> by the clks argument.  Without knowing the number, it's not possible to
> iterate these clocks when needed, hence the argument is useless and
> could have been simply removed.
> 
> Introduce devm_clk_bulk_get_all_enabled() variant, which is consistent
> with devm_clk_bulk_get_all() in terms of the returned value:
> 
>   > 0 if one or more clocks have been stored
>   = 0 if there are no clocks
>   < 0 if an error occurred
> 
> Moreover, the naming is consistent with devm_clk_get_enabled(), i.e. use
> the past form of 'enable'.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


> ---
>   drivers/clk/clk-devres.c | 34 ++++++++++++++++++++++++++++++++++
>   include/linux/clk.h      | 24 ++++++++++++++++++++++++
>   2 files changed, 58 insertions(+)
> 
> diff --git a/drivers/clk/clk-devres.c b/drivers/clk/clk-devres.c
> index 82ae1f26e634..4203aaaa7544 100644
> --- a/drivers/clk/clk-devres.c
> +++ b/drivers/clk/clk-devres.c
> @@ -250,6 +250,40 @@ int __must_check devm_clk_bulk_get_all_enable(struct device *dev,
>   }
>   EXPORT_SYMBOL_GPL(devm_clk_bulk_get_all_enable);
>   
> +int __must_check devm_clk_bulk_get_all_enabled(struct device *dev,
> +					       struct clk_bulk_data **clks)
> +{
> +	struct clk_bulk_devres *devres;
> +	int ret;
> +
> +	devres = devres_alloc(devm_clk_bulk_release_all_enable,
> +			      sizeof(*devres), GFP_KERNEL);
> +	if (!devres)
> +		return -ENOMEM;
> +
> +	ret = clk_bulk_get_all(dev, &devres->clks);
> +	if (ret <= 0)
> +		goto err_free_devres;
> +
> +	*clks = devres->clks;
> +	devres->num_clks = ret;
> +
> +	ret = clk_bulk_prepare_enable(devres->num_clks, *clks);
> +	if (ret) {
> +		clk_bulk_put_all(devres->num_clks, devres->clks);
> +		goto err_free_devres;
> +	}
> +
> +	devres_add(dev, devres);
> +
> +	return devres->num_clks;
> +
> +err_free_devres:
> +	devres_free(devres);
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(devm_clk_bulk_get_all_enabled);
> +
>   static int devm_clk_match(struct device *dev, void *res, void *data)
>   {
>   	struct clk **c = res;
> diff --git a/include/linux/clk.h b/include/linux/clk.h
> index 851a0f2cf42c..158c5072852e 100644
> --- a/include/linux/clk.h
> +++ b/include/linux/clk.h
> @@ -511,6 +511,24 @@ int __must_check devm_clk_bulk_get_all(struct device *dev,
>   int __must_check devm_clk_bulk_get_all_enable(struct device *dev,
>   					      struct clk_bulk_data **clks);
>   
> +/**
> + * devm_clk_bulk_get_all_enabled - Get and enable all clocks of the consumer (managed)
> + * @dev: device for clock "consumer"
> + * @clks: pointer to the clk_bulk_data table of consumer
> + *
> + * Returns a positive value for the number of clocks obtained while the
> + * clock references are stored in the clk_bulk_data table in @clks field.
> + * Returns 0 if there're none and a negative value if something failed.
> + *
> + * This helper function allows drivers to get all clocks of the
> + * consumer and enables them in one operation with management.
> + * The clks will automatically be disabled and freed when the device
> + * is unbound.
> + */
> +
> +int __must_check devm_clk_bulk_get_all_enabled(struct device *dev,
> +					       struct clk_bulk_data **clks);
> +
>   /**
>    * devm_clk_get - lookup and obtain a managed reference to a clock producer.
>    * @dev: device for clock "consumer"
> @@ -1040,6 +1058,12 @@ static inline int __must_check devm_clk_bulk_get_all_enable(struct device *dev,
>   	return 0;
>   }
>   
> +static inline int __must_check devm_clk_bulk_get_all_enabled(struct device *dev,
> +						struct clk_bulk_data **clks)
> +{
> +	return 0;
> +}
> +
>   static inline struct clk *devm_get_clk_from_child(struct device *dev,
>   				struct device_node *np, const char *con_id)
>   {
> 

