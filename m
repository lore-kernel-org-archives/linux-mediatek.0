Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 443D6C7EE26
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 May 2023 23:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WX5csrk7AmfC1OJwG3UD0ZOtLhxUh9JVb1PSnJ6cOJU=; b=fNml3wn/EvZ7JvvKFQHpbfaDOz
	8BRrfG6YVNfVVJ5wJBN/+e9FoeEdmksKPEgciWcIcc4toOPFncdkYeSrudPjDb4j+bbe1q2sAhZD+
	0CkApolE9Tk5sUAdcQdC0lc+3b6+vhpW4PACx8yyQqRGhnjrWtxpmOBb/hWG8r7JQbNt793d9l1lV
	YJt73gXukw1MkLtRuyJdCvwk3Y4gXQG+xyOd+pGyv8o8o/9YYoVO6C9HUQlO+JNOU3+AEkspaq/XU
	kT+GOUsEl+y727YqnPg1G4C+FljfnjJnIiN1d3Mdpwni7EZu6OgOeZjzDhfrWypfbY+oVDBQKVNwY
	FVPLhypw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1bZV-00BoCk-1x;
	Tue, 23 May 2023 23:37:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1bZU-00BoC1-0P;
	Tue, 23 May 2023 23:37:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=WX5csrk7AmfC1OJwG3UD0ZOtLhxUh9JVb1PSnJ6cOJU=; b=jSmqeIPVJt4xwEX58woSUeJhak
	ixmgeL1nPmlRFL1KHgprvWBeLYZr1EYf4QhTmsp+/vc9HrlRzbBvNYLM5WKHHXXs5l/GF6NPaBd+L
	lVZ6rc5Q9w/SMGVqru3eCFfp6HVe/Wcgy+nlZ1ZX+iK7qcBpOoDaLpIFFxsghjuP8V6jMr8O3VV2X
	6yTlwDwYTbI5LOa3qzQ/+FjzqN9xvyxyk+/YRvAtd5FF2zrE8jMFQWhXa8evjNH+BdjjoSjWA6IKw
	/bPde1NglyIWaqIIYAALXLxAlvF4W0v2DYCITGBTarAAVKMriVvuskFcyorCku4L2LW+kCq7TYd4h
	8qwec0xA==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1bZP-003eNz-2U;
	Tue, 23 May 2023 23:37:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=WX5csrk7AmfC1OJwG3UD0ZOtLhxUh9JVb1PSnJ6cOJU=; b=cT
	v2yn5MWHm7WnxfZNMDlrSPfdiY7hNyz+pSewTb2MRxfXzkqKRW4U0X96moi6cHDK7LBwhsPyhJy5B
	O4lELn8Z4EKGc7c1AXQAWGH148CtHN5uOhGLdIaf0uA02WtbNTh/ySf5W82wnlHKruYIXiAsyvc60
	dQZ4MoIs3x0Qyz0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1q1bZ7-00Djfb-25; Wed, 24 May 2023 01:37:17 +0200
Date: Wed, 24 May 2023 01:37:17 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: arinc9.unal@gmail.com
Subject: Re: [PATCH net-next 05/30] net: dsa: mt7530: read XTAL value from
 correct register
Message-ID: <4f782e73-6ab3-46d2-bf14-4970332adbbe@lunn.ch>
References: <20230522121532.86610-1-arinc.unal@arinc9.com>
 <20230522121532.86610-6-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230522121532.86610-6-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_003735_966290_11193544 
X-CRM114-Status: GOOD (  10.25  )
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
Cc: linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, mithat.guner@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, erkin.bozoglu@xeront.com, Russell King <linux@armlinux.org.uk>, Richard van Schagen <richard@routerhints.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Richard van Schagen <vschagen@cs.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, May 22, 2023 at 03:15:07PM +0300, arinc9.unal@gmail.com wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> On commit 7ef6f6f8d237 ("net: dsa: mt7530: Add MT7621 TRGMII mode support")
> macros for reading the crystal frequency were added under the MT7530_HWTRAP
> register. However, the value given to the xtal variable on
> mt7530_pad_clk_setup() is read from the MT7530_MHWTRAP register instead.
> 
> Although the document MT7621 Giga Switch Programming Guide v0.3 states that
> the value can be read from both registers, use the register where the
> macros were defined under.
> 
> Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

