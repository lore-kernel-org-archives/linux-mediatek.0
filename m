Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14B37C6FD18
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 18:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cy2q+ft8CWmc/ApbDiy2CQxwBS77iZbrmWNYZinhU4Q=; b=sWJg7Vv6quIN0jWAD4mxTvmJwa
	LnI1sUaNk7IH3OUvwr+gD0+jZl80iKWhuZBi+51OeafqznOCi+j73+Q/RdCgs0xiHvx9IFfMhazJ8
	sholN+wFqbWa8HbZMoJmZHl74kq2rSwdYclAaiKOl2bPwyi9T2lGvoEblI3jrbAr47EaXoAhTnToN
	PhXcuZecGAHIJCVUhZ7ecTL3+Twd93WjukdKotM5jaejCrf/sjU90fupGLBXn0aUIcwAYrH7r3e+D
	EOh98H4/BYQcjZcgycOVF/cNM3rRHFw1I5KjCRFUzR+Vcr69LB5wGyTCz9j9nIFa+jPQpOel2gaiS
	FLY8N31Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phac5-001Tig-2v;
	Wed, 29 Mar 2023 18:33:37 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phac3-001Th4-0F;
	Wed, 29 Mar 2023 18:33:36 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1phabr-0005LO-05;
	Wed, 29 Mar 2023 20:33:23 +0200
Date: Wed, 29 Mar 2023 19:33:17 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sam Shih <Sam.Shih@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>
Subject: Re: [RFC PATCH net-next v3 03/15] net: dsa: mt7530: use regmap to
 access switch register space
Message-ID: <ZCSEbUt9kj8Ta6Yc@makrotopia.org>
References: <cover.1680105013.git.daniel@makrotopia.org>
 <754322262cd754aee5916954b8e651989b229a09.1680105013.git.daniel@makrotopia.org>
 <7eb07ed2-2b1c-44fa-b029-0ecad7872fd2@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7eb07ed2-2b1c-44fa-b029-0ecad7872fd2@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_113335_109121_80F299C5 
X-CRM114-Status: GOOD (  15.02  )
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

On Wed, Mar 29, 2023 at 06:24:21PM +0200, Andrew Lunn wrote:
> Thanks for splitting this patchset up. This is much easier to review.
> 
> > +static u32
> > +mt7530_mii_read(struct mt7530_priv *priv, u32 reg)
> > +{
> > +	int ret;
> > +	u32 val;
> > +
> > +	ret = regmap_read(priv->regmap, reg, &val);
> > +	if (ret) {
> > +		dev_err(priv->dev,
> > +			"failed to read mt7530 register\n");
> > +		return ret;
> 
> This is a u32 function. ret should be negative on error, which is
> going to be turned positive in order to return a u32. So you probably
> want to make this an int function.

This is a pre-existing flaw in the code. As we are accessing 32-bit
registers there has just never been any meaningful error handling.
I guess the correct solution would be to not use the return value only
to indicate success or error, and use an additional u32* parameter for
the read value.

However, I was hestitating to convert all the calls (they are many) to
follow that improved paradigm.

Should I?

