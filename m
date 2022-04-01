Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F844C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Apr 2022 14:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=il9GxisfXU7mLeh3g27vJs1F/x+PSKE/aNsuNABxgK4=; b=VNwFDgRjg2WbMi
	hJTcJTsB1R1A1Zd379UCsYzj2ccO2yIqooN3JKSMyF+GLJSzcu+H8VYwk5tx+VIKCmTvOMbKX4JP7
	XvC9AwIz+OcIAsReFXBJvxk0vNOIxAnWRg8mUPEWt+Rz9p0x2mWORAsKE36CyVJkViEtwRSbVy1lN
	0KuFZYZHks7ze14vRJgtESkV+tbAcTJ+KmlT7eF3wEyoluHHpnnr9lGyZPkEaebykRgrogoemGCWu
	U7eQ+0WTUwb0meQFRX/ik+H0SJjZDBnrN4Qj8y+C5bL+/rysaGy9OnyOkeBKBWm2XfeWOvW3K1Xf5
	p9p9zbV79xmVeDs6CO3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naIUZ-0069yj-Q5; Fri, 01 Apr 2022 14:43:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naINj-0066PE-F5; Fri, 01 Apr 2022 14:36:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C21BC60A53;
 Fri,  1 Apr 2022 14:36:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29766C2BBE4;
 Fri,  1 Apr 2022 14:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648823766;
 bh=zq+1QPbSekVzYFU/HR9QExlr4oS2/VMpbbXHvi4dsvA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jKiU8gUVHthbgpLbXtqI8ZH6Mj9hV7x22H1IZNSIs0Tylr2FRT3pyhb9wQeS10+xt
 EWOEGq5CzRFfRXhrW6MJ6mrvoWzG8EbJcH48aibkmD0eclWg2aG1dZnHcLBCeJ3BR6
 1tKTqFHxw34ShSdEkopX46rizJfQe7lVLAI5+yCvv8q6P1EjgSj8/n3rRFf/zgWQGR
 jTZEYFyQV/drRKdK7YMQ8PBICdV/5dLeGEYizRzY2ytJV2JamczOoKC99TE23Oi2Pe
 uMV5FKGJR4IokUNOQfVgzqle4Ar0iss9JSBf/bWpKXINc/0zE0KLncnYEpHez0CfnP
 5DgWrCasU3O5A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Johan Almbladh <johan.almbladh@anyfinetworks.com>,
 Felix Fietkau <nbd@nbd.name>, Sasha Levin <sashal@kernel.org>,
 lorenzo.bianconi83@gmail.com, ryder.lee@mediatek.com, kvalo@kernel.org,
 davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, Bo.Jiao@mediatek.com, sujuan.chen@mediatek.com,
 shayne.chen@mediatek.com, greearb@candelatech.com,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.16 069/109] mt76: mt7915: fix injected MPDU
 transmission to not use HW A-MSDU
Date: Fri,  1 Apr 2022 10:32:16 -0400
Message-Id: <20220401143256.1950537-69-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220401143256.1950537-1-sashal@kernel.org>
References: <20220401143256.1950537-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220401_073607_577844_E4A8CC6F 
X-CRM114-Status: GOOD (  13.42  )
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

From: Johan Almbladh <johan.almbladh@anyfinetworks.com>

[ Upstream commit 28225a6ef80ebf46c46e5fbd5b1ee231a0b2b5b7 ]

Before, the hardware would be allowed to transmit injected 802.11 MPDUs
as A-MSDU. This resulted in corrupted frames being transmitted. Now,
injected MPDUs are transmitted as-is, without A-MSDU.

The fix was verified with frame injection on MT7915 hardware, both with
and without the injected frame being encrypted.

If the hardware cannot do A-MSDU aggregation on MPDUs, this problem
would also be present in the TX path where mac80211 does the 802.11
encapsulation. However, I have not observed any such problem when
disabling IEEE80211_HW_SUPPORTS_TX_ENCAP_OFFLOAD to force that mode.
Therefore this fix is isolated to injected frames only.

The same A-MSDU logic is also present in the mt7921 driver, so it is
likely that this fix should be applied there too. I do not have access
to mt7921 hardware so I have not been able to test that.

Signed-off-by: Johan Almbladh <johan.almbladh@anyfinetworks.com>
Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index 38d66411444a..93aa2242c0d9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -982,6 +982,7 @@ mt7915_mac_write_txwi_80211(struct mt7915_dev *dev, __le32 *txwi,
 		val = MT_TXD3_SN_VALID |
 		      FIELD_PREP(MT_TXD3_SEQ, IEEE80211_SEQ_TO_SN(seqno));
 		txwi[3] |= cpu_to_le32(val);
+		txwi[7] &= ~cpu_to_le32(MT_TXD7_HW_AMSDU);
 	}
 
 	val = FIELD_PREP(MT_TXD7_TYPE, fc_type) |
-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
