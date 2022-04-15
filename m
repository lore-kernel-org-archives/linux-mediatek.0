Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02A57C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Apr 2022 16:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VJLl6Q9hjeGEH+le3JN+XJ+NdeWvS12si/rXHY4ieGw=; b=48vtlIJ4AM0Nkc
	MWl8Q3XrBhka9u2zFsZlNqAvFOWX65hY5Ol9hkajI4VaUUryzrGjybu0vi2sb/KsW1okK/62K3s2d
	au40uY+hyKD7ZUlozASNH+pCNYIjTCs+z5EE1P+PEC75QcyIB9WCOnQNrs8iYJdPdZ9q8Do3rmJms
	JHAXyzxa3aHMOuWTw/7Pe1zN2t1RzIAcy4TZIb6AuEZryrRS87o5c9KDyg6yIQWZ3UmI2ueS5/FNZ
	HHwbTa3DOX9ekx+MEoTEN1ztFrC11xVIP83dYPRfViZ+FE3cxi+QBOhEli7Yzs2RxQzwzqGzchTV7
	jVUJAQqxFbQ97VpjdZPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfOZH-00Aq4c-KC; Fri, 15 Apr 2022 16:13:07 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfO0Q-00AbUt-Gv
 for linux-mediatek@lists.infradead.org; Fri, 15 Apr 2022 15:37:08 +0000
Received: by mail-wm1-x32d.google.com with SMTP id
 n126-20020a1c2784000000b0038e8af3e788so5237746wmn.1
 for <linux-mediatek@lists.infradead.org>; Fri, 15 Apr 2022 08:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k5Hrv/6P14wuxEAoJwZ4UjPTdo8Z9vjBoCCIqwWWzR0=;
 b=KcwavP/bNwYUDWjOLWTRjKSPXsBlI7T5EpiuJmJHyK758VWcq/UQxaolWi2DTzsz9t
 kJuNEMoCZHya0SOybBjkjd6emwgywcjD49HjNWfdyZPD7Bd81Y+hnXD04fVhoPUBrk8Y
 fgT9MkofQkarujUGccZVT1ZoMCQdjGBvWUpmpZ6uDiFtXJQwNHdkpyzkLT1xIPpI/4yP
 SuZI10jpSceLhZ3RJXMHKZ6QYkcI/3Ta8+0hbgXXjc9+rqa5EVtgBDGn/iMYqpqLBQAv
 F8yHel57Vmpjzl7LYT368XTN3hQhvJTTXXKPyscFT7yD73vOZP+1J6QAOlVIaLx5LGAe
 p9/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k5Hrv/6P14wuxEAoJwZ4UjPTdo8Z9vjBoCCIqwWWzR0=;
 b=g6nGN7BZXoLn0kJyoEHHU0roVeSbNd+tkP1OcB7Q8Z4RW6fAZ7G7ddtZ5dEwrY5Vx6
 9wMdJT2KfzpL6v2mEKxtVe7L5C5PKP8LBNkkWEF25+oxU0aTr+Qpo3+U3w3qfkmjiadq
 SBBqk3g9y5XtfAjMjBFecCHRm3hwSZtaAsT1o5ycCh6eKdi/CXZraBN9s98iY+rQBc5w
 Ld3T89z9chWNAEoByhu77osyLlDhZs2m65EYuPkXO+c9616qZbcFHc9AeHqiicL6AQ+Z
 iPHvs4F4nRJMzEgJ+JvFLbtIqgaJm3vbovc7YjlfddL1hYJpjPMExLW2IbtypCqJdXN0
 MNiw==
X-Gm-Message-State: AOAM533TxvMxYkYayk+xUIMf92WgIDZThLm6NvLjGZalD72H2i8HKsIA
 ZchoI+O2uaE3pYZHBD+wPXD5pg==
X-Google-Smtp-Source: ABdhPJxP2hHLChu7w5jeTrumBfb7Vqd/IYiSc2LBN1TOeIrWhbLE73c5LQrfRoy450OfnBz2o7LoOg==
X-Received: by 2002:a1c:4c05:0:b0:38e:b736:350 with SMTP id
 z5-20020a1c4c05000000b0038eb7360350mr3878657wmf.65.1650037025270; 
 Fri, 15 Apr 2022 08:37:05 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
 by smtp.gmail.com with ESMTPSA id
 c24-20020a7bc018000000b0038a18068cf5sm8459292wmb.15.2022.04.15.08.37.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Apr 2022 08:37:04 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fabien Parent <fparent@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 7/7] arm64: dts: mediatek: mt6359: add node for PMIC keys
 support
Date: Fri, 15 Apr 2022 17:36:29 +0200
Message-Id: <20220415153629.1817202-8-fparent@baylibre.com>
X-Mailer: git-send-email 2.35.2
In-Reply-To: <20220415153629.1817202-1-fparent@baylibre.com>
References: <20220415153629.1817202-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220415_083706_654250_B3086E70 
X-CRM114-Status: UNSURE (   9.69  )
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

Add node for the MT6359 PMIC keyboard in mt6359.dtsi.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
Dependency on: 
https://patchwork.kernel.org/project/linux-mediatek/patch/1622011927-359-9-git-send-email-hsin-hsiung.wang@mediatek.com/

 arch/arm64/boot/dts/mediatek/mt6359.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6359.dtsi b/arch/arm64/boot/dts/mediatek/mt6359.dtsi
index 18c0d5325c22..dcafe1ff23ae 100644
--- a/arch/arm64/boot/dts/mediatek/mt6359.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6359.dtsi
@@ -3,6 +3,8 @@
  * Copyright (c) 2021 MediaTek Inc.
  */
 
+#include <dt-bindings/input/input.h>
+
 &pwrap {
 	pmic: pmic {
 		compatible = "mediatek,mt6359";
@@ -294,5 +296,18 @@ mt6359_vsram_others_sshub_ldo: ldo_vsram_others_sshub {
 		mt6359rtc: mt6359rtc {
 			compatible = "mediatek,mt6358-rtc";
 		};
+
+		mt6359keys: keyboard {
+			compatible = "mediatek,mt6359-keys";
+
+			key-0 {
+				linux,keycodes = <KEY_POWER>;
+				wakeup-source;
+			};
+
+			key-1 {
+				linux,keycodes = <KEY_HOME>;
+			};
+		};
 	};
 };
-- 
2.35.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
