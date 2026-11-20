Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9072F60A262C
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Nov 2026 00:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OS7IggE1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=cXyCG700Zn8B/A3AKY60YijbmL+VK+ke6En77/mukFw=; b=OS7IggE1x19hQjlgZpvJkhY7QB
	sNst4m9aqp0C/IH8y2yXoJNOMRog1dtAKpkT0K80jNuoqhxq5vTTXVzXYaTZMoXVSbsyhEFhd/Q9S
	oNPBTHjzY3r9VIDKpyi94N6SzkIaMZAwR86ND4vSaD+zoTPjDaqQwm1lkRrG6Sg2Wd0ItCsyTrmmV
	tv/ZQwK0WD3t11et2P9NlFqOHziZ/AYwZBO5bwNSdHqw5f4krvnjbvCBsrUdWBBszBMx3KSyVyXl9
	mKpBd2cG4iEGD+nTRatcdYEuic5aNUdpJb4UwSCSLJCBA2ak210hxwAfC/KawNmTKAriJJt+aKZrK
	Els1AWJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUC8A-0000000DiPE-1LBR;
	Fri, 20 Nov 2026 00:05:30 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUC87-0000000DiOE-2jLE;
	Fri, 20 Nov 2026 00:05:28 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xUC82-000000002Cw-1vkk;
	Fri, 20 Nov 2026 00:05:22 +0000
Date: Fri, 20 Nov 2026 00:05:13 +0000
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
Subject: [PATCH v9 11/14] drm/bridge: it6505: reject a too short
 link-frequencies property
Message-ID: <8637b7d008dbeb04ebcda1e6ff18260187ba1089.1795132452.git.daniel@makrotopia.org>
References: <cover.1795132452.git.daniel@makrotopia.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1795132452.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_160527_687852_32498ED9 
X-CRM114-Status: GOOD (  11.81  )
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

of_property_read_variable_u64_array() is asked for a minimum array
size of zero, so a link-frequencies property shorter than one u64 --
a 32-bit value written by mistake, say -- returns 0 without storing
anything. it6505_parse_dt() reads that as success and derives
max_dpi_pixel_clock from an uninitialised stack variable. Ask for one
element so a short property lands in the existing error path.

Fixes: 380d920b582d ("drm/bridge: add it6505 driver to read data-lanes and link-frequencies from dt")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> # Steelix Chromebook
---
 drivers/gpu/drm/bridge/ite-it6505.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index e271ca625a393..7737e6ecc4bda 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -3405,7 +3405,7 @@ static void it6505_parse_dt(struct it6505 *it6505)
 	if (ep) {
 		len = of_property_read_variable_u64_array(ep,
 							  "link-frequencies",
-							  &link_frequencies, 0,
+							  &link_frequencies, 1,
 							  1);
 		if (len >= 0) {
 			do_div(link_frequencies, 1000);
-- 
2.56.1


