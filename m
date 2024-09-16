Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E3BCC3ABA2
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Sep 2024 12:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/wr3f2bpagsE8n0Eq3Y5PCcBgnx0Fld9JphpGBrhbUo=; b=K5jk5GUM/n8vlRuHdpe5kv5CWg
	BP6X2fyt2zB90y5H7lhmaC1jGoVL6+1dWlTYwZswSi164BWhyHywIsfjxo5tS6qqGSAwGfHxy/4Xx
	zA3qin5JZBbBoc0HqjIRhDT758bhpyNkI76n9FQnPJw64LRW83WPvu2UqaxeGi15TBCHHvnv8LulE
	p2x611XRjuCo/YTHm9f5++IoXFsUwrax0UO6lnQAbHHOpnVRQIStTNCn50GsLVVksViPylt9bhTsh
	pBtIf0dPhyCO5KfCxyNEgnXoiWNYsUveuyo1gbvYY9fzeKzHPD0rSU8K9fXgjxaapbBUuXPHq4Kvm
	+nw/CJaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqAXw-00000003wYZ-34Sw;
	Mon, 16 Sep 2024 12:09:36 +0000
Received: from a7-33.smtp-out.eu-west-1.amazonses.com ([54.240.7.33])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqAWs-00000003wKv-0V8d;
	Mon, 16 Sep 2024 12:08:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1726488506;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=GeZRC3FKSHnZDUm77Tw1zAFnloDN+15AGZH8D5IRpc4=;
	b=cHQxApoQIGgAvypm4HLanHR64fOyJc8TTRL/xZvPB5pJ15+p1WFW/uFOyFr0eNkX
	W4JvXO1dErqj8Vpl1X6cCv+hFVSXU1lHma0D2Sz4b9LzedzOBROvwlxOyYDZzHmdHL2
	On0/vmDDb/qMfKoLx15bYUX/73ceVqConQiWRigLuCoRGOdVfF7/pIy1dYfyrA3TcQZ
	gv8jp3MThDj9nz/Gy6cshixKHx+aSp+OcJfexV5DkLQGbbRNxyux5gSd06LplvZuLSl
	CuVdOl5gWWiO87Zab9sVVti2XTCoHYpHmzDmoT1cduWnr8KT4GKk8JhJFv8HD2EWSFl
	DxfNsUs08A==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1726488506;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
	bh=GeZRC3FKSHnZDUm77Tw1zAFnloDN+15AGZH8D5IRpc4=;
	b=eLm1vCG0IGgHU4QU4BzURI7bvXhNA8Ab60Ns7Z7/9xHfvUkGO7GND9Oixj3Gu6Yw
	5VcP0yyTYx6bdkCwGOnj/XCAglxCDvYfHou5wkM5V22pzmYAQWhz7N+in2ppI+RnikQ
	W24IuqdhJrMv46pkN65C+J0tw/+1ITvRCee1qT3I=
Message-ID: <01020191fabbefa3-de7a1f68-ce29-4daf-83e4-846e8b80896e-000000@eu-west-1.amazonses.com>
Date: Mon, 16 Sep 2024 12:08:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] soc: mediatek: pwrap: Switch to
 devm_clk_bulk_get_all_enabled()
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
 <20240914-clk_bulk_ena_fix-v1-2-ce3537585c06@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240914-clk_bulk_ena_fix-v1-2-ce3537585c06@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.09.16-54.240.7.33
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240916_050830_335489_4393C3A6 
X-CRM114-Status: GOOD (  18.25  )
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
> The helper devm_clk_bulk_get_all_enable() is partially broken and will
> be dropped since it missed to return the number of clocks stored in the
> clk_bulk_data table referenced by the clks argument.
> 
> Use the newly introduced devm_clk_bulk_get_all_enabled() variant
> instead, which is consistent with devm_clk_bulk_get_all() in terms of
> the returned value:
> 
>   > 0 if one or more clocks have been stored
>   = 0 if there are no clocks
>   < 0 if an error occurred
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   drivers/soc/mediatek/mtk-pmic-wrap.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
> index 9fdc0ef79202..0bcd85826375 100644
> --- a/drivers/soc/mediatek/mtk-pmic-wrap.c
> +++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
> @@ -2518,8 +2518,8 @@ static int pwrap_probe(struct platform_device *pdev)
>   		}
>   	}
>   
> -	ret = devm_clk_bulk_get_all_enable(wrp->dev, &clk);
> -	if (ret)
> +	ret = devm_clk_bulk_get_all_enabled(wrp->dev, &clk);
> +	if (ret < 0)
>   		return dev_err_probe(wrp->dev, ret,
>   				     "failed to get clocks\n");
>   
> 


