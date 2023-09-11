Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11F21EE57DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Sep 2023 18:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wy1qjxrLlq/EwS2P0KEQlfuBQ/GQXkJ4OLsU45kg4GE=; b=kLGRdA+9vKeXNs
	y5bqJRom+xc6MtVpdrS4XnR+PFM6ah+gPHYEulDwJ6hF5sYdBbecHnnKuv2117OEtJBETzIhT/3Vh
	hDXQZnW4+MR3vRiiIUnFJLZBHyhNTStjUXpyIvjHfYMPqkthbjCkrD4DavZjqjNd2yY4xtgPTmryL
	BUStwvHAKXrw/9M3RyKik+KrfbYs0MOz1Zv+ljHyDVyhDs5CK4l/Y2Ggq7welSmhssKJAeMuFY2js
	hRpjAYjwY6PgmlCLpPxjnBUp4S6aoIpG0uE9BF45J6tuQ0SY1p4x9uKBo3VOn77gcR5Yh0Qs4bH6A
	45FSrKqw9XokIWdnf67A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfljh-0018BV-2r;
	Mon, 11 Sep 2023 18:34:13 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfljd-00189X-2v;
	Mon, 11 Sep 2023 18:34:11 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout2.routing.net (Postfix) with ESMTP id E89BC5FD70;
	Mon, 11 Sep 2023 18:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1694457244;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wy1qjxrLlq/EwS2P0KEQlfuBQ/GQXkJ4OLsU45kg4GE=;
	b=htU9FRzBmSZBePa04KXTk6T9/pAvWU3U8knLX67+Wa5pcHbuGEEpFjHkOBKOOm4p0Hj4qi
	AlPjdvZok9SkPIkHfUpdxxXWNcfpstCLLTlIGLPihY0LK8qXfZoG/H6vCY2xraGtHTqLtX
	iS/gzJ62LvhiKrrjyTNW1R7K+PdoUdg=
Received: from frank-G5.. (fttx-pool-217.61.151.158.bambit.de [217.61.151.158])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 1513A360799;
	Mon, 11 Sep 2023 18:34:03 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [RFC v1 1/3] dt-bindings: thermal: mediatek: add mt7988 compatible
Date: Mon, 11 Sep 2023 20:33:52 +0200
Message-Id: <20230911183354.11487-2-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230911183354.11487-1-linux@fw-web.de>
References: <20230911183354.11487-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: f392470e-8bc2-481d-ae45-f63a02f7ae27
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_113410_080292_3808A330 
X-CRM114-Status: UNSURE (   8.21  )
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
Cc: devicetree@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org, Amit Kucheria <amitk@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Daniel Golle <daniel@makrotopia.org>, Matthias Brugger <matthias.bgg@gmail.com>, Zhang Rui <rui.zhang@intel.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Add compatible string for mt7988.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 .../devicetree/bindings/thermal/mediatek,lvts-thermal.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml b/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
index fe9ae4c425c0..49effe561963 100644
--- a/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
@@ -18,6 +18,7 @@ description: |
 properties:
   compatible:
     enum:
+      - mediatek,mt7988-lvts
       - mediatek,mt8192-lvts-ap
       - mediatek,mt8192-lvts-mcu
       - mediatek,mt8195-lvts-ap
-- 
2.34.1


