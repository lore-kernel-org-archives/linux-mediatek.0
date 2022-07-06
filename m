Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E9CAC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jul 2022 10:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ttAMqKQtwb0RJXuBF4mjmqPkEKb/1wAB4g1J0PFBHdE=; b=nNOy5hq0QX9u5qz4HCBXEA8TM+
	s8acGohaUo0YyWrAcYF0ob8gZrAs7TqoNTp9LMBgELdEq4+wT8d0KvbLi1ippieqgV+37OXrFIpr/
	5WWhyrdLCJVz397zqT2cJWJDWQu2eYkCvnEynsz3wnybB/4vpTVDVz8fTuNfRbsgJPpEjaLprXYAs
	3EGxxu51+v2nQo25xye+uafaAssvBTmg2hkX2egBuL/THQotOuxD79TUrn4n+TwFeCuqHMxG7fiyI
	THIrGTeayjs39GN9xYGlo4FTiFBwBVfi4WNDl2WGCI6jEdY6HKVnJ14u4bohius/NwOvU5EeDbtsZ
	4J1xgYCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o92My-008b6Z-OV; Wed, 06 Jul 2022 10:34:56 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o923l-008H9T-GB; Wed, 06 Jul 2022 10:15:06 +0000
Received: by mail-ej1-x62e.google.com with SMTP id d2so26299315ejy.1;
        Wed, 06 Jul 2022 03:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ttAMqKQtwb0RJXuBF4mjmqPkEKb/1wAB4g1J0PFBHdE=;
        b=O4xgai6gFhxAa9+lwOBaiqJIvOexNu7AhPZHVLohAl9oxA77gGOMRGIMH/vyFh4n6O
         nyxV4x/HIWb2Od9p+lj0kOdY9jRzmn3P0RFE+OtaNoHXzv8VBNZlDEb0ubH1dR5xEIlt
         RjSmL6aa6JJ9BqWM1vz3vCreafedlaWyC86EGvX3704+9cnlwcZ/NDYQjtdQcMA5lINX
         BMlETp59/NBqm9Ggjkct8297QY+YF8GubozqV0dkQMyqqHuLsWBBVQo7MvUkiJw6cDwD
         mqui+QD/50zOfRozxO+Tbj7AD529bXy9fSxSvuWgESSQElCAVlOB5FipBik8gTTF5VH8
         jZew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ttAMqKQtwb0RJXuBF4mjmqPkEKb/1wAB4g1J0PFBHdE=;
        b=pDqSs+/SgkgcnCRKw5+8jP3WXrc+5asprHH5UiRL/1niBu1fU3DRM4psYI4CaHuP6I
         rSnbt/oFLtu6kEyTZ6IdXcCF9adCj9cCTFtoXyLM2JcTekJv0pevcqMa5y495s6oheu6
         /Q3R77DQM9mEGN7p6TbXTh/lHixlxYeebzmooo5EJd7sFQiBHJdRxv+9WvzyANz3dOv1
         YCKznN3nB7+BtG07dISFSravcQtOsOcoRKaDacLG/i3RQo88HbhKi4cQOUsoVmiijzsn
         h19BEmYyjEq/r4GHlIwgTK3VvkrFy6HdNmwyiQJJrDRF0o4ssVOh/5ZL3onnyR8cs+dr
         CGwA==
X-Gm-Message-State: AJIora8XWnrCBV4/bKgt7vdP394L9NgFYcVnsA9WNXJ12FDW8Dh4zwrc
	yjHZt8NI7AM/+aSf2cihueM=
X-Google-Smtp-Source: AGRyM1tV24IGSPnWZkz4l8br66GbwMLZzFHM41FesXj5nSyq4WrZI5oSUTvRM1Z5B7okJ103QSp9PQ==
X-Received: by 2002:a17:906:38e:b0:722:e8f1:df6c with SMTP id b14-20020a170906038e00b00722e8f1df6cmr39123435eja.500.1657102502581;
        Wed, 06 Jul 2022 03:15:02 -0700 (PDT)
Received: from skbuf ([188.26.185.61])
        by smtp.gmail.com with ESMTPSA id ek5-20020a056402370500b0043a253973aasm7723615edb.10.2022.07.06.03.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 03:15:01 -0700 (PDT)
Date: Wed, 6 Jul 2022 13:14:59 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	"David S. Miller" <davem@davemloft.net>,
	DENG Qingfang <dqfext@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	George McCollister <george.mccollister@gmail.com>,
	Hauke Mehrtens <hauke@hauke-m.de>, Jakub Kicinski <kuba@kernel.org>,
	Kurt Kanzenbach <kurt@linutronix.de>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Sean Wang <sean.wang@mediatek.com>,
	UNGLinuxDriver@microchip.com,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Woojung Huh <woojung.huh@microchip.com>
Subject: Re: [PATCH RFC net-next v2 0/5] net: dsa: always use phylink
Message-ID: <20220706101459.tahby2xpm3e7okjz@skbuf>
References: <YsQIjC7UpcGWJovx@shell.armlinux.org.uk>
 <7fe6b661-06b9-96dd-e064-1db23a9eaae7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7fe6b661-06b9-96dd-e064-1db23a9eaae7@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_031505_612503_EE10D88E 
X-CRM114-Status: GOOD (  16.13  )
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

Hi Florian,

On Tue, Jul 05, 2022 at 09:42:33AM -0700, Florian Fainelli wrote:
> On 7/5/22 02:46, Russell King (Oracle) wrote:
> > A new revision of the series which incorporates changes that Marek
> > suggested. Specifically, the changes are:
> > 
> > 1. Patch 2 - use the phylink_get_caps method in mv88e6xxx to get the
> >     default interface rather than re-using port_max_speed_mode()
> > 
> > 2. Patch 4 - if no default interface is provided, use the supported
> >     interface mask to search for the first interface that gives the
> >     fastest speed.
> > 
> > 3. Patch 5 - now also removes the port_max_speed_mode() method
> 
> This was tested with bcm_sf2.c and b53_srab.b and did not cause regressions,
> however we do have a 'fixed-link' property for the CPU port (always have had
> one), so there was no regression expected.

What about arch/arm/boot/dts/bcm47189-tenda-ac9.dts?
Just to make sure I'm simply not seeing something, I compiled and then
decompiled the dtb. We have:

		ethernet@5000 {
			reg = <0x5000 0x1000>;
			phandle = <0x03>;

			mdio {
				#address-cells = <0x01>;
				#size-cells = <0x00>;

				switch@1e {
					compatible = "brcm,bcm53125";
					reg = <0x1e>;
					status = "okay";

					ports {
						#address-cells = <0x01>;
						#size-cells = <0x00>;

						port@0 {
							reg = <0x00>;
							label = "wan";
						};

						port@1 {
							reg = <0x01>;
							label = "lan1";
						};

						port@2 {
							reg = <0x02>;
							label = "lan2";
						};

						port@3 {
							reg = <0x03>;
							label = "lan3";
						};

						port@4 {
							reg = <0x04>;
							label = "lan4";
						};

						port@5 {
							reg = <0x05>;
							label = "cpu";
							ethernet = <0x03>; <- CPU port with no phy-handle, no fixed-link
						};
					};
				};
			};
		};

