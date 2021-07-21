Return-Path: <SRS0=lmF9=MN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92CA2C12002
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Jul 2021 15:35:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E49961241
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Jul 2021 15:35:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E49961241
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=euzl3/veGNe8oVR4pBTr4d0fOO8FOozX1XBMMO3fyXQ=; b=kPJme0+EOnE9LN
	Sj5d/bek4R23eM/rzPTPTWesuOcJ1Lf61opY2DM4h448y29mZZPPWtBs3KrZpOpFywVI+nNTKXPDr
	hd81nRi+x2IfmjBK8tkjdKKP3/Yp5YV6vLfsuOvAGHYB1lgoZl34jTv5kFMXc8/iWngpPQ04s8Obj
	cQWzNTl9u0mSGCEwKZa/2aRhUc2jNtCp8yJ6obHu9d22hn+ukhqGUY9ycIhuaND1rbXk90SyevOL4
	9cUXy2g0e9dI5pocgEXZBZ5mxiePZ+PdMtpjW0SW96AqUJmOPJYO8L6z4NRqknZEw4bK3T9z1wVbJ
	7qsaWhlC+oYY7LNcSiaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6EFV-00GLRe-6H; Wed, 21 Jul 2021 15:35:05 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6Dp9-00GBrg-Ia; Wed, 21 Jul 2021 15:07:53 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0795A60FE9;
 Wed, 21 Jul 2021 15:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626880071;
 bh=CohVxwuDisL11y0VTlPi65KYI3TaQeWuxldXen3M5sg=;
 h=From:To:Cc:Subject:Date:From;
 b=uzxaFRjrHeoZnGWliZY4qiD5WImC1kwJEK+DEsojPYsYt4ghnLHJGO2g12/4Pfz8A
 t7DXoip/4x5NlJ0PVCcf4In0/m+fVcR5Xpf5ji7bAG65ZqeAbLoYjok/vXwDDsVLb5
 /cAvzD+otHDHdg7UoOlUrkRJvRyUANq6+KfWtmLwAAJ8uxO2WK9ZTeQvzWeo9Ji/lA
 NbpkNcjSKhyEftbOnMMDSRq2nviUHzNPfnIirSddM/vkYuRzlVmKoUPfLcD5hhdJYI
 4OLP55IHOTYFYzsHiAiOx42K/4bSYAT7ZRJ9LdZLEuVbcIP+o5CMPoPa1//9+L4Te5
 +Q7Ih4NOMUk2Q==
From: Arnd Bergmann <arnd@kernel.org>
To: Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
 Kalle Valo <kvalo@codeaurora.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Ryder Lee <ryder.lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Soul Huang <Soul.Huang@mediatek.com>, Deren Wu <deren.wu@mediatek.com>,
 Xing Song <xing.song@mediatek.com>, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] mt76: fix enum type mismatch
Date: Wed, 21 Jul 2021 17:06:56 +0200
Message-Id: <20210721150745.1914829-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210721_080751_686364_9DE831D9 
X-CRM114-Status: GOOD (  12.29  )
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

From: Arnd Bergmann <arnd@arndb.de>

There is no 'NONE' version of 'enum mcu_cipher_type', and returning
'MT_CIPHER_NONE' causes a warning:

drivers/net/wireless/mediatek/mt76/mt7921/mcu.c: In function 'mt7921_mcu_get_cipher':
drivers/net/wireless/mediatek/mt76/mt7921/mcu.c:114:24: error: implicit conversion from 'enum mt76_cipher_type' to 'enum mcu_cipher_type' [-Werror=enum-conversion]
  114 |                 return MT_CIPHER_NONE;
      |                        ^~~~~~~~~~~~~~

Add the missing MCU_CIPHER_NONE defintion that fits in here with
the same value.

Fixes: c368362c36d3 ("mt76: fix iv and CCMP header insertion")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
This problem currently exists in 5.14-rc2, please ignore my patch
if a fix is already queued up elsewhere.
---
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c | 2 +-
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.h | 3 ++-
 drivers/net/wireless/mediatek/mt76/mt7921/mcu.c | 2 +-
 drivers/net/wireless/mediatek/mt76/mt7921/mcu.h | 3 ++-
 4 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 863aa18b3024..43960770a9af 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -111,7 +111,7 @@ mt7915_mcu_get_cipher(int cipher)
 	case WLAN_CIPHER_SUITE_SMS4:
 		return MCU_CIPHER_WAPI;
 	default:
-		return MT_CIPHER_NONE;
+		return MCU_CIPHER_NONE;
 	}
 }
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
index edd3ba3a0c2d..e68a562cc5b4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
@@ -1073,7 +1073,8 @@ enum {
 };
 
 enum mcu_cipher_type {
-	MCU_CIPHER_WEP40 = 1,
+	MCU_CIPHER_NONE = 0,
+	MCU_CIPHER_WEP40,
 	MCU_CIPHER_WEP104,
 	MCU_CIPHER_WEP128,
 	MCU_CIPHER_TKIP,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index cd690c64f65b..9fbaacc67cfa 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -111,7 +111,7 @@ mt7921_mcu_get_cipher(int cipher)
 	case WLAN_CIPHER_SUITE_SMS4:
 		return MCU_CIPHER_WAPI;
 	default:
-		return MT_CIPHER_NONE;
+		return MCU_CIPHER_NONE;
 	}
 }
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.h
index d76cf8f8dfdf..de3c091f6736 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.h
@@ -199,7 +199,8 @@ struct sta_rec_sec {
 } __packed;
 
 enum mcu_cipher_type {
-	MCU_CIPHER_WEP40 = 1,
+	MCU_CIPHER_NONE = 0,
+	MCU_CIPHER_WEP40,
 	MCU_CIPHER_WEP104,
 	MCU_CIPHER_WEP128,
 	MCU_CIPHER_TKIP,
-- 
2.29.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
