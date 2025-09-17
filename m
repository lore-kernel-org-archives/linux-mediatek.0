Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BCAFCA0EE8
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Sep 2025 10:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Yyh8Hkqs7GqsXIM+okxGaGUnlxOgHFmx9rSotm4MB8=; b=OfLeUH60eFkllR3SKxWQtwxLrq
	mYqP31wLyKOkGz6yRUbQgsSiYar7v1H+hmcmR+iLjxL+Kqy63uWAC5MYP38ZU+jSLKbioxNitd6p5
	JwG13jJ90y+avwdl8yAS36/2RJ5F7M60c9G6tG0Tqe8xgOCptH92xJpjhWb6zL7LqVEvRhUln3C0x
	VXzPDZV/Dc7ohNcCdx0oe8rElUOh9USjutwiY3310H4so8o6vCT95fwSLC8yDf0+pggMY+yA7PXCz
	YjW+qXRs5MG6IE54JMlBupl5oL6gW3CkhtkERHxUFLgW8C2eN1GdeH/C6Uam8uHPvAD0P/eiAJuWl
	AD7hraLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uypdN-0000000B1dP-3A24;
	Wed, 17 Sep 2025 10:43:33 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uypdK-0000000B1cM-3B8Q
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Sep 2025 10:43:32 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-b046d1cd1fdso129468566b.2
        for <linux-mediatek@lists.infradead.org>; Wed, 17 Sep 2025 03:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758105809; x=1758710609; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3Yyh8Hkqs7GqsXIM+okxGaGUnlxOgHFmx9rSotm4MB8=;
        b=jhw1PoeBza1b8+1CdUUhkCl8zf0ricbyVBEiYShek5PbblAhxnZldOKMSSku6W/jJO
         IzMbmE54LLvSugkClGBe/XM2lARFSBTI724oPLUWhheECkwrZUzXDXRdZ/frTd4Z/xQ1
         bFuXvypN0WMWX+RgbyTDzvVB4KmuWk55p5O4Nr7SsDVWs2PzFI3ki4MPB2ee7uz6YvxA
         G2VcG2K6Jevh0TH8Kn+C6aIlY3tnMKjjLteSgiN5QLEEJf7+gNgoZUORuyzd1uTLqiWN
         P/sSr3qrOxs0oISOHmv8VcLfwEJEPoubZuvx95hMhn9hFvmQMEA/7cnDcqUtXCWO2n1x
         DNCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758105809; x=1758710609;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Yyh8Hkqs7GqsXIM+okxGaGUnlxOgHFmx9rSotm4MB8=;
        b=vqsoO9bM2oU7TQPN4nfacRmgUQEJb9xp9lxu24931S1eRYA4cBoDzyrDt/Fbz2lcE3
         pqUj5VkkqzpPz0pbCb9lurdiXfCQn6KwMxDV5ss2Z3aS1Q8Cb+oqvk9aaqk0yHw9ZCXy
         3CgPXGfajF0rahLnM8+QcXDEGJc2+9Q5Bd+jCV5Yo+ymopF87CvFx+ntWVK069kCkChT
         KBfXg/0x3sRuMepQ1dQSRfO3j6jJq8fS/46AdzgSPCdtVQ9VV1NrlOUI7rhl+9BnJQwo
         saaH2LmgYmRdS/DGcAqACE+T/S8WU+p1bB5x2JL9Ie+7Qg7LYweze7o9kyHMrE0szfQo
         UvcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhdoEytdOAQb1Eogv7eW4BS65TZHwLxreAi2OsIb+gwddXe0TmeyginxuMY+TJ085iYtRieBLvRKLvi4osuw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxAhYaixYfuTImi79IqNVYRf5DxJB7C6NG8NBHVg3d5Aqx6rhJo
	r1bfLcAi8KoZrsMFQPcwTX9FLxeUwTYgB85/5iooHOZBXp9Iry0DZc3F
X-Gm-Gg: ASbGncu91qJlMSqo8X9GU53CQ1hf/yfFu987qDmT6iOsSfJmGTuuom2QCZCguNOqu5h
	D/zMZnJweoe/TArpUoRsF4hmQGbOREb/Yjr0OKn0HqsXGVSa54qhHUwP0qYGkRbNnTHuwIad4eI
	ggX/3Xu/Ma6Iiv7il8dtX/BJpI9wo2CeNz3uw9kJ/LzVRy5U06OISSjwSaPLwlg63IXMOl1Tbf2
	r5iDhz8TDYF9Mq/ZM5yxrVHoyiCt908oEYPXsGgUsTN4WVPSZaW6UQuZ8/Txt3DUzTIO2FjtDWx
	cqY4DqUA+nb2vaj9jMGdOuwTaiWGXoVyIVEwxnY9YZxVwqlaoB53ncNAs4CC6oFo4AJ07/Opo8v
	05sQzdbHOO7Nps3Q=
X-Google-Smtp-Source: AGHT+IF0bGu8coGo8S13flYMunWY6PoCzFUDuD7l8SY41Vuc7seAVPH3vRAusBx3pRQ3RA9KkKbEpA==
X-Received: by 2002:a17:907:7e93:b0:b04:669f:e70f with SMTP id a640c23a62f3a-b1bb7f2a4f5mr112464766b.2.1758105808719;
        Wed, 17 Sep 2025 03:43:28 -0700 (PDT)
Received: from skbuf ([2a02:2f04:d005:3b00:8bcc:b603:fee7:a273])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07c6110c27sm1132722066b.66.2025.09.17.03.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 03:43:28 -0700 (PDT)
Date: Wed, 17 Sep 2025 13:43:25 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [net-next PATCH v18 5/8] net: dsa: Add Airoha AN8855 5-Port
 Gigabit DSA Switch driver
Message-ID: <20250917104325.j5je2jtachee7thw@skbuf>
References: <20250915104545.1742-1-ansuelsmth@gmail.com>
 <20250915104545.1742-6-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915104545.1742-6-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_034330_845855_656664A1 
X-CRM114-Status: GOOD (  17.84  )
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

On Mon, Sep 15, 2025 at 12:45:41PM +0200, Christian Marangi wrote:
> +static const struct an8855_mib_desc an8855_mib[] = {
> +	MIB_DESC(1, AN8855_PORT_MIB_TX_DROP, "TxDrop"),
> +	MIB_DESC(1, AN8855_PORT_MIB_TX_CRC_ERR, "TxCrcErr"),
> +	MIB_DESC(1, AN8855_PORT_MIB_TX_COLLISION, "TxCollision"),
> +	MIB_DESC(1, AN8855_PORT_MIB_TX_OVERSIZE_DROP, "TxOversizeDrop"),
> +	MIB_DESC(2, AN8855_PORT_MIB_TX_BAD_PKT_BYTES, "TxBadPktBytes"),
> +	MIB_DESC(1, AN8855_PORT_MIB_RX_DROP, "RxDrop"),
> +	MIB_DESC(1, AN8855_PORT_MIB_RX_FILTERING, "RxFiltering"),
> +	MIB_DESC(1, AN8855_PORT_MIB_RX_CRC_ERR, "RxCrcErr"),
> +	MIB_DESC(1, AN8855_PORT_MIB_RX_CTRL_DROP, "RxCtrlDrop"),
> +	MIB_DESC(1, AN8855_PORT_MIB_RX_INGRESS_DROP, "RxIngressDrop"),
> +	MIB_DESC(1, AN8855_PORT_MIB_RX_ARL_DROP, "RxArlDrop"),
> +	MIB_DESC(1, AN8855_PORT_MIB_FLOW_CONTROL_DROP, "FlowControlDrop"),
> +	MIB_DESC(1, AN8855_PORT_MIB_WRED_DROP, "WredDrop"),
> +	MIB_DESC(1, AN8855_PORT_MIB_MIRROR_DROP, "MirrorDrop"),
> +	MIB_DESC(2, AN8855_PORT_MIB_RX_BAD_PKT_BYTES, "RxBadPktBytes"),
> +	MIB_DESC(1, AN8855_PORT_MIB_RXS_FLOW_SAMPLING_PKT_DROP, "RxsFlowSamplingPktDrop"),
> +	MIB_DESC(1, AN8855_PORT_MIB_RXS_FLOW_TOTAL_PKT_DROP, "RxsFlowTotalPktDrop"),
> +	MIB_DESC(1, AN8855_PORT_MIB_PORT_CONTROL_DROP, "PortControlDrop"),
> +};
> +
> +static int
> +an8855_mib_init(struct an8855_priv *priv)
> +{
> +	int ret;
> +
> +	ret = regmap_write(priv->regmap, AN8855_MIB_CCR,
> +			   AN8855_CCR_MIB_ENABLE);
> +	if (ret)
> +		return ret;
> +
> +	return regmap_write(priv->regmap, AN8855_MIB_CCR,
> +			    AN8855_CCR_MIB_ACTIVATE);
> +}
> +
> +static void an8855_get_strings(struct dsa_switch *ds, int port,
> +			       u32 stringset, uint8_t *data)
> +{
> +	int i;
> +
> +	if (stringset != ETH_SS_STATS)
> +		return;
> +
> +	for (i = 0; i < ARRAY_SIZE(an8855_mib); i++)
> +		ethtool_puts(&data, an8855_mib[i].name);

Same feedback as for yt921x. For new drivers we want in unstructured
ethtool -S only those statistics which are not exposed through standard
variants (to force the adoption of the new interfaces).

> +}
> +
> +static void an8855_read_port_stats(struct an8855_priv *priv, int port,
> +				   u32 offset, u8 size, uint64_t *data)
> +{
> +	u32 val, reg = AN8855_PORT_MIB_COUNTER(port) + offset;
> +
> +	regmap_read(priv->regmap, reg, &val);
> +	*data = val;
> +
> +	if (size == 2) {
> +		regmap_read(priv->regmap, reg + 4, &val);
> +		*data |= (u64)val << 32;
> +	}
> +}
> +
> +static void an8855_get_ethtool_stats(struct dsa_switch *ds, int port,
> +				     uint64_t *data)
> +{
> +	struct an8855_priv *priv = ds->priv;
> +	const struct an8855_mib_desc *mib;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(an8855_mib); i++) {
> +		mib = &an8855_mib[i];
> +
> +		an8855_read_port_stats(priv, port, mib->offset, mib->size,
> +				       data + i);
> +	}
> +}
> +
> +static int an8855_get_sset_count(struct dsa_switch *ds, int port,
> +				 int sset)
> +{
> +	if (sset != ETH_SS_STATS)
> +		return 0;
> +
> +	return ARRAY_SIZE(an8855_mib);
> +}
> +
> +static void an8855_get_eth_mac_stats(struct dsa_switch *ds, int port,
> +				     struct ethtool_eth_mac_stats *mac_stats)
> +{
> +	struct an8855_priv *priv = ds->priv;
> +
> +	/* MIB counter doesn't provide a FramesTransmittedOK but instead
> +	 * provide stats for Unicast, Broadcast and Multicast frames separately.
> +	 * To simulate a global frame counter, read Unicast and addition Multicast
> +	 * and Broadcast later
> +	 */
> +	an8855_read_port_stats(priv, port, AN8855_PORT_MIB_TX_UNICAST, 1,
> +			       &mac_stats->FramesTransmittedOK);
> +
> +	an8855_read_port_stats(priv, port, AN8855_PORT_MIB_TX_SINGLE_COLLISION, 1,
> +			       &mac_stats->SingleCollisionFrames);
> +
> +	an8855_read_port_stats(priv, port, AN8855_PORT_MIB_TX_MULTIPLE_COLLISION, 1,
> +			       &mac_stats->MultipleCollisionFrames);
> +
> +	an8855_read_port_stats(priv, port, AN8855_PORT_MIB_RX_UNICAST, 1,
> +			       &mac_stats->FramesReceivedOK);
> +
> +	an8855_read_port_stats(priv, port, AN8855_PORT_MIB_TX_BYTES, 2,
> +			       &mac_stats->OctetsTransmittedOK);
> +
> +	an8855_read_port_stats(priv, port, AN8855_PORT_MIB_RX_ALIGN_ERR, 1,
> +			       &mac_stats->AlignmentErrors);
> +
> +	an8855_read_port_stats(priv, port, AN8855_PORT_MIB_TX_DEFERRED, 1,
> +			       &mac_stats->FramesWithDeferredXmissions);
> +
> +	an8855_read_port_stats(priv, port, AN8855_PORT_MIB_TX_LATE_COLLISION, 1,
> +			       &mac_stats->LateCollisions);
> +
> +	an8855_read_port_stats(priv, port, AN8855_PORT_MIB_TX_EXCESSIVE_COLLISION, 1,
> +			       &mac_stats->FramesAbortedDueToXSColls);
> +
> +	an8855_read_port_stats(priv, port, AN8855_PORT_MIB_RX_BYTES, 2,
> +			       &mac_stats->OctetsReceivedOK);
> +
> +	an8855_read_port_stats(priv, port, AN8855_PORT_MIB_TX_MULTICAST, 1,
> +			       &mac_stats->MulticastFramesXmittedOK);
> +	mac_stats->FramesTransmittedOK += mac_stats->MulticastFramesXmittedOK;
> +	an8855_read_port_stats(priv, port, AN8855_PORT_MIB_TX_BROADCAST, 1,
> +			       &mac_stats->BroadcastFramesXmittedOK);
> +	mac_stats->FramesTransmittedOK += mac_stats->BroadcastFramesXmittedOK;
> +
> +	an8855_read_port_stats(priv, port, AN8855_PORT_MIB_RX_MULTICAST, 1,
> +			       &mac_stats->MulticastFramesReceivedOK);
> +	mac_stats->FramesReceivedOK += mac_stats->MulticastFramesReceivedOK;
> +	an8855_read_port_stats(priv, port, AN8855_PORT_MIB_RX_BROADCAST, 1,
> +			       &mac_stats->BroadcastFramesReceivedOK);
> +	mac_stats->FramesReceivedOK += mac_stats->BroadcastFramesReceivedOK;
> +}
> +
> +static const struct ethtool_rmon_hist_range an8855_rmon_ranges[] = {
> +	{ 0, 64 },
> +	{ 65, 127 },
> +	{ 128, 255 },
> +	{ 256, 511 },
> +	{ 512, 1023 },
> +	{ 1024, 1518 },
> +	{ 1519, AN8855_MAX_MTU },
> +	{}
> +};
> +
> +static void an8855_get_rmon_stats(struct dsa_switch *ds, int port,
> +				  struct ethtool_rmon_stats *rmon_stats,
> +				  const struct ethtool_rmon_hist_range **ranges)
> +{
> +	struct an8855_priv *priv = ds->priv;
> +
> +	an8855_read_port_stats(priv, port, AN8855_PORT_MIB_RX_UNDER_SIZE_ERR, 1,
> +			       &rmon_stats->undersize_pkts);
> +	an8855_read_port_stats(priv, port, AN8855_PORT_MIB_RX_OVER_SZ_ERR, 1,
> +			       &rmon_stats->oversize_pkts);
> +	an8855_read_port_stats(priv, port, AN8855_PORT_MIB_RX_FRAG_ERR, 1,
> +			       &rmon_stats->fragments);
> +	an8855_read_port_stats(priv, port, AN8855_PORT_MIB_RX_JABBER_ERR, 1,
> +			       &rmon_stats->jabbers);
> +
> +	an8855_read_port_stats(priv, port, AN8855_PORT_MIB_RX_PKT_SZ_64, 1,
> +			       &rmon_stats->hist[0]);
> +	an8855_read_port_stats(priv, port, AN8855_PORT_MIB_RX_PKT_SZ_65_TO_127, 1,
> +			       &rmon_stats->hist[1]);
> +	an8855_read_port_stats(priv, port, AN8855_PORT_MIB_RX_PKT_SZ_128_TO_255, 1,
> +			       &rmon_stats->hist[2]);
> +	an8855_read_port_stats(priv, port, AN8855_PORT_MIB_RX_PKT_SZ_256_TO_511, 1,
> +			       &rmon_stats->hist[3]);
> +	an8855_read_port_stats(priv, port, AN8855_PORT_MIB_RX_PKT_SZ_512_TO_1023, 1,
> +			       &rmon_stats->hist[4]);
> +	an8855_read_port_stats(priv, port, AN8855_PORT_MIB_RX_PKT_SZ_1024_TO_1518, 1,
> +			       &rmon_stats->hist[5]);
> +	an8855_read_port_stats(priv, port, AN8855_PORT_MIB_RX_PKT_SZ_1519_TO_MAX, 1,
> +			       &rmon_stats->hist[6]);
> +
> +	an8855_read_port_stats(priv, port, AN8855_PORT_MIB_TX_PKT_SZ_64, 1,
> +			       &rmon_stats->hist_tx[0]);
> +	an8855_read_port_stats(priv, port, AN8855_PORT_MIB_TX_PKT_SZ_65_TO_127, 1,
> +			       &rmon_stats->hist_tx[1]);
> +	an8855_read_port_stats(priv, port, AN8855_PORT_MIB_TX_PKT_SZ_128_TO_255, 1,
> +			       &rmon_stats->hist_tx[2]);
> +	an8855_read_port_stats(priv, port, AN8855_PORT_MIB_TX_PKT_SZ_256_TO_511, 1,
> +			       &rmon_stats->hist_tx[3]);
> +	an8855_read_port_stats(priv, port, AN8855_PORT_MIB_TX_PKT_SZ_512_TO_1023, 1,
> +			       &rmon_stats->hist_tx[4]);
> +	an8855_read_port_stats(priv, port, AN8855_PORT_MIB_TX_PKT_SZ_1024_TO_1518, 1,
> +			       &rmon_stats->hist_tx[5]);
> +	an8855_read_port_stats(priv, port, AN8855_PORT_MIB_TX_PKT_SZ_1519_TO_MAX, 1,
> +			       &rmon_stats->hist_tx[6]);
> +
> +	*ranges = an8855_rmon_ranges;
> +}
> +
> +static void an8855_get_eth_ctrl_stats(struct dsa_switch *ds, int port,
> +				      struct ethtool_eth_ctrl_stats *ctrl_stats)
> +{
> +	struct an8855_priv *priv = ds->priv;
> +
> +	an8855_read_port_stats(priv, port, AN8855_PORT_MIB_TX_PAUSE, 1,
> +			       &ctrl_stats->MACControlFramesTransmitted);
> +
> +	an8855_read_port_stats(priv, port, AN8855_PORT_MIB_RX_PAUSE, 1,
> +			       &ctrl_stats->MACControlFramesReceived);
> +}

