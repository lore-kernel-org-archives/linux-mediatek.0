Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 020C2C54EAA
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Jan 2023 10:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fdNUPffFvmZrBuodDbaQxrLCKtYnZUu/RnBAFeTehl4=; b=Xgu97wgPcZn28/r2+WHLSAefjN
	WfkCiErxsdUQ70CfNreraVbOV94VZVg+hw7WczCefsREHIxSy/cQEwI+OVxgXqRM33Z9AYHY5m8gx
	Cth24EBmQE2woqYfuM2D1cFKkoqA5i2CQPvgyV3TBvEiVb2cOPNBfrjSOPOcTnLQ8UIThkQyv4wDT
	s168S7aHc+e3U6cO1E6brzy5862DrG/Fls9igJXKaL3ifs6Fc2lYSHfnHyz/XEjp0odZzjAaCkLXp
	2ez4p0ceAZTo+ZFvHz1chjPzsnXFeafCxhm4Uz9pzarVxK2YPrkn5b5jLzGqOCaF7GrgJTmb0S1MO
	FuJlAzWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMRcI-003AIY-1f; Mon, 30 Jan 2023 10:42:26 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMRaa-003A9P-W3
	for linux-mediatek@lists.infradead.org; Mon, 30 Jan 2023 10:40:43 +0000
Received: by mail-ej1-x631.google.com with SMTP id m2so29931042ejb.8
        for <linux-mediatek@lists.infradead.org>; Mon, 30 Jan 2023 02:40:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fdNUPffFvmZrBuodDbaQxrLCKtYnZUu/RnBAFeTehl4=;
        b=a2NRjekX1BfZ9QTLs6Qgo7mu/qYSpCZY4kuWbHpJX4+D72h350igExn6viCpYRlecV
         /0pWnosUN9yVKUm0jdvVypK0arvG4GaSstEAinU7aaigbVStLP0fRzhcmTb9nIsU9HVb
         6uLOjsBjJzkpqRR3XDhRnb1H6E+TgUx9ctWBsVkwCB9J5S51f0myvsf0Sc4Sbw+eG1X6
         m/I3QqddCot7i5eOcL2PMn3nkrIkneB09Y606dBle5CUM5W09FrhIhZFGQcw8+NBM8Wu
         c+Q7SjByjaUg94IRP9xDkz+vAJCRocnaXZ2MXSDQonUdK9SzOeYI6kzN/3msG/ZX4u6E
         GAkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fdNUPffFvmZrBuodDbaQxrLCKtYnZUu/RnBAFeTehl4=;
        b=BytGATSP71tQfUyT7QyCwo5LR/e04pEdxWoQqhDQtUuqcu5MnddczWcoWYyXxDvZ5V
         R76Li1VEnDqBKlyf6GJupv4RA0jjxqsW97BtBR3I0hGyjCf+p8+tMJcauwrupC0w0gYc
         3vKAb080j5cnGt99K3pRfnD5K+ocxzNKwhrADrAYJn2Y1Hc/VQVP33hUivVXpgFXLMvm
         J1da7X9Ro6+vJADnILPcrb42BfTxeMyZIl69UR0ELR7GRnYvgphj4vL84C99Ala5VM4D
         2qP81UbMNwujNU/Z08bbRPhm/vJPDqVWdfnGNGVI5VOgwXIOXqWc2QqYfoEIGgYu+Ezn
         xbFg==
X-Gm-Message-State: AFqh2kqa0f3q5/O5MEZRmLW4LCm1QmxzkpmsFkDftROuFUgxUzldbxKk
	owGFn9UoT9xxrSTDqnsQnv/Kf35MucA7fGY2O4zCsQ==
X-Google-Smtp-Source: AMrXdXschNa1yyE4yyXfnHt7bxuX8pZDNHXkMneEpkjyfpKCpzB4G3AuW7kler2jR3lAb6d0ud+riMwnij52Z0VjIV4=
X-Received: by 2002:a17:906:30c1:b0:877:4531:b133 with SMTP id
 b1-20020a17090630c100b008774531b133mr8032986ejb.37.1675075239722; Mon, 30 Jan
 2023 02:40:39 -0800 (PST)
MIME-Version: 1.0
References: <20230124131717.128660-3-bchihi@baylibre.com> <20230126161048.94089-1-bchihi@baylibre.com>
 <5ec49108-6ad8-daf7-54ec-104f0923a31d@linaro.org>
In-Reply-To: <5ec49108-6ad8-daf7-54ec-104f0923a31d@linaro.org>
From: Balsam CHIHI <bchihi@baylibre.com>
Date: Mon, 30 Jan 2023 11:40:03 +0100
Message-ID: <CAGuA+opQboxH8qoNv4GG+raX=ZZAyRVLC9VLjVCzbT_cUQWWTA@mail.gmail.com>
Subject: Re: [PATCH v12 2/6] dt-bindings: thermal: mediatek: Add LVTS thermal
 controllers dt-binding definition
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
X-CRM114-CacheID: sfid-20230130_024041_050539_DD0A644F 
X-CRM114-Status: GOOD (  18.57  )
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

Thank you for the feedback.

On Sat, Jan 28, 2023 at 11:48 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 26/01/2023 17:10, bchihi@baylibre.com wrote:
> > From: Balsam CHIHI <bchihi@baylibre.com>
> >
> > Add LVTS thermal controllers dt-binding definition for mt8195.
>
> Subject: drop second/last, redundant "dt-binding definition". The
> "dt-bindings" prefix is already stating that these are bindings.

fixed.
The patch title has been fixed as you suggested :
"dt-bindings: thermal: mediatek: Add LVTS thermal controllers"

>
> Plus two comments at the end.
>
> >
> > Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
> > ---
> > Changelog:
> >   v12:
> >      - Fixed subject prefix
> >      - Fixed licences GPL-2.0+ to GPL-2.0
> >      - Added dual licenses
>
>
> > +    };
> > diff --git a/include/dt-bindings/thermal/mediatek-lvts.h b/include/dt-bindings/thermal/mediatek-lvts.h
> > new file mode 100644
> > index 000000000000..902d5b1e4f43
> > --- /dev/null
> > +++ b/include/dt-bindings/thermal/mediatek-lvts.h
>
> Same filename as bindings.

fixed.
rename :
include/dt-bindings/thermal/mediatek-lvts.h =>
include/dt-bindings/thermal/mediatek-lvts-thermal.h

>
> > @@ -0,0 +1,19 @@
> > +/* SPDX-License-Identifier: (GPL-2.0 or MIT) */
>
> Although this is correct, any reason why not using exactly the same
> license as bindings?

fixed.
both files are now using the same license :
"SPDX-License-Identifier: (GPL-2.0 or MIT)"

>
> > +/*
> > + * Copyright (c) 2023 MediaTek Inc.
> > + * Author: Balsam CHIHI <bchihi@baylibre.com>
> > + */
>
> Best regards,
> Krzysztof
>

I'll send the changes soon.

Best regards,
Balsam

