Return-Path: <SRS0=+2Q0=DW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D7DAC433E7
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Oct 2020 12:33:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07CAA22248
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Oct 2020 12:33:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ucKc6ygE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="phvyFg4x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07CAA22248
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=x453yZxdscBTmDnbON2i46sFqI2jasrY1jz5eOM6mLc=; b=ucKc6ygEXH1Yqpv+uWst8UQphY
	xc+hU7Hn0Z2WN6+OxvMeGwQClJuFkrdlc8r7VF7//ELe0dRz0PoAxnneMGCIprrmRCHbyN5u70QgD
	NIUuTmPCn17NBDvwJXGpYkGrX5JLvi0xpzRJI1zhSmeCfz7z1McWK270vzVrWOvjDu7nho9OW3Mdx
	qaKiGxmthcf3wu0lk2WGkOHkbAJTilJpI/SCKKAR8zMMve6w19IIxtDHikb+EoMh1jLIhIkghNR8F
	yQiFbeF5yH/I5ZDWpHy48L9ytuywdSQwTeSwTJcofa/NlfgqEGQTa0VIFV7a60GSDTAWSOvaQopM7
	Bf2JaGUA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kT2Rk-0006Xh-1i; Thu, 15 Oct 2020 12:33:28 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kT2Re-0006V9-7j
 for linux-mediatek@lists.infradead.org; Thu, 15 Oct 2020 12:33:23 +0000
Received: by mail-wm1-x343.google.com with SMTP id k18so3430758wmj.5
 for <linux-mediatek@lists.infradead.org>; Thu, 15 Oct 2020 05:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0gAf5fB5iQjUkbZE2PNnBqlTvtlb0W+hOlezFL2z0t0=;
 b=phvyFg4xjOGamHGSk/i05nAsDluAs0yWPaT2/eZkZDWz6fh0DSNW+CxmypNWD3fgle
 8AC8w0CuYMtRyP2XvJCqOl7LznkwXyw+cmbpYGi9Qvqk8v4qgD+YVngklOb1YPlZNUpY
 PUWRaFKto7ziGDDuVUXqr9Gw9rozNF27/AkXBF4b5bOmiDhfX6B8+YubTpadSuWCYwie
 5taGkWoqWKn2JjKsSHJby4S6ytLFCNrBGBbw946DYXamCF6ZEmR3PIZB5q+GCgpnYqgd
 xZCtA59kD753+zU0S0xYgVc8jfTVBYa3C4BjN1b3+U879tXdYkKFu/JEEAjFabYwHVHo
 Vfdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0gAf5fB5iQjUkbZE2PNnBqlTvtlb0W+hOlezFL2z0t0=;
 b=fQ0YjGIIg07iulr+oanPJ6/iRqxoXGFAyQ3Om+lxNpHojs4YkmO/+xbgE3V3/DkJ+J
 sKRp2fd8ITu4lQXT3UFW0OJdm9V/yVtltXHG16Bur2KClQGURAmUE0BZNZ1H56fgP894
 jVbSTXqxA+GceGKPVx5YqDdu+skSpwKRgpsZRAnPhn+5Q7M7y5LRGcW6JCY3IYgDQi2N
 wM1GwyN+ioH8ykyhLSNp+Txp20AdxS4D3At9JB8FU8tdOxQ4uutuqmv5tedmb0dc76tv
 DWGY+gIlj+iDBgGA0RX4r+pj7iZx1Zatu5EVHMIXLzEo6d71N4gOHo58cwpcSe0qD3X5
 GjIg==
X-Gm-Message-State: AOAM531tkUXiCTQYEfwJBOVAczP1ChzXeua9J9TzCA3JqWbd/xO2S8Cz
 vhxEqaGevmos1MssAZuX6G4SrA==
X-Google-Smtp-Source: ABdhPJwMWmhzac8KOGYrXil1jcjuEazEomj2N1xyRdOMuoCb7xSRa3SeIB2Z0+rBWSrgh8MElOQYdQ==
X-Received: by 2002:a05:600c:2905:: with SMTP id
 i5mr3815469wmd.9.1602765199464; 
 Thu, 15 Oct 2020 05:33:19 -0700 (PDT)
Received: from localhost.localdomain (129.163.185.81.rev.sfr.net.
 [81.185.163.129])
 by smtp.gmail.com with ESMTPSA id j7sm4017406wmc.7.2020.10.15.05.33.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2020 05:33:18 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dmaengine@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: dma: mtk-apdma: add bindings for MT8516 SOC
Date: Thu, 15 Oct 2020 14:33:14 +0200
Message-Id: <20201015123315.334919-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201015_083322_358099_C072E854 
X-CRM114-Status: GOOD (  10.83  )
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
Cc: matthias.bgg@gmail.com, Fabien Parent <fparent@baylibre.com>,
 vkoul@kernel.org, robh+dt@kernel.org, sean.wang@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add bindings to APDMA for MT8516 SoC. MT8516 is compatible with MT6577.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 Documentation/devicetree/bindings/dma/mtk-uart-apdma.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/dma/mtk-uart-apdma.txt b/Documentation/devicetree/bindings/dma/mtk-uart-apdma.txt
index 2117db0ce4f2..fef9c1eeb264 100644
--- a/Documentation/devicetree/bindings/dma/mtk-uart-apdma.txt
+++ b/Documentation/devicetree/bindings/dma/mtk-uart-apdma.txt
@@ -4,6 +4,7 @@ Required properties:
 - compatible should contain:
   * "mediatek,mt2712-uart-dma" for MT2712 compatible APDMA
   * "mediatek,mt6577-uart-dma" for MT6577 and all of the above
+  * "mediatek,mt8516-uart-dma", "mediatek,mt6577" for MT8516 SoC
 
 - reg: The base address of the APDMA register bank.
 
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
