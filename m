Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 959BAC6FA82
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Sep 2022 01:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0O5k+RSHj7HdtycUS+tLkZ9vd99pyUfav+EOy+Zs8GI=; b=PINK1rnXuxn4qp0WZBmSM+fD9u
	Px8ipBoHusE8nNWSz4ZMhQSdHM8wRmeTDfhmNfKplVPdaqNXmETeSP6/96NIaA76SK044Vbm6NZiY
	m2w7C64yO1wUpiAGAVrXXXXqlkd08Ef4vFCn/Kp0+oZE91A9+WyQvsgeTUcmBRt4kW9cCFpiaDljV
	PCS6jEyIY/dt8bjNoEYvG+s4Xz8JVpexQdzfvTTtaLmlYM+6LyDOOseVdsRWVqJswpMU+W1iXYgGT
	hJWUC2LylpdtU3hjmoXNHpWUdbuvRoicecQQkrm4Eac1KPSr1LyGxytKRR/tI55Chj6m38GLLMIFJ
	LfYBUugw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaSBb-00H25V-FN; Tue, 20 Sep 2022 01:36:31 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaSBX-00H23M-V2
	for linux-mediatek@lists.infradead.org; Tue, 20 Sep 2022 01:36:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B5BF6B822FF;
	Tue, 20 Sep 2022 01:36:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD106C433C1;
	Tue, 20 Sep 2022 01:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663637784;
	bh=kwcfLJLhrsKvRCJBUy7SyOp36kXJjxlUGS0fk4d20lI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=SD5K8GKosK+GOSbeZroeykjYQuHt0sgm7NdAtx6o6neqqckwA8+P6IE4ITlJskbXP
	 v3d8OOhvXMU7ITFBfufDGEm6UnowMRddgY7pwKsGZIhrG9SmR809SpUXUpXrqih4vH
	 drqBNnIU3a+2jAq8+n6amqs6agQr6vlU1oUTydgXRDvdMrCooNE+vzq/pR1dwsJStR
	 DdQYQxatxnFbegNoPsYgc4uCvmLCY4q2PN8Cja894hOBiFfH4brBpNMAN6zo5IZu/E
	 DtEQSUQU5AEQkp9jPpoKPeX8JvNdZgGrZbKpGpDCSo+t5yDEOqYnvcw0mjsW/JIrbv
	 j+x56AyZypGjg==
Date: Mon, 19 Sep 2022 18:36:22 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Russell King <linux@armlinux.org.uk>,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, Sean Wang
 <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>, DENG
 Qingfang <dqfext@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Vivien Didelot
 <vivien.didelot@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>, Philipp
 Zabel <p.zabel@pengutronix.de>, Alexander 'lynxis' Couzens <lynxis@fe80.eu>
Subject: Re: [PATCH v2] net: dsa: mt7530: add support for in-band link
 status
Message-ID: <20220919183622.205ccabf@kernel.org>
In-Reply-To: <Yx5I6nRPxYIiC1ZT@makrotopia.org>
References: <Yx4910YC6/Y7ghfm@shell.armlinux.org.uk>
	<Yx5I6nRPxYIiC1ZT@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_183628_175429_80104D08 
X-CRM114-Status: GOOD (  13.08  )
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

On Sun, 11 Sep 2022 21:45:30 +0100 Daniel Golle wrote:
>  static void mt7531_pcs_get_state(struct phylink_pcs *pcs,
>  				 struct phylink_link_state *state)
>  {
>  	struct mt7530_priv *priv = pcs_to_mt753x_pcs(pcs)->priv;
>  	int port = pcs_to_mt753x_pcs(pcs)->port;
> +	unsigned int val;
>  
> -	if (state->interface == PHY_INTERFACE_MODE_SGMII)
> +	if (state->interface == PHY_INTERFACE_MODE_SGMII) {
>  		mt7531_sgmii_pcs_get_state_an(priv, port, state);
> -	else
> -		state->link = false;
> +		return;
> +	} else if ((state->interface == PHY_INTERFACE_MODE_1000BASEX) ||
> +		   (state->interface == PHY_INTERFACE_MODE_2500BASEX)) {
> +		mt7531_sgmii_pcs_get_state_inband(priv, port, state);
> +		return;
> +	}
> +
> +	state->link = false;

drivers/net/dsa/mt7530.c:3040:15: warning: unused variable 'val' [-Wunused-variable]
        unsigned int val;
                     ^

