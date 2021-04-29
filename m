Return-Path: <SRS0=2Vnt=J2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73722C433ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Apr 2021 21:31:02 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E0306113D
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Apr 2021 21:31:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E0306113D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5xYmLAWHU/HSHLajufQZIiyWbgmH8Oz7ADPrhQnn6d0=; b=mx4EY68geKu0RTB0OSBJBXpf8
	H+AmW2VQoNLRa4C5ZQBwHw1dNpGDHgxkck+GRb05NerlCE925kPeyZuXFMwLWn40qg/4fxJwTR6f8
	gG9LNEu9XrBWw0SViYWVjq4RRORHbcWBsHCMDmQzTADZYcgmuW9LEbetIB/hiB1akidhuoVY+sDet
	6iPYFruWGNI8/ZhbOHBgtjNQlCuoAps8zJU/G9uVsh1RI1iy/ijFbRUk3Xn8mrIM6GUmgedKFnqGx
	eZYwcYVsfSu9tfrS5W17bPqXKDwAwjRMc7NpBft6bh8I5zydBXXkgRJOMZ2IyF/GUsh67QxR3boyZ
	NyFueyvCw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcEFG-006ZZG-DB; Thu, 29 Apr 2021 21:30:50 +0000
Received: from [2607:7c80:54:e::133] (helo=bombadil.infradead.org)
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcEFD-006ZXq-MI
 for linux-mediatek@desiato.infradead.org; Thu, 29 Apr 2021 21:30:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=pnbY1T4/HxGLo6q4HkM9vWKaup9mO6zy3OGJNCaPhEA=; b=WoBZ6jMzgvYEX2uDSdfCd5dmsg
 3bGeHllvGceXJmRPxVbOTIIQvyzSq+LzCoD9K7VFi8RZXEePMw+84F+Yga32QvmYPojoPPUsHsLW3
 VELe1sve1n3fUMfCH8Qa8kna2fZN7FCQcZ2mYZjfl+IpMEm6YnPp3PVH/9R+2XHfSyBPV3fvpoLig
 vp6zIErQNX/osSKVIva+/QEqApscnZeI70kFHAisqJFNV46Hfa8xO2Wmh7GReIFnGt/6F6rJlOiRk
 4V77GaFLZtKnOGOpg0rQf0k1zWT/FHih4Geb8K4cWUkkwSLvwQswo4y6mMwG9uay0mmflKGK8i0Fu
 mN7jwaSQ==;
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcEF1-000z5f-BX
 for linux-mediatek@lists.infradead.org; Thu, 29 Apr 2021 21:30:36 +0000
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
 (envelope-from <andrew@lunn.ch>)
 id 1lcEEy-001iMK-1T; Thu, 29 Apr 2021 23:30:32 +0200
Date: Thu, 29 Apr 2021 23:30:32 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: DENG Qingfang <dqfext@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Landen Chao <Landen.Chao@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Sean Wang <sean.wang@mediatek.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-staging@lists.linux.dev, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, Weijie Gao <weijie.gao@mediatek.com>,
 Chuanhong Guo <gch981213@gmail.com>,
 =?iso-8859-1?Q?Ren=E9?= van Dorst <opensource@vdorst.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH net-next 3/4] dt-bindings: net: dsa: add MT7530 interrupt
 controller binding
Message-ID: <YIsleJ8K/vad3vFE@lunn.ch>
References: <20210429062130.29403-1-dqfext@gmail.com>
 <20210429062130.29403-4-dqfext@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210429062130.29403-4-dqfext@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_143035_416492_5D3B2DC2 
X-CRM114-Status: UNSURE (   6.68  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Apr 29, 2021 at 02:21:29PM +0800, DENG Qingfang wrote:
> Add device tree binding to support MT7530 interrupt controller.
> 
> Signed-off-by: DENG Qingfang <dqfext@gmail.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
