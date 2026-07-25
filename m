Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C0B2C531FC
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Jul 2026 03:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9GXlLgfySJ+T2XkfPQHw/th1nxvSWk3Hu8VktUXnWts=; b=dngFujBYk/qeaW2y6JovFDTklV
	vBtfhcCu7YlKht8UZH6E8VIGZ4ZfZQVLiH4fuoHXvxnx69YQU+Wj7yEk8GOsT8EwYkkTrwVNoM8d5
	SRuGNn6Mdd0sPBmgeVgstENsqYWfbGMbKzmf3HmBycgmdZvhQFpuJ4cpbi4IpMb3dZ0O+VFbUiDsv
	7s/FnVvKVvMQvxelG6YqnlAsSrhr64zMKFLItkQBsXKadWZQAiON+PSnyC9qWAEIzlguZoPNMfTLk
	Yvk3S86X/2jpS5mVRz9bV4WE/vyG/ZOs7/atjpwUFdLz01iLkdS+juYlwyCpzjhzYUlIo+HcgLPDb
	2BIP7xJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnScv-0000000HWJb-42q7;
	Sat, 25 Jul 2026 03:00:37 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnScq-0000000HWGv-0Gkt;
	Sat, 25 Jul 2026 03:00:35 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wnSch-0000000035X-3Gla;
	Sat, 25 Jul 2026 03:00:23 +0000
Date: Sat, 25 Jul 2026 04:00:20 +0100
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
	linux-mediatek@lists.infradead.org,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: [PATCH v6 10/13] drm/bridge: it6505: reject a too short
 link-frequencies property
Message-ID: <44684d199a5a6e6b30d84aed463c1c4ec4e9b014.1784947240.git.daniel@makrotopia.org>
References: <cover.1784947240.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1784947240.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_200032_123528_1D6EA491 
X-CRM114-Status: GOOD (  11.57  )
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

of_property_read_variable_u64_array() is asked for a minimum array
size of zero, so a link-frequencies property shorter than one u64 --
a 32-bit value written by mistake, say -- returns 0 without storing
anything. it6505_parse_dt() reads that as success and derives
max_dpi_pixel_clock from an uninitialised stack variable. Ask for one
element so a short property lands in the existing error path.

Fixes: 380d920b582d ("drm/bridge: add it6505 driver to read data-lanes and link-frequencies from dt")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v6: new patch

 drivers/gpu/drm/bridge/ite-it6505.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 0da8b40dd88a..1678ec5b3ba7 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -3389,7 +3389,7 @@ static void it6505_parse_dt(struct it6505 *it6505)
 	if (ep) {
 		len = of_property_read_variable_u64_array(ep,
 							  "link-frequencies",
-							  &link_frequencies, 0,
+							  &link_frequencies, 1,
 							  1);
 		if (len >= 0) {
 			do_div(link_frequencies, 1000);
-- 
2.55.0

