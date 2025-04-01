Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6D94C36010
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Apr 2025 13:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NxVIV4pFjINn3tgmhSVhsZyc0SATb9hEOee3IIClFb4=; b=ffgy1JHgwv9CWnLfqJ+V+bC5NL
	MXC3OQqKmi9xeyBZa1T7QkQwTVYviE04gy+ILsn5qgRZupnA9bvmxewZNjewI2ia4g+cN05ADMXbZ
	lXJCkJzGmU7btcUtddYbkfeHpoBgEzvNWQyAtg5fxU5v0MlpcwF1IGUZIGj1gEhBzrFxIP9Iwu/EY
	vQWKhGKLH8r4+k5ioQkDRt6eQAtho8ayMhoHf8IuCFNNdoyOZ2pUIZYw8z5sUZmGV9mipeFOTBzs9
	saL3Rp7X6Uv1P8URNx8mtwvSYr8MS6aGR55GwbanlumzCqYDrEONSox1ZHjGp1xlWaacOWz59UDFm
	lklNND8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzbc3-00000003Qob-3FLA;
	Tue, 01 Apr 2025 13:25:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzbaP-00000003QdT-1YQH
	for linux-mediatek@lists.infradead.org;
	Tue, 01 Apr 2025 13:23:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F320E61132;
	Tue,  1 Apr 2025 13:23:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 850DBC4CEE4;
	Tue,  1 Apr 2025 13:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743513804;
	bh=6Nw24EbRgYYOy+DUPepq5IsFLUV2zOLDoEnzpik+ckQ=;
	h=From:Date:Subject:To:Cc:From;
	b=cq2kZ99dvRPfIxGmTFv3MhgRx9esG0fmrnHDe/NgYY50SZvi+w5Lj0oaGCkqDK83x
	 5mVIe4bL3WOZniMGFUg4q7kZG0YK4VmnrftqaxxQNjHXDgt0WRh8JEVk7aglUSCPYU
	 gLeIbqX7d0PTEpSpLyHBHlJeug1A6GC1iggh2/rUp9tXr7qf7anuIDHv5J/I5PnYxS
	 xbTAS5+KIgXaGPkPvznvV7B1jcBAKkDBgDN2cj0WLDnMczc+q+KPNAW7FQwKyf2ls6
	 vdNvl07h+zFJ8bPM6tSs/egtAtSPhTWfZoAlX7zp02XATfi2qyHRsnDHWifFz+aA4O
	 regtDvx7wxp+A==
From: Mattijs Korpershoek <mkorpershoek@kernel.org>
Date: Tue, 01 Apr 2025 15:23:10 +0200
Subject: [PATCH] MAINTAINERS: .mailmap: update Mattijs Korpershoek's email
 address
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250401-mattijs-korg-v1-1-734a7ad8be1f@kernel.org>
X-B4-Tracking: v=1; b=H4sIAL3o62cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDEwND3dzEkpLMrGLd7PyidN00s0Rjk8Qkc/NkkzQloJaCotS0zAqwcdG
 xtbUARub+nV4AAAA=
X-Change-ID: 20250401-mattijs-korg-f6a34ab77c4f
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-input@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Mattijs Korpershoek <mkorpershoek@kernel.org>
X-Mailer: b4 0.14.3-dev-94c79
X-Developer-Signature: v=1; a=openpgp-sha256; l=1580;
 i=mkorpershoek@kernel.org; h=from:subject:message-id;
 bh=6Nw24EbRgYYOy+DUPepq5IsFLUV2zOLDoEnzpik+ckQ=;
 b=owEBbQGS/pANAwAIARkNHbRmThk1AcsmYgBn6+jIx9a8LCkrFb7kmJXLDCuPk62m9kwIBzlmu9ZR
 Q+Ro0mOJATMEAAEIAB0WIQQu6UKnth9qvlMTrQAZDR20Zk4ZNQUCZ+voyAAKCRAZDR20Zk4ZNYbqB/
 43jZtO9qIG3UXhKqKWSGO9KB10zS2goC2nTlptSgzAcelUtnRxXIjshqRDgSR8HInKxRD0+hJZqytt
 Et6JexuYQPk6mI1pkasSqHFS2HtTt8XxnAnf4KeUmjVIUUkHUMsgpNjXWblajmSSCjeQCShU1RvIG8
 NnFVzCO4IiTQqdRIbFEiE8VrVRAXJr6MJVxUu7g6BAtozeB/Hx5X92PI8qDBMtrpuykiezQL1QYOwC
 9cG6ePFrx0kQDCdtpMTcHCrpzpcoTD+mTzwXOxOglItuoqN7VUTL3mDm+vnG7mr79YOsbBR/hEOg49
 gsEmTUdPH5qlpMBAskecPaeZE65NHO
X-Developer-Key: i=mkorpershoek@kernel.org; a=openpgp;
 fpr=8234A35B45C0D26B31C1A2DA570338B018144F28
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

Update Mattijs Korpershoek's email address to @kernel.org.

Signed-off-by: Mattijs Korpershoek <mkorpershoek@kernel.org>
---
 .mailmap    | 1 +
 MAINTAINERS | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/.mailmap b/.mailmap
index f485903803c6..d68de811b8e8 100644
--- a/.mailmap
+++ b/.mailmap
@@ -474,6 +474,7 @@ Matthias Fuchs <socketcan@esd.eu> <matthias.fuchs@esd.eu>
 Matthieu Baerts <matttbe@kernel.org> <matthieu.baerts@tessares.net>
 Matthieu CASTET <castet.matthieu@free.fr>
 Matti Vaittinen <mazziesaccount@gmail.com> <matti.vaittinen@fi.rohmeurope.com>
+Mattijs Korpershoek <mkorpershoek@kernel.org> <mkorpershoek@baylibre.com>
 Matt Ranostay <matt@ranostay.sg> <matt.ranostay@konsulko.com>
 Matt Ranostay <matt@ranostay.sg> <matt@ranostay.consulting>
 Matt Ranostay <matt@ranostay.sg> Matthew Ranostay <mranostay@embeddedalley.com>
diff --git a/MAINTAINERS b/MAINTAINERS
index d5dfb9186962..50d6519d3b9d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15014,7 +15014,7 @@ F:	Documentation/devicetree/bindings/media/mediatek-jpeg-*.yaml
 F:	drivers/media/platform/mediatek/jpeg/
 
 MEDIATEK KEYPAD DRIVER
-M:	Mattijs Korpershoek <mkorpershoek@baylibre.com>
+M:	Mattijs Korpershoek <mkorpershoek@kernel.org>
 S:	Supported
 F:	Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
 F:	drivers/input/keyboard/mt6779-keypad.c

---
base-commit: 08733088b566b58283f0f12fb73f5db6a9a9de30
change-id: 20250401-mattijs-korg-f6a34ab77c4f

Best regards,
-- 
Mattijs Korpershoek <mkorpershoek@kernel.org>


