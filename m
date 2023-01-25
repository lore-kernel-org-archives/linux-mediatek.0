Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E90DBC27C76
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Jan 2023 15:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/fOhzJHWBncviO+8KoSq7wlf7hb65a2LJ3emY6Ltu3A=; b=Tzmlvr2t6W8i877sodSA4cM+3u
	laOxvxYSy8nhfTPlWU5Ii+Zw/DxzXYreksfO+9ZL5/r2ek5baxPhBwtA5YyUTI9sb5+2z+pdMxoHE
	PBJz4fVIiCG9dFieEs6Ht3zWzqQ1Ihxw8HTgKS6R4km2AHNeYaTCrhFg1XGMWEdXe7DHlI5QV88bI
	gPkHNzRKqyezFIE4IGJPRmAS/VYw2M7eo7oXJfbPIUCKPj/YqGlNjVqEKVJ9dqFpLFUqwWHP2iigv
	VNH2Coedao55vz/+4DuUjMn3Y4E+8uGaVJrS8lOCRCtFuleYp4l35bt8qPoaLjkZ7W9wxauSkrl/0
	y5gUpPEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKhKj-007hvA-6D; Wed, 25 Jan 2023 15:05:05 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKhKV-007hnx-QK
	for linux-mediatek@lists.infradead.org; Wed, 25 Jan 2023 15:04:53 +0000
Received: by mail-ed1-x52f.google.com with SMTP id v13so22092519eda.11
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Jan 2023 07:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/fOhzJHWBncviO+8KoSq7wlf7hb65a2LJ3emY6Ltu3A=;
        b=RVjF1zmunimG3lGTLeRCa8b+VtklkxoxzStUIe2vmyUTWVEc7EIXViDfw7k1eDudJw
         /dLoWJSpc/ExMmL06qpgakuBOn3fPUVDaBB0AGXUo/CuEo6UHTtRpEbq3y2wzl7MskF1
         EWI1SUwbzXkJikMRMYJVXxVW2Sk+9CwtBxO4rKHXfyWBlMlMqEVApPA9/hq+Nk8JkdnN
         Tiun2oEuHvV33eE+mT364rnnh5nXyholp2+miDbgAwNNOobmThZ+9WPQK0iJDy5HY7y8
         JoFfEK+SXk08N8cjSfXThiqPbSJ9ET65nNrJFoN+EEfyQ4eKH1WA5hsQB7ed3w/1vmGU
         ANrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/fOhzJHWBncviO+8KoSq7wlf7hb65a2LJ3emY6Ltu3A=;
        b=Sz04r8auDPhPGRaQxz7J0B4kmhjRAx14+Xtj+FVaIbS4nV6ADA/TA6EzCXvMlfq7fO
         BG38CvgXVftpwokxVhOhHzNf2N42j31GnLj3OUlno8zM2tQOMT4LosiWMr0npS30+ihG
         1gX9j01IDdw4P1VdjZjmGs4lkEJbMN4hf64mQwbKLquKc9GxUt8oi20tEeapomBJzyy9
         zJdzx+6tZK0mhDdquQeHIqPIf4jwsJ1tIp88Emvxva1tTmFiUqw6dP0ebmi8Q7LiiHWJ
         WHUfzyAIMkl3VOmOgRgTozGOhjOTNy1qAKXwrRPMWAHZwF8OwNfjObinjjyBhi+HV+a1
         RWvw==
X-Gm-Message-State: AFqh2kpohMIbnMzdfWGDp7JVyncB0kT5IO9lIq3zL4kefAb8doUEG//G
	eKsQIctSgvUAbMeQnKLIVvit2iZaeicyg8k17c5SoA==
X-Google-Smtp-Source: AMrXdXu5EH+oSnT7I6l+aObYabUX53IzIx9ef5qbltDC8gHjErcHTUvXLVXPfiCcSe5HfprVu58Q58jz3XZRuEbvKxM=
X-Received: by 2002:aa7:c548:0:b0:499:b60f:5741 with SMTP id
 s8-20020aa7c548000000b00499b60f5741mr4178484edr.80.1674659084907; Wed, 25 Jan
 2023 07:04:44 -0800 (PST)
MIME-Version: 1.0
References: <20230124131717.128660-1-bchihi@baylibre.com> <20230124131717.128660-4-bchihi@baylibre.com>
 <104bb37e-55c3-8dd0-f501-0e8a142511e6@gmail.com>
In-Reply-To: <104bb37e-55c3-8dd0-f501-0e8a142511e6@gmail.com>
From: Balsam CHIHI <bchihi@baylibre.com>
Date: Wed, 25 Jan 2023 16:04:08 +0100
Message-ID: <CAGuA+ooVx2ODdXjuy2udO6F4V5fUy6EjeUaJPOvnjAE39QH3RA@mail.gmail.com>
Subject: Re: [PATCH v11 3/6] arm64/dts/mt8195: Add efuse node to mt8195
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
X-CRM114-CacheID: sfid-20230125_070451_907403_753782B4 
X-CRM114-Status: GOOD (  17.66  )
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

On Wed, Jan 25, 2023 at 3:25 PM Matthias Brugger <matthias.bgg@gmail.com> wrote:
>
>
>
> On 24/01/2023 14:17, bchihi@baylibre.com wrote:
> > From: Balsam CHIHI <bchihi@baylibre.com>
> >
> > Add efuse node.
> > This will be required by the thermal driver to get the calibration data.
> >
> > Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
> > Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>
> I fixed the subject prefix to:
> arm64: dts: mt8195: ...
> to be in line with other commits.
> Please take that into account for future patches you send.
>
> Applied thanks!
>

Hi Matthias,

Thank you for the fix and for applying the patch!

Best regards,
Balsam

> > ---
> >   arch/arm64/boot/dts/mediatek/mt8195.dtsi | 6 ++++++
> >   1 file changed, 6 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > index 5d31536f4c48..09df105f4606 100644
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

