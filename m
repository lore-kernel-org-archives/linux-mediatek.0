Return-Path: <SRS0=r4MK=J3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C852DC43460
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Apr 2021 16:35:21 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9103E61449
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Apr 2021 16:35:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9103E61449
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9PJcMswSvNKhKtffjTLLkR89D+Lg5QG+M5PyW83k/4A=; b=QdP1CSg1i5zRNkscn5b0j6h2I
	LEy6XdgUon7kpkbNWlTsPk3v1vLerPfzOp/rOAL9nyT9H8WbzxYtHI2Ko0jjARtsfN9sNjjDVL/xB
	P3sgRsVCpDiVaFAJ9cj0BKHkn8Mbytmq88ifo1VF/ezriqhe16pOZKNIqAsPnB+c12+xTrHa+4wGN
	1KPDNYw4y1mL4m+UOhemmOFwQ3B9IEjklPtbTSSqfbItw2qMiZ4UJE0yifaQOiotWRKQ2rKyWdze1
	o7xqX5LTXoLmxon+ufci0Qz5dZUvVxS0xYDhm+n4dJyIjyI8nuWzhHdmMGLnvFkd7FyinEUOWD63X
	Pqw7C7KBA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcW6f-008Cd2-6d; Fri, 30 Apr 2021 16:35:09 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcW6R-008CaQ-LQ
 for linux-mediatek@desiato.infradead.org; Fri, 30 Apr 2021 16:34:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=EyxuFs0lxLvebXKyk1zLZelkWEzekkVKq8fhA2+VSU4=; b=k6TNIlnMNqER64RRYL761f6ju5
 /r9820uEAanIK6xWvg3PxME5k5lf2pMv48r10sYu9TyMbFeZTRJCFIrQ1pvvKR7sDa4/ZW8o6hpq3
 kNwayJtxdJ13/aWbETmZMVBWbdECWHU5PmF68rHvXasQxHhcdz4u2ZppLv59JGGu9SVNaBYUAaJIC
 /izA+fiEfQA22wqEo8uHAv+9CgBXMF/9aZ05C9GExTqVc0AkSPzQ8IC36UBOXVAqBAaaFFTmD8Zo+
 g9imr7/QhQlK8BV81HsFNbR95zpG7P22FlFuMEA6qaxB0RIyqvEq0JezPcub+YQT3oUQFpENRdgQA
 Vt7HM9zw==;
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcW6O-001WWJ-Vv
 for linux-mediatek@lists.infradead.org; Fri, 30 Apr 2021 16:34:54 +0000
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
 (envelope-from <andrew@lunn.ch>)
 id 1lcW6H-001pzm-9A; Fri, 30 Apr 2021 18:34:45 +0200
Date: Fri, 30 Apr 2021 18:34:45 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: DENG Qingfang <dqfext@gmail.com>, David Miller <davem@davemloft.net>,
 f.fainelli@gmail.com, hkallweit1@gmail.com, kuba@kernel.org,
 Landen.Chao@mediatek.com, matthias.bgg@gmail.com,
 linux@armlinux.org.uk, sean.wang@mediatek.com,
 vivien.didelot@gmail.com, olteanv@gmail.com, robh+dt@kernel.org,
 linus.walleij@linaro.org, gregkh@linuxfoundation.org,
 sergio.paracuellos@gmail.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-staging@lists.linux.dev,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 weijie.gao@mediatek.com, gch981213@gmail.com, opensource@vdorst.com,
 tglx@linutronix.de, maz@kernel.org
Subject: Re: Re: Re: Re: [PATCH net-next 0/4] MT7530 interrupt support
Message-ID: <YIwxpYD1jnFMPQz+@lunn.ch>
References: <20210429062130.29403-1-dqfext@gmail.com>
 <20210429.170815.956010543291313915.davem@davemloft.net>
 <20210430023839.246447-1-dqfext@gmail.com>
 <YIv28APpOP9tnuO+@lunn.ch>
 <trinity-843c99ce-952a-434e-95e4-4ece3ba6b9bd-1619786236765@3c-app-gmx-bap03>
 <YIv7w8Wy81fmU5A+@lunn.ch>
 <trinity-611ff023-c337-4148-a215-98fd5604eac2-1619787382934@3c-app-gmx-bap03>
 <YIwCliT5NZT713WD@lunn.ch>
 <trinity-c45bbeec-5b7c-43a2-8e86-7cb22ad61558-1619794787680@3c-app-gmx-bap03>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <trinity-c45bbeec-5b7c-43a2-8e86-7cb22ad61558-1619794787680@3c-app-gmx-bap03>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210430_093453_046386_CD098938 
X-CRM114-Status: GOOD (  13.60  )
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

> mhm, maybe the naming should differ if generic phy and net-phy are
> that different. i guess there is no way to merge the net phys to the
> generic phys (due to linking to the net device drivers) to have only
> 1 phy section, right?

phys and generic PHYs are very different things, completely different
API etc. They cannot be merged.

> but if phy- prefix is used by generic phys, maybe eth- or net- can be used here (maybe with "phy" added)
> 
> something like
> 
> eth-phy-mt753x.ko
> 
> else i have no idea now...my patch renaming the musb-module seems not
> to be accepted due to possible breakage

The usb module has been around for a long time, so it cannot be
changed. The phy driver is new, not in a released kernel. So we can
still rename it without causing problems.

I still want to understand the naming here. If you look at most
Ethernet switches with integrated PHYs, the PHYs have their own naming
scheme, separate from the switch, because they are independent IP. So
i would prefer this driver by named after the PHY name, not the switch
name. That might solve the naming conflict, mt123x for the PHY, mt7530
for the switch driver.

	Andrew

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
