Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DDEDC2BD09
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jun 2024 10:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mz8kvkLt6iojfXsnNGmCxAPcC//lJWlqlDThNogFsL8=; b=qknapdnEpJutQtqKJ5H9T1Zz2e
	868/ozmZHXynXaG1Rta7Ro5wKFNplGAVLmdfEqupAuh5xvjHEgwGwVmi8Xv0Oq00HLmgJQTh7jBWJ
	2NfKeQ9Zxz+i65m+cAX63Q+UE/wAvU/X8+0d/DczhPMyMaZVMEzjqzayWQoCBWXdcVnkYZ7zbth8X
	xhuXSj0sClTvYuTl3Xsr6plTogTjUY4PrUz0JM1sM45Gtj11G45w41wBdNOHwqe19KzeZnie7ivM+
	A89UQeqFwnaFjgER+Cy395CPbVOl4XHDOxu1XjPaUREAXc4a2RNBQTom9ynW3LUoVnfpkRNJbB3DJ
	CtvGiGYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMmn9-0000000A3Wh-45ew;
	Thu, 27 Jun 2024 10:55:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMmn1-0000000A3U6-0M1F;
	Thu, 27 Jun 2024 10:55:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Mz8kvkLt6iojfXsnNGmCxAPcC//lJWlqlDThNogFsL8=; b=Lou6RB471VMACgf8siUSojqi9Z
	VZsRcFu2EfB15X5PIyWf7Th3Q5la7HatZ1BXPShc87KG1rE87IHpP8T3Q+kxFgMA9PPVgJW5Ssb/Z
	TU8Ju8ec5RGaXNP8NzzBjVkXNv124YbkSTpDahDVsPsL00g+rbhmCd/FBADMecl6jrKjE0e8KNLaS
	jQPhfDAjl3Gf9ZJNhzJnvu7R3MM9vTB36Sgy4og2d+isSsogUefePVW6QpUJMEJIPsG5516zBOubO
	THIIiao3Qc4eeD2XZOPirAbX/oAEmjnuRPAMC9oRz43mXjU+MZA35W7X8dE6m4xQcOYG44WfaGpcH
	5C0ETdpQ==;
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMlcp-00000008oMb-39Za;
	Thu, 27 Jun 2024 09:42:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1719481207;
	bh=sPv2gjPKrEsO6IWBmkkAWYYhbPMP+ICh+j0TbkMyX3s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HfDwFd+zHoT5Jj8ZGgmgoHp1v3hfIQ8/KX9qu9PyumVNC/JV0Sdv7jiOSGSuqWcXC
	 q8GIKLy6Q3ZwF+yNQtEUQgZN1gXaH5Mao5Whl4E/yPv+WXjwFgBhZUI1NNA/KG2VvU
	 1h8+DOrvkSRcIJdG5wMdDZu+F4A81x2Sd2DO6dEkG6V0xOu239uYgMwCdoFRwIyYf9
	 4swknVx3jWW+tVQTUHnVAP+Y+7eaZ/D1gXrtaEvJDLXSvkCQgQ1VPG4vPLBEdVurKJ
	 MgGwikfbhA6L7pdWbzlECR8EC0w73k6uOsyBTfsYrM3I3ID52UKb7lpuFVS8gGn1Hp
	 uqkUbCy2dU5Ug==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 95D4A37810CD;
	Thu, 27 Jun 2024 09:40:06 +0000 (UTC)
Message-ID: <f97c7ebc-4aad-4125-90df-21cd8a63c68d@collabora.com>
Date: Thu, 27 Jun 2024 11:40:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] PCI: mediatek-gen3: Add Airoha EN7581 support
To: Lorenzo Bianconi <lorenzo@kernel.org>, linux-pci@vger.kernel.org
Cc: ryder.lee@mediatek.com, jianjun.wang@mediatek.com, lpieralisi@kernel.org,
 kw@linux.com, robh@kernel.org, bhelgaas@google.com,
 linux-mediatek@lists.infradead.org, lorenzo.bianconi83@gmail.com,
 linux-arm-kernel@lists.infradead.org, krzysztof.kozlowski+dt@linaro.org,
 devicetree@vger.kernel.org, nbd@nbd.name, dd@embedd.com, upstream@airoha.com
References: <cover.1719475568.git.lorenzo@kernel.org>
 <b2c794b21e15ec85a57de144006db9582ce0c949.1719475568.git.lorenzo@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <b2c794b21e15ec85a57de144006db9582ce0c949.1719475568.git.lorenzo@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_104113_491082_6E756155 
X-CRM114-Status: GOOD (  13.57  )
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

Il 27/06/24 10:12, Lorenzo Bianconi ha scritto:
> Introduce support for Airoha EN7581 PCIe controller to mediatek-gen3
> PCIe controller driver.
> 
> Tested-by: Zhengping Zhang <zhengping.zhang@airoha.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>   drivers/pci/controller/Kconfig              |  2 +-
>   drivers/pci/controller/pcie-mediatek-gen3.c | 96 ++++++++++++++++++++-
>   2 files changed, 96 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/controller/Kconfig b/drivers/pci/controller/Kconfig
> index e534c02ee34f..3bd6c9430010 100644
> --- a/drivers/pci/controller/Kconfig
> +++ b/drivers/pci/controller/Kconfig
> @@ -196,7 +196,7 @@ config PCIE_MEDIATEK
>   
>   config PCIE_MEDIATEK_GEN3
>   	tristate "MediaTek Gen3 PCIe controller"
> -	depends on ARCH_MEDIATEK || COMPILE_TEST
> +	depends on ARCH_AIROHA || ARCH_MEDIATEK || COMPILE_TEST
>   	depends on PCI_MSI
>   	help
>   	  Adds support for PCIe Gen3 MAC controller for MediaTek SoCs.
> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
> index 438a5222d986..af567b4355fa 100644
> --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c

..snip..

> +
>   static const struct of_device_id mtk_pcie_of_match[] = {
>   	{ .compatible = "mediatek,mt8192-pcie", .data = &mtk_pcie_soc_mt8192 },
> +	{ .compatible = "airoha,en7581-pcie", .data = &mtk_pcie_soc_en7581 },

My bad, in the last review I didn't notice that the ordering here is not good.

A ... iroha comes before
M ... ediatek :-)

Please put the airoha entry before the mediatek one, after which:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

>   	{},
>   };
>   MODULE_DEVICE_TABLE(of, mtk_pcie_of_match);


