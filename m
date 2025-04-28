Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACCE3C36005
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Apr 2025 08:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GzWCaWiQuss0Kn/3c+julCzjSPwQhMUpLtincHj4wRc=; b=KqNlL3ifI0GD1szkeqeHen2Bkg
	HbGCNiQE2ztriziYWXseyRjoO/2AELwgyAnZbYtNFSAOHXi0WMtU1MrQTm0xxs0iiQUTkxKpIialh
	m+VJUXWRMSuX4x9b5lnBVS9L3TBTT+/nSVP9PQhJH9/e7eTEy3VRt7P2ZHN7pXvNcDlx79+pzpFYo
	4KJ7on+J+InreITbwiXAWtoAuno3QVJDCZ2OZ9UtrndzGBtBkm06OHcN7Y9SKQ6p1zcbwAt7OIEms
	NXWeGMzGXWzeT9GF+j9P1qaS0K6TPCc8AVFUHR5kD5Yv+kIVD15HFzWNxxc3z6GyjSMlGMmBc0muu
	7kqGVtjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9KDf-00000005WAV-214c;
	Mon, 28 Apr 2025 08:52:07 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9K2K-00000005UXG-1OTF
	for linux-mediatek@lists.infradead.org;
	Mon, 28 Apr 2025 08:40:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 05DE1A4A878;
	Mon, 28 Apr 2025 08:34:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 390DEC4CEE4;
	Mon, 28 Apr 2025 08:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745829622;
	bh=6I0kWj4PmNIOlZtd9oOgfAw9VX6z3OU98LzApc571p0=;
	h=From:Date:Subject:To:Cc:From;
	b=PT/5uQWr22MsvaDK+lS2Fx/k/jcmpe46qbGmx7tRbmLaYEGfCkENpe5ORE6SJ/kKy
	 ZBDgH8viX3bTYttK+lOpjaerExszoSVlnInvYjl3/d10tsZdQOV1ZhuFfkGCI2q0yC
	 lF6M8fsmU+k5vBDx9PXrs1hR+nUZ6JOn0MktcHqLpU0WJKoCtvW8A03DJWEFPVhCk4
	 G/UY4YWwoVdWHNLGnyTlmh/xa/ln8Oa5RWcatZ46hooTIIlh/B9DLlRgL/twuQq0hx
	 eWze6ZqLra6hG7tTMK/DlqkMbsFUqZs4UlFPV6EPZauxviTufX14YdUPVmk8d70zKf
	 YwetIOSixkilA==
From: Mattijs Korpershoek <mkorpershoek@kernel.org>
Date: Mon, 28 Apr 2025 10:40:17 +0200
Subject: [PATCH RESEND] MAINTAINERS: .mailmap: update Mattijs Korpershoek's
 email address
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250428-keypad-maintainers-v1-1-4e9c4afba415@kernel.org>
X-B4-Tracking: v=1; b=H4sIAPA+D2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDEyML3ezUyoLEFN3cxMy8EiBOLSrWNbcwsDQwNkpJNDY0VQJqLChKTcu
 sABsarRTkGuzq56IUW1sLAJLCbWhsAAAA
X-Change-ID: 20250428-keypad-maintainers-7809032da315
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Mattijs Korpershoek <mkorpershoek@kernel.org>, linux-input@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3-dev-7b9b9
X-Developer-Signature: v=1; a=openpgp-sha256; l=1784;
 i=mkorpershoek@kernel.org; h=from:subject:message-id;
 bh=6I0kWj4PmNIOlZtd9oOgfAw9VX6z3OU98LzApc571p0=;
 b=owEBbQGS/pANAwAKARkNHbRmThk1AcsmYgBoDz70zMGTm3Ip8bhSkxPyjZri9uKgI8YajngVH
 NZBiWkvsISJATMEAAEKAB0WIQQu6UKnth9qvlMTrQAZDR20Zk4ZNQUCaA8+9AAKCRAZDR20Zk4Z
 NaWOCACYnc5P9s7zUJalhI3ZuPDzbpupV2g+DuZVyTDzz0f6WL1JZbEoXJeUytDq3WjsaRp5Tk2
 PDvysM+MyQ/GmA06qHozYanzhAY3UIhedeZkKuBb4nQfn0Y7vrhzlqV3VwiEQ01nzsKii2SCUL4
 PZpB8RkRcQeFscX4VT8xYt+gXxwewN/osaVIxiEW/aOHGsX4f2s+0yDXQp8fSFHvKqrTo/KJf3h
 ZExzXPfDNZzS338KDsSPMyxNL5mwgrApkwiZ37yaaELHolzUHaV25qmdDFkP9I2mErKBP0n/UIb
 CfmGmybNhm4CbgKXRWduJrKBzHMpaFrnt6AXyzzTH/YaQpz8
X-Developer-Key: i=mkorpershoek@kernel.org; a=openpgp;
 fpr=8234A35B45C0D26B31C1A2DA570338B018144F28
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_014024_506664_F5E6BE56 
X-CRM114-Status: UNSURE (   9.76  )
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

Update Mattijs Korpershoek's email address to @kernel.org.

Signed-off-by: Mattijs Korpershoek <mkorpershoek@kernel.org>
---
Hi Dmitry,

Would it be possible to pick this up please?
My BayLibre email will no longer work soon and I'd really like to stay
involved with the mt6779-keypad driver.

Thanks!
Mattijs
---
 .mailmap    | 1 +
 MAINTAINERS | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/.mailmap b/.mailmap
index 6762cde6ac7a..8c89847a048f 100644
--- a/.mailmap
+++ b/.mailmap
@@ -486,6 +486,7 @@ Matthias Fuchs <socketcan@esd.eu> <matthias.fuchs@esd.eu>
 Matthieu Baerts <matttbe@kernel.org> <matthieu.baerts@tessares.net>
 Matthieu CASTET <castet.matthieu@free.fr>
 Matti Vaittinen <mazziesaccount@gmail.com> <matti.vaittinen@fi.rohmeurope.com>
+Mattijs Korpershoek <mkorpershoek@kernel.org> <mkorpershoek@baylibre.com>
 Matt Ranostay <matt@ranostay.sg> <matt.ranostay@konsulko.com>
 Matt Ranostay <matt@ranostay.sg> <matt@ranostay.consulting>
 Matt Ranostay <matt@ranostay.sg> Matthew Ranostay <mranostay@embeddedalley.com>
diff --git a/MAINTAINERS b/MAINTAINERS
index b2c3be5f6131..e8a0fa814ab5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15130,7 +15130,7 @@ F:	Documentation/devicetree/bindings/media/mediatek-jpeg-*.yaml
 F:	drivers/media/platform/mediatek/jpeg/
 
 MEDIATEK KEYPAD DRIVER
-M:	Mattijs Korpershoek <mkorpershoek@baylibre.com>
+M:	Mattijs Korpershoek <mkorpershoek@kernel.org>
 S:	Supported
 F:	Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
 F:	drivers/input/keyboard/mt6779-keypad.c

---
base-commit: 393d0c54cae31317deaa9043320c5fd9454deabc
change-id: 20250428-keypad-maintainers-7809032da315

Best regards,
-- 
Mattijs Korpershoek <mkorpershoek@kernel.org>


