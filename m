Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99607C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jul 2022 13:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GFYaO3lKdBQOZgxDPdNq3Av3oecPqgKRyrbG9aidV/Y=; b=GFtrYtkbZoieo0yQED09ujwzlA
	3AHlkD2tc6eA+jWlk1Mw4tUTpeaO19HOkdkGkQZZiGve2co7C0Jw6TgDy/g21Up7QOFOQUbh7ivQe
	iDpFQbgufqQZx+AtgHjidQhupll80UFJvlcxHzYOdADFiX5mF4Gz1NIaaNMKKshRhlJMX3FbBRrqh
	VBNQAPWSX66bCzgbUg6MCKIDEGuVuczArixE6jZXqVfHdR/55HxfUp29aj6CDAAdACH/z4k2VW1ud
	bqCRwDYVhBMh6++pCeStNdYhiw/SLcaseGwZK+UPKsRPWRAXhMwmzivjnk7/l87O7Fds8FlLlkCd4
	hS09Klzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEWdQ-007KLV-Sr; Thu, 21 Jul 2022 13:54:36 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEWVV-007Eec-Dc; Thu, 21 Jul 2022 13:46:27 +0000
Received: by mail-ed1-x536.google.com with SMTP id m8so2213306edd.9;
        Thu, 21 Jul 2022 06:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=GFYaO3lKdBQOZgxDPdNq3Av3oecPqgKRyrbG9aidV/Y=;
        b=D6TZHjSUmzXvzDxLXjlNMssyaqBzUgHg0ruAB0IuMqGRHUg/wcSZY96jHqoLMxD4vF
         iZCR9oAB3PEletONkwpucJg8qEDQaIIYwbGthkAp8NfMwbB8LtlpvPbn3Q0LZ0dlcLEU
         3GZJJbutn7D3dMJEr2MlfEr5yjqBUU8z2bz5BZLLLUE5UjQNlS13ZVykjS1mRFkS9UB+
         2gx8aaRFwFvaV94wyD1yMmeMMaMY7Sx+wd5ASBFySRSLJ1a5fqx+FuG6xYfezAbRWsN9
         XiuAebhbcJx236kfwZlxjBKWpuX+UDV7yYJ4KB9vhWzexghQchcLQK47JP9VyhN75e6E
         tSuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GFYaO3lKdBQOZgxDPdNq3Av3oecPqgKRyrbG9aidV/Y=;
        b=1suyZQmy5XX7vqK2NIGdsSBRST3TliOT7ogz6Pl80zgSvoQe/nWGNyR4igYz9V7r9G
         xd4iQZ3iDI/wtQ/vRhZQPY9VhK8D/WoXhYdAGGXj+T7FApJuN3Pv0YyWPJBs6a3hlMdN
         jjDc8aiC3KmBu1o2V0BwMWsEihXuJnaxfGuiqLQN8ENloygcrU3t5ZK2x6v98TeBDrcC
         D73oaUPy91vKRZqgfNTPEm0kjYvpMv3Omkyte68MVvzImCVirSNf57gRYwiLIfJeduWc
         si3FK/SCbt3NgKx1FQGet1pglidF0XctBe1aecnCNbkYCIQRogNxZWOWtxMyKvWC3I5x
         uVVQ==
X-Gm-Message-State: AJIora8RSr+nwkY9hJ3wkuSDeU2kOKu6bq4VSk7O+Q6fjlRL8WnjPhuZ
	QRPdimOH3adZG3YIRu7pb/w=
X-Google-Smtp-Source: AGRyM1va55K1SZWLz0E6z50sOUk12tbHBTTVllyDYDSE9WX6LAxbFJA+gj27a33bSzA8E8QWWL4OnA==
X-Received: by 2002:a05:6402:370:b0:43b:bb2e:a0c6 with SMTP id s16-20020a056402037000b0043bbb2ea0c6mr8323565edw.378.1658411182751;
        Thu, 21 Jul 2022 06:46:22 -0700 (PDT)
Received: from skbuf ([188.25.231.115])
        by smtp.gmail.com with ESMTPSA id rn9-20020a170906d92900b0072f1e7b06d9sm878295ejb.59.2022.07.21.06.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jul 2022 06:46:21 -0700 (PDT)
Date: Thu, 21 Jul 2022 16:46:18 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alvin __ipraga <alsi@bang-olufsen.dk>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Daniel Scally <djrscally@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	DENG Qingfang <dqfext@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	George McCollister <george.mccollister@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Kurt Kanzenbach <kurt@linutronix.de>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Sean Wang <sean.wang@mediatek.com>, UNGLinuxDriver@microchip.com,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Woojung Huh <woojung.huh@microchip.com>,
	Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
Subject: Re: [PATCH net-next 3/6] net: dsa: add support for retrieving the
 interface mode
Message-ID: <20220721134618.axq3hmtckrumpoy6@skbuf>
References: <E1oCNl3-006e3n-PT@rmk-PC.armlinux.org.uk>
 <20220715172444.yins4kb2b6b35aql@skbuf>
 <YtHcpf4otJQS9hTO@shell.armlinux.org.uk>
 <20220715222348.okmeyd55o5u3gkyi@skbuf>
 <YtHw0O5NB6kGkdwV@shell.armlinux.org.uk>
 <20220716105711.bjsh763smf6bfjy2@skbuf>
 <YtKdcxupT+INVAhR@shell.armlinux.org.uk>
 <20220716123608.chdzbvpinso546oh@skbuf>
 <YtUec3GTWTC59sky@shell.armlinux.org.uk>
 <20220720224447.ygoto4av7odsy2tj@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220720224447.ygoto4av7odsy2tj@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_064625_513637_A6842A64 
X-CRM114-Status: GOOD (  16.24  )
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

On Thu, Jul 21, 2022 at 01:44:47AM +0300, Vladimir Oltean wrote:
> I really wish there was a ready-made helper for validating phylink's
> OF node; I mentioned this already, it needs to cater for all of
> fixed-link/phy-handle/managed/sfp.

While I was going to expand on this point and state that DSA doesn't
currently instantiate phylink for this OF node:

			port@9 {
				reg = <0x9>;
				label = "cpu";
				ethernet = <&eth1>;
				phy-mode = "2500base-x";
				managed = "in-band-status";
			};

I was proven wrong. Today I learned that of_phy_is_fixed_link() returns
true if the "managed" property exists and its value differs from "auto".
So in the above case, of_phy_is_fixed_link() returns true, hmmm.



On the other hand I found arm64/boot/dts/marvell/cn9130-crb.dtsi, where
the switch, a "marvell,mv88e6190"-compatible (can't determine going just
by that what it actually is) has this:

			port@a {
				reg = <10>;
				label = "cpu";
				ethernet = <&cp0_eth0>;
			};

To illustrate how odd the situation is, I am able to follow the phandle
to the CPU port and find a comment that it's a 88E6393X, and that the
CPU port uses managed = "in-band-status":

&cp0_eth0 {
	/* This port is connected to 88E6393X switch */
	status = "okay";
	phy-mode = "10gbase-r";
	managed = "in-band-status";
	phys = <&cp0_comphy4 0>;
};

Open question: is it sane to even do what we're trying here, to create a
fixed-link for port@a (which makes the phylink instance use MLO_AN_FIXED)
when &cp0_eth0 uses MLO_AN_INBAND? My simple mind thinks that if all
involved drivers were to behave correctly and not have bugs that cancel
out other bugs, the above device tree shouldn't work. The host port
would expect a clause 37 base page exchange to take place, the switch
wouldn't send any in-band information, and the SERDES lane would never
transition to data mode. To fix the above, we'd really need to chase the
"ethernet" phandle and attempt to mimic what the DSA master did. This is
indeed logic that never existed before, and I don't particularly feel
like adding it. How far do we want to go? It seems like never-ending
insanity the more I look at it.

