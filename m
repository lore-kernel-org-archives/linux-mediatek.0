Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8317AC433EF
	for <linux-mediatek@archiver.kernel.org>; Sun, 17 Jul 2022 17:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k798q7ML9R4Plrb6TqpakxyUbx1g5KWRA3qhCOyn4ek=; b=u4rF+kQa1XPQJuTOU49u+0FWCw
	EPHTqh5bOVacDCYdWqklOM7k99YLOZB4lz2i0Prc+mBwaHGUMStLg3FRymX3CZJwN5FSlNH/DS0Zv
	3eICekfdb/axNQZOmE2E5VlrR0hbbYTZZ23r1iAHQlCdLBVeUjJtrno0MGQiRN87VuqVUwlXwt1Hs
	D1vMZrBKjalZXxn1zzW9O1JWypmEv3xARPEacKSl7ae9uCXOJpSo8OdOTMK9jaglcybrmg2Pn5VVk
	l+dbnxWaadiRIxq/nj+LIkQpAF/degowYTkXMJFect/Nchp+YnTL+f4IOmAdO6/7evaeAoFGJC3wl
	pkZ0mfog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oD8Xq-007y7Q-Po; Sun, 17 Jul 2022 17:59:06 +0000
Received: from mailrelay3-1.pub.mailoutpod1-cph3.one.com ([46.30.210.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oD8XD-007xp3-LY
	for linux-mediatek@lists.infradead.org; Sun, 17 Jul 2022 17:58:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=rsa1;
	h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
	 subject:cc:to:from:from;
	bh=k798q7ML9R4Plrb6TqpakxyUbx1g5KWRA3qhCOyn4ek=;
	b=e4C90Y5+4w0vcw6rF3D2f2kPP3t7AKAHZcUH+DI7+w2S/TiSCVHlJIIDo1BTHWu8uXzcUjI1wRu52
	 2zJtbAOys8Wv+uhj3pGNnfUOZEh/aY+NUpDDduf4CZ7mHj8+XoRYw2DYuVYiaWYk9eM9m1vqSFoJnJ
	 MbGBsjKP3B+RERK182PCh3q8+RcvUgJ2bgxltXrqQAZZPOkqIRdhdzcDHFLQf+dsy8+Zf0WFmDf5vT
	 suoUhkWliBi2VSyuOrwsDNYnBd4E0tI3lJ345y1HAwNMjxKe9UvyirlmZxYr5+qmnk20MXk8HcEv4Z
	 VVKzfw1WQwbfXSE32Q1WGB1w08q0cLQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=ed1;
	h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
	 subject:cc:to:from:from;
	bh=k798q7ML9R4Plrb6TqpakxyUbx1g5KWRA3qhCOyn4ek=;
	b=atAGNS4/GuLbsXt6VCubT00JfzK8dji6XUbvCGx+kiMBvBk+yhcp7ECF/qD3gslmtsoc7xgAbAlme
	 hMikQjUAw==
X-HalOne-Cookie: e93fb8437fd3034790c1dedaf93d71e57f69d988
X-HalOne-ID: 0dd61fc2-05fa-11ed-be7f-d0431ea8bb03
Received: from mailproxy1.cst.dirpod4-cph3.one.com (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
	by mailrelay3.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
	id 0dd61fc2-05fa-11ed-be7f-d0431ea8bb03;
	Sun, 17 Jul 2022 17:58:25 +0000 (UTC)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Robert Foss <robert.foss@linaro.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Benson Leung <bleung@chromium.org>,
	Cai Huoqing <cai.huoqing@linux.dev>,
	chrome-platform@lists.linux.dev,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	David Airlie <airlied@linux.ie>,
	Enric Balletbo i Serra <enric.balletbo@collabora.com>,
	Guenter Roeck <groeck@chromium.org>,
	Jitao Shi <jitao.shi@mediatek.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Philip Chen <philipchen@chromium.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sam Ravnborg <sam@ravnborg.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v1 12/12] drm/todo: Add bridge related todo items
Date: Sun, 17 Jul 2022 19:58:01 +0200
Message-Id: <20220717175801.78668-5-sam@ravnborg.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220717175801.78668-1-sam@ravnborg.org>
References: <20220717174454.46616-1-sam@ravnborg.org>
 <20220717175801.78668-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220717_105827_915548_DD7500E9 
X-CRM114-Status: UNSURE (   9.23  )
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

Add todo in the hope someone will help updating the bridge drivers.

v2:
  - Updated descriptions in todo.rst

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Acked-by: Maxime Ripard <mripard@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 Documentation/gpu/todo.rst | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 10bfb50908d1..fbcc232e0bc1 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -480,6 +480,26 @@ Contact: Thomas Zimmermann <tzimmermann@suse.de>
 
 Level: Starter
 
+Drop use of deprecated operations in bridge drivers
+--------------------------------------------------
+
+&struct drm_bridge_funcs contains a number of deprecated operations
+which can be replaced by the atomic variants.
+
+The following is more or less 1:1 replacements with the arguments
+and names adjusted:
+* pre_enable => atomic_pre_enable
+* enable => atomic_enable
+* disable => atomic_disable
+* post_disable => atomic_post_disable
+
+* mode_set is no longer required and the implementation shall be merged
+  with atomic_enable.
+
+Contact: bridge maintainers, Sam Ravnborg <sam@ravnborg.org>,
+         Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+
+Level: Beginner or intermediate (depending on the driver)
 
 Core refactorings
 =================
-- 
2.34.1


