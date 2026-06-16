Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E102CD98CF
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jun 2026 10:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=72nfFGwOqmCepnKWEGZx1I8t5XYaTrVTqrklMpMGSkY=; b=V+jxpjtDgla7gBXnifqRDh2NEP
	lM/JrInFkT+xcawE2njQvS+0eapsoegj+sqjs8mOEj/WbDY0YJ9kAlvyfJiPaOX1y69Yci64TbFTv
	GMhjd77iSMzqJs2SP3lGNJXH7SG8MRaqfo87XwkKWQnQBEkMqmn10g6gzGw8JnDRklBZPQ7aOobii
	4doZY7H+vOYTQOQBcISg6UMMEynZCT07ttNRIH5h5Vg+8IdCbbQ8hU5l/XDEItgB6lJS74/i16Se5
	3AZ7VWjYjEo8hOSIhz7L/AdkdjzIjDFepqt6rx8c5YPZ/YHJOdqjxg5lqoZvRm8kjzmzgCaXBZOQn
	5GR0Ud0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZRRh-0000000FdlG-4Bzl;
	Tue, 16 Jun 2026 10:55:06 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZRRf-0000000Fdir-3i7h
	for linux-mediatek@lists.infradead.org;
	Tue, 16 Jun 2026 10:55:05 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-8422a92b6d6so2180614b3a.1
        for <linux-mediatek@lists.infradead.org>; Tue, 16 Jun 2026 03:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781607303; x=1782212103; darn=lists.infradead.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=72nfFGwOqmCepnKWEGZx1I8t5XYaTrVTqrklMpMGSkY=;
        b=ae9RV9Nuvs9jQSUvrE3TfQHX8lFlVN+Y6QimRNPUYLhtgQB711946WH+UFByh8omyg
         V2vjrBX5tdbQbT1aI3FzeBkDGQ/n+74MT/qADWqg1YS5eEaCVv5vLKWqIggLlY6TiUtQ
         L2aim/kqDZU0AZMIWpV9SMb4EKsFJLO5XOKf3xWjdinGgJnqswb9trLBUVuXyfw592/j
         sJhhvZSzIwUgBNIxChjziMBYz11hY2F3gFFktHG1xjjNTD/tQQ5o1fhWePfWG5aZj8m8
         493xZ7VHHZKfOSO1wZY9+J9fpWmARurrXEu5JhZudTBQ17i/cuYGJyu1nKr+7QvF5ruW
         LDgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781607303; x=1782212103;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=72nfFGwOqmCepnKWEGZx1I8t5XYaTrVTqrklMpMGSkY=;
        b=jTUPFLRuDf0qibb1Pu+f3SRX8VfVpfM4iSUIoZtaskD//XJiNlE5NF3edCyjVJlOpe
         ZaruNNMk9VMOIm9bxIgZbzpo6xlFqVEvj/1xOGmmy8JTqDfJxr/gMEcgSN3yTQbq4XDH
         1F0pmDwI3hxYOOKR0HPDImO23QrnopTm2gpt/PoAZNapxiB58x33hA5pIegFjn8NpINo
         iAf7Dt5Gl5wwdR+zDsjlHXRG9hOsVd/7A81rsgdiOOwgQQUpgYyRbryzYZ6BUhYHiSXX
         cB/YUTCa3qE+EDgkFwX6bodCHtH6Az42wnauM+T1tuxksPi82nhjgxg+DfaDhD1jVw4d
         Xv/A==
X-Forwarded-Encrypted: i=1; AFNElJ/QOXqIQthnpofQUT8RrfIGYw8wd0HFUEavpPulN8fZ2z5eSvNJsuml7YyhO6Z8Xd2HrgJqJ7ruPytadXxMtg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5DXhh04Tjjl+bZD78IWkY/I1oaTyMjCyIIg/f3ZlH5EZFKUvd
	PhhsC3DW3yI2paSnJpPsNu1ES+H+wDRn5ujNHUVkmmgLAhfQT0Cxa+Wh
X-Gm-Gg: Acq92OHdI+ORSJXk0+GJ5Q25Yjs+kXP99VppZXvtfAeQHdFOncFwlEEksPqH+PmsI9k
	HrYWWCV1SyKuBTjrkhoqwWwKRUVIIzeV2HfNBP7NSPhqavfDcp7psmwKUYM9JQtqOdz+PeaxjJm
	Y7kOS4821GFhDBZ/FKIispA0AdvIcBPLpgOahf8RUQYO5wS/Qz7Q8RBqaPUsz9r4LUjyrMVadFM
	oFYCGxRA86tJS36c78KamZq/hOld2V3VO/RCjLckaRnRnbF+pBKsr03XeyHPxrfREtHt4xlbtc+
	1cueF9maOKr8LHImkZbvLlVrjkTdc0EfcYaijzRVxD3VtKq0QAJ20Q3htkTPEoobA69svXNDBmM
	8hIRFnyrPk7gN+EQ/mGz3J9CSWMqD72pqT9AZnmZ+IzF+u+zY7ONbUCrmnrAfNG3IMuvNRJdzYs
	QsZbnVUPIMjayjOVpk
X-Received: by 2002:a05:6a00:1ad3:b0:842:50fd:4c13 with SMTP id d2e1a72fcca58-84513e1750dmr2556028b3a.4.1781607302958;
        Tue, 16 Jun 2026 03:55:02 -0700 (PDT)
Received: from [127.0.1.1] ([47.253.114.73])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b0112edsm11550889b3a.45.2026.06.16.03.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 03:55:02 -0700 (PDT)
From: Wayen Yan <win847@gmail.com>
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org, horms@kernel.org, pabeni@redhat.com, kuba@kernel.org, edumazet@google.com, andrew+netdev@lunn.ch, angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH] net: airoha: Stop TX queues on error path in airoha_dev_open
Date: Tue, 16 Jun 2026 18:50:39 +0800
Message-ID: <178160729880.2156257.7978513589649053826@gmail.com>
Content-Type: text/plain; charset=utf-8
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_035504_004232_6E33BC5C 
X-CRM114-Status: GOOD (  10.87  )
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

In airoha_dev_open(), if airoha_set_vip_for_gdm_port() fails after
netif_tx_start_all_queues() has been called, the TX queues remain
started while the device configuration is incomplete. This leaves
the device in an inconsistent state where packets could be
transmitted before the VIP/IFC port configuration is complete.

Add netif_tx_stop_all_queues() call on the error path to properly
roll back the TX queue state.

Fixes: 20bf7d07c956 ("net: airoha: add QDMA support for Airoha EN7581 Ethernet")
Signed-off-by: Wayen Yan <win847@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 31cdb11cd7..cf9c366907 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -1715,8 +1715,10 @@ static int airoha_dev_open(struct net_device *dev)
 
 	netif_tx_start_all_queues(dev);
 	err = airoha_set_vip_for_gdm_port(port, true);
-	if (err)
+	if (err) {
+		netif_tx_stop_all_queues(dev);
 		return err;
+	}
 
 	if (netdev_uses_dsa(dev))
 		airoha_fe_set(qdma->eth, REG_GDM_INGRESS_CFG(port->id),
-- 
2.51.0



