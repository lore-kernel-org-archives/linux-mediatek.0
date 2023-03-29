Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C0D1C6FD18
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 16:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tWoMYM5phXzU4e6j6m4FzuuaA8OIJOcaPtVysKi+Wi8=; b=jt0RWlZrfpSlFcITMmnZ3UhDr1
	FVxwGuXvQWSbtSDk3PBIKepdxg6fqIwicxp75TtLbgR1NYl/OGz4j3v5osMs87Wg2eY6DhitzEBwj
	s2fZFSLjvGwceeDYDbs2a1bXSr5tNzI7k49S+hz99EqY81I8Dncf/PGLeEzAwEby96VopbJGoCcDQ
	OVVd5Ba6qZmfGCV5DQ2ZK4e3f/Oad/N/6kNjbGRrlXZQYc8/VfrMQlgU7NKerqSUT8u/GSMaM8BEG
	3Yibr9C1EqRzkTr8Gka/Mr4T4NFUabpCFUjFsfxke11wnW6jC3ryitoZDX+4mmdC6kqGZBVjogYTh
	ToBtIx9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phYbA-0015FV-2H;
	Wed, 29 Mar 2023 16:24:32 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phYb7-0015DO-2y;
	Wed, 29 Mar 2023 16:24:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=tWoMYM5phXzU4e6j6m4FzuuaA8OIJOcaPtVysKi+Wi8=; b=rPqbIHYBvr2qKuT39QG9t5A+nh
	LoVA9JPJ+af+lEKf3Li6mLRQwqPkod6xDzzeshmBBlBmvIForigitzR7gUYxDOQ5P1qvuY9Zh8cwk
	7dZxlfaeOErWT8apIofVUuuNZPCnoqFGvQkhS4OyjgWVbMLlVrX/UtUt9vlNsPPJyvzM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1phYaz-008mSg-0a; Wed, 29 Mar 2023 18:24:21 +0200
Date: Wed, 29 Mar 2023 18:24:21 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Daniel Golle <daniel@makrotopia.org>
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
Message-ID: <7eb07ed2-2b1c-44fa-b029-0ecad7872fd2@lunn.ch>
References: <cover.1680105013.git.daniel@makrotopia.org>
 <754322262cd754aee5916954b8e651989b229a09.1680105013.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <754322262cd754aee5916954b8e651989b229a09.1680105013.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_092429_954052_34332EB0 
X-CRM114-Status: UNSURE (   9.91  )
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

Thanks for splitting this patchset up. This is much easier to review.

> +static u32
> +mt7530_mii_read(struct mt7530_priv *priv, u32 reg)
> +{
> +	int ret;
> +	u32 val;
> +
> +	ret = regmap_read(priv->regmap, reg, &val);
> +	if (ret) {
> +		dev_err(priv->dev,
> +			"failed to read mt7530 register\n");
> +		return ret;

This is a u32 function. ret should be negative on error, which is
going to be turned positive in order to return a u32. So you probably
want to make this an int function.

     Andrew


