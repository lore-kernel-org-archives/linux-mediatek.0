Return-Path: <SRS0=e3uk=FV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D39B9C4361B
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Dec 2020 08:54:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 861CC2389E
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Dec 2020 08:54:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 861CC2389E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gTMiJuh4OzACAj+vzsHLUTx4fAYH1gxYmj0oPQFMiTU=; b=Xl/ax86iN83j8IWvO8PUkvhBZ
	5hdwY0QKFvrbQMqJ+vIljyUTmdFDr9zC7nF9eO5lQ42D53VF9r0LOiNk7pRJ/0fZY5rgomom0LjAF
	KmZxsxqQaK7LdNB9pf+AjhII+3bpxCT6GupK0xF+MgQiLmhE7B4S/8YYGIdkAsqqgQVsDCNQ4URvm
	11kqo4hSFpQU3fr30qJCzu71SXwzA9MqP04JR8olyFNdbn7ipmgMVd9knYSBz9EvD9Oz5lp9Lua+G
	/vN+xZ5BoBCQ+GinF0xHnenCY6lWEK9W5lg7Eie2bv4ODK7VgaS+uGZ4Qiq8IQkl8V6HqU4xCo/85
	AS+dBbVVQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpp30-0006XH-7t; Thu, 17 Dec 2020 08:54:06 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpp2w-0006WX-Lc; Thu, 17 Dec 2020 08:54:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608195240;
 bh=N4iCRKQ5T+IdPgDG6/JntbvuDR/5Iy5t84sQRrpsDaM=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=OCohtkSGSmeckU3Jeo5YvNxdiDuc1KLDnm8UnKF5jSs7pnTbMH6Upz6XoiX6Y9684
 bYIigips4cN0YKeQAfSMELNPVCGtG8/03MRdTQsNKh+FRuAJwxp+eVnFTRizuBLy5K
 /NZWtl+0hBYR7PecKHEb2Lts4lG3SOFzpa8nBLW4grG3DROVvCKfLqAfYy0i63VvdA
 UPxM6VzMnDX45pIZvckUyF60NluB5vHsj6dPAKXwL1Gr+TfeL3UeXnturfna1ew6bC
 gPtDc6XB8YL3LEdio1m7XtrALo7D3ml7TWXSDiSKwz/YkhD3Pjv8rnOpMLk1Rv0teQ
 oceMcokGDP+ZQ==
MIME-Version: 1.0
In-Reply-To: <20201123040237.GA3013347@chromium.org>
References: <1604887429-29445-1-git-send-email-weiyi.lu@mediatek.com>
 <1604887429-29445-24-git-send-email-weiyi.lu@mediatek.com>
 <20201123040237.GA3013347@chromium.org>
Subject: Re: [PATCH v5 23/24] arm64: dts: mediatek: Add mt8192 clock
 controllers
From: Stephen Boyd <sboyd@kernel.org>
To: Ikjoon Jang <ikjn@chromium.org>, Weiyi Lu <weiyi.lu@mediatek.com>
Date: Thu, 17 Dec 2020 00:53:59 -0800
Message-ID: <160819523908.1580929.4609336150609889474@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201217_035402_873471_D94D8BA2 
X-CRM114-Status: GOOD (  17.56  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Rob Herring <robh@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Yingjoe Chen <yingjoe.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Quoting Ikjoon Jang (2020-11-22 20:02:37)
> On Mon, Nov 09, 2020 at 10:03:48AM +0800, Weiyi Lu wrote:
> > Add clock controller nodes for SoC mt8192
> > 
> > Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> > ---
> >  arch/arm64/boot/dts/mediatek/mt8192.dtsi | 163 +++++++++++++++++++++++++++++++
> >  1 file changed, 163 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > index e12e024..92dcfbd 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > @@ -5,6 +5,7 @@
> >   */
> >  
> >  /dts-v1/;
> > +#include <dt-bindings/clock/mt8192-clk.h>
> >  #include <dt-bindings/interrupt-controller/arm-gic.h>
> >  #include <dt-bindings/interrupt-controller/irq.h>
> >  #include <dt-bindings/pinctrl/mt8192-pinfunc.h>
> > @@ -213,6 +214,24 @@
> >                       };
> >               };
> >  
> > +             topckgen: syscon@10000000 {
> > +                     compatible = "mediatek,mt8192-topckgen", "syscon";
> > +                     reg = <0 0x10000000 0 0x1000>;
> > +                     #clock-cells = <1>;
> > +             };
> > +
> > +             infracfg: syscon@10001000 {
> > +                     compatible = "mediatek,mt8192-infracfg", "syscon";
> > +                     reg = <0 0x10001000 0 0x1000>;
> > +                     #clock-cells = <1>;
> > +             };
> > +
> > +             pericfg: syscon@10003000 {
> > +                     compatible = "mediatek,mt8192-pericfg", "syscon";
> > +                     reg = <0 0x10003000 0 0x1000>;
> > +                     #clock-cells = <1>;
> > +             };
> > +
> 
> There are 26 new bindings for mt8192 clock providers, "mediatek,mt8192-*'.
> I guess the one reason of doing this is that those mmio blocks are
> just scattered all around over different memory regions.

Yeah it seems that Mediatek likes to scatter the clks into basically
every IP block. The alternate approach would be to create virtual
platform device children of those IP blocks to register the clks.

> 
> I wonder if there could be a simpler way of merging them into one
> binding of "mediatek,mt8192-clocks" and converting all new bindings
> into generic syscon:
> 
>         mt8192-clocks: mt8192_clocks {
>                 compatible = "mediatek,mt8192-clocks";
>                 #clock-cells = <1>;
> 
>                 infracfg: clk_infracfg {
>                         syscon = <&syscon_infracfg>;
>                 };
>                 pericfg: clk_pericfg {
>                         syscon = <&syscon_pericfg>:
>                 };
>         };
> 
>         syscon_pericfg: syscon@10003000 {
>                 compatible = "syscon";
>                 reg = <0 0x10003000 0 0x1000>;
>         };

Is the syscon used for anything besides a clk provider? Having a
mt8192_clocks node is wrong. The syscon is the clk provider and it
should have a #clock-cells property. Making up a node that doesn't have
a reg property is usually a sign that something is wrong.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
