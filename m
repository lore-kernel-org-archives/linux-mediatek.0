Return-Path: <SRS0=pvhC=NQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F08E3C4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Aug 2021 10:42:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1088610C7
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Aug 2021 10:42:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C1088610C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u+vVbIE5rjPIZOqbhLoVSOAV752lC9Kx2z8YF3eqHAM=; b=HfKlI7/e3WRdVI
	74I0bLX5E3VVEWY+eUwyHDdRlWWhWwOKTz/kerLLbBCSwpbWPf2QdlnHeA+NL1Z/mk9SJJs1xHQYW
	wW4QATIb7qWBxa/In8eFvrBPqq4qZ1MWKbJhZgBlJB1M4W/wzb4tXRXK6CNCHT5cXI4XTs15cbCe/
	YUaFbk2v4fz24YX2kNF5v8HixxAcqGw+w4btLPU+Jg06lsF/CF31jVwy9AR4+kV3P/q5xzzwuEosC
	6D6SZv2la1LQSptccLmAFuiB/p4kA+YTvzrxUhZnZp1oIa0GYS5iwgNu2+pIx4WF06COwEkZNa2gA
	WFSv9oE7NnaWwrLjX0cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIqLx-006abu-4Y; Wed, 25 Aug 2021 10:41:53 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIq7I-006Tog-70; Wed, 25 Aug 2021 10:26:46 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id B4DEC1F4370D
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: matthias.bgg@gmail.com, hsinyi@chromium.org,
 linux-mediatek@lists.infradead.org, jitao.shi@mediatek.com,
 eizan@chromium.org, drinkcat@chromium.org, chunkuang.hu@kernel.org,
 kernel@collabora.com, Rob Herring <robh@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 3/7] dt-bindings: display: mediatek: add dsi reset optional
 property
Date: Wed, 25 Aug 2021 12:26:28 +0200
Message-Id: <20210825122613.v3.3.Ifec72a83f224b62f24cfc967edfe78c5d276b2e3@changeid>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210825102632.601614-1-enric.balletbo@collabora.com>
References: <20210825102632.601614-1-enric.balletbo@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210825_032644_451874_0EA0E4FB 
X-CRM114-Status: GOOD (  10.67  )
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
index 8238a86686be..3209b700ded6 100644
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
