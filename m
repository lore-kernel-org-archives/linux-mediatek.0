Return-Path: <SRS0=gVFe=CX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A92EC433E2
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 23:32:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B27E20735
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 23:32:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uJhuuc+g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B27E20735
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=davemloft.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:From:Subject:To:
	Message-Id:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sK4SQFMMnIdBAg2dayxdD5PBFjZJrLflqeYz2nhhqdo=; b=uJhuuc+gjsAz0wPC3x/SbMnRK
	iaiNMR7D16ElDSg+vJwKBfB2uBzvpNJQkgElI+kX+UGSHQL1qUmC4sq3Ig/Uy6EnDPvAeYeVD76QB
	EOWoTm4Jmc0+2L7c5yXzD+HuR1gLz4OxlSyLn5koS0uZtsEKcKZh0dp0AdH9D5g/NmjVX5Wpb2pD5
	G4dcxOhpW+LDe14kkSa4ob9SptPo/LZhXQy4Bxc89Si8x4Oz36kfg/lUkE+CS8i2kjXqF2IC3HqA+
	azxmeDSnFvilSumS0om84He3eKqZ5647d7Yihn7qyuGLO/VQ+BaH0TazlNVjh2Q0Pwa8xiIl5xH0k
	XYRlR+Zuw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHxxj-0002Fw-Q9; Mon, 14 Sep 2020 23:32:43 +0000
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHxxf-0002EU-SG; Mon, 14 Sep 2020 23:32:40 +0000
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id F0592128B2345;
 Mon, 14 Sep 2020 16:15:44 -0700 (PDT)
Date: Mon, 14 Sep 2020 16:32:28 -0700 (PDT)
Message-Id: <20200914.163228.1898649357949030454.davem@davemloft.net>
To: landen.chao@mediatek.com
Subject: Re: [PATCH net-next v5 0/6] net-next: dsa: mt7530: add support for
 MT7531
From: David Miller <davem@davemloft.net>
In-Reply-To: <cover.1599829696.git.landen.chao@mediatek.com>
References: <cover.1599829696.git.landen.chao@mediatek.com>
X-Mailer: Mew version 6.8 on Emacs 27.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [2620:137:e000::1:9]);
 Mon, 14 Sep 2020 16:15:45 -0700 (PDT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200914_193240_159562_78CDA93E 
X-CRM114-Status: GOOD (  16.06  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: andrew@lunn.ch, frank-w@public-files.de, f.fainelli@gmail.com,
 dqfext@gmail.com, devicetree@vger.kernel.org, netdev@vger.kernel.org,
 sean.wang@mediatek.com, linux@armlinux.org.uk, linux-kernel@vger.kernel.org,
 opensource@vdorst.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 p.zabel@pengutronix.de, matthias.bgg@gmail.com, kuba@kernel.org,
 vivien.didelot@gmail.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Landen Chao <landen.chao@mediatek.com>
Date: Fri, 11 Sep 2020 21:48:50 +0800

> This patch series adds support for MT7531.
> 
> MT7531 is the next generation of MT7530 which could be found on Mediatek
> router platforms such as MT7622 or MT7629.
> 
> It is also a 7-ports switch with 5 giga embedded phys, 2 cpu ports, and
> the same MAC logic of MT7530. Cpu port 6 only supports SGMII interface.
> Cpu port 5 supports either RGMII or SGMII in different HW SKU, but cannot
> be muxed to PHY of port 0/4 like mt7530. Due to support for SGMII
> interface, pll, and pad setting are different from MT7530.
> 
> MT7531 SGMII interface can be configured in following mode:
> - 'SGMII AN mode' with in-band negotiation capability
>     which is compatible with PHY_INTERFACE_MODE_SGMII.
> - 'SGMII force mode' without in-band negotiation
>     which is compatible with 10B/8B encoding of
>     PHY_INTERFACE_MODE_1000BASEX with fixed full-duplex and fixed pause.
> - 2.5 times faster clocked 'SGMII force mode' without in-band negotiation
>     which is compatible with 10B/8B encoding of
>     PHY_INTERFACE_MODE_2500BASEX with fixed full-duplex and fixed pause.
 ...

Series applied, thank you.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
