Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F3E3C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Jan 2022 18:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=U/t54GSuCTML3VBiX2DBvUzNRBf6NJOZbSAVIBIhecg=; b=Y+xPtasA0KpGdJ
	EYMoSqHOhFK205l48iyt4F1ATHLow3zgsVNhWhmG1rlNQfvKZiuFof82l6zAWO6vGpi2Zm1USXe62
	ciL6BqhAVteT2QUG5W0YZXdb53tpBzCCLeHQq5XvWlWSZURu7AY3mVM1FTf1vMfQLBGUjupKS8SPZ
	N3UqDpOBl0hzWGpdK9UzazYZYVRMOAtIlLmX1YsP/BIblHGwlO8fEUgzxY0y0WeMQloDpub3hrJQ7
	NDLFc7BKIs1+IWfTou60+wTDMOVWlNZSCrAppWnb70XhKPyhjutsjEVftx0pjZGw6poRTXABEscRw
	dSvdwWRnoUlqqR5D0USg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5XT9-0011cH-Gr; Thu, 06 Jan 2022 18:26:35 +0000
Received: from mail-oi1-f173.google.com ([209.85.167.173])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5XSG-00115l-CS; Thu, 06 Jan 2022 18:25:41 +0000
Received: by mail-oi1-f173.google.com with SMTP id i9so4914414oih.4;
 Thu, 06 Jan 2022 10:25:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TNd0yX/eMqLTp7SQM3Mb8ivKu6Zp4HcxMj8tE/O94/0=;
 b=jVLZ3VhFgC3gcaO7OGGqvGo0b6tgKg0Jzxn9fZWXjp1v64hBhwA1KqL1WBs5IWYcJO
 kAhrfqwYu9uo/gfSrUzG1QAoSxWi9AVoWsM4KVoXRw9VxSR3bAbsSOICxV/TQyPcVkHj
 GStkr3SJcjEE5ZdHCt8MwwNWRQQDZcpTrMOl3DY/F7QUgiO9DkB1+SjlT9OS/MT17ygu
 spsy7OxdFMVZfsz+XPJYzDgLpTgJRpq2L9Jmk0yxqBSCd831YMCFr1PpSKCtR8s5uFXh
 Jx2OZtas1WB+mpNZ4AZ+eZ1t0EEQQ+U9ptnpEwn2ir3r09how9telBbrCi1MHsCB9WyX
 SFVw==
X-Gm-Message-State: AOAM5331rb8hyRhAj1wmHPYlg3wTKTBCyn4cK/u0TxNdCw4CBByrZlqL
 MkDQGcDLyGPfHveaBX8dJg==
X-Google-Smtp-Source: ABdhPJxma2BhQyJhOIcE9VJ4imQvWZ18uqwZtw6d3pT5EmqAKuK+QWuVszmPcgCB3vD+YwhKi4+WGw==
X-Received: by 2002:a05:6808:1914:: with SMTP id
 bf20mr7192851oib.7.1641493539303; 
 Thu, 06 Jan 2022 10:25:39 -0800 (PST)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.googlemail.com with ESMTPSA id r13sm484949oth.21.2022.01.06.10.25.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 10:25:38 -0800 (PST)
From: Rob Herring <robh@kernel.org>
To: Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Bayi Cheng <bayi.cheng@mediatek.com>, Chuanhong Guo <gch981213@gmail.com>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] spi: dt-bindings: mediatek,
 spi-mtk-nor: Fix example 'interrupts' property
Date: Thu,  6 Jan 2022 12:25:17 -0600
Message-Id: <20220106182518.1435497-9-robh@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220106_102540_481076_04FB792F 
X-CRM114-Status: UNSURE (   9.95  )
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

A phandle for 'interrupts' value is wrong and should be one or more numbers.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml          | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml b/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml
index 7393f30535df..da43a545614f 100644
--- a/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml
+++ b/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml
@@ -72,7 +72,7 @@ examples:
       nor_flash: spi@1100d000 {
         compatible = "mediatek,mt8173-nor";
         reg = <0 0x1100d000 0 0xe0>;
-        interrupts = <&spi_flash_irq>;
+        interrupts = <1>;
         clocks = <&pericfg CLK_PERI_SPI>, <&topckgen CLK_TOP_SPINFI_IFR_SEL>;
         clock-names = "spi", "sf";
         #address-cells = <1>;
@@ -84,4 +84,3 @@ examples:
         };
       };
     };
-
-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
