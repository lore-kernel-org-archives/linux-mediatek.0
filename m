Return-Path: <SRS0=XjSu=FY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE42BC4361B
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Dec 2020 07:49:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A92192389F
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Dec 2020 07:49:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A92192389F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zt14rcbYgBM9HycMqrKrprZ47Azel7DT4fpOOU+1NL4=; b=GzSueeib4fuHC3RhBWrLqJkgS
	PIDd3xIuNmaJWXFHFMPKuBc5xNYwML6FzW0Gb+Td9HxnUu3u1Y5l/U6xwq5NURCaAAf3pXJgapgWz
	UFP7xcA9qbPxGeOoIdgdwSxbTrx4oreYc8+S7m3NYnLALlyfeirtlJrofaPMsDAIp7utInFHvPE8s
	JLVxYdwArH+wRRXlFKCpEpSwFHSayVSB8PdcSO1JVeRLE9Zmoe8jzs3A4iU518kF5Kwo3YkxbtctX
	12u7qcpt0A8bhX06SMh56pROSkwGSBlfBbjJMlelyOvrEQv3ndgxAQU0tlUSktqpnLIsLdmrMGWt0
	ubEHsBTUw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kqtTK-0005oy-U4; Sun, 20 Dec 2020 07:49:43 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kqtTI-0005oa-EC
 for linux-mediatek@lists.infradead.org; Sun, 20 Dec 2020 07:49:41 +0000
Received: by mail-ej1-x62f.google.com with SMTP id g20so9247615ejb.1
 for <linux-mediatek@lists.infradead.org>; Sat, 19 Dec 2020 23:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=A22xGkuarplT6DM77+z2TR/niVmDd1acPTOJR9qrPwI=;
 b=ganNR8pFou//9DNyRhpOJ+HqIB1rseT6vyDOgT4xkaPj+C0DwPIBmc+9OK054mJZ8q
 9VBN1R2PbOsCQXLbiFyByR2ZFDfb0cVKHiG+q9NV7sJsNkHTpUWDJZWOZyUgSdyI8w/G
 1BSAiXnzO+bN0FxvJdM4l+dI2vIdO/mKyy1+d/UjbckzZ9dGyiGiRbOXXlfqXhupFzN/
 BbhvF2xeRLhb+BCJXOoni3rtqAVym/wjHy3rnYTKo9waw8o+uBnvPfwVmHL5XcCLft+T
 2BdMicR/V5WXYX21fnAqwmEUJjP2Ju4DQbaQUck73Gxawy9i8Q74UqJw9opEmJ011LqP
 B3Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=A22xGkuarplT6DM77+z2TR/niVmDd1acPTOJR9qrPwI=;
 b=CUydzctlJYP5x2F9vIOqTxjcdNtKFOKpk+xd2nFa4VQRazfDhH19ww4bbvNey8Ra3S
 TBtmEzdzDkhAkPyNAGrXbYs9amko1cROS7TmpbUjfjRuUCU6nbzu/hRGWbSFTYQdtTxf
 KWBd0ZLndhHbv6ZY92Z6PPABYS4nZxhn771A5ffMa8W68cdS4FAGfe1XNRk6zYct4qeM
 l5ZmoObgxZ66KNYdPOI3ipvzfMVMSedOd9+aiHrp56t6Q2/Zwr4UPC3NQkmbfIDSH1MN
 EqtgBBgRP5Nk72ZWCWHreuqq45Wbmv3x8knz77WQxZ7+oqxNk1clBIJdr723+iiVL5sD
 EuwQ==
X-Gm-Message-State: AOAM5325hSmPL5UovYwn2tY5PO5toeUTcwzDTAlihw2LxVC9zaL0eVmH
 w5hJDMU7BGw6pdfe+V+Wf/0=
X-Google-Smtp-Source: ABdhPJxHoxa+ITZGEhggI+npHIxqq1FJ6HxRN8A97IlWp9ve3CXBm1o/8L4pLHK9jA3oVEOzi4mEwQ==
X-Received: by 2002:a17:906:f0c9:: with SMTP id
 dk9mr10982091ejb.51.1608450578929; 
 Sat, 19 Dec 2020 23:49:38 -0800 (PST)
Received: from skbuf ([188.25.2.120])
 by smtp.gmail.com with ESMTPSA id i26sm7574335eja.23.2020.12.19.23.49.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Dec 2020 23:49:38 -0800 (PST)
Date: Sun, 20 Dec 2020 09:49:36 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: DENG Qingfang <dqfext@gmail.com>
Subject: Re: [RFC PATCH net-next] net: dsa: mt7530: rename MT7621 compatible
Message-ID: <20201220074936.ic2mtta7ihg7n3or@skbuf>
References: <20201219162153.23126-1-dqfext@gmail.com>
 <20201219162601.GE3008889@lunn.ch>
 <47673b0d-1da8-d93e-8b56-995a651aa7fd@gmail.com>
 <20201219194831.5mjlmjfbcpggrh45@skbuf>
 <CALW65jYtW7EEnXuj2dGSDwYC=3sBLCP0Q9J=tMozkrP6W0gq0w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALW65jYtW7EEnXuj2dGSDwYC=3sBLCP0Q9J=tMozkrP6W0gq0w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201220_024940_602703_41795E5D 
X-CRM114-Status: GOOD (  32.22  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <Landen.Chao@mediatek.com>,
 Florian Fainelli <f.fainelli@gmail.com>, netdev <netdev@vger.kernel.org>,
 Sean Wang <sean.wang@mediatek.com>, Russell King <linux@armlinux.org.uk>,
 "David S . Miller" <davem@davemloft.net>,
 Rene van Dorst <opensource@vdorst.com>, Greg Ungerer <gerg@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Vivien Didelot <vivien.didelot@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Dec 20, 2020 at 12:48:08PM +0800, DENG Qingfang wrote:
> Hi Vladimir,
> 
> On Sun, Dec 20, 2020 at 3:48 AM Vladimir Oltean <olteanv@gmail.com> wrote:
> >
> > Hi Andrew, Florian,
> >
> > On Sat, Dec 19, 2020 at 09:07:13AM -0800, Florian Fainelli wrote:
> > > On 12/19/2020 8:26 AM, Andrew Lunn wrote:
> > > >> --- a/drivers/net/dsa/mt7530.c
> > > >> +++ b/drivers/net/dsa/mt7530.c
> > > >> @@ -2688,7 +2688,7 @@ static const struct mt753x_info mt753x_table[] = {
> > > >>  };
> > > >>
> > > >>  static const struct of_device_id mt7530_of_match[] = {
> > > >> -  { .compatible = "mediatek,mt7621", .data = &mt753x_table[ID_MT7621], },
> > > >> +  { .compatible = "mediatek,mt7621-gsw", .data = &mt753x_table[ID_MT7621], },
> > > >>    { .compatible = "mediatek,mt7530", .data = &mt753x_table[ID_MT7530], },
> > > >>    { .compatible = "mediatek,mt7531", .data = &mt753x_table[ID_MT7531], },
> > > >>    { /* sentinel */ },
> > > >
> > > > This will break backwards compatibility with existing DT blobs. You
> > > > need to keep the old "mediatek,mt7621", but please add a comment that
> > > > it is deprecated.
> > >
> > > Besides, adding -gsw would make it inconsistent with the existing
> > > matching compatible strings. While it's not ideal to have the same
> > > top-level SoC compatible and having another sub-node within that SoC's
> > > DTS have the same compatible, given this would be break backwards
> > > compatibility, cannot you stay with what is defined today?
> >
> > The MT7621 device tree is in staging. I suppose that some amount of
> > breaking changes could be tolerated?
> >
> > But Qingfang, I'm confused when looking at drivers/staging/mt7621-dts/mt7621.dtsi.
> >
> > /ethernet@1e100000/mdio-bus {
> >         switch0: switch0@0 {
> >                 compatible = "mediatek,mt7621";
> >                 #address-cells = <1>;
> >                 #size-cells = <0>;
> >                 reg = <0>;
> >                 mediatek,mcm;
> >                 resets = <&rstctrl 2>;
> >                 reset-names = "mcm";
> >
> >                 ports {
> >                         #address-cells = <1>;
> >                         #size-cells = <0>;
> >                         reg = <0>;
> >                         port@0 {
> >                                 status = "off";
> >                                 reg = <0>;
> >                                 label = "lan0";
> >                         };
> >                         port@1 {
> >                                 status = "off";
> >                                 reg = <1>;
> >                                 label = "lan1";
> >                         };
> >                         port@2 {
> >                                 status = "off";
> >                                 reg = <2>;
> >                                 label = "lan2";
> >                         };
> >                         port@3 {
> >                                 status = "off";
> >                                 reg = <3>;
> >                                 label = "lan3";
> >                         };
> >                         port@4 {
> >                                 status = "off";
> >                                 reg = <4>;
> >                                 label = "lan4";
> >                         };
> >                         port@6 {
> >                                 reg = <6>;
> >                                 label = "cpu";
> >                                 ethernet = <&gmac0>;
> >                                 phy-mode = "trgmii";
> >                                 fixed-link {
> >                                         speed = <1000>;
> >                                         full-duplex;
> >                                 };
> >                         };
> >                 };
> >         };
> > };
> >
> > / {
> >         gsw: gsw@1e110000 {
> >                 compatible = "mediatek,mt7621-gsw";
> >                 reg = <0x1e110000 0x8000>;
> >                 interrupt-parent = <&gic>;
> >                 interrupts = <GIC_SHARED 23 IRQ_TYPE_LEVEL_HIGH>;
> >         };
> > };
> >
> > What is the platform device at the memory address 1e110000?
> > There is no driver for it. The documentation only has me even more
> > confused:
> >
> > Mediatek Gigabit Switch
> > =======================
> >
> > The mediatek gigabit switch can be found on Mediatek SoCs (mt7620, mt7621).
> >
> > Required properties:
> > - compatible: Should be "mediatek,mt7620-gsw" or "mediatek,mt7621-gsw"
> > - reg: Address and length of the register set for the device
> > - interrupts: Should contain the gigabit switches interrupt
> > - resets: Should contain the gigabit switches resets
> > - reset-names: Should contain the reset names "gsw"
> >
> > Example:
> >
> > gsw@10110000 {
> >         compatible = "ralink,mt7620-gsw";     <- notice how even the example is bad and inconsistent
> >         reg = <0x10110000 8000>;
> >
> >         resets = <&rstctrl 23>;
> >         reset-names = "gsw";
> >
> >         interrupt-parent = <&intc>;
> >         interrupts = <17>;
> > };
> >
> > Does the MT7621 contain two Ethernet switches, one accessed over MMIO
> > and another over MDIO? Or is it the same switch? I don't understand.
> > What is the relationship between the new compatible that you're
> > proposing, Qingfang, and the existing device tree bindings?
> 
> The current dtsi is copied from OpenWrt, so the existing "mt7621-gsw"
> / "mt7620-gsw" compatible is for their swconfig driver.
> MT7621 has only one switch, accessed over MDIO, so the reg property
> has no effect.
> 
> Should this patch be accepted, the existing gsw nodes can be dropped.

But still, what is at memory address 0x1e110000, if the switch is
accessed over MDIO?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
