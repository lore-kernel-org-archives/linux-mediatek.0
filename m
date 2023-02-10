Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FF7EC05027
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Feb 2023 09:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y4xwd6NcIcu0eUIOaah2w2G0LfRuN+4uyTHcTQv42t8=; b=bBE9ZJS30GkS2p/kLWKaaZoKmn
	7WhexARE7495Ksxth5lC33DHeBkdsXt7m8DZgS1KidPBF5bn4T/qAG/K9vlU7dxqQG+9+em/Hwytb
	oM7PFSHzmQJyRd1VYuW7DiUGP7+oXNfXK9RO46yaIZXtqancTNE5ohQexhjM3nph5wlwA+U7vBHB1
	csw3lmqvrSsAxPeGnJEynSxpP7P+TWWE5vCsJ/AzR9/P6/INIJOC7O0qURK+rAr74Oh7SGR9snbzB
	ykGv3GG7kiYC5EK0DLlHKvOk2iWbOmSvHIIwg4GrXY98hQsBhsWvA7neS3D2gqDbhqHRct2xXnPXX
	3XG8xA9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQPPJ-004xZC-QJ; Fri, 10 Feb 2023 09:09:25 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQPPC-004xVF-Kg
	for linux-mediatek@lists.infradead.org; Fri, 10 Feb 2023 09:09:24 +0000
Received: by mail-ej1-x633.google.com with SMTP id gr7so14028525ejb.5
        for <linux-mediatek@lists.infradead.org>; Fri, 10 Feb 2023 01:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=y4xwd6NcIcu0eUIOaah2w2G0LfRuN+4uyTHcTQv42t8=;
        b=G/oOrzUe4Fwnevaf9IKo7y2rWgZnBkev6GGDd04NqukMlLhyVxAq0sWcWNMSrhEABU
         Z45y4y0xSXD/D1xFJOY0pu6Fvz1BMfIm71ounhleMUlkgyywu34KgnP4szxktFxxqPXt
         CIR1ySQ75eCJWqDs4fZScqltXCl7CXLtaQpaW0s1PxqD8CpLD0HOHeOojpcUKFRGzcKv
         Hw8aado1wmO4/gVIeWU+xfDj/368hQLSSQlS3SxEBPOD1NCXU7WBnFHT8Ect8OnZzk45
         RylAQAwchAgo5kicrsvcuaPowfOPl8p4Vf9fXCapvRYbwUUhcOMxijGW3jZGRHxSmMu+
         LKUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y4xwd6NcIcu0eUIOaah2w2G0LfRuN+4uyTHcTQv42t8=;
        b=hgtVbZHFpdWvvu6LcBxKVWRViLJKLBY2pufPCSJBxf8wnM5yxG64BM2TwYX2lKiPYd
         38MsV9k4OeYcucF7KIBL7sMfhVY4MPHQ7YlqpAPunwdnJLFPqGe4+9k3DoQlfebHeB5o
         MVeDuJF1+eZNWCmdd6endtk6/c/rTCuPDeXgLnJU+4fEa7Abnmny6sMfvfjsBFn3Csdv
         OV8CGD4GJECjMhLkIwTaLHuzHM2LH/TsbxmDeLwkce+JtDToGEDDsjBDQVTDnlN6fUJE
         U2QqU2YmGkhuR09v3CGqSlaEA9EozQohERDfWTLkEg7beQU7JkNFUJnNmM3m4I6L8Aai
         CY5Q==
X-Gm-Message-State: AO0yUKXO5gZ7dNcJyY79tjuLDW0XIQiMgfbjA6Skx0EJlhebNyvwpBKb
	DROWFg2sJzFOyALG1Pu7Quwb+QuEimX0Enjgf27vrg==
X-Google-Smtp-Source: AK7set9L922uBh+HaAt7lGdopHMTeCAl+xxeBTKnBZJVjI/dV3z8/lG/hi73l7PrChoojEnABiShvoTnY6vdPX01M8U=
X-Received: by 2002:a17:906:ca04:b0:7c0:f45e:22ff with SMTP id
 jt4-20020a170906ca0400b007c0f45e22ffmr3464668ejb.104.1676020156421; Fri, 10
 Feb 2023 01:09:16 -0800 (PST)
MIME-Version: 1.0
References: <20230209105628.50294-1-bchihi@baylibre.com> <20230209105628.50294-4-bchihi@baylibre.com>
 <29a867d1-12a7-449f-8d52-aaac7a622c59@gmail.com>
In-Reply-To: <29a867d1-12a7-449f-8d52-aaac7a622c59@gmail.com>
From: Balsam CHIHI <bchihi@baylibre.com>
Date: Fri, 10 Feb 2023 10:08:40 +0100
Message-ID: <CAGuA+oqXmSDbNO1NWDHZ8-KGhF3mwzqwY6wWx2zUhwL7yfynQA@mail.gmail.com>
Subject: Re: [PATCH v14 3/6] arm64: dts: mt8195: Add efuse node to mt8195
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: daniel.lezcano@linaro.org, angelogioacchino.delregno@collabora.com, 
	rafael@kernel.org, amitk@kernel.org, rui.zhang@intel.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, rdunlap@infradead.org, 
	ye.xingchen@zte.com.cn, p.zabel@pengutronix.de, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	khilman@baylibre.com, james.lo@mediatek.com, rex-bc.chen@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_010918_964327_F2771287 
X-CRM114-Status: GOOD (  14.77  )
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

On Thu, Feb 9, 2023 at 5:28 PM Matthias Brugger <matthias.bgg@gmail.com> wrote:
>
>
>
> On 09/02/2023 11:56, bchihi@baylibre.com wrote:
> > From: Balsam CHIHI <bchihi@baylibre.com>
> >
> > Add efuse node.
> > This will be required by the thermal driver to get the calibration data.
> >
> > Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
> > Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > Link: https://lore.kernel.org/r/20230124131717.128660-4-bchihi@baylibre.com
> > Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
>
> This patch is already accepted [1], please drop it from your list.

Yes sure. I will.
Thank you.

>
> Regards,
> Matthias
>
> [1] https://lore.kernel.org/lkml/104bb37e-55c3-8dd0-f501-0e8a142511e6@gmail.com/
>
> > ---
> >   arch/arm64/boot/dts/mediatek/mt8195.dtsi | 6 ++++++
> >   1 file changed, 6 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > index 5d31536f4c486..09df105f4606d 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > @@ -1380,6 +1380,12 @@ pciephy_glb_intr: pciephy-glb-intr@193 {
> >                       dp_calibration: dp-data@1ac {
> >                               reg = <0x1ac 0x10>;
> >                       };
> > +                     lvts_efuse_data1: lvts1-calib@1bc {
> > +                             reg = <0x1bc 0x14>;
> > +                     };
> > +                     lvts_efuse_data2: lvts2-calib@1d0 {
> > +                             reg = <0x1d0 0x38>;
> > +                     };
> >               };
> >
> >               u3phy2: t-phy@11c40000 {

Best regards,
Balsam

