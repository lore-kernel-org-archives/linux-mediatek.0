Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88125CDB479
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Jun 2026 00:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N+N2piZwur85rXYTWnbWFwNyJfZ/h5tCavLfujPLtAk=; b=LnR1cGfauTOYAosTga4saPLHQR
	X/2tS6/N1MVERVXxxCCG28nFCtx3ckL15lirTSzJUWgCXj+jSM3E9thort5SB2RTZNQBQfP8g2Ep/
	a/TsZ5pMofYnZvcFKpIhFstnxsz5/NOFXfYm5vvtVzprt0vWnct32l3xjx/qf1W/8N0OeMmL4FaHR
	KZW2v6xlsgAur9/yk7vQqDpz9we23j33VZXRyyEqHIpELvDSuGz8r/QWfI5NgjegBxIH1KaaXKuEN
	pbow1HjKS3f4wBz/AWhERnG0y4yI9nlwIAA4e5RmIbsDCpdcoMLAS5hU+kDznF2bGTvK8dVoAmhg9
	1rIFJyEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcXov-00000008Shh-1p1d;
	Thu, 25 Jun 2026 00:19:53 +0000
Received: from mail-pl1-f172.google.com ([209.85.214.172])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcXos-00000008SgO-2Pwk
	for linux-mediatek@lists.infradead.org;
	Thu, 25 Jun 2026 00:19:51 +0000
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2c6dadfbaafso15141905ad.3
        for <linux-mediatek@lists.infradead.org>; Wed, 24 Jun 2026 17:19:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782346790; x=1782951590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N+N2piZwur85rXYTWnbWFwNyJfZ/h5tCavLfujPLtAk=;
        b=YDNjQfsaIN12r2JKIKIa5ysacGTkKLhzyuK+BnrY3HUsMjMPh9wbp7bSs+bJZreMrt
         etn7lORy+QObWl3DZoJQAj93jTcAbU0GMiMAf2F18n3cl5ZaIIberVkxzmjz6saa4+0r
         aZtBia/4XhEYakcgOHPtn5Jp/gJKLnzXBJ4akpPLU+ppPVE2mi92aGpTRXN94IRIi1cu
         kq18V8oAgR0zV9DG8Y5KVhIGZ6k/Q6JS9Za+sGMYTtG/YOATxOueXIwtPDzXCy8xJDY/
         tNUBn+VbITi6S+T+smr+Qr6GOGGYOIXcTuXSbudyLcgXfwqLhyUhf1GTyjwVqZ9X6au1
         UYZQ==
X-Forwarded-Encrypted: i=1; AFNElJ+ut2vmoNgm+kdqZbr9Fk91IC3jUHgGAJ94g9vZ3Eouk3FTmy4mL0tPxg1AmAm6a57XsXyJLjXxao1bF28HWg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxXZkQIIXTUw/594iO9ZYQ7P2LwFEEdflFx9oUlc59nf0Vq2XR4
	82XdT3n8ZoW7kT+B5hKsQ9V8Gdo+x0/fivkppjdLlFGIjpp8/Qpyn+qT
X-Gm-Gg: AfdE7clCxpbFcFIesxas2vmT3E4tSNzWSOpg1bO1yn+yUue+Cj/vb30TxyOxqdn364I
	yIC7nVU+mou+hc2VqbYmS4s7NQxeuBjcJPy/6hGJIXUonLJytbOnOKhNarlCwyioMSJsOrFxKlG
	kVrOshLlwY92vSiSXg+CkruYRtrE47heKgzrqOyOTHyrjTHXveeAKH5HZVbEHtAIaR2Bm1Nx+8B
	GZ4IshXoeKj36Tq/uhnmmLc/iXrKrIjSMY2m4qqCVMHskdGKOA2DWqJmW4Mw33Yw68SoOHOs5od
	EMyrNin62BQ1jhFOZVDoxGrKzpjch063QcHflwwj1tkwESkLg1lLf7a9r7BLGcea+nQZb4GzYCB
	d9BwL/2ymCCmC0Vj7Azhryzzrk83bFE3rQCqTac0dD6g9vINLOFZmK1A9KxpAel/A+eYNP13kQi
	yCmf8kyZxESOct4THxYggmXOEDzzylQBO4sRzGTGCiJFnv29S6aFofOY8ut/qLQbn/HdqXmGCqr
	lL20zHDUXztDCfgSMT7WUHZPQKIEA==
X-Received: by 2002:a05:6a20:7f8b:b0:3ba:cd5b:3dca with SMTP id adf61e73a8af0-3bd4af562bcmr337449637.37.1782346789653;
        Wed, 24 Jun 2026 17:19:49 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.. (114-34-228-194.hinet-ip.hinet.net. [114.34.228.194])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c92bc1e0d10sm586839a12.21.2026.06.24.17.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 17:19:49 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: chengwei.yu@mediatek.com,
	yu-ching.liu@mediatek.com,
	jenhao.yang@mediatek.com,
	posh.sun@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH v2 6/9] wifi: mt76: add init_wiphy callback
Date: Wed, 24 Jun 2026 19:18:31 -0500
Message-ID: <20260625001834.475094-7-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260625001834.475094-1-sean.wang@kernel.org>
References: <20260625001834.475094-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_171950_618949_61198F67 
X-CRM114-Status: GOOD (  10.95  )
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

From: Sean Wang <sean.wang@mediatek.com>

Add an optional callback for drivers to finalize wiphy state after mt76
has initialized the supported bands and before registration.

Co-developed-by: Stella Liu <yu-ching.liu@mediatek.com>
Signed-off-by: Stella Liu <yu-ching.liu@mediatek.com>
Co-developed-by: Jeremy Yu <chengwei.yu@mediatek.com>
Signed-off-by: Jeremy Yu <chengwei.yu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mac80211.c | 7 +++++++
 drivers/net/wireless/mediatek/mt76/mt76.h     | 3 +++
 2 files changed, 10 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/wireless/mediatek/mt76/mac80211.c
index 13c4e8abe281..c4cbf7195b80 100644
--- a/drivers/net/wireless/mediatek/mt76/mac80211.c
+++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
@@ -681,6 +681,7 @@ mt76_alloc_device(struct device *pdev, unsigned int size,
 	dev = hw->priv;
 	dev->hw = hw;
 	dev->dev = pdev;
+	dev->init_wiphy = NULL;
 	dev->drv = drv_ops;
 	dev->dma_dev = pdev;
 
@@ -779,6 +780,12 @@ int mt76_register_device(struct mt76_dev *dev, bool vht,
 	mt76_check_sband(&dev->phy, &phy->sband_5g, NL80211_BAND_5GHZ);
 	mt76_check_sband(&dev->phy, &phy->sband_6g, NL80211_BAND_6GHZ);
 
+	if (dev->init_wiphy) {
+		ret = dev->init_wiphy(dev);
+		if (ret)
+			return ret;
+	}
+
 	if (IS_ENABLED(CONFIG_MT76_LEDS)) {
 		ret = mt76_led_init(phy);
 		if (ret)
diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 07955555f84d..0d185675689a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -940,6 +940,9 @@ struct mt76_dev {
 	const struct mt76_bus_ops *bus;
 	const struct mt76_driver_ops *drv;
 	const struct mt76_mcu_ops *mcu_ops;
+
+	/* Optional callback to finalize wiphy state before registration. */
+	int (*init_wiphy)(struct mt76_dev *dev);
 	struct device *dev;
 	struct device *dma_dev;
 
-- 
2.43.0


