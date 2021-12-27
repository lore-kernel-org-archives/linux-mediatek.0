Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5F5CC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Dec 2021 16:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GRcQp8uZbmBLHzySuFWyMmLeJx9/AUo2/pITvY334Iw=; b=Arx3Mp1HUUobLB
	nhnA0UZtxbQpD0HK2xTP35YaC7a4GQvNbqgnNZRFDFvWflSrd/ePvocJlEmZzV4OsVI2wIo+vVafp
	ngH5dl+ZIVbFT6frhIl4PNZO3dHfmRpVj+In9Xc45Qm/+9WJhehJnqGumDZMiVACPedPlvozdMVoM
	T/0miPpBBKQOI3PerpotvQkLZGqtb1eHf99nVhXcJbX16PcI0/N5hQFuF66zoEFZyeq7MnlXqAOiR
	AGU3LN4AN9xHdkEkjlLwCeSRCfKmzOKsxS0lfAa6JoXB0STUtT1Y2q9e7PSKZbXfBga1/Rd5FfjQM
	8OctzFBJ3FwxMva6cRLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1skh-00GzDt-4L; Mon, 27 Dec 2021 16:21:35 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1skd-00GzCz-Jx; Mon, 27 Dec 2021 16:21:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RSEhGp8eMqXQRr+8UPnF+WguCciA3JX0Md7WUMkePUo=; b=ni+9alY6BXaeUBEkhjtRG7Z1KY
 VaYrtW/eg4v+NkdveUv1ZkEwl3+GqdtKwA9HdaflPQRA5afQX0/jrH0QodRNeqGohPbUyf3jmSNFd
 K/T9YeXw5C89URjTY0Fa/huBgaJznW/c8LNbrrvMyLWGkG5QW/N7WAc4/VC+ZjaztxUF/EkLR/YI2
 8iW1dkRYiXya/zVKl08XslB8RKJSpDPCEyAPVs6rK0x+6sJXlQlje9/+LPZ3sOptUrLd5oTDwBdJy
 5WXTjjx7SzfCpa2nklXCG2faprJk2L/DAzYUFn2lPpnJIzkVZag+vokBGSTnh87Bz4PUbnk/9H8Dr
 5xvvuw/Q==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56460)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1n1skY-0001Fb-Ty; Mon, 27 Dec 2021 16:21:26 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1n1skU-0008H4-RQ; Mon, 27 Dec 2021 16:21:22 +0000
Date: Mon, 27 Dec 2021 16:21:22 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Daniel Golle <daniel@makrotopia.org>
Cc: linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v3] net: ethernet: mtk_eth_soc: implement Clause 45 MDIO
 access
Message-ID: <YcnoAscVe+2YILT8@shell.armlinux.org.uk>
References: <YcjsFnbg87o45ltd@lunn.ch> <YcjjzNJ159Bo1xk7@lunn.ch>
 <YcjlMCacTTJ4RsSA@shell.armlinux.org.uk>
 <YcjepQ2fmkPZ2+pE@makrotopia.org> <YcnlMtninjjjPhjI@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YcnlMtninjjjPhjI@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211227_082131_686785_2161CAA9 
X-CRM114-Status: GOOD (  13.54  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Dec 27, 2021 at 04:09:22PM +0000, Daniel Golle wrote:
> Implement read and write access to IEEE 802.3 Clause 45 Ethernet
> phy registers.
> Tested on the Ubiquiti UniFi 6 LR access point featuring
> MediaTek MT7622BV WiSoC with Aquantia AQR112C.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
> v3: return -1 instead of 0xffff on error in _mtk_mdio_write

Oh no, not this "-1 disease" again.

        eth->mii_bus->write = mtk_mdio_write;

static int mtk_mdio_write(struct mii_bus *bus, int phy_addr,
                          int phy_reg, u16 val)
{
        struct mtk_eth *eth = bus->priv;

        return _mtk_mdio_write(eth, phy_addr, phy_reg, val);
}

This means if you return -1 from _mtk_mdio_write() (which for some
strange reason returns a u32, not an "int") then you actually end
up returning -EPERM. This is not an appropriate errno code.

As a general rule of thumb, if you're returning an "int" and wish
to return "this failed" then always return an appropriate negative
errno code in the kernel so there isn't any possibility of
accidentially returning -EPERM through using "return -1".

This driver needs fixing _both_ due to returning -1, and also the
return type from both _mtk_mdio_write() and _mtk_mdio_read().

To see why it's important to return a proper error code, see
drivers/net/phy/phy_device.c::get_phy_c22_id() where -ENODEV and
-EIO are specifically checked. Any other negative value here will
stop the bus being scanned and cause the bus to be torn down.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
