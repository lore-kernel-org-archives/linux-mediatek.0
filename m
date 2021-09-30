Return-Path: <SRS0=rLIJ=OU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69C76C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Sep 2021 08:33:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 329A161139
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Sep 2021 08:33:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 329A161139
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IQKCvDhsk+dkNJD32Os3Wo7GMcgrA2hnzP+NbE+6DA0=; b=Yp6acwypwq/STw
	0mOaW8NeZdt4dH69ONMWxEZuRB8CMrkSTsaQlxxkgVuMMum1aJgdQmspABca4ofQ4pyuvJ6cZTmJP
	KgtHsn2V2sZAwo8B+mf9KuFaCGvtRbmZZ2YqvafCYHfJo6E4SrnOEjcZh9uJ3yZNcVdM9A7/ez9Tc
	rrMcurkQ1NpGWc9nPdK3NOc3T4pZJkDzEQwwJ0l9TJD9M44IX5x4+9txv/mlA1ZB6opQEvww6ID8q
	KVeEGmdK56w/qSdJO1pQz6XmmTQdhnBAB2/9QlS15zO0yzMPISOv+eua+GDWAwQyCSt/gGBhUOkL8
	lR0yy1LoCjqo7WcsLyxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVrV0-00DOUf-Ll; Thu, 30 Sep 2021 08:33:02 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVrU1-00DO23-8g; Thu, 30 Sep 2021 08:32:03 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 4ABF81F449F0
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org, eizan@chromium.org,
 kernel@collabora.com, drinkcat@chromium.org, jitao.shi@mediatek.com,
 chunkuang.hu@kernel.org, hsinyi@chromium.org, matthias.bgg@gmail.com,
 Rob Herring <robh@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 3/7] dt-bindings: display: mediatek: add dsi reset optional
 property
Date: Thu, 30 Sep 2021 10:31:46 +0200
Message-Id: <20210930103105.v4.3.Ifec72a83f224b62f24cfc967edfe78c5d276b2e3@changeid>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210930083150.3317003-1-enric.balletbo@collabora.com>
References: <20210930083150.3317003-1-enric.balletbo@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210930_013201_459136_B303A456 
X-CRM114-Status: GOOD (  10.48  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Update device tree binding documentation for the dsi to add the optional
property to reset the dsi controller.

Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Acked-by: Rob Herring <robh@kernel.org>
---

(no changes since v2)

Changes in v2:
- Added a new patch to describe the dsi reset optional property.

 .../devicetree/bindings/display/mediatek/mediatek,dsi.txt   | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
index d30428b9fb33..36b01458f45c 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
@@ -19,6 +19,11 @@ Required properties:
   Documentation/devicetree/bindings/graph.txt. This port should be connected
   to the input port of an attached DSI panel or DSI-to-eDP encoder chip.
 
+Optional properties:
+- resets: list of phandle + reset specifier pair, as described in [1].
+
+[1] Documentation/devicetree/bindings/reset/reset.txt
+
 MIPI TX Configuration Module
 ============================
 
@@ -45,6 +50,7 @@ dsi0: dsi@1401b000 {
 	clocks = <&mmsys MM_DSI0_ENGINE>, <&mmsys MM_DSI0_DIGITAL>,
 		 <&mipi_tx0>;
 	clock-names = "engine", "digital", "hs";
+	resets = <&mmsys MT8173_MMSYS_SW0_RST_B_DISP_DSI0>;
 	phys = <&mipi_tx0>;
 	phy-names = "dphy";
 
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
