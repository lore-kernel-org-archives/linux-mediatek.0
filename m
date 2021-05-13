Return-Path: <SRS0=rIjB=KI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF87AC433B4
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 May 2021 15:23:31 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61C87613B5
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 May 2021 15:23:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61C87613B5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yk5U9UKkRsKg9dIB9qX1OXY47+i5NH+8LW0WRyRLAhc=; b=H4+Z1ldNfT9g1DZQGrTvVTmGi
	m4T+7sM0WBC56Cs5/sW85WzvdiDCL6sguKy+xnjUZmeMwsmZYOa8MsHonSu8v/aW2CFAYPOOfriwt
	je63kUmn8mjdpXq7+K0l1zK851ycYR6fsWQxvw5l8BJYVoS9X/b8cuZakULhat0lRcAbQ+Sm7opun
	EERjclW/GzF2DqCabQpH7z9tcI9MAKyxYNOn0AfQBhXz0Pn/DfJuIUrEoaPPk5WwbxKqcqQui9x+S
	6dLxtsBF6vdFfp/74eMskNeepMwbeHz+Zs1BDIOKggBevcH5V/qDeRbaOtFC+09mfYuTjB12tfB7u
	lsrvFdFHg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lhDBE-005rH6-9S; Thu, 13 May 2021 15:23:16 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhDBA-005rGH-Hx
 for linux-mediatek@desiato.infradead.org; Thu, 13 May 2021 15:23:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=sUR72DN9QdDZD7euHanPKYl0hI658xAmnecCL3Vfxqo=; b=mrFN9/e7nATg06Y0NekqiYCIXr
 4081WFh8V1qLsvkTktdwUHFHP6DhXtr7pjaiHIzPSDe7s4PiIxs691Sv8GT11pnbXA0gc59oprNfe
 Sex8tfncwxWzwr/A5QJ7GXGdAneLH+udSQQI+H31gQHkiVA9QquDkFNEF9d+TQmWoMhcKwlRpi56E
 FnBglO879/C/U8wjC20lacgEPjH7CDB+nmeB1JUvw9w4ab+ksXDKvx+dqHJSA0jg43Pnk1SQZp6pS
 /8tpP8Tlr+pUkV3zo/nQ2buhtUrL54aUJBGAEh9ZswakDi6FfDbHEk+1AoexEljE7UCak6CEjbAXW
 mWz56PAg==;
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhDB8-00BLz4-2Y
 for linux-mediatek@lists.infradead.org; Thu, 13 May 2021 15:23:11 +0000
Received: by mail-qt1-x836.google.com with SMTP id v4so11178792qtp.1
 for <linux-mediatek@lists.infradead.org>; Thu, 13 May 2021 08:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=sUR72DN9QdDZD7euHanPKYl0hI658xAmnecCL3Vfxqo=;
 b=T2HZlG/RgbQbpbLycYFEcG52OAKj1scqcAB3hH+4IDDene4VvaK/2vq1ldXLrDWT49
 PJMTFF2ewqpiLppSyV+NVwZgYD6v0uF6to5IG9moZvctCKckubTGCA9j2jQFqEt8INBP
 pbcRhsuPevWL6oSs2ZU8h5YwjMpuGAnpAq3mI321hqk5OXtLuGU1t0/8JGgoqOAAk5Ir
 zTaj6CYp30d93+FSudyKjoKHEVHtu8/LZ73duN3gvKO4tmbhSei6oJESWZKbfKLbignI
 VK3teLLeQeJMTKhtUFnLmyG8PQbNOmKTtT2/2rvEYT4mx0Z75CqPtT8IXL10YOfv1rIs
 jSCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=sUR72DN9QdDZD7euHanPKYl0hI658xAmnecCL3Vfxqo=;
 b=lGdgb3f0tBMKU5ULjYgpnGqWXL0xgQt3ObxLVtaAweTGIngsc90Je0WtYjjp+R+neM
 e+hJp0qXx+AYxs62HcDIPKuKjiGRDNgN0P9C6D12v5vbCzlb03siVsYdJdDV3U3klN6N
 D0tngz2+eBo5OYbDQi00uuMmZ/IPUKy02NiOzunRpBxE/Tv//eOg+RQUsBXL015L5ZNB
 mkyCDqkP7H1tAEnTbf4hEx8XrcryATSpHub9ubGO1rfMWRLZ57XFlRO3v+f6Bc87z2SJ
 AvmUQG4wzLy+F6fCpvah76o1OwOFwlQHjThgkCuQoE1CqCHzr/q7z0rz0tEii3clY2Q8
 hyVg==
X-Gm-Message-State: AOAM533vuDL2L95ilkWjHY7PPX6O6wcBBI5WCsNQzEn6yD6jraicurvZ
 9DCDRzAtSNBbUnhtnxPg9qI=
X-Google-Smtp-Source: ABdhPJx6QS/FlZpNS8dD7PeuIuQmC5NvmCFeggOL4iSN2CTxn0q+yLrJzL3PdWrFIvZpNt07Uofy7A==
X-Received: by 2002:ac8:4049:: with SMTP id j9mr39290033qtl.79.1620919388936; 
 Thu, 13 May 2021 08:23:08 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id u3sm2530042qtg.16.2021.05.13.08.23.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 08:23:08 -0700 (PDT)
Date: Thu, 13 May 2021 08:23:07 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Boris Lysov <arzamas-16@mail.ee>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 3/3] watchdog: mtk_wdt: add support for mt6577
Message-ID: <20210513152307.GC3452915@roeck-us.net>
References: <20210513013515.31329-1-arzamas-16@mail.ee>
 <20210513013515.31329-4-arzamas-16@mail.ee>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210513013515.31329-4-arzamas-16@mail.ee>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210513_082310_145241_FA2352EA 
X-CRM114-Status: GOOD (  18.09  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, May 13, 2021 at 04:35:15AM +0300, Boris Lysov wrote:
> This patch adds support for watchdog used by mt6577 and related SoCs such
> as mt6575 and mt8317. These watchdogs are known for having shifted WDT_MODE
> and SWSYSRST registers and using different SWSYSRST_KEY value.
> 
> Signed-off-by: Boris Lysov <arzamas-16@mail.ee>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/mtk_wdt.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
> index 0878fa33dffe..91d498b5d212 100644
> --- a/drivers/watchdog/mtk_wdt.c
> +++ b/drivers/watchdog/mtk_wdt.c
> @@ -54,6 +54,10 @@
>  #define MT2712_SWSYSRST_KEY_SHIFT	24		// unlock_key [31:24]
>  #define MT2712_SWSYSRST_KEY		0x88
>  
> +#define MT6577_WDT_MODE_KEY_SHIFT	8		// unlock_key [15:8]
> +#define MT6577_SWSYSRST_KEY_SHIFT	8		// unlock_key [15:8]
> +#define MT6577_SWSYSRST_KEY		0x15
> +
>  #define MT6589_WDT_MODE_KEY_SHIFT	24		// unlock_key [31:24]
>  #define MT6589_SWSYSRST_KEY_SHIFT	24		// unlock_key [31:24]
>  #define MT6589_SWSYSRST_KEY		0x88
> @@ -94,6 +98,13 @@ static const struct mtk_wdt_data mt2712_data = {
>  	.wdt_swsys_rst_key =		MT2712_SWSYSRST_KEY,
>  };
>  
> +static const struct mtk_wdt_data mt6577_data = {
> +	.toprgu_sw_rst_num =		-1,
> +	.wdt_mode_key_shift =		MT6577_WDT_MODE_KEY_SHIFT,
> +	.wdt_swsys_rst_key_shift =	MT6577_SWSYSRST_KEY_SHIFT,
> +	.wdt_swsys_rst_key =		MT6577_SWSYSRST_KEY,
> +};
> +
>  static const struct mtk_wdt_data mt6589_data = {
>  	.toprgu_sw_rst_num =		-1,
>  	.wdt_mode_key_shift =		MT6589_WDT_MODE_KEY_SHIFT,
> @@ -376,6 +387,7 @@ static int mtk_wdt_resume(struct device *dev)
>  
>  static const struct of_device_id mtk_wdt_dt_ids[] = {
>  	{ .compatible = "mediatek,mt2712-wdt", .data = &mt2712_data },
> +	{ .compatible = "mediatek,mt6577-wdt", .data = &mt6577_data },
>  	{ .compatible = "mediatek,mt6589-wdt", .data = &mt6589_data },
>  	{ .compatible = "mediatek,mt8183-wdt", .data = &mt8183_data },
>  	{ .compatible = "mediatek,mt8192-wdt", .data = &mt8192_data },
> -- 
> 2.20.1
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
