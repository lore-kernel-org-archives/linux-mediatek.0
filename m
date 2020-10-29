Return-Path: <SRS0=uLCs=EE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A348C56201
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Oct 2020 15:28:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7F7D2076B
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Oct 2020 15:28:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rdtAC4uW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="pRxqSu9/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C7F7D2076B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yw5Y/IufPCIej84/l6YxWmamU/Sam3P3rYg5gYuh620=; b=rdtAC4uWVCSG9S+Z2DAZcoWS9Z
	WuVTRsZPSPigUnO193wjlW7PdAJLHBJY3nWiz9eJd7zyq0IULD5OD+Ef/ByBdrYX/wxxCVz4nWpQ/
	RAvXJyCEYGTSm8bOw2s68pkC9Vf2KYnzY6DGoZIeIwALohsDJbrTvb1VtokQ/gQI30gGC85tYo6hK
	FrFd4mEYFEjZYuPyHCqvz4klLtflDG5x1rG4gy1EhOP7nD0UuzEjnA+wXrPvTjC94mLri8zWg9g0L
	sGWRuW7YPOFahkhlP+rVyRUQ8wG+YmbzxH+cqqQCVFnf0Dm0bNV44sqQQ82aPPWMmC+20Dv3aS8HB
	5LvJG2IA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kY9qW-0001G8-Cj; Thu, 29 Oct 2020 15:28:12 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kY9qN-0001Bm-5L
 for linux-mediatek@lists.infradead.org; Thu, 29 Oct 2020 15:28:06 +0000
Received: from DESKTOP-GFFITBK.localdomain (218-161-90-76.HINET-IP.hinet.net
 [218.161.90.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2EA7C2087E;
 Thu, 29 Oct 2020 15:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603985282;
 bh=Zi0kuyP9vgK4EXGIlYmrUOFG7x6adNrfwTlZu8S3Jjs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pRxqSu9/FB34jdVu6iUOlu1p5VEsBzhtzj4YELb0opPQqlO9OUGgkGPtK0AYF+vVt
 EVpJ/YDVhaJvZG3rAYyPoikrOYhlG5nvXNQWkxvB3Mh94SaM3C6pBa/Nu1nZ0Fp5JZ
 RAl4fkHbI3fccQL7Jcj0xZsWyuHT7rj1NB6Biw3g=
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>
Subject: [PATCH 3/3] MAINTAINERS: add files for Mediatek DRM drivers
Date: Thu, 29 Oct 2020 23:27:02 +0800
Message-Id: <20201029152702.533-4-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201029152702.533-1-chunkuang.hu@kernel.org>
References: <20201029152702.533-1-chunkuang.hu@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201029_112803_385808_3146CCB9 
X-CRM114-Status: GOOD (  12.41  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Mediatek MIPI DSI phy driver is moved from drivers/gpu/drm/mediatek to
drivers/phy/mediatek, so add the new folder to the Mediatek DRM drivers'
information.

Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e73636b75f29..14f5018c01b6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5867,6 +5867,7 @@ S:	Supported
 F:	Documentation/devicetree/bindings/display/mediatek/
 F:	drivers/gpu/drm/mediatek/
 F:	drivers/phy/mediatek/phy-mtk-hdmi*
+F:	drivers/phy/mediatek/phy-mtk-mipi*
 
 DRM DRIVERS FOR NVIDIA TEGRA
 M:	Thierry Reding <thierry.reding@gmail.com>
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
