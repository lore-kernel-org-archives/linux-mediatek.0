Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69A5EC4321E
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 May 2022 13:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1EoyVHscZHmN6+u24kCzaDhWgLfVZ/cd2TQco1CYNSw=; b=R6fuui6SmOvQW9
	Pv7vmEbOpLSTMoxC9KfMAwenL+Ly2j4xkrSkG3umGu80+zIgUdt+pc0GO7Nqc90x8s1aJGpU0Pm3F
	8UAQux5uOT7Sn32yypbv3BSlKzeQv01hanRDWEb/yBr7Oltm6CG2N3gL6UpW7hBhIrTCyqBJfPAY+
	0ZpMwBOltqrHWnVuwzYAL+Za19/4CNmDoiqtE6DkmC2NT7XUWeZI+TMtJHmcCKzxnUXami01Vvoyc
	0qHE1WFPLMYjQLFgXO9dKzOVT7SGzxb6/PEQuYFrcv1oVJDDLWpmb1hz1Egqxh919V/JKqdLtb4fm
	bQ8ZsWRM1Xos+eC0tR5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvfUE-006j0C-U2; Mon, 30 May 2022 13:31:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvfSY-006i50-CY; Mon, 30 May 2022 13:29:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D0AC760F1C;
	Mon, 30 May 2022 13:29:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77616C341C0;
	Mon, 30 May 2022 13:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653917365;
	bh=T278upJVbk/em8SEvypNZ1SQJbk0LgQu1PtRWWC3Fk8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hmrflu6BB6qYtMwexXN4gE7m1evmgZ0KM+ezA/iXPC4KMWj6qwWieK3sm67Xz4zK/
	 Gr7stbfbNE+/dY1eeHA17hragCy13WK8KNtSflXj7DEl4tRY8ZY8FeYMySQ/9WKjVH
	 SqXFaMKdbmI3UDR9FAZtr5a7OzomvRXPU+yBxN/u4forfqhkUWuzBEsTNuKNUo0XLE
	 9S78RxnN6WMwM4BU164N6ehSqxjCBz1sZbiuTCDo5KnG9futEd03XAoE1JUZt9MNg5
	 Dg0K0ZGh5Ckv5ye9sXKb9kuKaErzTfnKau55gPYwCVgLEHSrgeYBGbI9C8u797molq
	 2PEOUaGrTEjtw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>,
	Sasha Levin <sashal@kernel.org>,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	kvalo@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	matthias.bgg@gmail.com,
	sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	xing.song@mediatek.com,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.18 110/159] mt76: mt7921: accept rx frames with non-standard VHT MCS10-11
Date: Mon, 30 May 2022 09:23:35 -0400
Message-Id: <20220530132425.1929512-110-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220530132425.1929512-1-sashal@kernel.org>
References: <20220530132425.1929512-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_062926_508690_D43D6B2C 
X-CRM114-Status: GOOD (  13.34  )
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

From: Felix Fietkau <nbd@nbd.name>

[ Upstream commit 3128ea016965ce9f91ddf4e1dd944724462d1698 ]

The hardware receives them properly, they should not be dropped

Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7921/mac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
index 233998ca4857..f34070ca7bbe 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
@@ -696,7 +696,7 @@ mt7921_mac_fill_rx(struct mt7921_dev *dev, struct sk_buff *skb)
 			status->nss =
 				FIELD_GET(MT_PRXV_NSTS, v0) + 1;
 			status->encoding = RX_ENC_VHT;
-			if (i > 9)
+			if (i > 11)
 				return -EINVAL;
 			break;
 		case MT_PHY_TYPE_HE_MU:
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
