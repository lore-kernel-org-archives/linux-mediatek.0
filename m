Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 477BCC3271E
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Jul 2024 11:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l7kIOQ7U9whmVzcXksdbQ0HHHC/NbDC/JzmH/l2qmpo=; b=PVMKDu1d+387x3rFmo8XkZ2mbs
	BT6OJEfRFvktagqOWhgu+H7CGmRUwua79pt7bjFmgyNNUTUD8UH/+gUwO6GK+5q21woNIrs5u+71K
	M0RI5P6HKzULon5E5P6HccZYtiH9dNcZDFS4+hPGHc/6LbKr92XhDNQd4IzCanC535rGvG9FtU2ar
	/xDPGE0+7W+hEfP2KfzJ7MFMTjdn+A1f8UuQWiq+MZFAJ5G1WB3bSn8heL564aKOjAFWMUgsUcEHW
	6VpjJLff3uZ/1O9PBNjjm5n23ZPTOfu9XvJyfVE0ykzKULRlQhf4zk8AFB5yUL5Y++a4KaHk9vavu
	z4xr6n0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPKpo-0000000D30z-4AH1;
	Thu, 04 Jul 2024 11:41:08 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPKpa-0000000D2xJ-2BqU;
	Thu, 04 Jul 2024 11:40:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=l7kIOQ7U9whmVzcXksdbQ0HHHC/NbDC/JzmH/l2qmpo=; b=Ni8own68G3SfOJUosPZiMSNYT4
	57ezfWIGYC9RZKmNJ0ToBoz6m4GI1oTOERfcE9TQXMLAM27DEmIIHxsWQmPSpf3yC9W0Q9ZckyQRa
	EdtnLb3JF3Pqol2nhoH/RU3P/SYnGrqe3StL+TVByWMPHPEd8vXdwisjZz0+8bm5CdYfLsK6oOKpJ
	GYFMDIowvI4+Ywz3LbRxRL/f1qdw5tdXOfbp18phpxMJeocAiFcu7uyD/QQ3LwqKa2RNAfAta5CKd
	av5NbGmT8dDaH2lRGM5LGvOtj7w0g1L+QnnKfAUmqvaofx5VbhtU7jsyF1bTImdmfGo9GUQ70SaeU
	qt7HqohA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:60514)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1sPKpD-0006ps-0P;
	Thu, 04 Jul 2024 12:40:31 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1sPKpB-0003ta-2v; Thu, 04 Jul 2024 12:40:29 +0100
Date: Thu, 4 Jul 2024 12:40:28 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Daniel Golle <daniel@makrotopia.org>
Cc: John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next] net: ethernet: mtk_eth_soc: implement
 .{get,set}_pauseparam ethtool ops
Message-ID: <ZoaKLKl9cFkhmJKU@shell.armlinux.org.uk>
References: <e3ece47323444631d6cb479f32af0dfd6d145be0.1720088047.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e3ece47323444631d6cb479f32af0dfd6d145be0.1720088047.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_044054_594049_54958B00 
X-CRM114-Status: UNSURE (   9.53  )
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

On Thu, Jul 04, 2024 at 11:14:55AM +0100, Daniel Golle wrote:
> Implement operations to get and set flow-control link parameters.
> Both is done by simply calling phylink_ethtool_{get,set}_pauseparam().
> Fix whitespace in mtk_ethtool_ops while at it.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

