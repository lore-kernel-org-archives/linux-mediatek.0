Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60D04C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 May 2022 08:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jFZuJRDVdDpTYrUa+zHcBZ7WPBqSPqr89CFv4k+UM2A=; b=QHH8fzIDwG3Jem
	x8nK7oWHzsEzJ2gA2xDJZeBBLWT58J2czqN6Tjdxzflp83WUFuF7qZVWo0lvSnLHDUlERYIMcV5Oo
	tIUsom/1ynHI2S/E4hwtPg3fAc+UUDPBeFeffShH22dUl1HUqZ71c2jdBe1DCOSmCcG4qudMggM45
	Gh76XDKD/ilz2rVcpy9fQ3v7jlkrfvShLEZ0wROVeIN1yldtIBahgpvgtkjJKiIvN/igxlzpMcMpz
	STkvgoC5B1VcSsRut/1dToCAcon4GndcZJbGFyNOLk3mZlVBISxbC3AzDGET1BM0P8MbMZV3/gXfG
	dmYl2Rv+F++qQbDdEvjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmWq5-00Egj2-5o; Thu, 05 May 2022 08:27:57 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmWps-00EgaG-II; Thu, 05 May 2022 08:27:46 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 72C5A1F44D84
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651739262;
 bh=mFMc9Q2nDIQR0sOpjH1myPXm3e8CImboII/qXcWq5JU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=GMIp6mRlSS7KAQ8A9IVcFvFyA43EZx2MPS9THZM+iZp6wpQiki8+SaO1lrUujJzUm
 XFpVDRI7ZuxDVrblKkw9SzZ95TX7oitciWHideclbO2hu+2iPvKcv4hMOcQH9b2N+J
 d6erKHQJefc2MvAkjyyOIFrIuQ30TUY/10s7wUGPryG3A/8KmfGrgsWSHgsPLvv7Oe
 O1OQPK0t5Hv36s59X6fG1lbTmXe6VwCjL6iOiRFw/1+xhqqtegNSkEstE71eZCJBLK
 xv8Lx4XPlRt3ycvFmuvQ0IYO+VFDxQn4fDCysKSIwFF/UTu5OCkPMJDmA+PG/K3Ub1
 gn/ZBPqYeHCtQ==
Message-ID: <2d50b30d-ed3a-29db-266e-9e395e9e4c6a@collabora.com>
Date: Thu, 5 May 2022 10:27:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3] PCI: mediatek-gen3: Change driver name to mtk-pcie-gen3
Content-Language: en-US
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>,
 Jianjun Wang <jianjun.wang@mediatek.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Rob Herring
 <robh@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20220504172128.27489-1-nbd@nbd.name>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220504172128.27489-1-nbd@nbd.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_012744_785240_60EE67F5 
X-CRM114-Status: GOOD (  18.88  )
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

Il 04/05/22 19:21, Felix Fietkau ha scritto:
> driver_register() will refuse to register another driver with the same name.
> This change allows pcie-mediatek-gen3 to coexist with pcie-mediatek built into
> the kernel.
> 
> Signed-off-by: Felix Fietkau <nbd@nbd.name>
> ---
>   drivers/pci/controller/pcie-mediatek-gen3.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
> index 3e8d70bfabc6..2e665cd7e735 100644
> --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> @@ -1021,7 +1021,7 @@ static struct platform_driver mtk_pcie_driver = {
>   	.probe = mtk_pcie_probe,
>   	.remove = mtk_pcie_remove,
>   	.driver = {
> -		.name = "mtk-pcie",
> +		.name = "mtk-pcie-gen3",
>   		.of_match_table = mtk_pcie_of_match,
>   		.pm = &mtk_pcie_pm_ops,
>   	},
> 

Hello Felix,

this is a good fix - and being it a fix, this requires a Fixes: tag - which also
gets this scheduled for backporting, which is important to solve this issue on
all of the affected kernels.

I'll make it easy for you as I've already checked the commit hash:

Fixes: d3bf75b579b9 ("PCI: mediatek-gen3: Add MediaTek Gen3 driver for MT8192")


After adding that:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers,
Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
