Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A3BDC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Mar 2022 07:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mn5PXoMdUocP7Iz4ZXDDizSMN6ndsVzT/B8Zh9uK3WE=; b=L+ZFGWLCZwUAeL
	adobnpI3blvxzGTVYVFQJ437msKMIyQZcsJETgHcyYzxoU0IYs714/9yVejU+5wcZg363PuFVzgyL
	/aMMkcqQeNnh8HubgxjkyTlV2A/6fa3h9xUuN58QGb7bd2rFLaoNP8DGY9B5bMqoGa4KjFSlm0HQG
	b9qH1aPyGzSyxdZuTfqH2bgcRIs9wd/YtlWsbu0Im4EcS8UaQZPzuHYM3QkOfUPuF0vz6z1ZvR0/T
	2Xs8cuqTLa+VTjGQu0UmvlAoBNAh7cxJQ6Yrxi+oPEQhBLWUPNFzr1JgdCAMmdKkLVuVhwynNgJjm
	NlOrkzD+d6kraNSc5WAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRqQA-007ZSH-3Y; Wed, 09 Mar 2022 07:07:42 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRqPx-007ZPE-4i
 for linux-mediatek@lists.infradead.org; Wed, 09 Mar 2022 07:07:32 +0000
Received: by mail-wr1-x431.google.com with SMTP id e24so1481893wrc.10
 for <linux-mediatek@lists.infradead.org>; Tue, 08 Mar 2022 23:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=UKkOGj96yEPkJXREWpXf/ZxC/thW+x6mQGM5X+KzoqI=;
 b=Vm5nzBF+VMiWvwLDRlVhoTttIZnnwG9hQkgmU6lhcEKjellU9RaCXIbHUQ+s9vopbh
 fqUxjfZu9KfNHw0ik21qV5WvsEPBLb2xLeCE8bYKqM/3o3HZ1rPywXSqZ9IE+PZaAjp+
 AawEkLPcP0HZjlHvEiAcW9G3xfjwubjC6WHmMqI4DP4R5u2skH7xfL1CbfI0Jypn/WjX
 7XB4E+IxevaAP46ENlzhPOzW1MAcpzDA95PH3tYZ5W/2xTrtnpB5X7JR9OtP2Y/NCE2t
 0iHGLJSrJsFeBMJgqCzv2c+BS8uvMLvBEeShcEIIf/XXswwqrpXuzW0N/y6TKZWWP7jw
 p/sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=UKkOGj96yEPkJXREWpXf/ZxC/thW+x6mQGM5X+KzoqI=;
 b=MIuyVHnBFCxEe22SNE7H3L6sCghZamKF68sAGA7EdG66oB7dvgPutEVXTgHqo8W8C+
 AvMMbqw6gGarm30MOWS+ET+lgX+N4/+POKxM+eF2uNZ4MiD9JogcKl66duGeLtaP9s3p
 b3MfDLmQ/I2iv7wpx2mxyWivU+ecFpaFNPpVjor0G3OJiARhV4vJgvJXESbm41hssPtJ
 0KBduzaLxyDtFUobUi713fShWsI2QMbw6o27qrvoImA8jtjd6ZhVKAdXqm8z4ryIjsmG
 BDT3tZDhkZ/T1pdSLzfKOH91LhjTMCxO5Ppuunf9wwzjv02fo+UtbwF8y2j7ejJ3NqZS
 BhVg==
X-Gm-Message-State: AOAM5313Ju8lKis1AufhuxSy2EYKGGi7sTUHwuIZfjubIcWbUGdD8QTt
 9iaekHgCWsr6CT+nj0CK4MXbCw==
X-Google-Smtp-Source: ABdhPJzlhZkmPvte5X0WJu7dgTlK9ftWSz9F9e479R/RNfghnaKH7QPJhwJ/dXiKt3gcN/HGMjhong==
X-Received: by 2002:a5d:47a4:0:b0:1f0:46e4:19bc with SMTP id
 4-20020a5d47a4000000b001f046e419bcmr16034223wrb.601.1646809646825; 
 Tue, 08 Mar 2022 23:07:26 -0800 (PST)
Received: from localhost ([2a01:e0a:a84:e4a0:bc38:63f8:c31:e108])
 by smtp.gmail.com with ESMTPSA id
 k18-20020adfe8d2000000b0020294da2b42sm1240410wrn.117.2022.03.08.23.07.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 23:07:26 -0800 (PST)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: cgel.zte@gmail.com, dmitry.torokhov@gmail.com
Cc: matthias.bgg@gmail.com, lv.ruyi@zte.com.cn, fengping.yu@mediatek.com,
 m.felsch@pengutronix.de, linux-input@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Zeal Robot <zealci@zte.com.cn>
Subject: Re: [PATCH] input: fix variable type
In-Reply-To: <20220308025054.2077162-1-lv.ruyi@zte.com.cn>
References: <20220308025054.2077162-1-lv.ruyi@zte.com.cn>
Date: Wed, 09 Mar 2022 08:07:25 +0100
Message-ID: <875yontxhu.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_230729_264338_FB8170BD 
X-CRM114-Status: GOOD (  14.10  )
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

On Tue, Mar 08, 2022 at 02:50, cgel.zte@gmail.com wrote:

> From: Lv Ruyi (CGEL ZTE) <lv.ruyi@zte.com.cn>
>
> The irq is defined unsigned int. If the platform_get_irq return a negative
> value, data type cast may result in error.
>
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Lv Ruyi (CGEL ZTE) <lv.ruyi@zte.com.cn>
> ---
>  drivers/input/keyboard/mt6779-keypad.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/input/keyboard/mt6779-keypad.c b/drivers/input/keyboard/mt6779-keypad.c
> index 5ff23250ed37..0dbbddc7f298 100644
> --- a/drivers/input/keyboard/mt6779-keypad.c
> +++ b/drivers/input/keyboard/mt6779-keypad.c
> @@ -91,7 +91,7 @@ static void mt6779_keypad_clk_disable(void *data)
>  static int mt6779_keypad_pdrv_probe(struct platform_device *pdev)
>  {
>  	struct mt6779_keypad *keypad;
> -	unsigned int irq;
> +	int irq;
>  	u32 debounce;
>  	bool wakeup;
>  	int error;

Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
> -- 
> 2.25.1

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
