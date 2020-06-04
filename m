Return-Path: <SRS0=aF3H=7R=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB8A5C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Jun 2020 15:06:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADF2D206DC
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Jun 2020 15:06:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Zdu0RdnV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ADF2D206DC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8IFKT7JT/i7jXo0IjF/TaSbgApaZ4jV4+y6EtOgR200=; b=Zdu0RdnVRok99C
	Z4E3uLYN5W8sb2oCOcqMWh8Nxgl6dBDP6I2N3SHPeXboylXPCNBRk1Kw3FGjQs0ynIG9aEqhjx2k4
	wS890FMcqVCR1Y6QUxaVVXuqkfMCtpgsa+iVjUg6tJS9y4KnJOLOFfUM9ROsKBsX/HSc+DDT7z79e
	THYqXXsM+hzOv0Lh6BpBB93wbZlxiDAW/kaVbEmCwF5/7CfDfcQYVCIayse/rTumeEfrtB0EcRrdU
	UCjiNjxgmyknskIf036u8xe73F93KCIQWsia7uwKX+1jz/yRgnZR6ie/jhbkZsbYEPff3pKYH+iJ1
	syuUhBT8TYsjFkMsrkrA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jgrRj-0007sr-Od; Thu, 04 Jun 2020 15:06:19 +0000
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgrRh-0007rf-MW; Thu, 04 Jun 2020 15:06:17 +0000
Subject: Re: [PATCH] regulator: mt6360: Add support for MT6360 regulator
To: Gene Chen <gene.chen.richtek@gmail.com>, matthias.bgg@gmail.com
References: <1591254387-10304-1-git-send-email-gene.chen.richtek@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <4135d264-6758-301a-0f19-ba2f229301c3@infradead.org>
Date: Thu, 4 Jun 2020 08:06:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <1591254387-10304-1-git-send-email-gene.chen.richtek@gmail.com>
Content-Language: en-US
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
Cc: gene_chen@richtek.com, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 cy_huang@richtek.com, benjamin.chao@mediatek.com, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, Wilma.Wu@mediatek.com,
 linux-arm-kernel@lists.infradead.org, shufan_lee@richtek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 6/4/20 12:06 AM, Gene Chen wrote:
> diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
> index f4b72cb..05a3b14 100644
> --- a/drivers/regulator/Kconfig
> +++ b/drivers/regulator/Kconfig
> @@ -680,6 +680,16 @@ config REGULATOR_MT6358
>  	  This driver supports the control of different power rails of device
>  	  through regulator interface.
>  
> +config REGULATOR_MT6360
> +	tristate "MT6360 SubPMIC Regulator"
> +	depends on MFD_MT6360
> +	select CRC8
> +	help
> +	  Say Y here to enable MT6360 regulator support.
> +	  This is support MT6360 PMIC/LDO part include

	  This supports the MT6300 PMIC/LDO part, which includes

> +	  2-channel buck with Thermal Shutdown and Overlord Protection

	                              is that      Overload  ?
Yes, it could be Overlord.

> +	  6-channel High PSRR and Low Dropout LDO.
> +
>  config REGULATOR_MT6380
>  	tristate "MediaTek MT6380 PMIC"
>  	depends on MTK_PMIC_WRAP


-- 
~Randy


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
