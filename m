Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64D76EEAA5F
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Sep 2023 18:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1D+/SKBfP3op3rJcuUd1QTL4SUDL0Vl8hzAaaiQ05QA=; b=Ws0hvfomBYduqJgQ5HtXrB6gUH
	8D9zsF9OVybfb1WBLR378Rx0UWHRrjK+EErWnc9/jl1xJkuUv3NsSySXmm4oAxcOLsgF72FdKAgRm
	1tWN9YcH+nxK0vg+ITSAhTzyhV7D/IBtmtKmOMNH08rRL9DhCkcqKpY8DjIl4I2SvsD1+CECRNHHv
	+RPfQswovvFupX/vk87UYtVt2v8ConOFeWIQtvW8fK8DN3gZ7liIZBO13inZ+TEFhdJFXm/Ag7k83
	0VDT+z0mvV8/LaCixCQBrd50SV0HIMNz2j2arkBTrxZeJY2ZR055r4JDFH4Ts5cIqZM4OxOKtRhev
	gOn47DKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgqjo-0092FK-11;
	Thu, 14 Sep 2023 18:06:48 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgqjk-0092E2-0e;
	Thu, 14 Sep 2023 18:06:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=1D+/SKBfP3op3rJcuUd1QTL4SUDL0Vl8hzAaaiQ05QA=; b=oTYBk4M3u15uWEFrkJeYaNABsn
	4SlrZEZ1WnSQ6iG5PsCCW3OJcnRQyRWFERG17cyeloVk5IZXV+W/7YYeXQzx4KLSISJ9v3icL+OYB
	ULoRZVOzaE1vCBOoF9wm99Stm87Hb5xK5og7jL9hsdNB1MODNk8YvCx0j9axxvSa3h/nn5VEkMwtp
	oNDPSNNrTBqjlTF2OW2i192v8m99oW3sTtYOPO6hAXvrVjwcgEvkqTlqGwTBpbsoSlZOjV3QWoiQk
	T4V953zJY/gikz2sIL7gNZw+9+bgQgbDng7TT3aeobFMRTgKNC0p3avg1A+R6U9nU9oRqssDa1RTc
	06RbnWZw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:50940)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1qgqjI-0004fs-10;
	Thu, 14 Sep 2023 19:06:16 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1qgqjC-0004z2-Sn; Thu, 14 Sep 2023 19:06:10 +0100
Date: Thu, 14 Sep 2023 19:06:10 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Vladimir Oltean <olteanv@gmail.com>
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
Message-ID: <ZQNLkiAt4jOjojRf@shell.armlinux.org.uk>
References: <0cee0928-74c9-4048-8cd8-70bfbfafd9b2@arinc9.com>
 <20230827121235.zog4c3ehu2cyd3jy@skbuf>
 <676d1a2b-6ffa-4aff-8bed-a749c373f5b3@arinc9.com>
 <87325ce9-595a-4dda-a6a1-b5927d25719b@arinc9.com>
 <20230911225126.rk23g3u3bzo3agby@skbuf>
 <036c0763-f1b2-49ff-bc82-1ff16eec27ab@arinc9.com>
 <20230912193450.h5s6miubag46z623@skbuf>
 <6cec079e-991e-4222-a76d-d6156de0daca@arinc9.com>
 <20230913074231.5azwxqjuv2wp5nik@skbuf>
 <ZQHcV5DUfcCYkkTi@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZQHcV5DUfcCYkkTi@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_110644_236730_F87659BE 
X-CRM114-Status: GOOD (  33.03  )
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

On Wed, Sep 13, 2023 at 04:59:19PM +0100, Russell King (Oracle) wrote:
> On Wed, Sep 13, 2023 at 10:42:31AM +0300, Vladimir Oltean wrote:
> > On Wed, Sep 13, 2023 at 08:52:37AM +0300, Arınç ÜNAL wrote:
> > > On 12.09.2023 22:34, Vladimir Oltean wrote:
> > > > On Tue, Sep 12, 2023 at 10:23:51PM +0300, Arınç ÜNAL wrote:
> > > > > The phylink bindings for user ports I ended up making by looking up the
> > > > > existing devicetrees are different than the phylink bindings for the shared
> > > > > (CPU and DSA) ports currently enforced on all switches.
> > > > > 
> > > > > My phylink bindings for user ports:
> > > > > 
> > > > >              allOf:
> > > > >                - anyOf:
> > > > >                    - required: [ fixed-link ]
> > > > >                    - required: [ phy-handle ]
> > > > >                    - required: [ managed ]
> > > > > 
> > > > >                - if:
> > > > >                    required: [ fixed-link ]
> > > > >                  then:
> > > > >                    not:
> > > > >                      required: [ managed ]
> > > > 
> > > > Right, it should have been anyOf and not oneOf.. my mistake. It is a bug
> > > > which should be fixed. It's the same phylink that gets used in both cases,
> > > > user ports and shared ports :)
> > > 
> > > One more thing, I don't recall phy-mode being required to be defined for
> > > user ports as it will default to GMII. I don't believe this is the same
> > > case for shared ports so phy-mode is required only for them?
> > 
> > phy-mode is not strictly required, but I think there is a strong
> > preference to set it. IIRC, when looking at the DSA device trees, there
> > was no case where phy-mode would be absent on CPU/DSA ports if the other
> > link properties were also present, so we required it too. There were no
> > complaints in 1 year since dsa_shared_port_validate_of() is there. The
> > requirement can be relaxed to just a warning and no error in the kernel,
> > and the removal of "required" in the schema, if it helps making it
> > common with user ports.
> 
> However, phylink pretty much requires phy-mode to be specified to be
> something sane for shared ports, so I wouldn't be in favour of relaxing
> the checkinng in dsa_shared_port_validate_of()... not unless you're
> now going to accept the approach I originally proposed to have DSA
> drivers tell the core (and thus phylink) what phy-mode and other link
> parameters should be used when they are missing from DT.

You mean the approach that I picked up using software nodes that got
thrown out by the software node people? That approach that I picked
up from you and tried to get merged?

No, that's not going to happen, and it's not a question of whether
_I_ am going to accept that approach or not. So don't throw that
back on me, please.

If this is something that we want to solve, we need to stop being so
devisive (your language above is so) and try to come up with a
solution that is acceptable to everyone... the swnode approach
doesn't seem to be it.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

