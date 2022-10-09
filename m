Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA13AC433FE
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 Oct 2022 10:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QXyT5YJN3+YDge821n8shwosjTB85QzSw4HLxnCUVGs=; b=ftbJjHiFLMCiKk
	tqaPkNGArbb7TcVlOlhDffiV/SZKyq8zBNGSsGJGqrCk6wIM3erWIYUvMOkA3yIph66YzYRBXEz7O
	hpMwfThZ+8E+daRCoTmxojxWKm71I57+zK/tsYl+sDeVsiqh3Ulpsn6uw569RkHtTkLC1iBrL6UFs
	DM04Hreat1pB5DxOaWnCejM2hgMB1lJo/FHuehA8HTJ1hnABitWueNmMtifauOyGPkcxj3yHrJ8Ou
	Dr3+5i575z5FkBL20056wPRFuFQa8twhWx7juPScjVw/0V28WxQDsvFqCnHGndDqgo71HpF2azGcL
	ZNDwc+7T7AXfabCU7/oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohTMm-00FHWV-Fq; Sun, 09 Oct 2022 10:17:04 +0000
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohTMU-00FHTN-5W; Sun, 09 Oct 2022 10:16:47 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout4.routing.net (Postfix) with ESMTP id 7197D100760;
	Sun,  9 Oct 2022 10:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1665310600;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QXyT5YJN3+YDge821n8shwosjTB85QzSw4HLxnCUVGs=;
	b=U2yzhoSTMA3GyM1JtA1oLJCzofHTxU8KUHrqOAxhzydQlvcMEW/FsGUg+0c8QAYnb7tme8
	kY6LyVSZo9T3yvqo9Hf+hsAsynu4HYYHJW4fGaXnkCvwov1zfkSF09vfLaKQ4MQ5m2Af7e
	7P3BPuacBCysuRDxt+aAwoqm115uWdU=
Received: from frank-G5.. (fttx-pool-217.61.145.235.bambit.de [217.61.145.235])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id AF9C410072A;
	Sun,  9 Oct 2022 10:16:39 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH 1/2] dt-bindings: i2c: update bindings for mt7986 soc
Date: Sun,  9 Oct 2022 12:16:30 +0200
Message-Id: <20221009101631.82380-2-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221009101631.82380-1-linux@fw-web.de>
References: <20221009101631.82380-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 2c477d1d-b694-4206-b5ee-c08fdc400734
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221009_031646_416093_D81D652A 
X-CRM114-Status: UNSURE (   8.32  )
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Qii Wang <qii.wang@mediatek.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Add i2c compatible for MT7986 SOC.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
index 4e730fb7be56..421563bf576c 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
@@ -23,6 +23,7 @@ properties:
       - const: mediatek,mt6577-i2c
       - const: mediatek,mt6589-i2c
       - const: mediatek,mt7622-i2c
+      - const: mediatek,mt7986-i2c
       - const: mediatek,mt8168-i2c
       - const: mediatek,mt8173-i2c
       - const: mediatek,mt8183-i2c
-- 
2.34.1


