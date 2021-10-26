Return-Path: <SRS0=kfxU=PO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4866FC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Oct 2021 08:34:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BE9260F90
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Oct 2021 08:34:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1BE9260F90
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8t5z740vFkdX+3t/1YfTw8WwCYC2hzmUqvolGozthv4=; b=4GvyOjApfCsmta
	7+Cv9kPWRiS3b02BALwJdTlIuxtD+nTp2VcTlRhCpIHlgnJNduaeY4B8PoXfimeJ1+lEpPnkdShTj
	9VJt7lZmO7iueMGBnC2i12rymRsxK3sNE+D1kYX0/Vq0N7X5eh465PNFm0PQxwE8Bl8PuW6rFBd2B
	ierQELbut7AGMAA4AnuZgoeDu/nN8B5zNxq6lgh5Z40PX0esuelRZcG4dysx8bh7etxs9RbMQAJJl
	QBoiELJdPeZLyUF2aiNPDZDhGgK/BgW4Dp3847jv2vCQvcQCBmzB10QbgwoiWg7LgjuLIfJ9/zWi8
	62+xBiyXlBu5qyTQH2ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfHu6-0013Oc-86; Tue, 26 Oct 2021 08:33:54 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfHtk-0013Cx-Et; Tue, 26 Oct 2021 08:33:33 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D9F4760F46;
 Tue, 26 Oct 2021 08:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635237212;
 bh=QzdqZpiGX5vzH78kafZN2BbBbWTTTjlj04OaCvEnSO4=;
 h=From:To:Cc:Subject:Date:From;
 b=R9M5fmXvJV81R3cbYtLS61achVk1fflWq5UM7WAJsoXmeXYqovJFGY+hKKhi/NjOz
 okDNBwMnoJS8nGkqv94Mw3cmjfKeFa+rutVIvemZyguKtUnvFKhX5N4c22c3zetN6k
 TVcRYDGeV5+6e6VHypheEiXP5KuPkfcNfFDZ8gSOqziQwpBjzAS7ajqhEFOad9ie3L
 Wtiju9TeSmJBSh6hIhQuaQuKp6WAxoEZ3qYayR4QE1Lx5zhZK53W/dZzP1IdM+C4cG
 +9amLZemg9pze/PISe5rYSitGz9U2Txa1tGRy6fCHtAgLtjGB73npXsL4mYw1zXr+m
 w9fNQ05xDxofA==
From: Arnd Bergmann <arnd@kernel.org>
To: Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Ryder Lee <ryder.lee@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Kalle Valo <kvalo@codeaurora.org>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, YN Chen <YN.Chen@mediatek.com>,
 Deren Wu <deren.wu@mediatek.com>, Leon Yen <Leon.Yen@mediatek.com>,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] mt76: mt7663s: fix link error with CONFIG_PM=n
Date: Tue, 26 Oct 2021 10:33:09 +0200
Message-Id: <20211026083326.3421663-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_013332_576173_C3A45DF0 
X-CRM114-Status: GOOD (  10.09  )
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

The generic register access functions are compiled conditionally,
causing a link failure in some randconfig builds:

ERROR: modpost: "mt76_connac_mcu_reg_wr" [drivers/net/wireless/mediatek/mt76/mt7615/mt7663s.ko] undefined!
ERROR: modpost: "mt76_connac_mcu_reg_rr" [drivers/net/wireless/mediatek/mt76/mt7615/mt7663s.ko] undefined!

Move them out of the #ifdef block.

Fixes: 02fbf8199f6e ("mt76: mt7663s: rely on mcu reg access utility")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index 32e25180fc1e..26b4b875dcc0 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -2477,6 +2477,7 @@ void mt76_connac_mcu_set_suspend_iter(void *priv, u8 *mac,
 	mt76_connac_mcu_set_wow_ctrl(phy, vif, suspend, wowlan);
 }
 EXPORT_SYMBOL_GPL(mt76_connac_mcu_set_suspend_iter);
+#endif /* CONFIG_PM */
 
 u32 mt76_connac_mcu_reg_rr(struct mt76_dev *dev, u32 offset)
 {
@@ -2505,7 +2506,6 @@ void mt76_connac_mcu_reg_wr(struct mt76_dev *dev, u32 offset, u32 val)
 	mt76_mcu_send_msg(dev, MCU_CMD_REG_WRITE, &req, sizeof(req), false);
 }
 EXPORT_SYMBOL_GPL(mt76_connac_mcu_reg_wr);
-#endif /* CONFIG_PM */
 
 MODULE_AUTHOR("Lorenzo Bianconi <lorenzo@kernel.org>");
 MODULE_LICENSE("Dual BSD/GPL");
-- 
2.29.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
