Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79A84CCD194
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Oct 2025 10:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SqlHIoijYz5s4VvLFw4DXui8UYxJ3H1Ci28ef56e9b4=; b=Rpfr+S8KxkphTa7iNyVIx0qItp
	tNWItt+r/4uqWSdYff5fK6oN/5qZbWBPgAGZayXDuWgVS/zi5pmLK/Dq4HIPvQlevIE0ofFyYZ0Rp
	p4doLX1gX1pwa/v9qgl+YVPNlVRGO/IQx7LZ0K6G4Yjp5GiKp3TSW0ZPMw8SJIX177q338nIIo+tG
	gyZhVxzJqB6T5NWnngbdojWLPkx0K4DqppsZortRCYiB2Weo4YGxFBjXyTobFbRcC6IVbduLUoZMW
	wFDdfiegvd6Swu7oLXScBBce+3SVZQqi9P4RBt+LSMERWvgZub7e/K80yTKQ2DoNj2Cev0YmQTNg0
	zslW7yCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Kv9-00000004LF8-0sUF;
	Thu, 16 Oct 2025 10:09:19 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Kuq-00000004KtS-0PAE;
	Thu, 16 Oct 2025 10:09:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760609334;
	bh=fdxmZQ5MI5GMoR8RTL5DZwAyvuuQQsmqyeZPFXoqolI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RCXNy/0wVz1pH2LscGhHZaZ1gzhs8j+fi1TM0B05xccoohp0oc/I3/j9fpApF7im3
	 2KS2BHo47QT9NuPx+3PtdVaQxK3oMSo7eMp6IaLxO+x001dRT78e1vO+ppEOHBnbfJ
	 qn5WQwFgA0A2Uhi6UPvRVZvEksmBGerdOQUOSEfyNXA45kxSfc1am/f0xfJV0A6Udm
	 DZHpbRzvjQFzOcJrF7OMskaC/U5uDjSj0Ck65stpiYWQwBQCJjGU0Eg6gVrS5xomu7
	 qvjmVKtkPXHTm3AqwRviTzQYerTHc6hpo1w0VvARMccIismlcLvxQhAfyWIp33yi1V
	 1Qg4Zo8wdrrTw==
Received: from beast.luon.net (unknown [IPv6:2a10:3781:2531::8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sjoerd)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7B5D217E1400;
	Thu, 16 Oct 2025 12:08:54 +0200 (CEST)
Received: by beast.luon.net (Postfix, from userid 1000)
	id A530310C9C78C; Thu, 16 Oct 2025 12:08:53 +0200 (CEST)
From: Sjoerd Simons <sjoerd@collabora.com>
Date: Thu, 16 Oct 2025 12:08:42 +0200
Subject: [PATCH 06/15] dt-bindings: phy: mediatek,tphy: Add support for
 MT7981
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251016-openwrt-one-network-v1-6-de259719b6f2@collabora.com>
References: <20251016-openwrt-one-network-v1-0-de259719b6f2@collabora.com>
In-Reply-To: <20251016-openwrt-one-network-v1-0-de259719b6f2@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Ryder Lee <ryder.lee@mediatek.com>, 
 Jianjun Wang <jianjun.wang@mediatek.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Lee Jones <lee@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org, 
 linux-phy@lists.infradead.org, netdev@vger.kernel.org, 
 Daniel Golle <daniel@makrotopia.org>, Bryan Hinton <bryan@bryanhinton.com>, 
 Sjoerd Simons <sjoerd@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_030900_330396_F2F3F715 
X-CRM114-Status: UNSURE (   9.43  )
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

Add a compatible string for Filogic 820, this chip integrates a MediaTek
generic T-PHY version 2

Signed-off-by: Sjoerd Simons <sjoerd@collabora.com>
---
 Documentation/devicetree/bindings/phy/mediatek,tphy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
index b2218c1519391..ff5c77ef11765 100644
--- a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
+++ b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
@@ -80,6 +80,7 @@ properties:
               - mediatek,mt2712-tphy
               - mediatek,mt6893-tphy
               - mediatek,mt7629-tphy
+              - mediatek,mt7981-tphy
               - mediatek,mt7986-tphy
               - mediatek,mt8183-tphy
               - mediatek,mt8186-tphy

-- 
2.51.0


