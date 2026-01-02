Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4230AEEE25C
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Jan 2026 11:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5eDmuxeBKqxAvpPlf54pPiQwnDHnIGjwV/ubt2AS96o=; b=ca1dPxTTwHss5/OPeHvag8CEyj
	DQeRDr9hUAWlXcutdemePB783SFJg861hkINjgiQtWw17h94z6qE4byeomuvjRkIuOVKQFsOb8YMh
	RefzWxpi3DCnY+I0PvDJEw5I4iPjkAf2HKoJlrEAM4HSB3Fc3ndOrSfrJnmeXYsuHLC6lgHI0rEvF
	DsSTz9k/YChOK6wVM2ZETmiUu312eCmye8ZpJOSn76sBneSOiGn4JKS52kyvhR9/M28zEopprjY64
	UCx2cN+QWmXT+jub+wBPCCltx7g1n+rt2Xmpq0ow3JJFUN0BQDG1cCt9XmHnv0OJvZfTzYtv49V6a
	8jZw9I3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbdMK-000000088Xb-1wVF;
	Fri, 02 Jan 2026 11:30:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbdMH-000000088VZ-3Hs0;
	Fri, 02 Jan 2026 11:30:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 715BD4026B;
	Fri,  2 Jan 2026 11:30:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF640C116B1;
	Fri,  2 Jan 2026 11:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767353416;
	bh=or02hWfFzsrtbur0hDbE8xSMzdZ9lK0cgMTmu6IuI1c=;
	h=From:Date:Subject:To:Cc:From;
	b=BNAJOBvnChOOKtFTVFL8KxwB20Vn7X0ibQxbfoB34v8eD4R5njBLnXLefMLCnsVse
	 vFJgObKrbjpCr1+msGtAbnS7c5TYCb74cbR1vKm/VK2jflGtCQBJMd8vnasiVwmmVg
	 i0nNXvSXDsKM4kmjSz2VyoPtmPCHryOHasoMe57Hp3TcG4HYmPcSW7L3fnTCmcBr1h
	 dL0HrBj5bRKfNgOtfS/W7vLp4WqsrJhUJQ/6Flyti5TooJZ4YAuKTR0k8A8mAA4nPE
	 92cVOVLBoxBegoQXpXweOf87zVGXxKeWjLDkr4pij5WLnO8r34r13kyEVs7mF+o30V
	 GiAzpM/Hpr9EQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Fri, 02 Jan 2026 12:29:38 +0100
Subject: [PATCH net] net: airoha: Fix npu rx DMA definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260102-airoha-npu-dma-rx-def-fixes-v1-1-205fc6bf7d94@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MMQqAMAxA0auUzAbaIqJeRRxiGzWDVVIUQby7x
 fHx4T+QWYUz9OYB5Uuy7KnAVQbCSmlhlFgM3vrGOuuRRPeVMB0nxo1Qb4w84yw3Z2xt3TruJuc
 DQTkcyn8og2F83w/EDYPCbQAAAA==
X-Change-ID: 20260102-airoha-npu-dma-rx-def-fixes-80481e9b12ca
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, Lorenzo Bianconi <lorenzo@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_033017_846629_071DD4C8 
X-CRM114-Status: UNSURE (   8.34  )
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

Fix typos in npu rx DMA descriptor definitions.

Fixes: b3ef7bdec66fb ("net: airoha: Add airoha_offload.h header")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 include/linux/soc/airoha/airoha_offload.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/soc/airoha/airoha_offload.h b/include/linux/soc/airoha/airoha_offload.h
index 4d23cbb7d407596a6180eba7d7c8ca2b3949ed09..ab64ecdf39a06dd1ceb461fafc5e1437edb6141c 100644
--- a/include/linux/soc/airoha/airoha_offload.h
+++ b/include/linux/soc/airoha/airoha_offload.h
@@ -71,12 +71,12 @@ static inline void airoha_ppe_dev_check_skb(struct airoha_ppe_dev *dev,
 #define NPU_RX1_DESC_NUM	512
 
 /* CTRL */
-#define NPU_RX_DMA_DESC_LAST_MASK	BIT(29)
-#define NPU_RX_DMA_DESC_LEN_MASK	GENMASK(28, 15)
-#define NPU_RX_DMA_DESC_CUR_LEN_MASK	GENMASK(14, 1)
+#define NPU_RX_DMA_DESC_LAST_MASK	BIT(27)
+#define NPU_RX_DMA_DESC_LEN_MASK	GENMASK(26, 14)
+#define NPU_RX_DMA_DESC_CUR_LEN_MASK	GENMASK(13, 1)
 #define NPU_RX_DMA_DESC_DONE_MASK	BIT(0)
 /* INFO */
-#define NPU_RX_DMA_PKT_COUNT_MASK	GENMASK(31, 28)
+#define NPU_RX_DMA_PKT_COUNT_MASK	GENMASK(31, 29)
 #define NPU_RX_DMA_PKT_ID_MASK		GENMASK(28, 26)
 #define NPU_RX_DMA_SRC_PORT_MASK	GENMASK(25, 21)
 #define NPU_RX_DMA_CRSN_MASK		GENMASK(20, 16)

---
base-commit: dbf8fe85a16a33d6b6bd01f2bc606fc017771465
change-id: 20260102-airoha-npu-dma-rx-def-fixes-80481e9b12ca

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


