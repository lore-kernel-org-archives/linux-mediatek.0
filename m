Return-Path: <SRS0=3jAl=FB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D56BC2D0E4
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2020 05:58:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 726F9221EB
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2020 05:58:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CHxE4jnU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="abqYXwa5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 726F9221EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tD50ZRCrN3E07+k/IIm/k5T+xQzz9g+tvy/Z+AeVvEk=; b=CHxE4jnU4uQTAyJenzcUtJz5s
	ahm/OqQ9B1H9evi43gp59dCDSY6MBxJ90goBusNxl1umrhwAD/HrR7RfuBSDXaoFqjyP2MvorxWqu
	hV5u0AnQUlD11N5ltCff18+GAqAm16lDV3iO7D9uMTCqWxI1c5vdh5rKmJuB4yErCR/+YJSboLslI
	BYexAsteJvtCCqEb/swkYF0IBCoDx2uQFTJsIQ5ApLLAEBs0DcU8wAu0xdZzBOaeUgOtupvVFSeJa
	bZTZ/S8OrBkRif0ng963p0/2IUaDI6Lu4s/IBhD9oAK+Cvq4fjnfgEmGFw6ChNvwjZ/E7JrNtkxHz
	xFVGwciNA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiWmF-0008Pr-7W; Fri, 27 Nov 2020 05:58:39 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiWmA-0008OI-Q8; Fri, 27 Nov 2020 05:58:35 +0000
X-UUID: 803454a51f2d4787b7db3a2970c98d83-20201126
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=VV/UVxBer8cz/LL3HT1bG3fkm0bU1MCnYZbcXRXqx5g=; 
 b=abqYXwa5oSUmv/YH5Q2xOcqoc3nIqP4N73SJp60+hvJhiLJFzU3uGAhTIVVlc/c+T2RMd+nyZXPpzSPoZlp2ZRtNLb8iWg8HwEkDTmHieJY2F3U39oo6AjY+beCBFWd5jhvuSNRbWk+TZ4T3bfZwYj9FNI9JIneyaAEYdo2LdGI=;
X-UUID: 803454a51f2d4787b7db3a2970c98d83-20201126
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1207745045; Thu, 26 Nov 2020 21:58:21 -0800
Received: from MTKMBS32N2.mediatek.inc (172.27.4.72) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 26 Nov 2020 21:58:18 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS32N2.mediatek.inc
 (172.27.4.72) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 27 Nov 2020 13:58:15 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 27 Nov 2020 13:58:14 +0800
Message-ID: <1606456694.7284.13.camel@mhfsdcap03>
Subject: Re: [PATCH v2] phy: mediatek: Make PHY_MTK_{XSPHY,TPHY} depend on
 HAS_IOMEM and OF_ADDRESS to fix build errors
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Date: Fri, 27 Nov 2020 13:58:14 +0800
In-Reply-To: <1606289865-692-1-git-send-email-yangtiezhu@loongson.cn>
References: <1606289865-692-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: A1348FE1C622C32EE3BBD342ACC8DE129ED9659DFB7E737BC92FAEBB073FDC842000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_005835_235687_8BF92466 
X-CRM114-Status: GOOD (  21.83  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Heiko Stuebner <heiko@sntech.de>, Randy
 Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 linux-mediatek@lists.infradead.org, Xuefeng Li <lixuefeng@loongson.cn>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2020-11-25 at 15:37 +0800, Tiezhu Yang wrote:
> devm_ioremap_resource() will be not built in lib/devres.c if
> CONFIG_HAS_IOMEM is not set, of_address_to_resource() will be
> not built in drivers/of/address.c if CONFIG_OF_ADDRESS is not
> set, and then there exists two build errors about undefined
> reference to "devm_ioremap_resource" and "of_address_to_resource"
> in phy-mtk-xsphy.c under COMPILE_TEST and CONFIG_PHY_MTK_XSPHY,
> make PHY_MTK_XSPHY depend on HAS_IOMEM and OF_ADDRESS to fix it.
> 
> The above issue is reported by kernel test robot <lkp@intel.com>,
> through the discussion in the v1 patch, as Chunfeng said we need
> also do this for config PHY_MTK_TPHY:
> 
> drivers/phy/mediatek/phy-mtk-tphy.c:1157:		retval = of_address_to_resource(child_np, 0, &res);
> drivers/phy/mediatek/phy-mtk-tphy.c:1123:		tphy->sif_base = devm_ioremap_resource(dev, sif_res);
> drivers/phy/mediatek/phy-mtk-tphy.c:1164:		instance->port_base = devm_ioremap_resource(&phy->dev, &res);
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> Acked-by: Randy Dunlap <rdunlap@infradead.org>
> ---
The changes in v2 should be described after '---'

Except that, it looks good to me,
Acked-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Thanks a lot

>  drivers/phy/mediatek/Kconfig | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/phy/mediatek/Kconfig b/drivers/phy/mediatek/Kconfig
> index 50c5e93..f44800b 100644
> --- a/drivers/phy/mediatek/Kconfig
> +++ b/drivers/phy/mediatek/Kconfig
> @@ -5,7 +5,8 @@
>  config PHY_MTK_TPHY
>  	tristate "MediaTek T-PHY Driver"
>  	depends on ARCH_MEDIATEK || COMPILE_TEST
> -	depends on OF
> +	depends on OF && OF_ADDRESS
> +	depends on HAS_IOMEM
>  	select GENERIC_PHY
>  	help
>  	  Say 'Y' here to add support for MediaTek T-PHY driver,
> @@ -29,7 +30,8 @@ config PHY_MTK_UFS
>  config PHY_MTK_XSPHY
>  	tristate "MediaTek XS-PHY Driver"
>  	depends on ARCH_MEDIATEK || COMPILE_TEST
> -	depends on OF
> +	depends on OF && OF_ADDRESS
> +	depends on HAS_IOMEM
>  	select GENERIC_PHY
>  	help
>  	  Enable this to support the SuperSpeedPlus XS-PHY transceiver for

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
