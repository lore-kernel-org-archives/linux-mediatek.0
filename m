Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D99606A31E
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2026 21:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zsSkmSr3;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mxacBWXN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=WsTLwSG0j0rvcPTxUloruhaWzU98+XdsMcTu8lqR+tY=; b=zsSkmSr3TWhymhRqv2Kf/c9dXM
	1bHz8mlLmv2tkiE6SOdVG/Xd7p21GrdA1mSsVYlfvxYKcQv8598Me5z8xt9jkyN9p2zGxlDdkBohm
	VscOKS1+3ElD7l9feb7fgHFo3l3Brk4tZ0IoVlOxJ0quupccNvtPfnH+vUN+44ZEjaZS3IIrbqEHl
	2gEceqrNkEAgO+NkZSfd/ZsxlQzPSgUeiZDPYWzOHk1+9tiXYr047c3K54BeK9uhDEvtkLXjMUK+h
	KX0BGJsBtKfoai4UBnPRE5PDT5O5LUICQGM6dLvMIUe5oZ2P4TwSxS6ADZk34pdxAmvfYkPsdNvir
	6eb4WYuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK0BE-0000000Ezrj-0Tmi;
	Thu, 22 Oct 2026 21:18:32 +0000
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK0BB-0000000Ezqn-1Wc9
	for linux-mediatek@lists.infradead.org;
	Thu, 22 Oct 2026 21:18:31 +0000
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-706113e92f9so155936eaf.2
        for <linux-mediatek@lists.infradead.org>; Thu, 22 Oct 2026 14:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792703908; x=1793308708; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WsTLwSG0j0rvcPTxUloruhaWzU98+XdsMcTu8lqR+tY=;
        b=mxacBWXNG++6K28C+5tkDbOgVUtN+hqrfTMgoGVFOfIIAtgBIoRqQClXd8KfOCZSMe
         Mq2+pEsYNGDFobFrp7MR1cb0G8bwM+nYwVKUdBsQgEHqYa625qnqL6HKX6xnt9stTphz
         jVzXU6y/yHgFMUoNNVKlDjTwWC4JhTnZMJb/B9iJqWNiqikl8SK0l19jHll2P7oQo0Uc
         iNjZfHqH49zmjPua1F8Q5Bow1NqBXD03/Ss5zLZvkx7gXyLHyOHa4Kih4aSJzBPuRomB
         n8pF17cz8QPp+WhQnvkjp/H2bJDXsP5BDouP/1T5/ag8TSwLoG86aoVjO5dquqhDyjhu
         phxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792703908; x=1793308708;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=WsTLwSG0j0rvcPTxUloruhaWzU98+XdsMcTu8lqR+tY=;
        b=GnTloGX+u2FNzgQOLfJO1qFPvnq5X/L4bi2+/KLq1ce+OMGXlD4ogNZzAKDmQI21Sy
         KbAm8+PWOI/BZ/BgYuwlJ4XoDk0F73BQRbi2x/uhM4dwJLC3q6/MvXN+ZmVglAwL1H1E
         s45ocBPSG4X+QNkuRL9UGh964ZnOgbD2hxv4mQWaOm/Bg2NmDkJBwfjiagtY7aMeZdMg
         DYfoVCaSB1eMy2DJRCTs5cg2fJ/hfeb6nZkHfb0SNS4Uhm9wzxxYJA0JrPgtvoeBIhIz
         49+OlvMDQChBEGk7lttgNPnWjGUrRTpNxICGFDmnHlAlhpS5Fu2WtQ68ZpKksdRlImq0
         dxVQ==
X-Forwarded-Encrypted: i=1; AKwUvBxndtDUrm+HrNrMHm6vs2TavXQZUmOW384/uXQV8Y1+K8egRXTODz9nFTiI15zwcvWvFD2F3WT0dXnU8thxKA==@lists.infradead.org
X-Gm-Message-State: AFq9FYLEoANYSTnOcJ955iBK8qMC4w4IUDfoWg9tYtMEfIZrg21bVCc4
	541Qy7cI7KQO2OWoKbAZq1ADl1TvLwUEGbvteWMI5y1S5qKgPpUFoboL3yVHqPJr
X-Gm-Gg: AYBFou3SGbXP2jDt841jDf1zKqAibZK2A2T9UDoIfDz/WySE3XwPcOZ99e4hIRBxDpm
	Tn+IP8rdEwvJz48cBX+kNj1xer5LNYF7p/Cb5jbmJt3HSQlDNO9gK1y3Nb6G0rTOuSyU+7lSStg
	iQH8qfFsGxTpYauA1XQm7FJLbx9W52da0N6n+6dBRRC1ShnMHPjxZhKhU4/CjWnWatpkh1qIQup
	FexKyAdcn6S8T4sLSO6wXSG/4QZGDDeNvqmpraOspQlmgHxLfkVAbSd0zAr0Y22dPOx6Ue6zInW
	L/34n8k2vXyFUcmbVsS7qgcfd88797tmoRrxHYyuaIGZ4nB7/fkuzFtqxzr/nG+OeJ/luRiT87Z
	i4WTwC7bx8Cicw52BwJtTzOHG7IenqOnrZib3a8Onf3Oi/BP0ikjGTGhmuPJRtj+SOY1L2onuxa
	bm5heCprSDFDag/PUkxuNjTGdH4b0ekZrjEZkxeav8ZL4yXvkGYbZIeeZl+pjjUm24sATQYlpk7
	AE7mWOqb3gxwGsnubpbS0tSIKIbiEwRU6SiXC08cktDbCAdFleMbUZWqEaOLUerOJiFB7ObWuQL
	S0WmJgyg8qc4dJAOlDdX6q3Xmj64F4IvlRUjNxBCQMyuh2SmOT+n+jIkEpU2yb1YXxhzgF27vHR
	LeO3fg1Bf453PqW9DhGn+G5Vf/0FztlX+W7h4hu1Wn3N6is43/XCCKuOMl60j0Ixshvo3NpSmT/
	zuKNc=
X-Received: by 2002:a05:6820:3287:b0:709:529a:477c with SMTP id 006d021491bc7-70b88ac1066mr386352eaf.87.1792703908193;
        Thu, 22 Oct 2026 14:18:28 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-84fbd362c1fsm250873a34.4.2026.10.22.14.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 14:18:27 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 22 Oct 2026 15:18:26 -0600
Subject: [PATCH] dmaengine: mediatek: uart: make channel termination atomic
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-submit-mtk-uart-dma-terminate-atomic-v1-v1-1-aa498ba5da25@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNwQqDMBBEf0Vy7lITS8D+SulhE7e6LYklWUUQ/
 71JPb5h5s2uMiWmrO7NrhKtnHmOBfSlUX7COBLwUFiZ1ljdGgN5cYEFgnxgwSQwBAShFDiiEKD
 MgT2sGnRv+66zFunmVbF9E714+z89nicX1Zu8VH1tOMwELmH0U42KmOLIka7n7jh+D1/b660AA
 AA=
X-Change-ID: 20261022-submit-mtk-uart-dma-terminate-atomic-v1-19693366ae4c
To: Sean Wang <sean.wang@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Frank Li <Frank.Li@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_141829_441478_0302CDDD 
X-CRM114-Status: GOOD (  13.73  )
X-Spam-Score: -1.9 (-)
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

The 8250 transmit flush path calls dmaengine_terminate_async() with the
UART port spinlock held and interrupts disabled. UART APDMA termination
uses sleeping register polls and synchronize_irq(), which can also wait for
a threaded handler or for an interrupt pending on the calling CPU.

Serialize the stop sequence with the interrupt handler using the virtual
channel lock and use atomic register polling. A handler that was waiting
for that lock must check interrupt status before accessing a descriptor:
termination may already have masked and acknowledged its interrupt. This
allows termination to retire descriptors without waiting for the handler.

If the channel does not stop, return the timeout and retain its descriptors
instead of freeing state still owned by the transfer. Continue attempting
STOP after a flush timeout, since stopping the channel is sufficient for
termination even when the flush could not finish.

Fixes: 9135408c3ace ("dmaengine: mediatek: Add MediaTek UART APDMA support")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/mediatek/mtk-uart-apdma.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/mediatek/mtk-uart-apdma.c b/drivers/dma/mediatek/mtk-uart-apdma.c
index f74e9a328588..73d4b701ac85 100644
--- a/drivers/dma/mediatek/mtk-uart-apdma.c
+++ b/drivers/dma/mediatek/mtk-uart-apdma.c
@@ -256,6 +256,12 @@ static irqreturn_t mtk_uart_apdma_irq_handler(int irq, void *dev_id)
 	unsigned long flags;
 
 	spin_lock_irqsave(&c->vc.lock, flags);
+	/* Termination may have acknowledged an interrupt before we got the lock. */
+	if (!mtk_uart_apdma_read(c, VFF_INT_FLAG)) {
+		spin_unlock_irqrestore(&c->vc.lock, flags);
+		return IRQ_NONE;
+	}
+
 	if (c->dir == DMA_DEV_TO_MEM)
 		mtk_uart_apdma_rx_handler(c);
 	else if (c->dir == DMA_MEM_TO_DEV)
@@ -400,10 +406,12 @@ static int mtk_uart_apdma_terminate_all(struct dma_chan *chan)
 	LIST_HEAD(head);
 	int ret;
 
+	spin_lock_irqsave(&c->vc.lock, flags);
+
 	mtk_uart_apdma_write(c, VFF_FLUSH, VFF_FLUSH_B);
 
-	ret = readx_poll_timeout(readl, c->base + VFF_FLUSH,
-			  status, status != VFF_FLUSH_B, 10, 100);
+	ret = readx_poll_timeout_atomic(readl, c->base + VFF_FLUSH,
+					status, status != VFF_FLUSH_B, 10, 100);
 	if (ret)
 		dev_err(c->vc.chan.device->dev, "flush: fail, status=0x%x\n",
 			mtk_uart_apdma_read(c, VFF_DEBUG_STATUS));
@@ -415,11 +423,14 @@ static int mtk_uart_apdma_terminate_all(struct dma_chan *chan)
 	 * 3. set stop as 0
 	 */
 	mtk_uart_apdma_write(c, VFF_STOP, VFF_STOP_B);
-	ret = readx_poll_timeout(readl, c->base + VFF_EN,
-			  status, !status, 10, 100);
-	if (ret)
+	ret = readx_poll_timeout_atomic(readl, c->base + VFF_EN,
+					status, !status, 10, 100);
+	if (ret) {
 		dev_err(c->vc.chan.device->dev, "stop: fail, status=0x%x\n",
 			mtk_uart_apdma_read(c, VFF_DEBUG_STATUS));
+		spin_unlock_irqrestore(&c->vc.lock, flags);
+		return ret;
+	}
 
 	mtk_uart_apdma_write(c, VFF_STOP, VFF_STOP_CLR_B);
 	mtk_uart_apdma_write(c, VFF_INT_EN, VFF_INT_EN_CLR_B);
@@ -429,9 +440,6 @@ static int mtk_uart_apdma_terminate_all(struct dma_chan *chan)
 	else if (c->dir == DMA_MEM_TO_DEV)
 		mtk_uart_apdma_write(c, VFF_INT_FLAG, VFF_TX_INT_CLR_B);
 
-	synchronize_irq(c->irq);
-
-	spin_lock_irqsave(&c->vc.lock, flags);
 	vchan_get_all_descriptors(&c->vc, &head);
 	spin_unlock_irqrestore(&c->vc.lock, flags);
 

---
base-commit: 93f51579e7df248780214094418f205253383cc5
change-id: 20261022-submit-mtk-uart-dma-terminate-atomic-v1-19693366ae4c

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


