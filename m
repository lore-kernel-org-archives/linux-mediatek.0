Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35DE7C6FD1A
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 16:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ajJcOlWzx/VD/YVzxlqdpGWy4Ty21l5WTKrD64qnBUE=; b=nNmTR3bNs6l/cba/YF0z4c6UgB
	TX86BDwVPc3zDlZn4ZXJB62CLvO6OeyOUV0qekDjhv+19WSVWfaD1XL9spX+ic4X9RWTGxeEzEmN3
	08+EqYCyQ1LywcHS7aY3Y7Eg3oHz4UFZ8ReoXYz+Q5DQINQo+6iHLvLAMNfDYpLeTQ7RTg8gsgIVg
	wMZWUNAqjXfMRuEVkQxITqhcqzUeOgk8GIC8xCqfXVqiVelWJhZPLH0xj2hYqJKeaPlxiL41ph2SB
	QpOmQTxgcDbTVoWHeGMoFJQ2/9SwJhpbOaM8F4ktlF20Vf+zu0g+FH50avOnknQyJXIeiJJTMslsW
	RxENRW+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZa2N-001U4X-Fm; Tue, 07 Mar 2023 16:19:39 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZa26-001TxI-IT; Tue, 07 Mar 2023 16:19:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ajJcOlWzx/VD/YVzxlqdpGWy4Ty21l5WTKrD64qnBUE=; b=ss5koH86A5fyLvKwygzr/Yh3ir
	jt5mPztVyk14RQl/Yp3gkJL29sViBmotS1nf7LWQVTsAon3/1JT2TALsO+CS+yXu5ZfMqslhBU792
	slTv1488OAE3vcJXe6Ywq1uK0gbsY9bILhCnEdsSxJ8t6j7nFJtxL4tfx/AjNJqXazGVH2UlQTXq5
	y9i/ZzKrEgqoUkNawA89atbqmmQvOQcPMg+WS/r1tOi5GGk+04/Hp3iNRbB2pu6gD6dcexkfLRdom
	chMtMw5DUwqSk2MczjZR1+m0Ro/EdW8OcWH1EnhkgO5YzPIEU3aBe6GwWY7XjOUzsVfMfeM4+tob6
	pWk07xEQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:58336)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1pZa1r-0000ma-2A; Tue, 07 Mar 2023 16:19:07 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1pZa1m-0001fg-3S; Tue, 07 Mar 2023 16:19:02 +0000
Date: Tue, 7 Mar 2023 16:19:02 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Daniel Golle <daniel@makrotopia.org>, Felix Fietkau <nbd@nbd.name>,
	John Crispin <john@phrozen.org>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Lorenzo Bianconi <lorenzo@kernel.org>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 0/4] Various mtk_eth_soc cleanups
Message-ID: <ZAdj9qUXcHUsK7Gt@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_081922_651362_D6BB0F17 
X-CRM114-Status: GOOD (  12.72  )
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

Here are a number of patches that do a bit of cleanup to mtk_eth_soc.

The first patch cleans up mtk_gmac0_rgmii_adjust(), which is the
troublesome function preventing the driver becoming a post-March2020
phylink driver. It doesn't solve that problem, merely makes the code
easier to follow by getting rid of repeated tenary operators.

The second patch moves the check for DDR2 memory to the initialisation
of phylink's supported_interfaces - if TRGMII is not possible for some
reason, we should not be erroring out in phylink MAC operations when
that can be determined prior to phylink creation.

The third patch removes checks from mtk_mac_config() that are done
when initialising supported_interfaces - phylink will not call
mtk_mac_config() with an interface that was not marked as supported,
so these checks are redundant.

The last patch removes the remaining vestiges of REVMII and RMII
support, which appears to be entirely unused.

These shouldn't conflict with Daniel's patch set, but if they do I
will rework as appropriate.

Thanks.

 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 81 ++++++++++++-----------------
 1 file changed, 33 insertions(+), 48 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

