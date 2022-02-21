Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53A0EC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Feb 2022 13:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q7iwCpzPsoxtLI8IO4KoWgNKbiVNtdX1cd3YZmAEjPI=; b=VFEk+7l1FHUOP4
	EVyueW085qZ44doeZlmyDsbhFQKPfAZOUYQGBZCkHOJi4cZJsxNjmlgEMjkwQF64Y3gk0HiuZ4OEp
	Km96UMHG67QfYhJEIp+XasFRBVZFCNGYROQdPBWSknoec+iO9KMgfmaz5poRZb/DZX8GAaRNHadoe
	MG+Q0VjSZU3CzxyyXkF/jdbuOYlqzfldd2v4vCxu6e3PpSy87i5MXfzSMKrHRunvsHRr48Z5Xxjzw
	sLcqnUCGgi1fMBIwttGLogzb2pl0yR2bvlGs50YNVmWU3nN6XvYotCjKGhXSQc7R31zT99tAIZLai
	Wcx2jTvcDZqtt+ZTyd0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM9Bm-0064gV-UB; Mon, 21 Feb 2022 13:57:18 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM8o4-005vwg-Ew; Mon, 21 Feb 2022 13:32:49 +0000
X-UUID: ea6df78362734b8188ffc05b6784bae7-20220221
X-UUID: ea6df78362734b8188ffc05b6784bae7-20220221
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1365971745; Mon, 21 Feb 2022 06:32:45 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 21 Feb 2022 05:22:43 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 21 Feb 2022 21:22:35 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 21 Feb 2022 21:22:34 +0800
Message-ID: <a1cd185370f66c705ce5bdb27672744a715b094c.camel@mediatek.com>
Subject: Re: [PATCH v2 19/23] arm64: dts: mt8192: Add i2c aliases
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: Chen-Yu Tsai <wenst@chromium.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, --to=Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, "Ryder
 Lee" <ryder.lee@kernel.org>
Date: Mon, 21 Feb 2022 21:22:35 +0800
In-Reply-To: <CAGXv+5FO5gBv1L4S_Nitmfv1zwjTGvp3CPP8CyFVEAq3DkkJ-g@mail.gmail.com>
References: <20220218091633.9368-1-allen-kh.cheng@mediatek.com>
 <20220218091633.9368-20-allen-kh.cheng@mediatek.com>
 <CAGXv+5FO5gBv1L4S_Nitmfv1zwjTGvp3CPP8CyFVEAq3DkkJ-g@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_053248_552519_2A70A5DD 
X-CRM114-Status: GOOD (  21.42  )
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

On Mon, 2022-02-21 at 12:50 +0800, Chen-Yu Tsai wrote:
> Hi,
> 
> On Fri, Feb 18, 2022 at 5:16 PM Allen-KH Cheng
> <allen-kh.cheng@mediatek.com> wrote:
> > 
> > Add i2c aliases for mt8192 SoC
> > 
> > Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> > ---
> >  arch/arm64/boot/dts/mediatek/mt8192.dtsi | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > index 55bcbf72a366..e3314cdc7c1a 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > @@ -21,6 +21,19 @@
> >         #address-cells = <2>;
> >         #size-cells = <2>;
> > 
> > +       aliases {
> > +               i2c0 = &i2c0;
> > +               i2c1 = &i2c1;
> > +               i2c2 = &i2c2;
> > +               i2c3 = &i2c3;
> > +               i2c4 = &i2c4;
> > +               i2c5 = &i2c5;
> > +               i2c6 = &i2c6;
> > +               i2c7 = &i2c7;
> > +               i2c8 = &i2c8;
> > +               i2c9 = &i2c9;
> 
> AFAIK, maintainers have suggested against [1] having aliases in the
> .dtsi.
> 
> If the numbering isn't an issue, I suggest just dropping it
> altogether.
> If it is, then the aliases should be added at the board level, and
> only
> for the interfaces that are actually enabled.
> 
> ChenYu
> 
> [1] 
> https://urldefense.com/v3/__https://lore.kernel.org/linux-rockchip/CAK8P3a25iYksubCnQb1-e5yj=crEsK37RB9Hn4ZGZMwcVVrG7g@mail.gmail.com/__;!!CTRNKA9wMg0ARbw!xXnhgMJXr_7T7q0dG965vVaZ-J2bDtpVWRouWVk5SjGO2f53HHesM8fhh1srbsWobbPCJrG-mqx6_dVs1Cfs2Njl4w$
>  

Hi ChenYu,

Thanks for suggestion.

I will move this part to board level.

Best regards,
Allen

> 
> > +       };
> > +
> >         clk26m: oscillator0 {
> >                 compatible = "fixed-clock";
> >                 #clock-cells = <0>;
> > --
> > 2.18.0
> > 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
