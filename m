Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5B9CC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Apr 2022 16:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=chSNJOELARw7To3q+abem8AWV9LsPW7cXufmGBMrflc=; b=jcpN164+6LmH6H
	EZWcIdcNuDrJgQ9hJ3xeAPgfP/QRhasouPuA6SjcDoXuTvobOZcqfnBXRbtSxvieyAtjxcXOyXKGg
	hKrFX0us/ZlLIgy2OHDGUiAvR1Yef/QIn5rer18Jm7GgaZ7rqid26YfKpS5fDzVfHIeKTYvSG2+Ht
	qK+2X9ojjEypyHZiG/yLiQXeJ4d4FBOIXLkcAzl54hWMR/zkho5onbWt7wNKA2eAdvPPLHYi2+4Ep
	VXOWB2zNWSOV6oEqFB4xRvwjw8H1Y9n02MeCja6w7FzRTueL1D/xOhXh0gwbp95gV2PgA2WbwvHwv
	8uCEK3aRjC3ZshA9pxKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njNhy-00FHYn-4I; Tue, 26 Apr 2022 16:06:34 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njNhi-00FHTs-OR; Tue, 26 Apr 2022 16:06:20 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 5E74D1F42C72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1650989172;
 bh=1wvRqjVZjbReycK48tbxPvly7/Q6yNLcAhf9ITv2WX4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=YJ+JNryBr+ROkJYtXFkF2H7ftrQmFIYl0D5Zd8CaOOtgTlc4zdhdCLz4PcLX35eWL
 8LlIMGeCuzRmK5RG257HlotWDGpbNlMgzHXqy4Gw7oR2KBXSx4FjL0HZ3YIys1ZWgK
 Q+dTEiHDJOhNl85mAePKB3wKTVETMQyV6AfLu9ho/YtTWReGmumRRSbAEB3mvyqvpo
 uCoHd0koRXgJUNYWwi/WnkHuMMdL0T10+aMc+rxmrEKSI7Yv5UWDJKJ/q/hbVWWu8+
 6JQq3FJ5jH3QJcgXGiuXkD3MPc1j6lLrdttCq3OL4Tm4RiAX7gUdH+N0e6RPnJfe34
 BeSwA7WpwmCpg==
Message-ID: <bad44be8-abc7-169f-bc7a-cef3692c9a71@collabora.com>
Date: Tue, 26 Apr 2022 18:06:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v7 2/2] phy: mediatek: Add PCIe PHY driver
Content-Language: en-US
To: Jianjun Wang <jianjun.wang@mediatek.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Wei-Shun Chang <weishunc@google.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, rex-bc.chen@mediatek.com,
 randy.wu@mediatek.com, jieyy.yang@mediatek.com, chuanjia.liu@mediatek.com,
 qizhong.cheng@mediatek.com, jian.yang@mediatek.com
References: <20220422142331.17173-1-jianjun.wang@mediatek.com>
 <20220422142331.17173-3-jianjun.wang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220422142331.17173-3-jianjun.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_090618_970517_64193595 
X-CRM114-Status: GOOD (  12.38  )
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

Il 22/04/22 16:23, Jianjun Wang ha scritto:
> Add PCIe GEN3 PHY driver support on MediaTek chipsets.
> 
> Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>

Hello Jianjun,
there's only one last bit to fix, check below:

> ---
>   drivers/phy/mediatek/Kconfig        |  11 ++
>   drivers/phy/mediatek/Makefile       |   1 +
>   drivers/phy/mediatek/phy-mtk-pcie.c | 267 ++++++++++++++++++++++++++++
>   3 files changed, 279 insertions(+)
>   create mode 100644 drivers/phy/mediatek/phy-mtk-pcie.c
> 

..snip..

> +static int mtk_pcie_read_efuse(struct mtk_pcie_phy *pcie_phy)
> +{
> +	struct device *dev = pcie_phy->dev;
> +	bool nvmem_enabled;
> +	int ret, i;
> +
> +	/* nvmem data is optional */
> +	nvmem_enabled = device_property_read_bool(dev, "nvmem-cells");

device_property_read_bool() returns device_property_present().

I would prefer that, instead, you call the latter:

	nvmem_enabled = device_property_present(dev, "nvmem-cells");

It's the same, yes, but this will increase human readability, as the function
name clearly states the intention here.

Thanks,
Angelo


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
