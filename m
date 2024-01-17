Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13553C47258
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jan 2024 10:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mVtGIgwkGXkguB4MvPhZK/Q8mhOzuHbn1l8x9D2I17U=; b=JY1fcj4T0CqKVR3NHvbkbbh7UT
	FHuvg3wNqvot+gKe4DA2BMiUH+Keh2SOl5uw9sDDpD0N7twEcW1SIRKDpr02otsC3FQp2Q1E2tkl8
	B3jTnRPJ8dKfSqzT8j8NotCJKy1PRsJCNAMjBURqwZvKfakq7iFJhPgQ0Rl63qy95F+dstQ2EzLWo
	d3RMvBB/WDWlnbZtoNqslfXitymsxbQemPXSbIqe/1PP3N2xxB14EP9PAlkURkgkLCUla9A8BTMK8
	0h2m/ib0ekwRja2m4V/RJOt5FGEBYyCEmJyWZ+Y0R5Bp0Do5xSLeX7dy7OhPOWLTVuChByjsgWWiT
	tyF/dmig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ3AI-00FGkF-1p;
	Wed, 17 Jan 2024 10:28:58 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ3AF-00FGhc-3B;
	Wed, 17 Jan 2024 10:28:57 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3FE3240008;
	Wed, 17 Jan 2024 10:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1705487330;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mVtGIgwkGXkguB4MvPhZK/Q8mhOzuHbn1l8x9D2I17U=;
	b=gCx0K+My9QVshgTPmG70Ieg22AYFOiv/+wEl+CpuuwADi73GpmElmaWarKaIOfwXCQNs7h
	JG4DA2cUCVRC3WVezvuHPgehSDzRnkIK23gZjAY1+vsIxYeQfWiPP8Wxe+E8QDGmHUkdNX
	3VJ3NlCK1D9KVHDZ3xxOBRMSfQvKIk1ch3PiJ2MAAufl29tYzyudbAUemwEYdUuIlpTgVj
	fYCcpvaMzVT7fqR6m8v0iFCsO5ku510uN7d3JPpsnG7DgeSh/XyU00YcccJKEOdnmIXFZU
	5gfeQ2War/BoAEbaMIjKly+OTFjFRz9CQTjzZzYxX4rPCwuRSYuEBgwbTg2TNg==
From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To: Daniel Golle <daniel@makrotopia.org>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Russell King <linux@armlinux.org.uk>
Cc: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	mithat.guner@xeront.com,
	erkin.bozoglu@xeront.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [RFC PATCH net-next 0/8] MT7530 DSA Subdriver Improvements Act III
Date: Wed, 17 Jan 2024 13:28:30 +0300
Message-Id: <20240117102838.57445-1-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240117_022856_194444_C27CF5A0 
X-CRM114-Status: UNSURE (   7.67  )
X-CRM114-Notice: Please train this message.
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

Hello.

This is the third patch series I'm submitting for review.

Cheers.
Arınç

Arınç ÜNAL (8):
  net: dsa: mt7530: remove .mac_port_config for MT7988 and make it
    optional
  net: dsa: mt7530: set interrupt register only for MT7530
  net: dsa: mt7530: do not use SW_PHY_RST to reset MT7531 switch
  net: dsa: mt7530: get rid of useless error returns on phylink code
    path
  net: dsa: mt7530: get rid of priv->info->cpu_port_config()
  net: dsa: mt7530: get rid of mt753x_mac_config()
  net: dsa: mt7530: put initialising PCS devices code back to original
    order
  net: dsa: mt7530: simplify link operations and force link down on all
    ports

 drivers/net/dsa/mt7530.c | 251 +++++++--------------------------------
 drivers/net/dsa/mt7530.h |  15 +--
 2 files changed, 46 insertions(+), 220 deletions(-)

-- 
2.40.1


