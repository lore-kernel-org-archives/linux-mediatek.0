Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D84C2FC04
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Aug 2023 13:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ld5JKggMZ2IqtoJqdfMp2BiZOzizYR/A4WFUfHZvxKY=; b=f+V3sh1Z38L0sOWd9Uxyhl69Jh
	cL35btknfOI45DUvWw3zVGBskMA4L+TpIaYJJvgDIePeYoMkopAt0YfcySXNQHsUVwk993CD9vxJq
	nW11AwS17geL0u7XTYvx+TKel4UJKOgFo2i3W82BXg3zhKEdM0lPq1la12cSbq+knlqAWo7m2OtTO
	ivKNHU321t58q39K/ld+6/EkOpN4EtRqiJMbgKZ2Ys3AZdqIPEiaisplaZjRiMHeonUjSiRHOJQug
	WVgBFytfz+SKS+oJvxVlBQyawQrL/GubZlEbJtaKkkQ2h5ZQ4dbQtv7/WFXVSlcaO1OmQBajutRbX
	MPcTAqjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWd5k-006Sqa-1n;
	Thu, 17 Aug 2023 13:31:12 +0000
Received: from [2001:4d48:ad52:32c8:5054:ff:fe00:142] (helo=pandora.armlinux.org.uk)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWd5d-006SpZ-0K;
	Thu, 17 Aug 2023 13:31:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Ld5JKggMZ2IqtoJqdfMp2BiZOzizYR/A4WFUfHZvxKY=; b=BA8Vk27onV+uMI6G33n5GEZWVV
	keaHLaYffbBy2LalShGYKkDKpjLsrociI5Wv3mQ4tD2f1dsRtifqtfJ4HaByhf9XJJxmugKnETiLL
	KklDHD13XSZ3XBzmvadBEx39PA0BoOJBVzBpgFMwbGQ+fLt10WnDIua5INTGNn2O9kJk5NJfzBMzi
	LibiSgsKF1pN69Hr1JLAY1YG9lszOhRpIrNUg7o2MCLejqkPEYKvf9NLZe+ueDEHqwjhecbEWapTn
	o5gPvHGOFeuDfH9Ja6c6C7gmLm9UaaXoWXrYeqfpAMAH4iUzXNnZojSYGtrYLiBGAftCeSIcCNTTb
	GPEptzHA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:54512)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1qWd5Q-0004En-2r;
	Thu, 17 Aug 2023 14:30:52 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1qWd5P-0000dZ-56; Thu, 17 Aug 2023 14:30:51 +0100
Date: Thu, 17 Aug 2023 14:30:51 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Denis Kirjanov <dkirjanov@suse.de>
Cc: Daniel Golle <daniel@makrotopia.org>,
	Alexander Couzens <lynxis@fe80.eu>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next] net: pcs: lynxi: fully reconfigure if link is
 down
Message-ID: <ZN4hCzTJ0DN6iBDU@shell.armlinux.org.uk>
References: <e9831ec99acd5a8ab03c76fce87fa750c7041e60.1692273723.git.daniel@makrotopia.org>
 <565a8248-c4d1-f135-2499-6bbfe76def53@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <565a8248-c4d1-f135-2499-6bbfe76def53@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230817_063106_515581_E25584DF 
X-CRM114-Status: GOOD (  10.65  )
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

On Thu, Aug 17, 2023 at 04:13:44PM +0300, Denis Kirjanov wrote:
> btw is it a thread-safe to check the mpcs->interface member?
> I've quick checked and phylink_pcs_config can be invoked from different places
> and the code below does the following assignment:
> mpcs->interface = interface;

pcs_config is called from:
- phylink_change_inband_advert() while holding pl->state_mutex
- phylink_major_config()

phylink_major_config() is called from:
- phylink_resolve() while holding pl->state_mutex
- phylink_ethtool_ksettings_set() while holding pl->state_mutex
- phylink_mac_initial_config()

phylink_mac_initial_config() is called from:
- phylink_resume()
- phylink_start()

In both cases, these are called without holding pl->state_mutex, so
one may think that they could be unsafe. In both cases, however,
pl->phylink_disable_state is non-zero.

phylink_change_inband_advert() will check whether
PHYLINK_DISABLE_STOPPED is set, and not proceed to call pcs_config()
in that case. In the phylink_resume() case, userspace isn't running,
so there can't be a call to phylink_change_inband_advert().

So, one can assume (as must be the case of course, we're fiddling
with hardware) that pcs_config() will always be run without another
thread also running it for the same hardware. Two over-lapping
pcs_config() calls would lead to an indeterminant hardware state.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

