Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16CF1EB64DD
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jul 2023 11:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mRNXpTF9NpqecxTVG5qGUBRRA0x/zBmH+OMXRKf1tuw=; b=2PaH/VHCYlltQQMZVCiivn6qrZ
	JnkPOREHZhzyUvRxEXGLNVxgWTcX/z5qrY1tY5s2mRHtjKYTxpsX7LTNt/1ovK5/h4s5Q5GiLuTP5
	eDtS9acKtKROLCnV6Nw4fo0Ta7OQZByoPpUp7TgWDsIJOoqq117B/JbR4dEQYrkPNamYpQMnYb6ih
	EJOpcpGO1S1x54CKaEW10Wh85Uw2hNQBlpKXiY2anULUxJnqb2sKJoA40KthscPlO4ygZnP+i18vp
	GSTWr35NMebKucpLCTZQc/M0rRoWJYm4h90pV2bYMnBnK+lv+qerMPp9Ke+k++PDJJTe9WZYfUb5x
	iiC858gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJuEr-0032c0-38;
	Thu, 13 Jul 2023 11:12:01 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJuEp-0032ae-1A;
	Thu, 13 Jul 2023 11:12:00 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1qJuEa-00082a-0L;
	Thu, 13 Jul 2023 11:11:44 +0000
Date: Thu, 13 Jul 2023 12:11:30 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
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
Message-ID: <ZK_b4s6cQd-lhz1Y@makrotopia.org>
References: <cover.1689012506.git.daniel@makrotopia.org>
 <2cc8012ec538106c6bcf22a40b647ec342e687a8.1689012506.git.daniel@makrotopia.org>
 <ZK+izTulIcse2aG5@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZK+izTulIcse2aG5@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_041159_402629_80E269D9 
X-CRM114-Status: GOOD (  22.67  )
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

On Thu, Jul 13, 2023 at 08:07:57AM +0100, Russell King (Oracle) wrote:
> On Thu, Jul 13, 2023 at 03:18:52AM +0100, Daniel Golle wrote:
> > From: Lorenzo Bianconi <lorenzo@kernel.org>
> > 
> > This is a preliminary patch to add MT7988 SoC support since it runs 3
> > macs instead of 2.
> > 
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> > ---
> >  drivers/net/ethernet/mediatek/mtk_eth_soc.c | 6 +++++-
> >  drivers/net/ethernet/mediatek/mtk_eth_soc.h | 4 ++--
> >  2 files changed, 7 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> > index 7014e0d108b27..7f191e4337dd8 100644
> > --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> > +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> > @@ -4030,8 +4030,12 @@ static void mtk_sgmii_destroy(struct mtk_eth *eth)
> >  {
> >  	int i;
> >  
> > -	for (i = 0; i < MTK_MAX_DEVS; i++)
> > +	for (i = 0; i < MTK_MAX_DEVS; i++) {
> > +		if (!eth->sgmii_pcs[i])
> > +			continue;
> > +
> >  		mtk_pcs_lynxi_destroy(eth->sgmii_pcs[i]);
> > +	}
> 
> Please instead arrange for mtk_pcs_lynxi_destroy() to be a no-op if it's
> passed a NULL pointer, which makes it easier to use in error paths (it
> means mtk_pcs_lynxi_destroy() can be called without checks - like
> kfree() etc.)
> 
> Since error paths don't get often tested, we need to do as much as
> possible to make error paths trivial.

This is the case already, so the above if-clause can be dropped.
I will do so in v3.

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/pcs/pcs-mtk-lynxi.c#n291

