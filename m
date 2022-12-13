Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A368C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Dec 2022 11:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wTliCIUA9M4KMvDQxTYvjOzNAyuBpTA7+qAEQcAV1xI=; b=Rfxi15wvuyab4S7bxjm7fgCuo6
	vxrIbvAhyYFAsI2Jrjkv21vdezE6JNMgKqSrXk7DgNpwDUJydS0Es7ocFqGJOMMpS1HQTOn6mNGo7
	osHT7WNonLgSCbq6DFqEvRxzsojjmU5ypMUdK0hBIxrOcCyu1gSvFRB/1fXFiA7X5tQCaJfxPXPG3
	LPzGaqPIRB51MUUMapbaIIdm0EqCl197ZDQZLQNcz+aYvIWJXLHQQeZYM7t5OOLd8V76wCT44JhMA
	EvyWq/3S+rEddTr/saa5E/ibwDP4/V1sy7ONwFrlHM0jYKJcNF+z1/LaGFdS+ISvugSR7Jq5WxJK8
	DgWDrueA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p53WT-00GPTC-NW; Tue, 13 Dec 2022 11:32:33 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p53WD-00GOZa-1V; Tue, 13 Dec 2022 11:32:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=wTliCIUA9M4KMvDQxTYvjOzNAyuBpTA7+qAEQcAV1xI=; b=yBbX9KeHOK1dP/0r7d76dtnU09
	Hct8B4/7K5EmLby6RB+zLXIDLMfxHhN4sIqorfJIpLRphopq6zhiowh+A5HU0dGzIfH//05HIunk+
	Q0vEvqhQhZhWX7usY+r8e2DThKeYE2jgxDGWTTOgOzY2trb5F/XXayHpY7B9jG2lAn1r2CYt3mD7t
	qTVPZaUENJf7w2lx23oKAraG1Qsi3/bLnSyIGQgUwfXFzPYpRuvcEAzLjjgc9zvAxkAs0FgG7cuFi
	/xW8uzJX/nUR3d57COVb6HpefsoSmb5glbtpAcVhqgMd6LfzcIeF+00OLIaiAFgHE7IBboszUzoqd
	4dGCneaw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35688)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1p53U5-0006lw-Vq; Tue, 13 Dec 2022 11:30:06 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1p53U0-0006PO-5A; Tue, 13 Dec 2022 11:30:00 +0000
Date: Tue, 13 Dec 2022 11:30:00 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH net-next] net: dsa: mt7530: remove reduntant assignment
Message-ID: <Y5hiOBaSDsx5RsmV@shell.armlinux.org.uk>
References: <Y5b/Tm4GwPGzd9sR@shell.armlinux.org.uk>
 <Y5f6h8q7rlnk1jnD@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y5f6h8q7rlnk1jnD@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221213_033217_101515_9DA1E58E 
X-CRM114-Status: UNSURE (   9.08  )
X-CRM114-Notice: Please train this message.
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

On Tue, Dec 13, 2022 at 04:07:35AM +0000, Daniel Golle wrote:
> Russell King correctly pointed out that the MAC_2500FD capability is
> already added for port 5 (if not in RGMII mode) and port 6 (which only
> supports SGMII) by mt7531_mac_port_get_caps. Remove the reduntant
> setting of this capability flag which was added by a previous commit.
> 
> Fixes: e19de30d20 ("net: dsa: mt7530: add support for in-band link status")
> Reported-by: Russell King <linux@armlinux.org.uk>

Please update the name and email address as per my reviewed-by below
(the "(Oracle)" bit is important since I now work for Oracle.)

> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

