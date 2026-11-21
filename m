Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81EA6606A336
	for <linux-mediatek@archiver.kernel.org>; Sat, 21 Nov 2026 23:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qI7KI3Vf;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Igh8pVAZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fM/qA6/4U7l7719+XpQdyjrMAl2GxPV3Jko7fpcHllc=; b=qI7KI3VfnX9b1j
	pPQmWYUgdzXIY6iDJl3pI5r7rDd8ewQ97VVlzzZSUF0YUdZhObccClEwMavsMOKXyDZr9M82g3PpX
	WEmveJzLNpYWVBJCwOAylOwUWVCEznUrRDdpH4M9LAjzThLZo9cu/NAXPNYmtgXdLwhc4bxvSELbP
	NoppWy9BBeWPhfqnxzXC75y6IhhJySPgUIpp9UYXhBwdiL2l3L8wUSCneMI/tiEnFEqKWdYu/r/4E
	QKuKfkpDNXl5KP0zD97G54iEcfW9TDYFRlVL4mFuARagU7uXzP1NeD0zx4gW9lvEhc5QCHaH2sKU4
	JsbfrlWl2NgxzqLJC6Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUuU2-00000000Tnc-12KM;
	Sat, 21 Nov 2026 23:27:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUuTn-00000000TiG-3dmt;
	Sat, 21 Nov 2026 23:26:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9EB9C45032;
	Sat, 21 Nov 2026 23:26:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3BC71F000CF;
	Sat, 21 Nov 2026 23:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795303607;
	bh=fM/qA6/4U7l7719+XpQdyjrMAl2GxPV3Jko7fpcHllc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Igh8pVAZZm5rdiOR9KwRNVyTpTIf0iPk/SmyuhzdzS4PWrLqcA4mf3lAshs0dGXv4
	 qIEG3zxFmac4IuESiWfOEn+zL0CljFNxEzdokWeoAbHw+8cBg/L1UmXkcVytlSNlZx
	 BM4/D5qEE2lQ8JFXHAn3RiCgB/jCjiH8Eks08ia3CVIJ5AmjiZdul+z14sew2TSeRI
	 u5jwPAPgIu8hOfBv2MfNHUqj4NGh/Rpu8kCiJqPW/wLXxTr1cigP+jVZ0Pk6KWR7Jv
	 RcN/y6ydFTxOWS4aLEJ5lZVhZ6TGB6JiggF7croio+2iH6td/ULJduKBQ/DC+aDrWE
	 ytQdfaAjIOCPA==
From: Jakub Kicinski <kuba@kernel.org>
To: ansuelsmth@gmail.com
Cc: Jakub Kicinski <kuba@kernel.org>,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	horms@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	lorenzo@kernel.org,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	maxime.chevallier@bootlin.com,
	p.zabel@pengutronix.de,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com,
	rmk+kernel@armlinux.org.uk,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev,
	zhengping.zhang@airoha.com
Subject: Re: [PATCH net-next v22 03/15] net: phylink: introduce internal phylink PCS handling
Date: Sat, 21 Nov 2026 15:26:43 -0800
Message-ID: <20261121232643.1365333-1-kuba@kernel.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261117123956.11981-4-ansuelsmth@gmail.com>
References: <20261117123956.11981-4-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
---
net: phylink: introduce internal phylink PCS handling

This adds an alternative to .mac_select_pcs. The MAC hands phylink a list
of PCS through .fill_available_pcs and .num_possible_pcs, and phylink
picks a PCS by matching the interface against each PCS's
supported_interfaces. A new pcs_interfaces mask in phylink_config marks
the modes that need a dedicated PCS, and phylink_create() widens
pl->supported_interfaces with the supported_interfaces of every listed
PCS.

> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index f482dc6088102..e8ba906cfba68 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c

[ ... ]

> @@ -2096,16 +2220,31 @@ struct phylink *phylink_create(struct phylink_config *config,
>  	__set_bit(PHYLINK_DISABLE_STOPPED, &pl->phylink_disable_state);
>  	timer_setup(&pl->link_poll, phylink_fixed_poll, 0);
>  
> +	/* Fill the PCS list with available PCS from phylink config */
> +	ret = phylink_fill_available_pcs(pl, config);
> +	if (ret < 0)
> +		goto free_pl;
> +
> +	/* Link available PCS to phylink */
> +	list_for_each_entry(pcs, &pl->pcs_list, list)
> +		rcu_assign_pointer(pcs->phylink, pl);
> +
>  	phy_interface_copy(pl->supported_interfaces,
>  			   pl->config->supported_interfaces);
>  
> +	/* Update supported interfaces */
> +	list_for_each_entry(pcs, &pl->pcs_list, list)
> +		phy_interface_or(pl->supported_interfaces,
> +				 pl->supported_interfaces,
> +				 pcs->supported_interfaces);
> +

[Severity: Medium]

Can this OR put modes into pl->supported_interfaces that phylink will
never select a PCS for?

The PCS modes are not masked with config->pcs_interfaces. However, the
PCS lookup this patch adds only runs when the interface is in
pcs_interfaces. The check in phylink_validate_mac_and_pcs(),
phylink_inband_caps() and phylink_major_config() is:

	} else if (test_bit(state->interface, pl->config->pcs_interfaces)) {

Suppose a listed PCS advertises a mode that is not in pcs_interfaces.
__phylink_validate() accepts that mode after checking only the MAC
capabilities.

SFP interface selection uses the same widened mask. It also ends up in
the SFP PHY's host_interfaces through phylink_sfp_connect_phy():

	phy_interface_and(phy->host_interfaces, phylink_sfp_interfaces,
			  pl->supported_interfaces);

If that mode is then picked, phylink_major_config() skips the PCS list
branch and pcs stays NULL:

	pcs_changed = pl->pcs != pcs;
	...
	if (pcs_changed) {
		phylink_pcs_disable(pl->pcs);
		...
		WRITE_ONCE(pl->pcs, pcs);
	}

So the active PCS is disabled and pl->pcs becomes NULL. mac_config() is
then called for a mode the MAC never listed in
config->supported_interfaces. No PCS is programmed for that mode.

The "couldn't find a PCS for %s" error is not printed either, because it
is only reached inside the pcs_interfaces branch.

The Documentation/networking/pcs.rst added later in the series describes
supported_interfaces as holding every MAC mode. It describes
pcs_interfaces as the subset that needs a PCS ("PCS required only for
USXGMII").

Under that model the OR either adds nothing new, or it adds modes outside
pcs_interfaces that never get a PCS. One example is a USXGMII PCS that
also supports 10GBASER, 2500BASEX and 1000BASEX, such as the Airoha PCS
added later in the series.

The airoha user in the series does not hit this, because it copies
supported_interfaces into pcs_interfaces. The final state of the series
still has the unmasked OR in both phylink_create() and
pcs_provider_notify().

Should the OR be limited to config->pcs_interfaces? Alternatively, should
phylink_create() reject a PCS mode that is not in pcs_interfaces?

phylink_create() also does not check that the new fields are consistent:

- It accepts num_possible_pcs with an empty pcs_interfaces. In that case
  the listed PCS are never selected.
- It accepts pcs_interfaces together with .mac_select_pcs. In that case
  pcs_interfaces is silently ignored.

Would it make sense to reject these combinations here?

Separately, the kernel-doc for @supported_interfaces ("supported by the
MAC/PCS") and @pcs_interfaces ("dedicated PCS is required") in
include/linux/phylink.h does not match how phylink combines the two
masks.

