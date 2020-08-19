Return-Path: <SRS0=3kTb=B5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D26AC433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 13:13:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0AFC2076E
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 13:13:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0xBDJ9LU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D0AFC2076E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HeZdudhcSaF/EOjSAS7UkojzpV2LKFDMYSUqZ/OaTkM=; b=0xBDJ9LUz0/hSqHQ63y3Qrtfr
	sQ16cnSE5fr+eJ3WedBObuxLYPqvrfTQtC4bfk0PnuPX5l29MMOUwZfsuA0O7rkUg6tPeJISwUeMb
	PSfXn1zY8eNnFDLV3ef8HGS9H1KYVjWTIZEWTu72vHbqWQbSlh8UsGI2BnyX0Bl9TknlY1k/F0Mm5
	mi/0mXHjRT0XV7csFv4klz4oLCJrsJ578w2TpcgaXEJSctKLi1ayUk9QNZOqC0SyTC6rjk/YzKeyB
	oWBZAUpmOwTjL8WE7sQaqxhUfWSKIaEBr0qCytN8IZ7k1VHQVW4z42y1m6ZWYs3S3xTIYsg1qpP3o
	zXBc98UtQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8Nta-00051N-55; Wed, 19 Aug 2020 13:12:50 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8NtX-00050J-G8
 for linux-mediatek@lists.infradead.org; Wed, 19 Aug 2020 13:12:48 +0000
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
 (envelope-from <andrew@lunn.ch>)
 id 1k8NtJ-00A5Kz-Mp; Wed, 19 Aug 2020 15:12:33 +0200
Date: Wed, 19 Aug 2020 15:12:33 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Landen Chao <landen.chao@mediatek.com>
Subject: Re: [PATCH net-next v2 5/7] net: dsa: mt7530: Add the support of
 MT7531 switch
Message-ID: <20200819131233.GA2403519@lunn.ch>
References: <cover.1597729692.git.landen.chao@mediatek.com>
 <e980fda45e0fb478f55e72765643bb641f352c65.1597729692.git.landen.chao@mediatek.com>
 <20200818160901.GF2330298@lunn.ch>
 <1597830248.31846.78.camel@mtksdccf07>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1597830248.31846.78.camel@mtksdccf07>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200819_091247_562007_B6C9070B 
X-CRM114-Status: UNSURE (   8.13  )
X-CRM114-Notice: Please train this message.
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "frank-w@public-files.de" <frank-w@public-files.de>,
 "f.fainelli@gmail.com" <f.fainelli@gmail.com>,
 "dqfext@gmail.com" <dqfext@gmail.com>,
 "vivien.didelot@savoirfairelinux.com" <vivien.didelot@savoirfairelinux.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Sean Wang <Sean.Wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "opensource@vdorst.com" <opensource@vdorst.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "davem@davemloft.net" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> In general, according to phy.rst, RGMII delay should be done by phy, but
> some MoCA product need RGMII delay in MAC. These two requirements
> conflict. Is there any suggestion to solve the conflict?

Implementing the delay in the PHY is just a recommendation, not a
requirement. However, as i said, you need to be careful what is pass
to phylib. If the MAC is implementing "rgmii-id", whatever makes it
way down to phy_attach_direct() needs to be "rgmii". If the MAC
implements "rgmii-rxid", the phy should be implementing "rgmii-txid",
etc. If this is wrong, you get both the MAC and the PHY implementing
delays, and bad things happen.

	Andrew

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
