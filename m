Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44F23C00140
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Aug 2022 20:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nF+ci0c8juSw2FG7lie0JtjDUVepOlyU1sBnwndMfrY=; b=LwgmxkBphn+a87z9je4K0ikm1e
	Ro5/e+ppwRGOfAWnKaRh3rsh72Ju8ugxAi9fWHVcdYxzkfpjibTin/ntkeJntimqZSd4w+qMzu5WS
	VqH+pJ9/Ip8M9fT0X/92BOvgEaPP0fApNfp/Zp7QdEQLV7jHRy5dTrBIO9HefWvKP4a+Vum4j4GET
	IRM27adWafPZO05ED7i8v5horaqpMCI0I1uAmYeRP3E3a/bxRQ7byUkn9ta1cdfrOpCkciuxPnrGV
	hsiT8uCUpF+AwkZ7vt1HSgDkEZk0s8xeWWuL+PHqZPfHcTmNCm5h4/dp5p+GV75dm0j+eoLZ3QNmw
	kkaifR+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMbjr-00DIGd-NC; Fri, 12 Aug 2022 20:58:39 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMbjq-00DIFj-Uw
	for linux-mediatek@bombadil.infradead.org; Fri, 12 Aug 2022 20:58:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=nF+ci0c8juSw2FG7lie0JtjDUVepOlyU1sBnwndMfrY=; b=PH3cs8hX+EP63QmbuL2vX1yECF
	eMQEpzHPGeDsNJ9HOJwEpmEVoTL/3sdFNBsB3Vm2hEPcZkrq/i7+nrch+x966+/uDQxQrnCZUScrz
	wr18eA6jBR2iuJcfCFhKWJwpzhINzCvw6tceXpbBme2t6ROLgbb5ZJqqbunvKAjj8OGv00FNbCdJb
	Eu89rvvGMsUjnwMS9IluF7I4q6aUAWxmvN7AmgobTpQcfwUbHvPEKmSW6FlbtihtFsk5r6xyUq+uV
	KxzNtHIBMXiFQ2n/gBfGSqLw2IXB5MlEmnqElveAG56LkIcxr6vw7gPORUKwKrKkW025bZEMFgmWZ
	SMd0+VRQ==;
Received: from mx1.riseup.net ([198.252.153.129])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMbjn-002ecE-Tz
	for linux-mediatek@lists.infradead.org; Fri, 12 Aug 2022 20:58:38 +0000
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.riseup.net", Issuer "R3" (not verified))
	by mx1.riseup.net (Postfix) with ESMTPS id 4M4GHG0kgyzDrVy;
	Fri, 12 Aug 2022 20:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1660337914; bh=+5D7uHE/auwFvlOw3q1l74r90MUsvTeHdD2XmuMoZAg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sEx6338JJrL2aTWU6Djp837PM+GosfWj+fPpEIDv98j6DpdFIhOno7czJXNtaTBVn
	 euxSREXqOhalFJT9oE2CT/hebLtdn7NBHFNUn+3gKyMn5EXFXZbVvUnlbU18PZyA4i
	 XXYMmCSMwZDR5EcySQaGq0RuH+R7Bg51T7XKkki0=
X-Riseup-User-ID: 3E3F3A4663E39F6CE14249ECF034F0D0F5DCA7766374AF9685B88D20D0D69A1E
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews1.riseup.net (Postfix) with ESMTPSA id 4M4GHB6TWCz5vTk;
	Fri, 12 Aug 2022 20:58:30 +0000 (UTC)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	Maxime Ripard <maxime@cerno.tech>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 2/5] drm/mediatek: Drop of_gpio header
Date: Fri, 12 Aug 2022 17:57:43 -0300
Message-Id: <20220812205746.609107-3-mairacanal@riseup.net>
In-Reply-To: <20220812205746.609107-1-mairacanal@riseup.net>
References: <20220812205746.609107-1-mairacanal@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220812_215836_202806_21BE111D 
X-CRM114-Status: UNSURE (   8.80  )
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

These drivers include the deprecated OF GPIO header <linux/of_gpio.h>
yet fail to use symbols from it, so drop the include.

Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org
Signed-off-by: Maíra Canal <mairacanal@riseup.net>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c  | 1 -
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 630a4e301ef6..508a6d994e83 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -11,7 +11,6 @@
 #include <linux/media-bus-format.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
-#include <linux/of_gpio.h>
 #include <linux/of_graph.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 3196189429bc..4c80b6896dc3 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -16,7 +16,6 @@
 #include <linux/mutex.h>
 #include <linux/of_platform.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
 #include <linux/of_graph.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
-- 
2.37.1


