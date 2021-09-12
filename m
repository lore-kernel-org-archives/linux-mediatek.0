Return-Path: <SRS0=wX2S=OC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 794CAC433EF
	for <linux-mediatek@archiver.kernel.org>; Sun, 12 Sep 2021 13:19:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35B0C61211
	for <linux-mediatek@archiver.kernel.org>; Sun, 12 Sep 2021 13:19:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 35B0C61211
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XvkohhS13FlIbsea8Q8UO+FSRE2IuxxUKL7LmPT6OHg=; b=YQyeRsVVwpZ5IY
	rRQPpXdU3yz52gUxXGjD3Lkzb/R6q22m/PayJrDNeVVxu6ndIyGFRhvrzn8Fpr0ogViRkVv0QAB1W
	Z5wTF3g02x9tSMZDNsG/0iHmx4KLlE3lBcEyI6NPxAP+qgkawyAeLN5fjZZTI17ckOKGpjJ+01nI5
	RCfGVK4W3cnCKccqJHziic0HffoweniB+OtT9jVis2KYWIEZwsnH9m6/GzpCzMz/H8rklacSNPtkI
	gg/ylkx4IdZCm4N5A2ggRYrHr+SCmoxRymvOIXqv1PdIFA65636Jg+WjvZBfcoevy3bk+WtXSGDFW
	yspkgpReaftRAjPcN7OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPPO6-00GSOA-MU; Sun, 12 Sep 2021 13:19:14 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPPNZ-00GSJB-RH; Sun, 12 Sep 2021 13:18:43 +0000
Received: by mail-ed1-x532.google.com with SMTP id q3so9976886edt.5;
 Sun, 12 Sep 2021 06:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=JjkuUFG8aC+b+dNRAS0GS2+3+6SH7OL6eP6H9dMuzpg=;
 b=BiD1DLf1/KO0J+5uDPTUYwSBh2enT2UXVgZYGoTFKRywIyeDX5XQIpvnhvAgZHP5st
 qhz3Wekn2YD6xs+28AmtEaUDMkeK7Jqy9QMk85cd0xF+bNoXh4djm644eAiIK/pNSxRi
 0MwT4zb/xuN4r4tF4zLuYDWeYjWUDxDfjdCEGHJaGu7z+pf/Go7zRQRBkebGaxq8BjTl
 po/wkDpWa07/rXmNVd72uodQMzucaseosATGHRjFK5XzVJ2ixVeNQM7xqjq6vrlH93Ma
 NYzVzggZ7Px7QBiqd2RGRrVxediX6V3kqAwUOPQpW5JTV+K+E1bSYZy6nxEXEo3kZeGY
 oh3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JjkuUFG8aC+b+dNRAS0GS2+3+6SH7OL6eP6H9dMuzpg=;
 b=0vHRutXO3vGwdu3Xb2JaZL9dwo+gROFP3CUso5HzJurYRZnYSY6MAKwqzkE7zLf9P5
 bHRifHjIcJzKD/HBz61WNwvWVNXu8oKWlOo43PtIswvmnwvH6W5j/6ORw5tAwTa1lZuq
 gNJdT9tBk39oB4VKBL/Fu/+LNf6hUOWriap0OEZsl5pb4rncv9SjMcAc0RSnqOG4rBu9
 +jNYaEbr94EDHkPr0gq0VT4drV4hrSTc01OGh9WqLJBgi9g5agweASi+ZUymqFzTqVps
 yz9F3VyQtIyC5bdy0BftCrUsFGmAj6M2AgoXzvUnSideB3PKylEsWsopVMMgdUMerC+Z
 O3cg==
X-Gm-Message-State: AOAM532QUoSF/vUypPpeeRbOzdEMFYhBhbt1tFNgMq5UbU/P2ZNITMqm
 Jgum2U/4wEiMnjtVPxu6Xo8=
X-Google-Smtp-Source: ABdhPJwU34hiWxo3W+6lr2nqbitJVT+uVLKsSOEIKBVD1dGl3QZsS9x7NyNMcwCYUhOZSyIM+lZHtw==
X-Received: by 2002:a05:6402:5c2:: with SMTP id
 n2mr8010126edx.239.1631452719669; 
 Sun, 12 Sep 2021 06:18:39 -0700 (PDT)
Received: from skbuf ([82.78.148.104])
 by smtp.gmail.com with ESMTPSA id a15sm2425158edr.2.2021.09.12.06.18.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 06:18:39 -0700 (PDT)
Date: Sun, 12 Sep 2021 16:18:37 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: netdev@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Kurt Kanzenbach <kurt@linutronix.de>, Hauke Mehrtens <hauke@hauke-m.de>,
 Woojung Huh <woojung.huh@microchip.com>,
 UNGLinuxDriver@microchip.com, Sean Wang <sean.wang@mediatek.com>,
 Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 George McCollister <george.mccollister@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Oleksij Rempel <linux@rempel-privat.de>,
 Michael Grzeschik <m.grzeschik@pengutronix.de>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Lino Sanfilippo <LinoSanfilippo@gmx.de>
Subject: Re: [RFC PATCH net 2/5] net: dsa: be compatible with masters which
 unregister on shutdown
Message-ID: <20210912131837.4i6pzwgn573xutmo@skbuf>
References: <20210912120932.993440-1-vladimir.oltean@nxp.com>
 <20210912120932.993440-3-vladimir.oltean@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210912120932.993440-3-vladimir.oltean@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210912_061841_934601_6A0AC404 
X-CRM114-Status: GOOD (  18.68  )
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

On Sun, Sep 12, 2021 at 03:09:29PM +0300, Vladimir Oltean wrote:
> +static int b53_mmap_shutdown(struct platform_device *pdev)
> +{
> +	struct b53_device *dev = platform_get_drvdata(pdev);
> +
> +	if (dev)
> +		b53_switch_shutdown(dev);
> +
> +	platform_set_drvdata(pdev, NULL);
> +}
> +
>  static const struct of_device_id b53_mmap_of_table[] = {
>  	{ .compatible = "brcm,bcm3384-switch" },
>  	{ .compatible = "brcm,bcm6328-switch" },
> @@ -331,6 +343,7 @@ MODULE_DEVICE_TABLE(of, b53_mmap_of_table);
>  static struct platform_driver b53_mmap_driver = {
>  	.probe = b53_mmap_probe,
>  	.remove = b53_mmap_remove,
> +	.shutdown = b53_mmap_shutdown,
>  	.driver = {
>  		.name = "b53-switch",
>  		.of_match_table = b53_mmap_of_table,

I forgot to enable all variants of the b53 driver, and as such, the mmap
version fails to build (the shutdown function should return void, not int).

I will fix this when I send the v2 patch, but I will not send that now,
as I would like to get some feedback on the approach first.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
