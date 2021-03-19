Return-Path: <SRS0=VEyR=IR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53B33C4332D
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Mar 2021 14:13:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F247264F18
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Mar 2021 14:13:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F247264F18
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mb+GTuXkWggPdCSp8CX2vW6bkPJtKApzsD6DtX8XHuI=; b=K/fzcug6tKUYCZDohZ5XWGGPn
	PSjLP3QcGAttbI71+Ewh0iyWhtVgmSJnMPda12m5nWE2U811qL5zTVK6Xhl9aMqV8F1fS+FFl33pt
	y6q6s1Cea7wYUSf2MbTLo0xLKhRZSS2Iw6iDk2HiP+kpzGnJ1n40qsqUU9zbnwcl7amwtqp7C+Twi
	V4qyr+f8uAW0F4o8l2MiPFzaG90HKdFZYxbUlReXGSxOjDISj7yRLeHJmaUN8Kj3SShxvQ0odDzFC
	VX6axPWUAj4Kso+mqYL4cr5KjtGKptzb+ljkQDS8zuxff1GMN9iaUCo70tW4IYrB5qmOzi77gLjQ0
	lF+Ur1ulA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lNFsN-007WWF-7P; Fri, 19 Mar 2021 14:13:19 +0000
Received: from mail-vk1-xa33.google.com ([2607:f8b0:4864:20::a33])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lNFsJ-007WUh-5b
 for linux-mediatek@lists.infradead.org; Fri, 19 Mar 2021 14:13:16 +0000
Received: by mail-vk1-xa33.google.com with SMTP id h136so258431vka.7
 for <linux-mediatek@lists.infradead.org>; Fri, 19 Mar 2021 07:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kT7+B2/flieu5ujbkJnPLuQBBNLwKu9lAXheORirHr4=;
 b=U1yMXLigO4H7ah1+jp3sxNQNipWk46ztH98A3rCkQbklXq8Bq3Vs49yDHfqi9yrx5T
 03+sjIWHWjiKuEjfuGvYnjmw1ZBoAjXhzB688boq5L93ygDzDJkDh/TsjT4vo9ZUEGQT
 ZOACxRfEVcNH+O1z+OSCIQJ3waQbv0/wcsvv9Xq3IiHyMB5JW00ni0CL+W5tS05HYnxd
 DMcQeAaCArs5mqu1sgmxhE76BN6zq6aDUR9O2jPGwLgFFfWtuS4bO5eXWKH5/tYjPC3F
 198SNZ6lXRMWfqlp6lKO35cN/CZqkOYit5Rc3naNI3qdCJQjsk82bJcFgX76nHR/yzCI
 pf3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kT7+B2/flieu5ujbkJnPLuQBBNLwKu9lAXheORirHr4=;
 b=aPqDBVhgvDVYnGap7ch7tM8PlD6anVYTNbkV9OsEtlyZxA44NKq0po57PMbXrxQcb7
 V2X7++9OwGrk0Gz3zf03awmxFMD+Gs9tbnPTGLhgx0/20aXGU0B2GYVXBt9x7SGjHKI6
 nfqJhNyC+co2Hm2KnezEy7Kx1xxIA5nujBAnhS+NpfmUbGMPgrKWqkCozf6qWmZDClrE
 OGXZ2Wn1fsB2bsxbCfOR40Bifce/91O36W2bWyb96fS94J0TKUTictR4+I7X0kbqFb3I
 IooTK8ud4WgdsUlwX4V3hPS97wdv8u0FG7+6Tn5Tu+IATdAIjEYA3IBURoXY97ajWOUm
 zLwg==
X-Gm-Message-State: AOAM532IilSynSC7RPvtpc70q6apaoQZR3053GG+mby2BafHiS/M+JkY
 aOtkVIGhBDnVQ1s0yO/nHwPwPZox/KFlM9zPR8hA+Q==
X-Google-Smtp-Source: ABdhPJyrCbfKFwzf3QvB/HbP0vNpYxFsspYHELQ6mbVNuzXPsE5ygCViGVapYNlX1ysNdx57pfIQk/9Uhjv0wFXLckU=
X-Received: by 2002:a1f:b408:: with SMTP id d8mr2905520vkf.8.1616163193433;
 Fri, 19 Mar 2021 07:13:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210319023427.16711-1-seiya.wang@mediatek.com>
 <20210319023427.16711-6-seiya.wang@mediatek.com>
In-Reply-To: <20210319023427.16711-6-seiya.wang@mediatek.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 19 Mar 2021 15:12:36 +0100
Message-ID: <CAPDyKFqWdJdF__c_=aqV_bjBNwh+-YY5xMy0_SWK9WJaOafawQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] dt-bindings: mmc: Add compatible for Mediatek
 MT8195
To: Seiya Wang <seiya.wang@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, Fabien Parent <fparent@baylibre.com>, 
 Sean Wang <sean.wang@mediatek.com>, Zhiyong Tao <zhiyong.tao@mediatek.com>, 
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Wenbin Mei <wenbin.mei@mediatek.com>, 
 Stanley Chu <stanley.chu@mediatek.com>, DTML <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-iio@vger.kernel.org, linux-mmc <linux-mmc@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-serial@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, srv_heupstream <srv_heupstream@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210319_141315_283653_9170203D 
X-CRM114-Status: GOOD (  14.56  )
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

On Fri, 19 Mar 2021 at 03:36, Seiya Wang <seiya.wang@mediatek.com> wrote:
>
> This commit adds dt-binding documentation of mmc for Mediatek MT8195 SoC
> Platform.
>
> Signed-off-by: Seiya Wang <seiya.wang@mediatek.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> index 01630b0ecea7..8648d48dbbfd 100644
> --- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> @@ -31,6 +31,7 @@ properties:
>            - const: mediatek,mt2701-mmc
>        - items:
>            - const: mediatek,mt8192-mmc
> +          - const: mediatek,mt8195-mmc
>            - const: mediatek,mt8183-mmc
>
>    clocks:
> --
> 2.14.1
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
