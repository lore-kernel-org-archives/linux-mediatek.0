Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50DA9C4345F
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Apr 2024 13:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZWmvHblwyLfpV+rEC2PSqDTFbQMnE4MDRNUxWTIYKmE=; b=1bXMUv3vCzb5nOAdmaawtjRjP8
	8qhgEUvpeqWW6MjGHplV6Klh+XyQqiGeBw6FpagvdWjU6Tb3C682aibx0JgsKSnu8RMNcwjmNpGEa
	rPxbgvU3BpKsi8EyI4JfEJG98eCRPQL+m6+moPeZjAwf604n2R6wk7lPhYLe4oWeCS3Qlnr3920rZ
	E06HigSo8dG4oCspOtry3MGzXzioM4afV3BVC3jr01Mk5cX3n9JeU7kY9ecCAW8HSgQ7UlELH3XTK
	/0L4o4u8e+xavYppS8/8B7kAZ0Ntm4Xd0LjNFI9hsrLyabJ1i+JkSHF4OkqEqyPyFhExnShRQl1Jg
	H7bePyjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzcKc-00000004Bh1-2cy3;
	Wed, 24 Apr 2024 13:06:38 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzcKW-00000004Bef-0Zz7
	for linux-mediatek@lists.infradead.org;
	Wed, 24 Apr 2024 13:06:37 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-6ed32341906so6568276b3a.1
        for <linux-mediatek@lists.infradead.org>; Wed, 24 Apr 2024 06:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713963990; x=1714568790; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZWmvHblwyLfpV+rEC2PSqDTFbQMnE4MDRNUxWTIYKmE=;
        b=LfF++AtZOO3D66tSQnuXx3w5J8R1M3S5rNCg0Cc7KpEKHcocdoGdO7xCH6youP3NJ4
         2nGDRY3aKd1dBNDKmOKj4jQTgKvfxip7owUtPpuMTHnjss12k1J8USoIj2TZi5lpq6F+
         +Thv7wlcSAt+kbhffM2U8sFgHG9cEIYdc7dTY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713963990; x=1714568790;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZWmvHblwyLfpV+rEC2PSqDTFbQMnE4MDRNUxWTIYKmE=;
        b=K+iKt+Fpbzrv4ubq11hIoKFVPVJ0Dk6qld0yyNQFI81mR62+eYwGSZzV7Z5xEglinB
         5LbTm6v6WgbAUBD+nrzUhE79Co5I2JAkcFcDiCtS9s1UCRB8WKBdsL7S6/EoUwVjz9+y
         vgmy2yntlqz3uSU9ZzrZlfhj7JBF8LUIDVmOrLvEI3T9AUL1Od4U5K0gSfcPe2LOLPG/
         sgSITWsMzneOTzmKn6Ay3EF9dWGP8NwbhkAS+afHmDz7rokQ+3Rm1IdjNfXLdXjwa/xc
         g97jGq2ZsH8RliLz3ZWV1JAq9MXieEJBxLPZ8BdCIUDX14ml3Zj3lDN4fkC2tVx5Wrp4
         K/IA==
X-Forwarded-Encrypted: i=1; AJvYcCUWHHKvKMq4m28T5L8U/Nzk6MSlDlySVekaqBz66qWSQMqtVvYcBj0Wd7b/Unj3czD9nbBblq5B3YRG8BwqcHuiwT2hDrldNioNLiGU5GHN3/lQ
X-Gm-Message-State: AOJu0YziDGNArBi5wEtDjlpSWVM3rGiV8+v2dldSro5kJohIV6lGzikp
	yveRlVL9nq6wcVtuJO6vj60iXZxx1zuSZ3eAoKN9OxR4rXQipSpzP0uk6m28vg==
X-Google-Smtp-Source: AGHT+IGxaNdfLyHIQirpTurMn+c1hdzjWlDQY5IRavD5VXu6cW703ROJBZd0shDax7VyQ2G08e/VqQ==
X-Received: by 2002:a05:6a20:c6cd:b0:1ad:7fd1:ee2e with SMTP id gw13-20020a056a20c6cd00b001ad7fd1ee2emr2131046pzb.13.1713963989985;
        Wed, 24 Apr 2024 06:06:29 -0700 (PDT)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:836:835b:e0f2:a3a0])
        by smtp.gmail.com with ESMTPSA id y5-20020a637d05000000b005f3d2a9a91bsm9981158pgc.89.2024.04.24.06.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Apr 2024 06:06:29 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org,
	Hilda Wu <hildawu@realtek.com>,
	Pin-yen Lin <treapking@chromium.org>,
	KidmanLee <kidman@realtek.com>,
	linux-mediatek@lists.infradead.org,
	Archie Pusaka <apusaka@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-serial@vger.kernel.org,
	Al Cooper <alcooperx@comcast.net>,
	linux-arm-kernel@lists.infradead.org,
	Hsin-Te Yuan <yuanhsinte@chromium.org>
Subject: [PATCH v2] serial: 8520_mtk: Set RTS on shutdown for Rx in-band wakeup
Date: Wed, 24 Apr 2024 20:58:08 +0800
Message-ID: <20240424130619.2924456-1-treapking@chromium.org>
X-Mailer: git-send-email 2.44.0.769.g3c40516874-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_060632_542504_4FF1BD23 
X-CRM114-Status: GOOD (  11.66  )
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

Changes in v2:
- Replase serial8250_set_mctrl() with serial8250_do_set_mctrl()

 drivers/tty/serial/8250/8250_mtk.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_mtk.c b/drivers/tty/serial/8250/8250_mtk.c
index c365a349421a..b9cca210e171 100644
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
+		serial8250_do_set_mctrl(&up->port, TIOCM_RTS);
 }
 
 static void mtk8250_disable_intrs(struct uart_8250_port *up, int mask)
-- 
2.44.0.769.g3c40516874-goog


