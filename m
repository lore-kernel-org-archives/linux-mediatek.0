Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E06AC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Dec 2022 21:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:Subject:From:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uBqMDvRiGGhkCYxYq5PPq3wG/JUaSlNZRcvAZAXSPdM=; b=V41AuSUL/qWZClGiGyyCDrU9vR
	L3KXMnfzStdeVLiouCmwqw8sldGfN5xq4ofh6AU6935W0Lde6Gt3nzBC0qJmzlqxF1ZzSmo4tdb4r
	WBvtLe5aJCasHyPn2yGl/mOLnrcflUH4RAB+g+2Im1S2/TG9BPDhiGL0AiL1Byjg6X7Sgv/28YUj8
	uYtG6A0JSP7uQ28aTXdD4ol/WAxFshTWdY9ccAeAFThgEMmoW5iv7y9bRWR+zmKj8RKuA4YCO1hOe
	v7OaiOlj+zjuseU+EWkjyX8LqO8PYJn5uq+5soZD/Wo+qdYmGArzxZgDlwMr68MFsqfjsx1qVEaVW
	8rx/DTvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5ZO7-003DmR-1S; Wed, 14 Dec 2022 21:34:03 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5ZNu-003Dfb-CC; Wed, 14 Dec 2022 21:33:51 +0000
Received: by mail-ej1-x62b.google.com with SMTP id m18so47702328eji.5;
        Wed, 14 Dec 2022 13:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:content-language
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uBqMDvRiGGhkCYxYq5PPq3wG/JUaSlNZRcvAZAXSPdM=;
        b=JdhwQAzhZoLnb4FCFEijBaF8YLzOEb50ZdvsLWyejGEJ23QF4UUzRqdIjV1fJTmef6
         /+y0bg81YCyBVd1kxbaNNdzg7S9GGLHbCvnrmgcNJj8uaXqa9v6P0M68IfcJq+n3Ovm8
         Dlf1xNHUUn2cVcMoZpc2xGFPnWfD3kGoY7qGRvvkxmY3ILKDat+1P0jYMR1EvUP6+Qb7
         pgyYPCHgnIfxd6bBJhfXKyBRbDF2iBb4Ikq0yk08WNsY52F1iW/TNjdS/GTI2HO8VD4C
         LsPidJUNYBY5f8GqxKjQw8rVBz1zly5xW9EG5TjZDodzwGX5wBF1BsfS4mtw8rNj8T/k
         uH3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:content-language
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uBqMDvRiGGhkCYxYq5PPq3wG/JUaSlNZRcvAZAXSPdM=;
        b=ffN2sYdvkmvgxTTqyn+9DRkQdZuHLzTxIF/kTBBZgj6VFgyLEx2G6UjrJtYt6j6m2o
         kL02UZWyePBdrjJNVVwgNMjZGWn4dWOFTzPU1bjc45vRTDvCF2vDEp/9LDZZXC7p2/xn
         k1dT+u3dIxP/vDXvJ4Bt+M+e/oE9igEAMnH4aS85JbTlhMDaDqSIG2q7EKg9N/p6KavA
         FHH28H1lBQHDiM3eC0PVrE+M1iZCU/brd15GLrjEAM0cm/DSuqOfFgychvtqoXU4Q1Gj
         DEuEBbQRPeqyfsuuaRfGYzZvuAyAq6M9CMwS5IXUNWxZzJsadb1XGjSjFlqOp/J6GHql
         VwhQ==
X-Gm-Message-State: ANoB5plMOekq4nK2UxBi4gcfxngqQ2Z5kSO0ZZWoAJyjAuH/JW19K96w
	ErPlfIXq6am6OoGFbnsWtfk=
X-Google-Smtp-Source: AA0mqf5g7UcKoeKc2suF+JjVGelSelhQNVtMekeURSx6Qp8qcGsa2HYPL+cAsQAsquPDa6hXqGJb6g==
X-Received: by 2002:a17:906:274b:b0:7c1:7183:2d32 with SMTP id a11-20020a170906274b00b007c171832d32mr13082157ejd.56.1671053626819;
        Wed, 14 Dec 2022 13:33:46 -0800 (PST)
Received: from ?IPV6:2a01:c23:b8b1:2700:80c5:d7b3:aee5:57bf? (dynamic-2a01-0c23-b8b1-2700-80c5-d7b3-aee5-57bf.c23.pool.telefonica.de. [2a01:c23:b8b1:2700:80c5:d7b3:aee5:57bf])
        by smtp.googlemail.com with ESMTPSA id ko12-20020a170907986c00b00781be3e7badsm6308968ejc.53.2022.12.14.13.33.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Dec 2022 13:33:46 -0800 (PST)
Message-ID: <c6863a3e-8855-50fe-25cb-0b38bc3a05e0@gmail.com>
Date: Wed, 14 Dec 2022 22:33:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
To: Peter Suti <peter.suti@streamunlimited.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <52861a84-0fe2-37f0-d66a-145f2ebe1d79@gmail.com>
 <20221214134620.3028726-1-peter.suti@streamunlimited.com>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v3] mmc: meson-gx: fix SDIO interrupt handling
In-Reply-To: <20221214134620.3028726-1-peter.suti@streamunlimited.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221214_133350_469321_BB9FB4BA 
X-CRM114-Status: GOOD (  28.56  )
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

On 14.12.2022 14:46, Peter Suti wrote:
> With the interrupt support introduced in commit 066ecde sometimes the
> Marvell-8987 wifi chip got stuck using the marvell-sd-uapsta-8987
> vendor driver. The cause seems to be that after sending ack to all interrupts
> the IRQ_SDIO still happens, but it is ignored.
> 
> To work around this, recheck the IRQ_SDIO after meson_mmc_request_done().
> 
> Inspired by 9e2582e ("mmc: mediatek: fix SDIO irq issue") which used a
> similar fix to handle lost interrupts.
> 
The commit description of the referenced fix isn't clear with regard to
who's fault it is that an interrupt can be lost. I'd interpret it being
a silicon bug rather than a kernel/driver bug.
Not sure whether it's the case, but it's possible that both vendors use
at least parts of the same IP in the MMC block, and therefore the issue
pops up here too.

> Fixes: 066ecde ("mmc: meson-gx: add SDIO interrupt support")
> 
> Signed-off-by: Peter Suti <peter.suti@streamunlimited.com>
> ---
> Changes in v2:
> 	- use spin_lock instead of spin_lock_irqsave
> 	- only reenable interrupts if they were enabled already
> 
> Changes in v3:
> 	- Rework the patch based on feedback from Heiner Kallweit.
> 		The IRQ does not happen on 2 CPUs and the hard IRQ is not re-entrant.
> 		But still one SDIO IRQ is lost without this change.
> 		After the ack, reading the SD_EMMC_STATUS BIT(15) is set, but 
> 		meson_mmc_irq() is never called again.
> 
> 		The fix is similar to Mediatek msdc_recheck_sdio_irq().
> 		That platform also loses an IRQ in some cases it seems.
> 
>  drivers/mmc/host/meson-gx-mmc.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
> index 6e5ea0213b47..7d3ee2f9a7f6 100644
> --- a/drivers/mmc/host/meson-gx-mmc.c
> +++ b/drivers/mmc/host/meson-gx-mmc.c
> @@ -1023,6 +1023,22 @@ static irqreturn_t meson_mmc_irq(int irq, void *dev_id)
>  	if (ret == IRQ_HANDLED)
>  		meson_mmc_request_done(host->mmc, cmd->mrq);
>  
> +	/*
> +	* Sometimes after we ack all raised interrupts,
> +	* an IRQ_SDIO can still be pending, which can get lost.
> +	*

A reader may scratch his head here and wonder how the interrupt can get lost,
and why adding a workaround instead of eliminating the root cause for losing
the interrupt. If you can't provide an explanation why the root cause for
losing the interrupt can't be fixed, presumably you would have to say that
you're adding a workaround for a suspected silicon bug.

> +	* To prevent this, recheck the IRQ_SDIO here and schedule
> +	* it to be processed.
> +	*/
> +	raw_status = readl(host->regs + SD_EMMC_STATUS);
> +	status = raw_status & (IRQ_EN_MASK | IRQ_SDIO);

This isn't needed here. Why not simply:

status = readl(host->regs + SD_EMMC_STATUS);
if (status & IRQ_SDIO)
  ...


> +	if (status & IRQ_SDIO) {
> +		spin_lock(&host->lock);
> +		__meson_mmc_enable_sdio_irq(host->mmc, 0);
> +		sdio_signal_irq(host->mmc);
> +		spin_unlock(&host->lock);
> +	}
> +
>  	return ret;
>  }
>  


