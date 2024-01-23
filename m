Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8365C47258
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Jan 2024 20:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/K+NKUpNvuWFdvNqRH7z18FAACuRlVImuRGe1xvHS08=; b=tVLyPXmkF1GTbT6BMl0EXg7wyp
	7fwAehkAlOJ7jeJV/gnG/OhecwR2iZv4n4MYeSUfPfQI7/alV4E9BhK6XDFXRZNg1y7TEQm8QAJgh
	JBqXn0apvCpVY5phtkWactfuwDlU47i8ShUXIeVszZRZkgeHlRudfKufRk9X8njPNMRXX3UgUKCsE
	r+rn6r35U96aUQmSC//ZAn/BBeDda6tRZ36bTVZkg3/Ocw1z5RAN/hTSl/+TCtSGGR5hdBt7c0Azv
	zDoTs4YXLaCqJth4BXCvQc0mgzm3juykBmgX3HmsVXJqIS0nnrnWIrYsZfOsaenYMAw92Oy5I6HHO
	E3T74Gjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSN43-000LWP-0o;
	Tue, 23 Jan 2024 20:08:07 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSN3z-000LUd-0o;
	Tue, 23 Jan 2024 20:08:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=/K+NKUpNvuWFdvNqRH7z18FAACuRlVImuRGe1xvHS08=; b=m+UMwDvCAx9RXnWkGffmkb13Mq
	gvAcm/JJcDX+/sH+P1uXjviNELKu+Kpzh9pR9WCP0YhjMPPrLyIygSRxkOU6de2lAq5UHxkkZNsws
	o386r0pOIN50Z5R0L/jEvLcglJo1D54FmiZzs9iQ8W2NWKTaDMviT4/WwaxrhMvj8z8b7hBs23gSk
	Ke5hBSU+IoA7EHTwyr2cc7pWNebZhowOSAK8PSrhh8+egmH1R/e+2YPbDqPSlQox6Fzr812onfsoi
	xtNmvydKPoJI0F7ci262ZxmruhRmnG7HzUB3dPDIjtQ8iHPj0bN7Xk7y5758m6aPH01q99KLFIZP4
	SKSGPhJQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:46540)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rSN3f-00031R-1S;
	Tue, 23 Jan 2024 20:07:43 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rSN3X-0002Ct-RA; Tue, 23 Jan 2024 20:07:35 +0000
Date: Tue, 23 Jan 2024 20:07:35 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Sean Anderson <sean.anderson@seco.com>
Cc: Landen.Chao@mediatek.com, UNGLinuxDriver@microchip.com,
	alexandre.belloni@bootlin.com, andrew@lunn.ch,
	angelogioacchino.delregno@collabora.com, arinc.unal@arinc9.com,
	claudiu.manoil@nxp.com, daniel@makrotopia.org, davem@davemloft.net,
	dqfext@gmail.com, edumazet@google.com, f.fainelli@gmail.com,
	hkallweit1@gmail.com, kuba@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
	netdev@vger.kernel.org, olteanv@gmail.com, pabeni@redhat.com,
	sean.wang@mediatek.com
Subject: Re: [PATCH RFC net-next 03/14] net: phylink: add support for PCS
 link change notifications
Message-ID: <ZbAch9ZlbDrZqzpw@shell.armlinux.org.uk>
References: <E1qChay-00Fmrf-9Y@rmk-PC.armlinux.org.uk>
 <75773076-39a2-49dd-9eb2-15a10955a60d@seco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <75773076-39a2-49dd-9eb2-15a10955a60d@seco.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_120803_287716_0828979A 
X-CRM114-Status: GOOD (  13.46  )
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

On Tue, Jan 23, 2024 at 02:46:15PM -0500, Sean Anderson wrote:
> Hi Russell,
> 
> Does there need to be any locking when calling phylink_pcs_change? I
> noticed that you call it from threaded IRQ context in [1]. Can that race
> with phylink_major_config?

What kind of scenario are you thinking may require locking?

I guess the possibility would be if pcs->phylink changes and the
compiler reads it multiple times - READ_ONCE() should solve that.

However, in terms of the mechanics, there's no race.

During the initial bringup, the resolve worker isn't started until
after phylink_major_config() has completed (it's started at
phylink_enable_and_run_resolve().) So, if phylink_pcs_change()
gets called while in phylink_major_config() there, it'll see
that pl->phylink_disable_state is non-zero, and won't queue the
work.

The next one is within the worker itself - and there can only
be one instance of the worker running in totality. So, if
phylink_pcs_change() gets called while phylink_major_config() is
running from this path, the only thing it'll do is re-schedule
the resolve worker to run another iteration which is harmless
(whether or not the PCS is still current.)

The last case is phylink_ethtool_ksettings_set(). This runs under
the state_mutex, which locks out the resolve worker (since it also
takes that mutex).

So calling phylink_pcs_change() should be pretty harmless _unless_
the compiler re-reads pcs->phylink multiple times inside
phylink_pcs_change(), which I suppose with modern compilers is
possible. Hence my suggestion above about READ_ONCE() for that.

Have you encountered an OOPS because pcs->phylink has become NULL?
Or have you spotted another issue?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

