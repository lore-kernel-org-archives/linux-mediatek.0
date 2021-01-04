Return-Path: <SRS0=ylaU=GH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1EB4C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jan 2021 07:31:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A66452087E
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jan 2021 07:31:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A66452087E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qDGQR2vtU+o14ARU/sT+CuYx1m9FmR0PdoWb4/WiSa4=; b=c51kMsak+d9YgJUzm12jnm3lu
	3GBTK3XXlUIQArsu1/d93VM1TBfwlqXFnTfC176FNaPWUtLvK103EGtGMnLoO4G1r8K1GU+nr8EFT
	7RKbpyON32Ou5X39DDBduFiPQqYBEpvuPVT6IDjoNJLibnJ0D9uQdtyPPng7XKbXlM0RikrJd5AET
	mt7ecec9FvySEzYJy/6D4TfbPySRYVqjA+Q6bJxbD1CD/+wOAG4Y/GA7WepqP8+2p0PIdJcGXcoMw
	hQ8N20CgSa4K3codFXjyrKZFV3VisDCurGnBFNkhAPJaVJ8Ib9YzAPK9ktNakVzbBNSXBpxsk0GqN
	vSPSpIUDg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwKKn-0001oD-Tt; Mon, 04 Jan 2021 07:31:22 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwKKh-0001mD-F8; Mon, 04 Jan 2021 07:31:16 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id CF6C720784;
 Mon,  4 Jan 2021 07:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609745473;
 bh=LGA++ysg+W0W0iCJjPTyOhYxG4L7+MlwveYCqYw2H6o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gEwZrPDEGMb65+h33sNBHdkVBY+jY4f2LwKq31M48z66uMQWyfMb5e77pHG+h1zUc
 vRGv7sAMgvQB5UFhitm8lGpixubGaic4LgaTMdpVlzSRPN4vAWBp0scWq8EFkt7sMI
 HVsh2GVtaN1LblFvzvxyWKbMLepmtbfvfJqKsExgqAYqzrri5VwEHOWrSrrnqJT8VS
 evM2RIAcLvUo89VEDm8V28UsLIFB5HDQSkICDknZo7dncWNeTjK1Q8GrjYQLklH8i2
 j/eM02+yYavMsmLva10zJYgCvEJh1J2KOc0oXcdNb13M2MTanDOWbbW9JYfdqfPAe7
 BHRXp6l4u8Mqg==
Date: Mon, 4 Jan 2021 13:01:09 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] phy: mediatek: allow compile-testing the dsi phy
Message-ID: <20210104073109.GF120946@vkoul-mobl>
References: <20210103135524.3678664-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210103135524.3678664-1-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210104_023115_612840_BBD9202B 
X-CRM114-Status: GOOD (  17.64  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, CK Hu <ck.hu@mediatek.com>,
 linux-mediatek@lists.infradead.org, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Colin Ian King <colin.king@canonical.com>,
 Tiezhu Yang <yangtiezhu@loongson.cn>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 03-01-21, 14:55, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Randconfig builds show another broken dependency:
> 
> WARNING: unmet direct dependencies detected for PHY_MTK_MIPI_DSI
>   Depends on [n]: ARCH_MEDIATEK [=n] && OF [=y]
>   Selected by [m]:
>   - DRM_MEDIATEK [=m] && HAS_IOMEM [=y] && DRM [=m] && (ARCH_MEDIATEK [=n] || ARM [=y] && COMPILE_TEST [=y]) && COMMON_CLK [=y] &&
> HAVE_ARM_SMCCC [=y] && OF [=y] && MTK_MMSYS [=y]
> 
> This is similar to the hdmi driver I fixed earlier, and I guess the
> common-clk bug would sooner or later also manifest here, so just use
> the exact same solution I chose for the other driver, and hope that
> any future drivers just copy it from here.

Applied, thanks

> 
> Fixes: 90f80d95992f ("phy: mediatek: Move mtk_mipi_dsi_phy driver into drivers/phy/mediatek folder")
> Fixes: f5f6e01f9164 ("phy: mediatek: allow compile-testing the hdmi phy")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/phy/mediatek/Kconfig | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/mediatek/Kconfig b/drivers/phy/mediatek/Kconfig
> index d38def43b1bf..55f8e6c048ab 100644
> --- a/drivers/phy/mediatek/Kconfig
> +++ b/drivers/phy/mediatek/Kconfig
> @@ -49,7 +49,9 @@ config PHY_MTK_HDMI
>  
>  config PHY_MTK_MIPI_DSI
>  	tristate "MediaTek MIPI-DSI Driver"
> -	depends on ARCH_MEDIATEK && OF
> +	depends on ARCH_MEDIATEK || COMPILE_TEST
> +	depends on COMMON_CLK
> +	depends on OF
>  	select GENERIC_PHY
>  	help
>  	  Support MIPI DSI for Mediatek SoCs.
> -- 
> 2.29.2

-- 
~Vinod

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
