Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFB99FF885E
	for <linux-mediatek@archiver.kernel.org>; Sun, 26 Apr 2026 14:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Zp95h01o2/Wl98SnFb+AukwrIEiz+o1jaPsbSAEFOD4=; b=1NHSuIgpAG7Gq7KshH+i8nw1uJ
	INsezJwlbdchzTwujQO4so6Z+MU4WKkLstIBkR+ZYGhC95e0TLC4j1SKf0lOz3lf+YibCxsec22Uh
	fHfDdXI6MWiFg0lQrC2eQ3nNGMBXErTPnckxHNfi1/eB50hxoN7U+Pg28d70vG7zuxbTKmeaAGehn
	OdtjKMsaI07utUFnrGQPQiQz9Ngn++mCMBboP3B55ZcXa2iRCrOLLzAPbK6jNkBTRdZIzP681tuH7
	qbDIpMqqIWFslYW1I8ek1dH1t/UQ//Bht3oG6YHCHqYzYaK7UFoWyqcFXPe31pPATPCzMRIraO9V4
	Pl/YQEBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wH0c9-0000000FcVI-2BgU;
	Sun, 26 Apr 2026 14:37:41 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wH0c6-0000000FcUT-3Ctx
	for linux-mediatek@lists.infradead.org;
	Sun, 26 Apr 2026 14:37:40 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-82418b0178cso5730170b3a.1
        for <linux-mediatek@lists.infradead.org>; Sun, 26 Apr 2026 07:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777214257; x=1777819057; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zp95h01o2/Wl98SnFb+AukwrIEiz+o1jaPsbSAEFOD4=;
        b=tCG/3ug3UJUzCR1enQNV/iUhdJCWzSGsT08ioFiB7oC+SQUH6k7r0rTkvISAIGH6Ka
         Xaahbdu/yD+P0HFSmdkwl2yXdZRIct54YZP5kgSrVcj0f7YfixM9TSCzzZ1RkEZEyLDX
         O3ETdMHXRyizzlkerg0vBKBhgh1Ij3+e9w48iQ8eVlEf4yWmkVPu93reaFgsubCtySIF
         1QWzoDU48mzbHJrfxz2P1g2Oh4L+Od4vq8i/A1890I/eKAODFnmv/+mK0AdHvlrAXhUQ
         xvDBugE2KePPF2mAVmow7JhSW3/J13gWw7wXkuZPEoNN2cSwLf49kI1z8XXn9sPW/SeR
         4rhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777214257; x=1777819057;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zp95h01o2/Wl98SnFb+AukwrIEiz+o1jaPsbSAEFOD4=;
        b=PbBTsLwp6DXM0peNomNfxbO31znN5Yo3+4oIfLjYj49/mNgVlDkDJLjhvKK8IQyxE2
         nUUhW+5aCX45BIFnvJ/ljiBVYy3XRWNMIiw3J1r0edpKY83hoK4TQpFNu4egpd1RUNWn
         b7tea9rhqZSKTK7dsdwv9q2Is8zlRbDALNTeGXLObMqPwbQA6UKvkfVSN7ICwsx7ecZF
         rkzku3EaFdH94bJ3ays8GbblluyTRx5+CEn8JdZva9+bZ7PThNd9ihvaDp6tCAgRzmPO
         yopuTIHdPfQZchwO5Qq5i8v7Czh4pLCJ+3DH89cMCPRomw1ODCscNE1wi7n1j+zBfEtD
         WcRg==
X-Forwarded-Encrypted: i=1; AFNElJ/mPXRya7PeQjPkvMEv46LVoAF3HUm0N1bim4/US785PqJjOqNiEgL2hpPndXv7gNxdqdjn2svxOZQlGgauJA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzCPCv7+njG4X8XA7+lkeAGYh57hXBC9gIo5cJgZf1D4QxRo7o3
	z/PjS/2Mu/l/nu29zzzalQwJD2qwxoKdZJWd5dQFnf0FXDuFB1VzP8Q=
X-Gm-Gg: AeBDieu/i9+9F/SmcOmJbZHwgJFcpx9ETLrUG8HqFbjTluxjAPVviOvpTvwKDF0FFX3
	cpmJrous4luZn1zu2JK5PVI8YcCFpBRnfYRrgnwtTP6tx88sTBrROwIduzS+WT/mdoT9bNYw1Id
	NLgutNG7lHA04Gwm5VRZxiMylwjj+1xmIxj7miMH0O0vhaMyzLwQVQNvqiRmjgAryYXTfK8FRC9
	qCdYqIfcBzYw5p9RAtdwqp+ti53Eruqol/Im1mAL1K+piYtnb1fac9TPNd8zk0d0iL97sgtfXG4
	UOcPFu5mMNydk9828Sq9CLGzB0bPnUNhvoCI0flbUErHYffMwc4bpdCbOgwuzYpAIj7XSH2hyim
	LXJFFXGdSwjdr9wBVXJNBg4Utq3jOTJnAC8IPIdbexqx/K/opnKLIw5wC0+VTvKwPxQ8KShcuj/
	nNAp2WX6PZ63N9Vzm6CzcL33Y+3R22Y/vExnTT7dCFheCmgQfIfrIjdHku++jv/68f32imaGjLZ
	2N1irkPLxsUDOU+/V6tSUMWqm+zVu9Je4vWV3uPBsmvUbU=
X-Received: by 2002:a05:6a00:7484:b0:82f:4a4d:3792 with SMTP id d2e1a72fcca58-82f99814b42mr31000118b3a.4.1777214257392;
        Sun, 26 Apr 2026 07:37:37 -0700 (PDT)
Received: from localhost.localdomain ([1.226.165.54])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e9d35acsm30061828b3a.15.2026.04.26.07.37.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 26 Apr 2026 07:37:36 -0700 (PDT)
From: "=?UTF-8?q?=EB=B0=95=EB=AA=85=ED=9B=88?=" <mhun512@gmail.com>
X-Google-Original-From: =?UTF-8?q?=EB=B0=95=EB=AA=85=ED=9B=88?= <pakmyeonghun@bagmyeonghun-ui-MacBookPro.local>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ijae Kim <ae878000@gmail.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Myeonghun Pak <mhun512@gmail.com>
Subject: [PATCH] wifi: mt76: mt7925: clean up DMA on probe failure
Date: Sun, 26 Apr 2026 23:33:36 +0900
Message-ID: <20260426143728.41534-1-pakmyeonghun@bagmyeonghun-ui-MacBookPro.local>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_073738_810459_ABF5A058 
X-CRM114-Status: GOOD (  10.79  )
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

From: Myeonghun Pak <mhun512@gmail.com>

mt7925_pci_probe() initializes DMA before registering the device. If
mt7925_register_device() fails, probe returns through err_free_irq without
tearing down DMA state.

That leaves the TX NAPI instance enabled and skips the DMA queue cleanup
that the normal remove path performs through mt7925e_unregister_device().
Add a dedicated unwind label for failures after mt7925_dma_init() succeeds.

Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 chips")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/pci.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
index c4161754c0..4883772302 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
@@ -415,10 +415,12 @@ static int mt7925_pci_probe(struct pci_dev *pdev,
 
 	ret = mt7925_register_device(dev);
 	if (ret)
-		goto err_free_irq;
+		goto err_free_dma;
 
 	return 0;
 
+err_free_dma:
+	mt792x_dma_cleanup(dev);
 err_free_irq:
 	devm_free_irq(&pdev->dev, pdev->irq, dev);
 err_free_dev:
-- 
2.39.5

