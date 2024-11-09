Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E624AD5E375
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Nov 2024 15:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ko8SoJE86WbmOFZcbuqR8SFIU1gqd4tOK+TRmo8Hh9A=; b=sa7K+L7ACOIWgH
	y0Z7yVFELpNM0sxJSnL8Xl5pu1eV6NODB6IZU2ux5U9jWDL5uR6pkzbbG7kFppdQL4OW9TDg2KhnR
	+iZXgoAMyNaHdzGP/7qLFbuz238EyzsIO+20sYc0Vi2s83KQ9y73/LSmiRt+JgbUlgNEiznzv0ksH
	ZCDYXSRxtJSD/V6DDFUZnXqHFIAMoU3T1CsGINSz1edg1lasLT33MmdM3wTl1YtigwBY09liGOVGN
	eoEusNw7uXXzVoxmH27v7Y/SgrEaCzolkEzGtTY++oJFjgmSnyn6kDvMdqQ87+HM5RqGPtbcPpnwd
	vbKEmNBAYqBEYwsw7kkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9nFd-0000000DXyW-2jnm;
	Sat, 09 Nov 2024 15:19:49 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9nDq-0000000DXcn-0mDF;
	Sat, 09 Nov 2024 15:17:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1731165476;
	bh=r8pOJtwP+l+aThisZLQEzXRJelwC83jKXvQDLp3YZ0Q=;
	h=From:Subject:Date:To:Cc:From;
	b=WjGXSk+p0nwTI4xqakbd1duOtiGya37aCquPOiYed+6/OSQ8BqGEZAH8o6aD7iBl+
	 Xdz1/YI9ZTLbGCJnocIykUcRbE7i2z6aKWIWv4PHML6J9c8oN1gxKuZHmfYNFAoDeP
	 8d4rDYV9LbmkrrkiQ7LERwE1LZ85bZQFcg389FNZCTsGEZm5EpGAOomwISwgyydUpo
	 Xhv4Wi1fHYa4Ww2fJRQw//ifCBcvVxnkIKDbirPmRM+9rrgVgYN34/AJb1aasZPFE4
	 4NN2h6lSbfIYud9pWlxwvbYtWhB7mTsMjT1HauXx7fLk/Ws/05i6XiO6IXkvfjibkP
	 6B2Vp7/vyZXzg==
Received: from [192.168.1.63] (pool-100-2-116-133.nycmny.fios.verizon.net [100.2.116.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4806517E35FA;
	Sat,  9 Nov 2024 16:17:53 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Subject: [PATCH v2 0/2] net: stmmac: dwmac-mediatek: Fix inverted logic for
 mediatek,mac-wol
Date: Sat, 09 Nov 2024 10:16:31 -0500
Message-Id: <20241109-mediatek-mac-wol-noninverted-v2-0-0e264e213878@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAM98L2cC/43NTQ6CMBCG4auYrh3TQX6qK+9hWJQyykTomJZUD
 eHuVk7g8vkW77eoSIEpqvNuUYESRxafUex3yg3W3wm4z1aFLkpEjTBRz3amB0zWwUtG8OLZJwo
 z9YAn42pX6rI61ionnoFu/N7y1zZ74DhL+GxvCX/rn+GEoKGpOoNGmwYbe3EyjraTYA9OJtWu6
 /oF5fARncwAAAA=
X-Change-ID: 20241101-mediatek-mac-wol-noninverted-198c6c404536
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Biao Huang <biao.huang@mediatek.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Andrew Halaney <ahalaney@redhat.com>, Simon Horman <horms@kernel.org>
Cc: kernel@collabora.com, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241109_071758_404190_D8066482 
X-CRM114-Status: UNSURE (   9.29  )
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

This series fixes the inverted handling of the mediatek,mac-wol DT
property. This was done with backwards compatibility in v1, but based on
the feedback received, all boards should be using MAC WOL, so many of
them were incorrectly described and didn't have working WOL tested
anyway. So for v2, the approach is simpler: just fix the driver handling
and update the DTs to enable MAC WOL everywhere.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
Changes in v2:
- Dropped introduction of new property mediatek,mac-wol-noninverted for
  backwards compatibility
- Set MAC WOL for every DT
- Link to v1: https://lore.kernel.org/r/20241101-mediatek-mac-wol-noninverted-v1-0-75b81808717a@collabora.com

---
Nícolas F. R. A. Prado (2):
      net: stmmac: dwmac-mediatek: Fix inverted handling of mediatek,mac-wol
      arm64: dts: mediatek: Set mediatek,mac-wol on DWMAC node for all boards

 arch/arm64/boot/dts/mediatek/mt2712-evb.dts                   | 1 +
 arch/arm64/boot/dts/mediatek/mt8195-demo.dts                  | 1 +
 arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dts | 1 +
 drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c          | 4 ++--
 4 files changed, 5 insertions(+), 2 deletions(-)
---
base-commit: c88416ba074a8913cf6d61b789dd834bbca6681c
change-id: 20241101-mediatek-mac-wol-noninverted-198c6c404536

Best regards,
-- 
Nícolas F. R. A. Prado <nfraprado@collabora.com>


