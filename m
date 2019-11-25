Return-Path: <SRS0=x9ei=ZR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A270C432C0
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Nov 2019 09:34:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0DBC62071E
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Nov 2019 09:34:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="M14HeTQq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="n0qMAxe/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0DBC62071E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q3gwV9mq+OMD6eNz98eQBi3ixTxk3soBUOc6O/flw8c=; b=M14HeTQqlK9Pcu
	OYtln6QjdkCHcOAEg32+szwvhNq5PU9MjzKseQ9CtbInWeuSnsN+eTocI1pHXwxYPMf/y5S31VZ26
	RI/RxFMiAljQl+sCtwkMibAbQUJ7mnqDRE6DlK6r2QKWmVtXnw7Yx2Anbf7f0I8qeo9IcQ+xHVDsy
	8KU2/fdQ3ylHtnMGfg8UwlYx+TCxGGQagm5tV+SfTCPUc1PQ5cjQzLbWJR+uNmsYaIe9qBrBxCAXd
	BaWpz+jfxJMEfIavw84Nkb+aHy4C+uMylUwME8vvOnsKuHjzejbEHJvpk75YrZIXCH41fh9uU0lAU
	WoB1IYpOi04/ffy+KfEQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iZAl2-00030v-B8; Mon, 25 Nov 2019 09:34:12 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZAkw-000309-W8
 for linux-mediatek@lists.infradead.org; Mon, 25 Nov 2019 09:34:10 +0000
Received: by mail-ed1-x543.google.com with SMTP id p59so12045981edp.7
 for <linux-mediatek@lists.infradead.org>; Mon, 25 Nov 2019 01:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5hxAPhYLgkjAC0glPWrMWh5sNJUjuPwkk/Zd+BYl4dA=;
 b=n0qMAxe/w0ZeKERleFOBgcA9JrLOVHkheN7cFtom/PmRGQrdhoib8QphXajnbHidBh
 D3TTGA10ICGPuYSWRn+Nx6shOwHUJo4Xsr4kKkihn9TRCO6mk4UKTDY61uMzh8rBHaB1
 ZAU1sCWOo6enIe29Pcnf4VAkh4QO7aAQBoaHI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5hxAPhYLgkjAC0glPWrMWh5sNJUjuPwkk/Zd+BYl4dA=;
 b=E0cAdtVn3LarO4sEqE6FBPC+etwA8avrSr4rUBSggRri5NHYuhPVOkpJ5sZRqzdl4W
 FOde/BFplAjokAQvf88HnZ76aWHasSYiO6oXnmYFJ0n9wnMU1nSqNPkqXhguZUvqOkkO
 dJ/Geg2rwnkzv3muBWpzLNCFOoI0ipPjcgl4tV9cwBBnVFWcRbp6KENcT/OXPFXduiTz
 9gC3sTIZCNihc+dr4RU4xndk+qlUtZ0cEKgoL8V1vcc9xhbxg1M+ph9htg3ihO1djaVj
 +8vbL9KnCu5BCERVZLpNS6N0WneOeTVKYd6gN0l7sEUESjfq2wWV8IsXxsE8kmPPDB/g
 o3ig==
X-Gm-Message-State: APjAAAU4eFpthsQMM9lw4BNuDD5unrvkLYcWz1Tp7Fs4ze7TkusrnsFi
 wH1NcyP+4WE0mkWSFlLThcuCvIigQP8wz0hUG56eGA==
X-Google-Smtp-Source: APXvYqydDtp531AXtenv6mp5/TxUBdNXj0kZcXkFGGkNCV1naYHb2inz8WFVHVtUMbwv+kaqLxCZMeg6SBUFhIxhDSU=
X-Received: by 2002:a17:906:b856:: with SMTP id
 ga22mr17027902ejb.199.1574674444048; 
 Mon, 25 Nov 2019 01:34:04 -0800 (PST)
MIME-Version: 1.0
References: <20191031090213.27727-1-dongchun.zhu@mediatek.com>
 <20191031090213.27727-3-dongchun.zhu@mediatek.com>
In-Reply-To: <20191031090213.27727-3-dongchun.zhu@mediatek.com>
From: Pi-Hsun Shih <pihsun@chromium.org>
Date: Mon, 25 Nov 2019 17:33:28 +0800
Message-ID: <CANdKZ0cMCWKmFcF44M0LBgwa6a3rvD0JdqFgkcjHqVHwMUS6yg@mail.gmail.com>
Subject: Re: [V3, 2/2] media: i2c: ov8856: Add support for more sensor modes
To: Dongchun Zhu <dongchun.zhu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191125_013409_202214_4D63557B 
X-CRM114-Status: GOOD (  16.03  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Nicolas Boichat <drinkcat@chromium.org>, andriy.shevchenko@linux.intel.com,
 srv_heupstream@mediatek.com,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, shengnan.wang@mediatek.com,
 Tomasz Figa <tfiga@chromium.org>, louis.kuo@mediatek.com,
 =?UTF-8?B?U2ogSHVhbmcgKOm7g+S/oeeSiyk=?= <sj.huang@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 sakari.ailus@linux.intel.com, Matthias Brugger <matthias.bgg@gmail.com>,
 bingbu.cao@intel.com, Mauro Carvalho Chehab <mchehab@kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:MEDIA INPUT INFRASTRUCTURE \(V4L/DVB\)"
 <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Dongchun,

On Thu, Oct 31, 2019 at 5:12 PM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
>
> This adds two more sensor modes for Omnivision ov8856 image sensor,
> including the resolution of 1632*1224 and 3264*2448, both with the
> Bayer Order of BGGR.
>
> Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> ---
>  drivers/media/i2c/ov8856.c | 661 ++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 652 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/media/i2c/ov8856.c b/drivers/media/i2c/ov8856.c
> index 8655842..4815c26 100644
> --- a/drivers/media/i2c/ov8856.c
> +++ b/drivers/media/i2c/ov8856.c
> @@ -3,10 +3,13 @@
> [...]
> @@ -1189,6 +1768,42 @@ static int ov8856_probe(struct i2c_client *client)
>                 return -ENOMEM;
>
>         v4l2_i2c_subdev_init(&ov8856->sd, client, &ov8856_subdev_ops);
> +       ov8856->fmt.code = MEDIA_BUS_FMT_SGRBG10_1X10;
> +
> +       ov8856->xvclk = devm_clk_get(&client->dev, "xvclk");
> +       if (IS_ERR(ov8856->xvclk)) {
> +               dev_err(&client->dev, "failed to get xvclk\n");
> +               return -EINVAL;
> +       }
> +
> +       ret = clk_set_rate(ov8856->xvclk, OV8856_XVCLK_24);
> +       if (ret < 0) {
> +               dev_err(&client->dev, "failed to set xvclk rate (24MHz)\n");
> +               return ret;
> +       }
> +       if (clk_get_rate(ov8856->xvclk) != OV8856_XVCLK_24)
> +               dev_warn(&client->dev,
> +                        "xvclk mismatched, modes are based on 24MHz\n");
> +
> +       ov8856->n_shutdn_gpio = devm_gpiod_get(&client->dev, "reset",
> +                                              GPIOD_OUT_LOW);
> +       if (IS_ERR(ov8856->n_shutdn_gpio)) {
> +               dev_err(&client->dev, "failed to get reset-gpios\n");
> +               return -EINVAL;
> +       }
> +
> +       for (i = 0; i < OV8856_NUM_SUPPLIES; i++)
> +               ov8856->supplies[i].supply = ov8856_supply_names[i];
> +
> +       ret = devm_regulator_bulk_get(&client->dev, OV8856_NUM_SUPPLIES,
> +                                     ov8856->supplies);
> +       if (ret)
> +               dev_warn(&client->dev, "failed to get regulators\n");
> +
> +       ret = __ov8856_power_on(ov8856);
> +       if (ret)
> +               dev_warn(&client->dev, "failed to power on\n");
> +

__ov8856_power_off is missing on the error path after the __ov8856_power_on.

>         ret = ov8856_identify_module(ov8856);
>         if (ret) {
>                 dev_err(&client->dev, "failed to find sensor: %d", ret);
> @@ -1241,8 +1856,29 @@ static int ov8856_probe(struct i2c_client *client)
>         return ret;
>  }
>
> [...]

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
