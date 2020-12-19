Return-Path: <SRS0=cDU4=FX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE2C9C4361B
	for <linux-mediatek@archiver.kernel.org>; Sat, 19 Dec 2020 19:48:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 715882333C
	for <linux-mediatek@archiver.kernel.org>; Sat, 19 Dec 2020 19:48:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 715882333C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=E7wXOsU8jrlbswXA8G0BNkW/T7KbXUpTtrABrIWmDOg=; b=zQxE4ykiXjP7l1TRZU4Q/hwoK
	E6DeIjtKzWRhlNk+sgPoYNhvP87g6PIstFLsvdnETo46A6U3Xvn1GZctBObQY5oIhFbXuGIaSij3i
	CxrML7KVHerdRa5oFxa+6ZPzriTidiGlqRNEcVjeAxIVfw6H7iuEbs0pPaGyml79dHnWD9T+p400c
	KOb/esyrOOBJePI2G1cBwNlLSFUuRyVLr3/ZBKZIjssU9gyStCzwhFtbE1FP77VHbK+XkMU7Yjzjx
	8SzGvHvNUjxmHg7uzJI9jLcDYOfN/NpBhV/VzRGHhKhc5QSNX4A3I4lm8qZME/Rf1YYE4HZ8JiOgZ
	Xb/6cbYig==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kqiDX-0004iy-Dr; Sat, 19 Dec 2020 19:48:39 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kqiDT-0004hU-Ec
 for linux-mediatek@lists.infradead.org; Sat, 19 Dec 2020 19:48:36 +0000
Received: by mail-ej1-x633.google.com with SMTP id j22so8060333eja.13
 for <linux-mediatek@lists.infradead.org>; Sat, 19 Dec 2020 11:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=nYIRKjTX5DlY+XJntHANQo6lAysYqlroTq1IelMOgX0=;
 b=VPSqWPZthRVRc55P45/+iXf2rbbPhBV0pbwIONIdJnfx+7pg9bE7Th2I7cc4Me8HQh
 A8I3uf43rIoLWD8HG2OBz2pxjFLuRs3aetrvYgJXL7x3ugX3W283PgSX+gw96LQnO4UF
 yFgT2eA213hmSxNHOopv+k2teBtdSYEaPGdbg2maNThUIKy/Yh/hoDOfbJQ13GyRaF8E
 ItXIZQLppma5t2rzluRgoF6m0jXzWxXchVcAgHmKc5l+ExxOUGIxP2CzM8lJN8sPeLBC
 bkNc7dtpebQdR1BRVqnRE5IxwxRfOMMbtigOD3Up2/h38Wp89ETWZFDqIOKMJ5kz7Mv+
 darA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nYIRKjTX5DlY+XJntHANQo6lAysYqlroTq1IelMOgX0=;
 b=cjRhUp6vvMJtW7Aux0VmLEwqdRHJmVaCYamZFjwy7nYJyAdOQ8TIO0DI4Be3LgGmXS
 NfN6kad0mShg7GpH/Ky3vXu1DisEdCSkOIxbmrEA3pXB56FuSAUN3o1cJH+R2T82ISvO
 O6+z0uNjD2hp33dYFUm5H4ljBFimgkUdgypIIwqvzidEo8WpuhqHzXpBG39E+9ujA1jE
 qGnzbTvE8aOCv7NIyGWyqafkxG0+bxYumuOPmLKfybd1cHEe/83qWWL2FAJNDsCLFLVJ
 n7EGrHfhhXOj2kuvB2OCZpWGwibeBPGv5aTGs0ErkCz6CJ9NAj9x7xZSUOc0O03XXqkU
 y0Ew==
X-Gm-Message-State: AOAM530htjHsLC/znwPJtVyF5dA1VxouGGdf2DNV/jmiBZOlIW7McPla
 mMkMzHv8r2XYrW/Kg73klmY=
X-Google-Smtp-Source: ABdhPJxbQaQ25oYjNeex6xoNRfUoUf05TClF4UYgxJeFvwt7khLZ4z5PZrL5zeGuZsTJEV+UNt2CFw==
X-Received: by 2002:a17:906:1f8e:: with SMTP id
 t14mr9671367ejr.350.1608407313375; 
 Sat, 19 Dec 2020 11:48:33 -0800 (PST)
Received: from skbuf ([188.25.2.120])
 by smtp.gmail.com with ESMTPSA id cb14sm7242279ejb.105.2020.12.19.11.48.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Dec 2020 11:48:32 -0800 (PST)
Date: Sat, 19 Dec 2020 21:48:31 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [RFC PATCH net-next] net: dsa: mt7530: rename MT7621 compatible
Message-ID: <20201219194831.5mjlmjfbcpggrh45@skbuf>
References: <20201219162153.23126-1-dqfext@gmail.com>
 <20201219162601.GE3008889@lunn.ch>
 <47673b0d-1da8-d93e-8b56-995a651aa7fd@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <47673b0d-1da8-d93e-8b56-995a651aa7fd@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201219_144835_553775_F269C574 
X-CRM114-Status: GOOD (  23.10  )
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
 Rene van Dorst <opensource@vdorst.com>, netdev@vger.kernel.org,
 Sean Wang <sean.wang@mediatek.com>, Russell King <linux@armlinux.org.uk>,
 "David S . Miller" <davem@davemloft.net>, DENG Qingfang <dqfext@gmail.com>,
 Greg Ungerer <gerg@kernel.org>, linux-mediatek@lists.infradead.org,
 John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Vivien Didelot <vivien.didelot@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Andrew, Florian,

On Sat, Dec 19, 2020 at 09:07:13AM -0800, Florian Fainelli wrote:
> On 12/19/2020 8:26 AM, Andrew Lunn wrote:
> >> --- a/drivers/net/dsa/mt7530.c
> >> +++ b/drivers/net/dsa/mt7530.c
> >> @@ -2688,7 +2688,7 @@ static const struct mt753x_info mt753x_table[] = {
> >>  };
> >>  
> >>  static const struct of_device_id mt7530_of_match[] = {
> >> -	{ .compatible = "mediatek,mt7621", .data = &mt753x_table[ID_MT7621], },
> >> +	{ .compatible = "mediatek,mt7621-gsw", .data = &mt753x_table[ID_MT7621], },
> >>  	{ .compatible = "mediatek,mt7530", .data = &mt753x_table[ID_MT7530], },
> >>  	{ .compatible = "mediatek,mt7531", .data = &mt753x_table[ID_MT7531], },
> >>  	{ /* sentinel */ },
> > 
> > This will break backwards compatibility with existing DT blobs. You
> > need to keep the old "mediatek,mt7621", but please add a comment that
> > it is deprecated.
> 
> Besides, adding -gsw would make it inconsistent with the existing
> matching compatible strings. While it's not ideal to have the same
> top-level SoC compatible and having another sub-node within that SoC's
> DTS have the same compatible, given this would be break backwards
> compatibility, cannot you stay with what is defined today?

The MT7621 device tree is in staging. I suppose that some amount of
breaking changes could be tolerated?

But Qingfang, I'm confused when looking at drivers/staging/mt7621-dts/mt7621.dtsi.

/ethernet@1e100000/mdio-bus {
	switch0: switch0@0 {
		compatible = "mediatek,mt7621";
		#address-cells = <1>;
		#size-cells = <0>;
		reg = <0>;
		mediatek,mcm;
		resets = <&rstctrl 2>;
		reset-names = "mcm";

		ports {
			#address-cells = <1>;
			#size-cells = <0>;
			reg = <0>;
			port@0 {
				status = "off";
				reg = <0>;
				label = "lan0";
			};
			port@1 {
				status = "off";
				reg = <1>;
				label = "lan1";
			};
			port@2 {
				status = "off";
				reg = <2>;
				label = "lan2";
			};
			port@3 {
				status = "off";
				reg = <3>;
				label = "lan3";
			};
			port@4 {
				status = "off";
				reg = <4>;
				label = "lan4";
			};
			port@6 {
				reg = <6>;
				label = "cpu";
				ethernet = <&gmac0>;
				phy-mode = "trgmii";
				fixed-link {
					speed = <1000>;
					full-duplex;
				};
			};
		};
	};
};

/ {
	gsw: gsw@1e110000 {
		compatible = "mediatek,mt7621-gsw";
		reg = <0x1e110000 0x8000>;
		interrupt-parent = <&gic>;
		interrupts = <GIC_SHARED 23 IRQ_TYPE_LEVEL_HIGH>;
	};
};

What is the platform device at the memory address 1e110000?
There is no driver for it. The documentation only has me even more
confused:

Mediatek Gigabit Switch
=======================

The mediatek gigabit switch can be found on Mediatek SoCs (mt7620, mt7621).

Required properties:
- compatible: Should be "mediatek,mt7620-gsw" or "mediatek,mt7621-gsw"
- reg: Address and length of the register set for the device
- interrupts: Should contain the gigabit switches interrupt
- resets: Should contain the gigabit switches resets
- reset-names: Should contain the reset names "gsw"

Example:

gsw@10110000 {
	compatible = "ralink,mt7620-gsw";     <- notice how even the example is bad and inconsistent
	reg = <0x10110000 8000>;

	resets = <&rstctrl 23>;
	reset-names = "gsw";

	interrupt-parent = <&intc>;
	interrupts = <17>;
};

Does the MT7621 contain two Ethernet switches, one accessed over MMIO
and another over MDIO? Or is it the same switch? I don't understand.
What is the relationship between the new compatible that you're
proposing, Qingfang, and the existing device tree bindings?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
