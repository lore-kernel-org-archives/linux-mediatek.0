Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFBCCC77B75
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 May 2023 22:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OO++u/SVASUhji5dHgyXtQF4xbBpwscMJSU6SotHbLw=; b=xsYqrYEheoIg2DNNYkPXpvz2ms
	ttKAOfruWvebnqWAiV9WkrSO9EHzKXqfijNZBUSnE7yfxzT6uikQ/2JpuuAXfu0Ee9DhrJhcMuKv9
	5gAWmgq99240QjP6CQHHv1roKOUPBrP3VQNXtDYMllS2w3wDEMA4yycccE/ssd7gdx4of8WPgkeIB
	O2vF1cZRT6qsfnntIY7cWub90Nd/ebodHiJTLmR9D4OYGvVe5IR/T6qj74E5ThnMLHyU3X7vfOXcb
	LSU8wmGDX5IYDznwP8bfTIjw+TzOTT1GpQbwPd/MHb16frL/zLcafLSZ52+DDavp6cAeuwtnJHxC6
	eJNkGQWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyh9u-003iJn-0p;
	Mon, 15 May 2023 22:59:14 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyh9r-003iH6-0r;
	Mon, 15 May 2023 22:59:12 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pyh9V-0001yf-3C;
	Mon, 15 May 2023 22:58:50 +0000
Date: Tue, 16 May 2023 00:56:53 +0200
From: Daniel Golle <daniel@makrotopia.org>
To: Jakub Kicinski <kuba@kernel.org>, Kalle Valo <kvalo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] wifi: mt7601u: update firmware path
Message-ID: <fefcbf36f13873ae0d97438a0156b87e7e1ae64e.1684191377.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230515_155911_301675_3C64D26E 
X-CRM114-Status: UNSURE (   9.99  )
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

mt7601u.bin was moved to mediatek/ folder in linux-wireless via commit
8451c2b1 ("mt76xx: Move the old Mediatek WiFi firmware to mediatek")
and linux-firmware release 20230515.

Update the firmware path requested by the mt7601u driver to follow up
with the move of the file.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/wireless/mediatek/mt7601u/usb.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt7601u/usb.h b/drivers/net/wireless/mediatek/mt7601u/usb.h
index 9fdf35970339..66481b7e3252 100644
--- a/drivers/net/wireless/mediatek/mt7601u/usb.h
+++ b/drivers/net/wireless/mediatek/mt7601u/usb.h
@@ -8,7 +8,7 @@
 
 #include "mt7601u.h"
 
-#define MT7601U_FIRMWARE	"mt7601u.bin"
+#define MT7601U_FIRMWARE	"mediatek/mt7601u.bin"
 
 #define MT_VEND_REQ_MAX_RETRY	10
 #define MT_VEND_REQ_TOUT_MS	300

base-commit: 0d9b41daa5907756a31772d8af8ac5ff25cf17c1
-- 
2.40.1


