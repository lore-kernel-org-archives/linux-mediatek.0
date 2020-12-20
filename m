Return-Path: <SRS0=XjSu=FY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF885C4361B
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Dec 2020 04:48:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84CF22313B
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Dec 2020 04:48:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 84CF22313B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bQBLXQ0gX+J5rVVJElfKWfuaBBKYoVS/Q4nzhDnw14c=; b=DwiOX58Yxb9ZOCVr8EWgqxHFr
	3YCo2C8eBy57+oyB5Y8c/0nHXsJowCO6M/CV1aspStrcE3bCnRE1zhqjiEgm8hXhIweyIDGuuygFR
	cbSsGANXX/UnuPQhurTTg11R4MDfbr34vnyiFhyUl34nfERXXkJohn59qhVTrUU09af61FNtWuWS2
	KaU6IYGla6p3ueAB1tunMYA7rdyAcyYFY8z5EEkIedVIFxRKbbpPVcml1SJ0FQyU7XDnWduRjmfz7
	78hlX9AA3YgHfVX7sGwVV6WmXMFlbN6uGvrvA+1uJdlqWAvVOOx+H4mPTgMd0K9Kp+u1z3u/JfqVa
	gmC8QHbGQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kqqdq-0005ZN-W3; Sun, 20 Dec 2020 04:48:23 +0000
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kqqdo-0005Z2-Gl
 for linux-mediatek@lists.infradead.org; Sun, 20 Dec 2020 04:48:22 +0000
Received: by mail-io1-xd2f.google.com with SMTP id z5so5879398iob.11
 for <linux-mediatek@lists.infradead.org>; Sat, 19 Dec 2020 20:48:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d+I+MxhZRgbV94D9EabdQV93ne2lYILR2KlRArwUle8=;
 b=TN1bLPEVwPotLjbi2RZbsJX5S4wR2E4B8mbH1BYhBabbCuGoCKpl2Zf2Y0wdg4XAb0
 suhvR5RwoQ8qEy90zVWD0cnyQhbdCEQWVzUnGlf2ak2e6dJbSTr48/1WtjyFNiJAKjEM
 JsbWEmouQB5DXkCr3q+rfzDllPdYBGYAWdccnKPQS0EBEkFcDF0Zg9s6vByyaSN4zjV+
 jaxyHDVbyX4ZI8IvpttYYc8qvFbefCuCfi9l238hR8oy8paQhTTXoe5wCNrSBmAUUTYx
 HqkwYiAts7Vdmd8DxRsKQW/36d1e0xgpXFb5gSDk/mAIoGMu9WdShnG5Iq6JYlohv0wI
 D2pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d+I+MxhZRgbV94D9EabdQV93ne2lYILR2KlRArwUle8=;
 b=aPVy/lRYdyGr7oYiihJ145VjlGRJC9KjeWTaKb7+OzgwT2+pFdY6DRfznReJkYUdK9
 qj4f6lKKTGD2nNJYv5XrujG8R96CWhjY1Am33De1018F+sHjxS7wPuUyB+JOe/3EDWrF
 r7x6B+JD9fQTumlrWLvYuyToMWRgjFbUwHOy5ZhnFuSRFf4cb8naIi9E3kW9IxQbk1zR
 51RsjaONcENp7EF7X5UEPYwh6Q5kUt8vViyrCvAvwKjiTZluJ/UrQ6n4kwvv6FJAC6FU
 D709U+rqPPgKmdy60Kg8jt4uEEJcxR9PAsXJt1Gz1vY+YNcY3TpDAMpvoVEA+xERpaw8
 2NDw==
X-Gm-Message-State: AOAM530ydGJDhnRGgfvvxfBeqFv7v1rETbb66KKBUR5HquHSL/a9/7F8
 osxy8iqSSd1JgSSKqkqDcc3LkWMovbPxj/j8CvW2CY9mxi8=
X-Google-Smtp-Source: ABdhPJyXPQSHJwF4yd0MdFCn+ETOqT2J1/g879Vm4IgiWsocYgSJZll/tV0usL2TvKecEvQcfCrjdUQLRGLcqOxT2EI=
X-Received: by 2002:a6b:3788:: with SMTP id e130mr10222133ioa.23.1608439698367; 
 Sat, 19 Dec 2020 20:48:18 -0800 (PST)
MIME-Version: 1.0
References: <20201219162153.23126-1-dqfext@gmail.com>
 <20201219162601.GE3008889@lunn.ch>
 <47673b0d-1da8-d93e-8b56-995a651aa7fd@gmail.com>
 <20201219194831.5mjlmjfbcpggrh45@skbuf>
In-Reply-To: <20201219194831.5mjlmjfbcpggrh45@skbuf>
From: DENG Qingfang <dqfext@gmail.com>
Date: Sun, 20 Dec 2020 12:48:08 +0800
Message-ID: <CALW65jYtW7EEnXuj2dGSDwYC=3sBLCP0Q9J=tMozkrP6W0gq0w@mail.gmail.com>
Subject: Re: [RFC PATCH net-next] net: dsa: mt7530: rename MT7621 compatible
To: Vladimir Oltean <olteanv@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201219_234820_989674_A56A2FA7 
X-CRM114-Status: GOOD (  26.89  )
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

Hi Vladimir,

On Sun, Dec 20, 2020 at 3:48 AM Vladimir Oltean <olteanv@gmail.com> wrote:
>
> Hi Andrew, Florian,
>
> On Sat, Dec 19, 2020 at 09:07:13AM -0800, Florian Fainelli wrote:
> > On 12/19/2020 8:26 AM, Andrew Lunn wrote:
> > >> --- a/drivers/net/dsa/mt7530.c
> > >> +++ b/drivers/net/dsa/mt7530.c
> > >> @@ -2688,7 +2688,7 @@ static const struct mt753x_info mt753x_table[] = {
> > >>  };
> > >>
> > >>  static const struct of_device_id mt7530_of_match[] = {
> > >> -  { .compatible = "mediatek,mt7621", .data = &mt753x_table[ID_MT7621], },
> > >> +  { .compatible = "mediatek,mt7621-gsw", .data = &mt753x_table[ID_MT7621], },
> > >>    { .compatible = "mediatek,mt7530", .data = &mt753x_table[ID_MT7530], },
> > >>    { .compatible = "mediatek,mt7531", .data = &mt753x_table[ID_MT7531], },
> > >>    { /* sentinel */ },
> > >
> > > This will break backwards compatibility with existing DT blobs. You
> > > need to keep the old "mediatek,mt7621", but please add a comment that
> > > it is deprecated.
> >
> > Besides, adding -gsw would make it inconsistent with the existing
> > matching compatible strings. While it's not ideal to have the same
> > top-level SoC compatible and having another sub-node within that SoC's
> > DTS have the same compatible, given this would be break backwards
> > compatibility, cannot you stay with what is defined today?
>
> The MT7621 device tree is in staging. I suppose that some amount of
> breaking changes could be tolerated?
>
> But Qingfang, I'm confused when looking at drivers/staging/mt7621-dts/mt7621.dtsi.
>
> /ethernet@1e100000/mdio-bus {
>         switch0: switch0@0 {
>                 compatible = "mediatek,mt7621";
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>                 reg = <0>;
>                 mediatek,mcm;
>                 resets = <&rstctrl 2>;
>                 reset-names = "mcm";
>
>                 ports {
>                         #address-cells = <1>;
>                         #size-cells = <0>;
>                         reg = <0>;
>                         port@0 {
>                                 status = "off";
>                                 reg = <0>;
>                                 label = "lan0";
>                         };
>                         port@1 {
>                                 status = "off";
>                                 reg = <1>;
>                                 label = "lan1";
>                         };
>                         port@2 {
>                                 status = "off";
>                                 reg = <2>;
>                                 label = "lan2";
>                         };
>                         port@3 {
>                                 status = "off";
>                                 reg = <3>;
>                                 label = "lan3";
>                         };
>                         port@4 {
>                                 status = "off";
>                                 reg = <4>;
>                                 label = "lan4";
>                         };
>                         port@6 {
>                                 reg = <6>;
>                                 label = "cpu";
>                                 ethernet = <&gmac0>;
>                                 phy-mode = "trgmii";
>                                 fixed-link {
>                                         speed = <1000>;
>                                         full-duplex;
>                                 };
>                         };
>                 };
>         };
> };
>
> / {
>         gsw: gsw@1e110000 {
>                 compatible = "mediatek,mt7621-gsw";
>                 reg = <0x1e110000 0x8000>;
>                 interrupt-parent = <&gic>;
>                 interrupts = <GIC_SHARED 23 IRQ_TYPE_LEVEL_HIGH>;
>         };
> };
>
> What is the platform device at the memory address 1e110000?
> There is no driver for it. The documentation only has me even more
> confused:
>
> Mediatek Gigabit Switch
> =======================
>
> The mediatek gigabit switch can be found on Mediatek SoCs (mt7620, mt7621).
>
> Required properties:
> - compatible: Should be "mediatek,mt7620-gsw" or "mediatek,mt7621-gsw"
> - reg: Address and length of the register set for the device
> - interrupts: Should contain the gigabit switches interrupt
> - resets: Should contain the gigabit switches resets
> - reset-names: Should contain the reset names "gsw"
>
> Example:
>
> gsw@10110000 {
>         compatible = "ralink,mt7620-gsw";     <- notice how even the example is bad and inconsistent
>         reg = <0x10110000 8000>;
>
>         resets = <&rstctrl 23>;
>         reset-names = "gsw";
>
>         interrupt-parent = <&intc>;
>         interrupts = <17>;
> };
>
> Does the MT7621 contain two Ethernet switches, one accessed over MMIO
> and another over MDIO? Or is it the same switch? I don't understand.
> What is the relationship between the new compatible that you're
> proposing, Qingfang, and the existing device tree bindings?

The current dtsi is copied from OpenWrt, so the existing "mt7621-gsw"
/ "mt7620-gsw" compatible is for their swconfig driver.
MT7621 has only one switch, accessed over MDIO, so the reg property
has no effect.

Should this patch be accepted, the existing gsw nodes can be dropped.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
