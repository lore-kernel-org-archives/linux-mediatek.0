Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F164EC6FA86
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Sep 2022 15:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9js1M1Ii2LBgsHaQvlOo8Knhz7Y350P1S5r7xrIXqTQ=; b=FyqY2GcxvFSS4zB+azvixYjh8K
	kBut0bYRcZcFM0ZeDGdPy89mK/dvbA8NlOVbnFh7G7z6T8bW8C6CMSPFCZ7n2Pn8s2c/gSaPcMRcZ
	pArZYO8qrQEfxPndPmYKN0pgvp5ADBNcOLFtfCV/7MqTx+3Tg+k4gjHcDeEQe/scFA0Ont5AtSJs7
	7mK3Q9gHs3rJqS6jP559LTdAtBAXhwcIECMPz1mUZgRCs7cY5z3Zbxs7xotUjJJFGkVaRlL/ZH30r
	KRHNt8uHl/fx1nRwTi1HV4omz8ZMgmMHFZbC+8QF62wko7c+kJyuu00C9+FtnJETPh4w1ASeUSe92
	6R+F+HXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY8Ey-00CrHZ-R9; Tue, 13 Sep 2022 15:54:24 +0000
Received: from mail-oa1-f44.google.com ([209.85.160.44])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY8Ek-00Cr6D-Qc; Tue, 13 Sep 2022 15:54:12 +0000
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-1225219ee46so33295757fac.2;
        Tue, 13 Sep 2022 08:54:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date;
        bh=9js1M1Ii2LBgsHaQvlOo8Knhz7Y350P1S5r7xrIXqTQ=;
        b=Ds+AO/pvjyzBfjDGMZ17XJrHpmiXfBmm/Mf2kVe7AR3XIopTngcWl2eJPUvAp2UOEW
         vHE47NemSExPsSWWFpAUzUIfm3I2dCV1VvYhWg4yFGzXHGSeowe3wcB4d34vkMIq9S7s
         BbSQU7lEE9xPu9EAQlEShgg7je9sDqIU0zHZxwSadw+9K2oRe+lNzUSp7JIV6azUYXa7
         y3OXbO8HSYWbFsMssnMEXp3zJWS8Ux0Fb5NRZv5jZMe4YaRR2+k89TPRg+GKD/NjKQIU
         h0/LISBJOvzCncCfG5RvvnULjxFw7+oTUsAz5b8b8ubCXmXis1xoYGpHuvUhvkbZ5ypY
         PmWg==
X-Gm-Message-State: ACgBeo3ysCKaofngSl+/TJDefY6K5jxHQ0iM5cSMat5qxKFLUar4P6q8
	6mMmY72WTR0VHK75ysSt3Q==
X-Google-Smtp-Source: AA6agR6OSLSOn5d1tMnYfRyDMU2tMdpF8Je09Y8xIoPZ+L8vtccd6B7jTMVW9FMSQvYR8s6Xdz1Rmg==
X-Received: by 2002:a05:6870:231e:b0:116:8e04:5d03 with SMTP id w30-20020a056870231e00b001168e045d03mr2158319oao.210.1663084449931;
        Tue, 13 Sep 2022 08:54:09 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id l10-20020a0568302b0a00b0063711d42df5sm2875562otv.30.2022.09.13.08.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 08:54:09 -0700 (PDT)
Received: (nullmailer pid 3805949 invoked by uid 1000);
	Tue, 13 Sep 2022 15:54:08 -0000
Date: Tue, 13 Sep 2022 10:54:08 -0500
From: Rob Herring <robh@kernel.org>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Vivien Didelot <vivien.didelot@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	George McCollister <george.mccollister@gmail.com>, Kurt Kanzenbach <kurt@linutronix.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Woojung Huh <woojung.huh@microchip.com>, 
	"UNGLinuxDriver@microchip.com" <UNGLinuxDriver@microchip.com>, Linus Walleij <linus.walleij@linaro.org>, 
	=?UTF-8?Q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, 
	Sean Wang <sean.wang@mediatek.com>, Marek Vasut <marex@denx.de>, John Crispin <john@phrozen.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH net-next 3/3] dt-bindings: net: dsa: remove label = "cpu"
 from examples
Message-ID: <20220913155408.GA3802998-robh@kernel.org>
References: <20220912175058.280386-1-vladimir.oltean@nxp.com>
 <20220912175058.280386-4-vladimir.oltean@nxp.com>
 <b11e86c6-ff35-2103-cebe-ebe5f737d9de@arinc9.com>
 <20220913133122.gzs2uhuk626eazee@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220913133122.gzs2uhuk626eazee@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_085410_890239_059AAE44 
X-CRM114-Status: GOOD (  16.32  )
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

On Tue, Sep 13, 2022 at 01:31:22PM +0000, Vladimir Oltean wrote:
> On Tue, Sep 13, 2022 at 11:20:04AM +0300, Arınç ÜNAL wrote:
> > Is there also a plan to remove this from every devicetree on mainline that
> > has got this property on the CPU port?
> > 
> > I'd like to do the same on the DTs on OpenWrt.
> 
> I don't really have the time to split patches towards every individual
> platform maintainer and follow up with them until such patches would get
> accepted. I would encourage such an initiative coming from somebody else,
> though.

You can always do a patch for everyone and ask soc@kernel.org 
maintainers to apply directly.

Rob

