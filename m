Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C866C606A31A
	for <linux-mediatek@archiver.kernel.org>; Sat, 31 Oct 2026 01:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Yqxs6fmD;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qGk7yud8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=u6n9A3ZneE8NABlrOWtzgZuqAMh0oDJ8q3EQsuGSkn0=; b=Yqxs6fmDp0NpaUDv/1AsAdIs1z
	+IBRgk5hWMwEXw5wGXELY7awq6SV7U2yq/haIi5Zcwo/ZCOzjxC1cr1RPXDLvTB1Ns1Y/G/+fN6D9
	Y/NnMp0E2YeXUTmK1W+LoER/Fy6s+o5mmLijy+cXLLMgrQBtY+056cg74ei2+oL09f7meI/5hk2N7
	MjIp31TsfDI0eNfm7o/c2riwX17YH01EixFRtkOmkdfed6EAYJUBkm1ZWWf1dpkc/7rgT9+Q8TPQM
	JaJsLcxSw4f/5SwtBsyskmlEcIpn78ePOSHGrfCRTmvxye6CZblDGDoQAXG0lX6ZtiSJJnO4+0A7k
	SGA7mbHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMxcd-0000000ConA-13DW;
	Sat, 31 Oct 2026 01:11:03 +0000
Received: from mail-dl1-x1235.google.com ([2607:f8b0:4864:20::1235])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMxcZ-0000000ColZ-47hj
	for linux-mediatek@lists.infradead.org;
	Sat, 31 Oct 2026 01:11:01 +0000
Received: by mail-dl1-x1235.google.com with SMTP id a92af1059eb24-1a2af4c8d00so421133c88.0
        for <linux-mediatek@lists.infradead.org>; Fri, 30 Oct 2026 18:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793409059; x=1794013859; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=u6n9A3ZneE8NABlrOWtzgZuqAMh0oDJ8q3EQsuGSkn0=;
        b=qGk7yud8AI+S0vSEs9q55E6yrmH1Ooam3qCEuDrRZFg6EkXlcLpvH4KYZ1mabVWcyy
         RRX1psrKNgYK4bVX39rbACqwcVBa4+d6yIM+GAyIC3JgeaeItEtsasos11o8mk/kt7L8
         cdJhw0SEMrLPj2SaT1gdEktoASf0pf3ibOVPhP3+WMwe2tVvCPUDTH0e9zhSJq2VOHlW
         s2Jn+TFcb25uviRYf+IKfA0eSxNPGpuQx9sx5srZJIegrWOYHLKiICZtRwFEJCH1NAY9
         yDKrMMx6VZoc5DJDlXwQqPAsKAanZZQ2uPtm+1MIeD2G6GGuwYwJm7KFuMfwIDDWchAZ
         tkug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793409059; x=1794013859;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u6n9A3ZneE8NABlrOWtzgZuqAMh0oDJ8q3EQsuGSkn0=;
        b=YCmOrjYlBqtplIDf4kx1Twe4y3RdOm6xWlrqAc1Yp3CplWUXwan5jHFk6BBD2cCdzW
         fXSiWpajuHnRIuOGQzHI4tYBMGYWAQyz0AlSXUEQZUqcCb2MgfZP2VwRxlOdEqlewQU7
         Y0y7R6FLmLg6MQPyGV8unQmQ9VCnllcWTyy26EGF0iC9jWkwPGIVYmmzVP9jD4QuWErZ
         YsqY0ifNQgbqkOX4a+stYXVwJk/LohZKaW+59xmPM27pb9BHvFHOjI1buEPpo5aIvI5a
         18rI04foPlaHLdCA6w6/iZjXY/3xxHJzMak1zwX4bWF2ZLyCZmWUkzw7qpbMLaU/cNWF
         ZobQ==
X-Forwarded-Encrypted: i=1; AKwUvBzjrL8EogkIYofkQx+4csT/yQPEKNMarwlt5wzddLecNQPO46fXDPzKxyH/dtPb5JACMa4rYLw8jBDU3fOlbQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYIpFr1TC6hNTbwLWHkaMpVoH8JW87csXCKUBdoFBjvFnZZayhck
	/cw9XVV/r2SL+lyTzN8m3cJf1yDwta00bCHCLFLyLPOc7VY9LSqQNOlG
X-Gm-Gg: AYBFou0W8EIl7/rN58w83uQFvhRvN9uzvG/Pux4Uxr8/GO3WSbFWp1sU7NnSLasys/R
	bFnOWXHqRI7Bqui1ppID8CivPPal58Z4L4nw5fHW+SJh6eM8hJNhtoMLb/7izlx2JDCFMMbm+uT
	5nODa+ZRW6IX+1ofjs1k++IKXZHWhAY2xINYeTLMGqX5sIoB2F1ZeYdCyiV+dNtxXjGx+Greal2
	IyJb+pD1kX9k2sNo2aEt0Pan5ypSTbx35syF8wY+daYemfBU0TRtnm4bWnO3JTX6r6mQg2A8xHO
	msIEml5187tUSwvpql9Ceaz1qVSBKh/dRxVJCtzU25BubW0G+WePszQIo3nyveGNTQD5rrddapP
	UrpKMKFypXjJL5v5nwtAnG101ihpJSIpM1fAoyBW60iJO1CwR9yo24kaWK3G8jpocOONn+h+6ir
	LM2JwMH5n6+94mLT+K2Gv2/iArv+GnSHjBkCiE6dL4D1Qzb6t8Mcewf5oPeE7bmVsCqywu4BjQt
	Q6XrN+jlEAojDsvlZVjUWxIUXj0WYM1ljhLupKLi0hfakPh2UADWOIVeCbgAokmTZoFu/4AMXv0
	MrUuz7ebrQE9bsVa2RQvrhWTCtiAasRsxRqU3Grwc/2e0cn7J8Yi8jOoSWyU0V6hb/1MTrRiREo
	A3b2mEF7qVJN3Fu/JDbjsQ+LL+eWcf+HvuoDHYKC6RdDXKw4pp7ETQoEp3ylnsGhxqYL//j/jVR
	APLGfivpl3TokNwNo=
X-Received: by 2002:a05:701b:424e:10b0:1a1:47b2:5512 with SMTP id a92af1059eb24-1ac5b7dfd1cmr5677779c88.26.1793409058894;
        Fri, 30 Oct 2026 18:10:58 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac18458e07sm9900636c88.8.2026.10.30.18.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 18:10:58 -0700 (PDT)
From: Samarth Narang <samarth.colleges@gmail.com>
To: Qii Wang <qii.wang@mediatek.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-i2c@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Samarth Narang <samarth.colleges@gmail.com>
Subject: [RFC PATCH] i2c: mediatek: stop APDMA before releasing DMA buffers on timeout
Date: Sat, 31 Oct 2026 01:10:53 +0000
Message-Id: <20261031011053.3370685-1-samarth.colleges@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_181100_028433_065EB5BE 
X-CRM114-Status: GOOD (  17.58  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

mtk_i2c_do_transfer() unmaps the DMA buffers and releases the DMA-safe
message buffers through i2c_put_dma_safe_msg_buf() immediately after the
completion wait, before checking whether the transfer completed
successfully.

If the wait times out, APDMA reset occurs only later, through
mtk_i2c_init_hw(), with i2c_dump_register() running between buffer
release and the reset.

A completion timeout does not establish that APDMA has stopped accessing
memory. For example, a target may hold SCL low until the adapter times
out and then release it. If APDMA resumes the remaining RX transfer
before it has been stopped, it could write into memory whose DMA mapping
has already been released and whose bounce buffer may have been freed or
reused. With SWIOTLB, a released bounce slot could also be reassigned to
another mapping.

Commit aafced673c06 ("i2c: mediatek: move dma reset before i2c reset")
previously addressed APDMA accesses to DRAM after the transfer buffer
was freed by changing the reset order in mtk_i2c_init_hw(). However, the
reset still occurs after mtk_i2c_do_transfer() has released the DMA
buffers.

Move APDMA shutdown ahead of buffer teardown on timeout and ACK-error
paths. Request an APDMA warm reset and wait for the enable bit to clear
before unmapping and releasing the buffers.

If APDMA cannot be confirmed to have stopped, retain the mappings and
buffers rather than potentially returning memory that the controller can
still access. This intentionally sacrifices memory reclamation on the
failed-stop path to avoid unsafe reuse.

The change is conditional on the APDMA reset and status operations
providing the necessary hardware-retirement guarantee.

Fixes: ce38815d39ea ("I2C: mediatek: Add driver for MediaTek I2C controller")
Assisted-by: LLM
Signed-off-by: Samarth Narang <samarth.colleges@gmail.com>
---
This issue was identified through static analysis and model checking and
the patch has been compile-tested with arm64 defconfig and the driver
enabled, using W=1, without new warnings. It has not been tested on
hardware.

I am submitting this as an RFC because the hardware-retirement guarantee
remains uncertain. I would appreciate clarification on the following
points:

1. APDMA warm-reset semantics. Does writing I2C_DMA_WARM_RST to
   OFFSET_RST abort an outstanding transfer, and does observing
   I2C_DMA_START_EN clear in OFFSET_EN guarantee that APDMA will issue
   no further memory writes, including writes already accepted by the
   interconnect?

2. SoC-specific synchronization. The multi-message apdma_sync path polls
   OFFSET_RST until I2C_DMA_WARM_RST clears and additionally sets
   I2C_DMA_HANDSHAKE_RST. Should the timeout path use the same sequence
   on SoCs requiring APDMA synchronization, rather than relying solely
   on the enable-bit status?

3. Reset ordering. Must the I2C controller be reset before or together
   with APDMA to ensure that no further peripheral requests can reach
   it? Commit 05f6f7271a38 ("i2c: mediatek: Fix apdma and i2c hand-shake
   timeout") appears relevant to this ordering.

4. ACK-error handling. An ACK error may occur before the RX data phase,
   in which case no outstanding RX writes are expected. The proposed
   patch also stops APDMA on this path as a precaution. Is that
   appropriate for the supported controllers?

The DMA-safe message buffers were introduced later by fc66b39fe36a
("i2c: mediatek: Use DMA safe buffers for i2c transactions"). Before
that change, the timeout path could unmap the caller's buffer before the
APDMA reset.

The intent of this RFC is to establish the required ordering between
APDMA retirement and DMA-buffer release. I would appreciate guidance on
the correct hardware shutdown sequence before treating the proposed fix
as complete.

 drivers/i2c/busses/i2c-mt65xx.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index 307925fb7..2a8b8bd1d 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -993,6 +993,19 @@ static void i2c_dump_register(struct mtk_i2c *i2c)
 		readl(i2c->pdmabase + OFFSET_RX_4G_MODE));
 }
 
+static int mtk_i2c_stop_dma(struct mtk_i2c *i2c)
+{
+	u32 reg_dma_en;
+	int ret;
+
+	writel(I2C_DMA_WARM_RST, i2c->pdmabase + OFFSET_RST);
+	ret = readl_poll_timeout(i2c->pdmabase + OFFSET_EN, reg_dma_en,
+				 !(reg_dma_en & I2C_DMA_START_EN), 1, 1000);
+	writel(I2C_DMA_CLR_FLAG, i2c->pdmabase + OFFSET_RST);
+
+	return ret;
+}
+
 static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
 			       int num, int left_num)
 {
@@ -1201,6 +1214,15 @@ static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
 	mtk_i2c_writew(i2c, ~(restart_flag | I2C_HS_NACKERR | I2C_ACKERR |
 			    I2C_ARB_LOST | I2C_TRANSAC_COMP), OFFSET_INTR_MASK);
 
+	/* Stop the APDMA before unmap; leak the buffers if it won't stop. */
+	if (ret == 0 || (i2c->irq_stat & (I2C_HS_NACKERR | I2C_ACKERR))) {
+		if (mtk_i2c_stop_dma(i2c)) {
+			dev_err(i2c->dev, "APDMA stop timeout, leaking buffers\n");
+			mtk_i2c_init_hw(i2c);
+			return -ETIMEDOUT;
+		}
+	}
+
 	if (i2c->op == I2C_MASTER_WR) {
 		dma_unmap_single(i2c->dev, wpaddr,
 				 msgs->len, DMA_TO_DEVICE);

base-commit: 83f32c773255720a661aa45d83e36278135f23f5
-- 
2.34.1


