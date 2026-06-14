Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C76FCD98D2
	for <linux-mediatek@archiver.kernel.org>; Sun, 14 Jun 2026 04:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=q49mRONNBYR0JeB0FoFSRUEZksnbOzysOYCNAb9xxlY=; b=SXP2+J4NOt7iBQmuV4kEeAmXix
	beSoXhPJ4fJ3mdhfmF6oU1f4xrJNQNO9QhuZMaLG5rbu2gsZDtN78+7a2cXnR3OBiZySRmwKTN2IQ
	cHTmYvkVoBf8IIkGHqwwToFlwfWziGrrRN/dTWczqkfKS0f5sOOP5EQMjOmJWR+S4R6UCRRBIKEMz
	sfN9EseAyp62PXoMx666+1nXvHqzUkN3FB2Guc0RgWd0UlWlc57KfcZ5XBa9gFv9neZ+tRHnxdM2s
	IEkPJ5SOff3P93oSu0qRh5Bf9XwxR5tS+D7/N3IWskzUq5Gm4srX1LfN0HWvbiHO/Fm6eUCZqUcWv
	uNRjv7lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYc1u-0000000ChzK-2zaz;
	Sun, 14 Jun 2026 04:01:02 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYc1s-0000000ChyH-0mda
	for linux-mediatek@lists.infradead.org;
	Sun, 14 Jun 2026 04:01:01 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-36bb3551f6eso1895378a91.1
        for <linux-mediatek@lists.infradead.org>; Sat, 13 Jun 2026 21:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781409658; x=1782014458; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q49mRONNBYR0JeB0FoFSRUEZksnbOzysOYCNAb9xxlY=;
        b=qCCnUIQmRRvrqOKUHGMCbTCU3HJ3xeqwfxawI0tQetV0TsWSGOkBnHaFJrJ9m5GVen
         vdQvR+SAco+HgWphGe2/k2SqgVEKU97TPimurDMZy/UyMZm/W4xpCrGZBMbj26zrwW4N
         Pr4UyNdKDlYj6DikbC9Laivj+rIbSQeatAiVLYU71pBfFQsCUbrfCbZs9Nl/NNmhhHSy
         xe1eA3bKMGM5pLjiFhADssRY7GATRXZr12G+oRjXOYAOfYUSL0new2PhWD+ICZVTCKIB
         Dtc7IDG9IWJbs+lDFPvUhzZS7GkqInS2z1VfxZdkINAmXKII3LwjN39GknSAdpuKNDOt
         L5Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781409658; x=1782014458;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q49mRONNBYR0JeB0FoFSRUEZksnbOzysOYCNAb9xxlY=;
        b=MCdzk57CGviK98h9+SoaG6hkn2G1irND9wsmvNOVZJOwqM5nQcWH196dWZmDq3dK4r
         w6l5ky//UVMBgTN7adqBPQXNYLw3n2FAiL88PF8hieE9om52XIf0wY6fN0CxeiT7o7oi
         WWftb/lFrr2QX2axU3O3lL4AReLkCGzPq40PnSvSoOVb5O3bcXUtO+BMbaSIGFCWNAVQ
         ESEhjvoyHFtPFYARXJjvOXa+89EZByxqyFEkaddiIBAV0Sdd4v0ytonTxM3/UiqhObbo
         Ayv3ubC5XSmSw55O8P5pqriTmVeyGdrA2nsg3l6wJ0zOl2geWh36UJnJvTtErjXhd/ZI
         ohtg==
X-Forwarded-Encrypted: i=1; AFNElJ9Oyr2kAym6yY8pR/Q4E6cgIJHFJSH7ozAVfD7HWG3UkB6RFARgquAfbkX2ny5l3zg8/dgY665G9drtBEJuEA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2y7/wHMUTrSMk0U4I44XDUKrJZLUFHX8ijmVDh2RT0zbxqzJ7
	Fz+fKxUjBlDlnm9DCXXDhEc+GeZNUXwxsifPmviYG9MtHVQBbwjfhGr9
X-Gm-Gg: Acq92OER02cGBnOY/MfC+7fRZCzebumP65QLSVmOgQh7bh2h+BZaJpDqNkK9uIlYcK9
	nPATU12/umSCGnoLN31ihIikFBoaZ1XhitRwU5QYOry2dto0nAziWwzRSeLnekyucmb8F+B7ygp
	+ogAdDq3ZxVPt+CgQFDLBGAUz/fW8B4C/Q9ufVMnDJWkS6KDMkrvZFfGc/FnqgXKvz/sw1D5HIy
	OPGPYxGCpAnEudgoEgKgoUple6jCGDPw1wBVc1qDQPSMI9l29hmHdUMSHWRD8pdHQVQXRHU6GKa
	y2FX1pWvAehx6qfojxtf7kO4Gy6NcR1XNVCVXWyG5rEN6G478LI2UCaahPjKl3599hzMhhTLu8N
	yXBIOad938QvKqamTzgc/PxHfnMkQa9gUEHkraUBZWmH2lBIGMd459Gt5ru0BExvV9iSuncqeP1
	bmXjL87Y4zoK2B8Rb2Aog/FvQXJPjELg==
X-Received: by 2002:a17:90b:5588:b0:367:d850:6a5f with SMTP id 98e67ed59e1d1-37c2bd79bc6mr5257855a91.25.1781409658385;
        Sat, 13 Jun 2026 21:00:58 -0700 (PDT)
Received: from mincom1 ([115.4.79.42])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8661a67603sm5676983a12.0.2026.06.13.21.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 21:00:57 -0700 (PDT)
From: Jihong Min <hurryman2212@gmail.com>
To: netdev@vger.kernel.org,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Simon Horman <horms@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Steffen Klassert <steffen.klassert@secunet.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Christian Marangi <ansuelsmth@gmail.com>,
	Felix Fietkau <nbd@nbd.name>,
	linux-kernel@vger.kernel.org,
	Jihong Min <hurryman2212@gmail.com>
Subject: [RFC PATCH net-next 0/7] net: airoha: add EN7581 SOE ESP packet offload
Date: Sun, 14 Jun 2026 13:00:25 +0900
Message-ID: <20260614040032.1567994-1-hurryman2212@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_210100_231334_6B539DE2 
X-CRM114-Status: GOOD (  13.40  )
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

Add Secure Offload Engine (SOE) support for the Airoha EN7581 Ethernet
driver. SOE provides inline ESP packet offload for native ESP and NAT-T
traffic, with the Ethernet/QDMA path used to submit packets to the SOE
block and the PPE path used to bind eligible ESP flows. NETIF_F_GSO_ESP
and NETIF_F_HW_ESP_TX_CSUM are intentionally left out for now and will be
revisited separately for feasibility.

This is posted as RFC because the code was originally developed and tested
against an OpenWrt 6.18 Airoha tree, not against the current upstream
net-next driver. The original OpenWrt commit used as the source for this
RFC is available at:
https://github.com/hurryman2212/OpenW1700k-test/commit/7c1b5e662f7790b3d23ed143beadc1dcbf6d15f7

The SOE part is intentionally linked into the airoha Ethernet module
instead of being exposed as an independent crypto or platform driver. The
user-visible ESP offload control is a netdev capability: xfrmdev_ops and
NETIF_F_HW_ESP live on the target netdev, and the feature can be controlled
through the usual netdev feature path. SOE also shares the FE/QDMA/PPE
datapath, private queues, DSA conduit handling and netdev lifetime owned by
airoha_eth.

Patch 1 adds xdo_dev_packet_xmit() because the existing XFRM packet
offload transmit path does not provide a hook for hardware whose ESP engine
is reached through device-specific packet forwarding. SOE needs to consume
the skb, add a hardware hop descriptor, steer it to a private QDMA path and
return the final transmit status. Drivers that do not implement the
optional callback keep the existing XFRM output behavior.

Jihong Min (7):
  xfrm: allow packet offload drivers to own transmit
  dt-bindings: net: airoha: add EN7581 SOE
  arm64: dts: airoha: add EN7581 SOE node
  net: airoha: add SOE registers and driver state
  net: airoha: add QDMA support for SOE packets
  net: airoha: add PPE support for SOE flows
  net: airoha: add SOE XFRM packet offload support

 .../bindings/net/airoha,en7581-soe.yaml       |   48 +
 MAINTAINERS                                   |    1 +
 arch/arm64/boot/dts/airoha/en7581.dtsi        |    6 +
 drivers/net/ethernet/airoha/Kconfig           |   13 +
 drivers/net/ethernet/airoha/Makefile          |    1 +
 drivers/net/ethernet/airoha/airoha_eth.c      |  668 +++++-
 drivers/net/ethernet/airoha/airoha_eth.h      |   40 +
 drivers/net/ethernet/airoha/airoha_ppe.c      |  606 +++++-
 drivers/net/ethernet/airoha/airoha_regs.h     |   16 +
 drivers/net/ethernet/airoha/airoha_soe.c      | 1896 +++++++++++++++++
 drivers/net/ethernet/airoha/airoha_soe.h      |  126 ++
 include/linux/netdevice.h                     |    8 +
 include/linux/soc/airoha/airoha_offload.h     |    5 +
 net/xfrm/xfrm_output.c                        |   11 +
 14 files changed, 3342 insertions(+), 103 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/airoha,en7581-soe.yaml
 create mode 100644 drivers/net/ethernet/airoha/airoha_soe.c
 create mode 100644 drivers/net/ethernet/airoha/airoha_soe.h

-- 
2.53.0

