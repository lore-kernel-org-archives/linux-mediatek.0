Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5E6EC433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Nov 2022 03:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X3nU7X0djX9jQ80iI8+t0kZ5Fy4kB3s5F+snjwXKwEE=; b=yQcT8+JTeV1GlWZfKAf5lzEpLC
	VEsUK/MK48t1mnw0uD2+7QO+AZXHAXGE+jZf1JjLsUEc4qbCr8LjBCFO9FNE3/sizv3xn1jGuqTqI
	9hJsnYnTI49rEYO6SX/k8WHEyMw5PvKy4en6u+poIi4sAqNE4T64bynWJXZXkZOLggpOIvqVA9qmZ
	ZAhZ3mDTuV+fcV6bO78VWSQHY4TbHaAPdT0e9FdmDIi0TGGm4Erv2CuoRDNM3kp5yjdWFwBWYTRq6
	tUqvD2PxoWQRdnVX6tSAQhx/L0ySzcLHVKz68+2Zc6MWG6to0rOszEkfesVKIXS/GVlOq4taCBtzq
	Utg8f2Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oumdO-007BcK-Dk; Tue, 15 Nov 2022 03:29:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oumdB-007BHK-J5
	for linux-mediatek@bombadil.infradead.org; Tue, 15 Nov 2022 03:29:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=X3nU7X0djX9jQ80iI8+t0kZ5Fy4kB3s5F+snjwXKwEE=; b=Lbsvv+mFTHDur+f4Q0TZCb7hFD
	qnXUhW/zA2NljsQMQUZDFz//6FqxMWXRmtIXor04177jJX0+1Z7xRidELb7tmWnRANyZA8cVdEIa0
	HtN/l6bV+Qrj2aBBxIh4GDTzUCYrMnCn1S2e+70b9QojEkeSOLNbV5AofYC2IFoaT/QC/1pm17WLR
	L0GkucBhahB3JM4+CYaRuSfaGR2pw+Hkzj5clyfnGjJ4nBcAf2YRKuIZEVBmcFRC25vDdrhnUv76K
	lR+hZTignbl1oWgQZWn/Ujmfu9ER6ayCe/9xBqALd0sCZHbNWLDbX9CDkIKoMV+WEGXle6q7SeWeN
	WHVr7ouw==;
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oum5y-000wvg-RH
	for linux-mediatek@lists.infradead.org; Tue, 15 Nov 2022 02:54:49 +0000
Received: by mail-ed1-x529.google.com with SMTP id i21so20029251edj.10
        for <linux-mediatek@lists.infradead.org>; Mon, 14 Nov 2022 18:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X3nU7X0djX9jQ80iI8+t0kZ5Fy4kB3s5F+snjwXKwEE=;
        b=qHw6yLdaXz/BrvdOtxs23rQqN6uoD9Yq57iWVm5qtsNwRyl0txxACn1YlsXr9XGR06
         X0/fXV7ooJLhtBLvSM9vlvjQz70IgAPiP/0OB1VajH1nuAHs49/uKU0sgovQglseTenS
         cekyB0G7jao5CsOa821xumiuslVIKSD42v79wdU6DODpP853aT4AHzZVUtVx0Ej2bJHV
         4Zq7TBRoXAIUXiPJadvqueUTT8uphzsjFZxUl9HcrUyAPwwJxbu8xIWq/6o3ZBcaS5gI
         7IqRN2ytMVjrpflB1xK/99Gncnx9qVl/WrqgWO5fksPIthHRzfoT484qu0KY8HfMpwkZ
         S+GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X3nU7X0djX9jQ80iI8+t0kZ5Fy4kB3s5F+snjwXKwEE=;
        b=Ms83HDXWgNyb9PWRugNmXnRlVEvnJNlpu50MIEA/PjDm0bPI4xjvgH6Xj0DJbegRAx
         Wm37iU5lzWYGiz64U3iAEfX6WH6aLMDq2ORwqtGn0MCBHxgQ+/QXdN7TSI5ZgLYlEmcu
         VJJD2jNxh/rrKzUjsmJeYy7Gi+tVISEraam/Rt6SDT6wVJKaXxysMVfiw+eni9R2vALS
         /fTBuO/15MOiG4J7UkP58PXdedmCk4UVIOtDzjsjj1kDFRHyAkfUoKlVJoAPhNRb7NsF
         Lzu3RP04c2nD5UuTappg5MveZuXnFctxbyGAcOyTmxGhKgnqGI0CWAxOFsDZKfTbI1ws
         zI7g==
X-Gm-Message-State: ANoB5pn0NutHqIw8CFb0gyaXKv7QXsY/dK7fkRi3+aV52k48aDR/LOGy
	t1K+VejdRG/o3cEjDHWDd/wBaNSuHM/VWGAu
X-Google-Smtp-Source: AA0mqf5fY+yhWzH/Ndk7iEot+4/kLLx7PrL8ExjCcw5CMfSMJthgD//79QTiyAVrO97/Z5Zvj++zfA==
X-Received: by 2002:aa7:cf07:0:b0:461:f1c6:1f22 with SMTP id a7-20020aa7cf07000000b00461f1c61f22mr13826229edy.95.1668480879681;
        Mon, 14 Nov 2022 18:54:39 -0800 (PST)
Received: from c64.fritz.box ([2a01:2a8:8108:8301:7643:bec8:f62b:b074])
        by smtp.gmail.com with ESMTPSA id l9-20020a1709063d2900b0073d9a0d0cbcsm4861177ejf.72.2022.11.14.18.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 18:54:39 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com
Subject: [PATCH v2 13/15] dt-bindings: irq: mtk, sysirq: add support for mt8365
Date: Tue, 15 Nov 2022 03:54:19 +0100
Message-Id: <20221115025421.59847-14-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221115025421.59847-1-bero@baylibre.com>
References: <20221107211001.257393-1-bero@baylibre.com>
 <20221115025421.59847-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221115_025443_805820_A26C5855 
X-CRM114-Status: UNSURE (   9.57  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add binding documentation of mediatek,sysirq for mt8365 SoC.

Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
---
 .../devicetree/bindings/interrupt-controller/mediatek,sysirq.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt b/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt
index 84ced3f4179b9..3ffc60184e445 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt
@@ -25,6 +25,7 @@ Required properties:
 	"mediatek,mt6577-sysirq": for MT6577
 	"mediatek,mt2712-sysirq", "mediatek,mt6577-sysirq": for MT2712
 	"mediatek,mt2701-sysirq", "mediatek,mt6577-sysirq": for MT2701
+	"mediatek,mt8365-sysirq", "mediatek,mt6577-sysirq": for MT8365
 - interrupt-controller : Identifies the node as an interrupt controller
 - #interrupt-cells : Use the same format as specified by GIC in arm,gic.txt.
 - reg: Physical base address of the intpol registers and length of memory
-- 
2.38.1


