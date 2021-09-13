Return-Path: <SRS0=5OX0=OD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE633C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Sep 2021 13:11:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7041D60F44
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Sep 2021 13:11:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7041D60F44
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wu50Yq2w1iUmBw5QiZxRnY2qm2UWZ4W9c4ctCXdrNFI=; b=EYJRByxreSXxWh
	mLsSeyK8h5kamkT5gmDb/TZhh81JRYqg85BncKL4QKYJQwQGgkGThYEbS7gNhUTGSBKh2Sq8ZJoDO
	w+IIHR0KNRWzlH25gAggAVtYtM2pL22dPABYYQ/uNFVgvXPucE2J9p/6lS2kTjFkZQPCsuy9rmaUz
	HghX0EQ+/uysvcpXrkiY+gKDlF4uysh5pc/4FLr7G/H90Q4oHjURaecUeekPNm4enXOAnJe2UGG4q
	DMm24kOasllSn1R1zKc7XqOgQ86ZkrpgyeYsy3O+jyQHfS2BQEQVf5j9lSblecWBS8sLMyRif+vbi
	ECKxteg6ho3wCW4PZjhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPlk6-001jHx-S0; Mon, 13 Sep 2021 13:11:26 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPljp-001jFK-KC; Mon, 13 Sep 2021 13:11:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=lhuklNqPbPBlUpzBlVfCCXYDNgKobxlQ6GFS6KR2OQ8=; b=VFE3T67fTCAfX+NiJZ6mngYyhG
 dgz/2pCeI3+dhERc0MFab+ofX3E9hBzzSbq7oI5hciXQ5+0Qih5eN/Q+TRDAzaP7FMGgtFLWStLQ8
 pVrXAPEfwoyDDps6r/XhkAHRDr9f3gIIPe0HOhKOJqVyuEDPFGPIrNwMuXK3MD6o3Iro=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1mPljD-006Ozw-Is; Mon, 13 Sep 2021 15:10:31 +0200
Date: Mon, 13 Sep 2021 15:10:31 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: netdev@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Kurt Kanzenbach <kurt@linutronix.de>, Hauke Mehrtens <hauke@hauke-m.de>,
 Woojung Huh <woojung.huh@microchip.com>,
 UNGLinuxDriver@microchip.com, Sean Wang <sean.wang@mediatek.com>,
 Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 George McCollister <george.mccollister@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Oleksij Rempel <linux@rempel-privat.de>,
 Michael Grzeschik <m.grzeschik@pengutronix.de>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Lino Sanfilippo <LinoSanfilippo@gmx.de>
Subject: Re: [RFC PATCH net 1/5] net: mdio: introduce a shutdown method to
 mdio device drivers
Message-ID: <YT9Nx9hvSnRYmJ4Q@lunn.ch>
References: <20210912120932.993440-1-vladimir.oltean@nxp.com>
 <20210912120932.993440-2-vladimir.oltean@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210912120932.993440-2-vladimir.oltean@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210913_061109_703809_8E1C2B7E 
X-CRM114-Status: GOOD (  13.18  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Sep 12, 2021 at 03:09:28PM +0300, Vladimir Oltean wrote:
> MDIO-attached devices might have interrupts and other things that might
> need quiesced when we kexec into a new kernel. Things are even more
> creepy when those interrupt lines are shared, and in that case it is
> absolutely mandatory to disable all interrupt sources.
> 
> Moreover, MDIO devices might be DSA switches, and DSA needs its own
> shutdown method to unlink from the DSA master, which is a new
> requirement that appeared after commit 2f1e8ea726e9 ("net: dsa: link
> interfaces with the DSA master to get rid of lockdep warnings").
> 
> So introduce a ->shutdown method in the MDIO device driver structure.
> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
