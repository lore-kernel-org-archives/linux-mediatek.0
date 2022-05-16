Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9593DC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 May 2022 10:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a4rVcPlOiwzwXRluquNwqpc6Qka4xGpRQEEtmIgD5dk=; b=gN/Vux89b1stSZ
	Pn9+W2AzRfxWzWjjBIJBW5Wxh1oLm6fRTMg5RnKEGwquFk+QQY1XubENSgB8WopBFcMkBadePXSE+
	5MvUPM4JpLxFHN2JYpQfDOt3T1UFq12P9VqixqyOiZcSGFQ36ETIiuo2Q6s9p/RBnuwZ5I3LDRpij
	aXsS+CiGq4TbzWFfLobu/P7RV1+JokA7u0nni1pcELBTAQBWgjsbWc7A6DTkiHcs7X6iKJ2wDQ/yG
	N4oq+vlMjPqHktu9AXUR7+bqqRIlypbNj4eEyW93h56t6MQJHWjzNrDyURd5Co+1X3LEU6TtNc+Ip
	dWHS4Z5BghZhpAwRHrDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqYAa-0079Yj-Dc; Mon, 16 May 2022 10:41:44 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqYAX-0079YB-7A; Mon, 16 May 2022 10:41:43 +0000
X-UUID: ad8e48139f4f46a78050b1d1e9e07760-20220516
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:b524547c-c8cd-497a-bf7c-ed476eea1a8c, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:2a19b09, CLOUDID:acbb2e94-563e-4fc2-8a0d-fda4821947ab,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,QS:0,BEC:nil
X-UUID: ad8e48139f4f46a78050b1d1e9e07760-20220516
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1274211; Mon, 16 May 2022 03:41:35 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 16 May 2022 03:41:33 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 16 May 2022 18:41:31 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 16 May 2022 18:41:31 +0800
Message-ID: <e1dffbf98c034b99b1d7fd10aa009a645812abdc.camel@mediatek.com>
Subject: Re: [PATCH v6 09/10] arm64: dts: mediatek: Add MediaTek CCI node
 for MT8183
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Chen-Yu Tsai <wenst@chromium.org>
CC: <rafael@kernel.org>, <viresh.kumar@linaro.org>, <robh+dt@kernel.org>,
 <krzk+dt@kernel.org>, <matthias.bgg@gmail.com>, <jia-wei.chang@mediatek.com>, 
 <roger.lu@mediatek.com>, <hsinyi@google.com>, <khilman@baylibre.com>,
 <angelogioacchino.delregno@collabora.com>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, "Andrew-sh . Cheng"
 <andrew-sh.cheng@mediatek.com>
Date: Mon, 16 May 2022 18:41:31 +0800
In-Reply-To: <CAGXv+5FW59B1Dq8eH=5KjEdTxgT64GuvYZHZ9LnnTuaVrK3XpQ@mail.gmail.com>
References: <20220505115226.20130-1-rex-bc.chen@mediatek.com>
 <20220505115226.20130-10-rex-bc.chen@mediatek.com>
 <CAGXv+5FW59B1Dq8eH=5KjEdTxgT64GuvYZHZ9LnnTuaVrK3XpQ@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220516_034141_315522_B8471E2E 
X-CRM114-Status: GOOD (  20.92  )
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

On Mon, 2022-05-16 at 13:35 +0800, Chen-Yu Tsai wrote:
> On Thu, May 5, 2022 at 8:04 PM Rex-BC Chen <rex-bc.chen@mediatek.com>
> wrote:
> > 
> > Add MediaTek CCI devfreq node for MT8183.
> > 
> > Signed-off-by: Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
> > Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > ---
> >  arch/arm64/boot/dts/mediatek/mt8183-evb.dts    | 4 ++++
> >  arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 4 ++++
> >  arch/arm64/boot/dts/mediatek/mt8183.dtsi       | 7 +++++++
> >  3 files changed, 15 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
> > b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
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
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> > b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> > index 8d5bf73a9099..b035e06840e6 100644
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
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > index cecf96b628b7..11caf3dd85cd 100644
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
> 
> Binding says there should be two clocks: the actual clock that drives
> CCI, and a stable "intermediate" clock to switch to during clock rate
> changes. So I think this should look like:
> 
>     clocks = <&mcucfg CLK_MCU_BUS_SEL>,
>              <&topckgen CLK_TOP_ARMPLL_DIV_PLL1>;
>     clock-names = "cci", "intermediate";
> 
> 
> ChenYu
> 

Hello Chen-Yu,

Thanks for your reminder.
I will update this and sned next version.

BRs,
Rex

> > +               operating-points-v2 = <&cci_opp>;
> > +       };
> > +
> >         cpus {
> >                 #address-cells = <1>;
> >                 #size-cells = <0>;
> > --
> > 2.18.0
> > 
> > 
> > _______________________________________________
> > Linux-mediatek mailing list
> > Linux-mediatek@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-mediatek


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
