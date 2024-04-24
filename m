Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 106BDC4345F
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Apr 2024 12:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=p5X7I2pd4YE3kiP0pgemZkKwYiW8XQQ/yrWjXfFYyKc=; b=S7wcN0Gw/loNsRgB+DExcZ1Ohv
	tBqgYF26aji4Q+bPTTByfzneQT/vflMuKZp/Xxsjox23WFagn37BqfcjP59LvxRWwtQBYRIsAi20c
	xzTYPg8SXkYULfb2Wo93PVkpD3KIuWvLOP66ZLkiyg07i3LAv2NbnZZ54CHggcGi2v8C2JBtCPQc+
	+tgYkVkHTh3UR4qYvqjXqomY5zjlVShwJeuyYbo9Yy1Do+q7iTsmD5NPlNSeSC/wyEt2lQrvHKrok
	64vgqU8Char/EhqZXpgxdeZVmrlJW9UeKwRVPqAPPzqwVPfCZiVjUdY5poGU5MTspSWiIoFH9Pylx
	U5JLKWqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzbqp-000000046Do-2Mha;
	Wed, 24 Apr 2024 12:35:51 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzbql-000000046BO-2grm
	for linux-mediatek@lists.infradead.org;
	Wed, 24 Apr 2024 12:35:49 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-5f415fd71f8so5049098a12.3
        for <linux-mediatek@lists.infradead.org>; Wed, 24 Apr 2024 05:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713962142; x=1714566942; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p5X7I2pd4YE3kiP0pgemZkKwYiW8XQQ/yrWjXfFYyKc=;
        b=FjI8fmzLQNxO3ZY0QIPnO9+PiBehT0eXv6DhfWajOpG+TtW0dLwNEtpnod4AQXh0dN
         LmDO7bDp8G81nBMM8t8srkvAz57UKdgSgWKUten2ykovb0nHn02tNeCNH4pqG0Xzmt8s
         7FeRL3UzPKnyzkbbGo3oaNdGJoBxc4q/h+4q0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713962142; x=1714566942;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p5X7I2pd4YE3kiP0pgemZkKwYiW8XQQ/yrWjXfFYyKc=;
        b=uYbhPixEKN+bIDzF/lxq7jDkhR/Qyw1Beraq0RSqqH0+BIXgouGEDOvUjs9JFZ7D9x
         +5e9I5i6bV3vhVRCnR6o3nUGEVWRKMIq6ojhBlRrS/0k34BoE+4kM3JLqbNjPiRDjnZw
         pL5BNUiLoY+xiM3FJS/7N5UdOomSiIArcgqpVZjRTvwR/Opm0j6l9nwRacWm8v1MZAEs
         a2O3m45lkyNjprya7J8zo7ZXN8kSHrswgmSAmR4V5IlGm0dBIdtULr/dZpxnXH5xiAKy
         2LFh+BzaBD7zemJG74ZlgZfJwkZE9812qOytKIR2XKDcDlt8lW0xAeDHT0p+tHsJDpAq
         +iGA==
X-Forwarded-Encrypted: i=1; AJvYcCWXaK7VPMZchY4P3xt2hxgbo38CWigr6T9DQ6LQTp7ZnfGchTpKiVzbL8Lke4anIy5HZUfRoECZTjT7y1VSZYaOvDGZ+0vkv05Z2Cio9UfJ9cFo
X-Gm-Message-State: AOJu0Ywa8nJxu1RodoAPAmNC4XzEQGX0cNvl0m2QBITV3dUcKhsxLN7m
	8SZq7Ny3o5lFxuMnqiCMD2SiZTnqaMIebcboFHSZLTFH/HqDGGt7Vwm2CPTBqA==
X-Google-Smtp-Source: AGHT+IEuUAZNA/Wxz1q95leP9HcOFZM8mHKpCqv7tHCLZaCxrPO0Fns8nowhDeSKlbiYYDqIEIkIfQ==
X-Received: by 2002:a17:902:e889:b0:1e6:34f9:f730 with SMTP id w9-20020a170902e88900b001e634f9f730mr2468612plg.52.1713962142435;
        Wed, 24 Apr 2024 05:35:42 -0700 (PDT)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:836:835b:e0f2:a3a0])
        by smtp.gmail.com with ESMTPSA id kg15-20020a170903060f00b001e28d7329e6sm11826176plb.91.2024.04.24.05.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Apr 2024 05:35:42 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-serial@vger.kernel.org,
	Hsin-Te Yuan <yuanhsinte@chromium.org>,
	linux-kernel@vger.kernel.org,
	Al Cooper <alcooperx@comcast.net>,
	Archie Pusaka <apusaka@chromium.org>,
	KidmanLee <kidman@realtek.com>,
	Hilda Wu <hildawu@realtek.com>,
	Pin-yen Lin <treapking@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] serial: 8520_mtk: Set RTS on shutdown for Rx in-band wakeup
Date: Wed, 24 Apr 2024 20:32:47 +0800
Message-ID: <20240424123331.2872272-1-treapking@chromium.org>
X-Mailer: git-send-email 2.44.0.769.g3c40516874-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_053547_838081_94A4E1DB 
X-CRM114-Status: GOOD (  11.30  )
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

When Rx in-band wakeup is enabled, set RTS to true in mtk8250_shutdown()
so the connected device can still send message and trigger IRQ when the
system is suspended.

Fixes: 18c9d4a3c249 ("serial: When UART is suspended, set RTS to false")
Signed-off-by: Pin-yen Lin <treapking@chromium.org>

---

 drivers/tty/serial/8250/8250_mtk.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_mtk.c b/drivers/tty/serial/8250/8250_mtk.c
index c365a349421a..b7ed55eaf05b 100644
--- a/drivers/tty/serial/8250/8250_mtk.c
+++ b/drivers/tty/serial/8250/8250_mtk.c
@@ -209,15 +209,19 @@ static int mtk8250_startup(struct uart_port *port)
 
 static void mtk8250_shutdown(struct uart_port *port)
 {
-#ifdef CONFIG_SERIAL_8250_DMA
 	struct uart_8250_port *up = up_to_u8250p(port);
 	struct mtk8250_data *data = port->private_data;
+	int irq = data->rx_wakeup_irq;
 
+#ifdef CONFIG_SERIAL_8250_DMA
 	if (up->dma)
 		data->rx_status = DMA_RX_SHUTDOWN;
 #endif
 
-	return serial8250_do_shutdown(port);
+	serial8250_do_shutdown(port);
+
+	if (irq >= 0)
+		serial8250_set_mctrl(&up->port, TIOCM_RTS);
 }
 
 static void mtk8250_disable_intrs(struct uart_8250_port *up, int mask)
-- 
2.44.0.769.g3c40516874-goog


