Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45897C04A68
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jul 2022 10:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tyX3aYDFsILjvjSe3x2SCTz64FH9Bw7z4DWRUub/3+I=; b=gMPAYTmEMx7R0quXAX9hXbWino
	XWjeNBjnnkQCuqeHcdsPfvNfGq1wH1ar1WPjzdAxbEvWhQJoldBmvB+0abH2ac5ahbxmhMhSdXLvV
	Plk9NkkDEXdeDZbObIstihV8KlFoTqccXaFDaivuGo9pIxYwqvy50jboFHYu7pO3gr6rxGhH3/C67
	7uNs++89Zb2eyg6rk5i/lUcZF8UFEPV7zY2L5xqCfofv36NuUaXazydlj6yoqg94PVSwjqP2btsC9
	IosBSA0fhjCePg5zdPNYb3F0DIcYVxwPQ6x1uzKW2stCHel2iHx/uFUDrMCl2rdFecQMu6pi0yt/H
	lZ7xX8GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oH17O-008VPB-G4; Thu, 28 Jul 2022 10:51:50 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oH17L-008VNs-Hy
	for linux-mediatek@lists.infradead.org; Thu, 28 Jul 2022 10:51:49 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id F25036601B41;
	Thu, 28 Jul 2022 11:51:45 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1659005506;
	bh=R6DrP5mpef+w1XUFgkLzJ6U/ghoD03zA8Xf+MFNAOAc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=O73i4vDmw3pkVFHoi2sCJzIHc90Z2PqAvwnwQU6y6MIDHezyqaqxaNaXEaoz7d42H
	 PcE7/+TcEbnr59TJ7f77zNp9WnMXONANeLrzZhhEtrZM6vBLxZsDYK6pia2JSg69eB
	 JQezS3cUHtJ+yt9bTSwn/JeqWNaEtDv+1YOu7QbB26KtowyQjzx+uuFtis0UkzI3yF
	 FYOz4hQiCIoHTThla09KbbwvUxhR4i4uAOwZ9sdHLfBuJTSRVVGCVcTvz9kbhIuTB1
	 U2YFdZaXSGEp1UualKor4uQhTeiq3+p5sXdOLmteMIie+iz1jaz6xWx2Yj5LowSfdo
	 A9Hz0795WCg7A==
Message-ID: <98eccbdd-3446-f44d-9278-79a4a60c1c18@collabora.com>
Date: Thu, 28 Jul 2022 12:51:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] soc: mediatek: Let PMIC Wrapper and SCPSYS depend on OF
Content-Language: en-US
To: Jean Delvare <jdelvare@suse.de>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, LKML <linux-kernel@vger.kernel.org>,
 Chenglin Xu <chenglin.xu@mediatek.com>
References: <20220728112216.13b10689@endymion.delvare>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220728112216.13b10689@endymion.delvare>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_035147_754034_D116B0AB 
X-CRM114-Status: GOOD (  17.32  )
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

Il 28/07/22 11:22, Jean Delvare ha scritto:
> With the following configuration options:
> CONFIG_OF is not set
> CONFIG_MTK_PMIC_WRAP=y
> CONFIG_MTK_SCPSYS=y
> we get the following build warnings:
> 
>    CC      drivers/soc/mediatek/mtk-pmic-wrap.o
> drivers/soc/mediatek/mtk-pmic-wrap.c:2138:34: warning: ‘of_pwrap_match_tbl’ defined but not used [-Wunused-const-variable=]
> drivers/soc/mediatek/mtk-pmic-wrap.c:1953:34: warning: ‘of_slave_match_tbl’ defined but not used [-Wunused-const-variable=]
>    CC      drivers/soc/mediatek/mtk-scpsys.o
> drivers/soc/mediatek/mtk-scpsys.c:1084:34: warning: ‘of_scpsys_match_tbl’ defined but not used [-Wunused-const-variable=]
> 
> Looking at the code, both drivers can only bind to OF-defined device
> nodes, so these drivers are useless without OF and should therefore
> depend on it.
> 

Hello Jean,

I would prefer that you solve this warning by removing of_match_ptr() from both
drivers instead.

Regards,
Angelo

> Developers or QA teams who wish to test-build the code can still do
> so by enabling CONFIG_OF, which is available on all architectures and
> has no dependencies.
> 
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Reported-by: kernel test robot <lkp@intel.com>
> Link: https://lore.kernel.org/all/202207240252.ZY5hSCNB-lkp@intel.com/
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: Chenglin Xu <chenglin.xu@mediatek.com>
> ---
>   drivers/soc/mediatek/Kconfig |    2 ++
>   1 file changed, 2 insertions(+)
> 
> --- linux-5.18.orig/drivers/soc/mediatek/Kconfig	2022-05-22 21:52:31.000000000 +0200
> +++ linux-5.18/drivers/soc/mediatek/Kconfig	2022-07-28 10:59:55.025131145 +0200
> @@ -37,6 +37,7 @@ config MTK_INFRACFG
>   config MTK_PMIC_WRAP
>   	tristate "MediaTek PMIC Wrapper Support"
>   	depends on RESET_CONTROLLER
> +	depends on OF
>   	select REGMAP
>   	help
>   	  Say yes here to add support for MediaTek PMIC Wrapper found
> @@ -46,6 +47,7 @@ config MTK_PMIC_WRAP
>   config MTK_SCPSYS
>   	bool "MediaTek SCPSYS Support"
>   	default ARCH_MEDIATEK
> +	depends on OF
>   	select REGMAP
>   	select MTK_INFRACFG
>   	select PM_GENERIC_DOMAINS if PM
> 


-- 

