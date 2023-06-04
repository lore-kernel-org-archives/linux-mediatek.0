Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38D76C7EE29
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Jun 2023 12:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M7DP37lPI2Y7kMT7BCaNIjykdXMNnaQCjot38IYbWV0=; b=hKqAbXf00kyZqzwpHEJ7B/+agx
	k5kZrrmdPNOURE67JACW87ylOTHQyn3qJzWS3LA6IWDigyWbhn2hwKGuC+w1gSrZRs4ccbbUUg5Z2
	kercpDAvI0CyDSw/yC4VS28avVEFZz135sA+r6nUHecJ5Ellr/exFyzqrjmpJzeQ51yhTdkxPkPVh
	tY04sUAhJC8aph8liKBp7uzrWNMPa8KCLl2trOWKXCrdWjSUpW+Xrdzq9h5p04CNFsgvwohSKXye/
	k4Q4uAKmeNI4Deg9iBDS7zoB1K/WSFjK0BB5FWOIEXfn9Ut/Ud/qCahrKET7YSrfEP+lmriTrzJmt
	wQ6K8gKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5mh0-00C7iH-1J;
	Sun, 04 Jun 2023 12:18:42 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5mgw-00C7hV-2F;
	Sun, 04 Jun 2023 12:18:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=M7DP37lPI2Y7kMT7BCaNIjykdXMNnaQCjot38IYbWV0=; b=bZgNEeZQDkY8VlU4xEniQTA4j2
	/3dHH505sQJsoKvU9fx6ahMqNO7057sFg08gAhbLCezxVc6KReswaAQXSFVM1XlxEPyyEXveUkKQo
	3mP3D+1dkAVrssu/6sQxGwzHsgFz/rZWZ8WtsQLG12JzKhxor5H+Ooi/xl/XuG6/lV4MRibLUZQjT
	kVjhn3RlbPTt6JM9p1UMhopTsdkOHcCoIQp3g3d8eD5hcsJQ/i7AvBUhLTcI9TBTTPoPtDag6MH5n
	LtgkkGZeyAa+fyLvcmtxTpejH4jSIZm980ktJBOTAmsuIiebuoAkSaj23M+MWdy3yilGWB1iY2We5
	tajiqKyw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:36806)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1q5mgX-0002Yy-1w; Sun, 04 Jun 2023 13:18:13 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1q5mgO-000533-KN; Sun, 04 Jun 2023 13:18:04 +0100
Date: Sun, 4 Jun 2023 13:18:04 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Subject: Re: [PATCH net-next 08/30] net: dsa: mt7530: change p{5,6}_interface
 to p{5,6}_configured
Message-ID: <ZHyA/AmXmCxO6YMq@shell.armlinux.org.uk>
References: <20230522121532.86610-1-arinc.unal@arinc9.com>
 <20230522121532.86610-1-arinc.unal@arinc9.com>
 <20230522121532.86610-9-arinc.unal@arinc9.com>
 <20230522121532.86610-9-arinc.unal@arinc9.com>
 <20230524175107.hwzygo7p4l4rvawj@skbuf>
 <576f92b0-1900-f6ff-e92d-4b82e3436ea1@arinc9.com>
 <20230526130145.7wg75yoe6ut4na7g@skbuf>
 <7117531f-a9f2-63eb-f69d-23267e5745d0@arinc9.com>
 <ZHsxdQZLkP/+5TF0@shell.armlinux.org.uk>
 <826fd2fc-fbf8-dab7-9c90-b726d15e2983@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <826fd2fc-fbf8-dab7-9c90-b726d15e2983@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230604_051838_760688_AD545875 
X-CRM114-Status: GOOD (  22.87  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, mithat.guner@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, erkin.bozoglu@xeront.com, Richard van Schagen <richard@routerhints.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Richard van Schagen <vschagen@cs.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Jun 04, 2023 at 01:46:46PM +0300, Arınç ÜNAL wrote:
> On 3.06.2023 15:26, Russell King (Oracle) wrote:
> > Given that, you should have no need to make explicit calls to your
> > mac_config, pcs_link_up and mac_link_up functions. If you need to
> > make these calls, it suggests that phylink is not being used for the
> > CPU port.
> 
> Your own commit does this so I don't know what to tell you.
> 
> https://github.com/torvalds/linux/commit/cbd1f243bc41056c76fcfc5f3380cfac1f00d37b

I would like to make a comment here to explain why in that commit I
added a call into mt7531_cpu_port_config() to mt7531_cpu_port_config().

When I'm making changes to drivers, then I follow a golden rule: do
not change the behaviour unless it is an intentional change.

This is exactly what is going on in this commit.
mt7531_cpu_port_config() called mt753x_phylink_mac_link_up(), which
then, as the very first thing, called mt753x_mac_pcs_link_up().
mt753x_mac_pcs_link_up() called priv->info->mac_pcs_link_up() if
it is defined.

Since converting to phylink_pcs involves the removal of the direct
call from mt753x_phylink_mac_link_up() to the
priv->info->mac_pcs_link_up() method, in order to preserve the
behaviour of the driver, it is necessary to ensure that
mt7531_cpu_port_config() still makes that call.

mt753x_phylink_pcs_link_up() is the new function replacing
mt753x_mac_pcs_link_up() which makes that call, so it is entirely
appropriate to add that call into mt7531_cpu_port_config() so that
mt7531_cpu_port_config() behaves _precisely_ the same as it did
before and after this change.

In that sense, as far as mt7531_cpu_port_config() is concerned, this
change is entirely idempotent.

I don't know whether mt7531_cpu_port_config() is necessary to properly
bring up a CPU port, or whether _all_ firmware descriptions for
mt7531 include all the necessary properties so that DSA will always
bring up a phylink instance for the CPU port - that really is not
relevant for the change you point out.

What is relevant is only making the intended change, and the intended
change is to split the PCS-specific code from the MAC-specific code.

This principle of only making one change in a patch, and ensuring that
parts of the code which merely need to be re-organised to achieve that
change are done in an idempotent way is fundamental to good code
maintenance, especially when modifying drivers that one does not have
the hardware to be able to test.

You have provided new information - that basically indicates that
phylink is used for your setup. If we can get to a position where we
can confidently say that phylink will always be used for the CPU port,
the code in mt7531_cpu_port_config() that bypasses phylink, calling
methods in phylink's mac_ops and pcs_ops, should be removed.

I don't remember whether Vladimir's firmware validator will fail for
mt753x if CPU ports are not fully described, but that would be well
worth checking. If it does, then we can be confident that phylink
will always be used, and those bypassing calls should not be necessary.

I hope this explains the situation better.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

