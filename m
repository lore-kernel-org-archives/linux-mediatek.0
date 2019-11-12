Return-Path: <SRS0=+xT1=ZE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 592B2C43331
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Nov 2019 17:02:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29B5C20679
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Nov 2019 17:02:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aQHws7T0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gqdeS5lE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 29B5C20679
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mKuM0J1bypJPc7fZUmLsFhcpUOotogXNmQDvhXrq5Po=; b=aQHws7T0/14M5M
	48I361VS2Y5cvi1yCtm3wstOF4//3n/pRvClGRh/BXEwtVBNfQPvXEPlg1nv61ULViIoXl9o4nkL+
	/UjshAh9NtyhGJ0M2OaSG/UfdVnyCrBE4H9zoCdI9z/6Ov4eL1masSZxZSF7hExfN9D58OezQTAtQ
	rNdsaIruzxUfDBigCV12zpooHsz4nXARpZs6OB4aLuKGNq0P2AKdQiNT+hEZmBCaoKq0+ZvLycuo6
	YEPrlVq5sPmKrhiUmT8zJxlYVTzZqJq1+3nUdlfEyjdmlW1LfecwLqTQ1fW8hh+89DfX5uj5u30Q5
	Kg9eF3zIutS4XvJQf1+g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iUZY9-0002x1-Mv; Tue, 12 Nov 2019 17:01:53 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUZY6-0002vm-Qn
 for linux-mediatek@lists.infradead.org; Tue, 12 Nov 2019 17:01:52 +0000
Received: by mail-pg1-x542.google.com with SMTP id q17so12231073pgt.9
 for <linux-mediatek@lists.infradead.org>; Tue, 12 Nov 2019 09:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=GDojT++zYyimFKXjGTgtIMvoNwjyBW8FizODRtTHlkU=;
 b=gqdeS5lER8xfVdf3MPfzRhQWtIdYGVkfvSEfkEikV5sK+iUbNyoUDxfqd0+Gf8qRon
 qIHWABuQ6RrIuV9KP9et/nCefEYxwgv0VU6xWDH/6WigGjakxakLa/uAk/OZfK6aVs7K
 LvkNK+dcIIHQrnxcoqA/IqdlZjyzz32xgRlYjaX7VbauzkexzJ8FhEebDZqN5k6CV5bv
 1E2P4sJBj7B20dAtY+vRdNYhwg7+Crzg+hEcAIZsxPn2ZVIiajYUgAJYOPGKF8JwDcwE
 0IZzMwP9eCWaBLOLkKUPL66WfWRvEgGNsCoRadK6bSa6QAU6DElkyAo1XDy0qVlKPQZg
 tUWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=GDojT++zYyimFKXjGTgtIMvoNwjyBW8FizODRtTHlkU=;
 b=LM1F4Ao+JZ8r8qo+0wtVpq2lm3Fm1hIfLlwk5EPjt0mci1Nsnun7IqvAFTjnuNgTce
 ZzumkHWH8fmZhmaeJeFc5if5YtAkNBfan5XAppwJLNb7F1fbzeDhriGdtHp+nYnBCGs7
 azkSpztZ4ks7p8xE2Imvf4bJX9Hu1RcEjb2vU8/O4UgDKbGHyCk6Ln9I6JSxatuQqf87
 t33cfqq+qKGbSS3uXOBdt6aoP2/FQRj+/H0nnAPFxj8r5oh0jsLXIvYgptHGK8LT6Op4
 kXZsgUHJF8P6735JAptnuOZGItD56ytSo1ppzWXr6ivDH+jQSWLRtakc9c/1b7GroB52
 9Nlw==
X-Gm-Message-State: APjAAAXPv7/+MyyMe6wMAdB5i0+t/vlEX4dYTjeGsxDjuICBwoeuvnCk
 NAnIGZYVV9FJrofX6zUfsf3dkw==
X-Google-Smtp-Source: APXvYqw4G8Nv44pA6Fs7EzjALZ0qCpPOe1DYkXKQWUmcJweMaKJlE6IhOyuyuFHl+85B3ZJqZHBicw==
X-Received: by 2002:aa7:85d7:: with SMTP id z23mr38064618pfn.24.1573578109877; 
 Tue, 12 Nov 2019 09:01:49 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id y138sm20294845pfb.174.2019.11.12.09.01.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2019 09:01:48 -0800 (PST)
Date: Tue, 12 Nov 2019 09:01:44 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Subject: Re: [PATCH 2/2] pinctrl: Use new GPIO_LINE_DIRECTION
Message-ID: <20191112170144.GF3797@yoga>
References: <20191112141819.GA22076@localhost.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191112141819.GA22076@localhost.localdomain>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191112_090150_875422_5AFCE2AD 
X-CRM114-Status: GOOD (  11.76  )
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
Cc: Andrew Lunn <andrew@lunn.ch>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Heiko Stuebner <heiko@sntech.de>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Patrice Chotard <patrice.chotard@st.com>, Paul Cercueil <paul@crapouillou.net>,
 Eric Anholt <eric@anholt.net>, linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Gregory Clement <gregory.clement@bootlin.com>, Chen-Yu Tsai <wens@csie.org>,
 linux-rockchip@lists.infradead.org,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Andy Gross <agross@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 linux-arm-msm@vger.kernel.org,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Jason Cooper <jason@lakedaemon.net>, mazziesaccount@gmail.com,
 Ray Jui <rjui@broadcom.com>, linux-gpio@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Scott Branden <sbranden@broadcom.com>,
 Sean Wang <sean.wang@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Stefan Wahren <wahrenst@gmx.net>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-oxnas@groups.io
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue 12 Nov 06:18 PST 2019, Matti Vaittinen wrote:
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> index 763da0be10d6..8844ca1261d5 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -485,8 +485,8 @@ static int msm_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
>  
>  	val = msm_readl_ctl(pctrl, g);
>  
> -	/* 0 = output, 1 = input */
> -	return val & BIT(g->oe_bit) ? 0 : 1;
> +	return val & BIT(g->oe_bit) ? GPIO_LINE_DIRECTION_OUT :
> +				      GPIO_LINE_DIRECTION_IN;
>  }
>  

For pinctrl-msm

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
