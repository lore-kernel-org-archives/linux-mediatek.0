Return-Path: <SRS0=+XBv=7F=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4207FC433E0
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 May 2020 20:16:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12A4620735
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 May 2020 20:16:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lgsF8Amx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="YqJ1UC6/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12A4620735
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fdkDWMqG1GqiA93QSqYOImHookPKqOsJBzFT5S7BRoo=; b=lgsF8AmxcQ9hnF
	wknMXzPyEP+n6LGJb3EV9g0SMXVOeywm3g0w5SEKEHu73FdHemfY8qzX1q9V/Bt08fJFjXoJC/FMa
	/2thZGeByC0G9mpEZvSNDMm5P1/Ud8aKYlbo8d7vdd/uFT3m04mUIG74DX2S7eeqo0GcG7tTdPeTY
	juDYjJegLdPQNd3uAyP1y64YMRQ4j+QJAEXuS4Wr9yOvmMn12Egoar8JnIyRzgMVFpzNXDwMkFoRl
	eCuoUcgpfPYxKALPgla/JbboNe6ntFknfJncDWhKQBXjNbyEQq582qdUvesfzfmgfMmpT6014XBO2
	KAtzuVKh8ittTL6C06gw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jcaYs-0001aG-RT; Sat, 23 May 2020 20:16:02 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jcaYh-0001Rk-EN; Sat, 23 May 2020 20:15:52 +0000
Received: from ziggy.de (unknown [213.195.113.243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 332B420735;
 Sat, 23 May 2020 20:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590264945;
 bh=6NVJkDskDeSVG7nACrgOiBNrXbEYpv5thIkjzs1fYpQ=;
 h=From:To:Cc:Subject:Date:From;
 b=YqJ1UC6/w724lYfsZMcCtX6NO+gGocMubK8pXx+Y7r0uYeXyR+3ErvxQlffNYL3pf
 VD+VpIpVPxmTiN2S8S1PUOCUjN3npLKQ1iIlvkW1BET+zmFVX10n3nYiqQZMfkuFXn
 M16XalZKAkz22ItTu9hAFLiRjAAAoINHcjlR/C3o=
From: matthias.bgg@kernel.org
To: sean.wang@mediatek.com,
	vkoul@kernel.org,
	robh+dt@kernel.org
Subject: [PATCH] dt-bindings: dma: uart: mtk: fix example
Date: Sat, 23 May 2020 22:15:30 +0200
Message-Id: <20200523201530.18225-1-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200523_131551_502767_4EF80C36 
X-CRM114-Status: UNSURE (   9.48  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, Matthias Brugger <mbrugger@suse.com>,
 linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Matthias Brugger <mbrugger@suse.com>

The binding example is missing the fallback compatible.
This is needed as the driver only matches against mt6577.

Signed-off-by: Matthias Brugger <mbrugger@suse.com>
---
 Documentation/devicetree/bindings/dma/mtk-uart-apdma.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/dma/mtk-uart-apdma.txt b/Documentation/devicetree/bindings/dma/mtk-uart-apdma.txt
index 5d6f98c43e3d..2117db0ce4f2 100644
--- a/Documentation/devicetree/bindings/dma/mtk-uart-apdma.txt
+++ b/Documentation/devicetree/bindings/dma/mtk-uart-apdma.txt
@@ -21,7 +21,8 @@ Required properties:
 Examples:
 
 	apdma: dma-controller@11000400 {
-		compatible = "mediatek,mt2712-uart-dma";
+		compatible = "mediatek,mt2712-uart-dma",
+			     "mediatek,mt6577-uart-dma";
 		reg = <0 0x11000400 0 0x80>,
 		      <0 0x11000480 0 0x80>,
 		      <0 0x11000500 0 0x80>,
-- 
2.26.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
