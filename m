Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97877C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 03:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=49gcqEJZTFWoPu6kWBah5BFv3UdzK683j/eStgJlWSQ=; b=C4x1WZrQpX9A+o
	KmiZ5t2ZKgLQz6A54vV76tRGLDNvN/0pZbCGW6Auqmhj+7da40GCNQ4ZpYZ/33WYCk0GNph+g6G3r
	DY2rUISNAjpixDt/hsSUD/wNXN82DgWCz2P2xGrE0GkU0/hZK/TyoboFxKFfgxqg8m0gbjW052WFd
	HiD/zDq5D/J/Ht56i6PvMob8Qk2m092VqajYhfRgEZh1djqp/bnG5NPmLuvBQti5u6xFsSul2LQuC
	l3ptc5eAsqkESCoFfypOMwY1tPTggaHsFESrGPYg8PX44oF+0c3Q7Y8MA0ZqR1J0sntO/XWJr6QvW
	eW16qATXN7+iPxZvZazA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrt2S-00ADiB-3e; Fri, 20 May 2022 03:10:52 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrt2O-00ADfc-ON
 for linux-mediatek@lists.infradead.org; Fri, 20 May 2022 03:10:50 +0000
Received: by mail-ej1-x62e.google.com with SMTP id ck4so8957622ejb.8
 for <linux-mediatek@lists.infradead.org>; Thu, 19 May 2022 20:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VzSjf+UlkdmPK52vS7yOaoMagJCGv/wcSOSyKIbiwH8=;
 b=Lywk4LXhXPJIPKesDr6LiwUJDzAgYYKOyYyRTyyNrlwAJLGu+VAlmZPBTcbryvDetE
 LLET3VW3TbL0MlXH7V5vhi3X3qGdEoEpa3qumIWFp5M5f8566Dj/OTxkToFsyAl5TqhH
 Xaa8QmHWA8hVYy8ndnue6sC88sMUgFvMQ4PZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VzSjf+UlkdmPK52vS7yOaoMagJCGv/wcSOSyKIbiwH8=;
 b=qohWY14r4HKKIr/km2SRboOJCE2C0FYD3ODzqvS5GmVVfHknFl7GtO+CheBAxEvi4Y
 CXIwReRTafaVOrgkX5Txkh6UlN3UGxcLWKxyZl2PEh15FIywbv1nQ/JwY560XYxyJWPb
 wVaunsJeK5FxqJXl8OIde/SZAHp2MatFADRM6GcxmkepioOzpFYs2uj2vEmF0pGTz4kC
 1GYi/HiU4drOC3ZnmIqZ1gshGrE9oNqwqpcLmL+B6pHDH3R86gKXyJbPcDwWDrovXJzA
 wFw/jMO4KHmYuPKirRdExg+KmFXsxIfom3dD0sk/n8K6HNYcuY+ifypRBujPmuc5jPOZ
 OAlw==
X-Gm-Message-State: AOAM530VHxuQI4VBB59AQ1sV8fg+5RI6xt18IhSvhiU+uFmB0E0MbsJO
 Q43fq36VhJpVfA+dJI2kxR9TtrpVevz8DvUzpEYiTA==
X-Google-Smtp-Source: ABdhPJxkwfvvFqGzx0Rjd3TwAAV9uPperVy6YXPVSMZ2LDoibXy6/wsJm53sl4Y7MYj/0N6I4f1/tS3Mih7BMNTIsic=
X-Received: by 2002:a17:907:3f8e:b0:6f4:4723:4185 with SMTP id
 hr14-20020a1709073f8e00b006f447234185mr6913293ejc.359.1653016246258; Thu, 19
 May 2022 20:10:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220519125527.18544-1-rex-bc.chen@mediatek.com>
 <20220519125527.18544-14-rex-bc.chen@mediatek.com>
 <3f39777a225fac66f01858262defcc11c6135bb2.camel@mediatek.com>
In-Reply-To: <3f39777a225fac66f01858262defcc11c6135bb2.camel@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 20 May 2022 11:10:35 +0800
Message-ID: <CAGXv+5Ee3QvpHqWeSOFJYmq+P3POFSTB45JM42UNF8pn4b4T9A@mail.gmail.com>
Subject: Re: [PATCH v7 13/19] dt-bindings: reset: mediatek: Add infra_ao reset
 index for MT8192/MT8195
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, 
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "sboyd@kernel.org" <sboyd@kernel.org>
Cc: "mturquette@baylibre.com" <mturquette@baylibre.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, 
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, 
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, 
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, 
 =?UTF-8?B?Q2h1bi1KaWUgQ2hlbiAo6Zmz5rWa5qGAKQ==?= <Chun-Jie.Chen@mediatek.com>, 
 =?UTF-8?B?UnVueWFuZyBDaGVuICjpmYjmtqbmtIsp?= <Runyang.Chen@mediatek.com>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_201048_853971_1994B496 
X-CRM114-Status: GOOD (  24.61  )
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

On Fri, May 20, 2022 at 10:58 AM Rex-BC Chen <rex-bc.chen@mediatek.com> wrote:
>
> On Thu, 2022-05-19 at 20:55 +0800, Rex-BC Chen wrote:
> > To support reset of infra_ao, add the index of infra_ao reset of
> > thermal/svs/pcei for MT8192 and thermal/svs for MT8195.
> >
> > Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > ---
> >  include/dt-bindings/reset/mt8192-resets.h | 8 ++++++++
> >  include/dt-bindings/reset/mt8195-resets.h | 6 ++++++
> >  2 files changed, 14 insertions(+)
> >
> > diff --git a/include/dt-bindings/reset/mt8192-resets.h b/include/dt-
> > bindings/reset/mt8192-resets.h
> > index 764ca9910fa9..12e2087c90a3 100644
> > --- a/include/dt-bindings/reset/mt8192-resets.h
> > +++ b/include/dt-bindings/reset/mt8192-resets.h
> > @@ -7,6 +7,7 @@
> >  #ifndef _DT_BINDINGS_RESET_CONTROLLER_MT8192
> >  #define _DT_BINDINGS_RESET_CONTROLLER_MT8192
> >
> > +/* TOPRGU resets */
> >  #define MT8192_TOPRGU_MM_SW_RST
> > 1
> >  #define MT8192_TOPRGU_MFG_SW_RST                             2
> >  #define MT8192_TOPRGU_VENC_SW_RST                            3
> > @@ -30,4 +31,11 @@
> >  /* MMSYS resets */
> >  #define MT8192_MMSYS_SW0_RST_B_DISP_DSI0                     15
> >
> > +/* INFRA resets */
> > +#define MT8192_INFRA_RST0_THERM_CTRL_SWRST           0
> > +#define MT8192_INFRA_RST2_PEXTP_PHY_SWRST            1
> > +#define MT8192_INFRA_RST3_THERM_CTRL_PTP_SWRST       2
> > +#define MT8192_INFRA_RST4_PCIE_TOP_SWRST             3
> > +#define MT8192_INFRA_RST4_THERM_CTRL_MCU_SWRST       4
> > +
> >  #endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT8192 */
> > diff --git a/include/dt-bindings/reset/mt8195-resets.h b/include/dt-
> > bindings/reset/mt8195-resets.h
> > index a26bccc8b957..0b1937f14b36 100644
> > --- a/include/dt-bindings/reset/mt8195-resets.h
> > +++ b/include/dt-bindings/reset/mt8195-resets.h
> > @@ -7,6 +7,7 @@
> >  #ifndef _DT_BINDINGS_RESET_CONTROLLER_MT8195
> >  #define _DT_BINDINGS_RESET_CONTROLLER_MT8195
> >
> > +/* TOPRGU resets */
> >  #define MT8195_TOPRGU_CONN_MCU_SW_RST          0
> >  #define MT8195_TOPRGU_INFRA_GRST_SW_RST        1
> >  #define MT8195_TOPRGU_APU_SW_RST               2
> > @@ -26,4 +27,9 @@
> >
> >  #define MT8195_TOPRGU_SW_RST_NUM               16
> >
> > +/* INFRA resets */
> > +#define MT8195_INFRA_RST0_THERM_CTRL_SWRST     0
> > +#define MT8195_INFRA_RST3_THERM_CTRL_PTP_SWRST 1
> > +#define MT8195_INFRA_RST4_THERM_CTRL_MCU_SWRST 2
> > +
> >  #endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT8195 */
> > --
> > 2.18.0
> >
>
> Hello Stephen,
>
> this patch will have conflict with Matthias's commit branch for
> include/dt-bindings/reset/mt8192-resets.h.
>
> It's on linux-next.
>
> I have fix it in this version, but I think there will be a merge
> conflict if you pick my series in this run.
>
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/include/dt-bindings/reset/mt8192-resets.h?h=next-20220519&id=19c66219e4d5b813ebbd28621cfe9c450659ded7

The commit in question is in Matthias's v5.18-next/dts64 branch, which also
has the v5.18-next-dts64 tag. The PR for this tag was already picked up
by the soc maintainers, so I guess we could consider it stable.

Matthias, what do you think? Give an ack for the patch to go through the
clk tree with the tag merged in as dependency? There's a compile time
dependency between this and the next patch so we can't just split them
into different trees.


ChenYu

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
