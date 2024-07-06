Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FC36C2BD09
	for <linux-mediatek@archiver.kernel.org>; Sat,  6 Jul 2024 08:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YlF2JywEe1cvvGSvZJRgqPG6ZVZ0CbkrViYHici5z68=; b=RocZ7VcKJCgOrBNSAjU/YWcIAP
	Q3ZD1KvjiMWHGmHOiE40KWAGhyIwtaZbTHrTPMy0GK4lZZBIb+7Vnn/kE+UdgMgw6cK+JCXJ3rr3/
	mNeM2uvD5FJEO+fsL62Twb0KJfWcQGqwMh9FWRgng4+KyWMqdpSrU/KebRk+hBDMJG5x0ChVBLU3T
	HljYbf8DGXFn/tZ95JVI+DSwkL1kkAR7Ccw05e2IkxFAUv4RF5dHKeq+EU8Kc8BtIF6Bzyv1wN2Vh
	itg8wZ1VeZHi3rqEkAHFlPg9ifrLc8nPi2KOg884T1VVRYTH/uBaldGivNWQKxIGD5aE0DnZrjscU
	/ZoBlL/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ0nJ-0000000HYHy-43h9;
	Sat, 06 Jul 2024 08:29:21 +0000
Received: from mail-oi1-f178.google.com ([209.85.167.178])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ0nG-0000000HYF4-00ZL
	for linux-mediatek@lists.infradead.org;
	Sat, 06 Jul 2024 08:29:19 +0000
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3d55fa5dfecso121392b6e.0
        for <linux-mediatek@lists.infradead.org>; Sat, 06 Jul 2024 01:29:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720254557; x=1720859357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YlF2JywEe1cvvGSvZJRgqPG6ZVZ0CbkrViYHici5z68=;
        b=vvUnkXwam7MDq3TE/wbTVx0hYL4TazarCtZS5CtMLCBGB7P8mVgsbUAW2YXRYwMSd2
         zECqXafjuINQ1NsYGepRh28XLCgPMBqmONdEqCU61udZIjRZab7UEFQ8JBEmkGJfJg5p
         Qta+Rokxut+ZJdxK1Yt8ucaxc5ENToG/c98bDiBAVExxPzsRevcirOzq1kVza17lLu42
         vWOIWJZAPF2mBEhsZytNhlX+AXhvZO4zQd1pZIfJG2k5M/WCYAGUYyMgrgkk1P9U0ESz
         kVhW6CeAFOtr2Ch0FTxUb7EymxYRRL5/kR6667VBpkpkDCLc1e0vDTObIWirrC+Vyb8J
         uPYw==
X-Forwarded-Encrypted: i=1; AJvYcCXN4yL5oWi1mH3UIzhdYhaiS60y55lFQWJRtqGGXE06ZV04AM1uQ5fW6OfyP0qhMFkiQQYBshsCZJjcukacRI3rcWckqOXrI4CeVz5rLIbhKKVn
X-Gm-Message-State: AOJu0YxfkyHQJXuzSb5iMgdB6sUPDaaf1XqWiTWyuE/8WjTl6dqr08mY
	F1M3ur+2BbCTuE8uOS0+IdVvVRVvUnBKUmrL1HSvBMCINUN4q/vO
X-Google-Smtp-Source: AGHT+IEKaHR/MtADbJuaDJwOKkXRGJJxNlaYQ4FMc5RcMDq6t1884qf4ZfSK3ZmX34TiS+gD3C2FXQ==
X-Received: by 2002:a05:6871:24c1:b0:25e:44b9:b2ee with SMTP id 586e51a60fabf-25e44b9d073mr3715643fac.2.1720254556954;
        Sat, 06 Jul 2024 01:29:16 -0700 (PDT)
Received: from sean-ThinkPad-T450s.attlocal.net ([2600:1702:5083:7610:1e13:57ab:ecc5:1fd4])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25e71070ba1sm10744fac.34.2024.07.06.01.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jul 2024 01:29:15 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 32/37] wifi: mt76: mt7925: update mt7925_mcu_sta_phy_tlv for MLO
Date: Sat,  6 Jul 2024 01:28:12 -0700
Message-Id: <6620e00fbeef686fb2041556deba346411eab0f1.1720248331.git.sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1720248331.git.sean.wang@kernel.org>
References: <cover.1720248331.git.sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240706_012918_147036_E5366B1C 
X-CRM114-Status: UNSURE (   9.88  )
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

From: Sean Wang <sean.wang@mediatek.com>

when we serve MLO during the multiple-linked connection, the chanctx may
be not available in the internal driver, we should get the proper the
band information from link_conf for the MLO-enabled firmware.

Co-developed-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 8fc75f9002d1..b005b5b8968c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1647,7 +1647,8 @@ mt7925_mcu_sta_phy_tlv(struct sk_buff *skb,
 
 	link_conf = mt792x_vif_to_bss_conf(vif, link_sta->link_id);
 	mconf = mt792x_vif_to_link(mvif, link_sta->link_id);
-	chandef = &mconf->mt76.ctx->def;
+	chandef = mconf->mt76.ctx ? &mconf->mt76.ctx->def :
+				    &link_conf->chanreq.oper;
 
 	tlv = mt76_connac_mcu_add_tlv(skb, STA_REC_PHY, sizeof(*phy));
 	phy = (struct sta_rec_phy *)tlv;
-- 
2.25.1


