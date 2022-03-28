Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28752C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Mar 2022 13:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2exsEgnJicVCfF2QRZAw5bU2EPU9fGMBedWV+QltbUI=; b=bkN9dmiDJ3lade
	s98AZGPm3Iw+lTchgXeK1slCmCefjGviuZqMdINQEpJKgpwTdsp4B6JvFDhld3nXi3j7sOf/VnPmi
	SnPFskvLvwIolLnWHawWa/O3osm5t9n89RIr+xCN0E2qsSx4qkWZAdI4kS9FVnmnS04+lbVJBZPQP
	yatuxoM5E/tlpNmLTQ4XzUB0nneEYnuw3aT+14lbBUrob5pJUWi7k8mTn35M4kTVYVpmx265o7RDI
	ck6fIXZxgSd/Dk0sZ1wEC6iQ3MwKIXJToJKM0R1Ahvq0fc8SlCrhJ/YYRIO2poHDQYe8teeaKi7xk
	/6ex/X2O8DSH2sV4Ftlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYptT-008yEQ-TY; Mon, 28 Mar 2022 13:58:51 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYppg-008wT7-Bv; Mon, 28 Mar 2022 13:54:57 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 856811F42AAD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1648475695;
 bh=93dA8FqYNp/Lt0Zjhk8lbR0S/JZ+vwD2obtfNGwvT9k=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=KQMS29eMxg8jrJxNMnr1l3jR2gpWeys+qwiBVvwG9sKokh3/MdoMaow+vqOBWlLNl
 B8gaYSG5RrP3uRI6NW/7fOSDseJNzgYymCvrythI8PxI6Sh91JEnzBOhWDLtzgSUZc
 9SJyLPFYulCwU+4cxVWr/j1zo+pWB61LilNV31K2ydtfj7rUZD/lc8mjWFYrbhDTl/
 rqWkXmci9gLpTG9e5ZcUUD4EI7jCMoz58/U1Moho+yuqdrecQDZSfeLrRI67cGW99c
 S2SawVjwMzea5rQeLqt8PQdO4jkfqy/zo3koFbfRyO9hDVbzTovLwfUEOMIYsSsF6Z
 EiDKJPsG0ibbA==
Message-ID: <a2421f17-fa0f-bc8c-f55d-9526ed844998@collabora.com>
Date: Mon, 28 Mar 2022 15:54:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] PCI: mediatek: Update entries to distinguish MediaTek
 PCIe controller
Content-Language: en-US
To: Jianjun Wang <jianjun.wang@mediatek.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Rob Herring
 <robh@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
 Bjorn Helgaas <bhelgaas@google.com>
Cc: Ryder Lee <ryder.lee@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20220326032708.3626-1-jianjun.wang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220326032708.3626-1-jianjun.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220328_065456_595615_DFFDBD8B 
X-CRM114-Status: GOOD (  18.97  )
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

Il 26/03/22 04:27, Jianjun Wang ha scritto:
> Add model numbers in Kconfig and update driver name in
> pcie-mediatek-gen3.c to distinguish the MediaTek PCIe controllers.
> 
> Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> ---
>   drivers/pci/controller/Kconfig              | 11 +++++++----
>   drivers/pci/controller/pcie-mediatek-gen3.c | 12 ++++++------
>   2 files changed, 13 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/pci/controller/Kconfig b/drivers/pci/controller/Kconfig
> index 601f2531ee91..dd7a2caf8da9 100644
> --- a/drivers/pci/controller/Kconfig
> +++ b/drivers/pci/controller/Kconfig
> @@ -237,8 +237,11 @@ config PCIE_MEDIATEK
>   	depends on OF
>   	depends on PCI_MSI_IRQ_DOMAIN
>   	help
> -	  Say Y here if you want to enable PCIe controller support on
> -	  MediaTek SoCs.
> +	  Adds support for PCIe MAC controller for MediaTek SoCs.
> +
> +	  The following SoCs are supported for this PCIe controller:
> +	  MT2701 and MT7623 with no MSI supported.
> +	  MT2712, MT7622 and MT7629 support up to 32 MSI interrupt numbers.
>   
>   config PCIE_MEDIATEK_GEN3
>   	tristate "MediaTek Gen3 PCIe controller"
> @@ -250,8 +253,8 @@ config PCIE_MEDIATEK_GEN3
>   	  and support up to 256 MSI interrupt numbers for
>   	  multi-function devices.
>   
> -	  Say Y here if you want to enable Gen3 PCIe controller support on
> -	  MediaTek SoCs.
> +	  The following SoCs are supported for this PCIe controller:
> +	  MT8192 and MT8195.

I agree with the pcie-mediatek-gen3 naming change, it's good to differentiate,
but I don't think that updating the Kconfig description is a good idea.

Everyone can get the list of supported SoCs by reading the dt-bindings for these
drivers, so it's unnecessary to make a list of SoCs in Kconfig... this is also
to avoid updating these entries everytime support for a new chip is added to the
gen3 (or the other) driver.

If nobody opposes to my proposal - please drop that description change.

Regards,
Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
