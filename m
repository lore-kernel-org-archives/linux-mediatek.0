Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E36B606A320
	for <linux-mediatek@archiver.kernel.org>; Sat, 21 Nov 2026 23:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=guDefusT;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VpBjouCj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=uNHo+Sfo4SO6w4MKR8YizO7/Dz3BQ3/Jvkiq3N5ai4Y=; b=guDefusTRN3J3L
	NMohSeUA+ldaAgjo75osWYemG3R7i2hZE9RoWhIJXOornssw3QspcXYfLPbX/AUR+iiFtmoYN8kTx
	Axqzk3V6SM3kuUBGR68z1sAUBxcg4mowsU9Mu6hUbn4hC1m519g90MqHsEBjyMllFET95OwytCNb4
	wclJ1C6f4yIT8xKg/CNIecUPUoD46NJdkvS9BNunKVpKhh7N9bXbsjTVlHXpRgkyVBydrpZY8X8ae
	ehlB2PUbAzwywV24Pd6uXOqve/Kck1StddKfEGVJZnXWKvmrVdzz+I+16dt5YBQ3SVM+LLSUNTT7b
	5us/5H0KlxZdWCWLvv8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUuV4-00000000UJa-3Iny;
	Sat, 21 Nov 2026 23:28:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUuTy-00000000TmM-2MDK;
	Sat, 21 Nov 2026 23:26:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5257B45971;
	Sat, 21 Nov 2026 23:26:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 638161F000E6;
	Sat, 21 Nov 2026 23:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795303618;
	bh=uNHo+Sfo4SO6w4MKR8YizO7/Dz3BQ3/Jvkiq3N5ai4Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VpBjouCjqQQeI8P4RhYDWkheQLduY2KtRgjsuneT/skyQuzN+Cm9NkbngYx/vyJiM
	 Dbef+S20RA8XkAFHAsU9ksaA8j/sCG5zW85U1NFq0MWh8X97oL1TsaCv1iFTt+RQVo
	 lsPCPanYr0ZSGw8muAC/4zCt20iLBmOl1TGD/vJC+p05bYANijE+GKcgmCUxPXetrS
	 xsjcjlkhy44JYXELUhjjES+3aWYs0MdolvWpAwqxSTl9oXmqBngsHCqd8iBT2cb9BC
	 dq7nXqV95PUR8YrBkhhv5rxUTCg7Yk94OLRfVMYqyE/V9qbq0LTj383Rl1/CDZYzL6
	 QhjMB35gwuJDA==
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
Subject: Re: [PATCH net-next v22 15/15] net: airoha: add phylink support
Date: Sat, 21 Nov 2026 15:26:56 -0800
Message-ID: <20261121232656.1365664-1-kuba@kernel.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261117123956.11981-16-ansuelsmth@gmail.com>
References: <20261117123956.11981-16-ansuelsmth@gmail.com>
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
net: airoha: add phylink support

This adds phylink support for each GDM port. GDM1 is limited to the
internal interface mode, and GDM2/3/4 use a PCS referenced through the
pcs-handle property. The ethtool link_ksettings ops now go through
phylink, and GDM4 TX/RX fragment sizes are set on link up.

> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
> index 044ad0302ef35..e41dfad58b258 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c

[ ... ]

> @@ -3752,6 +3790,155 @@ bool airoha_is_valid_gdm_dev(struct airoha_eth *eth,
>  	return false;
>  }
>  
> +/* Nothing to do in MAC, everything is handled in PCS */
> +static void airoha_mac_config(struct phylink_config *config, unsigned int mode,
> +			      const struct phylink_link_state *state)
> +{
> +}
> +
> +static void airoha_mac_link_up(struct phylink_config *config, struct phy_device *phy,
> +			       unsigned int mode, phy_interface_t interface,
> +			       int speed, int duplex, bool tx_pause, bool rx_pause)
> +{
> +	struct airoha_gdm_dev *dev = container_of(config, struct airoha_gdm_dev,
> +						  phylink_config);
> +	struct airoha_gdm_port *port = dev->port;
> +	struct airoha_eth *eth = dev->eth;
> +	u32 frag_size_tx, frag_size_rx;
> +
> +	/* TX/RX frag is configured only for GDM4 */
> +	if (port->id != AIROHA_GDM4_IDX)
> +		return;

[Severity: Medium]
Should tx_pause and rx_pause be applied somewhere in airoha_mac_link_up()?

airoha_setup_phylink() advertises MAC_ASYM_PAUSE | MAC_SYM_PAUSE on every
GDM port. However, airoha_mac_link_up() returns right away for GDM1-3 and
only writes fragment sizes for GDM4.

Nothing in drivers/net/ethernet/airoha uses tx_pause, rx_pause or
GDM_INGRESS_FC_EN_MASK.

The only flow control setup on this path is in airoha_pcs_config():

drivers/net/pcs/airoha/pcs-airoha-common.c:airoha_pcs_config() {
    ...
	/* Configure Flow Control on XFI */
	regmap_update_bits(maps->pcs_mac, AIROHA_PCS_XFI_MAC_XFI_GIB_CFG,
			   AIROHA_PCS_XFI_TX_FC_EN | AIROHA_PCS_XFI_RX_FC_EN,
			   permit_pause_to_mac ?
				AIROHA_PCS_XFI_TX_FC_EN | AIROHA_PCS_XFI_RX_FC_EN :
				0);
    ...
}

permit_pause_to_mac reflects whether pause autoneg is enabled. It is not
the result negotiated with the link partner.

With the default MLO_PAUSE_AN, XFI TX/RX flow control ends up enabled even
when the partner does not support pause. With pause forced on and autoneg
off, it ends up disabled while phylink reports pause as on.

Can the hardware flow control state differ from what phylink resolved and
reports?

Also, only get/set_link_ksettings were moved to phylink in
airoha_ethtool_ops. These are not wired up:

  get/set_pauseparam (phylink_ethtool_get/set_pauseparam())
  nway_reset (phylink_ethtool_nway_reset())
  ndo_eth_ioctl (phylink_mii_ioctl())

Is that intended, given the commit message says "now that we fully support
phylink"?

[ ... ]

> +static int airoha_setup_phylink(struct net_device *netdev)
> +{
> +	struct airoha_gdm_dev *dev = netdev_priv(netdev);
> +	struct device_node *np = netdev->dev.of_node;
> +	struct airoha_gdm_port *port = dev->port;
> +	struct phylink_config *config;
> +	phy_interface_t phy_mode;
> +	struct phylink *phylink;
> +	int err;
> +
> +	err = of_get_phy_mode(np, &phy_mode);
> +	if (err) {
> +		dev_err(&netdev->dev, "incorrect phy-mode\n");
> +		return err;
> +	}

[Severity: Medium]
Does this stop DTs that follow the current airoha,en7581-eth.yaml binding
from probing?

The binding's ^ethernet@[1-4]$ and ^ethernet@[0-5]$ patternProperties
only require reg and compatible. The binding example has no phy-mode,
fixed-link or pcs-handle. That example is ethernet@1, plus ethernet@4
with eth-port children @0 and @1.

With this patch, a missing phy-mode on any enabled GDM or eth-port node
propagates up:

airoha_probe()
  airoha_alloc_gdm_port()
    airoha_alloc_gdm_device()
      return airoha_setup_phylink(netdev);
        of_get_phy_mode() fails

airoha_probe() then runs the error_napi_stop teardown, so every port is
lost, GDM1 included. Before this patch the driver never called
of_get_phy_mode(), and such DTs probed fine.

A similar problem shows up in airoha_dev_open():

	err = phylink_of_phy_connect(dev->phylink, netdev->dev.of_node, 0);
	if (err) {
		netdev_err(netdev, "could not attach PHY: %d\n", err);
		return err;
	}

Suppose a node has phy-mode but no phy-handle, fixed-link, SFP or in-band
managed mode. Phylink is then in MLO_AN_PHY, and
phylink_fwnode_phy_connect() returns -ENODEV. Won't ndo_open now fail
where it used to succeed?

The commit message implies that GDM2/3/4 need pcs-handle. The code means
GDM1 needs phy-mode = "internal" plus fixed-link, because only
PHY_INTERFACE_MODE_INTERNAL is in supported_interfaces. The ethernet
binding describes neither. The series updates the PCS binding but not
this one.

Should airoha,en7581-eth.yaml be updated too? Alternatively, should the
driver fall back (for example to internal on GDM1) when phy-mode is
absent?

The in-tree en7581.dtsi gdm1 node already has phy-mode = "internal" and
fixed-link, so in-tree boards still work.

> +
> +	config = &dev->phylink_config;
> +	config->dev = &netdev->dev;
> +	config->type = PHYLINK_NETDEV;

[ ... ]

> +	} else {
> +		config->mac_capabilities = MAC_ASYM_PAUSE | MAC_SYM_PAUSE |
> +					   MAC_10 | MAC_100 | MAC_1000 |
> +					   MAC_2500FD | MAC_5000FD | MAC_10000FD;

[Severity: Medium]
MAC_10, MAC_100 and MAC_1000 include MAC_10HD, MAC_100HD and MAC_1000HD.
That means phylink will advertise and accept half duplex. Is half duplex
actually supported on these ports?

Nothing seems to configure duplex:

  airoha_mac_link_up() ignores its duplex argument
  airoha_pcs_link_up() never reads duplex
  the Airoha PCS get_state helpers hard code DUPLEX_FULL
  airoha_pcs_ops has no .pcs_validate to strip half duplex modes

So a PHY that links half duplex with a half-duplex-only partner would
leave the GDM/PCS running full duplex.

Separately, USXGMII is in supported_interfaces and MAC_10 is advertised.
In the out-of-band branch of airoha_pcs_link_up(), the USXGMII/10GBASE-R
speed switch has no SPEED_10 case:

drivers/net/pcs/airoha/pcs-airoha-common.c:airoha_pcs_link_up() {
    ...
		if (interface == PHY_INTERFACE_MODE_USXGMII ||
		    interface == PHY_INTERFACE_MODE_10GBASER) {
			...
			case SPEED_100:
				rate_adapt = AIROHA_PCS_HSGMII_RATE_ADPT_FORCE_RATE_ADAPT_MODE_100;
				mode = AIROHA_PCS_USXGMII_MODE_100;
				break;
			default:
				/* Not supported */
				return;
			}
    ...
	if (data->link_up)
		data->link_up(priv, port->index);

	/* BPI BMI enable */
	regmap_clear_bits(maps->pcs_mac, AIROHA_PCS_XFI_MAC_XFI_GIB_CFG,
			  AIROHA_PCS_XFI_RXMPI_STOP |
			  AIROHA_PCS_XFI_RXMBI_STOP |
			  AIROHA_PCS_XFI_TXMPI_STOP |
			  AIROHA_PCS_XFI_TXMBI_STOP);
}

When a USXGMII PHY resolves to 10M, this returns before data->link_up().
It also returns before the MPI/MBI STOP bits set by pre_config/link_down
are cleared.

Would phylink then report carrier up while the XFI datapath stays stopped
and the USXGMII mode register keeps its old speed?

> +
> +		config->num_possible_pcs = fwnode_phylink_pcs_count(dev_fwnode(config->dev));
> +		config->fill_available_pcs = airoha_fill_available_pcs;

[Severity: Low]
The commit message says:

    These needs to be defined in the GDM port node using the pcs-handle
    property.

Is that accurate? fwnode_phylink_pcs_count() returns 0 when there is no
pcs-handle, and phylink_fill_available_pcs() then returns early:

	if (!config->num_possible_pcs)
		return 0;

phylink_create() then succeeds with SGMII, 1000BASE-X, 2500BASE-X,
10GBASE-R and USXGMII in supported_interfaces but no PCS at all. There is
no error or warning.

Can the port then report carrier up from the PHY while the SerDes is
never configured? Should a missing pcs-handle on GDM2/3/4 be rejected
here?

Also, config->dev is &netdev->dev. When sub-ports exist, its of_node is
the airoha,eth-port child. So pcs-handle is read from the child node, not
from "the GDM port node".

The commit message also leaves out the new GDM4 code in
airoha_mac_link_up():

  it writes speed-dependent TX/RX fragment sizes into
  REG_FE_GDM4_TMBI_FRAG and REG_FE_GDM4_RMBI_FRAG
  it picks the SGMII1 or SGMII0 fields based on dev->nbq == 1
  it serializes the writes with the new port->link_lock mutex

Could the commit message describe this as well?

