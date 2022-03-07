Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50CD0C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Mar 2022 22:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oy8jQ8xz89GjIDQHHxIum69BPoGVwvsgZCbT+ea9aKY=; b=XnH9Q1YzS50BL3
	LIbY8GPuO7CCiRfv3DRR9ASI9S/73m6An093/Ad17Eg7QHpLKdaaq6F6F/LFS0IuyzpvbDQZG6sWB
	0F9wFPN8OyHPQZ1PWmCqT3m5kVPsq++Oa92KDR/rt2uNggBeaPRsgFNjaLMVqiagthNQZILpL/hEv
	57j4wiB8c7mz1eZiKpP3mjK9k1ExJ+BdHcx0acHkSqDpzPXz4zrZB8MlxMRFXZGCBejHjDiDkuk8G
	5K5CLfVFJmiKDk3WSoDRWGn+68jJHcwnBQVGSzGQFoeRmop53FB/tSxmBxf69ab92yy6/xJClcuWj
	fn6NFgCsV/HeiAz/SOQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRLmW-001ony-AY; Mon, 07 Mar 2022 22:24:44 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRLmK-001olL-0J; Mon, 07 Mar 2022 22:24:33 +0000
Received: by mail-wr1-x433.google.com with SMTP id x15so25543145wru.13;
 Mon, 07 Mar 2022 14:24:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zbMZsIhYJ+77vvsPZqt2FUvbmhqeDxMePb3nZB4cAlI=;
 b=qk/46LPOyKRdvec+MKolVbUYO/E7hTEJpciHXRhBVUmmNAyo2C/8d97ZqVaKPsuFQR
 g28XiQxVe2sCZP1J4om1F2VAvaHjlN/A2tbJdm+zmnUPpCGWKbq/BnCGY54cDizS2sXh
 DLljZlhxEuuZ5m1bXGEl69acOJ4W+UjX66CaqOXniK4WwpzQvxJ1hcO7bd5TxzkBfT+h
 xYU0X44s5t62Q1FwkakwfyYhu3oOR2xcNYRsAVzer1zydacqroMozijJcMVywovCq/tF
 g7gYlW0Hi5PIkn+Cq66Jbm3y7aHTCF7jCpU0NH0egwL9p84eecVwb01d9H0Fj+dRhmP1
 aCOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zbMZsIhYJ+77vvsPZqt2FUvbmhqeDxMePb3nZB4cAlI=;
 b=PcsyBLqxVw+CDW/z4+/w5y2xP1l5R+L86tmTlyjxIhilcbHcEpzF4kIzrsEmv4mJJt
 K3Ukds9SZB82Rzkr4CMCaCMptzD4oE8UmbtMB8StRCK6EnZ3Qz38m6OFPzqCDDR5//nv
 K/7b8Fs7a7jyFDB3F3jHx4ELoudF1Qj4dACEMaVD6bVSx2YiqJrvZ/tdFYA4N/3GSH6q
 o2EctH1CFu6+aKbkrIJhjIDe9c0eozPahG91ezIBm3MB9gxpx3lqrP5xUqyyWoxbzb35
 lulbba+6CawUGj0RrtNMNmFFyAx82RO8qDoP6uTiwM10ieYtU483DMf/2wXZvKHpChF1
 tZ+w==
X-Gm-Message-State: AOAM531Mju6x6coeAIb/om6874fKCcRAscx18Wn1s/JLTNaVObUFqWPl
 JfwHEp+VCgDUyn9jx2oHF0ipBInK64PjHA==
X-Google-Smtp-Source: ABdhPJwqSNvyS4GjI+QGP/a7FIEfmDb8n8qMgSIZbujBF1i1aTX14o3KbErC3DQHg6WB2p2+k3Yong==
X-Received: by 2002:adf:e98d:0:b0:1f1:5d2b:eee6 with SMTP id
 h13-20020adfe98d000000b001f15d2beee6mr9674551wrm.143.1646691870231; 
 Mon, 07 Mar 2022 14:24:30 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 u10-20020a05600c19ca00b00389860c6d3asm543321wmq.23.2022.03.07.14.24.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 14:24:29 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Kalle Valo <kvalo@kernel.org>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mt76: connac: make read-only array ba_range static const
Date: Mon,  7 Mar 2022 22:24:29 +0000
Message-Id: <20220307222429.165336-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_142432_071720_1ACE02DE 
X-CRM114-Status: GOOD (  11.19  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Don't populate the read-only array ba_range on the stack but
instead make it static const. Also makes the object code a little
smaller.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index 0a646ae51c8d..fb44fc6c78f3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -1044,7 +1044,7 @@ void mt76_connac_mcu_wtbl_ba_tlv(struct mt76_dev *dev, struct sk_buff *skb,
 	}
 
 	if (enable && tx) {
-		u8 ba_range[] = { 4, 8, 12, 24, 36, 48, 54, 64 };
+		static const u8 ba_range[] = { 4, 8, 12, 24, 36, 48, 54, 64 };
 		int i;
 
 		for (i = 7; i > 0; i--) {
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
