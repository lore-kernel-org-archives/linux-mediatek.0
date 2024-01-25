Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE4EBC47258
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Jan 2024 16:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rvR+VXv1f18BSClkjanWiSajfNl4/jls34jdju1x0oo=; b=pebZUAC9LxuhD2KsR0Zu9zaGiR
	v4dPm4tJ0gvsH3lc63iRRr+oGbaH3YmepmeHjcchlSxQJU/+/6MXAEper/OsLN9Xrg/eT7DPCXy1H
	S+NaYSTO8xtcApHUdr+EhzR39SRFBx7/WLRO6+ZwGDcj+I7oKV3jYb7OxFp3Nuj7k8+4LlkFId14e
	h2XudKhUCl8h56GkrqCbGIjWtLggxVl/LifrnOWIA8TwiadZ5cYWrW+xx9wkrCSXrydY8THP92Hqf
	LNyKNZ5BTAmkqK49lUNw9Wtjtjasogn792o1e2dR+edmI7KUc1MWj3AsID8nXA18/GyYBo7L9bs7R
	HQijmuJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT2R8-00000000lNr-1UfV;
	Thu, 25 Jan 2024 16:18:42 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT2R5-00000000lMF-0jAW;
	Thu, 25 Jan 2024 16:18:40 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1rT2Qi-0003de-0p;
	Thu, 25 Jan 2024 16:18:16 +0000
Date: Thu, 25 Jan 2024 16:18:07 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, John Crispin <john@phrozen.org>
Subject: Re: [PATCH net] net: dsa: mt7530: fix 10M/100M speed on MT7988 switch
Message-ID: <ZbKJv84vGXInRIo1@makrotopia.org>
References: <a5b04dfa8256d8302f402545a51ac4c626fdba25.1706071272.git.daniel@makrotopia.org>
 <accda24c-9f12-4cfe-b532-a9c60ec97fca@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <accda24c-9f12-4cfe-b532-a9c60ec97fca@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_081839_251244_BBC5915C 
X-CRM114-Status: GOOD (  12.92  )
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

On Thu, Jan 25, 2024 at 12:49:19PM +0300, Arınç ÜNAL wrote:
> On 24/01/2024 08:17, Daniel Golle wrote:
> > Setup PMCR port register for actual speed and duplex on internally
> > connected PHYs of the MT7988 built-in switch. This fixes links with
> > speeds other than 1000M.
> > 
> > Fixes: ("110c18bfed414 net: dsa: mt7530: introduce driver for MT7988 built-in switch")
> > Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> 
> Acked-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> I'm wondering why we manually set speed and duplex for these interface
> modes in the first place. I don't how it works for
> PHY_INTERFACE_MODE_INTERNAL but, at least for PHY_INTERFACE_MODE_TRGMII and
> 802.3z interfaces, phylink should already supply proper speed and duplex.

It's true that duplex should always be set to full-duplex already by
phylink. However, speed could be 2500MBit/s (2500Base-X) or 2000MBit/s
(?, TRGMII) and we yet need to program the PCR like if it was
1000MBit/s.

Regarding the INTERNAL case: it was added by mistake. In case of
MT7988, all ports of the switch are connected via INTERNAL links,
however, the PHYs still need adjustment of the PCR register just like
on all other MT753x switches and the CPU port is setup elsewhere
anyway.

