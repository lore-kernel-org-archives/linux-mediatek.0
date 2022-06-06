Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 445AAC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jun 2022 15:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y4l/jjPictrj/21229oVbwHmdadn/0+FwrUKDZFTGH8=; b=vTc9TOFcrp+9BL
	8p7Rwh2XRO5LmS6mKYURbhrSAh6S9eTXwTLbydrPMtK0PFKPMp/PQ7y3S/QQRt1NAblqC0PLZqNYW
	Vi7g9Gqx3YCOxBxQmusexdqLs2A17RDsA8iE4vLnVhFaMAPYXadK+8VH7dpN1YC9BLgIA4jFOju2V
	rdVC8z4ZcOTukxue0nmyC00y8CE2WG+ZKhf/WFRkZAKtEBlzxS6bxyh71Obec4pfR0nIq0q2bPbw+
	qjZV0zgfo1dK0fFCjGAOdmieNWB/ONSZjNFdPbLxan4oupXQPlSuNmsmJYBvx50ZVGAEy7dl9anXL
	Oa8m2brUQItn+JlQo71g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyEhj-001pyt-OP; Mon, 06 Jun 2022 15:31:43 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyEgU-001pJx-Uj
	for linux-mediatek@lists.infradead.org; Mon, 06 Jun 2022 15:30:28 +0000
Received: by mail-ej1-x634.google.com with SMTP id m20so29619678ejj.10
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Jun 2022 08:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MEyaqWM6nauSyOE/o6cR6HwD4AGRKj1DKlampNeNe54=;
        b=ebBCl9ALvXs/hDq13HqiEeAtprViCGphd4r907eKS91OqO6wlFsCghYVoFTcBaiLxR
         +BraHJEoPdruKUUlpI1zrcpfQ+slS0OKAYhZShj4ETcGG/dGncD/kvQaDZcLqKtIRpT3
         tEro5Seb389aioq7xC4RNTHYmASlM/jXz40R4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MEyaqWM6nauSyOE/o6cR6HwD4AGRKj1DKlampNeNe54=;
        b=bczIpHaeAaph5/vuTpJosbGx+h2kqaUan0nvC/RgKmzPVdD8aJGJm97gK3BSqSrx6S
         h3B4qn8OWdOr0LEJUqPuPQsDNkXLuPJ5AMG1AWwQ144/6Z9Qvyh90hVCVy+czu3jt3NZ
         coDJUDT5HRnKTu/pRBvJK40LspA9ZBpt2xynsnzv4Leg4jRAZa9y7W6Ss3sQAPHhuelz
         9LrO3HJVZ5SZJeNBEgLEy3N8juQA0BJxYL+IzGZZe+euftM5ZNyHKpUdCOKaHdvKHDic
         vh4yGjvSLRPb231HY1Dp4X1RkVmFD6nGSUgUsDRnxSPy5/nl9W7nNqRRI2h1A7o9BJ6f
         O7bw==
X-Gm-Message-State: AOAM530F8x+M6r9CtSTJqjSt1x94Ltqy0cxOC4cPSU/TgMRFKNWC+ZZQ
	LVS97fDBRO2UgRi0YMpTBkZrZTdP2iSmWi3TA5HtAmaOJr8Zvg==
X-Google-Smtp-Source: ABdhPJw3lFG2FHh8YBss/swu6q2uufYMGgGFis+oLM6PD4uIZua7oPEouaSwOJQ0zYOIYT0kfRfPo744IaHyEHggWNk=
X-Received: by 2002:a17:906:eb54:b0:708:99d6:83e with SMTP id
 mc20-20020a170906eb5400b0070899d6083emr21650908ejb.745.1654529425433; Mon, 06
 Jun 2022 08:30:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220530113033.124072-1-hsinyi@chromium.org> <20220530113033.124072-2-hsinyi@chromium.org>
In-Reply-To: <20220530113033.124072-2-hsinyi@chromium.org>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Mon, 6 Jun 2022 23:29:59 +0800
Message-ID: <CAJMQK-jw+sgunEwgEQAw-V8DAbybZ7WVnZJ6vwOdzQ+-SX_bQg@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: mt8183: Add panel rotation
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, Rob Clark <robdclark@chromium.org>, 
	Stephen Boyd <swboyd@chromium.org>, Douglas Anderson <dianders@chromium.org>, 
	Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_083027_040593_CDE1B945 
X-CRM114-Status: GOOD (  15.42  )
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

On Mon, May 30, 2022 at 7:30 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> krane, kakadu, and kodama boards have a default panel rotation.
>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> Tested-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---

Hi Matthias,

The series ("Add a panel API to return panel orientation") might land
in drm-misc. With this series applied, we can add this patch to give
the correct default orientation for mt8183 kukui devices.
I didn't send this patch again with the series, since they might land
in different trees.

Thanks.

>  arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> index 8d5bf73a9099..f0dd5a06629d 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> @@ -276,6 +276,7 @@ panel: panel@0 {
>                 avee-supply = <&ppvarp_lcd>;
>                 pp1800-supply = <&pp1800_lcd>;
>                 backlight = <&backlight_lcd0>;
> +               rotation = <270>;
>                 port {
>                         panel_in: endpoint {
>                                 remote-endpoint = <&dsi_out>;
> --
> 2.36.1.124.g0e6072fb45-goog
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
