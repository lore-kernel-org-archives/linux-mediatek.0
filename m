Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D97FC5475B
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Feb 2024 01:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EGWZ0cD7x136SOPcqoeVdzgHJ9mzEsKOD+NIhP/2Vmc=; b=hsqee9Uymg6UT+Pki3SKY6RS+Y
	0gqBxsEMdvcB73QdOKoLJ4tYsx5IuzEyG8zUokFGnjt2P642Sx61XgAzS63TJbY0vHNdqJBFCW2M/
	eU00l0DpYuRjiaLO1H2WwsuMqfaTGROQa2hv90KYpClst6kbD4XTvsP86OFi4HplZtUkE9SFYAWRX
	Pn36dMd1S/7xRMx1zJc1AjXXTRQOKVu7MO/s1++jQizauVS306J/rzW+HE4W7EQHR9mSikiLi36ui
	cEb/PByhvPqNc1l/Ks1VaW0unR9/VLvw3BrM772whCrT2epT2qF7SabnBenLNHGy07HNrRRv49Qfo
	dxao+uQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfVYI-0000000Bf0j-1n7X;
	Thu, 29 Feb 2024 01:49:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfVYE-0000000Bezp-3Ufk;
	Thu, 29 Feb 2024 01:49:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 12DBA61336;
	Thu, 29 Feb 2024 01:49:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 180F9C433C7;
	Thu, 29 Feb 2024 01:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709171373;
	bh=Z9+ZItlUKOOugftEXhTeLovJnwPdw0FTe0BJHEfOUvc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=fZ7/Asn9fee487a/DT2NBXMTgVevreMAjByrP3R1pgFm9XrySx0/QyxylioN5kg5Q
	 TlwAvaCqHNJ9nApguOtuNYt7xw99FnQL2zA5atAfdE6+UIzSd/S8iG5oGfg9hT5Sni
	 vw9NPfzwVYHt1SRGTKCzA67NNWSWIuteEwRPt/nVU03sLVxK+ghXoP4K11IT9AsGnS
	 VH5PacwR99K0WLfN/ev/9lfrooz9Lmsvl6njq1qH5uC9VegOL2nv6XEaXatKfVJ1AS
	 iuWH0zSNCCzfHZUIlT8U2rH8EnHyL3u7oLpUn4WEa/ZhD5t5LtZZZ6JkUyVw1zLNST
	 ka3MCb83MttpA==
Date: Wed, 28 Feb 2024 17:49:32 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= via B4 Relay
 <devnull+arinc.unal.arinc9.com@kernel.org>
Cc: <arinc.unal@arinc9.com>, Daniel Golle <daniel@makrotopia.org>, DENG
 Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>, Andrew
 Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Vladimir
 Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Russell King
 <linux@armlinux.org.uk>, mithat.guner@xeront.com, erkin.bozoglu@xeront.com,
 Bartel Eerdekens <bartel.eerdekens@constell8.be>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v2 8/8] net: dsa: mt7530: simplify link
 operations and force link down on all ports
Message-ID: <20240228174932.2500653d@kernel.org>
In-Reply-To: <20240216-for-netnext-mt7530-improvements-3-v2-8-094cae3ff23b@arinc9.com>
References: <20240216-for-netnext-mt7530-improvements-3-v2-0-094cae3ff23b@arinc9.com>
	<20240216-for-netnext-mt7530-improvements-3-v2-8-094cae3ff23b@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_174934_987821_75F99CC4 
X-CRM114-Status: GOOD (  18.31  )
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

On Fri, 16 Feb 2024 14:05:36 +0300 Ar=C4=B1n=C3=A7 =C3=9CNAL via B4 Relay w=
rote:
> From: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>
>=20
> Currently, the link operations for switch MACs are scattered across
> port_enable, port_disable, phylink_mac_config, phylink_mac_link_up, and
> phylink_mac_link_down.
>=20
> port_enable and port_disable clears the link settings. Move that to
> mt7530_setup() and mt7531_setup_common() which set up the switches. This
> way, the link settings are cleared on all ports at setup, and then only
> once with phylink_mac_link_down() when a link goes down.
>=20
> Enable force mode at setup to apply the force part of the link settings.
> This ensures that only active ports will have their link up.

I don't know phylink so some basic questions..

What's "mode" in this case?

> Now that the bit for setting the port on force mode is done on
> mt7530_setup() and mt7531_setup_common(), get rid of PMCR_FORCE_MODE_ID()
> which helped determine which bit to use for the switch model.

MT7531_FORCE_MODE also includes MT7531_FORCE_LNK, doesn't that mean=20
the link will be up?

> The "MT7621 Giga Switch Programming Guide v0.3", "MT7531 Reference Manual
> for Development Board v1.0", and "MT7988A Wi-Fi 7 Generation Router
> Platform: Datasheet (Open Version) v0.1" documents show that these bits a=
re
> enabled at reset:
>=20
> PMCR_IFG_XMIT(1) (not part of PMCR_LINK_SETTINGS_MASK)
> PMCR_MAC_MODE (not part of PMCR_LINK_SETTINGS_MASK)
> PMCR_TX_EN
> PMCR_RX_EN
> PMCR_BACKOFF_EN (not part of PMCR_LINK_SETTINGS_MASK)
> PMCR_BACKPR_EN (not part of PMCR_LINK_SETTINGS_MASK)
> PMCR_TX_FC_EN
> PMCR_RX_FC_EN
>=20
> These bits also don't exist on the MT7530_PMCR_P(6) register of the switch
> on the MT7988 SoC:
>=20
> PMCR_IFG_XMIT()
> PMCR_MAC_MODE
> PMCR_BACKOFF_EN
> PMCR_BACKPR_EN
>=20
> Remove the setting of the bits not part of PMCR_LINK_SETTINGS_MASK on
> phylink_mac_config as they're already set.

This should be a separate change.

> Suggested-by: Vladimir Oltean <olteanv@gmail.com>
> Signed-off-by: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>

> @@ -2257,6 +2255,12 @@ mt7530_setup(struct dsa_switch *ds)
>  	mt7530_mib_reset(ds);
> =20
>  	for (i =3D 0; i < MT7530_NUM_PORTS; i++) {
> +		/* Clear link settings and enable force mode to force link down

"Clear link settings to force link down" makes sense.
Since I don't know what the mode is, the "and enable force mode"
sounds possibly out of place. If you're only combining this
for the convenience of RMW, keep the reasoning separate.

