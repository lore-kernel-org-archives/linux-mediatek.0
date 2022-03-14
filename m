Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FCE0C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Mar 2022 14:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sF2u4c2usabPbTIVNcFtdCm/zq/nRjnygh1FsvI4JW4=; b=3BaT4NWGU0LQEz
	60JqfYW+A0sYinZdkmSrjTMfxVkmSTM1OZA2HB3KvxvY/zrPC2Cg4VE3qWj4UwBa8/JOQS1DzmHVD
	YY8hTltz+MbBEpvGGHd5JJaiwTV8HPyJrjW/A1uoU+rzycQieJg5FRAYYDNtHNJTUL3sLer21n7Ok
	C4ioOn1TdsfeX9mDrejxTo/TWV5ST2Ia+0qMRNPZAOBFe8NqDJRzoU0psg+h8IVytNLh8rAPjwlFR
	ZD6jSiUrW3a9MnbgCTx2csWwi261nTx14U8Zn1tT16SvqIGGJeaSg9OcFBDCmYlQtFjDPYuCeRt7U
	RMVxqxnsgL6PaytmE6lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTlpk-005hfV-Lf; Mon, 14 Mar 2022 14:38:04 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTlpg-005hcI-Be
 for linux-mediatek@lists.infradead.org; Mon, 14 Mar 2022 14:38:02 +0000
Received: by mail-wr1-x42e.google.com with SMTP id b19so1984896wrh.11
 for <linux-mediatek@lists.infradead.org>; Mon, 14 Mar 2022 07:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=1H47GtrR4sj+BFcR6DrzSoSzorsYvLbj5gf1Z0F31Js=;
 b=v9xUYrp1M+T4r9G7pfEP1yq8+liGfVprVCrAA3Uj1hkxLGZHEcXuoHdiTIUq/MMdrB
 xNEnbHjMOsdgvnLegS0ErwFWWeF5ZNM4ad9DL9zxPRD7PWvTiKGz4aOyOIk3Wgd30zfe
 8zlH3D9Nw+iKouIQeHRjEi5c2XJTjTu68BSXei7IHkn+r/4OvqXvFmxecNNG8W6lRsi8
 h03EmBfvD1G5tUByWA0zg9+I+TSFswSHGzL9FnYEtuQ5dsicr2MlTzDhHrnrwGrActIM
 +dPUCIsUgYup6ItUsJPZ1KpSI87oq5WZub/NOhV4U9eK5b1LXFq29J9r4x+Wn7YHY9TL
 6LSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=1H47GtrR4sj+BFcR6DrzSoSzorsYvLbj5gf1Z0F31Js=;
 b=Ywrwpj98Rt37Cs2P+fIT4Xn11Crsi6U7i7uXfqcarT/Ca18dsvHaRgPWUwuuXv+Y9c
 wuJwt0oGVHo1gI7H7EfI0gnBbS27WWzbcs0iDtxfgTI9IH0ywXhVA+EJ+U/bI4FZBx3U
 jJn3gYMJNCuYJEe8fFVwdhYAoEsbTUH10QztLP2fgm9BSAeUvlKG/TgO2WqCYWpPNoJn
 F5ambfh4BXyfuCPL2B18s73OTesKBOPuLIQy9A1DKT58apXLK6JTcXMjYEGBpvIU1CLm
 28swQHQogMc7SUMw+gwoWopHnqC915zfdVWTRg4z5F31sLHVLm+pG6vAI+IQHB9864c2
 OCsw==
X-Gm-Message-State: AOAM532AGgwokLcuu2lrGOBoMaSLN/bc8JXTgtIE4p4cAfHAMlvalmyk
 pGHch4r6Mj1YplqzRiv7C4zhQQ==
X-Google-Smtp-Source: ABdhPJz9pVLkc4i/cRnZ6Zq8iAS8ZTD8YEoNOpbv0lAta8I01TxZ/xsG+kVxLbC+y2/7ECGbCOuWNA==
X-Received: by 2002:adf:a58a:0:b0:1ef:603f:fb58 with SMTP id
 g10-20020adfa58a000000b001ef603ffb58mr16585915wrc.472.1647268676768; 
 Mon, 14 Mar 2022 07:37:56 -0700 (PDT)
Received: from localhost ([2a01:cb19:826e:8e00:1c43:3164:432d:c3c3])
 by smtp.gmail.com with ESMTPSA id
 n7-20020a05600c3b8700b00389a6241669sm20016392wms.33.2022.03.14.07.37.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Mar 2022 07:37:56 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Dan Carpenter <dan.carpenter@oracle.com>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, "fengping.yu" <fengping.yu@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Marco Felsch
 <m.felsch@pengutronix.de>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, linux-input@vger.kernel.org,
 linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] Input: mt6779-keypad - fix signedness bug in probe
In-Reply-To: <20220314140038.GA30883@kili>
References: <20220314140038.GA30883@kili>
Date: Mon, 14 Mar 2022 15:37:55 +0100
Message-ID: <87wngw1tx8.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_073800_508297_B2BE10A4 
X-CRM114-Status: GOOD (  16.11  )
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

Hi Dan,

On lun., mars 14, 2022 at 17:00, Dan Carpenter <dan.carpenter@oracle.com> wrote:

> The "irq" variable needs to be signed for the error handling to work.
>
> Fixes: f28af984e771 ("Input: mt6779-keypad - add MediaTek keypad driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Thank you for the patch.

This was already reported and fixed at [1]

[1] https://lore.kernel.org/linux-input/20220308025054.2077162-1-lv.ruyi@zte.com.cn/

> ---
>  drivers/input/keyboard/mt6779-keypad.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/input/keyboard/mt6779-keypad.c b/drivers/input/keyboard/mt6779-keypad.c
> index 5ff23250ed37..abd7e346203d 100644
> --- a/drivers/input/keyboard/mt6779-keypad.c
> +++ b/drivers/input/keyboard/mt6779-keypad.c
> @@ -91,10 +91,10 @@ static void mt6779_keypad_clk_disable(void *data)
>  static int mt6779_keypad_pdrv_probe(struct platform_device *pdev)
>  {
>  	struct mt6779_keypad *keypad;
> -	unsigned int irq;
>  	u32 debounce;
>  	bool wakeup;
>  	int error;
> +	int irq;
>  
>  	keypad = devm_kzalloc(&pdev->dev, sizeof(*keypad), GFP_KERNEL);
>  	if (!keypad)
> -- 
> 2.20.1

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
