Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD00DC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 09:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H1ErKlGlnsrF3NxO82VzhmOegAjhNE1aI12qke4DB30=; b=Z/D5GdXadxYszC
	lATuYhdBSUQKPoGGO3nvdY3Tqr35xaDes2Rrg/y5LqO4iZMeiHM06+wmcdFgYz4fbO7KApdeclib4
	NFDdRy2IuSnBDzojzWJ41Jn38ZzZcSWHMc1aTsWrj/wdVODDZhuQWgzigfzWZS45dgxQBx83EoZtW
	wDeNyzCB0/6sb9p+k4kFIYVwYe5iAztR5uXkXJe5T9voLlRYRmWV+6ypx4jIccjNdikOEVt55bpZg
	aLaLhPdH7RjomtbX9QGzgCkEK/sI6ei7lf1AQxaasE+5swUOHGmvn5DtAYqyjy+zO0FYrvwvou85A
	NpwoMd1MIkG3+U76Tftw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt40C-002gfT-51; Mon, 23 May 2022 09:05:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt2qy-002AAA-Hu; Mon, 23 May 2022 07:51:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=xApiqltHmk4fyXwXr+XV2jx+tTOQK7lfXdQNYlo3OWA=; b=hI4jIh3HZW0w7tQDBPQKxWSh0t
 bIRU/DNcRGUXKUJMb0EwAcCdktuLHtMpscAKdaY7npMX2DUYbRdlPcDIlsXs7YA8E0tciTWtkXBwD
 5Unp87A8UbzvbzjqD3GJlMNN12euZulQ62dqvLLFVVfUC0rPgpyrl8kabHgX3exrdQokOMybipUBP
 frxhu2IYgP/UwKgCirPCMxtI9zCRV95WOQtjtzMLWUFZKk2r6HNto/AR/P8VjkhNxLoX3akdwSquz
 dCWcJLunMmH1rkG7x6YES+hJJdKmNQavmaHYxE5y8W0bVNXKk9MTnVtXo1L2ptel9K4OSXRsx+q0r
 s4zoY7tA==;
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nsznX-000p5p-Fl; Mon, 23 May 2022 04:36:06 +0000
Received: by mail-pl1-x632.google.com with SMTP id d22so12011517plr.9;
 Sun, 22 May 2022 21:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=xApiqltHmk4fyXwXr+XV2jx+tTOQK7lfXdQNYlo3OWA=;
 b=dKORMaWHU6VYYZHO/QN/983RYf7FOcdoNBoBChVvfewXi6kGWiFALeOPl4pyCTeDyn
 wDGcce/hVH15VJhJFl4sK8gqtQD78GtlHrgEbdQOo7FYmAzl0LwaUQpJQmBzX3/YIZ1q
 luprMRGI8MhJmIqF+cl8sjzMFIlWA8zIoixeaiFC731EC1Hhxl0vlgF0ojZiphrXDb8k
 7XcOwkce2iFlxiJow/KOK8LjMLmfOOJG4pdon+VmJJO5TYhsXfuY3ETKZiKN7EB1FVRV
 jrTSwY8pWH+D8f/Kp+9nkOXAJxiMqx/qcuLCxZFVsbjbE8aHJXpbeG/r4jQZp/9Ry4R7
 Z5mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xApiqltHmk4fyXwXr+XV2jx+tTOQK7lfXdQNYlo3OWA=;
 b=wL19giZsk0fUWa/egCyGeYG5DSYzhmDYpphmISMGKZfflVIcVDnPG9S0YosGjNiT9E
 8LakIrKlG3iYBnIEgG8/bz0M1bKoXzSJsm7jWROQtxzdeHk4uLWbmejp4Gvaz3p3qnhW
 oqOVOm2DfXZ3es0VnrUrUG4jXxaluICEG3nNhws1TXIFIDlehK7GMpdpOwBvh5NKMSSV
 3K47zAS3ObPx2pUDhGydGsoUHvIQAJ3gYnfEGaYTXbjSw+Lp3e4d/gUmrOfAVXmqOjdx
 PB1eM+VPefidZkHnprGFMUy8ztn3ytKodcA6ouUk/K9tPFLH90nvpJ5yqvWNTpr3LZHc
 GiQQ==
X-Gm-Message-State: AOAM533k0bg/lx0EX4gPIwfrxMSsPekHr+4QzL3yoGAWAQt/2z9pNAlP
 hWYdVCntpEgrrazgK/3oXzrKZ3bwgPo=
X-Google-Smtp-Source: ABdhPJyaSrK2SdCAtH5n8v0I1+G03otcxlmwvNPisgzXUjAUYDWrroszN1RpvQvnxVOf3DRs6hUm4w==
X-Received: by 2002:a17:902:ef43:b0:156:9c5d:b0fe with SMTP id
 e3-20020a170902ef4300b001569c5db0femr21193813plx.158.1653280437721; 
 Sun, 22 May 2022 21:33:57 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:d84e:5dcd:9d68:ebbf])
 by smtp.gmail.com with ESMTPSA id
 bi10-20020a170902bf0a00b001621a1ef9c7sm1977254plb.137.2022.05.22.21.33.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 May 2022 21:33:56 -0700 (PDT)
Date: Sun, 22 May 2022 21:33:54 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, mkorpershoek@baylibre.com,
 linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] Input: mtk-pmic-keys - Add kerneldoc to driver
 structures
Message-ID: <YosOsgPwMGuLk9dv@google.com>
References: <20220520125132.229191-1-angelogioacchino.delregno@collabora.com>
 <20220520125132.229191-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220520125132.229191-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_053603_795749_0899D9BD 
X-CRM114-Status: GOOD (  24.62  )
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

Hi AngeloGioacchino,

On Fri, May 20, 2022 at 02:51:28PM +0200, AngeloGioacchino Del Regno wrote:
> To enhance human readability, add kerneldoc to all driver structs.

I am doubtful that this is useful. The reason is that I believe
kerneldoc format is only useful for documenting cross-subsystem APIs.
Kerneldoc for driver-private data and functions simply pollutes API
docs.

> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/input/keyboard/mtk-pmic-keys.c | 30 +++++++++++++++++++++++++-
>  1 file changed, 29 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
> index c31ab4368388..8e4fa7cd16e6 100644
> --- a/drivers/input/keyboard/mtk-pmic-keys.c
> +++ b/drivers/input/keyboard/mtk-pmic-keys.c
> @@ -34,6 +34,13 @@
>  #define MTK_PMIC_HOMEKEY_INDEX	1
>  #define MTK_PMIC_MAX_KEY_COUNT	2
>  
> +/**
> + * struct mtk_pmic_keys_regs - PMIC keys per-key registers
> + * @deb_reg:             Debounced key status register
> + * @deb_mask:            Bitmask of this key in status register
> + * @intsel_reg:          Interrupt selector register
> + * @intsel_mask:         Bitmask of this key in interrupt selector
> + */
>  struct mtk_pmic_keys_regs {
>  	u32 deb_reg;
>  	u32 deb_mask;
> @@ -50,6 +57,11 @@ struct mtk_pmic_keys_regs {
>  	.intsel_mask		= _intsel_mask,		\
>  }
>  
> +/**
> + * struct mtk_pmic_regs - PMIC Keys registers
> + * @keys_regs:           Specific key registers

This new description of the structure and of the keys_regs does not add
any information for me.

> + * @pmic_rst_reg:        PMIC Keys reset register
> + */
>  struct mtk_pmic_regs {
>  	const struct mtk_pmic_keys_regs keys_regs[MTK_PMIC_MAX_KEY_COUNT];
>  	u32 pmic_rst_reg;
> @@ -85,15 +97,31 @@ static const struct mtk_pmic_regs mt6358_regs = {
>  	.pmic_rst_reg = MT6358_TOP_RST_MISC,
>  };
>  
> +/**
> + * struct mtk_pmic_keys_info - PMIC Keys per-key params
> + * @keys:                Pointer to main driver structure

That is obvious from the field definition.

> + * @regs:                Register offsets/masks for this key

Ditto.

> + * @keycode:             Key code for this key

Yep.

> + * @irq:                 Keypress or press/release interrupt
> + * @irq_r:               Key release interrupt (optional)
> + * @wakeup:              Indicates whether to use this key as a wakeup source
> + */
>  struct mtk_pmic_keys_info {
>  	struct mtk_pmic_keys *keys;
>  	const struct mtk_pmic_keys_regs *regs;
>  	unsigned int keycode;
>  	int irq;
> -	int irq_r; /* optional: release irq if different */
> +	int irq_r;
>  	bool wakeup:1;
>  };
>  
> +/**
> + * struct mtk_pmic_keys - Main driver structure
> + * @input_dev:           Input device pointer

I do not find this helpful.

> + * @dev:                 Device pointer

And neither this.

> + * @regmap:              Regmap handle

Nor this.

> + * @keys:                Per-key parameters
> + */
>  struct mtk_pmic_keys {
>  	struct input_dev *input_dev;
>  	struct device *dev;
> -- 
> 2.35.1
> 

In the end we ended up with something that now has a chance of
introducing warning when someone changes code, for very little benefit,
if any at all.

For driver-private data and functions we should rely on expressive
variable and function names and only use comments for something that
might be unclear or requires additional qualification.

Thanks.

-- 
Dmitry

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
