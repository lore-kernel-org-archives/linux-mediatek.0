Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 718B5C6379F
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Feb 2023 19:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fx6Cy3cfwtLc2tIkcYv2b/6D80WxggLsKcXv+WH52kA=; b=m1HR03X9hiKlrPlHQ0KZrHTFyw
	kEE62hoAj2jpZ/Ipt0gzf9oY+Fm8HihIeM4AQqfVc03iA6bY/tR3EIT1WeoxCL/P2VKTy8RGCjJNn
	a9YPbXbMbh/JEnw72rCUy7zdOvn6eXnLgMtz/gK5raH8N1048CN1948yQYUAaNKjGhPJi1yI8O6Cz
	B1CaFFY94O07YELlv3fmDnj8cXbOWSTF0TvMEIwPghLf1guUx71Q/zCQ9iPQfJwr4u2HqWjjzmrcv
	I+kQFXaZEnoOVvvQ0497AXqv0CLb6fv3zEwjIPfZqy5CptglkK1lTWZru3jWXlcoKbrNmkJUXKKkU
	1VAknJmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUC5h-005OuJ-MX; Mon, 20 Feb 2023 19:44:49 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUC5e-005Osx-5I
	for linux-mediatek@lists.infradead.org; Mon, 20 Feb 2023 19:44:48 +0000
Received: by mail-wm1-x336.google.com with SMTP id bg28so1696015wmb.0
        for <linux-mediatek@lists.infradead.org>; Mon, 20 Feb 2023 11:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fx6Cy3cfwtLc2tIkcYv2b/6D80WxggLsKcXv+WH52kA=;
        b=Yzr32MycoFefeV/s5hGlruGe4mCnnO/LjwL2l8oZAJaeg9M+kOHt1A9JP6b1LjIyJi
         ZBD3GzBYVzqpXOzA3eq3W8nKGr2ZmAInCdp7lNPsuDhiFIj36DJQwsxsKpXid7dL/CrC
         q20SDqdEx6TDdM9x0EiMagmv4/BH/htFIVWRX+1T43WRniojzL/kkSmMdIMFFL5L3Zsi
         SBLziUP+GmnAbXFaUGfaERO3oS000f9I5alU8bLG13OlhF+YHbL+RHuY42AB711IPh5k
         2AUqcRNZ6kXtZcAB40EMv2yQGV/OiOpU97JgraWxzEGL+CSDxP+1SrMlSf4q2/vggpXy
         vXrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fx6Cy3cfwtLc2tIkcYv2b/6D80WxggLsKcXv+WH52kA=;
        b=XWxlLKkf9suEXYhHeDkyreabeoQEGrd5WRmbtzsoZfqSJk/aWuuWojVCo8bdOsB5It
         HrFpLXrVdJR1RsRE9VXw3/mAVwUpc6/JtPZi9sFpzh+g5Rl6Ct8lh0HKvzBH6m9tl0pr
         /xVAYzK3EAXSgyObceUusrOUJCb8eCC3Uv91Vfvt6P6qLEZOpKcl4fzKOMzfeElSA39R
         /XKlbSyP6svJiQS5XmlBUTQF8GYAmN6n/f1QGt7PJ9hsdLxIjVcVOp6kH69blxx+xWh7
         /fV3vYxjGhuHSSIuQ8QxZk/vGtn9kQIvTYLrVhr8PNdoascXYH7CrnxsBBfM/iuOJZOq
         jzeQ==
X-Gm-Message-State: AO0yUKVQNiiknh5qMweDJCoJlrVjGGQmjRusEESfuYAiVstSJlspOJC+
	R/8Tzj6CgZjbcBv8Ad7cpPqE7g==
X-Google-Smtp-Source: AK7set81wWp/nPh3uqn5YDsno1xkj3omzQM9DY1JIhAnX8EuPDIa6IJRQOWOHx81vBlsHWmBpa7Bkw==
X-Received: by 2002:a05:600c:4f44:b0:3e1:df8d:e022 with SMTP id m4-20020a05600c4f4400b003e1df8de022mr1754669wmq.9.1676922282285;
        Mon, 20 Feb 2023 11:44:42 -0800 (PST)
Received: from blmsp ([2001:4090:a247:8056:be7d:83e:a6a5:4659])
        by smtp.gmail.com with ESMTPSA id s10-20020a7bc38a000000b003dc1a525f22sm14871414wmj.25.2023.02.20.11.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 11:44:41 -0800 (PST)
Date: Mon, 20 Feb 2023 20:44:41 +0100
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Fabien Parent <parent.f@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Fabien Parent <fparent@baylibre.com>
Subject: Re: [PATCH 8/8] soc: mediatek: pm-domains: Add support for MT8365
Message-ID: <20230220194441.2564ct25qsxvvvic@blmsp>
References: <20230105170735.1637416-1-msp@baylibre.com>
 <20230105170735.1637416-9-msp@baylibre.com>
 <07a16be1-3f96-374c-3a9b-e3920bb4b437@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <07a16be1-3f96-374c-3a9b-e3920bb4b437@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_114446_208152_57B80AE1 
X-CRM114-Status: GOOD (  22.72  )
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

Hi Matthias,

On Fri, Feb 03, 2023 at 01:22:38PM +0100, Matthias Brugger wrote:
> 
> 
> On 05/01/2023 18:07, Markus Schneider-Pargmann wrote:
> > From: Fabien Parent <fparent@baylibre.com>
> > 
> > Add the needed board data to support MT8365 SoC.
> > 
> > Signed-off-by: Fabien Parent <fparent@baylibre.com>
> > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > ---
> >   drivers/soc/mediatek/mt8365-pm-domains.h | 147 +++++++++++++++++++++++
> >   drivers/soc/mediatek/mtk-pm-domains.c    |   5 +
> >   2 files changed, 152 insertions(+)
> >   create mode 100644 drivers/soc/mediatek/mt8365-pm-domains.h
> > 
> > diff --git a/drivers/soc/mediatek/mt8365-pm-domains.h b/drivers/soc/mediatek/mt8365-pm-domains.h
> > new file mode 100644
> > index 000000000000..8735e833b15b
> > --- /dev/null
> > +++ b/drivers/soc/mediatek/mt8365-pm-domains.h
> > @@ -0,0 +1,147 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +
> > +#ifndef __SOC_MEDIATEK_MT8365_PM_DOMAINS_H
> > +#define __SOC_MEDIATEK_MT8365_PM_DOMAINS_H
> > +
> > +#include "mtk-pm-domains.h"
> > +#include <dt-bindings/power/mediatek,mt8365-power.h>
> > +
> > +/*
> > + * MT8365 power domain support
> > + */
> > +
> > +static const struct scpsys_domain_data scpsys_domain_data_mt8365[] = {
> > +	[MT8365_POWER_DOMAIN_MM] = {
> > +		.name = "mm",
> > +		.sta_mask = PWR_STATUS_DISP,
> > +		.ctl_offs = 0x30c,
> > +		.pwr_sta_offs = 0x0180,
> > +		.pwr_sta2nd_offs = 0x0184,
> > +		.sram_pdn_bits = GENMASK(8, 8),
> > +		.sram_pdn_ack_bits = GENMASK(12, 12),
> > +		.caps = MTK_SCPD_STRICT_BUS_PROTECTION | MTK_SCPD_HAS_WAY_EN,
> > +		.bp_infracfg = {
> > +			BUS_PROT_WR(BIT(16) | BIT(17), 0x2a8, 0x2ac, 0x258),
> > +			BUS_PROT_WR(BIT(1) | BIT(2) | BIT(10) | BIT(11), 0x2a0, 0x2a4, 0x228),
> > +			BUS_PROT_WAY_EN(BIT(6), 0x200, BIT(24), 0x0),
> > +			BUS_PROT_WAY_EN(BIT(5), 0x234, BIT(14), 0x28),
> > +			BUS_PROT_WR(BIT(6), 0x2a0, 0x2a4, 0x228),
> 
> 
> BUS_PROT_WR(BIT(6), 0x2a0, 0x2a4, 0x228) repeates several times in the
> definition. Would it make sense to create a new define like we did with
> BUS_PROT_UPDATE_TOPAXI()? Are this offests are used in other SoCs.
> 
> In any case instead of magic numbers the values should be defined in
> include/linux/soc/mediatek/infracfg.h or appropiate header files.

Thanks, you are right, I got rid of all the magic numbers and introduced
some helper defines as well.

Thank you,
Markus

