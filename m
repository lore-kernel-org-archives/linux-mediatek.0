Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E090C636CC
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Feb 2023 14:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sZ5mpqE2ocgxdfOCGy+CSBqlukMgoxHcZxwHA7en+qo=; b=QKxf1L1zOJf8pzXy5l2Spi6AC6
	zMDrLENHKaCvfHmWKcwLJbpkoKIZdW2nddeU5KRGSvPIJTTGiWKBYOUmiuJC+kYR2yborrep/r6ZG
	BMHQ8ZUxobmG98mzVmj0MqMpEB0HUGOdu4g6rvP1+DDnJEcX6aUVKhhDKVMdcxFmMOvpWBp3tZtqY
	eZmOiMh5sR3g3AlezE4F9EKa08XVSB2qZyl5u3ohWS2Ex7mMLRcumaj6etGzrvr2eMWTe79zVmOuP
	0OcsBfSJ1ZAum7IjHVrem8+sP73B1EwMJfYkcJko+rTZePepDyU6DiXfVllZpbDrzNF/3H13tYUXL
	Rdimxvng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPOhz-00CPDf-Oj; Tue, 07 Feb 2023 14:12:31 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPOhp-00CPAu-R2
	for linux-mediatek@lists.infradead.org; Tue, 07 Feb 2023 14:12:23 +0000
Received: by mail-ej1-x630.google.com with SMTP id c13so1657013ejz.1
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Feb 2023 06:12:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sZ5mpqE2ocgxdfOCGy+CSBqlukMgoxHcZxwHA7en+qo=;
        b=L5y670ucwvznmASN/AgU3Adj4DK9TRbO1/1YS+dn/0W79V62OSh3ZRPjtCulNArAWE
         ivzFlnK2NeAwdYtafs0lMvGfiH6K7jW+0Que/knBzosItpl7clydO5JDQfAoD+SCMNWK
         srqvl4iD1hYoDi36HJpgXDjxTHqXBnSjZNbu4692jQ9G5xa8usPfaPGDVtzDeMlX/rpT
         qaSIopQsD6R+m7ErR4b+qrfgAcSl78f3JkYiC7AhQEZgeMGDFkTTjYESoNDoxMbN0cRr
         odLHYw+6+82HUhV/gWdPCrf2cNxB0aO4vC70oa2SQlJflzZNMziU2XPjBThE/PSOd44z
         +PxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sZ5mpqE2ocgxdfOCGy+CSBqlukMgoxHcZxwHA7en+qo=;
        b=nPWxLDVEwJYutd24hsaSZl8BijJtcYyU7Ws3+pn8pF3c//p83n53CGpFFMWKxCuIok
         Gqn/gvYBpUHH8OZv/1JJuM3EUPDWjuuWy1c5I0AU8fpzXv8BXrrUlprMkxhfjKtnlok4
         +e24zm03GAvBzlzaT8Tku5vTrR0pEpj19AJitxCkR+g/8p6RxfYNOlqrfgfoGWpGnph4
         cKtqCRQuI6h7oZxyChv5UG7Y+NvbNBu/+JfPFNQnqgpUkdTt51joa8akTPrcY7w74gmT
         Z6PBq861ZU7OVmiQDNPBNT8C8RbggLAww6ItOOp7hDgC7nSacqwCJfwuLjOeL0IzcMOJ
         HoDg==
X-Gm-Message-State: AO0yUKV0ZicKIaC3fgs70DgKOcibk63hZ+IVZH5AexRqlr3gZFgz2buI
	z5qzn2yMvvjn4J9Sz9E4yB4HynEhVV+C9XO4K2AVug==
X-Google-Smtp-Source: AK7set/oFiHS7dnqOHD5CRTN/KUIGukzO1ouxhtBnCV18RKKz15grDjDu1XvBQC50v14OV0tRya/fbXqJ7mbQOxpli4=
X-Received: by 2002:a17:906:ca04:b0:7c0:f45e:22ff with SMTP id
 jt4-20020a170906ca0400b007c0f45e22ffmr999899ejb.104.1675779137174; Tue, 07
 Feb 2023 06:12:17 -0800 (PST)
MIME-Version: 1.0
References: <20230207130958.608305-1-bchihi@baylibre.com> <20230207130958.608305-3-bchihi@baylibre.com>
 <046b3b31-cbf7-674d-f05c-b825d6b46bf6@linaro.org>
In-Reply-To: <046b3b31-cbf7-674d-f05c-b825d6b46bf6@linaro.org>
From: Balsam CHIHI <bchihi@baylibre.com>
Date: Tue, 7 Feb 2023 15:11:40 +0100
Message-ID: <CAGuA+opvh95SXN-YGfxH0-NA8o4dBNkQJd9PfEXATFPbKHsHuA@mail.gmail.com>
Subject: Re: [PATCH v13 2/6] dt-bindings: thermal: mediatek: Add LVTS thermal controllers
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: daniel.lezcano@linaro.org, angelogioacchino.delregno@collabora.com, 
	rafael@kernel.org, amitk@kernel.org, rui.zhang@intel.com, 
	matthias.bgg@gmail.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	rdunlap@infradead.org, ye.xingchen@zte.com.cn, p.zabel@pengutronix.de, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, khilman@baylibre.com, james.lo@mediatek.com, 
	rex-bc.chen@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_061221_884521_41C3BBCE 
X-CRM114-Status: GOOD (  18.07  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Krzysztof,

Thank you for the review.

On Tue, Feb 7, 2023 at 2:35 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 07/02/2023 14:09, bchihi@baylibre.com wrote:
> > From: Balsam CHIHI <bchihi@baylibre.com>
> >
> > Add LVTS thermal controllers dt-binding definition for mt8192 and mt8195.
> >
>
>
> > +allOf:
> > +  - $ref: thermal-sensor.yaml#
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - mediatek,mt8192-lvts-ap
> > +              - mediatek,mt8192-lvts-mcu
> > +    then:
> > +      properties:
> > +        nvmem-cells:
> > +          maxItems: 1
> > +
> > +        nvmem-cell-names:
> > +          maxItems: 1
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - mediatek,mt8195-lvts-ap
> > +              - mediatek,mt8195-lvts-mcu
> > +    then:
> > +      properties:
> > +        nvmem-cells:
>
> minItems: 2
>

OK,
I will do the change.

> > +          maxItems: 2
> > +
> > +        nvmem-cell-names:
>
> minItems: 2
>

OK,
I will do this change too.

> > +          maxItems: 2
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
>
> (...)
>
> > diff --git a/include/dt-bindings/thermal/mediatek,lvts-thermal.h b/include/dt-bindings/thermal/mediatek,lvts-thermal.h
> > new file mode 100644
> > index 000000000000..4f2082065a31
> > --- /dev/null
> > +++ b/include/dt-bindings/thermal/mediatek,lvts-thermal.h
> > @@ -0,0 +1,19 @@
> > +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> > +/*
> > + * Copyright (c) 2023 MediaTek Inc.
> > + * Author: Balsam CHIHI <bchihi@baylibre.com>
> > + */
> > +
> > +#ifndef __MEDIATEK_LVTS_DT_H
> > +#define __MEDIATEK_LVTS_DT_H
> > +
> > +#define MT8195_MCU_BIG_CPU0          0
> > +#define MT8195_MCU_BIG_CPU1          1
> > +#define MT8195_MCU_BIG_CPU2          2
> > +#define MT8195_MCU_BIG_CPU3          3
> > +#define MT8195_MCU_LITTLE_CPU0       4
>
> These changed for some reason. Why? The indentation is now broken
> (although not visible above quote, but visible in diff and code).

I thought that I fixed the indentation.
I will restore it.

>
> Best regards,
> Krzysztof
>

Best regards,
Balsam

