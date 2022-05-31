Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DE5FC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 May 2022 14:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CVb85HsaN/y8gKkSV87h1qg6qRC7aUo+wIcNWE4IKjg=; b=kMAsqSgtSz62nT
	TX7tmRVi2W60RcWDWiNMQJVcQwABpCskn1N0n6+cK8dxINEJpOJasSRlQ1ZmLf6e/yyqBWa97Gxui
	lkAMasoQCuzAozj32Wrbfbw+F9mxvk+CqdNkKCmjS6L8cqbWYaUMKxlQyaZrogiXdKtQ/NiBFGIs1
	ON2Wtuy04foDw3sl6m+PsMhMB6A0i10vDCunABDHeR9N3V+YqNinU1UVF7HAZHVrft+TCDvaosFGu
	3TI3ZR1X3XcqN22mxdT87RRjKzfyUGV4ir9IUi5XIpEXJzejpJ+QBbkD3sLVFoWkPuuEC59kFb4q7
	s2lvlszkepKqrH+uHlKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw33s-00BJJC-ET; Tue, 31 May 2022 14:41:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw33h-00BIzQ-Mj
	for linux-mediatek@bombadil.infradead.org; Tue, 31 May 2022 14:41:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=U4WzI4lbMxsj2AcBZqR5vJfiFGZXQzAZrwPqRI3jHz4=; b=pKXq8iHJUAy5ZPoXNVWgSXVrnL
	aqbk+qYDt1JQEMVc0xDwW4RBNmtQ6Qs0flu9kdOoolZ3mfJKaJ/uDZQ3plbVuuMA78sg22W7VvWdA
	U0Yi8jkf3n6wcRAK6hTiIDVrr3Ls/Hw+k6VP9UCvyj/yO1vvw6EBP/IsdVjk08PUoPCeSnDkPVDW8
	yr8weLEJwiTrHA3CNy5O+N6pF61VrDfcsCOgWLdkmb9LHQHgFTBBqDLWx0Y3jIQwWVQXWaoR2WWKE
	i3Z/bkLe1+nYq/lS7gIo8BhwTJk3lgDeYgM/8E2zGAIhFh6EMJqsg7/Tfz2y0W2uKyOVdr+GVkb3C
	rYhcYKUw==;
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw2Gp-003SeR-0I
	for linux-mediatek@lists.infradead.org; Tue, 31 May 2022 13:52:19 +0000
Received: by mail-wm1-x32f.google.com with SMTP id r123-20020a1c2b81000000b0039c1439c33cso1239082wmr.5
        for <linux-mediatek@lists.infradead.org>; Tue, 31 May 2022 06:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=U4WzI4lbMxsj2AcBZqR5vJfiFGZXQzAZrwPqRI3jHz4=;
        b=b2zDiF5YOiseW/nuXuuY1Fytkg1NjykULZ6Hq3k0ECX4k4blxfNvKM85svhajUrUv4
         NMas0MJxswcK+uegrqPPzB+9HpE3HDll6zuJdAy0cKDy5dVGjHGRK8oVHa8SK9OuZyq9
         ZklXo6kN4SPbHbg8jAVuW61GvMcabXOc68x6JuTtRtmt6IpQlp5Vsp9PTkVYp/6Zh+S2
         3m67s1U9KYXFLM/NUMcMHxW1UjHZLLpNbL7KpwiyWIMg6TafVndkF7il3GILAPgr/QVl
         c/zKokPzg1iagW/fjsvVLJVcdmIGNn/ZaikG9L7yUR/uBLIWUok6ifW4BBpNy8mlRid7
         HKPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=U4WzI4lbMxsj2AcBZqR5vJfiFGZXQzAZrwPqRI3jHz4=;
        b=4lzEa7BJUrpjlHZZ3kp6VjVKhnzGsWKJ6DrljRfK+B7MvXq6Wnt0z3EqHs+0SdGwPb
         GRPlxbaje8OeIpEuDNC47chjRci8m+r+T6/26W7U7CwfpchsfZ8eodRnV4ZMMgQOgB3G
         dl0JS/t0FscpYAkIvPGgUHyqQBnb50/GAzVPflvS9SqJyq1GtKkvlAJHYQN2fpvdIuNk
         gCSQKUGrMNOyDZUeeZfH9yMGHrSTyUp9TH99uPLCXAxSatyexQOLOXa7Nxd4eC3tXk8M
         gJ1ShFtA+T0KpfebspICQrfrPG+9VuE6RuNBOSztWvLp3eET4H86Cxnk6A37im5BEO6z
         mmDw==
X-Gm-Message-State: AOAM532VVTwf63e+RDHaNZE+SI4nVisy7SikNAfj54JJnmwlevxZyD3v
	faQ/EZv89pDGdaWsk43MS/Dynw==
X-Google-Smtp-Source: ABdhPJyi7nZ5n+1hvGyQP/JdQ+9YpIzvsYsMnZlfaurRInqkxVdBqpLhXF6CQGT2vWAFmxAa1ycrnA==
X-Received: by 2002:a05:600c:3c90:b0:39c:1f14:d2ba with SMTP id bg16-20020a05600c3c9000b0039c1f14d2bamr157154wmb.43.1654005049241;
        Tue, 31 May 2022 06:50:49 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
        by smtp.gmail.com with ESMTPSA id l11-20020a05600c1d0b00b00394351e35edsm2404806wms.26.2022.05.31.06.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 06:50:48 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	vkoul@kernel.org,
	qii.wang@mediatek.com,
	matthias.bgg@gmail.com,
	jic23@kernel.org,
	chaotian.jing@mediatek.com,
	ulf.hansson@linaro.org,
	srinivas.kandagatla@linaro.org,
	chunfeng.yun@mediatek.com,
	broonie@kernel.org,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	Lars-Peter Clausen <lars@metafoo.de>,
	Zhiyong Tao <zhiyong.tao@mediatek.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-iio@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-serial@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Fabien Parent <fparent@baylibre.com>
Subject: [PATCH 06/17] dt-bindings: iio: adc: mediatek: add MT8365 SoC bindings
Date: Tue, 31 May 2022 15:50:15 +0200
Message-Id: <20220531135026.238475-7-fparent@baylibre.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220531135026.238475-1-fparent@baylibre.com>
References: <20220531135026.238475-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_145052_521201_8729BDF8 
X-CRM114-Status: UNSURE (   8.55  )
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

Add binding for the ADC present in MT8365 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 .../devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml b/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml
index 65581ad4b816..364a23be73bc 100644
--- a/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml
@@ -37,6 +37,7 @@ properties:
               - mediatek,mt8186-auxadc
               - mediatek,mt8195-auxadc
               - mediatek,mt8516-auxadc
+              - mediatek,mt8365-auxadc
           - const: mediatek,mt8173-auxadc
 
   reg:
-- 
2.36.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
