Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A43BC77B6E
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Apr 2023 06:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pAW2mTr1xSgU+sQfj1rZtp8QmblDIZAu9FC32yQc2aI=; b=4r3cHBLDY3W0Uqkz59AHKoTpBN
	kvw82a1jSzPVHL4yt6lwMVXyyNRQNON/fbPQIqtpoP1PStqhYyfdoNrpj9Lp4106JiZ8upp4bIphi
	ze0B0AdgYtJUaQOSyyVL/GtGjfhRvIyayJW7qJGAR5fvSCnRb1qvKTBqkFhCFZfY4+XfBpvN3DYF+
	01ooeQ8ko9/rxtltNsXYGKS8t6PNbvrZVV3uPVo+UK6ZIe2/++pukxUvKL7rQPJdSQ1GlvGgBz9ZM
	jhsaKKrDdo2433XPBERrfYE2Ce8mfDyIp4HExYMKVNhFg8Oei+zU1hvfnYnwYxXszxLPnWmumAd4B
	FXE+ez0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmTu8-001xOQ-2B;
	Wed, 12 Apr 2023 06:24:28 +0000
Received: from mail.hust.edu.cn ([202.114.0.240] helo=hust.edu.cn)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmTu5-001xLn-0Q;
	Wed, 12 Apr 2023 06:24:27 +0000
Received: from C512-C06.localdomain ([10.12.190.72])
	(user=jiefeng_li@hust.edu.cn mech=LOGIN bits=0)
	by mx1.hust.edu.cn  with ESMTP id 33C6MidG003133-33C6MidH003133
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 12 Apr 2023 14:22:48 +0800
From: Jiefeng Li <jiefeng_li@hust.edu.cn>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
        Ryder Lee <ryder.lee@mediatek.com>,
        Shayne Chen <shayne.chen@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>, Kalle Valo <kvalo@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Jiefeng Li <jiefeng_li@hust.edu.cn>, Dongliang Mu <dzm91@hust.edu.cn>,
        linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH] wifi: mt76: mt7921: fix missing unwind goto in `mt7921u_probe`
Date: Wed, 12 Apr 2023 14:22:34 +0800
Message-Id: <20230412062234.4810-1-jiefeng_li@hust.edu.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-FEAS-AUTH-USER: jiefeng_li@hust.edu.cn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_232425_554920_E5CB6488 
X-CRM114-Status: GOOD (  11.65  )
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

`mt7921u_dma_init` can only return zero or negative number according to its
definition. When it returns non-zero number, there exists an error and this
function should handle this error rather than return directly.

Fixes: 0d2afe09fad5 ("mt76: mt7921: add mt7921u driver")
Signed-off-by: Jiefeng Li <jiefeng_li@hust.edu.cn>
Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
---
The issue is discovered by static analysis, and the patch is not tested yet.
---
 drivers/net/wireless/mediatek/mt76/mt7921/usb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/usb.c b/drivers/net/wireless/mediatek/mt76/mt7921/usb.c
index 8fef09ed29c9..70c9bbdbf60e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/usb.c
@@ -272,7 +272,7 @@ static int mt7921u_probe(struct usb_interface *usb_intf,
 
 	ret = mt7921u_dma_init(dev, false);
 	if (ret)
-		return ret;
+		goto error;
 
 	hw = mt76_hw(dev);
 	/* check hw sg support in order to enable AMSDU */
-- 
2.34.1


