Return-Path: <SRS0=2Vnt=J2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E79EAC433ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Apr 2021 21:30:25 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BF4F6144B
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Apr 2021 21:30:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7BF4F6144B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=41JnFaQMd14bxFt5o/kPQNT/3O0/cTrIgnwPo67XQ5Y=; b=LNhM/lz8nvHRKBz5imnEJ4MRJ
	EI+y/aYCIILSaCH4N/6lpBl8GlgboSVGWcrNS6FZnz3TvTLprer1Ya3h03aoFzYXqqaMkmbRaakHE
	MSr6km8yqOIyFhmip0/QhAynymTXCaQwTxbBfYLK2Hqf1yB4E6f5Z+vW4I5e7xDH5f3OcvMuirZuT
	CWWlx/rQKRPRY4YaDGHdTZSLcIlSkhlHpRO1qoebu1ch0F40Pp2It5yJwLw0m1oqvCvPOJtGi74xM
	/EPU4Cek+zoEmlYI9RXXXTBFlR/M8etHFtGKNHhJywLDNszxalGZkwZRcUuicQtUqbIkBt7QYrfVs
	yT6R57TBQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcEEi-006ZW1-2X; Thu, 29 Apr 2021 21:30:16 +0000
Received: from [2607:7c80:54:e::133] (helo=bombadil.infradead.org)
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcEEg-006ZUx-43
 for linux-mediatek@desiato.infradead.org; Thu, 29 Apr 2021 21:30:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=qGQfEFP231i9ROHoLVnyAa2tGDkFvZ56wMiqWna8lnI=; b=GYuMJR3Qo6BPQ+e11T3Kr+6VkP
 MnPJEvLU9MJgvIjn42N+kW0HJwj4wKgKzT4/WPFQN/6BVaAA/fmRHBWSIddPPT8SrKPBL0VQ2+nTt
 CMVlTOrHQtygtivQLlu1KT00YJVzC76qd4M898UiXlc8ACZGUrMdLgpHS86zaYmvzU9R25+mhzjAP
 8FaYwwKBD82j+5hidSZClOsUJK1Nbt3oG3DOj3S0ox9pS9vAJrBywCzm9mgh+13IdjrH1TVf9ex6+
 189Aa6DKKSD58NIoyeiMeNePAI8Gs6evUFFkEzuE+LHhe6ESy+G7T6a8fWoPy9XyXkr4gqr5Zu+L0
 55/L7JMg==;
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcEET-000z3B-Nq
 for linux-mediatek@lists.infradead.org; Thu, 29 Apr 2021 21:30:02 +0000
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
 (envelope-from <andrew@lunn.ch>)
 id 1lcEEQ-001iLp-4X; Thu, 29 Apr 2021 23:29:58 +0200
Date: Thu, 29 Apr 2021 23:29:58 +0200
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
Subject: Re: [PATCH net-next 2/4] net: dsa: mt7530: add interrupt support
Message-ID: <YIslVil/EmynAUxa@lunn.ch>
References: <20210429062130.29403-1-dqfext@gmail.com>
 <20210429062130.29403-3-dqfext@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210429062130.29403-3-dqfext@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_143001_794794_DF0F833B 
X-CRM114-Status: UNSURE (   8.77  )
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

On Thu, Apr 29, 2021 at 02:21:28PM +0800, DENG Qingfang wrote:
> Add support for MT7530 interrupt controller to handle internal PHYs.
> In order to assign an IRQ number to each PHY, the registration of MDIO bus
> is also done in this driver.
> 
> Signed-off-by: DENG Qingfang <dqfext@gmail.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
