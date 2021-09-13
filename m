Return-Path: <SRS0=5OX0=OD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6314C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Sep 2021 13:38:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADD50613CE
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Sep 2021 13:38:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ADD50613CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L5QDQEruTWKbqSKc0G71cosqC5H0XSLtrfsDTkwKFCk=; b=kCcHZXy7H1DojA
	oGI/6CrXwHjMO6SDC/QD5KWDuSGA2GxmOXgAnfjahq4ch8af0ma2X+JxFxy3Vn2UomIkA8ZYz3FgA
	63IOuHGOHNf3qnHTh3e6VlZV1nWmH7c5LuY9JyRKC3RPV18cGHATbDGv400XilkHX2KjOWwtHR0+Q
	ke+qJHhcIBV6KoaXP8u9v/mi8fSstinS5UegwLHFNH80symEmpE+Seqn+SZX++FCbPr7+TCsrDRzj
	MXTmMi4QT8fiyQqcFEwQD3XyuJSDis7V9Jzqg9dOTemxdNJBzpQ8d1FfFB1/CwgU1M0zFcYWgF2QR
	lVQAo/vGsxjEZHkQZkvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPmAM-001sJB-BT; Mon, 13 Sep 2021 13:38:34 +0000
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPmA7-001sH4-P6; Mon, 13 Sep 2021 13:38:21 +0000
Received: by mail-oi1-x22d.google.com with SMTP id r26so14057131oij.2;
 Mon, 13 Sep 2021 06:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+A1PzhLE74Yrhc1O3usAzGVIUOozgkbbtbY+3Jj7aq0=;
 b=Kfk4WHVTxvJDzCU/g7sFltp5ZTejJF+ZqnqLWtduIYpUdHSJjWiouiG3Uis5RJHXVT
 8mbS881DwXU7XcvJihf9nIhGx5Gu1xrwPxcY3QRDt0A+QVOh3RiW4eyE1WCXTLjFwDIz
 x8o8haSW7/Ytrp/HtRqYATwVZeucP2CFQzL/fU95RhMIGmGjNsuJ9nFIccw3sAQkKOFS
 BmsbhG5r7W3Kp+zk2GZeFx2u1GCAPDPpCsA90yXEgdK+phVPgIdNSFGI2BNm0EYRp0a7
 0HVrYQ68vhgrx3y+Uy4+ETvKUmUyUQRKUfFLU5nHjqezelTR1vjJXE38kqkmYNcVvHsr
 z01Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+A1PzhLE74Yrhc1O3usAzGVIUOozgkbbtbY+3Jj7aq0=;
 b=XlG1H20UOrQ9lrkrmAqJa0fWjMsPSZWROh6baRGWwSJH4chsm16vIb3TJb+h05/8PR
 zUgtc/NqZbi9TfiqCfek/EekjsPVE+p+eJ36XoYSh+xbLg3VfpApI72AA9RXQ/+EMKol
 lW+15XihJP900Ysyda4wfUGCgonxMcy7TuyxrNdQ5/IAOAM4lEJ/0BkU5BOzXPaiu0yX
 ucm74uOR+eUBoORfn2Omw0Po9T56DuO+Rw0A8Ai0SFf6SruZnBhAWGDwk/CEZ0H4+6U7
 LeHSoQNbY2Dvfl/3S6H3/h/yZN4s33gQlZcruVaJ//hLPpP71r25skPMyTk2xLWRFuJF
 8n8g==
X-Gm-Message-State: AOAM530inn4qEty3+0gyZv1plnh7B3INvbahQXEDAK9unuvxiSmuAmAd
 GbzPcYQMaSBl+dz/Cm22ENReZNWH7lNSl4ez0Q==
X-Google-Smtp-Source: ABdhPJy5rGtbHvHSEHFoArM2w+Ui69oLC2M+l3QGHrBxg0R3q8AlcvYS1p1U2h5yD9kNDLcff/O1zQaHDfQYNTpHHuA=
X-Received: by 2002:aca:6008:: with SMTP id u8mr8009784oib.127.1631540297900; 
 Mon, 13 Sep 2021 06:38:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210912120932.993440-1-vladimir.oltean@nxp.com>
 <20210912120932.993440-6-vladimir.oltean@nxp.com>
In-Reply-To: <20210912120932.993440-6-vladimir.oltean@nxp.com>
From: George McCollister <george.mccollister@gmail.com>
Date: Mon, 13 Sep 2021 08:38:05 -0500
Message-ID: <CAFSKS=NjFM6FhaUntjZ30dbU50JYnNpjrZj2KL=HAgbxk+yyuQ@mail.gmail.com>
Subject: Re: [RFC PATCH net 5/5] net: dsa: xrs700x: be compatible with masters
 which unregister on shutdown
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: netdev <netdev@vger.kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, 
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>, 
 Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, 
 Jakub Kicinski <kuba@kernel.org>, Kurt Kanzenbach <kurt@linutronix.de>,
 Hauke Mehrtens <hauke@hauke-m.de>, 
 Woojung Huh <woojung.huh@microchip.com>, 
 Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
 Sean Wang <sean.wang@mediatek.com>, 
 Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Linus Walleij <linus.walleij@linaro.org>, 
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
 Oleksij Rempel <linux@rempel-privat.de>,
 Michael Grzeschik <m.grzeschik@pengutronix.de>, 
 open list <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
 linux-mediatek@lists.infradead.org, 
 Lino Sanfilippo <LinoSanfilippo@gmx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210913_063819_860121_0F1DCC1E 
X-CRM114-Status: GOOD (  30.14  )
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

On Sun, Sep 12, 2021 at 7:09 AM Vladimir Oltean <vladimir.oltean@nxp.com> wrote:
>
> Since commit 2f1e8ea726e9 ("net: dsa: link interfaces with the DSA
> master to get rid of lockdep warnings"), DSA gained a requirement which
> it did not fulfill, which is to unlink itself from the DSA master at
> shutdown time.
>
> Since the Arrow SpeedChips XRS700x driver was introduced after the bad
> commit, it has never worked with DSA masters which decide to unregister
> their net_device on shutdown, effectively hanging the reboot process.
> To fix that, we need to call dsa_switch_shutdown.
>
> These devices can be connected by I2C or by MDIO, and if I search for
> I2C or MDIO bus drivers that implement their ->shutdown by redirecting
> it to ->remove I don't see any, however this does not mean it would not
> be possible. To be compatible with that pattern, it is necessary to
> implement an "if this then not that" scheme, to avoid ->remove and
> ->shutdown from being called both for the same struct device.
>
> Fixes: ee00b24f32eb ("net: dsa: add Arrow SpeedChips XRS700x driver")
> Link: https://lore.kernel.org/netdev/20210909095324.12978-1-LinoSanfilippo@gmx.de/
> Reported-by: Lino Sanfilippo <LinoSanfilippo@gmx.de>
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> ---
>  drivers/net/dsa/xrs700x/xrs700x.c      |  6 ++++++
>  drivers/net/dsa/xrs700x/xrs700x.h      |  1 +
>  drivers/net/dsa/xrs700x/xrs700x_i2c.c  | 18 ++++++++++++++++++
>  drivers/net/dsa/xrs700x/xrs700x_mdio.c | 18 ++++++++++++++++++
>  4 files changed, 43 insertions(+)
>
> diff --git a/drivers/net/dsa/xrs700x/xrs700x.c b/drivers/net/dsa/xrs700x/xrs700x.c
> index 130abb0f1438..469420941054 100644
> --- a/drivers/net/dsa/xrs700x/xrs700x.c
> +++ b/drivers/net/dsa/xrs700x/xrs700x.c
> @@ -822,6 +822,12 @@ void xrs700x_switch_remove(struct xrs700x *priv)
>  }
>  EXPORT_SYMBOL(xrs700x_switch_remove);
>
> +void xrs700x_switch_shutdown(struct xrs700x *priv)
> +{
> +       dsa_switch_shutdown(priv->ds);
> +}
> +EXPORT_SYMBOL(xrs700x_switch_shutdown);
> +
>  MODULE_AUTHOR("George McCollister <george.mccollister@gmail.com>");
>  MODULE_DESCRIPTION("Arrow SpeedChips XRS700x DSA driver");
>  MODULE_LICENSE("GPL v2");
> diff --git a/drivers/net/dsa/xrs700x/xrs700x.h b/drivers/net/dsa/xrs700x/xrs700x.h
> index ff62cf61b091..4d58257471d2 100644
> --- a/drivers/net/dsa/xrs700x/xrs700x.h
> +++ b/drivers/net/dsa/xrs700x/xrs700x.h
> @@ -40,3 +40,4 @@ struct xrs700x {
>  struct xrs700x *xrs700x_switch_alloc(struct device *base, void *devpriv);
>  int xrs700x_switch_register(struct xrs700x *priv);
>  void xrs700x_switch_remove(struct xrs700x *priv);
> +void xrs700x_switch_shutdown(struct xrs700x *priv);
> diff --git a/drivers/net/dsa/xrs700x/xrs700x_i2c.c b/drivers/net/dsa/xrs700x/xrs700x_i2c.c
> index 489d9385b4f0..6deae388a0d6 100644
> --- a/drivers/net/dsa/xrs700x/xrs700x_i2c.c
> +++ b/drivers/net/dsa/xrs700x/xrs700x_i2c.c
> @@ -109,11 +109,28 @@ static int xrs700x_i2c_remove(struct i2c_client *i2c)
>  {
>         struct xrs700x *priv = i2c_get_clientdata(i2c);
>
> +       if (!priv)
> +               return 0;
> +
>         xrs700x_switch_remove(priv);
>
> +       i2c_set_clientdata(i2c, NULL);
> +
>         return 0;
>  }
>
> +static void xrs700x_i2c_shutdown(struct i2c_client *i2c)
> +{
> +       struct xrs700x *priv = i2c_get_clientdata(i2c);
> +
> +       if (!priv)
> +               return;
> +
> +       xrs700x_switch_shutdown(priv);
> +
> +       i2c_set_clientdata(i2c, NULL);
> +}
> +
>  static const struct i2c_device_id xrs700x_i2c_id[] = {
>         { "xrs700x-switch", 0 },
>         {},
> @@ -137,6 +154,7 @@ static struct i2c_driver xrs700x_i2c_driver = {
>         },
>         .probe  = xrs700x_i2c_probe,
>         .remove = xrs700x_i2c_remove,
> +       .shutdown = xrs700x_i2c_shutdown,
>         .id_table = xrs700x_i2c_id,
>  };
>
> diff --git a/drivers/net/dsa/xrs700x/xrs700x_mdio.c b/drivers/net/dsa/xrs700x/xrs700x_mdio.c
> index 44f58bee04a4..d01cf1073d49 100644
> --- a/drivers/net/dsa/xrs700x/xrs700x_mdio.c
> +++ b/drivers/net/dsa/xrs700x/xrs700x_mdio.c
> @@ -136,7 +136,24 @@ static void xrs700x_mdio_remove(struct mdio_device *mdiodev)
>  {
>         struct xrs700x *priv = dev_get_drvdata(&mdiodev->dev);
>
> +       if (!priv)
> +               return;
> +
>         xrs700x_switch_remove(priv);
> +
> +       dev_set_drvdata(&mdiodev->dev, NULL);
> +}
> +
> +static void xrs700x_mdio_shutdown(struct mdio_device *mdiodev)
> +{
> +       struct xrs700x *priv = dev_get_drvdata(&mdiodev->dev);
> +
> +       if (!priv)
> +               return;
> +
> +       xrs700x_switch_shutdown(priv);
> +
> +       dev_set_drvdata(&mdiodev->dev, NULL);
>  }
>
>  static const struct of_device_id __maybe_unused xrs700x_mdio_dt_ids[] = {
> @@ -155,6 +172,7 @@ static struct mdio_driver xrs700x_mdio_driver = {
>         },
>         .probe  = xrs700x_mdio_probe,
>         .remove = xrs700x_mdio_remove,
> +       .shutdown = xrs700x_mdio_shutdown,
>  };
>
>  mdio_module_driver(xrs700x_mdio_driver);
> --
> 2.25.1
>

Looks good to me.
Assuming we do Reviewed-by for RFCs:
Reviewed-by: George McCollister <george.mccollister@gmail.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
