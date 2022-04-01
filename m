Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40A64C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Apr 2022 14:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KwfLSecLmgh/bKXVGk0D4tuMSK25vCR5WPTdgaGxeZY=; b=XY/2cSSuPVlZAG
	zC3OF/TGUI61+kkz99fRVBnQ1fgOmkAYj6Vqf4EZPxoElRiz/cG5DCzAWUCvWI/+tZItQZ9vcFz78
	TpINfxSUJRct0EBlMxPci2IVKzMY0uFrYCYj7UCnoudKeDn8VYnA3u/31uZOWkZUXKjg7uvIXKUHz
	FzuFrpMpHf+NnwLj2nidTenOaWzZSjEzQS7oKWBJ6GiLlNgay357ygFPsWNzRV/R3lm+Uj0k2hI/S
	ZS957TUL+dnuSF/LMvKYokQSF64io5N2EsxAiVkNkjJlkrkonuo0hWPUTIcFkJtAFP0rvfvxGp4kH
	haoFurqWT4QrlkmEM+uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naIaC-006DGW-JM; Fri, 01 Apr 2022 14:49:00 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naIRz-0068hP-VB; Fri, 01 Apr 2022 14:40:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7B9DCB8240E;
 Fri,  1 Apr 2022 14:40:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DD15C2BBE4;
 Fri,  1 Apr 2022 14:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648824029;
 bh=9Wc3k6gE6jmVeDTnq2FcMaJX6Ctbq58Pzce8ZBN2X+c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HBi+scHJlORbjdv5JIfJwlokRmWF/VVoBT+JgjB+MadOsxqd1Mli4e+XMpHyZRM/9
 SWiPcWBhe5MBsBu6kOq8yKUjA9ddTY+nyz04JLcWWXdLiJFeoHFWeSX/nBAYybKe4C
 Lnzsu7iuNLjCtbZrc/wsqN1pmeUihiA9I2hYUKUI0L6pxtOWuXDSgrwOfZcX+VIwoS
 l4PUFWwgwMkq6+dB2d1gyDNrAnOKsxqaiBS4jqeCc7bNh6XXmhgjxr81hMVIEo/PIY
 lFtYAPumZbiZfPlzxlB0QzNYG/x59dSaUAA9JCl5vHpC7UVZBDBp+LtM9Hg2Er3Mqc
 XD0OXYMRUXI6A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Johan Almbladh <johan.almbladh@anyfinetworks.com>,
 Felix Fietkau <nbd@nbd.name>, Sasha Levin <sashal@kernel.org>,
 lorenzo.bianconi83@gmail.com, ryder.lee@mediatek.com, kvalo@kernel.org,
 davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, Bo.Jiao@mediatek.com, shayne.chen@mediatek.com,
 greearb@candelatech.com, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.15 58/98] mt76: mt7915: fix injected MPDU
 transmission to not use HW A-MSDU
Date: Fri,  1 Apr 2022 10:37:02 -0400
Message-Id: <20220401143742.1952163-58-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220401143742.1952163-1-sashal@kernel.org>
References: <20220401143742.1952163-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220401_074032_183108_CA177354 
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
index ff613d705611..7691292526e0 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -899,6 +899,7 @@ mt7915_mac_write_txwi_80211(struct mt7915_dev *dev, __le32 *txwi,
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
