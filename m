Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BCE1C64EC4
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 Mar 2023 13:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o1V4bPDp9RjOX5IVjz87L3/JjhTGESn2h01X3jbS3fc=; b=Qzqp+Or8ohPaXk72QTQHxJeO+l
	F6XH+x2K4Enb9A3qPMl5iglsEGhIT9joTpF+sPbM5qS4bJy7eZKSTVYA2HAiroEXMy2QURf8OqqYo
	42iVmXglbb4PLyRPPLkcAgNDXAHLESwttssP+fptExmNMPMAz9ucw7okO0xTJUwS69dEv5MaWeXin
	POJlXvKLxVsWbU08MmtiHdGZ2mQPyJTpUGI646jl2e0Tvc84jVYT3VUc1sy4e54HiUvY4kdTWTZBu
	IjtH/3IhqO/NI1EwjILmQmZY0+0N6M9ouEUqmKGgWt0y9t8RUNJkLzb+23fICTseTA+8jjr2vvDgL
	GWbAR1NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYRZ9-008zaD-8t; Sat, 04 Mar 2023 13:04:47 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYRYy-008zWg-1U; Sat, 04 Mar 2023 13:04:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=o1V4bPDp9RjOX5IVjz87L3/JjhTGESn2h01X3jbS3fc=; b=lhkvKBDDL7Mdqv+FXEr7lOJzuV
	zycE44M2CTYcUo4mJzXyTs+7itC5K0PO5qD9qsvFm2QUngqIQmOaJIvHUE0mZ1RKQAyIcaRXtB3au
	Q3O5/oSzR7MjMlHHwoe2wEu555n7kX7uw0Sm7T9N0ns/bNrbR1NnGyzpn4grw++WQ8jIVDjkeBHpv
	yT1RCd5rneafkVz/vUrxAszHCbD8wDawbGGOtEZOax+fHgvXJJHTN34kj63tYWpigrMtM7jfI2VgP
	596gGVaxH6OwRU6jpxD0N2q9DT7EPsi4HULAi8MFG1ony9OINusemamaHrQG6ryiC90ENyLkPQIx8
	3Vx05wdw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:53642)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1pYRYW-0002cK-A5; Sat, 04 Mar 2023 13:04:08 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1pYRYP-0006uV-Dy; Sat, 04 Mar 2023 13:04:01 +0000
Date: Sat, 4 Mar 2023 13:04:01 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: arinc9.unal@gmail.com
Subject: Re: [RFC PATCH net] net: dsa: mt7530: move PLL setup out of port 6
 pad configuration
Message-ID: <ZANBwZryFXDEVEtG@shell.armlinux.org.uk>
References: <20230304125453.53476-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230304125453.53476-1-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230304_050436_158767_D3EABEDE 
X-CRM114-Status: GOOD (  10.61  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>, =?iso-8859-1?Q?Ren=E9?= van Dorst <opensource@vdorst.com>, Eric Dumazet <edumazet@google.com>, erkin.bozoglu@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, Richard van Schagen <richard@routerhints.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, Alexander Couzens <lynxis@fe80.eu>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Mar 04, 2023 at 03:54:54PM +0300, arinc9.unal@gmail.com wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> Move the PLL setup of the MT7530 switch out of the pad configuration of
> port 6 to mt7530_setup, after reset.
> 
> This fixes the improper initialisation of the switch when only port 5 is
> used as a CPU port.
> 
> Add supported phy modes of port 5 on the PLL setup.
> 
> Remove now incorrect comment regarding P5 as GMAC5.

If this is what is necessary, you're taking some of the configuration
out of phylink's control, effectively making port 6 a fixed-interface
mode port. In that case, there should only ever be one interface
mode set in port 6's supported_interface mask, so that phylink knows
that no other interface modes can be selected for that port.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

