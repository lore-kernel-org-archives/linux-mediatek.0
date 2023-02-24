Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8F66C61DA4
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Feb 2023 12:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oOUHfm6liK2+pEkFLHJseKqdt6YDS6UDIHuq/c0TaYE=; b=NVf9dbIgyJ5KrOiDQrWoH2X9v6
	7Hmns+Jvv/Wy1QvIQLrqY1iWPnVjLHnq7y2dNt6FZOUca1mZ/oIWgQ4pIoGK6Y/TzSH73hHAm1bjs
	bmifG/leyAhb8SgIsNRIHejnV59B5/3/vqJsPBnPgJy5THeJilc/ajLjhqmb7R5DxW8HWvn5U/xde
	CKzU3n6uTQ3lHr8gFzxrq5KJA96f7DsGlVnH9WAyyb0OCoHzbORu90UjnaA2tIPhURIpM2VSyilsZ
	rU5PQv4s6ma4SrmDsoE49DP+uhYbHSdY0W4xJPxgYT/yKVOwrcynuR3VQRH3Is3kJ15tPbH/ooEx9
	SS4/sDYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVXJB-002PWC-Sa; Fri, 24 Feb 2023 12:36:17 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVXJ1-002PTC-EZ; Fri, 24 Feb 2023 12:36:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=oOUHfm6liK2+pEkFLHJseKqdt6YDS6UDIHuq/c0TaYE=; b=z8KdmSnkzkHmL83t8pGRNLz1+D
	CC4LZFOjWj+X1hOVleI5M4h6cu8bYP5ARnxb5Wxf3NQ6qiSfUju2vMZ4J8iZz1Jeawbzh/AIizPlC
	N05QPZ+2PU+rbBHxnbw8TYYYEienuFt2kpx4ecGTvWx5UNO06k80+AoGApYBc3umEXkOHzBLygDNP
	Ex+H7NepQD2eqKfSWwSHN+Px54dExvyzukOXZEQMdWPXrFqJGYK4r2E2DDYWMERigAjxtONLEKTBO
	L9VrQhZS1uN43fZR00z1ENsZCbuQc56KuDZdOsBgBq6vQUcrENLngzWI7nZL6xXrzPZSPqBKkopND
	OSPTF8TQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35628)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1pVXIg-0000cw-7b; Fri, 24 Feb 2023 12:35:46 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1pVXIa-0005PH-Am; Fri, 24 Feb 2023 12:35:40 +0000
Date: Fri, 24 Feb 2023 12:35:40 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Daniel Golle <daniel@makrotopia.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Felix Fietkau <nbd@nbd.name>,
	Jakub Kicinski <kuba@kernel.org>, John Crispin <john@phrozen.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH RFC net-next 0/4] Various mtk_eth_soc cleanups
Message-ID: <Y/ivHGroIVTe4YP/@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_043607_777528_51CC426E 
X-CRM114-Status: GOOD (  16.31  )
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

Hi,

These are a number of patches that do a bit of cleanup to mtk_eth_soc,
including one (the last) which seems to indicate that I somehow missed
adding RMII and REVMII to the supported_interfaces - but no one has
complained, and checking the DT files in the kernel, no one uses these
modes (so the driver is probably untested for these.)

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

The last patch adds comments for REVMII and RMII. As I note, these
seem to be unused in the DT files, and as no one has reported that
these don't work, I suggest that no one uses them. Should we drop
support for these modes, or add them to supported_interfaces?

Please review, and I'll collect attributations for resending after
net-next has re-opened.

Thanks.

 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 71 ++++++++++++++---------------
 1 file changed, 34 insertions(+), 37 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

