Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BE29C001DE
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jul 2023 07:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hdGx1K3RjF5TT01b8U4Kk8AYjp2IPrWjWa8zM6ieITE=; b=XDSkthcysd7POYB6yS9WW7EAon
	sFrfw00WIXaquzFD9MkM4B1KvkCpTKinc7Os02iFWxf+YYtdR2hOkWs4HdH0C7/LVMoso31D4k7qA
	tnJPbxQumaKDmRrrr8OogZV1fRdYj18tBYyaS4pbbze5PgNpZVONtBkMyTKP1AekVbB2Cle785Cli
	pEXHvTX7WoaMock0VBI/u7k4i14bLjl8UTF2P47kjPZTpurngO4YZj7BmBKf31Mu6lbUuTR0Na3io
	A65aSt5k4d8107Z0zNZh4oBV5AYz4whkTK71LU2U69HNMrd9kW0D1A+p0IAu/Vv9oxLqMmMvoCSDw
	oF3DDxSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJqQm-002Bdl-20;
	Thu, 13 Jul 2023 07:08:04 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJqQi-002Bb6-15;
	Thu, 13 Jul 2023 07:08:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=hdGx1K3RjF5TT01b8U4Kk8AYjp2IPrWjWa8zM6ieITE=; b=JugqstoBFWytUNEtdyZjbsNqKN
	kg6eSi0xlUBPQzyzpt/3EGI2RiTg6w98eeegWwfxItBXDFEkcV/CBfNG4Goh0Q7jPe9icSD7oStGn
	+Q7ZfTbcHLCuxSAKJhy/IqJVClovAg+DoEsjXB/pcaJ7wKYmaLpHZCKvw8oQfCq/WRkJWWnKF1Rmp
	ll2W0Vcwantvht6diGhv2s0QO+n0RvNrOYsFFgBa3+YWIHDDId6xWmHqdioWQbA2lsfivpoY1lD3B
	5pTjBgwFZIRaoCx6Yqegqa9CDx6CHJ0GSWxo0OttJ9WAz330MqclE6MzFbMVOGc9QWjXww81bDlDb
	5uqB3Www==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33956)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1qJqQg-0005py-0o;
	Thu, 13 Jul 2023 08:07:58 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1qJqQf-0005uz-Dm; Thu, 13 Jul 2023 08:07:57 +0100
Date: Thu, 13 Jul 2023 08:07:57 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>,
	John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Greg Ungerer <gerg@kernel.org>
Subject: Re: [PATCH v2 net-next 4/9] net: ethernet: mtk_eth_soc: increase
 MAX_DEVS to 3
Message-ID: <ZK+izTulIcse2aG5@shell.armlinux.org.uk>
References: <cover.1689012506.git.daniel@makrotopia.org>
 <2cc8012ec538106c6bcf22a40b647ec342e687a8.1689012506.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2cc8012ec538106c6bcf22a40b647ec342e687a8.1689012506.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_000800_377749_B1D09211 
X-CRM114-Status: GOOD (  20.51  )
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

On Thu, Jul 13, 2023 at 03:18:52AM +0100, Daniel Golle wrote:
> From: Lorenzo Bianconi <lorenzo@kernel.org>
> 
> This is a preliminary patch to add MT7988 SoC support since it runs 3
> macs instead of 2.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  drivers/net/ethernet/mediatek/mtk_eth_soc.c | 6 +++++-
>  drivers/net/ethernet/mediatek/mtk_eth_soc.h | 4 ++--
>  2 files changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> index 7014e0d108b27..7f191e4337dd8 100644
> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> @@ -4030,8 +4030,12 @@ static void mtk_sgmii_destroy(struct mtk_eth *eth)
>  {
>  	int i;
>  
> -	for (i = 0; i < MTK_MAX_DEVS; i++)
> +	for (i = 0; i < MTK_MAX_DEVS; i++) {
> +		if (!eth->sgmii_pcs[i])
> +			continue;
> +
>  		mtk_pcs_lynxi_destroy(eth->sgmii_pcs[i]);
> +	}

Please instead arrange for mtk_pcs_lynxi_destroy() to be a no-op if it's
passed a NULL pointer, which makes it easier to use in error paths (it
means mtk_pcs_lynxi_destroy() can be called without checks - like
kfree() etc.)

Since error paths don't get often tested, we need to do as much as
possible to make error paths trivial.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

