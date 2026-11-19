Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E443E60A2615
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2026 23:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GS5eYbiZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=J3HQhQWcN5hnIdKhRu3sthLmUhshwyGPXEvQ8hFQsEc=; b=GS5eYbiZagk8NjeWrpon5KVGCT
	/zzM2WGsux4BpKry3k9/Uy63G48Ch+yKyFBzXkOS25pVWDcFamiuVosUTZVKJoUwfh1E73uFwmn/B
	W8r3ehNUKME9XECxIUiDE/jT/ZdlLufLPc4rmDV/6lYoviJUX7lsTJq7/coE0E4Y/+5n1vzjKsSJR
	VqqBI1vIyOy20fuKveA22a1OYoUeWKTD74yMMS/ZflLfhpyYDctisAFFTSw4KLwWXyq4rUudo0or/
	e1XCOEtEDjNj8ys8nCljHjcvlF9DuvZNLpeEZLDdIJIQ2VfLsDe0/cF5DXWIwt2fR2aXymstMJ/8g
	ZHmStGhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUC1u-0000000Dh2i-2jeZ;
	Thu, 19 Nov 2026 23:59:02 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUC1s-0000000Dh1R-04O7;
	Thu, 19 Nov 2026 23:59:01 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xUC1n-0000000020Y-478K;
	Thu, 19 Nov 2026 23:58:56 +0000
Date: Thu, 19 Nov 2026 23:58:47 +0000
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
Subject: [PATCH v9 01/14] drm/bridge: it6505: quiesce event sources and work
 on remove()
Message-ID: <b869ff7ee3c726cd31db0c9e382a7fa6cf4164b5.1795132452.git.daniel@makrotopia.org>
References: <cover.1795132452.git.daniel@makrotopia.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1795132452.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_155900_059538_193A01CC 
X-CRM114-Status: GOOD (  14.95  )
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

struct it6505 is freed by devres right after remove() returns, but
remove() cancels none of the driver's work items, so link_works,
hdcp_wait_ksv_list, hdcp_work and extcon_wq can still run afterwards
and dereference freed memory. Cancelling alone would not be enough:
the threaded IRQ and the extcon notifier stay live until devres
teardown and can requeue the works.

Unregister the extcon notifier and disable the IRQ first, then cancel
all work. Make it6505_remove_notifier_module() idempotent, tracking
the registration in a flag under extcon_lock, as both .detach() and
remove() call it now. The notifier_call pointer is left intact:
extcon traverses its raw notifier chain without holding a lock, so a
traversal racing with the unregistration may still invoke the
callback. Also initialise extcon_wq in probe: cancel_work_sync() on a
never-initialised work item trips WARN_ON(!work->func).

Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> # Steelix Chromebook
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/ite-it6505.c | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index e136ac71edbb6..e980cc6d5760c 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -443,6 +443,7 @@ struct it6505 {
 	struct drm_display_mode source_output_mode;
 	struct drm_display_mode video_info;
 	struct notifier_block event_nb;
+	bool extcon_registered;
 	struct extcon_dev *extcon;
 	struct work_struct extcon_wq;
 	int extcon_state;
@@ -2934,11 +2935,15 @@ static int it6505_use_notifier_module(struct it6505 *it6505)
 	int ret;
 	struct device *dev = it6505->dev;
 
+	mutex_lock(&it6505->extcon_lock);
 	it6505->event_nb.notifier_call = it6505_extcon_notifier;
-	INIT_WORK(&it6505->extcon_wq, it6505_extcon_work);
 	ret = devm_extcon_register_notifier(it6505->dev,
 					    it6505->extcon, EXTCON_DISP_DP,
 					    &it6505->event_nb);
+	if (!ret)
+		it6505->extcon_registered = true;
+	mutex_unlock(&it6505->extcon_lock);
+
 	if (ret) {
 		dev_err(dev, "failed to register notifier for DP");
 		return ret;
@@ -2951,13 +2956,16 @@ static int it6505_use_notifier_module(struct it6505 *it6505)
 
 static void it6505_remove_notifier_module(struct it6505 *it6505)
 {
-	if (it6505->extcon) {
-		devm_extcon_unregister_notifier(it6505->dev,
-						it6505->extcon,	EXTCON_DISP_DP,
+	mutex_lock(&it6505->extcon_lock);
+	if (it6505->extcon && it6505->extcon_registered) {
+		devm_extcon_unregister_notifier(it6505->dev, it6505->extcon,
+						EXTCON_DISP_DP,
 						&it6505->event_nb);
-
-		flush_work(&it6505->extcon_wq);
+		it6505->extcon_registered = false;
 	}
+	mutex_unlock(&it6505->extcon_lock);
+
+	flush_work(&it6505->extcon_wq);
 }
 
 static void __maybe_unused it6505_delayed_audio(struct work_struct *work)
@@ -3613,6 +3621,7 @@ static int it6505_i2c_probe(struct i2c_client *client)
 	INIT_WORK(&it6505->link_works, it6505_link_training_work);
 	INIT_WORK(&it6505->hdcp_wait_ksv_list, it6505_hdcp_wait_ksv_list);
 	INIT_DELAYED_WORK(&it6505->hdcp_work, it6505_hdcp_work);
+	INIT_WORK(&it6505->extcon_wq, it6505_extcon_work);
 	init_completion(&it6505->extcon_completion);
 	memset(it6505->dpcd, 0, sizeof(it6505->dpcd));
 	it6505->powered = false;
@@ -3645,6 +3654,12 @@ static void it6505_i2c_remove(struct i2c_client *client)
 	drm_bridge_remove(&it6505->bridge);
 	drm_dp_aux_unregister(&it6505->aux);
 	it6505_debugfs_remove(it6505);
+	it6505_remove_notifier_module(it6505);
+	disable_irq(it6505->irq);
+	cancel_work_sync(&it6505->link_works);
+	cancel_work_sync(&it6505->hdcp_wait_ksv_list);
+	cancel_delayed_work_sync(&it6505->hdcp_work);
+	cancel_work_sync(&it6505->extcon_wq);
 	it6505_poweroff(it6505);
 	it6505_remove_edid(it6505);
 }
-- 
2.56.1


