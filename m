Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B731D16268
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Oct 2024 14:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zzV0POEfsxpQFudwXMex/Qq8ERcOm2RINXdYeXPqIGg=; b=3eisbXEDuEuPrehxpxkPVp49mQ
	AygGqokF2tzxn7bRhqB+qei14FNF3EA/4fiWHH+IgI/MfRKg5+MovTLHvccuT9lNYN9I1rlpe+Eqs
	1DemW754AFJagGdBy+tRF9SH4tC7ZopCCzlCWxRFqC8S+bd5ybTO1tY3WuSLtkSfD0rLjw+G/w5Uq
	jRT8QhnAQwl1dFoxqHCVi1wu5rS8Rn5VBsDSlqVZqGhryisqTjreEai6eN8npmuwpNzmJyxOJeX+d
	yWG0wHUQuC/FZ97LAkkyxRNU29TgV+VNeWdzRu9EW7BRX+YYzsYHmR0vcDSFJIKgdu33IbudyGRG6
	gET4rxXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0Ld4-00000005P84-46QC;
	Mon, 14 Oct 2024 14:00:58 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0LG2-00000005Jdt-0tdL;
	Mon, 14 Oct 2024 13:37:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=zzV0POEfsxpQFudwXMex/Qq8ERcOm2RINXdYeXPqIGg=; b=qZ1uS9e0IebaN6hZQdkIXlHEhi
	aCmmpdZVv4N7+W77Vonq5ez7l2k60srRRXGxMdYCS53CAS6057tRK+q6fxbo53qi9BcqyWO/4KlS8
	+1A31ztI2WwvWW8m0U+0rylWD8eg2sm4ojH+K6mUHwrwH3ce4gLK4DUmvEdL8PZHsIf0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1t0LFn-009ven-5N; Mon, 14 Oct 2024 15:36:55 +0200
Date: Mon, 14 Oct 2024 15:36:55 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Sky Huang <SkyLake.Huang@mediatek.com>,
	Gerhard Engleder <gerhard@engleder-embedded.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Steven Liu <Steven.Liu@mediatek.com>
Subject: Re: [RFC PATCH net-next 1/1] net: phy: Add capability to
 enable/disable 2.5G/5G/10G AN in ethtool
Message-ID: <1c55b353-ddaf-48f2-985c-5cb67bd5cb0c@lunn.ch>
References: <20241014060603.29878-1-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241014060603.29878-1-SkyLake.Huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_063710_275361_6D12A8DB 
X-CRM114-Status: UNSURE (   8.91  )
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

On Mon, Oct 14, 2024 at 02:06:03PM +0800, Sky Huang wrote:
> From: "SkyLake.Huang" <skylake.huang@mediatek.com>
> 
> For phy loopback test, we need to disable AN. In this way,
> users can disable/enable phy AN more conveniently.

Please take a look at:

https://lore.kernel.org/netdev/20241013202430.93851-1-gerhard@engleder-embedded.com/T/

We need a good understanding of how 802.3 expects loopback to be used,
and a commit message based on what 802.3 says. Our current
understanding is that 1G and above requires auto-neg for correct
operation, so we don't want to allow autoneg to be disabled in normal
operation. It could be we need to special case loopback somehow.

	Andrew

