Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 101EFC433F5
	for <linux-mediatek@archiver.kernel.org>; Sat,  8 Oct 2022 16:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PxYWFX8wCCX5TIRd759yMnx9+aLLuhcGAlrlR4XDq00=; b=KN6DUFvOmedN8g
	2xT3O2BDJllLFqa74M+sDHSktPuVrkx43+Jx1TV9UsN3Tj/UGxlyw9vfVNmhqN5/99WDjr7hwTCIE
	hHI0ml5Pa186+7anMj052reJHs3aPVxVZAalIkHH2KTHMQjOYQLd14h5cCkMdmM9Dp6kT6835RPqS
	ElXcjMk5rjrj/wAd/3y51klpo1sDaxbVsVqhMPuH6CEWBk5y4wGP3pvU611QtrDCenuH7keqvZk/B
	p9tK7unGvK+1O2JYJWT6UUK+853SZGwWdCvZNGbZ19Oz0xljNkll3rXXOcOuV9nudB9PGx4bZolzB
	U8aYJBDHfWEgEw6bXw+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohD89-00Doid-Hs; Sat, 08 Oct 2022 16:56:53 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohD7q-00DoY5-L9; Sat, 08 Oct 2022 16:56:36 +0000
Received: from mxbox4.masterlogin.de (unknown [192.168.10.79])
	by mxout1.routing.net (Postfix) with ESMTP id EC62640111;
	Sat,  8 Oct 2022 16:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1665248193;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PxYWFX8wCCX5TIRd759yMnx9+aLLuhcGAlrlR4XDq00=;
	b=wlqox1OxxXXKN4y1VQOL06YBn/nBSQur9WYOzYOoOuTHQMMRA/SAcOgDgGU3/gdiVYrfEa
	JOWQqswxM5HZYH9YOrIYC103WToXXstWKZVf6lgyGymyPeFQEEGSowu3xQLInqMOQNydbg
	Anew5fK/zQUDrpUClkhRTcFMyfdOX/0=
Received: from frank-G5.. (fttx-pool-217.61.149.60.bambit.de [217.61.149.60])
	by mxbox4.masterlogin.de (Postfix) with ESMTPSA id 39A7680098;
	Sat,  8 Oct 2022 16:56:32 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH 1/2] dt-bindings: mmc: Add compatible for Mediatek MT7986
Date: Sat,  8 Oct 2022 18:56:26 +0200
Message-Id: <20221008165627.114782-2-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221008165627.114782-1-linux@fw-web.de>
References: <20221008165627.114782-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: f541c1fc-30e9-4eac-a260-8ab51a93bbef
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221008_095634_853764_E500D961 
X-CRM114-Status: UNSURE (   8.30  )
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
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, Wenbin Mei <wenbin.mei@mediatek.com>, Sam Shih <sam.shih@mediatek.com>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Chaotian Jing <chaotian.jing@mediatek.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Sam Shih <sam.shih@mediatek.com>

This commit adds dt-binding documentation of mmc for Mediatek MT7986 SoC
Platform.

Signed-off-by: Sam Shih <sam.shih@mediatek.com>
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
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


