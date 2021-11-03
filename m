Return-Path: <SRS0=yT6o=PW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89830C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Nov 2021 04:24:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BDD661073
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Nov 2021 04:24:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4BDD661073
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uzqK3FzMaVOtFmb4AkbWlVoq5s6iknZU/fs+v8XMbNI=; b=Ro/xRCV2fTjVnb
	7CA6gOZDd8098qGb0zGEkbbmzq9zOungrdK6n7YPILSO3tEp0MFQEiOqnu3yfBopHj2Tt/Fs01jpc
	XixfWgfubssH9lKWHfOY4zyMR61NQPm9FZGZM8PQzfcg7RwV5H0sPAEqbJU/E7gJ0BwL8TEWxUszp
	p/4MkzYDyq12nc5saDh3lMYzcHeVrdMNlyng5UUM48BUmyogrI5a3gQyNnctSdLaJelSNGEbiF4w8
	h1dx9fucpOHnMtbJJWddB2Ip9y6JiFD//VTcwfsYkHagelp+OnaVQahCoWcP7MQYMv3j419m8rVRG
	1WE6O9jQfQ36DScc6AJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mi7pF-0043uS-Pl; Wed, 03 Nov 2021 04:24:37 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mi7pC-0043sy-Ap
 for linux-mediatek@lists.infradead.org; Wed, 03 Nov 2021 04:24:35 +0000
Received: by mail-il1-x12b.google.com with SMTP id i9so1269006ilu.8
 for <linux-mediatek@lists.infradead.org>; Tue, 02 Nov 2021 21:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qd9niP3KfEBMw4HIl0dxDVF+NpZQ1ObcVJeYPjAsGSc=;
 b=HPtJMRW5T8UxUkbBR6GaM63fFwANkJW6W9Bif4jilZl+sVzZSwZ1/A0VDVRuvcxg01
 TeJn8wEHZi8eGbuexfg5M4xTXOhj9T9JpIx+WeE9g2sMuKGHYIuRRTbmZkQt7GQLiEoP
 rI2LD+XBU5OE14Y19R6r5EqQue09SKki/n10I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qd9niP3KfEBMw4HIl0dxDVF+NpZQ1ObcVJeYPjAsGSc=;
 b=EnyBnwwY8ZEUZE71ZOl61G9sIFw3sIFBsslv2hC9+viggFw3ZAl2HbqSnYh95ur4U2
 qfu3P4fl5g4jQ7cP8a5XJUK27bqHzsf0opLM5CpSUYou9qm3V1HHI/O4ilRWB1tgKhIs
 ip4wleNUQdDFx75lGCcJxI6GRZdSenlx0Ej8AQrYWbNqmK2AGXLh3E6zDsYP5RBeXyhD
 YJBLm7CJQ28FqL+Ye7sl0QCu84Y3xrfUXPxPGm3yhWoI2wiHa8jszP4aXuSKyIgEt1NF
 QJYVBoqdPpTa2Kww7xBRN/8ZgAfEYkG5pe1b3z+WVlgaKilP+tKJ7gL70lBsEv+Zsa/4
 v70Q==
X-Gm-Message-State: AOAM5313Q/XA3XLH6B2W6qAf19Ktkgr+Tep5a2t2IWvkEkeiaQsbjvBm
 BT0wIDCq1TxF9BI1hPgSqxDUHmX+7SCyvAFVuQq5Vw==
X-Google-Smtp-Source: ABdhPJy3oZIzJMttIMrK4JQVP+jPpcvnejYcs3cfvoEQi/cY6TDF0e9IPwvsIsX+mmqGss9bK7IZIXnvXQrZKbO7xvk=
X-Received: by 2002:a05:6e02:1aa2:: with SMTP id
 l2mr17121937ilv.114.1635913472602; 
 Tue, 02 Nov 2021 21:24:32 -0700 (PDT)
MIME-Version: 1.0
References: <20211103033044.2777-1-ben.tseng@mediatek.com>
In-Reply-To: <20211103033044.2777-1-ben.tseng@mediatek.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Wed, 3 Nov 2021 12:24:06 +0800
Message-ID: <CAJMQK-jJYoBLoY2aw=BuhowJ7AENK_8y=GHVq5opHKfq5gD45Q@mail.gmail.com>
Subject: Re: [PATCH 1/1] arm64: dts: mt8183-kukui: Update Tboard sensor
 mapping table
To: Ben Tseng <ben.tseng@mediatek.com>
Cc: Fan Chen <fan.chen@mediatek.com>, Zhang Rui <rui.zhang@intel.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-pm@vger.kernel.org, 
 srv_heupstream@mediatek.com, Eduardo Valentin <edubezval@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211102_212434_429597_923F94DC 
X-CRM114-Status: GOOD (  16.32  )
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

On Wed, Nov 3, 2021 at 11:31 AM Ben Tseng <ben.tseng@mediatek.com> wrote:
>
> According to auxadc change the readback value from raw data to Vsense.
> Update the tboard table that temperature map to Vsense.
>
> pull-up voltage: 1800 mv
> pull-up resistor: 75K
>
> Vsense = pull-up voltage * Rntc / ( pull-up resistor + Rntc )
>
> Signed-off-by: Ben Tseng <ben.tseng@mediatek.com>
>

Tested-by: Hsin-Yi Wang <hsinyi@chromium.org>

> ---
>  .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 108 +++++++++---------
>  1 file changed, 54 insertions(+), 54 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> index 8e9cf36a9a41..65447de64f06 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> @@ -151,33 +151,33 @@
>                 #thermal-sensor-cells = <0>;
>                 io-channels = <&auxadc 0>;
>                 io-channel-names = "sensor-channel";
> -               temperature-lookup-table = <    (-5000) 4241
> -                                               0 4063
> -                                               5000 3856
> -                                               10000 3621
> -                                               15000 3364
> -                                               20000 3091
> -                                               25000 2810
> -                                               30000 2526
> -                                               35000 2247
> -                                               40000 1982
> -                                               45000 1734
> -                                               50000 1507
> -                                               55000 1305
> -                                               60000 1122
> -                                               65000 964
> -                                               70000 827
> -                                               75000 710
> -                                               80000 606
> -                                               85000 519
> -                                               90000 445
> -                                               95000 382
> -                                               100000 330
> -                                               105000 284
> -                                               110000 245
> -                                               115000 213
> -                                               120000 183
> -                                               125000 161>;
> +               temperature-lookup-table = <    (-5000) 1553
> +                                               0 1488
> +                                               5000 1412
> +                                               10000 1326
> +                                               15000 1232
> +                                               20000 1132
> +                                               25000 1029
> +                                               30000 925
> +                                               35000 823
> +                                               40000 726
> +                                               45000 635
> +                                               50000 552
> +                                               55000 478
> +                                               60000 411
> +                                               65000 353
> +                                               70000 303
> +                                               75000 260
> +                                               80000 222
> +                                               85000 190
> +                                               90000 163
> +                                               95000 140
> +                                               100000 121
> +                                               105000 104
> +                                               110000 90
> +                                               115000 78
> +                                               120000 67
> +                                               125000 59>;
>         };
>
>         tboard_thermistor2: thermal-sensor2 {
> @@ -185,33 +185,33 @@
>                 #thermal-sensor-cells = <0>;
>                 io-channels = <&auxadc 1>;
>                 io-channel-names = "sensor-channel";
> -               temperature-lookup-table = <    (-5000) 4241
> -                                               0 4063
> -                                               5000 3856
> -                                               10000 3621
> -                                               15000 3364
> -                                               20000 3091
> -                                               25000 2810
> -                                               30000 2526
> -                                               35000 2247
> -                                               40000 1982
> -                                               45000 1734
> -                                               50000 1507
> -                                               55000 1305
> -                                               60000 1122
> -                                               65000 964
> -                                               70000 827
> -                                               75000 710
> -                                               80000 606
> -                                               85000 519
> -                                               90000 445
> -                                               95000 382
> -                                               100000 330
> -                                               105000 284
> -                                               110000 245
> -                                               115000 213
> -                                               120000 183
> -                                               125000 161>;
> +               temperature-lookup-table = <    (-5000) 1553
> +                                               0 1488
> +                                               5000 1412
> +                                               10000 1326
> +                                               15000 1232
> +                                               20000 1132
> +                                               25000 1029
> +                                               30000 925
> +                                               35000 823
> +                                               40000 726
> +                                               45000 635
> +                                               50000 552
> +                                               55000 478
> +                                               60000 411
> +                                               65000 353
> +                                               70000 303
> +                                               75000 260
> +                                               80000 222
> +                                               85000 190
> +                                               90000 163
> +                                               95000 140
> +                                               100000 121
> +                                               105000 104
> +                                               110000 90
> +                                               115000 78
> +                                               120000 67
> +                                               125000 59>;
>         };
>  };
>
> --
> 2.18.0
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
