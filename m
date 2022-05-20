Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CCA9C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 12:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GvTjBU6U6Z30BbyYyA7nQ2eG/mzAtRgRWZyKv/svg0A=; b=rJFmpSZgokjUUM
	RWa4kKKSnhP+M60DVk7jzCDjFv1mBuf/JE2sNtEnAWQ9pbjLI6yCoDDrAwnuyXHJmDE6KdjL5y6UD
	f5d8BJRdxSJC6JhqnxufCnbV8h82ZzYdEuUJ+lGHLrWR7cO8t04QsWBfESx42jhdVDkAKRPySFwZa
	d3CUqk55MA5UksU754SdrFKJ/fBdaUvWiYOEKA3hw94kMioQuVMeB/MBJisPe9vWRzWdTX98w9srs
	2uVQA9d2L55MSrx1CX+FaprfUFN50E3O66EorUkTSbOuXxaeKXvpGex5U5ketI7yPtmF6y7rpqgB1
	Wr9w1IyujsS/JAxVHgTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ns1xU-00COx1-Lf; Fri, 20 May 2022 12:42:20 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ns1w0-00CNzM-Kn; Fri, 20 May 2022 12:40:50 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 58CB71F462B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1653050445;
 bh=BoofczPYFKPT45RV7EHOivl9vCwrE/P2hpyIXUnhdmU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DeFRLtsJyZn3Ad8KZX20pAjUsCmKh9vxSx2ZT/ZIL0jqhSGN30Z7dNAz3Wr1Nlj6l
 JlFIo6U/0pZhbtC+/gaQ1hkHs/KQkrCH3fQp2iCo5VXrOUh9h+opdaIeYMyLsiPq6H
 rP4LYXkkNMP69XvMOSQhb7mvCF7xK5d/DyEzMQuzAo7THEKfDtBUhef1iI0AJO9W+6
 U2p6Pai+t0v7/ke89D3shTX/V2WYoa1bXS2ZwrNouYCcbp/+94CdmKA1wBkE1zLCWD
 dUqesVHsqGEy+srs41/dVeRR3fG8ohTCfAs4vgglPU+wPryaOCaXBqIgMQullwnnkO
 xkIK/pjn39g3Q==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: lee.jones@linaro.org
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 zhiyong.tao@mediatek.com, henryc.chen@mediatek.com,
 johnson.wang@mediatek.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 4/7] dt-bindings: mfd: Add compatible for MT6331 PMIC
Date: Fri, 20 May 2022 14:40:36 +0200
Message-Id: <20220520124039.228314-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220520124039.228314-1-angelogioacchino.delregno@collabora.com>
References: <20220520124039.228314-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_054048_846716_DA0B34BF 
X-CRM114-Status: UNSURE (   8.14  )
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

Add a compatible for the MT6331 PMIC MFD device.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/mfd/mt6397.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/mt6397.txt b/Documentation/devicetree/bindings/mfd/mt6397.txt
index 293db2a71ef2..d59063503b0d 100644
--- a/Documentation/devicetree/bindings/mfd/mt6397.txt
+++ b/Documentation/devicetree/bindings/mfd/mt6397.txt
@@ -20,6 +20,7 @@ This document describes the binding for MFD device and its sub module.
 Required properties:
 compatible:
 	"mediatek,mt6323" for PMIC MT6323
+	"mediatek,mt6331" for PMIC MT6331 and MT6332
 	"mediatek,mt6358" for PMIC MT6358 and MT6366
 	"mediatek,mt6359" for PMIC MT6359
 	"mediatek,mt6397" for PMIC MT6397
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
