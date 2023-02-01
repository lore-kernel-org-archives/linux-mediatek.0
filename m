Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46C3AC636CD
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Feb 2023 13:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k4VwuwtgZtq1ti3EeGY2JOmL4BYr72ga4OVhNU+OrY4=; b=EzANROvO6fbGIYvTXoOYZE+wTT
	7G40tDovxiqTTI/AVH4nZbvSQV9kcLTjZKRxSNzXnWgAgq7sO0L33uYHMRkyX00WVLD2c/N1WmvOK
	O1esxhDkRr4mDiEUm/SnCOap+IMooBUrh2hoZ8BemFWw+ObrL77n05sLl6cV4oRUK/ZIIaJqD5V+P
	5UBWP5eVPcezRpPYRhsWM6VzmgB6t+OMYUiQnD9jxBl+S8Qy2TSPhC89WVbmzPh6jNrTruVmqQfpu
	c48naEsbSIn7nbV9hGAIC0jDQql5MClQvk/689MY+b1hMEJBwMKLIdlDGAur0RBFgc93s1iVdYeXI
	lquMwiHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNDH7-00C66b-Ml; Wed, 01 Feb 2023 13:35:45 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNDGv-00C631-Ja
	for linux-mediatek@lists.infradead.org; Wed, 01 Feb 2023 13:35:36 +0000
Received: by mail-ej1-x62d.google.com with SMTP id gr7so26868870ejb.5
        for <linux-mediatek@lists.infradead.org>; Wed, 01 Feb 2023 05:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k4VwuwtgZtq1ti3EeGY2JOmL4BYr72ga4OVhNU+OrY4=;
        b=0frF27fZx+6imZaK5dMMUJYkCLv7E3n07pHWy9l7M5RdX5h5sY84rASPhGo12MSyqh
         DBon39G91SuZxeJFn8eywKQWp0ndzniUMJbJKpAX7F5nUe8RcTVPALjVzbRIQpodG2cj
         91VT7qaXz2f8pLqfJASl5Wlm8eQo8t0oB6YUaMkMj0UAYvAHRWLanu1PZmxlIBbqZSQb
         VbjaFrZq2IdYf0MY2TnXiS7aoD5JnPCymizvGyszBc1pFGoqh+D08RbpprBWskAUzLSI
         onxTk0Ublflefn0geGpqM9fsoYpTXMZLvPNMxGHnQ8lc+7gQ4OIyT1O9AzrlMHDyhibF
         1QDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k4VwuwtgZtq1ti3EeGY2JOmL4BYr72ga4OVhNU+OrY4=;
        b=Woq+FPaCIzqiAuH+VCShLb1IwN1I/GyeoLa9ZEAEk1s67jTgAJtzcE2RmFdZKduza0
         ehULZxPbAgA6ColoyY9F9J3tYLUc/fEd5xv/NGYQLwh9OC/ncxAjmxmo2EaFYL6wvdP2
         wBuN+kw5Duz/87E/l0cRgIVwVMlnixWTv2ANYBNM2rx2cAr3Zr8w0XA3moMnzUX/upZP
         0YtrJKUZqCABzZ3McB6cXZWRhzcl/cL9HsyTFvVQD4xgFijjfo3vi2RzSGvmWy/J+CJ/
         IkhxkcJhoT8WnuFiBzafJSeWi7bUcCkYingFB02ZM9VjJxOb8nGM3bkKOSUJNkt6Bth2
         LwpA==
X-Gm-Message-State: AO0yUKWmCqjJ5qTxuLt6XAZAcQvFVSdO6Hci9ze8n6YDJGTOCGAvj+GP
	c3P1M9AzSM8QShaAwAcniIG0/sO31keR6vyjUrWTlA==
X-Google-Smtp-Source: AK7set8BFOlTCnT511Iaq+5NBhbakp8KKqSscHi9Cu3wuzYDZjLZJGfNZFuxVCGf0UMgSIS2t3bDhTfhwol1xesnxsE=
X-Received: by 2002:a17:906:1803:b0:7c0:f45e:22ff with SMTP id
 v3-20020a170906180300b007c0f45e22ffmr811427eje.104.1675258531262; Wed, 01 Feb
 2023 05:35:31 -0800 (PST)
MIME-Version: 1.0
References: <20230126161048.94089-1-bchihi@baylibre.com> <20230131140439.600164-1-bchihi@baylibre.com>
 <ab3357ad-01ec-8a1a-d627-a1543874f0ef@linaro.org>
In-Reply-To: <ab3357ad-01ec-8a1a-d627-a1543874f0ef@linaro.org>
From: Balsam CHIHI <bchihi@baylibre.com>
Date: Wed, 1 Feb 2023 14:34:55 +0100
Message-ID: <CAGuA+oqXN3eoVyYkjuZjefPa-q542b7QLkBv+E-0a7k3U8BbFA@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: thermal: mediatek: Add LVTS thermal controllers
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
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_053533_931276_67273D3F 
X-CRM114-Status: GOOD (  34.48  )
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

Hi Krzysztof

On Wed, Feb 1, 2023 at 8:46 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 31/01/2023 15:04, bchihi@baylibre.com wrote:
> > From: Balsam CHIHI <bchihi@baylibre.com>
> >
> > Add LVTS thermal controllers dt-binding definition for mt8195.
> >
> > Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
> > ---
> > Changelog:
> >   v3:
> >      - Fixed subject prefix
> >      - Fixed licenses GPL-2.0-only OR BSD-2-Clause
> >        to GPL-2.0 OR MIT (to match DT)
> >      - Fixed matching dt-binding file names
>
> If this is v3 with only one patch, where is the driver or DTS using
> these bindings? Please link it. It's unusual to see only bindings,
> without the users.

sorry, I'll be careful next time.
and I will take into account the new change requests in the next full
version of the series.
I apologize for the mess.

>
> >   v2:
> >      - Fixed subject prefix
> >      - Fixed licenses GPL-2.0+ to GPL-2.0
> >      - Added dual licenses
>
> Is there a reason to make our review more difficult and keep versions
> broken, threads attached to some other threads?

sorry again.

>
> ------------
>
> Grabbing thread from
> lore.kernel.org/all/20230131140439.600164-1-bchihi%40baylibre.com/t.mbox.=
gz
> Checking for newer revisions on https://lore.kernel.org/all/
> Analyzing 38 messages in the thread
> Will use the latest revision: v12
> You can pick other revisions using the -vN flag
> Checking attestation on all messages, may take a moment...
> ---
>   =E2=9C=93 [PATCH v12] thermal: drivers: mediatek: Add the Low Voltage T=
hermal
> Sensor driver
>     =E2=9C=93 Signed: DKIM/baylibre-com.20210112.gappssmtp.com (From:
> bchihi@baylibre.com)
>     + Link:
> https://lore.kernel.org/r/20230131153816.21709-1-bchihi@baylibre.com
>   =E2=9C=93 [PATCH v12 2/6] dt-bindings: thermal: mediatek: Add LVTS ther=
mal
> controllers dt-binding definition
>     =E2=9C=93 Signed: DKIM/baylibre-com.20210112.gappssmtp.com (From:
> bchihi@baylibre.com)
>     + Link:
> https://lore.kernel.org/r/20230126161048.94089-1-bchihi@baylibre.com
>   ERROR: missing [3/1]!
>   ERROR: missing [4/1]!
>   ERROR: missing [5/1]!
>   ERROR: missing [6/1]!
>
> --------
>
> b4 diff '<20230131140439.600164-1-bchihi@baylibre.com>'
> Checking for older revisions on https://lore.kernel.org/all/
> ---
> Analyzing 38 messages in the thread
> Assuming new revision: v4 ([PATCH v12] thermal: drivers: mediatek: Add
> the Low Voltage Thermal Sensor driver)
> Preparing fake-am for v3: dt-bindings: thermal: mediatek: Add LVTS
> thermal controllers
>   range: 291580cde5f6..de7fe5e0293a
> Preparing fake-am for v12: arm64: dts: mediatek: mt8195: Add thermal
> zones and thermal nodes
>   ERROR: Could not find matching blob for
> arch/arm64/boot/dts/mediatek/mt8195.dtsi (09df105f4606)
>          If you know on which tree this patchset is based,
>          add it as a remote and perform "git remote update"
>          in order to fetch the missing objects.
> ---
> Could not create fake-am range for upper series v12
>
>
> > ---
> > ---
> >  .../thermal/mediatek,lvts-thermal.yaml        | 107 ++++++++++++++++++
> >  .../thermal/mediatek,lvts-thermal.h           |  19 ++++
> >  2 files changed, 126 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/thermal/mediatek,=
lvts-thermal.yaml
> >  create mode 100644 include/dt-bindings/thermal/mediatek,lvts-thermal.h
> >
> > diff --git a/Documentation/devicetree/bindings/thermal/mediatek,lvts-th=
ermal.yaml b/Documentation/devicetree/bindings/thermal/mediatek,lvts-therma=
l.yaml
> > new file mode 100644
> > index 000000000000..5fa5c7a1a417
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.y=
aml
> > @@ -0,0 +1,107 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR MIT)
>
> WARNING: DT binding documents should be licensed (GPL-2.0-only OR
> BSD-2-Clause)
> #24: FILE:
> Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml:1:
> +# SPDX-License-Identifier: (GPL-2.0 OR MIT)
>
> I asked you to use the binding license for header file. Then you changed
> binding license... why? Why do you need other SPDX text? Why do you need
> MIT?

I will put it back "GPL-2.0-only OR BSD-2-Clause" in the binding and
do the same for the header.

>
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/thermal/mediatek,lvts-thermal.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: MediaTek SoC Low Voltage Thermal Sensor (LVTS)
> > +
> > +maintainers:
> > +  - Balsam CHIHI <bchihi@baylibre.com>
> > +
> > +description: |
> > +  LVTS is a thermal management architecture composed of three subsyste=
ms,
> > +  a Sensing device - Thermal Sensing Micro Circuit Unit (TSMCU),
> > +  a Converter - Low Voltage Thermal Sensor converter (LVTS), and
> > +  a Digital controller (LVTS_CTRL).
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - mediatek,mt8195-lvts-ap
> > +      - mediatek,mt8195-lvts-mcu
>
> What about other devices? You called the file name as generic for all
> Mediatek SoCs, so why only one SoC is here? Is there going to be more?
> If yes, why they cannot be added now?

Yes, there is another MTK SoC mt8192 that supports LVTS,
I was asked in v10 of the series to remove the unimplemented SoC.
It will be added later with the driver that supports it.
just let me know if you still want to add mt8192 bindings in the next
version without the driver.
(LVTS support for mt8192 will be sent in a different series).

>
> Best regards,
> Krzysztof
>

