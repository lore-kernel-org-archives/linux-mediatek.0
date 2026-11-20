Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926A2606A339
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Nov 2026 00:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FAf3y3x+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zaP3dJT9GASJhzOQde12GHB1bhBJ7BJJjkpUN4vQWMQ=; b=FAf3y3x+6zrZDQ0Yhrxy2HB/Q8
	IHjW2BMWeWe7OFyoLNh51yNBAxjMbs0KH4QXzj4eMrU4kDraF2iXqxAHPNCLLvLh6G8E7a4a3P4oN
	DO1rilX5WrIhwiuq132HLVR01sLDsPvdTkcnOL1NZiyy8Cem9QPsvJ8uEzLQIcp0DkywvHCwZtGVz
	gry+qUs56dHKTmo1L9x7QSywejPIHNofjOcCFXG+5C9nH73ff9ek5am5KizET9Kfm/BywBWWp+4sJ
	aedE3XcSAX0P/WBCQwBNVNKjun7NU3hDxh9oZtJ/i8XsggU/Vxr2k0Ce7RsKuOcqT4QRAbfVDb0hn
	S/RWt8rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUC63-0000000Dhr9-0idt;
	Fri, 20 Nov 2026 00:03:19 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUC60-0000000DhqP-2QcN;
	Fri, 20 Nov 2026 00:03:17 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xUC5t-0000000028C-2Pgf;
	Fri, 20 Nov 2026 00:03:10 +0000
Date: Fri, 20 Nov 2026 00:02:59 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Baryshkov <lumag@kernel.org>, Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hermes Wu <hermes.wu@ite.com.tw>,
	Pin-yen Lin <treapking@chromium.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v9 06/14] drm/bridge: it6505: bail out of the IRQ handler
 when status reads fail
Message-ID: <ce2a90cbb7a9de693d0b260dcc90572a473c9aab.1795132452.git.daniel@makrotopia.org>
References: <cover.1795132452.git.daniel@makrotopia.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1795132452.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_160316_641583_92D9B41C 
X-CRM114-Status: GOOD (  14.80  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When reading the interrupt status registers fails, the negative error
codes end up in int_status[], where it6505_test_bit() sees almost all
bits set: every interrupt sub-handler runs on garbage and the error
values are even written back to the status registers.

Read the three contiguous status registers with a single
regmap_bulk_read() and return IRQ_NONE if it fails. it6505_read()
only adds the powered check on top of regmap_read(), which the
handler has already done. Acknowledge them with a single
regmap_bulk_write() as well, and switch int_status[] and its users to
u8, dropping the casts.

Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/gpu/drm/bridge/ite-it6505.c | 37 +++++++++++++++--------------
 1 file changed, 19 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 249c616300fde..434a4fa39a911 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -2639,12 +2639,13 @@ static void it6505_irq_link_train_fail(struct it6505 *it6505)
 	schedule_work(&it6505->link_works);
 }
 
-static bool it6505_test_bit(unsigned int bit, const unsigned int *addr)
+static bool it6505_test_bit(unsigned int bit, const u8 *addr)
 {
 	return 1 & (addr[bit / BITS_PER_BYTE] >> (bit % BITS_PER_BYTE));
 }
 
-static void it6505_irq_video_handler(struct it6505 *it6505, const int *int_status)
+static void it6505_irq_video_handler(struct it6505 *it6505,
+				     const u8 *int_status)
 {
 	struct device *dev = it6505->dev;
 	int reg_0d, reg_int03;
@@ -2655,11 +2656,9 @@ static void it6505_irq_video_handler(struct it6505 *it6505, const int *int_statu
 	 */
 
 	if ((!it6505_get_video_status(it6505) &&
-	     (it6505_test_bit(INT_SCDT_CHANGE, (unsigned int *)int_status))) ||
-	    (it6505_test_bit(BIT_INT_IO_FIFO_OVERFLOW,
-			     (unsigned int *)int_status)) ||
-	    (it6505_test_bit(BIT_INT_VID_FIFO_ERROR,
-			     (unsigned int *)int_status))) {
+	     (it6505_test_bit(INT_SCDT_CHANGE, int_status))) ||
+	    (it6505_test_bit(BIT_INT_IO_FIFO_OVERFLOW, int_status)) ||
+	    (it6505_test_bit(BIT_INT_VID_FIFO_ERROR, int_status))) {
 		it6505->auto_train_retry = AUTO_TRAIN_RETRY;
 		flush_work(&it6505->link_works);
 		it6505_stop_hdcp(it6505);
@@ -2684,7 +2683,7 @@ static void it6505_irq_video_handler(struct it6505 *it6505, const int *int_statu
 		return;
 	}
 
-	if (it6505_test_bit(INT_SCDT_CHANGE, (unsigned int *)int_status))
+	if (it6505_test_bit(INT_SCDT_CHANGE, int_status))
 		it6505_irq_scdt(it6505);
 }
 
@@ -2705,35 +2704,37 @@ static irqreturn_t it6505_int_threaded_handler(int unused, void *data)
 		{ BIT_INT_AUDIO_FIFO_ERROR, it6505_irq_audio_fifo_error },
 		{ BIT_INT_LINK_TRAIN_FAIL, it6505_irq_link_train_fail },
 	};
-	int int_status[3], i;
+	u8 int_status[3];
+	int i;
 
 	if (it6505->enable_drv_hold || !it6505->powered)
 		return IRQ_HANDLED;
 
 	pm_runtime_get_sync(dev);
 
-	int_status[0] = it6505_read(it6505, INT_STATUS_01);
-	int_status[1] = it6505_read(it6505, INT_STATUS_02);
-	int_status[2] = it6505_read(it6505, INT_STATUS_03);
+	if (regmap_bulk_read(it6505->regmap, INT_STATUS_01, int_status,
+			     ARRAY_SIZE(int_status))) {
+		pm_runtime_put_sync(dev);
+		return IRQ_NONE;
+	}
 
-	it6505_write(it6505, INT_STATUS_01, int_status[0]);
-	it6505_write(it6505, INT_STATUS_02, int_status[1]);
-	it6505_write(it6505, INT_STATUS_03, int_status[2]);
+	regmap_bulk_write(it6505->regmap, INT_STATUS_01, int_status,
+			  ARRAY_SIZE(int_status));
 
 	DRM_DEV_DEBUG_DRIVER(dev, "reg06 = 0x%02x", int_status[0]);
 	DRM_DEV_DEBUG_DRIVER(dev, "reg07 = 0x%02x", int_status[1]);
 	DRM_DEV_DEBUG_DRIVER(dev, "reg08 = 0x%02x", int_status[2]);
 	it6505_debug_print(it6505, REG_SYSTEM_STS, "");
 
-	if (it6505_test_bit(irq_vec[0].bit, (unsigned int *)int_status))
+	if (it6505_test_bit(irq_vec[0].bit, int_status))
 		irq_vec[0].handler(it6505);
 
 	if (it6505->hpd_state) {
 		for (i = 1; i < ARRAY_SIZE(irq_vec); i++) {
-			if (it6505_test_bit(irq_vec[i].bit, (unsigned int *)int_status))
+			if (it6505_test_bit(irq_vec[i].bit, int_status))
 				irq_vec[i].handler(it6505);
 		}
-		it6505_irq_video_handler(it6505, (unsigned int *)int_status);
+		it6505_irq_video_handler(it6505, int_status);
 	}
 
 	pm_runtime_put_sync(dev);
-- 
2.56.1


