Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AB6FCD6E55
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jun 2026 20:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t+ZHrbj2i11Saz1eCvmQXhFAkb8MvefLbBLUFLZYRdE=; b=aAWEwtxNi33aEtxmwHLK0fi8lK
	SNdeyqqVyzy1DR1L73m3hwovUn9Fz9DsaUNEiC9hYvrywkq/zoq8XrhZfi/aoq5kPkhaqSxv08MQs
	TvJ16B0iqBo9ZOQRr7nWbzaIx6LmC5D4nKr42F2Rs2iUhywXXQ4ZyCzkqNIMpQp9pL7oNyyLA+yQ+
	LIk8krm+vJ3uOx5QpNnvSjofKCmGrn4JwPwVZjX+6D5Y7iyEc3C3r9Smkd3Gf+Jzu059W9+osnZT7
	bM+zoCHGopY/BVD3YqggjGNYIzigbl2dhQ1G/F9OitDt9HJJv1/mS+qGHSYUt337YdTj9hXHlEoTs
	rwnoxVvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUsUV-0000000FoWJ-0l9E;
	Wed, 03 Jun 2026 20:47:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUsUS-0000000FoVh-3kTd;
	Wed, 03 Jun 2026 20:47:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 961B743B3E;
	Wed,  3 Jun 2026 20:47:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 470E71F00893;
	Wed,  3 Jun 2026 20:47:02 +0000 (UTC)
Received: by venus (Postfix, from userid 1000)
	id BDB17180C6E; Wed, 03 Jun 2026 22:46:59 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Sebastian Reichel <sre@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Kuan-Wei Chiu <visitorckw@gmail.com>, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 chrome-platform@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Hans de Goede <hansg@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>, 
 Purism Kernel Team <kernel@puri.sm>, Yixun Lan <dlan@kernel.org>, 
 Andreas Kemnade <andreas@kemnade.info>, 
 Matti Vaittinen <mazziesaccount@gmail.com>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Amit Sunil Dhamne <amitsd@google.com>, Samuel Kayode <samkay014@gmail.com>, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 asahi@lists.linux.dev, imx@lists.linux.dev, Chen-Yu Tsai <wens@kernel.org>
In-Reply-To: <cover.1780048925.git.u.kleine-koenig@baylibre.com>
References: <cover.1780048925.git.u.kleine-koenig@baylibre.com>
Subject: Re: (subset) [PATCH v1 0/6] power: Use named initializers for
 platform_device_id arrays
Message-Id: <178051961974.2666348.7125017575893735399.b4-ty@collabora.com>
Date: Wed, 03 Jun 2026 22:46:59 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_134704_951263_A70ABBDB 
X-CRM114-Status: GOOD (  12.45  )
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


On Fri, 29 May 2026 12:18:15 +0200, Uwe Kleine-König (The Capable Hub) wrote:
> this series targets to use named initializers for platform_device_id
> arrays. In general these are better readable for humans and more robust
> to changes in the respective struct definition.
> 
> This robustness is needed as I want to do
> 
> 	diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
> 	--- a/include/linux/mod_devicetable.h
> 	+++ b/include/linux/mod_devicetable.h
> 	@@ -610,4 +610,7 @@ struct dmi_system_id {
> 	 struct platform_device_id {
> 		char name[PLATFORM_NAME_SIZE];
> 	-	kernel_ulong_t driver_data;
> 	+	union {
> 	+		kernel_ulong_t driver_data;
> 	+		const void *driver_data_ptr;
> 	+	};
> 	 };
> 
> [...]

Applied, thanks!

[1/6] power: Drop unused assignment of platform_device_id driver data
      commit: 75a0e1e0b86078687c3c6a05107a98c7e59a65a8
[2/6] power: supply: max14577: Drop driver data in of and platform device id arrays
      commit: 37258ad1f3a52ea442c32b3c92ad7146e74050c7
[4/6] power: Use named initializers for platform_device_id arrays
      commit: e28f7498dd819878b8acacb89c4c073a646feea0
[5/6] power: supply: mt6360_charger: Use of match table unconditionally
      commit: eb7ed650e5960fc303130704d1e29d18a7d0e1df
[6/6] power: Unify code style for platform_device_id arrays
      commit: e3f669bed32287ae72c05a4ddab4a6687b0e62ca

Best regards,
-- 
Sebastian Reichel <sebastian.reichel@collabora.com>


