Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCCB9C77B60
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Mar 2023 20:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3vbaf0keAp91AneRI9+v6TuM7naESDJigOzNez1BLh4=; b=f/sYMWUB/UufMLHhb5D1cxQufO
	F+YNrfGEteq3UjyAILuJ1d47Mz5q2bHKQ7Di3JjP1PrJyCI7oBRc7TPcDmLIwv8rdAdfjoPIQduXe
	hkFNZZReGSPcs7DYL6XDvjiLp/FCGqvZHg9y2lhp6XtzK7A+Aied2jgAmBltc5lS0lAwi78f+KLY1
	uZSGCT+qSG/FPzLp8Z0XQhCy/rDBgLiHe/LcXKQg/JiI+JRTEx8NQk2dV4kYo70xHp2o7UWdA9yW+
	cGE/PjnriaDwUt6uFqU9dJ8y+31/wf98MCTEz+R0GlzYS+QvFav04zbAmJC2LGKYE2upvn3dlt65T
	/764+W7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phzMX-00544p-1z;
	Thu, 30 Mar 2023 20:59:13 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phzMV-005448-1P;
	Thu, 30 Mar 2023 20:59:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=3vbaf0keAp91AneRI9+v6TuM7naESDJigOzNez1BLh4=; b=12sbs9rCBmQ6qze6isqfIqYC9m
	wfjNBo7Obt9rvgzJFqzXvg1WNQCmA0SlpkgPFd95+8SAl4Y+WvEiYg+NL1ezxc0XTzEqM4w/yf414
	/A2XppiZsw9hChxsy+jNVa7tqPepWX61IW8ixRJj27qzMfEWM2JJW0yhS8v9OeDsAAgc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1phzMT-008vvj-SI; Thu, 30 Mar 2023 22:59:09 +0200
Date: Thu, 30 Mar 2023 22:59:09 +0200
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
Subject: Re: [PATCH net-next 02/15] net: dsa: mt7530: refactor SGMII PCS
 creation
Message-ID: <02864319-bb70-4b5a-9651-4e012cd53137@lunn.ch>
References: <cover.1680180959.git.daniel@makrotopia.org>
 <a79a93ce887b792b9cfb4ef572f5eb0636e76e6e.1680180959.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a79a93ce887b792b9cfb4ef572f5eb0636e76e6e.1680180959.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_135911_472945_674F4C69 
X-CRM114-Status: UNSURE (   9.68  )
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

On Thu, Mar 30, 2023 at 04:19:41PM +0100, Daniel Golle wrote:
> Instead of macro templates use a dedidated function and allocated
> regmap_config when creating the regmaps for the pcs-mtk-lynxi
> instances.
> This is in preparation to switching to use unlocked regmap accessors
> and have regmap's locking API handle locking for us.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

