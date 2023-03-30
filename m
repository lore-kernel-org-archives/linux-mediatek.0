Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F3D2C77B60
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Mar 2023 21:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lMp61I6nnYCDEVTryFqXMfC3xUsfgzVMhW14vZcUeTo=; b=UKnuJk4rTTvhzsFvimK0PB4RJY
	Vgaz3Ul333ZOkE8X40UEGjpZSfTE7MyHcw5xX7XOXBcBYEwipvgY70JWFDewQ9ft5ENRmw9+Je+7o
	7N+MYcLlZwu2TzAs/v3rxMucowJCx+GVgeWxhXbSwVsQQCcZ6gRCbCDDcmENVjpv4zz+AF4bQXAxW
	s8KS7XkD25zQGjXW44fiwuFbrXT8Afw/kBKM2e8BaQMBS8TGlXGCkKgku8nvLosyqVe0Ce3jdczyT
	/uBmN7AQOMY32TmcahM7hPeAFYBNDfrHKPZNNW5DjInz3sjvN+DOL3GPRXiZIkIFBUpQ7VWEm03ps
	ZjtoCZyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phzOh-0054RV-01;
	Thu, 30 Mar 2023 21:01:27 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phzOe-0054Py-0i;
	Thu, 30 Mar 2023 21:01:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=lMp61I6nnYCDEVTryFqXMfC3xUsfgzVMhW14vZcUeTo=; b=5hJGKmB++WKbWKb4b7wKOPwYMw
	SSntxZtt94BmTdNoAN3rlCqUeEYwgTgVlU+5q2KyDzB9S8ObBKDRhINkRRNQogpDnC+Chp7cGH0g4
	MRa5i0TzIXkxzgWwWEVftPhlR2XjtY32AKpaqsqxicTVPurd3MAhPlnZQed9SKQmMrVc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1phzOc-008vxb-IH; Thu, 30 Mar 2023 23:01:22 +0200
Date: Thu, 30 Mar 2023 23:01:22 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux@armlinux.org.uk,
	linux-kernel@vger.kernel.org,
	=?utf-8?B?QXLEsW7DpyDDnG5hbA==?= <arinc.unal@arinc9.com>,
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
Subject: Re: [PATCH net-next 03/15] net: dsa: mt7530: use unlocked regmap
 accessors
Message-ID: <ae1dda78-0cec-4f64-aa66-252605839918@lunn.ch>
References: <cover.1680180959.git.daniel@makrotopia.org>
 <4fcca663d13c38679b615d4a1a76bf5d5d885304.1680180959.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4fcca663d13c38679b615d4a1a76bf5d5d885304.1680180959.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_140124_300142_3CBFB455 
X-CRM114-Status: GOOD (  10.54  )
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

On Thu, Mar 30, 2023 at 04:20:05PM +0100, Daniel Golle wrote:
> Instead of wrapping the locked register accessor functions, use the
> unlocked variants and add locking wrapper functions to let regmap
> handle the locking.
> 
> This is a preparation towards being able to always use regmap to
> access switch registers instead of open-coded accessor functions.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

