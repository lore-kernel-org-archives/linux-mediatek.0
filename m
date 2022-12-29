Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CACFC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Dec 2022 14:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TXaEWxtn0uFZdcMKR1HVawy7OAcOEaMqyiThbbGx/JQ=; b=epi+yP7oOeSMAS
	bBtCR6tuTa1UrMvCgnBi8ShFwNCgSar0m3shV5mZp8CmeEOq489RE3jeM387Fg8aUfcwttZb1SxvS
	3ieu/mBYWfOQa41ZugobPeS09R1aWhSepzGoPiwvXnAgc4XHYduC6DHVKxPVtvMBlDvdtxc3wYobl
	kBxiCgK0Hogn9oYkdWlWc9xM+kZBR8RIlbRxuOftRJc+Zby9A7PDhLeLrhL+1sUoBVSoh5KQetbhT
	+7xPZnlmYOOSTJ/CrhBaMiq7pWLrNe1pLDv93hkrBc4EDqUQWI6fxFDNGaP8NKVdQyvK2gm+24+0h
	xXiM0Um2l69nOtZon3gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAuG3-00GiaM-Tr; Thu, 29 Dec 2022 14:51:47 +0000
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAuEw-00Gi4v-Vb; Thu, 29 Dec 2022 14:50:42 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout4.routing.net (Postfix) with ESMTP id A3A061009A7;
	Thu, 29 Dec 2022 14:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1672325432;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TXaEWxtn0uFZdcMKR1HVawy7OAcOEaMqyiThbbGx/JQ=;
	b=ghyZuLfGlQXpDY4STZ9VXry9Dik3TiluS94P6uiy2gaLDlbsjooHhEhy7RI/4QQvx1yg/O
	GkaXyGAzs+Kap/DwsP9vV5H0Ch9PYBGF0sxInUDDvOe1/PNQyGkrM4chiJ4tSuwK5FZ7Ij
	Nu2ua7NzH/iPjMuguaPSkeYmuWfzBMQ=
Received: from frank-G5.. (fttx-pool-80.245.77.213.bambit.de [80.245.77.213])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id 6C26A122725;
	Thu, 29 Dec 2022 14:50:32 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v8 1/5] dt-bindings: phy: mediatek,tphy: add support for mt7986
Date: Thu, 29 Dec 2022 15:50:19 +0100
Message-Id: <20221229145023.55713-2-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221229145023.55713-1-linux@fw-web.de>
References: <20221229145023.55713-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221229_065039_223678_5ACC35DB 
X-CRM114-Status: UNSURE (   7.42  )
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Add compatible string for mt7986.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 Documentation/devicetree/bindings/phy/mediatek,tphy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
index 5613cc5106e3..230a17f24966 100644
--- a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
+++ b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
@@ -79,6 +79,7 @@ properties:
           - enum:
               - mediatek,mt2712-tphy
               - mediatek,mt7629-tphy
+              - mediatek,mt7986-tphy
               - mediatek,mt8183-tphy
               - mediatek,mt8186-tphy
               - mediatek,mt8192-tphy
-- 
2.34.1


