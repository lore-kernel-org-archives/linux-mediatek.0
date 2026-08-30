Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 167C8C61DE2
	for <linux-mediatek@archiver.kernel.org>; Sun, 30 Aug 2026 07:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q7KBSEmc46+2bR21q/TsshXTy+Zk9y7NLL/izGkQXcU=; b=1H9GJoUvpSyOGO3pZu4dOlWnKx
	ViGM7jEHXSgS/XUWhm00q/QoBMm6zOZhjjCOfj3ulWlBtqmSehRFJT35TCf5PhzKKFN4dx8gIooUo
	3R6AYQCmpaf6w0Umh8VOTMkU1o+XNdjak5o4W1ZDQojETirt3tO05CDHSqGO+wfeKfQjPqxFBxdNh
	5VPHP11T85+O3xLvFRDMLpWM3OzoEUrjyPNVb9IrVIL4wTSZAi+btW0J0c1AqR6d6c5Vgn9Mhbm3h
	VQEdwAmLVb/i2KvFcVDho4Qunl+nK8Nb6cFxL0Wtyc/nDgGyum28vMGKvY9CePnjMBM+XHU/0nvcu
	xcfWjDwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0aQS-00000007Yu3-3W1w;
	Sun, 30 Aug 2026 07:58:00 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0aQQ-00000007Ysd-23wT
	for linux-mediatek@lists.infradead.org;
	Sun, 30 Aug 2026 07:57:59 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so23284095e9.3
        for <linux-mediatek@lists.infradead.org>; Sun, 30 Aug 2026 00:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788076677; x=1788681477; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q7KBSEmc46+2bR21q/TsshXTy+Zk9y7NLL/izGkQXcU=;
        b=Mb1U9l4vnmIc4cLKbOOhoIYRb+fEba1FsT9RowF08ZnBjv7pjFbOFnI9aal7KfYwi8
         TdlMnPltA2V0HcKT5J05raBS/FEMn9ie8gNkOmclbqRmccjH9zpQQLlMp3nv8ZuUHswN
         5uFgWDmBFTAndOLc2aGjiF63ArA44OAdIj2XLxOmDlOXRYvqGV9B5EQnU9bmVJwOBz9k
         VtLr7WBhWnqM3TIzWZyF+nF9jkYbGFBW4WC2ju0jsUU5DZSongiSi5SnD7Bxho+9Q4b2
         l3Gj3oVLT5MvTyaiJ/6HsKNj0garQRFwOC60MdqqOOeOEnIwMooAN26dMlraB9nMKFGV
         AhJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788076677; x=1788681477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q7KBSEmc46+2bR21q/TsshXTy+Zk9y7NLL/izGkQXcU=;
        b=NecFN2zppsMkAMI3VCT79J412KGvJD5NMi+lALmt76lFOGn4T/TvgzDY3nop2e8mdN
         6p2qzgupOjXzoOALur7nPJFLSuNTPK0B/0sxQaMtZwYwsdUo0+VmAKBOO9i/QUrK32Io
         a4UeE4OsXojV1oLU6CSookHB0kGmlF5ljWIH0r5f2lLHi1JsMTNeGlnR/CU6knulssoe
         f8LaPn40DwiFwoiLW3YSbI3MwtJQCcz5ldaNj/oSjJnyHv6uutKB69llny+pB60hfsYT
         pe6ntoMK7+KjWCVh1nt/cb7t/nboND3Xb480DlQApjp/6AIqsmWWgLAuR9dl1g+AdgMC
         093A==
X-Forwarded-Encrypted: i=1; AHgh+Rq2KByTeDj8xKPtbNeU0s1fmgi6hXweyyNGRFW/bSBHLDRe8B4pKriQAzbA1W6vOTPVgEc7/UsqF3OQRvrUzw==@lists.infradead.org
X-Gm-Message-State: AFuF++mv03qoyG566VyMiRIVUXkvqi9TB8TmE1WuBbKqbRijRqgoYweF
	t95caFUUFFPsIIdFcfNY9BS4Mz+khkMm7lj9ao4BSZxoppOnqDjqDyM=
X-Gm-Gg: AR+sD11iDVAXiNKvXXI19Mg1V0kiqKIHd41hSuBbjZGlHffWL5isFc5xcZkpl0Ro0nk
	Ami7GUE3JABdl48H+0i6qmxt8Z48NCJcV8hw4oz4u3s+nfhDP6y6tWv0yLKl/mjpXp1wP8+C5+G
	kjHxBcTyC7oSn2u30jvdvHxxyoTcS272wnlRK/NkouBwPQf9NkvwFx07oEcUuU5F6TWFkgEjKyT
	+pptcOT2WCfqRSWk1d9RzYZ+J+Zg9ygbkfW24FyzhRUtUfBq5lx44pkblKNJdQSOQs6s5zjmvr6
	bpvqM7Zu7BzCeGck4/lubcDo5o9cOuVsF+sRC0XIubYIO+YbtpStZ9z9wpqQROqyNJ3bkBe4o3P
	dNKErwhYfid0fR1KBHGx0LnierSwHbchXnkjcUtPo4fek7t4rnB2yjCtTw06ftXfzkqAnCrKNEZ
	ugDR1/X6BiWN/4wRwzbPfzFhsiMq1udV4y3ladY07Tv9MeS7suCNE=
X-Received: by 2002:a05:600c:81ca:b0:49b:47b3:d6d with SMTP id 5b1f17b1804b1-49b91c3b7c4mr283650335e9.10.1788076676788;
        Sun, 30 Aug 2026 00:57:56 -0700 (PDT)
Received: from fedora ([46.8.219.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cd53a4678sm14757875e9.13.2026.08.30.00.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 00:57:56 -0700 (PDT)
From: Vitaliy Sochnev <sochnev.v.74@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Vitaliy Sochnev <sochnev.v.74@gmail.com>
Subject: [PATCH net 1/4] net: airoha: handle RX_NO_CPU_DSCP interrupt, not just RX_DONE
Date: Sun, 30 Aug 2026 10:57:14 +0100
Message-ID: <20260830095717.37218-2-sochnev.v.74@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260830095717.37218-1-sochnev.v.74@gmail.com>
References: <20260830095717.37218-1-sochnev.v.74@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_005758_577896_2EA69B05 
X-CRM114-Status: GOOD (  20.85  )
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

The QDMA hardware raises a dedicated interrupt (NO_CPU_DSCP, one bit
per ring in QDMA_CSR_INT_ENABLE2/3) when an RX ring runs out of free
CPU descriptors. airoha_qdma_hw_init() already unmasks this interrupt
for every ring (INT_RX1_MASK()/INT_RX2_MASK() OR it together with the
RX_DONE bits before writing the enable register), but
airoha_irq_handler() only ever extracts the RX_DONE bits from the same
status word - the NO_CPU_DSCP bits are read and acknowledged (cleared)
along with everything else at the top of the handler, then silently
dropped.

This matters because once a ring is genuinely drained to zero posted
descriptors, no further RX_DONE interrupt can fire for it: hardware
has nothing left to receive a frame into, so NAPI is never rescheduled
and airoha_qdma_fill_rx_queue() (which reposts descriptors) is never
called again. The ring is stuck until the interface is brought down
and back up.

This is most visible on rings that carry low, bursty volumes of
protocol control traffic, in particular RX ring 4, to which
airoha_fe_vip_setup() force-routes ~15 unrelated VIP-classified
protocols (BOOTP, PPPoE Discovery, ISAKMP, DHCPv6, SIP, LLDP, PPP
LCP/IPCP/CHAP/PAP/IPv6CP, ...) via PATN_FCPU_EN_MASK, all sharing the
same RX_DSCP_NUM() default of 16 descriptors. A short burst on that
ring (e.g. a DHCP lease renewal exchange, or the LCP/IPCP/CHAP/PAP
negotiation that follows a PPPoE PADO) can drain it faster than the
CPU reposts descriptors, after which every one of those protocols
silently stops being received on that device until it is reconfigured
- with no error, warning, or netdev/ethtool counter indicating why.

Fix airoha_irq_handler() to treat NO_CPU_DSCP the same as RX_DONE for
the purpose of scheduling NAPI: airoha_qdma_rx_process() already calls
airoha_qdma_fill_rx_queue() unconditionally at the end of every poll,
even when zero descriptors were reaped, so scheduling NAPI in response
to NO_CPU_DSCP is sufficient to make an emptied ring recover on its
own. airoha_qdma_rx_napi_poll() is updated to re-enable the
NO_CPU_DSCP bit alongside RX_DONE when napi_complete() runs, mirroring
the existing disable/enable dance so the interrupt isn't left masked
after its first use.

One open question worth flagging explicitly: if the underlying
no-free-descriptor condition re-latches this bit immediately after the
ack write (rather than only on the next empty->non-empty transition),
a ring that airoha_qdma_fill_rx_queue() genuinely cannot repost into
(e.g. page_pool_dev_alloc_frag() returning NULL under memory pressure)
would turn this into a self-reasserting interrupt storm on the hard
IRQ path: mask -> napi_schedule() -> poll reaps 0, refills 0 ->
napi_complete() -> unmask -> NO_CPU_DSCP fires again immediately. I
don't have documentation confirming which behavior this bit actually
has. Regardless of the answer, masking NO_CPU_DSCP until a refill
actually succeeds - the natural-looking alternative - is worse: a
fully memory-starved ring can never fire RX_DONE either (nothing was
posted for hw to complete), so that would leave it permanently dead
once the memory pressure clears rather than self-healing. A bounded
storm tied to genuine memory pressure, if that's what this is, seems
preferable to a ring with no way back either way.

Fixes: 23290c7bc190 ("net: airoha: Introduce Airoha NPU support")
Link: https://github.com/openwrt/openwrt/issues/24715
Signed-off-by: Vitaliy Sochnev <sochnev.v.74@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 28 +++++++++++++++++++-----
 1 file changed, 23 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 64619e9a704d..a3e5aaeb75b3 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -784,13 +784,15 @@ static int airoha_qdma_rx_napi_poll(struct napi_struct *napi, int budget)
 		int i, qid = q - &qdma->q_rx[0];
 		int intr_reg = qid < RX_DONE_HIGH_OFFSET ? QDMA_INT_REG_IDX1
 							 : QDMA_INT_REG_IDX2;
+		u32 bit = qid % RX_DONE_HIGH_OFFSET;
 
 		for (i = 0; i < ARRAY_SIZE(qdma->irq_banks); i++) {
 			if (!(BIT(qid) & RX_IRQ_BANK_PIN_MASK(i)))
 				continue;
 
 			airoha_qdma_irq_enable(&qdma->irq_banks[i], intr_reg,
-					       BIT(qid % RX_DONE_HIGH_OFFSET));
+					       BIT(bit) |
+					       BIT(bit + RX_NO_CPU_DSCP_LOW_OFFSET));
 		}
 	}
 
@@ -1468,16 +1470,32 @@ static irqreturn_t airoha_irq_handler(int irq, void *dev_instance)
 	if (!test_bit(DEV_STATE_INITIALIZED, &qdma->eth->state))
 		return IRQ_NONE;
 
-	rx_intr1 = intr[1] & RX_DONE_LOW_INT_MASK;
+	/* A ring can also raise NO_CPU_DSCP when it runs out of free RX
+	 * descriptors (e.g. a burst of VIP-classified control traffic
+	 * forced onto a small ring). Once a ring is fully drained no more
+	 * RX_DONE interrupts can fire for it, since there are no free
+	 * descriptors left for hardware to receive into, so without this
+	 * NAPI is never rescheduled and the ring never gets refilled again.
+	 * Treat NO_CPU_DSCP the same as RX_DONE for scheduling NAPI:
+	 * airoha_qdma_rx_process() unconditionally calls
+	 * airoha_qdma_fill_rx_queue() at the end of every poll, even when
+	 * zero descriptors were reaped, so this alone is enough to recover
+	 * the ring.
+	 */
+	rx_intr1 = intr[1] & (RX_DONE_LOW_INT_MASK | RX_NO_CPU_DSCP_LOW_INT_MASK);
 	if (rx_intr1) {
 		airoha_qdma_irq_disable(irq_bank, QDMA_INT_REG_IDX1, rx_intr1);
-		rx_intr_mask |= rx_intr1;
+		rx_intr_mask |= (rx_intr1 & RX_DONE_LOW_INT_MASK) |
+				((rx_intr1 & RX_NO_CPU_DSCP_LOW_INT_MASK) >>
+				 RX_NO_CPU_DSCP_LOW_OFFSET);
 	}
 
-	rx_intr2 = intr[2] & RX_DONE_HIGH_INT_MASK;
+	rx_intr2 = intr[2] & (RX_DONE_HIGH_INT_MASK | RX_NO_CPU_DSCP_HIGH_INT_MASK);
 	if (rx_intr2) {
 		airoha_qdma_irq_disable(irq_bank, QDMA_INT_REG_IDX2, rx_intr2);
-		rx_intr_mask |= (rx_intr2 << 16);
+		rx_intr_mask |= ((rx_intr2 & RX_DONE_HIGH_INT_MASK) |
+				 ((rx_intr2 & RX_NO_CPU_DSCP_HIGH_INT_MASK) >>
+				  RX_NO_CPU_DSCP_LOW_OFFSET)) << 16;
 	}
 
 	for (i = 0; rx_intr_mask && i < ARRAY_SIZE(qdma->q_rx); i++) {
-- 
2.55.0


