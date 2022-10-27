Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEC6CC67871
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Oct 2022 08:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YuBgAKkdp1VxMJgKkN9a77evzVBtMQ6NceJPpcXRQJI=; b=yQEZ+lTqnu9MK8dNU0YaHoRaz8
	/rdous7wHku/pnREfacDrQCzNJL9MTyNam60lyD8Fngj4EKxZQMJvKFUkS+ZZLEKxXQ1gBa5ydEDs
	wKDmYNm97ZLMpuGB4JGQ/MWJU47SpWXtBXsZebGbFKwDdzUE0ySGH4p1HtXkYs3ZXT0Y7m7qVG8Ty
	L/Jw5Ctqv45c1alWbKuY7vQI2c/Q7G0GZ5kEJu8OEAtvrUQgPhDCEojjU018Zh3REyb/AzV8ptWBK
	sg4ByPtlYMy/zmlH8IsxrKF9G5JZYClP9exdJhOEIbvw8VkUwN9R8IWu0Wr83UG/cCYeUAJhLPeyl
	J5TKqH1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ony8x-00CM8x-UB; Thu, 27 Oct 2022 08:21:39 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ony8V-00CLya-J9; Thu, 27 Oct 2022 08:21:12 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4A0C266028C0;
	Thu, 27 Oct 2022 09:21:09 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1666858870;
	bh=J7K7i04eVT2PIfwxr81wlM3HFvdF43HmhvXykO4DStA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WHFnE0yz/vwKClukYr820fflZVz9Ph9B1SoUAjrAVzya5Hk/7ISavMuQo4BYgaekl
	 /HWmJnPAWg2qqfZZpyVhmyKi2yG909VaTOVQmwlJY0P9xRYEbvwNge027sRkKFZEyY
	 ht3gjwrUDgKweeb+dZwrVvcjejMZVfD7FR/0QKzOM1VHu6oW95m3ecEDpM3wXSquqJ
	 w/MZR2+4U1HpXvZpoO/GMC24tMJpqhvHH2R4XKJAwQW3FQpgUec3rJe5YYtsYojw71
	 gwNrmiX8VRSvETbtDItfaTQeU84EX7AMPRE/acPSKCf4MNLNW87tJhD8lF6XXwxrCh
	 UNcQOe/ccW5cw==
Message-ID: <1dbba01b-157d-c04b-8f06-4d9ec79b1d5c@collabora.com>
Date: Thu, 27 Oct 2022 10:21:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v2 02/19] clk: mediatek: Add MT8188 apmixedsys clock
 support
Content-Language: en-US
To: "Garmin.Chang" <Garmin.Chang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Richard Cochran <richardcochran@gmail.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20221024094254.29218-1-Garmin.Chang@mediatek.com>
 <20221024094254.29218-3-Garmin.Chang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221024094254.29218-3-Garmin.Chang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_012111_790451_46563379 
X-CRM114-Status: GOOD (  14.99  )
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

Il 24/10/22 11:42, Garmin.Chang ha scritto:
> Add MT8188 apmixedsys clock controller which provides Plls
> generated from SoC 26m and ssusb clock gate control.
> 
> Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>
> Change-Id: I3b1b44155cc5bfe5ba6e860de857e7e9f48b66a7
> ---
>   drivers/clk/mediatek/Kconfig                 |  11 ++
>   drivers/clk/mediatek/Makefile                |   1 +
>   drivers/clk/mediatek/clk-mt8188-apmixedsys.c | 153 +++++++++++++++++++
>   3 files changed, 165 insertions(+)
>   create mode 100644 drivers/clk/mediatek/clk-mt8188-apmixedsys.c
> 

..snip..

> diff --git a/drivers/clk/mediatek/clk-mt8188-apmixedsys.c b/drivers/clk/mediatek/clk-mt8188-apmixedsys.c
> new file mode 100644
> index 000000000000..f09e11d0261e
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt8188-apmixedsys.c

..snip..

> +
> +static int clk_mt8188_apmixed_probe(struct platform_device *pdev)
> +{
> +	struct clk_hw_onecell_data *clk_data;
> +	struct device_node *node = pdev->dev.of_node;
> +	int r;
> +
> +	clk_data = mtk_alloc_clk_data(CLK_APMIXED_NR_CLK);
> +	if (!clk_data)
> +		return -ENOMEM;
> +
> +	r = mtk_clk_register_plls(node, plls, ARRAY_SIZE(plls), clk_data);
> +	if (r)
> +		goto free_apmixed_data;
> +
> +	r = mtk_clk_register_gates(node, apmixed_clks, ARRAY_SIZE(apmixed_clks), clk_data);

Please use mtk_clk_register_gates_with_dev().

Regards,
Angelo

