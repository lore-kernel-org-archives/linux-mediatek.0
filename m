Return-Path: <SRS0=Xfv2=ZX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA426C432C0
	for <linux-mediatek@archiver.kernel.org>; Sun,  1 Dec 2019 18:18:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2FE22071F
	for <linux-mediatek@archiver.kernel.org>; Sun,  1 Dec 2019 18:18:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Cns69ysX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C2FE22071F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=centosproject.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=2rbolLNDDerXmo2jaseCEzwwA+hGcEaBsWiknE68EWs=; b=Cns
	69ysXAvFLKHRUAYYlgWWorqX8o01tKNfhHupEPlrYdT+EA9WzVqoJaJwFKnQK5s3Ogofo03TGQhg2
	M3QG0r+g6S5erzGHrUV7oy2Q1lJ5KoO05n2GmDAJQD26tDVXIhmzIcT2+COZftB1AuzpXQEf4Gz+c
	z6CebQrMuQAbrFoMHnZ1P+4sdo3Huh6Vqrpnr9vle+p6Vm4mpTIGWb8bJW3wGcayWABLhYHv1txXe
	PKb0FZCIU47JGn2QddcqMXe3Ht16ma844/t+u7ENZcgoah/FsMB78kpF1UbOIryC7rqCjJmgaWXbn
	2v0HZ0V898dftMZstTCyiCNe6LlNBZQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ibTnK-0007yC-Qa; Sun, 01 Dec 2019 18:18:06 +0000
Received: from mail2.sp2max.com.br ([138.185.4.9])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ibTn8-0007HA-Fj; Sun, 01 Dec 2019 18:17:56 +0000
Received: from pgsop.sopnet.com.ar (unknown [179.40.38.12])
 (Authenticated sender: pablo@fliagreco.com.ar)
 by mail2.sp2max.com.br (Postfix) with ESMTPA id 5618C7B30BD;
 Sun,  1 Dec 2019 15:17:40 -0300 (-03)
From: Pablo Greco <pgreco@centosproject.org>
To: 
Subject: [PATCH v1] mt76: mt7615: Fix build with older compilers
Date: Sun,  1 Dec 2019 15:17:10 -0300
Message-Id: <20191201181716.61892-1-pgreco@centosproject.org>
X-Mailer: git-send-email 2.18.1
X-SP2Max-MailScanner-Information: Please contact the ISP for more information
X-SP2Max-MailScanner-ID: 5618C7B30BD.A1C61
X-SP2Max-MailScanner: Sem Virus encontrado
X-SP2Max-MailScanner-SpamCheck: nao spam, SpamAssassin (not cached,
 escore=-2.9, requerido 6, autolearn=not spam, ALL_TRUSTED -1.00,
 BAYES_00 -1.90)
X-SP2Max-MailScanner-From: pgreco@centosproject.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191201_101754_704824_4E500695 
X-CRM114-Status: UNSURE (   6.03  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Ryder Lee <ryder.lee@mediatek.com>, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, Pablo Greco <pgreco@centosproject.org>,
 linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Roy Luo <royluo@google.com>, Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Kalle Valo <kvalo@codeaurora.org>,
 Felix Fietkau <nbd@nbd.name>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Some compilers (tested with 4.8.5 from CentOS 7) fail properly process
FIELD_GET inside an inline function, which ends up in a BUILD_BUG_ON.
Convert inline function to a macro.

Fixes commit bf92e7685100 ("mt76: mt7615: add support for per-chain
signal strength reporting")
Reported in https://lkml.org/lkml/2019/9/21/146

Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Pablo Greco <pgreco@centosproject.org>
---
 drivers/net/wireless/mediatek/mt76/mt7615/mac.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
index c77adc5d2552..77e395ca2c6a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
@@ -13,10 +13,7 @@
 #include "../dma.h"
 #include "mac.h"
 
-static inline s8 to_rssi(u32 field, u32 rxv)
-{
-	return (FIELD_GET(field, rxv) - 220) / 2;
-}
+#define to_rssi(field, rxv)		((FIELD_GET(field, rxv) - 220) / 2)
 
 static struct mt76_wcid *mt7615_rx_get_wcid(struct mt7615_dev *dev,
 					    u8 idx, bool unicast)
-- 
2.18.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
