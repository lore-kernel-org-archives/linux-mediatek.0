Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADB83C4452D
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2026 00:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3AMmzgjw9iSQ3ZnwNOPOwGWgcqsJ/RyLGJvbhEl7MVQ=; b=AQEvgRT7gd6qODu166IPcyQ17W
	hrCYEEtNRuX8S4jQovtPwBSPNEJStGKcwzQPKL+5srWY0vr+bIowZJXYHSIGCZQ2MH7MiXz4b7B0m
	4sYmZOe1L9FNgjMRxHIsVz5MZ2KiuZyDrHVzeCh7wAl0WUo+fNIdkyRhlqUl9iDX5e0BQV5KagGL/
	J0Rjc5kVFBb1bQC95Upx58+uCngV+ZVDSwIUsozdKuxxm+TbJJDcoIJtdqc/3PbuCCX/9GD+/IdLo
	DTkHWZvGZYo9MxurZeYR4K5VMOeu85eAFBSuMHRXZVmMUOSnXmohdeIREM5Dih51mK0mHAgG6JIHR
	GdQISSMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmLJ7-0000000Afl2-31r9;
	Wed, 22 Jul 2026 00:59:33 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmLJ4-0000000AfjQ-38WC;
	Wed, 22 Jul 2026 00:59:31 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wmLIy-000000000yY-1plf;
	Wed, 22 Jul 2026 00:59:24 +0000
Date: Wed, 22 Jul 2026 01:59:21 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hermes Wu <hermes.wu@ite.com.tw>,
	Allen Chen <allen.chen@ite.com.tw>,
	Pin-yen Lin <treapking@chromium.org>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Chen-Yu Tsai <wenst@chromium.org>
Subject: [PATCH v4 2/5] drm/bridge: it6505: disable runtime PM on remove
Message-ID: <59d6066b37a33878c8673bf1659e16fd2624cae4.1784681487.git.daniel@makrotopia.org>
References: <cover.1784681487.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1784681487.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_175930_791976_2FB0013C 
X-CRM114-Status: UNSURE (   9.78  )
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

it6505_i2c_probe() enables runtime PM but it6505_i2c_remove() never
disables it, leaving the device with an unbalanced disable depth
after unbind. Binding the driver again then triggers the "Unbalanced
pm_runtime_enable!" warning.

Disable runtime PM in remove() after all work items have been
cancelled (the extcon work calls pm_runtime_get_sync() and
pm_runtime_put_sync()) and before powering the chip off manually.

Fixes: 10517777d302 ("drm/bridge: it6505: Adapt runtime power management framework")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v4: new patch

 drivers/gpu/drm/bridge/ite-it6505.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 7873ae6df3af..2a8298ee6c03 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -3655,6 +3655,7 @@ static void it6505_i2c_remove(struct i2c_client *client)
 	cancel_work_sync(&it6505->hdcp_wait_ksv_list);
 	cancel_delayed_work_sync(&it6505->hdcp_work);
 	cancel_work_sync(&it6505->extcon_wq);
+	pm_runtime_disable(&client->dev);
 	it6505_poweroff(it6505);
 	it6505_remove_edid(it6505);
 }
-- 
2.55.0

