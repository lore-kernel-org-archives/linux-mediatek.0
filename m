Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2098C9830E
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Sep 2026 18:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+PXesm8pePm8SZKfoa5qqeFcjuo248yVgyoMgUhZh3k=; b=GkOHj5rF7i90blfs53AqgkUqXy
	nxVmbf9+WNfwpe27fMlak5YIWwkl0F9K4fP7V6PLAVquWCZslv13vJh3NCG7Asx0AwlcTJJUnUqXL
	njy1wX10mnSieuLXylYyL8voj/42/mGtKR+1WTbPdrgfvsLBFrUFDgDg7OET8ax/5G+IRB7zSEWCy
	g7995iiFp7aVJ9eGjlCbZnW7HdwcCa5XyMXGGnEe1EEXAnnq7VpxSHxHI1jvR1uii1r2SJaUZklMk
	Rl+da7kHrFBDUYxBP4WDmYURJNaa1331GAhgaozOir+ai0J8O/ZAdno3uZp4R74J/E4CRNLUhPjqG
	D9oma5Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9oN7-0000000BvaT-0Wsm;
	Thu, 24 Sep 2026 18:40:41 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9oMt-0000000BvSp-3y1y;
	Thu, 24 Sep 2026 18:40:29 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100)
	(envelope-from <daniel@makrotopia.org>)
	id 1x9oMp-000000007Hb-0xP5;
	Thu, 24 Sep 2026 18:40:23 +0000
Date: Thu, 24 Sep 2026 19:40:20 +0100
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
	Allen Chen <allen.chen@ite.com.tw>,
	Hermes Wu <hermes.wu@ite.com.tw>,
	Pin-yen Lin <treapking@chromium.org>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v7 03/14] drm/bridge: it6505: balance and disable runtime PM
 on remove
Message-ID: <08ed0db0bebf3b1d91cd75f4746d4d611c1870bf.1790275151.git.daniel@makrotopia.org>
References: <cover.1790275151.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1790275151.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_114028_002725_DEED99CC 
X-CRM114-Status: GOOD (  11.32  )
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

Runtime PM is enabled in probe but never disabled on remove, so
rebinding the driver warns "Unbalanced pm_runtime_enable!". The
extcon work also holds a usage reference while a display is
connected, which unbinding leaks; the count survives in struct
device, so after a rebind the device never runtime-suspends again.

Drop the usage reference held for a connected display and disable
runtime PM in remove().

Fixes: 10517777d302 ("drm/bridge: it6505: Adapt runtime power management framework")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v7: no changes

v6: no changes

v5: also drop the usage ref held for a connected display; retitled

v4: new patch
---
 drivers/gpu/drm/bridge/ite-it6505.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 52d7d818a5ea..9c4aae383c1c 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -3663,6 +3663,9 @@ static void it6505_i2c_remove(struct i2c_client *client)
 	cancel_work_sync(&it6505->hdcp_wait_ksv_list);
 	cancel_delayed_work_sync(&it6505->hdcp_work);
 	cancel_work_sync(&it6505->extcon_wq);
+	if (it6505->extcon_state)
+		pm_runtime_put_sync(&client->dev);
+	pm_runtime_disable(&client->dev);
 	it6505_poweroff(it6505);
 	it6505_remove_edid(it6505);
 }
-- 
2.55.0

