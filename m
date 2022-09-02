Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A426FC001B5
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Sep 2022 15:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CTrG12qWnI/c/AxI8kTL2+rjoFmKz1TXs568RjVaASw=; b=io8/3RbhmsIvxTUwSzxMUQOVS2
	XAE0zZx0ab8YONg6KYsFZBvQJwZD12nvL6RP94c6G38MoDtP/sWD2y1BIBxyy2LXo+BQGAbUrf9yK
	lI61hFzdzP8AM7JciRdDDDUlcb6/wJGMGtMJbusLnT4Hhs7CqaH4PA0HWm0jM0ocTjWZwm69X3j20
	5m+r8Ft6kQ3km0vIlwEzGY80uIVV7lJ7oMyK3Bv32W1GGAofO7b8aDZnNKCwPrhvGgYqlbvcyYLfI
	ctlNYoppikisqNc4N2ghXS77jzehxtLXxR289aBtoLpyAG7+Vo+r9A4emJYg0UJpNH7dn9wntnnjT
	nE07/PNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU8tf-006T4f-5O; Fri, 02 Sep 2022 15:47:55 +0000
Received: from mail.base45.de ([2001:67c:2050:320::77])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU8td-006T0T-3T
	for linux-mediatek@lists.infradead.org; Fri, 02 Sep 2022 15:47:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fe80.eu;
	s=20190804; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=CTrG12qWnI/c/AxI8kTL2+rjoFmKz1TXs568RjVaASw=; b=ifKtc5mRxPP/hgk+Ujk1yvgVcL
	Hd0Yi+M6uyrX3B0eqHzbr8jt3EzwK2h1hez7h9JQijZsTOI/t7b77YbQsg8TdY2kbc1MoO2iNRdqx
	fZW+VmZsVJeH2MySiJ5JZ5iiLwkpTJLYP/QJ+u3bsptU1mfzf971861j5yM7+VfOck15C0+diOs4j
	kL+vIvmkhQ8N98uA87gx95GTk2C+k7qFrK5CfD6L/Ay9F4DUKz0oBSilvXKQRLXbmkQV00XqhEMom
	Y3AJps/tqC2vkBIBL5YH8RPrRMTiOlGrInb/392Q1OI26agkHoUVlC5NwGEFsOUcCRbxKLExnQJoN
	wxDzstOA==;
Received: from [92.206.252.219] (helo=javelin)
	by mail.base45.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <lynxis@fe80.eu>)
	id 1oU8sx-005KhR-5H; Fri, 02 Sep 2022 15:47:11 +0000
Date: Fri, 2 Sep 2022 17:47:10 +0200
From: Alexander 'lynxis' Couzens <lynxis@fe80.eu>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>, Sean Wang
 <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Daniel
 Golle <daniel@makrotopia.org>
Subject: Re: [PATCH 3/4] net: mediatek: sgmii: mtk_pcs_setup_mode_an: don't
 rely on register defaults
Message-ID: <20220902174710.54a1d317@javelin>
In-Reply-To: <YwTyLwRnQ+eTXeDr@shell.armlinux.org.uk>
References: <20220820224538.59489-1-lynxis@fe80.eu>
	<20220820224538.59489-4-lynxis@fe80.eu>
	<YwTyLwRnQ+eTXeDr@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_084753_169038_728BE743 
X-CRM114-Status: GOOD (  16.20  )
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

On Tue, 23 Aug 2022 16:28:47 +0100
"Russell King (Oracle)" <linux@armlinux.org.uk> wrote:

> On Sun, Aug 21, 2022 at 12:45:37AM +0200, Alexander Couzens wrote:
> > Ensure autonegotiation is enabled.
> > 
> > Signed-off-by: Alexander Couzens <lynxis@fe80.eu>
> > ---
> >  drivers/net/ethernet/mediatek/mtk_sgmii.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/net/ethernet/mediatek/mtk_sgmii.c
> > b/drivers/net/ethernet/mediatek/mtk_sgmii.c index
> > 782812434367..aa69baf1a42f 100644 ---
> > a/drivers/net/ethernet/mediatek/mtk_sgmii.c +++
> > b/drivers/net/ethernet/mediatek/mtk_sgmii.c @@ -32,12 +32,13 @@
> > static int mtk_pcs_setup_mode_an(struct mtk_pcs *mpcs)
> > regmap_write(mpcs->regmap, SGMSYS_PCS_LINK_TIMER,
> > SGMII_LINK_TIMER_DEFAULT); 
> > +	/* disable remote fault & enable auto neg */
> >  	regmap_read(mpcs->regmap, SGMSYS_SGMII_MODE, &val);
> > -	val |= SGMII_REMOTE_FAULT_DIS;
> > +	val |= SGMII_REMOTE_FAULT_DIS | SGMII_SPEED_DUPLEX_AN;  
> 
> Does SGMII_SPEED_DUPLEX_AN need to be cleared in
> mtk_pcs_setup_mode_force(), so mtk_pcs_link_up() can force the
> duplex setting for base-X protocols?
> 

Yes SGMII_SPEED_DUPLEX_AN needs to be cleared to have FORCE_DUPLEX
working. But mtk_pcs_setup_mode_force() is clearing it implicit by

val &= SGMII_DUPLEX_FULL & ~SGMII_IF_MODE_MASK

because it's included in the SGMII_IF_MODE_MASK.
I also don't understand why it's forcing it in the
mtk_pcs_link_up().

