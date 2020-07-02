Return-Path: <SRS0=IR42=AN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7DB8C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2020 05:07:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A55A320836
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2020 05:07:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BEDZvcZ3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="criUw8gg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A55A320836
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BVGExEUEpRSEBzeUz7HzqbPVuYNBkRp2/5/SfunEfqo=; b=BEDZvcZ3cDpZP4U8dp6S6VYRB
	iwbYLB2o4ujaYH832tSB9uJaJXH16azByWgqj6tmCaPQni9fTLamSL2E5t0ezQHB66AauX9z7Q0zB
	Rrz6SjVa7uB5orZ2esFMmaaFFLBkQszipiD5+yO603f/GCcowx3PLcwoGe1pQU1rVrCDAKFNROc++
	V4es9E5ABo0/NuTl69wiFP/59w0Z8f6unSC2I0NhAypf012L4YiCw60vn8MHwcZXyL4gUGT7AkqYC
	Ay9jkqwIBu0vKTee8+xKJiUX78nUsNdUdHMP4EuKZNi4mX7EZmjXhJ4nO76/o1/5P+wrbYGM3GCmz
	QHdwT62Bg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqrRJ-00044Q-Vt; Thu, 02 Jul 2020 05:07:14 +0000
Received: from mail-il1-x143.google.com ([2607:f8b0:4864:20::143])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqrRG-00042h-Q0
 for linux-mediatek@lists.infradead.org; Thu, 02 Jul 2020 05:07:11 +0000
Received: by mail-il1-x143.google.com with SMTP id s21so7964175ilk.5
 for <linux-mediatek@lists.infradead.org>; Wed, 01 Jul 2020 22:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qald6rTjM4Ozy8eAzbgJVI8/UFGWkxBCP1h2R/b2HEE=;
 b=criUw8gg4UsLv4wS6rOpUP57mfy4z/RM9vYloRYpnSo3OSFmJxYpVDBCZgRD07wZE/
 yRhAEuqYghRTI9LzdhTQUyYEfgqC3u4upk0J63naiTxemEG/hJ2c1zFXXstvC1Eqkxzw
 UaOujL74VTxd2aKyhFIxcvPa0DhYLEagppAwI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qald6rTjM4Ozy8eAzbgJVI8/UFGWkxBCP1h2R/b2HEE=;
 b=Eq+b7CcpE+q5OoOXnhfI9kpLvtO6kniRewHTCIHr1Pk49UF7/hsspKhVA+ZiR4X0k3
 QzGz2InQ0nQUzsWI3p09mCdgpAInRfO2UxgCjdsbkncyeS+TTAegutFEvXqXU+iV4CFp
 SrtEyN+eIrTL1cdWnnYW8ZGeRt7C75U6dQj88cfNV4tAHxhVZprUS27wWDJSTXoH6XNX
 dtvedVQJDOBEjvqLXRA/J7FfdpJ5LWco+kJyieic+5tpcDC0xcun6Q6OP5BxHgjrmeL+
 avFkIxfiub0ZGFR8XumAcpVhXYNygMJVn5HvzdG+P2e52jvBid3ZBIpQzFuzDSW2OIws
 TJoQ==
X-Gm-Message-State: AOAM5317hZwZ3wkNe75hizQNBKU78aGXHuzMoXshlbR/jWHD0oNuqaid
 w43GBfNpaQO/4iF7ER8aBf5i8Ahk9Da/P8w2c4hhiQ==
X-Google-Smtp-Source: ABdhPJzfV9z2gnPuOKbbS2NygSGMccIzKO2/dmQEKUKLyjJzRE7KdaCnjYq7UNkKeomd2DQ15Rdu7uZJ+R84y36nxKg=
X-Received: by 2002:a92:4b08:: with SMTP id m8mr10499872ilg.150.1593666429155; 
 Wed, 01 Jul 2020 22:07:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200625101757.101775-1-enric.balletbo@collabora.com>
 <20200625101757.101775-6-enric.balletbo@collabora.com>
In-Reply-To: <20200625101757.101775-6-enric.balletbo@collabora.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Thu, 2 Jul 2020 13:06:43 +0800
Message-ID: <CAJMQK-jm4kuT+cB-mS+hMD5SxWHZAyn8WJ+chgn-BKQAANpgGw@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] arm64: dts: mt8183-evb: Fix unit name warnings
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200702_010710_910109_D9E37D5D 
X-CRM114-Status: GOOD (  13.94  )
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
Cc: erwanaliasr1@gmail.com, Nicolas Boichat <drinkcat@chromium.org>,
 Devicetree List <devicetree@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Collabora Kernel ML <kernel@collabora.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jun 25, 2020 at 6:18 PM Enric Balletbo i Serra
<enric.balletbo@collabora.com> wrote:
>
> Remove the unit address from the DT nodes that doesn't have a reg
> property. This fixes the following unit name warnings:
>
>     Warning (unit_address_vs_reg): /soc/pinctrl@10005000/mmc0@0: node has a unit name, but no reg or ranges property
>     Warning (unit_address_vs_reg): /soc/pinctrl@10005000/mmc1@0: node has a unit name, but no reg or ranges property
>
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Tested-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>
> Changes in v2: None
>
>  arch/arm64/boot/dts/mediatek/mt8183-evb.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
> index afd6ddbcbdf2c..ae405bd8f06b0 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
> @@ -205,7 +205,7 @@ pins_rst {
>                 };
>         };
>
> -       mmc0_pins_uhs: mmc0@0{
> +       mmc0_pins_uhs: mmc0 {
>                 pins_cmd_dat {
>                         pinmux = <PINMUX_GPIO123__FUNC_MSDC0_DAT0>,
>                                  <PINMUX_GPIO128__FUNC_MSDC0_DAT1>,
> @@ -264,7 +264,7 @@ pins_pmu {
>                 };
>         };
>
> -       mmc1_pins_uhs: mmc1@0{
> +       mmc1_pins_uhs: mmc1 {
>                 pins_cmd_dat {
>                         pinmux = <PINMUX_GPIO31__FUNC_MSDC1_CMD>,
>                                    <PINMUX_GPIO32__FUNC_MSDC1_DAT0>,
> --
> 2.27.0
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
