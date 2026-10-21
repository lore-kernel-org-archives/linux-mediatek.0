Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A007B606A324
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Oct 2026 21:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=C+XrRlXQ;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kePluDc3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=puzArg+CDDbbfh3nj6zcBDGkElaBfuayiOEKEQ7tKC0=; b=C+XrRlXQF+xic6DKUyHTbDcZZ0
	Zw3WaT9jPg5tv0AZ/TPPjnFnF9kiu9UYD9bSCg1KlmblV9zeOf63BCm1IUyFsUQmphztjNfllhFzH
	30mwC720lIhpYpG+5Mu+vZkbManl2F3pMkEjP2eO6iXPBA0J3wJ3/yYTFkY5j0kaSnuQKEBYQpGAm
	H8Ke8L7u6zfJxgEpZiDII2C11qBxzngkYp8Gv6/QGCKCkPOEXOHl6MRFmnBZeg9XIZH8Usm05Kb4a
	5mXOdZm96eVeAiZzCwyBRC8fkSymnCr3OlMhnrhpi+ItEf+XWstSzYIvuOJ2kbKuPH6mgmnN1IU44
	PFrUQYmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJdgF-0000000Cus9-2fOh;
	Wed, 21 Oct 2026 21:17:03 +0000
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJdgD-0000000CurN-1US5
	for linux-mediatek@lists.infradead.org;
	Wed, 21 Oct 2026 21:17:02 +0000
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-6cf995766a3so950231eaf.2
        for <linux-mediatek@lists.infradead.org>; Wed, 21 Oct 2026 14:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792617420; x=1793222220; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=puzArg+CDDbbfh3nj6zcBDGkElaBfuayiOEKEQ7tKC0=;
        b=kePluDc3/bOWlZB6DY6jtz+p27r6x6z3Fpc9FzSJVdjY7Y+rhOfxM2LRBbmM7fpt7R
         +wrE0f9vgDMbQJHivPXamD+qw6X146WpAgieq/XDaJ088jRUzOyTzN06BBbJwniV0T6D
         nh4wx7uoNxcAII3lRC0RM1nCgy2XMREMxlhFZkrknwIlUCQlQ0YDI0c+i9RpLuCBDQNt
         0HtWiVPN708kFC2wI8V2ZvciWnqUf6bTYC6xEblUWTbw5CA3HYbzBRdHa243x7U4zUmv
         vv9Zbuf7RLEVKImw7HVhYiuvV0FUBN0yrn4faHgfpRiqEr1r4Fg+S+h38XqfUeCd7f6t
         DiAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792617420; x=1793222220;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=puzArg+CDDbbfh3nj6zcBDGkElaBfuayiOEKEQ7tKC0=;
        b=pG1fMBJ3SJIKBGft1VOZebKNV19yvlbot/9wlgUgkmIHLS+2MBPfefODtoK0wuDL6y
         EJXpUpC6EQfH+34PFra6MncAI+nt2U4KPeBf1odTqGP7LivTW6plyDtEiCXY3bOq8AFb
         MM8LBvnhTyhu5CoQ2WwqKg3/h58E/vXp+RuK6VXls/gX0UI+spJ8xnLjQ4yjMe4B+1S2
         hYb2w1vJEuNCyKuH3AHe8nBR0K6GN7p53PJV1ex0Z4JhTu20EXlgI7aEUXnn0kVIS5Me
         PXuvhfcB5j38LztK8140h2KI+oFOkyi0m5NHwRddrYY7RpbE4gmsQhmxtwVqZaHStiN8
         9WDg==
X-Forwarded-Encrypted: i=1; AKwUvBy36X2tm974+RX76l7jebbkyqFU1ivVxkPqDr/arMN2O0A3OGD43G8G63oyYQlKWL2HZtaVSifWX0l5a392bQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYKvmrXXLIwMbcoZAsudIps4AAqO7soVEZgm2tLvG5EQn0QW8S9q
	Kr9ycFUPn1b/hDbVsg6ckHiEJDaLJPY/gqvxvPvtFKZQm2fo79jubxajdBh0yQ==
X-Gm-Gg: AYBFou0gjHOMpQ2C+lITp850UxoW8PBPfo7WdKTHF9v2A3QyOOq92NvPXIbL3MFWTog
	BD32jmViKdQ21tE0TjkJkJ7Wf4PI0vfJ4eWzBBsXVICIoW6pUgpnIlTR49jFjrOghUADCumZw/o
	kqOUQJTkUU0o+KEmZjqeiODSZLPQhOrb0QtQmXMI3BInTsqoEyvAxS6Ipix5WbUQ2uCMRymUzR+
	zo7XjdicAUfaTjkgO84IqtyC7ILJ5pKwlHkQElF0lXBmVEhwrVjJdsqQYVrdD9bVZjMwu+IqOUw
	v1vjkzFcxqeSe9DI58Ov9ntI0X7eaIIgcKEOV0DItGhkdObuXWVvE+7KzhqVwN+66cxLmY4ElEe
	IV276gT63PyBcuo7QQLAjn2zIMkKV3t8/rI4CpD7npwXVNHxpqNQQuRyIl/8SwWfdI4B2QH0miD
	wtpkwj26TsgHelEL9uaB8M8eJ1rz0tPzW7jtUOtDn9tmvzSzSgdUjAPd4hn/m3l537pyk57+0Xk
	2Ylmq9Ew+o+noQiLIYbxc4EAoXjL69N7P/4OmoF2QG7HhuuUUiEELjKaO4KigcvTZaBEIY6hAXS
	ZJn96+mI/cq56arBk54ehfn4urlPD7+SStOUmvoIVfxiguWehu8gMBPRGILH8xL4Qxg29Ovu4Wb
	WSyl5mboAeaexmT6chcfDuRfpUEU7rfzVZ1caj6EcPiQD1D6RaaDjF+qEKpzj0aIrBpQtRa1/N0
	eG3LqK7JmLrGy1sqnl6eHvzxa6
X-Received: by 2002:a4a:ee0b:0:b0:6b7:46fa:1693 with SMTP id 006d021491bc7-709405e3b6dmr1907892eaf.40.1792617420203;
        Wed, 21 Oct 2026 14:17:00 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a7d61d6645sm2928842fac.12.2026.10.21.14.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 14:16:59 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 21 Oct 2026 15:16:58 -0600
Subject: [PATCH] serial: 8250: prevent DMA callbacks from restarting a
 closing port
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-submit-serial-8250-dma-shutdown-v1-v1-1-3d3ce383c614@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNyw7CIBBFf6WZtRMLhcb4K6YLHlPBWGqA1pqm/
 y7oYhbn5t4zOySKnhJcmx0irT75ORRgpwaMU+FO6G1h4C3vWcsZpkVPPmOdqSdeuGzRTgqTW7K
 d3wFXhrLrtLC9GIXUUESvSKPffk9uw5+L5UEmV3NtaJUIdVTBuBrl/DmXw0BbhuP4Am3jg+elA
 AAA
X-Change-ID: 20261021-submit-serial-8250-dma-shutdown-v1-533b4d64f45b
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_141701_433951_39BDBF35 
X-CRM114-Status: GOOD (  20.44  )
X-Spam-Score: -0.8 (/)
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
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Disabling UART interrupts does not prevent a DMA completion callback from
running. A TX callback can submit more data or enable THRI after shutdown
has cleared IER. An RX callback can also submit a new receive if data is
still present. A callback already running when terminate_sync() starts
can therefore restart the channel whose buffers are about to be freed.

Mark DMA as shutting down under the port lock when disabling interrupts.
Check that state under the same lock in the completion callbacks and
submission paths, so callbacks either finish before the shutdown boundary
or leave the channel stopped. The DMA provider's synchronization still
has to drain callbacks before release_dma() frees their resources.

Apply the same boundary to OMAP, which has its own shutdown and DMA
callbacks but shares the channel-request and release helpers. Check it
in MediaTek's receive callback after taking the port lock as well: its
earlier private shutdown check cannot serialize a callback that has
already passed that check. Reset the state after requesting channels
on the next open. Leave the Broadcom integrated DMA path, which manages
its own shutdown state, unchanged.

Fixes: 9ee4b83e51f7 ("serial: 8250: Add support for dmaengine")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250.h      |  2 ++
 drivers/tty/serial/8250/8250_dma.c  | 17 ++++++++++++++---
 drivers/tty/serial/8250/8250_mtk.c  |  3 +++
 drivers/tty/serial/8250/8250_omap.c | 15 ++++++++++++---
 drivers/tty/serial/8250/8250_port.c |  2 ++
 5 files changed, 33 insertions(+), 6 deletions(-)

diff --git a/drivers/tty/serial/8250/8250.h b/drivers/tty/serial/8250/8250.h
index 21ed9c41b751..457732e941af 100644
--- a/drivers/tty/serial/8250/8250.h
+++ b/drivers/tty/serial/8250/8250.h
@@ -51,6 +51,8 @@ struct uart_8250_dma {
 	unsigned char		tx_running;
 	unsigned char		tx_err;
 	unsigned char		rx_running;
+	/* Protected by the UART port lock. */
+	bool			shutting_down;
 };
 
 struct old_serial_port {
diff --git a/drivers/tty/serial/8250/8250_dma.c b/drivers/tty/serial/8250/8250_dma.c
index 1da605cc8601..5f52ed5c14c3 100644
--- a/drivers/tty/serial/8250/8250_dma.c
+++ b/drivers/tty/serial/8250/8250_dma.c
@@ -19,11 +19,13 @@ static void __dma_tx_complete(void *param)
 	unsigned long	flags;
 	int		ret;
 
+	uart_port_lock_irqsave(&p->port, &flags);
+	if (dma->shutting_down)
+		goto out;
+
 	dma_sync_single_for_cpu(dmaengine_get_dma_device(dma->txchan), dma->tx_addr,
 				UART_XMIT_SIZE, DMA_TO_DEVICE);
 
-	uart_port_lock_irqsave(&p->port, &flags);
-
 	dma->tx_running = 0;
 
 	uart_xmit_advance(&p->port, dma->tx_size);
@@ -35,6 +37,7 @@ static void __dma_tx_complete(void *param)
 	if (ret || !dma->tx_running)
 		serial8250_set_THRI(p);
 
+out:
 	uart_port_unlock_irqrestore(&p->port, flags);
 }
 
@@ -71,6 +74,8 @@ static void dma_rx_complete(void *param)
 	unsigned long flags;
 
 	uart_port_lock_irqsave(&p->port, &flags);
+	if (dma->shutting_down)
+		goto out;
 	if (dma->rx_running)
 		__dma_rx_complete(p);
 
@@ -80,6 +85,7 @@ static void dma_rx_complete(void *param)
 	 */
 	if (!dma->rx_running && (serial_lsr_in(p) & UART_LSR_DR))
 		p->dma->rx_dma(p);
+out:
 	uart_port_unlock_irqrestore(&p->port, flags);
 }
 
@@ -94,6 +100,9 @@ int serial8250_tx_dma(struct uart_8250_port *p)
 	int i;
 	int ret;
 
+	if (dma->shutting_down)
+		return 0;
+
 	if (dma->tx_running) {
 		if (up->x_char) {
 			dmaengine_pause(dma->txchan);
@@ -185,7 +194,7 @@ int serial8250_rx_dma(struct uart_8250_port *p)
 	struct uart_8250_dma		*dma = p->dma;
 	struct dma_async_tx_descriptor	*desc;
 
-	if (dma->rx_running)
+	if (dma->shutting_down || dma->rx_running)
 		return 0;
 
 	serial8250_do_prepare_rx_dma(p);
@@ -308,6 +317,8 @@ int serial8250_request_dma(struct uart_8250_port *p)
 		goto err;
 	}
 
+	scoped_guard(uart_port_lock_irqsave, &p->port)
+		dma->shutting_down = false;
 	dev_dbg_ratelimited(p->port.dev, "got both dma channels\n");
 
 	return 0;
diff --git a/drivers/tty/serial/8250/8250_mtk.c b/drivers/tty/serial/8250/8250_mtk.c
index d1fb917b762a..8a0ca8df46c5 100644
--- a/drivers/tty/serial/8250/8250_mtk.c
+++ b/drivers/tty/serial/8250/8250_mtk.c
@@ -106,6 +106,8 @@ static void mtk8250_dma_rx_complete(void *param)
 		return;
 
 	uart_port_lock_irqsave(&up->port, &flags);
+	if (dma->shutting_down)
+		goto out;
 
 	dmaengine_tx_status(dma->rxchan, dma->rx_cookie, &state);
 	total = dma->rx_size - state.residue;
@@ -131,6 +133,7 @@ static void mtk8250_dma_rx_complete(void *param)
 
 	mtk8250_rx_dma(up);
 
+out:
 	uart_port_unlock_irqrestore(&up->port, flags);
 }
 
diff --git a/drivers/tty/serial/8250/8250_omap.c b/drivers/tty/serial/8250/8250_omap.c
index 29a203ed93fd..e3f3322da379 100644
--- a/drivers/tty/serial/8250/8250_omap.c
+++ b/drivers/tty/serial/8250/8250_omap.c
@@ -780,6 +780,8 @@ static void omap_8250_shutdown(struct uart_port *port)
 
 	/* Synchronize UART_IER access against the console. */
 	scoped_guard(uart_port_lock_irq, port) {
+		if (up->dma)
+			up->dma->shutting_down = true;
 		up->ier = 0;
 		serial_out(up, UART_IER, 0);
 	}
@@ -963,6 +965,8 @@ static void __dma_rx_complete(void *param)
 
 	/* Synchronize UART_IER access against the console. */
 	guard(uart_port_lock_irqsave)(&p->port);
+	if (dma->shutting_down)
+		return;
 
 	/*
 	 * If the tx status is not DMA_COMPLETE, then this is a delayed
@@ -1019,6 +1023,9 @@ static int omap_8250_rx_dma(struct uart_8250_port *p)
 	/* Port locked to synchronize UART_IER access against the console. */
 	lockdep_assert_held_once(&p->port.lock);
 
+	if (dma->shutting_down)
+		return 0;
+
 	if (priv->rx_dma_broken)
 		return -EINVAL;
 
@@ -1080,11 +1087,13 @@ static void omap_8250_dma_tx_complete(void *param)
 	bool			en_thri = false;
 	struct omap8250_priv	*priv = p->port.private_data;
 
+	guard(uart_port_lock_irqsave)(&p->port);
+	if (dma->shutting_down)
+		return;
+
 	dma_sync_single_for_cpu(dmaengine_get_dma_device(dma->txchan), dma->tx_addr,
 				UART_XMIT_SIZE, DMA_TO_DEVICE);
 
-	guard(uart_port_lock_irqsave)(&p->port);
-
 	dma->tx_running = 0;
 
 	uart_xmit_advance(&p->port, dma->tx_size);
@@ -1123,7 +1132,7 @@ static int omap_8250_tx_dma(struct uart_8250_port *p)
 	int skip_byte = -1;
 	int ret;
 
-	if (dma->tx_running)
+	if (dma->shutting_down || dma->tx_running)
 		return 0;
 	if (uart_tx_stopped(&p->port) || kfifo_is_empty(&tport->xmit_fifo)) {
 
diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
index db066a42f61d..d476ebc37647 100644
--- a/drivers/tty/serial/8250/8250_port.c
+++ b/drivers/tty/serial/8250/8250_port.c
@@ -2446,6 +2446,8 @@ void serial8250_do_shutdown(struct uart_port *port)
 	 * Synchronize UART_IER access against the console.
 	 */
 	scoped_guard(uart_port_lock_irqsave, port) {
+		if (up->dma)
+			up->dma->shutting_down = true;
 		up->ier = 0;
 		serial_port_out(port, UART_IER, 0);
 	}

---
base-commit: 1184f87e2790e8af9be3116f608d2e86b4792d7d
change-id: 20261021-submit-serial-8250-dma-shutdown-v1-533b4d64f45b

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


