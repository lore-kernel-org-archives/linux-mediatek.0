Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54F91C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 12:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ElaSeH4+IEF4SWJkn2o6rrUWa0aqXtRvIQdWhfoEQtw=; b=J1FTARd/42iBsD
	hijuQ+OspWhC99/ep43yFVvaqFuuY9PzIA7qFUjXcP/8LX4dlM+A0WXze9CwmQ9hbfssb/OKeJt+2
	7ADv2ucNsSU3BGOPK0UJX4geiO3zzZAhJZlhGZlG6SDCK/4mGjXBSjm/gfVtbmbtwnf6h7LKpmUjY
	RXCVB5eVsWOeEDGZUpXktWCvHfqN/2g+XOtbMl4QYW1WPnkl1TcVhul4gnULKANpb9lTHWegmCao3
	8LlrHoKSYkysPm8U7/MyEQRM3/CnvAd3hSffkJo2y1MH4Wlzt4cSfCHBDS8BvB6AGFezTyPywoo+p
	7NUwG9UFbBw6Z3N1bZAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ns1yH-00CPdw-Cq; Fri, 20 May 2022 12:43:09 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ns1w2-00CO11-3v; Fri, 20 May 2022 12:40:52 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id BCAE21F462BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1653050447;
 bh=L5qU1nQ2bI4UYhJq6gU4Byb4OsjwVhaJ+WdCE8eB27c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TL5S2cNOJL2dDtgaRf7qSDsTCdcJnljZCSi0GZfDAa4ANsrs/v6qYiU4irLpErJ36
 CWhdXWKu5nFGXMfH+Z8Hf+0pXiPAIzm/DHHolEJiOOka7fv2e1MfCfSn/77asP04B1
 OcF4MPyV8Q6vV3HlGb2apU2S2dLQgN/FZL0dhaOuqeD4rUIU/HRj7kSr5YnHvFM5GS
 WSZ07rbQlaKdCOa0CIPMZ5Km5ekeHC+hvUjgvJH7VBTRyMqdJ/Pqj9s2qMSnHzi7AT
 lVvqd80XhD0lpGC20wgUarP7DTeU72pe6j5y/DDKn7AJtgErSldS5yU5/QKexuyofk
 Vak+JSF/SAQvA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: lee.jones@linaro.org
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 zhiyong.tao@mediatek.com, henryc.chen@mediatek.com,
 johnson.wang@mediatek.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 6/7] dt-bindings: mediatek: pwrap: Add a compatible for MT6795
 Helio X10
Date: Fri, 20 May 2022 14:40:38 +0200
Message-Id: <20220520124039.228314-7-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220520124039.228314-1-angelogioacchino.delregno@collabora.com>
References: <20220520124039.228314-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_054050_448324_54712A10 
X-CRM114-Status: UNSURE (   7.80  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add a compatible for the MT6765 Helio X10 SoC's PMIC Wrapper.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/soc/mediatek/pwrap.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/mediatek/pwrap.txt b/Documentation/devicetree/bindings/soc/mediatek/pwrap.txt
index 0581dbda4828..b53ebebc44bf 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/pwrap.txt
+++ b/Documentation/devicetree/bindings/soc/mediatek/pwrap.txt
@@ -21,6 +21,7 @@ Required properties in pwrap device node.
 	"mediatek,mt2701-pwrap" for MT2701/7623 SoCs
 	"mediatek,mt6765-pwrap" for MT6765 SoCs
 	"mediatek,mt6779-pwrap" for MT6779 SoCs
+	"mediatek,mt6795-pwrap" for MT6795 SoCs
 	"mediatek,mt6797-pwrap" for MT6797 SoCs
 	"mediatek,mt6873-pwrap" for MT6873/8192 SoCs
 	"mediatek,mt7622-pwrap" for MT7622 SoCs
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
