Return-Path: <SRS0=yJvo=FI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEF8BC4361A
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Dec 2020 01:59:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30AED224F9
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Dec 2020 01:59:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30AED224F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mOYhIXmNiDYojK2LF+qEqOuTD2WUoY7lQdsEVpdAXzA=; b=ajiIVuPyd4TK447K7IZSbyN2V
	FvnGOm965XvLnHRSCa5ipAxOr3UQ6OBui994lUX2n0oftmhZJi/NmjPy0D8z+SSXj8iyelcAiHf3l
	/TEw9YYVFv+OpKoF2IK4m1s/K1sy7casQvEh/DvIT3sqKOjDYBqNInGHOjE8izqyD9vFEktDUaR5c
	u2aMEiKXVk67f3ZT+M3dnF0RpMUhFYvaIH8bRDwXZ5gfa0bUAyrvyY7igVsjrLivt5gp8akx3vGnJ
	L2LFU5RYvLDSEmrifUcHZzrOdjWSHCdCMzf6SrxwyF2uldCmNRvFZVE9v4BNPWc4n5F8LB1KxHPj5
	L2UXbP2Sw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kl0NF-0005jo-Du; Fri, 04 Dec 2020 01:59:05 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kl0NB-0005jJ-MP; Fri, 04 Dec 2020 01:59:04 +0000
X-UUID: 86ee7d8f9de84728b57d721936b9cb3a-20201203
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=JDygK9+MlAzqYjO/vOov/ICG+of3dViKIL//ICXqI+c=; 
 b=ZISH7iwdaGKul0mGgngyE8y6gio1Bwm2KXBv6OiHW38Sf9eGFLrKaH+MeuztTNfkWur7yGP7ZRir+2IEB38vo3qfNpK0K1BUh8esawEkaL/ous9/6jeL6FbTjg34ZHEYA6shlfAh+l5ZoBILX4CmnlhTyxH2mVKHKhvJoeHe9d4=;
X-UUID: 86ee7d8f9de84728b57d721936b9cb3a-20201203
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1286846522; Thu, 03 Dec 2020 17:52:44 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 3 Dec 2020 17:47:08 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs05n1.mediatek.inc
 (172.21.101.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 4 Dec 2020 09:47:05 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 4 Dec 2020 09:47:04 +0800
Message-ID: <1607046425.7284.17.camel@mhfsdcap03>
Subject: Re: [PATCH] phy: mediatek: allow compile-testing the hdmi phy
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 4 Dec 2020 09:47:05 +0800
In-Reply-To: <20201203225418.1477560-1-arnd@kernel.org>
References: <20201203225418.1477560-1-arnd@kernel.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_205902_593842_FFF4A795 
X-CRM114-Status: GOOD (  19.02  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, CK Hu <ck.hu@mediatek.com>,
 Vinod Koul <vkoul@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-12-03 at 23:54 +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Compile-testing the DRM_MEDIATEK_HDMI driver leads to a harmless
> warning:
> 
> WARNING: unmet direct dependencies detected for PHY_MTK_HDMI
>   Depends on [n]: ARCH_MEDIATEK [=n] && OF [=y]
>   Selected by [y]:
>   - DRM_MEDIATEK_HDMI [=y] && HAS_IOMEM [=y] && DRM_MEDIATEK [=y]
> 
> The driver builds fine, so allow compile-testing it as well
> to get rid of the warning.
> 
> Fixes: b28be59a2e26 ("phy: mediatek: Move mtk_hdmi_phy driver into drivers/phy/mediatek folder")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/phy/mediatek/Kconfig | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/mediatek/Kconfig b/drivers/phy/mediatek/Kconfig
> index 65ed26e40c9f..29a85b2738f8 100644
> --- a/drivers/phy/mediatek/Kconfig
> +++ b/drivers/phy/mediatek/Kconfig
> @@ -40,7 +40,9 @@ config PHY_MTK_XSPHY
>  
>  config PHY_MTK_HDMI
>  	tristate "MediaTek HDMI-PHY Driver"
> -	depends on ARCH_MEDIATEK && OF
> +	depends on ARCH_MEDIATEK || COMPILE_TEST
> +	depends on COMMON_CLK
Seems no need add COMMON_CLK here

> +	depends on OF
>  	select GENERIC_PHY
>  	help
>  	  Support HDMI PHY for Mediatek SoCs.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
