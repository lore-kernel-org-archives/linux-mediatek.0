Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B543C83F1A
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Jul 2025 07:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=10eEJt4VrkRyjA5xHwdfsVDrBgIl/YTas7olJiuwauQ=; b=eca+tRx+TUTuyokoWLsMgjkuHW
	nON6dPbvuFh1OTvfoFoNLMnAz5OIP/NPQyQULtoHM2UO/MioRE6cb90wUdUAnjxL//7RIoUaBJrfa
	JS1Hd0+2pX8UwAhXRDQgHtelKK4HC9ngRfKh4Bgug1GP/vXbMch+wGpQbx5+Z94f2DRfS6qVvC8NS
	gBsvx7jqU9mQ/j387UR++GZXZe49+MoQJljJ+ytWat4pVWq2/S6eMjvnVd6iO0/GDKXyBJICD8vrm
	XQb9iXz3gToxBuz9a63yCZwvS6nNQuArFW5Qbk+hNWLeCHqsaOSAMec8PRQ09Yllg97p1Dsbm/HLX
	ShVOu/rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucIrZ-00000009PIj-0nTL;
	Thu, 17 Jul 2025 07:17:05 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucIZY-00000009LgP-3RzA;
	Thu, 17 Jul 2025 06:58:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1BBEEA5773F;
	Thu, 17 Jul 2025 06:58:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69957C4CEED;
	Thu, 17 Jul 2025 06:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752735507;
	bh=bbMe/p4KUpOOmlbJ3xxcrOUiZhOzHwySeN2cBLuyzhA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FwerPM6eBQ7kjyLxF16HXTnRVEji8UCVNnvrU+zFDpnNh1JsiHHiouZtvdnOVU2pE
	 8Oil5sURRQCVifKEzd28VXlU2Gjoa1rSkaW61qWM7y4APeRYNzYbrahTq/k0vsh59E
	 Y+1dzeRsyUQf1DD1Q5wga5a2yT6ThGWsoT2TzyidCbWRdzkCCvei13OhRNjUCpQzBy
	 McwbciZve9kk/a0//OFooiD621nI5FypxIrQF9c1xLu7xsKW3e7Z7dyFsHld4ZOekt
	 8J2sKLi2ASy7CaL0mFLONSa0u9BhWA1FXdrNnTg9DuYZZMxEBE75FWfjXS7qvAjEzK
	 auvfejIr1HpIg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 17 Jul 2025 08:57:47 +0200
Subject: [PATCH net-next v4 6/7] net: airoha: npu: Enable core 3 for WiFi
 offloading
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-airoha-en7581-wlan-offlaod-v4-6-6db178391ed2@kernel.org>
References: <20250717-airoha-en7581-wlan-offlaod-v4-0-6db178391ed2@kernel.org>
In-Reply-To: <20250717-airoha-en7581-wlan-offlaod-v4-0-6db178391ed2@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Simon Horman <horms@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_235828_935178_1FA787F6 
X-CRM114-Status: GOOD (  10.07  )
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

NPU core 3 is responsible for WiFi offloading so enable it during NPU
probe.

Reviewed-by: Simon Horman <horms@kernel.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_npu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/ethernet/airoha/airoha_npu.c
index 68ddc940f675b42599bd2c0245dc715bb56edb32..90000496b6a234897d4f208ab78d54af14be4aac 100644
--- a/drivers/net/ethernet/airoha/airoha_npu.c
+++ b/drivers/net/ethernet/airoha/airoha_npu.c
@@ -724,8 +724,7 @@ static int airoha_npu_probe(struct platform_device *pdev)
 	usleep_range(1000, 2000);
 
 	/* enable NPU cores */
-	/* do not start core3 since it is used for WiFi offloading */
-	regmap_write(npu->regmap, REG_CR_BOOT_CONFIG, 0xf7);
+	regmap_write(npu->regmap, REG_CR_BOOT_CONFIG, 0xff);
 	regmap_write(npu->regmap, REG_CR_BOOT_TRIGGER, 0x1);
 	msleep(100);
 

-- 
2.50.1


