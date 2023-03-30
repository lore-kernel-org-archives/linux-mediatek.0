Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89FECC77B60
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Mar 2023 21:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P4o/Cj1xJY/GvgxgLFSwpwnxIiEruRDJKJu5rzeHPS8=; b=kQEIEU2xam+ecvaGCg5jqSk2e/
	hu0G2WYga9P6qnNS2KzfYKhw0UGYxPxP+w4V18OjxdDMYDvEdNl7/NdYtVfK9HVrWJtWBc+zXl8Al
	Vn+8RW5Z0/0sRZqZxSvLA17uESDazpCRDJnfQdbCOH9/1z3s8l+dgBGb5uloS+IC/M33AmqISY0hW
	twG6TBmGEp/EEHrrACvUxFJTVUbhP8tCTlUUneWIfi+GF5ud2dCWYDc0VvMzJamM2byCXUzShsRCs
	7PqPQ9c4TyPbrNTF9lL2zKXCncmwSXk5u4js6telS/iVo83V9fft9yzC8w7EwpaNimcZ9MyLVXuoA
	02KEqIhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phzR4-00559X-1v;
	Thu, 30 Mar 2023 21:03:54 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phzR2-00558P-1G;
	Thu, 30 Mar 2023 21:03:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=P4o/Cj1xJY/GvgxgLFSwpwnxIiEruRDJKJu5rzeHPS8=; b=ZOYNoZH7cE6S22POgLgRlpTAPp
	4lS5hqJOgTgsqI1yHj/QvUZbFCTHP5RtrT2sGH/yB+Le2IM1AaiZfYO+JYKmjPWZM60ULOqyPV2bq
	/BVJB3x3QB+DlVbLndnlMw4pG8/egWPYzJOP0Fgsvo0sx+vTpReOQzmgibzliC61nx/0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1phzQz-008w0S-63; Thu, 30 Mar 2023 23:03:49 +0200
Date: Thu, 30 Mar 2023 23:03:49 +0200
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
Subject: Re: [PATCH net-next 14/15] net: dsa: mt7530: introduce driver for
 MT7988 built-in switch
Message-ID: <b8db273d-27b5-4d05-b128-3d53ecc5f139@lunn.ch>
References: <cover.1680180959.git.daniel@makrotopia.org>
 <fef2cb2fe3d2b70fa46e93107a0c862f53bb3bfa.1680180959.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fef2cb2fe3d2b70fa46e93107a0c862f53bb3bfa.1680180959.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_140352_429723_F93314F6 
X-CRM114-Status: GOOD (  11.00  )
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

On Thu, Mar 30, 2023 at 04:23:42PM +0100, Daniel Golle wrote:
> Add driver for the built-in Gigabit Ethernet switch which can be found
> in the MediaTek MT7988 SoC.
> 
> The switch shares most of its design with MT7530 and MT7531, but has
> it's registers mapped into the SoCs register space rather than being
> connected externally or internally via MDIO.
> 
> Introduce a new platform driver to support that.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

