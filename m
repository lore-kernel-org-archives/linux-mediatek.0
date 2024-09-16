Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83314C3ABB2
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Sep 2024 12:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ahh+3/9HFpEGSJgFe72jJ6beI3LNcEJzOGAbH7bqvqw=; b=ShPSd9yBmL1kVhi3f2e1EjyD2c
	CDE99MDQkUde1C/oG7hYli4Hjn/5C6Np3cpIzLuPsDJegq+sSr/eq9XuWIJiFYy+qNGP3jzWM5HWU
	eyxta9omEhJaJ1sRlR7I1G6I4OhzCwOwV/8p5SJdlDJpsNFSSffMZIhslsV4QTAQ0MpkcHoLKXzBN
	TktmEIvt3LCjKmRJotVgXCnoxwwLSOJlQC9uz3ChRT6DabCMUJIOJDc4Joy2ACvixcnh4+rpN7Rv7
	92xDsF1X6s1WDzFFJCiRON/thzbdj8J65lHS9C5NpS4BN+nhl/CXvTaKSEC672zP3aPUKPLs3UpBd
	eRGMuMiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqAWt-00000003wLZ-0Z77;
	Mon, 16 Sep 2024 12:08:31 +0000
Received: from a7-45.smtp-out.eu-west-1.amazonses.com ([54.240.7.45])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqAWq-00000003wKu-3r3E;
	Mon, 16 Sep 2024 12:08:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1726488505;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=VW9wIzceX735i9yX1DBCBq4IDNjS/8cghksJ8RpmIAs=;
	b=BiCCPcW7FpAQ9cCduF+vD7iu7ISsJXjdWA445Ch7452VshuCOIpIApAaQy8cMBIC
	pXQUxV2vp3KZ+5kmYJYUUFnfdLWh5LvY/RyeDpEPhxao8hrpMvSGkBCWk2Qsc7F8d+g
	WPK3OkXvJcs4UwIPEjtqeegvzC2CnBo5L4D5K55UmdNcOhiC9pDzhD5g4b782q+C5au
	dqEXBSdiRQvA8wEBfBF9O+eoUmIktQvEC2mzW+wVHh20IEa3gjLBs5K4LUisms3hvOD
	3nW0Nh/ImCNiacG+A1CbN6F3q665uf+IGFGxoDKtvYyZ9CZRvTdCSo5kZC0omIMUT9n
	oa2kbvt3OQ==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1726488505;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
	bh=VW9wIzceX735i9yX1DBCBq4IDNjS/8cghksJ8RpmIAs=;
	b=D0+zkQ9JwNw3ps90exTefnChDf6Q6MI3liaa3ZfKUbaUdywcVt1KjhlXOEPgnZL/
	V5uPjAWBrBl45bxrM5a8nPqyOqKkGVGVJvY5QC0VOm5YxPHqO9zqhPHx2qt9TPiQUwP
	BLsDok/7f9aroB4ixEojZ1d2d31QKY//z8BRcnjE=
Message-ID: <01020191fabbea05-14368d2a-b504-4fad-b1a1-48435821d7f1-000000@eu-west-1.amazonses.com>
Date: Mon, 16 Sep 2024 12:08:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] clk: Drop obsolete devm_clk_bulk_get_all_enable()
 helper
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
 <20240914-clk_bulk_ena_fix-v1-4-ce3537585c06@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240914-clk_bulk_ena_fix-v1-4-ce3537585c06@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.09.16-54.240.7.45
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240916_050829_142874_F48BDBB1 
X-CRM114-Status: GOOD (  20.59  )
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
> A new helper devm_clk_bulk_get_all_enabled() has been introduced, which
> is consistent with devm_clk_bulk_get_all() in terms of the returned
> value.
> 
> Drop the obsolete function since all users switched to the new helper.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

This should probably be done in two (three?) cycles if we want to avoid
immutable branches... but anyway, for the commit itself:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   drivers/clk/clk-devres.c | 32 --------------------------------
>   include/linux/clk.h      | 22 ----------------------
>   2 files changed, 54 deletions(-)
> 
> diff --git a/drivers/clk/clk-devres.c b/drivers/clk/clk-devres.c
> index 4203aaaa7544..14a657f336fe 100644
> --- a/drivers/clk/clk-devres.c
> +++ b/drivers/clk/clk-devres.c
> @@ -218,38 +218,6 @@ static void devm_clk_bulk_release_all_enable(struct device *dev, void *res)
>   	clk_bulk_put_all(devres->num_clks, devres->clks);
>   }
>   
> -int __must_check devm_clk_bulk_get_all_enable(struct device *dev,
> -					      struct clk_bulk_data **clks)
> -{
> -	struct clk_bulk_devres *devres;
> -	int ret;
> -
> -	devres = devres_alloc(devm_clk_bulk_release_all_enable,
> -			      sizeof(*devres), GFP_KERNEL);
> -	if (!devres)
> -		return -ENOMEM;
> -
> -	ret = clk_bulk_get_all(dev, &devres->clks);
> -	if (ret > 0) {
> -		*clks = devres->clks;
> -		devres->num_clks = ret;
> -	} else {
> -		devres_free(devres);
> -		return ret;
> -	}
> -
> -	ret = clk_bulk_prepare_enable(devres->num_clks, *clks);
> -	if (!ret) {
> -		devres_add(dev, devres);
> -	} else {
> -		clk_bulk_put_all(devres->num_clks, devres->clks);
> -		devres_free(devres);
> -	}
> -
> -	return ret;
> -}
> -EXPORT_SYMBOL_GPL(devm_clk_bulk_get_all_enable);
> -
>   int __must_check devm_clk_bulk_get_all_enabled(struct device *dev,
>   					       struct clk_bulk_data **clks)
>   {
> diff --git a/include/linux/clk.h b/include/linux/clk.h
> index 158c5072852e..b607482ca77e 100644
> --- a/include/linux/clk.h
> +++ b/include/linux/clk.h
> @@ -495,22 +495,6 @@ int __must_check devm_clk_bulk_get_optional(struct device *dev, int num_clks,
>   int __must_check devm_clk_bulk_get_all(struct device *dev,
>   				       struct clk_bulk_data **clks);
>   
> -/**
> - * devm_clk_bulk_get_all_enable - Get and enable all clocks of the consumer (managed)
> - * @dev: device for clock "consumer"
> - * @clks: pointer to the clk_bulk_data table of consumer
> - *
> - * Returns success (0) or negative errno.
> - *
> - * This helper function allows drivers to get all clocks of the
> - * consumer and enables them in one operation with management.
> - * The clks will automatically be disabled and freed when the device
> - * is unbound.
> - */
> -
> -int __must_check devm_clk_bulk_get_all_enable(struct device *dev,
> -					      struct clk_bulk_data **clks);
> -
>   /**
>    * devm_clk_bulk_get_all_enabled - Get and enable all clocks of the consumer (managed)
>    * @dev: device for clock "consumer"
> @@ -1052,12 +1036,6 @@ static inline int __must_check devm_clk_bulk_get_all(struct device *dev,
>   	return 0;
>   }
>   
> -static inline int __must_check devm_clk_bulk_get_all_enable(struct device *dev,
> -						struct clk_bulk_data **clks)
> -{
> -	return 0;
> -}
> -
>   static inline int __must_check devm_clk_bulk_get_all_enabled(struct device *dev,
>   						struct clk_bulk_data **clks)
>   {

