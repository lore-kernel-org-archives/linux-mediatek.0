Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63463EB64DA
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 07:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XxaW537ugikYpFh7/sHgGUrbaaEUOyt7euj4aROoEws=; b=rdDVx88QMV8Uv2R+JGzhYWWZpC
	jkJVr1yCJwQHTZl+N/ZL+DY/yRBOSaKhii/AX1Bxae+UErOvzDKwC3FdIwcweVwHcf2/OI/oOR3tx
	+2DKWv6IWp8uS8pQpvY4v4PwBZa+D4Zp1xKWSQ1XPa0+gHx958OmXpAnSPtf+3rT8Aqq/Kfl32W6z
	YoTK/gd1HXBVr8VcojqO99xU8gcvve72Q02y7P9tkqHzNSqeEmnWeqGED5zY5rnDN4zYnaCqgXkMU
	zchYwKwlT69hD2Vr/ylhsO4bMIf9fFAhoH6dQlGECdDk6TIHx/ncimTI7LXigh9B+jT64GHIPzR+i
	se9ekp0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM1Uh-0064iT-1W;
	Wed, 19 Jul 2023 07:21:07 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM1Ud-0064h0-2P;
	Wed, 19 Jul 2023 07:21:05 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A916D66003AA;
	Wed, 19 Jul 2023 08:21:01 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1689751262;
	bh=eoZISowr7QrTo8XDR+V8qw4PjxQY2Bmj/1UAP+hq3Bw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=O8CEihVe9gOmBSC26nZD06STF1dGhxdcsNFXM7+PnStUGpVMmyZKkCL7ow8wCn+W1
	 xRwu8DZbjhcBjG8wuR8B9OIysr4NJIzgjeYt3KuxtpZ/D06G2ZYCERnb98L6jKZ1yu
	 9tvDkVPeFTIIb6OfmwhXcSQ2rUC9bexVellw2MjIIS8n5lnJjRTeIE2k9+sHTjlU9u
	 okBDAlAX5FEJ6Mj7OO61Pj43hBeggQ5JCVGYlFqWL3qg022x9XJOLLqRO1vwVo7vX1
	 a0hHsq5jdqKK2tAoxbLRndDczxP84rAayJmHOo/Ex8qifEPOEYVPJtZmzBPFFt03ba
	 M/z3owyipvJ3A==
Message-ID: <bcf9c0f0-ba06-d89b-56f9-b1d8abb6737c@collabora.com>
Date: Wed, 19 Jul 2023 09:20:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/3] soc: mediatek: mtk-socinfo: Add driver for getting
 chip information
Content-Language: en-US
To: William-tw Lin <william-tw.lin@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Kevin Hilman <khilman@kernel.org>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20230718112143.14036-1-william-tw.lin@mediatek.com>
 <20230718112143.14036-2-william-tw.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230718112143.14036-2-william-tw.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_002103_962713_18E058BA 
X-CRM114-Status: GOOD (  18.84  )
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

Il 18/07/23 13:21, William-tw Lin ha scritto:
> Add driver for socinfo retrieval. This patch includes the following:
> 1. mtk-socinfo driver for chip info retrieval
> 2. Related changes to Makefile and Kconfig
> 
> Signed-off-by: William-tw Lin <william-tw.lin@mediatek.com>
> ---
>   drivers/soc/mediatek/Kconfig       |  18 +++
>   drivers/soc/mediatek/Makefile      |   1 +
>   drivers/soc/mediatek/mtk-socinfo.c | 203 +++++++++++++++++++++++++++
>   drivers/soc/mediatek/mtk-socinfo.h | 213 +++++++++++++++++++++++++++++
>   4 files changed, 435 insertions(+)
>   create mode 100644 drivers/soc/mediatek/mtk-socinfo.c
>   create mode 100644 drivers/soc/mediatek/mtk-socinfo.h
> 

..snip..

> +
> +/* begin 8186 info */
> +#define mtk_mt8186_EFUSE_DATA_COUNT 1
> +static struct efuse_data mtk_mt8186_efuse_data_info[][mtk_mt8186_EFUSE_DATA_COUNT] = {
> +	{{.nvmem_cell_name = "socinfo-data1", .efuse_data = 0x81861001}},
> +	{{.nvmem_cell_name = "socinfo-data1", .efuse_data = 0x81862001}},
> +};

I'm *sure* that there's a way to avoid specifying the soc-specific compatible, as
the efuse_data is used only for validation, while what you do here is to simply
read the SoC ID from eFuse array.

In theory, this driver could simply have

compatible = "mediatek,socinfo";

as compatible string, without any SoC-specific string in the devicetree, at all,
so that the SoC ID would get recognized completely dynamically - and adding the
name and other strings would be a consequence.

> +
> +static struct name_data mtk_mt8186_name_data_info[] = {
> +	{.soc_name = "MT8186",
> +	 .soc_segment_name = "MT8186GV/AZA",
> +	 .marketing_name = "Kompanio 520"},
> +	{.soc_name = "MT8186T",
> +	 .soc_segment_name = "MT8186TV/AZA",
> +	 .marketing_name = "Kompanio 528"},
> +};
> +/* end 8186 info */
> +

Regards,
Angelo


