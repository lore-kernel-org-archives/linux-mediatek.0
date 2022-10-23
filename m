Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77CCDFA373D
	for <linux-mediatek@archiver.kernel.org>; Sun, 23 Oct 2022 09:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FdAcqBn0H2JqQ0pdVG6sZ5NnqpXSrOBaSZ51qSReaUY=; b=1/YomiI1Ma2VPv
	l0dhiAoRaM+r8vh+y3jTWwguKpblkfId2S6VIOkadjeZmeXqM39jaE+tzO91OyWLqCCQhRJUzuY/z
	f7J2J6PupNPAwE6e/nJ0g8mMhZt2CVluhUn/zjEOlCqFlvITvsNyg9kUUOs1rQhvOy6lxW8sdNvwa
	vcWQuUeMCZ3qAZ0i1aPYhLgxL0i+VNMfVYdgH1MO24sd5/zAcyqKvPTnEX8mEgjsvERBbdUdznwma
	v47C47GpGhkcJEpV1LjIB1Mmx3kPSx4Z9eYAo5wpfji88SsusbcqqUKMz4Urt8Pkst6Re5YXmmJtf
	ecAfRxQt8RJyv047diiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omX5F-00En3O-2w; Sun, 23 Oct 2022 09:15:53 +0000
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omX2j-00ElcB-9q; Sun, 23 Oct 2022 09:13:21 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout4.routing.net (Postfix) with ESMTP id DC2A910003A;
	Sun, 23 Oct 2022 09:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1666516390;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FdAcqBn0H2JqQ0pdVG6sZ5NnqpXSrOBaSZ51qSReaUY=;
	b=BD6mAlNjAC8SIECoC4GM6MgHhzLKTiR/Q5syyPQ9ektkWyP96tQ0WFR5aV1sPl9CZcwvAF
	X9Zx3DjRkbGH/c/d5WPlVv9qWAxIrS7JLJqEr314aA6JwwwakzjFCu3VmY82wz6dnetc5/
	9jQCCIu+FpFirlyQ3dFFZH6To71WhYs=
Received: from frank-G5.. (fttx-pool-80.245.79.234.bambit.de [80.245.79.234])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id 0F37310031F;
	Sun, 23 Oct 2022 09:13:09 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v3 1/7] dt-bindings: mmc: Add compatible for Mediatek MT7986
Date: Sun, 23 Oct 2022 11:12:41 +0200
Message-Id: <20221023091247.70586-2-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221023091247.70586-1-linux@fw-web.de>
References: <20221023091247.70586-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: e429a734-6886-45a0-be96-cf417621776e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221023_021317_504166_BB18F972 
X-CRM114-Status: UNSURE (   8.18  )
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
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, Wenbin Mei <wenbin.mei@mediatek.com>, Sam Shih <sam.shih@mediatek.com>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, Chaotian Jing <chaotian.jing@mediatek.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Sam Shih <sam.shih@mediatek.com>

This commit adds dt-binding documentation of mmc for Mediatek MT7986 SoC
Platform.

Signed-off-by: Sam Shih <sam.shih@mediatek.com>
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
index d8e1e2e9adf2..3cbf0208f1b4 100644
--- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
+++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
@@ -23,6 +23,7 @@ properties:
           - mediatek,mt6795-mmc
           - mediatek,mt7620-mmc
           - mediatek,mt7622-mmc
+          - mediatek,mt7986-mmc
           - mediatek,mt8135-mmc
           - mediatek,mt8173-mmc
           - mediatek,mt8183-mmc
-- 
2.34.1


