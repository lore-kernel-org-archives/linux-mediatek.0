Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE729EE6457
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Sep 2023 12:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ymd4KNlOZU8aSyQl8RdaNXFFLMRuv3B/W9dK3PdwrAc=; b=gOiQZy31QJJe7HS8uKdhTsFTbg
	K0WvciaQhI1k4d6Gc4DW31J3l8izCePHxW55QFaNnQpc3LOfm5PJ8hxmpHVaL1oaBLnund3aBO4qU
	P/izE10WHLcd3Uhi2l5zfGmhi2MYfbSRPS5RScNp/epPPu3jpsuSBPAAQI6L2mGiT+C9Joew9Mumy
	1HlrFW8I8TNirlClRuRfinOnTYtz0WB/LSklokT0Xe0w+9uRXrr25tJKuElY4uWWzF2E4MroQxhdf
	Ir6XINRgz3DziONo7JrqdPgY5THdMoXxwhbrggcKTwuALn47BxrB5+VhcMoueWrD5Z5HF15AJcG+I
	JER6Uhsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh7mT-00Ai7d-00;
	Fri, 15 Sep 2023 12:18:41 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh7mP-00Ai6M-2c;
	Fri, 15 Sep 2023 12:18:39 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-9a21b6d105cso256261466b.3;
        Fri, 15 Sep 2023 05:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694780314; x=1695385114; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ymd4KNlOZU8aSyQl8RdaNXFFLMRuv3B/W9dK3PdwrAc=;
        b=FOP0YKvFw+QXnMswDlwV+gamU/SEnOyslXMgU/5s1M5INU4w47Ep+Ur76J9lUWTH3G
         AaG//kH+y2u+kcrYRP47XQO8uHkFHKRN1PxCh0pSBKyFOBmNibEaYtvpQn1NNonx4zpm
         aPo8454SrMPyNCXjTN63HfPJpR6z4kfAo+skWjtDfwPTEFMkgnqJLXgrkgl6CfgTYnrW
         qB1CXcs7Rw9p4wdIsXvH2zNbmD2ZMbb1QBGyMfijUi9JiQZtnpTWQz90t4CFbNGpum3a
         KgXYgAsK6JKiC1KvlDawXMehxAg+FS5lsKX5xwDEKUts/al/XGPuhEoJ3QAg1sww18kS
         zx8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694780314; x=1695385114;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ymd4KNlOZU8aSyQl8RdaNXFFLMRuv3B/W9dK3PdwrAc=;
        b=EvcH9NoxiLkrBQqqjDAB9i96T3oBUtZCfnHWEyFKm0ypTgGdFvDd9/USkqAlCSHBPm
         1LUrr1t86+FxoZlpu+HYC8qvR1Lvi3wRZ+aBGiVg7JND5wG4FNXou/C7tQ5GLKUBsZVr
         99gk2Glwy3MAzWyeoB6xQZafbw2R74lJ1wlAHuYEI6I2y2OJ/hpiy0dTg3Wu9yS/OJKt
         1K4m3Xk6cPUc23AvBGHQYgTD9zavUaqDNOLsKpKnrf3QdYTm6k6LQ2M3H5xsK0ePhChc
         LWc9BngpvDrZk3WDIKR57KrWSmgFo+rDgrLer9ggq1graT3syslPHjY4XgHY49ghXhCU
         o3RQ==
X-Gm-Message-State: AOJu0Yxl7iI9nPiK6Wl/zG3gxBjouhpCN0ZilMOofAmCl7pRmzqNZ+UP
	Sf3hGOrJPpCzOjbEXb6C3Kk=
X-Google-Smtp-Source: AGHT+IGIM8mfUCVD2aaq64c6QqJ77AiQF4lLWq19si18HJ2jdi75s8K70DPYuygwVCGIEpJnXsYbrA==
X-Received: by 2002:a17:906:535d:b0:9a1:fb4c:3b65 with SMTP id j29-20020a170906535d00b009a1fb4c3b65mr1141593ejo.14.1694780313700;
        Fri, 15 Sep 2023 05:18:33 -0700 (PDT)
Received: from skbuf ([188.26.56.202])
        by smtp.gmail.com with ESMTPSA id x7-20020a170906134700b009a0955a7ad0sm2335355ejb.128.2023.09.15.05.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 05:18:33 -0700 (PDT)
Date: Fri, 15 Sep 2023 15:18:30 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Woojung Huh <woojung.huh@microchip.com>,
	UNGLinuxDriver@microchip.com,
	Linus Walleij <linus.walleij@linaro.org>,
	Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
	Daniel Golle <daniel@makrotopia.org>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	mithat.guner@xeront.com, erkin.bozoglu@xeront.com,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/4] dt-bindings: net: dsa: document internal MDIO bus
Message-ID: <20230915121830.tmzuxthup7rzewhv@skbuf>
References: <676d1a2b-6ffa-4aff-8bed-a749c373f5b3@arinc9.com>
 <87325ce9-595a-4dda-a6a1-b5927d25719b@arinc9.com>
 <20230911225126.rk23g3u3bzo3agby@skbuf>
 <036c0763-f1b2-49ff-bc82-1ff16eec27ab@arinc9.com>
 <20230912193450.h5s6miubag46z623@skbuf>
 <6cec079e-991e-4222-a76d-d6156de0daca@arinc9.com>
 <20230913074231.5azwxqjuv2wp5nik@skbuf>
 <ZQHcV5DUfcCYkkTi@shell.armlinux.org.uk>
 <ZQNLkiAt4jOjojRf@shell.armlinux.org.uk>
 <ZQNL0Vy3kMbWlNFl@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZQNL0Vy3kMbWlNFl@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_051837_853078_BD9A43D2 
X-CRM114-Status: GOOD (  44.60  )
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

Hi Russell,

On Thu, Sep 14, 2023 at 07:07:13PM +0100, Russell King (Oracle) wrote:
> On Thu, Sep 14, 2023 at 07:06:11PM +0100, Russell King (Oracle) wrote:
> > On Wed, Sep 13, 2023 at 04:59:19PM +0100, Russell King (Oracle) wrote:
> > > On Wed, Sep 13, 2023 at 10:42:31AM +0300, Vladimir Oltean wrote:
> > > > On Wed, Sep 13, 2023 at 08:52:37AM +0300, Arınç ÜNAL wrote:
> > > > > One more thing, I don't recall phy-mode being required to be defined for
> > > > > user ports as it will default to GMII. I don't believe this is the same
> > > > > case for shared ports so phy-mode is required only for them?
> > > > 
> > > > phy-mode is not strictly required, but I think there is a strong
> > > > preference to set it. IIRC, when looking at the DSA device trees, there
> > > > was no case where phy-mode would be absent on CPU/DSA ports if the other
> > > > link properties were also present, so we required it too. There were no
> > > > complaints in 1 year since dsa_shared_port_validate_of() is there. The
> > > > requirement can be relaxed to just a warning and no error in the kernel,
> > > > and the removal of "required" in the schema, if it helps making it
> > > > common with user ports.
> > > 
> > > However, phylink pretty much requires phy-mode to be specified to be
> > > something sane for shared ports, so I wouldn't be in favour of relaxing
> > > the checkinng in dsa_shared_port_validate_of()... not unless you're
> > > now going to accept the approach I originally proposed to have DSA
> > > drivers tell the core (and thus phylink) what phy-mode and other link
> > > parameters should be used when they are missing from DT.
> > 
> > You mean the approach that I picked up using software nodes that got
> > thrown out by the software node people? That approach that I picked
> > up from you and tried to get merged?
> > 
> > No, that's not going to happen, and it's not a question of whether
> > _I_ am going to accept that approach or not. So don't throw that
> > back on me, please.
> > 
> > If this is something that we want to solve, we need to stop being so
> > devisive (your language above is so) and try to come up with a
> > solution that is acceptable to everyone... the swnode approach
> > doesn't seem to be it.
> 
> Oh dear. I must be going mad!

So first things first: I am not advocating for making phy-mode fully
optional in the sense that you say (if absent, then write non-OF code
through which DSA infers the phy-mode from drivers). I'm happy with the
current form of the code.

I was just trying to add some nuance to this bizarre aspect signalled by
Arınç - phy-mode is not required for user ports, presumably because when
it is absent, user ports will default to GMII. That isn't an intrinsic
feature of user ports, but rather of having a phydev, and so, because
DSA/CPU ports can also have a phydev, logically it means that phy-mode
can also be omitted in that particular case, with the same result.

Our missing_phy_mode check from dsa_shared_port_validate_of() is theoretically
more restrictive than it needs to be, because it artificially prohibits
that behavior, and it results in an inexplicable difference in the phylink
dt-bindings for user vs shared ports. So that's where my relaxation
proposal came from: we could make missing_phy_mode non-fatal, and that
would permit the configurations which can work to work, and the ones
which can't work will fail elsewhere. Just like for the user ports.

Where I wasn't absolutely clear is that I don't want Arınç to change any
of that. Right now, on DSA shared ports, phy-mode is required and on user
ports it isn't. The difference is a bit strange (arbitrary considering
the example above) and should maybe be settled at some point in the
future, but for now, the dt-bindings should document it like that.

