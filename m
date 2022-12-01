Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5584BC43217
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Dec 2022 09:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RmeWn94LkVUu4tw9eu7qIjwdQxs9X/lPN1HtD4czkz8=; b=qfmQJqGTLQ/xu1DtwemsDj9zXR
	Fqx4QZcX3xDiWg+MQkctIvcStynlnIBNIjmETw6e5MPP9btBiWAhhAe2DvcrCuZHF/yT019EzmedK
	a2cA5LkuhyWVFkhC2Une8RUT1wUXnCplmmdWcVIOif64NKJdU09n39H69KjehNz7NpAGBc+DqnOMl
	3ruwbnKJwnTMowlzYY4MMKhzpEAKE4IG+7a4ZcpM9GZeBt/0iW61G4GWB8fPPx6e08Kby1YbCYqJg
	wbpMpA6CWyUVcoVXYHX2F/PUxuTgo2VNDsMtiFCrsvEb+x92SLzuRhlnZ6e3H0G7d5sMh6j+23pEy
	YR3ZZkpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0fbA-006D8e-TC; Thu, 01 Dec 2022 09:11:16 +0000
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0fap-006Cy7-92
	for linux-mediatek@lists.infradead.org; Thu, 01 Dec 2022 09:11:02 +0000
Received: by mail-vk1-xa2e.google.com with SMTP id j19so524536vke.12
        for <linux-mediatek@lists.infradead.org>; Thu, 01 Dec 2022 01:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RmeWn94LkVUu4tw9eu7qIjwdQxs9X/lPN1HtD4czkz8=;
        b=iaV00wCJ4DS7weiRp4Yw4j61ZEqhjOgAl+mihdJ4qF0iIOYQ+CuCNiLXc0RcF57ZOI
         QcBE7TAFYM0edIfMCDMuUT6bZ6lQXNfia/NTQqZ5iluHTzPjkBnEOH8gb9DvPfgtJbCT
         wjUAgszWR72pzNXurHZMegxe8l2Iy8dNhmDwo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RmeWn94LkVUu4tw9eu7qIjwdQxs9X/lPN1HtD4czkz8=;
        b=6ids7i3tZlbWiDXbW7ObAZ6uRl9U3CkFRkmUCZXhWN3sIadjcN4RQQ1a1h8aAByeQi
         TGFAFqfor+FrddcDygbKF3aXcPsVAtEl21YHcThrmhHqBlqx03KnD46MAn4qmVauqpfx
         wlrU8ldht1tHcCJRZOqQ7aVrqJIlJEBbrF0+UYabpOQOkxy2LJ5kuV3y8Rsl71uk75Ip
         +N4zKw2dFAIIed0/FfNkebVe7lojS/m/hZdy1tbjl0GCW0/Q3U192KI5ZpsSL2kCvSwW
         DTs/ftuc9fk6B5jesrBxyD5A2klu/Qe+fv9dPoOp8B95FPZ1tND77xKu1Y2fMj3A5mY0
         sV5w==
X-Gm-Message-State: ANoB5pniXc8QHCx5nWIN4AuLhr98gkgb3vziDBhq4+nkkek4zq0oHSI2
	lJuRQ1Tg1yEkNUyl5NpPhmsPUSJ/YVZYsvJnZCDzcQ==
X-Google-Smtp-Source: AA0mqf4awAdlAk/sq5NWU1xv87d2t6gi6AnY8KPsEvf+7K1uvG1yrMV65xrzMZ9nwdUuppcvpNW9DAzRfyInxSaUOqY=
X-Received: by 2002:a1f:a00e:0:b0:380:5dbd:1076 with SMTP id
 j14-20020a1fa00e000000b003805dbd1076mr28138415vke.22.1669885853192; Thu, 01
 Dec 2022 01:10:53 -0800 (PST)
MIME-Version: 1.0
References: <20221201073328.1559-1-allen-kh.cheng@mediatek.com> <ba14a46f-477f-70af-761d-696fe8a4f41c@collabora.com>
In-Reply-To: <ba14a46f-477f-70af-761d-696fe8a4f41c@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 1 Dec 2022 17:10:41 +0800
Message-ID: <CAGXv+5Gg6ozYQcp_NPrAiH1kF-ZkfjVZhQZVhLnbSmjQBwsFwQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mt8192: Add adsp power domain controller
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Allen-KH Cheng <allen-kh.cheng@mediatek.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Project_Global_Chrome_Upstream_Group@mediatek.com, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_011055_342862_95ACE6F0 
X-CRM114-Status: GOOD (  22.60  )
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

On Thu, Dec 1, 2022 at 5:07 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 01/12/22 08:33, Allen-KH Cheng ha scritto:
> > Add adsp power domain controller node for mt8192 SoC.
> >
> > Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> > ---
> > Ref: https://lore.kernel.org/all/2ec80bd8-dfef-d2e6-eb41-6e6088043e33@collabora.com/
> >      [Allen-KH Cheng <allen-kh.cheng@mediatek.com>]
> > ---
> > ---
> >   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 8 ++++++++
> >   include/dt-bindings/power/mt8192-power.h | 1 +
> >   2 files changed, 9 insertions(+)
> >
>
> Allen, thanks for this one, but it's incomplete...
>
> First of all, you must add the power domain on the driver itself, specifically,
> in drivers/soc/mediatek/mt8192-pm-domains.h - otherwise this change will have no
> effect!

Actually it's worse. The driver doesn't know about the new power domain,
and so it will fail to probe. We might need to make the power domain driver
fail gracefully and skip unknown power domains.

ChenYu

> ...Then, as Chen-Yu said, you should also add the power domain to the scp_adsp
> clock node as that's solving the lockup issue...
>
> .......and last, but not least: we need a Fixes tag to backport this fix, here
> and on the commit that adds the missing power domain in the driver.
>
> Thanks,
> Angelo
>
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > index 424fc89cc6f7..e71afba871fc 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > @@ -514,6 +514,14 @@
> >                                               };
> >                                       };
> >                               };
> > +
> > +                             power-domain@MT8192_POWER_DOMAIN_ADSP {
> > +                                     reg = <MT8192_POWER_DOMAIN_ADSP>;
> > +                                     clocks = <&topckgen CLK_TOP_ADSP_SEL>;
> > +                                     clock-names = "adsp";
> > +                                     mediatek,infracfg = <&infracfg>;
> > +                                     #power-domain-cells = <0>;
> > +                             };
> >                       };
> >               };
> >
> > diff --git a/include/dt-bindings/power/mt8192-power.h b/include/dt-bindings/power/mt8192-power.h
> > index 4eaa53d7270a..63e81cd0d06d 100644
> > --- a/include/dt-bindings/power/mt8192-power.h
> > +++ b/include/dt-bindings/power/mt8192-power.h
> > @@ -28,5 +28,6 @@
> >   #define MT8192_POWER_DOMAIN_CAM_RAWA        18
> >   #define MT8192_POWER_DOMAIN_CAM_RAWB        19
> >   #define MT8192_POWER_DOMAIN_CAM_RAWC        20
> > +#define MT8192_POWER_DOMAIN_ADSP     21
> >
> >   #endif /* _DT_BINDINGS_POWER_MT8192_POWER_H */
> >
>

