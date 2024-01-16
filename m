Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2447FC47077
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jan 2024 17:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9HbZN4CyG8XR5HbXWl1OlbE6KwGeSWI/unoisp6ImNs=; b=Zd6P4uoDVG2//Gp7lbYul26Sja
	rN5nWErL1VxGzZDHDxUuGNsOwMhJ5NLVwfdN37ErJhTeqLlPo2YBAY3B5T3JidHsHT1Sy3aWH4Hhb
	eg7SKudXjW/Dd1s3qCMrX0GNf1jxkq8bwzp8ig8RGil/Z+/dnhBq1nKO6p1PPrhD7uWnpVwIWP/ey
	YCgC7Zv50TD9Sfzf82s5V0u26IJ1FgiDpSfYjr6fqLeyqmTfJ3F+P6qJi9smN9y+tQzTOvgn1dLfY
	VLMIrE6D/eWKGnCibtdy8xRFCrQol5SrqLbYj9L9XfrEbQYhw+phDCB1OrS1KeL7iGubnDodqEXcb
	zylHNyfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPmtJ-00ChS8-2r;
	Tue, 16 Jan 2024 17:06:21 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPmtF-00ChRI-1D;
	Tue, 16 Jan 2024 17:06:19 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 56CE41BF204;
	Tue, 16 Jan 2024 17:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1705424767;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9HbZN4CyG8XR5HbXWl1OlbE6KwGeSWI/unoisp6ImNs=;
	b=EmY52/eFthuRUhpVhsbjsK+A6rs+RHpeZUlai6n64lBUcnxrMzTld4zvurzDsEkejPiz6G
	z1DEU4qSG3V8H7LEqRqkhsXTiU4ECLRF3yxZfGi0TcBSPfPq+T2E2VB9gdSC271RsoZnpU
	spoFhfo/jlaYTHcV6CHzg4+/AFBYXxrp3w418zoK9jPV/fZxjXD2P8G84pn6CUgDbcmNRH
	R6MWmIVmfSyt+Cn2saJD1E+3OsupJkpf+r3OtdG3r6pgrdae5019MW9yoDGYUcdEuijoCP
	oR0iN5wpmGm1ZcYCFv6PvNiZq4qJl2r/xM174AtI9KRXkwWib6acok2jWKol/w==
Message-ID: <b9070fb6-4b85-441e-a863-8fe562408e48@arinc9.com>
Date: Tue, 16 Jan 2024 20:05:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH net-next 6/8] net: dsa: mt7530: simplify
 mt7530_setup_port6() and change to void
Content-Language: en-US
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Daniel Golle <daniel@makrotopia.org>,
 Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 mithat.guner@xeront.com, erkin.bozoglu@xeront.com,
 Luiz Angelo Daros de Luca <luizluca@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240113102529.80371-1-arinc.unal@arinc9.com>
 <20240113102529.80371-7-arinc.unal@arinc9.com>
 <20240115213720.vxlumsjwrjdkqxsl@skbuf>
 <7f59d9e6-1653-4a8d-910d-5922452bb9e8@arinc9.com>
 <20240116134705.mw2a2twoakw5b7jq@skbuf>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20240116134705.mw2a2twoakw5b7jq@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240116_090617_711362_0556EF36 
X-CRM114-Status: GOOD (  21.91  )
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

On 16.01.2024 16:47, Vladimir Oltean wrote:
> On Tue, Jan 16, 2024 at 04:09:18PM +0300, Arınç ÜNAL wrote:
>> Do you mean by internal port that the port does not have MII pinout? Port 6
>> of the MT7530 switch do. It is possible to have an external PHY wired to it.
> 
> Yes, this is what I meant by internal port. It seems I was wrong to
> assume it is always connected to GMAC0.
> 
> How is the selection done between internal and external wiring?

There are two variants of MT7530. One is standalone, the other comes with
the SoC as a part of the multi-chip module. More information at
mediatek,mt7530.yaml.

The standalone one is straightforward. A MAC or a PHY can be wired to the
MII pinouts of port 5 and 6 on the PCB, just as the relevant MII standard
describes.

On the MT7621 SoCs which include the switch IC, port 6 is wired to GMAC0,
port 5 is wired to GMAC1. I assume you mean internal and external wiring in
reference to this case. This is the internal wiring.

The external wiring works by wiring the PHY or MAC to the MII pinouts of
the SoC's two MACs. Since RX of the switch MAC is wired to TX of the SoC
MAC and vice versa, the external PHY or MAC must be wired TX to TX and RX
to RX. Ubiquiti EdgeRouter X SFP is wired this way. The wiring for clock
pins may need to be mirrored too, I haven't studied the RGMII specification
that much in detail. This works by not enabling the SoC MAC.

> 
> If external wiring to a PHY is possible, shouldn't the driver accept all
> 4 RGMII variants with phy_interface_mode_is_rgmii(), because the delays
> specified in "rgmii-txid", "rgmii-rxid", "rgmii-id" always pertain to
> the PHY, and thus it doesn't make sense for the MAC to not allow the use
> of the full spectrum?

Great point. I think delays are not supported on port 6. There's only the
"MT7530 Giga Switch programming guide v0.1" document mentioning setting
delays on page 8, and it's only for port 5. It is also implemented on
mt7530_setup_port5():

/* P5 RGMII RX Clock Control: delay setting for 1000M */
mt7530_write(priv, MT7530_P5RGMIIRXCR, CSR_RGMII_EDGE_ALIGN);

/* Don't set delay in DSA mode */
if (!dsa_is_dsa_port(priv->ds, 5) &&
     (interface == PHY_INTERFACE_MODE_RGMII_TXID ||
      interface == PHY_INTERFACE_MODE_RGMII_ID))
	tx_delay = 4; /* n * 0.5 ns */

/* P5 RGMII TX Clock Control: delay x */
mt7530_write(priv, MT7530_P5RGMIITXCR,
	     CSR_RGMII_TXC_CFG(0x10 + tx_delay));

There's only the TX driving mentioned for port 6 on the document. I'm
guessing port 6 was intended to connect to another TRGMII capable MAC so
delays were out of the question. TRGMII is just overclocked RGMII to
provide up to 2Gbps TX/RX, at least in theory. The whole existence of the
TRGMII interface on Linux is only being used by the MT7621 and MT7623 SoC
MACs, and port 6 MAC of the MT7530 switch.

> 
>> So it would make sense to design mt7530_setup_port6() in the sense that
>> dynamic reconfiguration is possible.
> 
> Ok, you mean to keep the dynamic reconfiguration possible rather than
> redesign to disallow it.

Very much so.

Arınç

