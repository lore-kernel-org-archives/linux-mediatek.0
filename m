Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4846AC67871
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Oct 2022 08:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ac0vDkVN2S5INbBKAJZXzBMZgmwPtx+J/y1wgnR5DWw=; b=2J8AWDSo2oyMbAukk6SW98RazL
	O4SklpXOPmKBs/ppJhnXawGXgc6z684thAk5SZvo8ygjlosyF4oRYayXm1jbYQpK8O0GmtGeMGJVM
	iL7UurTOJU03RyqWlMgVBBiwwS3Yhu6ef0pHPOZ/ShCz4lUrhVOAkeE4lazeZYpT+3AKEboZFnxxz
	FAs6IyZub1U1SB/maivI7tdgTw6e0VDL0FsbtatAQs8iQdLbwi1z+2ZVcGheN2yCvPzU1oVr0QYp7
	BaGMNSSgUThRCbb6ZkExAVV1xB3X2pdRymqiaBKtKOW/nmXHRlFPyVrxQsulEq0fYnCQTQDEfkUcP
	GgnJfCyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onyA7-00CMmk-Jg; Thu, 27 Oct 2022 08:22:51 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ony9j-00CMZV-V8; Thu, 27 Oct 2022 08:22:29 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id F16CE66028BE;
	Thu, 27 Oct 2022 09:22:25 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1666858946;
	bh=JtEUOLR2EgDz232JYBT0aoeVDFCeQIPLjyQdNecDcaQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=V1npCHGRLgGjVicy2SdACvdAX5ZHEezSbWPJ8t0wK0SMv0QX1Lku39eJExLZso573
	 KLrkmy+ohl87wTvJ1GN9Jh9wE89C3k5XEanW27kP6A8H2UjS0d9k3hLBrh8gVHCWNH
	 jWEqbWt65KNhZajPnUa0pyB9IHa/0uaH66OMwyuHaym4+CpoI9QKy2/vS7XRYGi/k9
	 LlffUpGuBBsREhPmz7NViiOqAHvXqkGBQ4cs0YWTD1679z4UvkmQILBIaemUDVztKX
	 VeXRHz9RlWqrOe1BRwc+h5vx7XoGA8rEtSjIQ6KRg/sV7cz+HMlR55lE8gQgCQIq81
	 V4d32mWnLJ1Lg==
Message-ID: <8c0da3f2-0e77-e960-dab4-0a1d02e0d21e@collabora.com>
Date: Thu, 27 Oct 2022 10:22:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v2 04/19] clk: mediatek: Add MT8188 peripheral clock
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
 <20221024094254.29218-5-Garmin.Chang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221024094254.29218-5-Garmin.Chang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_012228_177209_AFC3EFF4 
X-CRM114-Status: GOOD (  12.07  )
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
> Add MT8188 peripheral clock controller which provides clock
> gate control for ethernet/flashif/pcie/ssusb.
> 
> Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>

..snip..

> +
> +static const struct of_device_id of_match_clk_mt8188_peri_ao[] = {
> +	{
> +		.compatible = "mediatek,mt8188-pericfg_ao",
> +		.data = &peri_ao_desc,
> +	}, {
> +		/* sentinel */
> +	}
> +};
> +

Here and for all of the other drivers that you're introducing with this series...

please compress this array to one line per entry, like so:

static const struct of_device_id of_match_clk_mt8188_peri_ao[] = {
	{ .compatible = "mediatek,mt8188-pericfg_ao", .data = &peri_ao_desc },
	{ /* sentinel */ }
};

Regards,
Angelo


