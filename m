Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64A33C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Mar 2022 14:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wRE/fCsrPonhZL62F2c9CYP6TG3Ma8Cocrp9JMaPMn8=; b=tdm7qEkiSZdS6r
	VEblsYL3voQZeXDCxL7Q606WEZ0aDDRWD5ZApY8hb9GGqTmOnPORzsz63znHlrphbUnt2t8m9T9ca
	2xnpiuBdkhqR25pMaTpAmmPe7t4L5McmbzyYdQ3AFu7mUVrLYNa+gaZCuXoulZNYlxJAl97VSiomJ
	djT2Ytb8WqOSI4LnhCU8yeGduV9NM+a7ySISS7BkdPRevp4BGzgq2QhekHcLdbwHV9JFnNuseeGNm
	r4yj1WCzQSk9L+4ITaDkHtmPbAXEXhqUceqiTeCY6Keft6io28xVZO3mQRCH0bc2OSPp2VOplnpEL
	oQNCAEvYg4aoc/5mNygQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXkj8-002JNq-0D; Fri, 25 Mar 2022 14:15:42 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXkiv-002JLI-Vi; Fri, 25 Mar 2022 14:15:31 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id A84E41F462FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1648217728;
 bh=sja1g3dzc8qDBvEHxzgzRqMutttR4lk7hJeFs3aFMrQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=FQJJSC26ejBDB4/+Qj6Xw8KwJ0hryubPf5gx4jsPamDol9B2J5wI+bWShxKmiLm79
 z243gfsBJhWYvPmw6BJZhraJN8GqsGwSfeJ9bUGxOlGPe/U8kilRm5kCr3mesojUnm
 mAGy8A+4ZgyAm0Ak+KSKY05/GEKw6A9xbf+4noxC+jUnhXhHlJwnnfLVCT7b2zZRL9
 LToadUNgDwsrkuj0qbupuK286RoKE8GjDMwlT6pg1bPPDdqZmLv1uNthCHIXnt7QOf
 c64ANQiFUXoTIk1cDEODx9OGNgZmH/Y0X6fK1VtQBIFNvNTLt/cMwnc8s8rybg1BR5
 vAAQsFgoAdKJQ==
Message-ID: <be06e57d-302e-e641-a134-c45ea89a6a6b@collabora.com>
Date: Fri, 25 Mar 2022 15:15:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v4 2/2] phy: mediatek: Add PCIe PHY driver
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
References: <20220323065608.27426-1-jianjun.wang@mediatek.com>
 <20220323065608.27426-3-jianjun.wang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220323065608.27426-3-jianjun.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220325_071530_184703_0FAC5082 
X-CRM114-Status: GOOD (  16.89  )
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

Il 23/03/22 07:56, Jianjun Wang ha scritto:
> Add PCIe GEN3 PHY driver support on MediaTek chipsets.
> 
> Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> ---
>   drivers/phy/mediatek/Kconfig        |  11 ++
>   drivers/phy/mediatek/Makefile       |   1 +
>   drivers/phy/mediatek/phy-mtk-pcie.c | 272 ++++++++++++++++++++++++++++
>   3 files changed, 284 insertions(+)
>   create mode 100644 drivers/phy/mediatek/phy-mtk-pcie.c
> 

..snip..

> diff --git a/drivers/phy/mediatek/phy-mtk-pcie.c b/drivers/phy/mediatek/phy-mtk-pcie.c
> new file mode 100644
> index 000000000000..44a2ad8d324e
> --- /dev/null
> +++ b/drivers/phy/mediatek/phy-mtk-pcie.c
> @@ -0,0 +1,272 @@

..snip..

> +/**
> + * struct mtk_pcie_phy - PCIe phy driver main structure
> + * @dev: pointer to device
> + * @phy: pointer to generic phy
> + * @sif_base: IO mapped register base address of system interface
> + * @data: pointer to SoC dependent data
> + * @sw_efuse_en: software eFuse enable status
> + * @efuse_glb_intr: internal resistor selection of TX bias current data
> + * @efuse: pointer to eFues data for each lane

Oops! There's a typo! "eFues" => "eFuse"

After fixing this typo,

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

P.S.: Many thanks for the kerneldoc documentation!!!!

> + */
> +struct mtk_pcie_phy {
> +	struct device *dev;
> +	struct phy *phy;
> +	void __iomem *sif_base;
> +	const struct mtk_pcie_phy_data *data;
> +
> +	bool sw_efuse_en;
> +	u32 efuse_glb_intr;
> +	struct mtk_pcie_lane_efuse *efuse;
> +};


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
