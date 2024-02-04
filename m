Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C670C4828F
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Feb 2024 16:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ARhUd+4BC4K6/+DLs4tqQLgAz6hc77yoI87eIC/Gm8E=; b=l+9bXUS0sCrv+fvh0OvK53Sw4P
	ayOClQzOHf1Aj/8s8NFqDGmu9rZHDCY2v7WQc5PhfYkAaEZLKqkvukgS8ggLSgBnDUY4WhaFRqdEj
	BqsyvrolNQL0aS+79ahN5lkNdLTdrvPOk/3gIIgP+A+KIQFjwxkCMRLTpyllnm4skuUB/YPWrGz7c
	AvUZHxTboisDk+uaavdNvqcwAuJRhvan5qoid+8ObfpVTXHVEc3lGWXSsiZQNgyaLFt1WktZzjP89
	OcXYlg/wHSk393jdpIPlVg/C44gw1+v7r8FPSU4ANwiJwqTlvNVMkdmqv6vv52AVRqKFaziZQIoW4
	mvwQkxdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWfWM-00000001A2U-0sI5;
	Sun, 04 Feb 2024 16:39:06 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWfWI-00000001A1H-1WJk;
	Sun, 04 Feb 2024 16:39:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ARhUd+4BC4K6/+DLs4tqQLgAz6hc77yoI87eIC/Gm8E=; b=UbyTdK4JtiLRziZxzj4iJDZhcw
	CBvNFJ1p8lhyRm8qqL9LchtFIFsV9HXz1utgMt08pB1VHN+KMeIdEUhv6R+RCo5jLlMoVK9BDacXF
	Gik3jg3D0PSDjwfN37gdsszSO2kPhQOOciK6RO9dnzvK9SBsB/+jjpJQcqQRe1RLe2510YIUA+U1l
	3NxstJmVWVq+E3VZwK1l4+RGM027Yy40LHlfA3MT3NuTfuqwybdlRDN6mXRvJTgT5Cuvs5o8d2DLv
	OgjwXvRXNgLuAe48gXMBT0hy6UskdUf94EFYq5eIYuUn/W2xUBKKWzvzQpnM7Tu7yANSJt0aUb7ca
	IQbLJ8ww==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:55838)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rWfW0-000894-0t;
	Sun, 04 Feb 2024 16:38:44 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rWfVt-0001uO-OT; Sun, 04 Feb 2024 16:38:37 +0000
Date: Sun, 4 Feb 2024 16:38:37 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	mithat.guner@xeront.com, erkin.bozoglu@xeront.com,
	Bartel Eerdekens <bartel.eerdekens@constell8.be>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v3 4/7] net: dsa: mt7530: move XTAL check to
 mt7530_setup()
Message-ID: <Zb+9jQUqaha3Idsi@shell.armlinux.org.uk>
References: <20240202-for-netnext-mt7530-improvements-2-v3-0-63d5adae99ca@arinc9.com>
 <20240202-for-netnext-mt7530-improvements-2-v3-4-63d5adae99ca@arinc9.com>
 <ZbzWpmZrukknMsYf@shell.armlinux.org.uk>
 <5b744f7f-2f63-4219-a0e9-8f08267b1fdd@arinc9.com>
 <Zb021ozEQSbU-gPd@makrotopia.org>
 <f6234b46-ce30-4b2a-9681-15633a06feff@arinc9.com>
 <Zb+ctEe9TVA3zhv8@shell.armlinux.org.uk>
 <4fa2ff0d-2804-4a58-980f-162e62b3dc9c@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4fa2ff0d-2804-4a58-980f-162e62b3dc9c@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240204_083902_588577_C3014C50 
X-CRM114-Status: GOOD (  39.52  )
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

On Sun, Feb 04, 2024 at 06:55:14PM +0300, Arınç ÜNAL wrote:
> On 4.02.2024 17:18, Russell King (Oracle) wrote:
> > On Sun, Feb 04, 2024 at 04:55:40PM +0300, Arınç ÜNAL wrote:
> > > This is not about laziness. This is before patch 2:
> > > 
> > > phylink_mac_ops :: mac_config() -> dsa_port_phylink_mac_config()
> > > -> dsa_switch_ops :: phylink_mac_config() -> mt753x_phylink_mac_config()
> > >     -> mt753x_mac_config()
> > >        -> mt753x_info :: mac_port_config() -> mt7530_mac_config()
> > >           -> mt7530_setup_port5()
> > >     -> mt753x_pad_setup()
> > >        -> mt753x_info :: pad_setup() -> mt7530_pad_clk_setup()
> > > 
> > > This is after:
> > > 
> > > phylink_mac_ops :: mac_config() -> dsa_port_phylink_mac_config()
> > > -> dsa_switch_ops :: phylink_mac_config() -> mt753x_phylink_mac_config()
> > >     -> mt753x_mac_config()
> > >        -> mt753x_info :: mac_port_config() -> mt7530_mac_config()
> > >           -> mt7530_setup_port5()
> > >           -> mt7530_setup_port6()
> > > 
> > > Patch 2 does not move mt7530_setup_port6() to be called from
> > > phylink_mac_ops :: mac_config(), it already is. There is no valid reason to
> > > reorder the patches.
> > > 
> > > My response to Russell should've stated this instead of focusing on his
> > > second sentence.
> > 
> > This patch moves the test for a 20MHz crystal to mt7530_setup(),
> > which is something that is entirely orthogonal to patch 2, which
> > can be done cleanly (I've just applied the patches in the original
> > order and then reordered them:
> > 
> > 98c481f5d706 net: dsa: mt7530: do not clear config->supported_interfaces
> > 93c6b53b17f4 net: dsa: mt7530: correct port capabilities of MT7988
> > c9c6d4c51a1d net: dsa: mt7530: simplify mt7530_setup_port6() and change to void
> > adfa948253e0 net: dsa: mt7530: remove pad_setup function pointer
> > 57e21e6c2fc0 net: dsa: mt7530: call port 6 setup from mt7530_mac_config()
> > 959a0f9323c8 net: dsa: mt7530: move XTAL check to mt7530_setup()
> > 856ab64a22ef net: dsa: mt7530: empty default case on mt7530_setup_port5()
> > 
> > No problems. The end result is identical comparing the git tree at the
> > original "move XTAL" patch with adfa948253e0.
> > 
> > Now, if we look at "net: dsa: mt7530: remove pad_setup function pointer"
> > we can see that yes, the pad_setup() method was called from mac_confing,
> > but this is the exact contents of that patch removing the callsite:
> > 
> > -               mt753x_pad_setup(ds, state);
> > 
> > This returns an integer, which may be an error code, which is ignored.
> > Therefore, if the XTAL frequency check fires, and mt753x_pad_setup()
> > returns an error, it is ignored today.
> > 
> > After "net: dsa: mt7530: call port 6 setup from mt7530_mac_config()"
> > the renamed pad_setup() method is now called from mac_config() thusly:
> > 
> > +               ret = mt7530_setup_port6(priv->ds, interface);
> > +               if (ret)
> > +                       return ret;
> > 
> > So now the error checks cause mt7530_mac_config() to return an error
> > which in turn causes mt753x_mac_config() to fail, and therefore
> > mt753x_phylink_mac_config() has different behaviour.
> > 
> > So, patch 2 changes the driver behaviour in the case of a 20MHz XTAL,
> > which is then changed again by patch 4.
> > 
> > It would be better to have only one change of behaviour by moving
> > patch 4 before patch 2.
> 
> If the idea is to not bring any more error returns to mt753x_mac_config()
> because the return code is actually checked for that, I should do a bit
> more effort and put patch 5 before patch 2 as well, to live up to what you
> originally requested.

I assume you are referring to getting rid of the default case in
mt7530_pad_clk_setup().

In patch "net: dsa: mt7530: call port 6 setup from mt7530_mac_config()"
where you move this to be called from mt7530_mac_config(), you add it
as:

+       } else if (port == 6) {
+               ret = mt7530_setup_port6(priv->ds, interface);
+               if (ret)
+                       return ret;
+       }

So it is only called for port 6. The switch within the called function
deals with PHY_INTERFACE_MODE_RGMII and PHY_INTERFACE_MODE_TRGMII.
Anything else results in the use of the default case, and thus
returning an error.

Since mt7530_mac_port_get_caps() does this for port 6:

                __set_bit(PHY_INTERFACE_MODE_RGMII,
                          config->supported_interfaces);
                __set_bit(PHY_INTERFACE_MODE_TRGMII,
                          config->supported_interfaces);

mt7530_setup_port6() will only ever be called for these two modes,
which means that the default case is unreachable, thus we will never
execute that path, thus whether that path returns an error or not is
completely irrelevant.

The only case in mt7530_setup_port6() / mt7530_pad_clk_setup() which
can today return an error is the XTAL check.

Therefore, my suggestion makes complete sense, and there is no need
to also move patch 5.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

