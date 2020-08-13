Return-Path: <SRS0=lgZq=BX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA507C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Aug 2020 13:57:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E4A520791
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Aug 2020 13:57:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O9ovtPJe";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DZc9ySxO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E4A520791
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4e0d+twIjyy+eJemNPDpV8/PNf16onphiqe/X6MN9u4=; b=O9ovtPJeyVwHiKrwZgRmtD1yY
	h+ps9yq4pQKRrlCjW5F8LdTfxHtnV8/eoR7sIdyfk2mWHovQAKxIAtSt/gEXB60vghKxFt7XrmuOP
	WNC2C+VzSKQc2X80XaYvi/t2mrTnoy/sXXpeaqPL2PIWuzv/AaOoEnQGphxSg9bx5nfXCsxOM11Qq
	hFr4dFhQYwC7E1/F+7acbJQDMQIF//I9SdCbFuz8mxlpNJ/cjZPFa90y+7gFCKfaDM61S3egYTQnH
	dF1CsdFsQhPK3L86zQeLif7vZl3+8c02S5AvKV2eo53KehkKasxoyB/t+eAfG+hkomM6aYv5Hsv5z
	7rR0BzhrQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k6DjC-0006a7-DM; Thu, 13 Aug 2020 13:57:10 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6DjA-0006Zh-Sf; Thu, 13 Aug 2020 13:57:09 +0000
Received: by mail-wm1-x344.google.com with SMTP id g8so4770984wmk.3;
 Thu, 13 Aug 2020 06:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZL42NDAwRyqFSgHd9+LPNZsn853QbpqMscEZvhiYWzM=;
 b=DZc9ySxOXmzqhLq8wmbQNIP8qC3GDOlMAZXwH7T9qCDObVYdxITsnlnU7bMMNL0I2v
 8lwS7+qRhmzNhfUwwC0kNFVA8VZtzhOKjDROTB3vtPBcNcTcYjxuoURPglFJn45b2mgn
 dnUGwPgc6LU4AEVPxf/jffEers4VwtF2ItE5gO9UUBy6QeE3kRF9mgP8QaLA6zi5aNj8
 qbn1Q9yNmgEcfilN2hl4qfiHdQKqYejDnn/EhxGdOJL6+bOTWQiKbknzYBcjQnLzS6Vp
 Q1q+E+nufJFqn8GO5egocKKELypeNx1wr8X2QMpEra5OR1Ndc0rUl/zoTuqIXLLdF5fN
 V51g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZL42NDAwRyqFSgHd9+LPNZsn853QbpqMscEZvhiYWzM=;
 b=rGSCU3h5DlJUFJYnTI5FcQTmHXXBe50PpuOR1pOmRgR9WkzoNwhGyoQDc9+2O3xHDo
 Hd99G0rPkMNMWrHRZJ9d8ok2vz/8X9HpjTJHtCxeW/D1wwbgDuGUy4ziICStI3cTbx5D
 fTX0gLKYeMrw077uu1i/TXSfsJGIZkvfBxKv4v8jYwtM1V6LUEJo8CSg4pi5/Euxum1P
 4PYl0WUERElviGEvXbcsQMVcwLKELEXrIoAl9moDcclBZaVlnFSlOK+3GBMXZEKUoP5l
 fwAKZdPs1U774JLkA0O+qow7DNzgOF7XsMRuN2SHsv9n0o/rDW4jUI3473kETn1AJhD9
 W4rA==
X-Gm-Message-State: AOAM531b2c2IAkyhxtASpmYd0MNbRL+d8cHR8b2IwBS46Xr0DBd2qmPi
 9fo1zCwRcUgLEsOHj25iARc=
X-Google-Smtp-Source: ABdhPJxZvSJM5CEE+rwyY2plMtVpFbesLgpk5SnfITkTmQSlBIrtVpTBoa601/n+g2520vvERC4vGw==
X-Received: by 2002:a1c:1b93:: with SMTP id b141mr4598606wmb.150.1597327027636; 
 Thu, 13 Aug 2020 06:57:07 -0700 (PDT)
Received: from ziggy.stardust ([213.195.117.232])
 by smtp.gmail.com with ESMTPSA id n11sm5016409wmi.15.2020.08.13.06.57.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Aug 2020 06:57:06 -0700 (PDT)
Subject: Re: [RESEND, v4,
 3/3] mmc: mediatek: add optional module reset property
To: Wenbin Mei <wenbin.mei@mediatek.com>, Ulf Hansson
 <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>
References: <20200813093811.28606-1-wenbin.mei@mediatek.com>
 <20200813093811.28606-4-wenbin.mei@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <7337a174-169d-2dd1-ed91-f05291d4f3a6@gmail.com>
Date: Thu, 13 Aug 2020 15:57:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200813093811.28606-4-wenbin.mei@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200813_095708_946252_BE72E8A0 
X-CRM114-Status: GOOD (  24.55  )
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
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 13/08/2020 11:38, Wenbin Mei wrote:
> This patch fixs eMMC-Access on mt7622/Bpi-64.
> Before we got these Errors on mounting eMMC ion R64:
> [   48.664925] blk_update_request: I/O error, dev mmcblk0, sector 204800 op 0x1:(WRITE)
> flags 0x800 phys_seg 1 prio class 0
> [   48.676019] Buffer I/O error on dev mmcblk0p1, logical block 0, lost sync page write
> 
> This patch adds a optional reset management for msdc.
> Sometimes the bootloader does not bring msdc register
> to default state, so need reset the msdc controller.
> 
> Cc: <stable@vger.kernel.org> # v5.4+
> Fixes: 966580ad236e ("mmc: mediatek: add support for MT7622 SoC")
> Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>
> Tested-by: Frank Wunderlich <frank-w@public-files.de>

I think you missed to add Philipp Zabels Reviewed-by tag.

Regards,
Matthias


> ---
>   drivers/mmc/host/mtk-sd.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index 39e7fc54c438..fc97d5bf3a20 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -22,6 +22,7 @@
>   #include <linux/slab.h>
>   #include <linux/spinlock.h>
>   #include <linux/interrupt.h>
> +#include <linux/reset.h>
>   
>   #include <linux/mmc/card.h>
>   #include <linux/mmc/core.h>
> @@ -434,6 +435,7 @@ struct msdc_host {
>   	struct msdc_save_para save_para; /* used when gate HCLK */
>   	struct msdc_tune_para def_tune_para; /* default tune setting */
>   	struct msdc_tune_para saved_tune_para; /* tune result of CMD21/CMD19 */
> +	struct reset_control *reset;
>   };
>   
>   static const struct mtk_mmc_compatible mt8135_compat = {
> @@ -1516,6 +1518,12 @@ static void msdc_init_hw(struct msdc_host *host)
>   	u32 val;
>   	u32 tune_reg = host->dev_comp->pad_tune_reg;
>   
> +	if (host->reset) {
> +		reset_control_assert(host->reset);
> +		usleep_range(10, 50);
> +		reset_control_deassert(host->reset);
> +	}
> +
>   	/* Configure to MMC/SD mode, clock free running */
>   	sdr_set_bits(host->base + MSDC_CFG, MSDC_CFG_MODE | MSDC_CFG_CKPDN);
>   
> @@ -2273,6 +2281,11 @@ static int msdc_drv_probe(struct platform_device *pdev)
>   	if (IS_ERR(host->src_clk_cg))
>   		host->src_clk_cg = NULL;
>   
> +	host->reset = devm_reset_control_get_optional_exclusive(&pdev->dev,
> +								"hrst");
> +	if (IS_ERR(host->reset))
> +		return PTR_ERR(host->reset);
> +
>   	host->irq = platform_get_irq(pdev, 0);
>   	if (host->irq < 0) {
>   		ret = -EINVAL;
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
