Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA552C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 May 2022 05:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C5yJC0w1FIXqWyZjQPoJzHvT35CknQ4vwBmgFYiWfe0=; b=BOfplZnj6dbLgQ
	gU9h57yCJv4P4G9MQ8ABQ5Uc6eUqPeiCYZ1v7W+JMWb9VAZuqdCTFCBB+v+9wwQWtaiDrKVgJcS4n
	+aY04tiO4XwLFtHOYFiDfBQNAa8Gm34uEMkJTN0tWXxoWgyCBybpqlw/938OU2qac8hsavaXPu9TZ
	OZbskLAfwZCPjgqkQ9kHz6Us2A4tjmrFsOxTL/bYqYUubHNVDkPlFNkSu/zVVZd+8Rr2L/cWFIX2V
	/lC/xA7iKzDUGAviC/bIVa9CZzKPn6RYLTE9dOYl7AMr7iMX7CuDrKJQJP5KeiH3zLJ42s8Imynms
	FUNQTVRuN/dcdj+PAfHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqTD7-00617C-BA; Mon, 16 May 2022 05:24:01 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqTD4-00616P-MP; Mon, 16 May 2022 05:24:00 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 137so13079423pgb.5;
 Sun, 15 May 2022 22:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=6PufeeVIY6YSnadgeYG6zxOdddyECj0hpjiQUnd1/t4=;
 b=HXqji3771EgifHiGomNpniwrIU+ie9rPF52m3Bz4BQcn7sqCTp7S1iV+Y5kWMUlt3h
 7zmKbpBp8RzyOzLVM3nmTgVQHvzAj19rVzn3CG6Rat3aJb0MpWeOGvGWxc6FZIRcRp7n
 eFblSscpwDkQTdQ4RUtIFpemDca2zBXo51d0w96cjsykN10TuqFb07S+RZh4TxwGr3oY
 96Mv3wK92ijQRj294jEpoqzpb+AAgYv2mMGnDns47Bf2IUAZErK5CQpUcOxR0rCSzumi
 ms7j9FhBJdnmmHalv37s1T6nrDL/u2JmjpuIreZYqhoqulCuo7a6RwJV5voIaGTZBWAl
 ud3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6PufeeVIY6YSnadgeYG6zxOdddyECj0hpjiQUnd1/t4=;
 b=qRx08ceJAev5gDzLFa6nnR9obpv0CBmVoCLu4sou7Cj/qPZM94Lwv8jYdova616ROf
 ut2gpdaIbBbpot+tjOgECsftvT+TBXXZ+27DLeXk97rxsAkzk9RJ3Ek5uj75jSPyRPTz
 fMR7dBZtck3Ci+JrkXaxepsmqB73dpurtVWA+9+JAwD1OMiFO7zu2pOEQQGxp4R7Zy+C
 54Yx4r/tFEX/MJu0uIt9qSe341OEs9ISoB/t/A9kv62GZi0FhrWLWOX+LBicZkWi9FdF
 ewKq3l6mrjICYdpuWEFRy5ixk/6hYgQorI9OCARTtcq0wKqqGonqEjGSwTwfTNiuFhEu
 WImg==
X-Gm-Message-State: AOAM5320hcLS9PodCre0S9tifan3Ad/cD3BP05Nasng4i/mNhf2Y3a4D
 XWFatik/hhW8EnNAB3tsQ50=
X-Google-Smtp-Source: ABdhPJwDBnSEJgdLkGyJZBgruCIVaEPEvPbCPt3kcBKVapG9xK8NmPEHCF5GM3lkGMq6D5n5u9NRkg==
X-Received: by 2002:a62:1687:0:b0:50d:3364:46d4 with SMTP id
 129-20020a621687000000b0050d336446d4mr15786672pfw.74.1652678637338; 
 Sun, 15 May 2022 22:23:57 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:586d:4807:54a6:b6a0])
 by smtp.gmail.com with ESMTPSA id
 bb8-20020a170902bc8800b0015e8d4eb1d9sm5990342plb.35.2022.05.15.22.23.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 May 2022 22:23:56 -0700 (PDT)
Date: Sun, 15 May 2022 22:23:53 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Mattijs Korpershoek <mkorpershoek@baylibre.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Fabien Parent <fparent@baylibre.com>, linux-input@vger.kernel.org,
 linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH 1/2] Input: mt6779-keypad - fix hardware code
 mapping
Message-ID: <YoHf6Z4HTfh4Y+bn@google.com>
References: <20220513151845.2802795-1-mkorpershoek@baylibre.com>
 <20220513151845.2802795-2-mkorpershoek@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220513151845.2802795-2-mkorpershoek@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220515_222358_769504_09ED6807 
X-CRM114-Status: GOOD (  25.13  )
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

On Fri, May 13, 2022 at 05:18:44PM +0200, Mattijs Korpershoek wrote:
> In mt6779_keypad_irq_handler(), we
> 1. Read a hardware code from KPD_MEM1 -> KPD_MEM5
> 2. Use that hardware code to compute columns/rows for the standard
>    keyboard matrix.
> 
> According to the (non-public) datasheet, the
> map between the hardware code and the cols/rows is:
> 
>         |(0)  |(1)  |(2)
>     ----*-----*-----*-----
>         |     |     |
>         |(9)  |(10) |(11)
>     ----*-----*-----*-----
>         |     |     |
>         |(18) |(19) |(20)
>     ----*-----*-----*-----
>         |     |     |
> 
> This brings us to another formula:
> -> row = code / 9;
> -> col = code % 3;

What if there are more than 3 columns?

> 
> Implement this mapping in bitnr_to_col_row() to fetch the
> correct input event from keypad->input_dev->keycode and report that
> back to userspace.
> 
> Fixes: f28af984e771 ("Input: mt6779-keypad - add MediaTek keypad driver")
> Co-developed-by: Fabien Parent <fparent@baylibre.com>
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
> ---
>  drivers/input/keyboard/mt6779-keypad.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/input/keyboard/mt6779-keypad.c b/drivers/input/keyboard/mt6779-keypad.c
> index 2e7c9187c10f..23360de20da5 100644
> --- a/drivers/input/keyboard/mt6779-keypad.c
> +++ b/drivers/input/keyboard/mt6779-keypad.c
> @@ -36,6 +36,19 @@ static const struct regmap_config mt6779_keypad_regmap_cfg = {
>  	.max_register = 36,
>  };
>  
> +/*
> + * | hardware key code | col0 | col1 | col2|
> + * | ----------------- | -----| ---- | --- |
> + * | row0              | 0    | 1    | 2   |
> + * | row1              | 9    | 10   | 11  |
> + * | row2              | 18   | 19   | 20  |
> + */
> +static void bitnr_to_col_row(int bit_nr, int *col, int *row)
> +{
> +	*row = bit_nr / 9;
> +	*col = bit_nr % 3;
> +}
> +
>  static irqreturn_t mt6779_keypad_irq_handler(int irq, void *dev_id)
>  {
>  	struct mt6779_keypad *keypad = dev_id;
> @@ -61,8 +74,7 @@ static irqreturn_t mt6779_keypad_irq_handler(int irq, void *dev_id)
>  		if (bit_nr % 32 >= 16)
>  			continue;
>  
> -		row = bit_nr / 32;
> -		col = bit_nr % 32;
> +		bitnr_to_col_row(bit_nr, &col, &row);
>  		scancode = MATRIX_SCAN_CODE(row, col, row_shift);
>  		/* 1: not pressed, 0: pressed */
>  		pressed = !test_bit(bit_nr, new_state);
> -- 
> 2.32.0
> 

-- 
Dmitry

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
