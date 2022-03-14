Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F079C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Mar 2022 11:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k59uIMN7EZUeOLYb2APsp8u1IK98INHjzopkrjMTujw=; b=yAgK7yffLWnK5o
	QCNEJIEMuywK9NfcsGTzeNQFNfVi9bjyF3JryMKzqDy84FEEO7v2fs++nhNxpwimTzlFSlhxAJxZf
	lnU8bFOYzlP//eBhhy2AMlSETnbCBmPBw8kk9QezoWol48PzQgSJVPrD4Vqyblbs8A9HwzRnoPuC2
	D4NGxiojWQJkVBqcSxKTtJPFjKLPAEGfTDQbSUY2wpSyB6FeeAeXx7gd/kyqQ3xE0tmsrIroON7+G
	KE2n/Zm59nGaZ/rKqj7Pc7qe2KE7VkVvusNgfY63JJwm+lyfn1KEkM4uaacbrVKqlkM1muXDOENo7
	eApRwXKxdnXme6pv/jVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTjHm-005FrG-9O; Mon, 14 Mar 2022 11:54:50 +0000
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTjH5-005FQy-8n; Mon, 14 Mar 2022 11:54:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inria.fr; s=dc;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=P+KrW1jXCt0PEEPOuaK3dp4Clrh1+zr07rorixakTGM=;
 b=veo7lxbt84IQANJeh6++L+J1SNK/v2rb1WrNVPKQqVjIF7dobpnEsPkk
 SblhHr4E2Tvwk/XlO5EVssiBQCP2EWHgINi3R7m28eyEEqxORO0ETjHMk
 VN64AU0c0oBRoJIfPOtDdQ8ITtCOHaranOSHqr6Q29XBUYHOKGDW1oUc7 I=;
Authentication-Results: mail2-relais-roc.national.inria.fr;
 dkim=none (message not signed) header.i=none;
 spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr;
 dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.90,180,1643670000"; d="scan'208";a="25997343"
Received: from i80.paris.inria.fr (HELO i80.paris.inria.fr.) ([128.93.90.48])
 by mail2-relais-roc.national.inria.fr with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2022 12:53:59 +0100
From: Julia Lawall <Julia.Lawall@inria.fr>
To: Felix Fietkau <nbd@nbd.name>
Cc: kernel-janitors@vger.kernel.org,
 Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Kalle Valo <kvalo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 10/30] mt76: mt7915: fix typos in comments
Date: Mon, 14 Mar 2022 12:53:34 +0100
Message-Id: <20220314115354.144023-11-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220314115354.144023-1-Julia.Lawall@inria.fr>
References: <20220314115354.144023-1-Julia.Lawall@inria.fr>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_045407_605204_1FCCD16F 
X-CRM114-Status: UNSURE (   9.95  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Various spelling mistakes in comments.
Detected with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/net/wireless/mediatek/mt76/mt7915/init.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
index fd16d777f2e4..ab2a1a5f7811 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
@@ -579,7 +579,7 @@ static void mt7915_wfsys_reset(struct mt7915_dev *dev)
 		val &= ~MT_TOP_PWR_SW_RST;
 		mt76_wr(dev, MT_TOP_PWR_CTRL, val);
 
-		/* release wfsys then mcu re-excutes romcode */
+		/* release wfsys then mcu re-executes romcode */
 		val |= MT_TOP_PWR_SW_RST;
 		mt76_wr(dev, MT_TOP_PWR_CTRL, val);
 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
