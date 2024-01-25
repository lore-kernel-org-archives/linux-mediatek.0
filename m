Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FC75C47258
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Jan 2024 14:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DooyQrtizpQPYQvg3orF2s8x816HvpICh5L6Gs5NXqE=; b=r+1qmZ1St6apki8HjCsIku/o1w
	tGZnBd/XZdC+DmP5ajMwMaGSFCcgKpagk3Q/vnTU6+O4tjjwfP5fCVEED0RG9GTAeG4P8nY/QEdN8
	uZxoHh172iXxX1fdVYsGeqVHICCeXPwBD81+2GYF6X0IZK8gWjuFLphJoGWELI6VZtOEGTok01F2F
	idduN26yZit1pffC7nufb8vEW+k2SKivZgDzBFhJbM+1A7bqQXTrDlfeypmOuYvw7tz874T51KQ4+
	b5RxD0uGOctztE7B89wHgKd89OiVMoR8Ow3TJZ9Ktkje22kZXrAwyqXzEieP79rUhi4anqAzoaanQ
	GY4FqzAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT0Vo-00000000JVT-1tyv;
	Thu, 25 Jan 2024 14:15:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT0Vm-00000000JUe-2S6i
	for linux-mediatek@bombadil.infradead.org;
	Thu, 25 Jan 2024 14:15:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=DooyQrtizpQPYQvg3orF2s8x816HvpICh5L6Gs5NXqE=; b=kUUuQF4zYvYcU0/pHTfUBJZhk5
	2xmvbu5K/Tq/xSZ0dOmFXWWtrFNhbjlfEtXkLqXT1ysyKxNt3yH5umPlgVCNlEM00/NztWxEXEVzL
	lkDB+Ev4XKo5lpgFj2ndcOdr3aIxP/hgPDNbbrFB6dshvHzUELceb0440cSZR20pnQF1sjL5ua6zx
	lvqmDqmf4FKEdwGS8lGnS9erLaz5YehaZr74giogBTLBtFbGDe0aDSPG34nyWdHyXGwelN+k+WxiV
	nGm1QlKXi59H28MtzG/vcvCX4EM9lMgWQkBw/oF6rEKWrKSx/tPAE2WfhwiKvUPoXVdmqUDyBu8E5
	i8GhkyCw==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rSybr-00000005Hph-2UFw
	for linux-mediatek@lists.infradead.org;
	Thu, 25 Jan 2024 12:13:33 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rSyZB-0003Ze-Mz; Thu, 25 Jan 2024 13:10:45 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rSyZ6-002HOt-Gy; Thu, 25 Jan 2024 13:10:40 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rSyZ6-007myG-1E;
	Thu, 25 Jan 2024 13:10:40 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: linux-pwm@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Benson Leung <bleung@chromium.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Paul Cercueil <paul@crapouillou.net>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Robert Foss <rfoss@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel@pengutronix.de,
	linux-arm-kernel@lists.infradead.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	linux-mips@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	Douglas Anderson <dianders@chromium.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	dri-devel@lists.freedesktop.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v5 003/111] pwm: Provide a macro to get the parent device of a given chip
Date: Thu, 25 Jan 2024 13:08:25 +0100
Message-ID: <1cae6f73264ab313205eaa9483251f7aaf259cb4.1706182805.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1706182805.git.u.kleine-koenig@pengutronix.de>
References: <cover.1706182805.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=988; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=SfOslAbsyBLEr/955V0luBriAR1MBuqlRLojueDMWPA=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlsk89sMCb69Ns1+4RognQQiOh0kwtwTRgZqZe7 Qr1BL64ZR+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZbJPPQAKCRCPgPtYfRL+ Tm5ICACqUZnuAnSjFfXrvBpLBI7tlj8WA+HQMKQ6Zc+N4XX6ETnakaKJsM+x6j+q4etOxq2c/gZ zxT7BpN14RbPiCl4D8hdIHJMFSxpOXgFMhHn6G0CiQZKij7FYNQcIit0BAKORd4VGZ3VwABrQ/Y OjjIIjxHWR1qdMK2N2kNbFpbTf4/2PRkxMHdXTJcAMAnSGWqM6H23gUlqytwn6NbEab8dDUgmkC dj7M9Z8Ubq9AofnoudLfMHIY54wLfZ0PkykBosZOeOLWLjqyM0qMfK6/MVn1CgVUVr75LWffVka lOK3tBDX44i4Xzm74nXYI2dfx77u3aY3K3mXE4UoCo8Z6Cl7
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_121331_749246_0D313F26 
X-CRM114-Status: GOOD (  13.54  )
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

Currently a pwm_chip stores in its struct device *dev member a pointer
to the parent device. Preparing a change that embeds a full struct
device in struct pwm_chip, this accessor macro should be used in all
drivers directly accessing chip->dev now. This way struct pwm_chip and
this macro can be changed without having to touch all drivers in the
same change set.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 include/linux/pwm.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/pwm.h b/include/linux/pwm.h
index 8ffe9ae7a23a..d7966918f301 100644
--- a/include/linux/pwm.h
+++ b/include/linux/pwm.h
@@ -289,6 +289,11 @@ struct pwm_chip {
 	struct pwm_device *pwms;
 };
 
+static inline struct device *pwmchip_parent(struct pwm_chip *chip)
+{
+	return chip->dev;
+}
+
 #if IS_ENABLED(CONFIG_PWM)
 /* PWM user APIs */
 int pwm_apply_might_sleep(struct pwm_device *pwm, const struct pwm_state *state);
-- 
2.43.0


