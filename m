Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7E10C54EED
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Jan 2023 12:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FL2dHGJjEYE8OY//NcFpWWsenwt6CU6e+9LYkJshbe4=; b=l5zYmKTMAaj9wp08JJ3GYdwm0D
	ieK5+PrSwF+dRBB4Wj4D+X7vdwalBgSSDk6FE/mL1ZB+p8l8ke21bFOOwr3s2dYgqZYz71vwjC/dB
	oPk9lgqN2nHrhtqR6gd+JSuEStrz/7po7psCv/kf6OxM7iVDNRBSCTeRPr9rwHvfaFrgE9yzXRt7p
	PXB4EgAN9CpWuJ+FKqiYRQjxUIU1JR5PO5BYBiFVq0gnOah6fobrljXkKP/Vx5suDeenu7jBXz4Xx
	n/nXQ0aeb5XUwbx495nt2YCz79YHlKhp8BV8Fv3/TdAVyxXHNiOWdgD9ZrxJfbPHxd+E543Eot3Hb
	JomRFMOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMTAU-003Tpa-Ck; Mon, 30 Jan 2023 12:21:50 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMT9C-003TfA-6D
	for linux-mediatek@lists.infradead.org; Mon, 30 Jan 2023 12:20:32 +0000
Received: by mail-ej1-x62d.google.com with SMTP id mf7so12432983ejc.6
        for <linux-mediatek@lists.infradead.org>; Mon, 30 Jan 2023 04:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FL2dHGJjEYE8OY//NcFpWWsenwt6CU6e+9LYkJshbe4=;
        b=f+d4H8f65ho5m5JIBQtXtySS9zntSA7sF6OHMQ8GhfQAmDn9yu0oJpE5PNiLTNOKV4
         pTi63x5+EsQTU3DJNTyMucRghLGhySOZlltfPKN14A4gq1jugBkyhxPrqdu7rHphv03y
         m6yBcfgo0BIK4BIwFAdlJdyQTtaCVxMQBKWBzkE5IzurnCkx0JOEnnd/mX4R6eIDcE7h
         NbHv2TsH08CU3VXVgLwwfUmdcOq0lWrRctrJhvS3MTXVLJLfKYwA525Dy5WUxDNFDcHJ
         nv83wjq3aosXh42vdc1Jp3rkt3odVOuYPu/yF1lrp8r870EuMdC9rabLWXoLZFtzJ05Z
         oUoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FL2dHGJjEYE8OY//NcFpWWsenwt6CU6e+9LYkJshbe4=;
        b=tmC9IYa6GDAwfulVTVKu/8Bl+3h1KJyt2QzicPCZj2TjBHmZLLBKqpKvXj5Qz2zqfa
         zangREv8k4uvlHyZPsGXSFLpL7nCPp5/NeJVWszSE0fNoSU81a4KevzCRfO8GtgCFd6G
         Uj0doa1jWMxDvdC/zTm09oFK3cn14C7rkKhs+DxYYouQHBjKHGxIu5QBGyD0wT6qVkp6
         K/mcLLvjo72pDaAUCbM38dtGaO6gGtm9o+D0l600KZqcU0SXqe8de9E3L4QEOS6dlNj/
         aE+JqU4/Ltpy7SF6wcaDGK7layYhcy5YdIn2OAPOtb0fhjwcMLRs3mmIiRW9u+dk3zxx
         df9A==
X-Gm-Message-State: AO0yUKWIN6C27J9I3pzC0k+T7loccYGlHM5fcrz+A0OcQ/UQWGnvz2Ic
	/shE/XgTN+Jwzrm5oS+WzyoxeKg3Zxkw7HqzW/JsXg==
X-Google-Smtp-Source: AK7set9g61hpeeb4JnsWVEtBrmZIj2cvkjEsVbxUu4DjJ4fLFNlWw0qfr3//ipZzw08rjXbZqJnPCkhrLHT8XTfmgFQ=
X-Received: by 2002:a17:906:eced:b0:878:4ea8:6c2f with SMTP id
 qt13-20020a170906eced00b008784ea86c2fmr4214308ejb.115.1675081226939; Mon, 30
 Jan 2023 04:20:26 -0800 (PST)
MIME-Version: 1.0
References: <20230124131717.128660-3-bchihi@baylibre.com> <20230126161048.94089-1-bchihi@baylibre.com>
 <5ec49108-6ad8-daf7-54ec-104f0923a31d@linaro.org> <CAGuA+opQboxH8qoNv4GG+raX=ZZAyRVLC9VLjVCzbT_cUQWWTA@mail.gmail.com>
 <b4bec164-5986-718e-b9cc-290dfc995edb@gmail.com>
In-Reply-To: <b4bec164-5986-718e-b9cc-290dfc995edb@gmail.com>
From: Balsam CHIHI <bchihi@baylibre.com>
Date: Mon, 30 Jan 2023 13:19:50 +0100
Message-ID: <CAGuA+ooSK-rzeqbFoTX3Bnnp_TH=0Uiu7Nxs_1YiTiKK4w5qtw@mail.gmail.com>
Subject: Re: [PATCH v12 2/6] dt-bindings: thermal: mediatek: Add LVTS thermal
 controllers dt-binding definition
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, daniel.lezcano@linaro.org, 
	angelogioacchino.delregno@collabora.com, rafael@kernel.org, amitk@kernel.org, 
	rui.zhang@intel.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	rdunlap@infradead.org, ye.xingchen@zte.com.cn, p.zabel@pengutronix.de, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, khilman@baylibre.com, james.lo@mediatek.com, 
	rex-bc.chen@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_042030_253940_A262566C 
X-CRM114-Status: GOOD (  25.72  )
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

Hi Matthias,

On Mon, Jan 30, 2023 at 12:18 PM Matthias Brugger
<matthias.bgg@gmail.com> wrote:
>
>
>
> On 30/01/2023 11:40, Balsam CHIHI wrote:
> > Hi Krzysztof,
> >
> > Thank you for the feedback.
> >
> > On Sat, Jan 28, 2023 at 11:48 AM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> On 26/01/2023 17:10, bchihi@baylibre.com wrote:
> >>> From: Balsam CHIHI <bchihi@baylibre.com>
> >>>
> >>> Add LVTS thermal controllers dt-binding definition for mt8195.
> >>
> >> Subject: drop second/last, redundant "dt-binding definition". The
> >> "dt-bindings" prefix is already stating that these are bindings.
> >
> > fixed.
> > The patch title has been fixed as you suggested :
> > "dt-bindings: thermal: mediatek: Add LVTS thermal controllers"
> >
> >>
> >> Plus two comments at the end.
> >>
> >>>
> >>> Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
> >>> ---
> >>> Changelog:
> >>>    v12:
> >>>       - Fixed subject prefix
> >>>       - Fixed licences GPL-2.0+ to GPL-2.0
> >>>       - Added dual licenses
> >>
> >>
> >>> +    };
> >>> diff --git a/include/dt-bindings/thermal/mediatek-lvts.h b/include/dt-bindings/thermal/mediatek-lvts.h
> >>> new file mode 100644
> >>> index 000000000000..902d5b1e4f43
> >>> --- /dev/null
> >>> +++ b/include/dt-bindings/thermal/mediatek-lvts.h
> >>
> >> Same filename as bindings.
> >
> > fixed.
> > rename :
> > include/dt-bindings/thermal/mediatek-lvts.h =>
> > include/dt-bindings/thermal/mediatek-lvts-thermal.h
> >
>
> I think it should be
> include/dt-bindings/thermal/mediatek,lvts-thermal.yaml

OK,
I will change it like that.
(".h" and not ".yaml" I believe (just to be sure).).

>
> Regards,
> Matthias
>
> >>
> >>> @@ -0,0 +1,19 @@
> >>> +/* SPDX-License-Identifier: (GPL-2.0 or MIT) */
> >>
> >> Although this is correct, any reason why not using exactly the same
> >> license as bindings?
> >
> > fixed.
> > both files are now using the same license :
> > "SPDX-License-Identifier: (GPL-2.0 or MIT)"
> >
> >>
> >>> +/*
> >>> + * Copyright (c) 2023 MediaTek Inc.
> >>> + * Author: Balsam CHIHI <bchihi@baylibre.com>
> >>> + */
> >>
> >> Best regards,
> >> Krzysztof
> >>
> >
> > I'll send the changes soon.
> >
> > Best regards,
> > Balsam

Best regards,
Balsam

