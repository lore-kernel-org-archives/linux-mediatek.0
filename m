Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0824AC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Apr 2022 06:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zsZy9aQIJlFUJwkLqlc7StlmI+0xpR+76GdRGgFP92s=; b=1CqksEYZeeMv7r
	ibPEROGQ8BzIU/Ow4wTom64CBWJVsgkIkfQlNqbW2tdYlCx4t6ln1WRYvBrXrPB7hqbgM6bzHg10Q
	IvXBG7z8SNomAYA7Ed7eQ2h1FbDJyACP7KpJpkf230WwWbjElMr6Nwv+89F/n7MISTFf616o0HRx3
	Lh4AUz7Ylz2Ru2TVtt06vgQSN4lkkJdLYjLtCHuK1nvO1P1okO38NQCvzDJ/BiZO1Wk3naiXujEjo
	H8avUf7DJD6jgeS3m5IPF2RWe1CfXO+7QgA7SNIVmWD46n9dN8x8jjsZisf/fxTsWd4iTogDIwlFb
	1EtUBrclbBD9ZfADCVjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfFPd-008yon-BX; Fri, 15 Apr 2022 06:26:33 +0000
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfFB0-008u3j-CR
 for linux-mediatek@lists.infradead.org; Fri, 15 Apr 2022 06:11:28 +0000
Received: by mail-io1-xd2a.google.com with SMTP id e194so3122461iof.11
 for <linux-mediatek@lists.infradead.org>; Thu, 14 Apr 2022 23:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Hth57rc9flgI5m/YWiERoaDPCoaY7k8I1BMtgGL+V+Y=;
 b=msTzY8eSFKW/3mFmZ9lVowCymgcEumQdHKnLmPoK2AIQM5U2BaaSAmtjO2PKaxVJlz
 2ES6raB6JnSfMCwORjUEBdMJCP/IKWm7oEkIpJi7Ccsa63N57Xk5Z7E4OYu8Sgfv605W
 X2EpJ5uI7jXptNEMkbCMggrukuselAizifurv9hRWvp20KQQjqGEI/tiObfvLIU2zRvm
 Yz6zO6HUX37CkAlBqIEJvy8HvscIiG16enT7d45uHZVgVelRnaPR8dEjuElmtFPTrwqb
 BHHk0qAUzLAqSiDOfu0DgaJBrsy0J2AbneaUcCebHcM0ughM68guTlvQCenAdyULrrCn
 hI3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Hth57rc9flgI5m/YWiERoaDPCoaY7k8I1BMtgGL+V+Y=;
 b=7dTJbLBg2iBJ8uL0HwFSGtjmJU7CaeLDH0UUyMsI8NSdbVmjs/VbEWbKZlWZ80XPvz
 heq8nYFXp9+7sqFznjBqiF6I7D5/yg06UvBTs6EOVv1a9jSVup5WkxqmSgw6FcHRVAsa
 FFeMWFP86kFeMh3DQjI5+g2uuZ6jfT0S5o1pZUqzybTR5qw20EtVSba/owYuvmoFirFv
 fWCm7e73GSaU+vLy0N90wvHNF5dKWnFEkq+7ZSlV5pZDnoQ3bPhgv+r2BMo9aKASmJSK
 IPnIXKjFgjRZuaYGnMfR8T5xGYCeHiQyMA8EDUwyxJK65NKKQp0YrH9KuMOrRatrFJcj
 gXeA==
X-Gm-Message-State: AOAM533gg24LcJTRqyYEaYZhsODMV3ERQlUbGlJCHr0FIQX6ql+tRtom
 WO19e6EXvtAu0TnHY2DZlqRXbqqaahRP/L2Vig4ESg==
X-Google-Smtp-Source: ABdhPJyZ09w41DsSsnD+yZXGRzZeRuMf7sXpcaFWmdYFro5NPh1kmpFg/dv3eWJHhL0eqh7mxqj1hftj0f6IdG4RkOs=
X-Received: by 2002:a05:6638:2509:b0:328:5838:f080 with SMTP id
 v9-20020a056638250900b003285838f080mr281369jat.163.1650003084905; Thu, 14 Apr
 2022 23:11:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220415055916.28350-1-rex-bc.chen@mediatek.com>
 <20220415055916.28350-15-rex-bc.chen@mediatek.com>
 <CACb=7PXmA_n-xAb+ZkRJdTXu=Enbf6NbyxVa3VC1zmJwsrgQ1w@mail.gmail.com>
In-Reply-To: <CACb=7PXmA_n-xAb+ZkRJdTXu=Enbf6NbyxVa3VC1zmJwsrgQ1w@mail.gmail.com>
From: Hsin-Yi Wang <hsinyi@google.com>
Date: Fri, 15 Apr 2022 14:10:58 +0800
Message-ID: <CACb=7PX_qNOk+XhxZUj_OrCnn1Fqw_4P-3Dc4pQLBTYQkY4qfw@mail.gmail.com>
Subject: Re: [PATCH V3 14/15] arm64: dts: mediatek: Add MediaTek CCI node for
 MT8183
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: rafael@kernel.org, Viresh Kumar <viresh.kumar@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, krzk+dt@kernel.org, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Tim Chang <jia-wei.chang@mediatek.com>, 
 roger.lu@mediatek.com, Kevin Hilman <khilman@baylibre.com>, 
 angelogioacchino.delregno@collabora.com, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 "Andrew-sh . Cheng" <andrew-sh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_231126_483322_E6413878 
X-CRM114-Status: GOOD (  16.84  )
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

On Fri, Apr 15, 2022 at 2:06 PM Hsin-Yi Wang <hsinyi@google.com> wrote:
>
> On Fri, Apr 15, 2022 at 1:59 PM Rex-BC Chen <rex-bc.chen@mediatek.com> wrote:
> >
> > Add MediaTek CCI devfreq node for MT8183.
> >
> > Signed-off-by: Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
> > Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> > ---
> >  arch/arm64/boot/dts/mediatek/mt8183-evb.dts    | 4 ++++
> >  arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 4 ++++
> >  arch/arm64/boot/dts/mediatek/mt8183.dtsi       | 7 +++++++
> >  3 files changed, 15 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
> > index 8953dbf84f3e..7ac9864db9de 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
> > @@ -412,6 +412,10 @@
> >
> >  };
> >
> > +&cci {
> > +       proc-supply = <&mt6358_vproc12_reg>;
> > +};
> > +
> >  &cpu0 {
> >         proc-supply = <&mt6358_vproc12_reg>;
> >  };
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> > index 0f9480f91261..4786a32ee975 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> > @@ -230,6 +230,10 @@
> >         status = "okay";
> >  };
> >
> > +&cci {
> > +       proc-supply = <&mt6358_vproc12_reg>;
> > +};
> > +
> >  &cpu0 {
> >         proc-supply = <&mt6358_vproc12_reg>;
> >  };
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > index 4ae3305d16d2..334728413582 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > @@ -280,6 +280,13 @@
> >                 };
> >         };
> >
> > +       cci: cci {
> > +               compatible = "mediatek,mt8183-cci";
> > +               clocks = <&apmixedsys CLK_APMIXED_CCIPLL>;
> > +               clock-names = "cci_clock";
> > +               operating-points-v2 = <&cci_opp>;
>
> hi Rex,
>
> cci_opp is not defined in dts.
>
It's in the previous patch. Please ignore this comment.

> > +       };
> > +
> >         cpus {
> >                 #address-cells = <1>;
> >                 #size-cells = <0>;
> > --
> > 2.18.0
> >

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
