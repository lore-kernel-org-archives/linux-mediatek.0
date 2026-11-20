Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CEE6606A337
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Nov 2026 00:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DjtVKu7g
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Bs+9STUWdF4VN/Op7ocuJ+kHlbmIYCqA3ZkhThCuG/c=; b=DjtVKu7grOhV6y5ZiIAe1dtDUb
	LzmN5Z7ECGnStgL4WsmrAtWrxoUGP+t1yTPAZj4OD/0VxdfYmQLtJ0okdEO8FUheJaQ4rprqDqqTQ
	vt90aZd5Uqpjt6TKj6d4lZekoYKO/NBOORa8w1z2FKR7QRdAOaVhRj6NRIjxxMe5D8h9zH2zcXS7r
	RmPD9nyIxJvSV9brI3Wvk8eXenjmAn+c/denY+5Xyug4R/o05qY5vLUJWrQzyYgBbRJiBhEoz4DlO
	F/MqZPV9q0kYIXHsgAaadT2wgyaEHC76CaAyemjJ2aCIXLDNK8WCC1PM9rx2BxFriziUR817HM/Nn
	ygvugEPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUC6m-0000000Di1z-3Ab3;
	Fri, 20 Nov 2026 00:04:04 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUC6j-0000000Di0R-2otY;
	Fri, 20 Nov 2026 00:04:02 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xUC6f-0000000029T-0cKO;
	Fri, 20 Nov 2026 00:03:57 +0000
Date: Fri, 20 Nov 2026 00:03:48 +0000
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
Subject: [PATCH v9 08/14] drm/bridge: it6505: drop the audio input FS debug
 print
Message-ID: <2b939c53c4aee37140945201b0c41b74f0e432ae.1795132452.git.daniel@makrotopia.org>
References: <cover.1795132452.git.daniel@makrotopia.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1795132452.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_160401_717584_B9B5349D 
X-CRM114-Status: GOOD (  11.91  )
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

it6505_enable_audio() reads REG_AUDIO_INPUT_FREQ only to print the
measured audio sample rate, dividing by the readback. The register is
a read-only counter of the input audio frequency, which the driver
otherwise only uses to check whether an I2S bit clock is present. It
reads back 0 when no audio clock has been latched, and it6505_read()
returns a negative errno on i2c failure, while the arguments of the
debug print are evaluated even with debug output disabled.

The value is only informational in the enable path and remains
accessible through the regmap debugfs interface, so drop the read and
the print instead of guarding the division.

Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/gpu/drm/bridge/ite-it6505.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 9357996c2eb38..17f4f6497b34d 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -1606,7 +1606,6 @@ static void it6505_disable_audio(struct it6505 *it6505)
 static void it6505_enable_audio(struct it6505 *it6505)
 {
 	struct device *dev = it6505->dev;
-	int regbe;
 
 	DRM_DEV_DEBUG_DRIVER(dev, "start");
 	it6505_disable_audio(it6505);
@@ -1624,9 +1623,6 @@ static void it6505_enable_audio(struct it6505 *it6505)
 			AUDIO_FIFO_RESET);
 	it6505_set_bits(it6505, REG_AUDIO_SRC_CTRL, AUDIO_FIFO_RESET, 0x00);
 	it6505_set_bits(it6505, REG_RESET_CTRL, AUDIO_RESET, 0x00);
-	regbe = it6505_read(it6505, REG_AUDIO_INPUT_FREQ);
-	DRM_DEV_DEBUG_DRIVER(dev, "regbe:0x%02x audio input fs: %d.%d kHz",
-			     regbe, 6750 / regbe, (6750 % regbe) * 10 / regbe);
 	it6505_set_bits(it6505, REG_DATA_MUTE_CTRL, EN_AUD_MUTE, 0x00);
 }
 
-- 
2.56.1


