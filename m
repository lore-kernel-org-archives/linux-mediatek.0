Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 371C7C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jul 2022 12:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z13ENY+8S7e7mR5lKKViQxv3bJ9pD8bL59xMmRnI17k=; b=pZ1gwq3+15rBWTdcvedTRc9Z3x
	cmmZniXK/4IRIUJhibnDghf1oQNhZqELFUPnrC3jXU9rkItBuF2y3FUF5PkE3yG+sPpdrYw6HuxQC
	QbL9Uodxo6CQXh9Q910O1P7fPCnSrTdZDMO5CFpSG3FuaTZcPjbEUs9HKvWRF0pvSIReAXkH5uYdQ
	BE7nPUk+ddm5eqjTak/e/hXWkvN+Dr/op3AV07CT3Yx+82WSvKTicE7o+9qNNSDu3+QzH1+X/ox2E
	Oh6h37n+i3eKz/Q5JNsua62SWZWc6UklsFI1YHz4hoFzgKSktyEI9LGZURoVgPoNeDtlnRD9wh52j
	QdKXpiyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGK8i-00HA5T-Gs; Tue, 26 Jul 2022 12:58:20 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGK72-00H8fD-SF
	for linux-mediatek@lists.infradead.org; Tue, 26 Jul 2022 12:56:38 +0000
Received: by mail-wm1-x332.google.com with SMTP id v5so8695017wmj.0
        for <linux-mediatek@lists.infradead.org>; Tue, 26 Jul 2022 05:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:date:subject:mime-version:content-transfer-encoding:message-id
         :references:in-reply-to:cc;
        bh=Z13ENY+8S7e7mR5lKKViQxv3bJ9pD8bL59xMmRnI17k=;
        b=fTXqLeB+Ueyf/kQFYoQqCwqr9S5mAFaty7VxI+pA8+ddia5BvIAtZxhIdfLDcKEiD8
         uIQA6CQyneloEz3lUFwqsGWcHgZm98oX7fb+edSZ2K0EV1g3Qwz03Hj8HUI8/5nxt5uE
         isp1TfsivHl7QpCKGOWd4rQqmODsyyS4FpX78pdlcdg0iE+zZ9KmLHU72eY2xX+VdRUf
         zhsoSvqPy2NA41DMwk+j/nn6ukIwgmxr9YZf1KJWJRstRBKmeZArTQSB+yEIy30LGoni
         0cZuBdp4Cp2SYX1zl+NyNpzOwdOFMlwPRlZRjwBlWnYGXeKeu5oSxJJUt5JmJ+4Kbmfu
         HHKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:date:subject:mime-version
         :content-transfer-encoding:message-id:references:in-reply-to:cc;
        bh=Z13ENY+8S7e7mR5lKKViQxv3bJ9pD8bL59xMmRnI17k=;
        b=RlXA4FU9WC+caQr5rcn2khrMbnmCQ5yUIE6nAD6esd/jtRAXZw93BTf1K4w5tmjqUf
         ZOG2c/Y0sBobaEqs/f2grs5T2sqFu5VJRQXdvI/hzhXOVPZpSjQRvWGQs/cmgM8U2dzT
         cSo+/HNAnXOYEtUDxuRU98DUtC4Pz74oO+uO9KmPy+U/S0DnOE4OIJrJsfdgqnWLWHZ0
         rMdFCQu2VZdHJia1zfIkMLezHAJ65ouyzB5W+b7HUCJeuV+5K0RdrYG6k07wWdl3VMvK
         HfFxQSgZ/5J44phTA+ky2uK5+7k8lRQuUSBOgnuHvR9uU8P/wWBVdyQSsmgsCHVkByNZ
         I/4Q==
X-Gm-Message-State: AJIora9kKDV58uYrTcKqXv8L6I32W1sXMndBT6IbJrGbBjwDWmZJr1j7
	teqtnR7m4RWlAVd8Ae27b8/i2Q==
X-Google-Smtp-Source: AGRyM1vl+YcUxJuwnM9p6qUahJHbYsyHSqdIeYD+E93+OvEhN+WoRh0CsBISgrEp4sQye2RUf1gZNw==
X-Received: by 2002:a05:600c:1f08:b0:3a3:1b00:c201 with SMTP id bd8-20020a05600c1f0800b003a31b00c201mr12396445wmb.171.1658840195057;
        Tue, 26 Jul 2022 05:56:35 -0700 (PDT)
Received: from [192.168.2.253] ([82.66.159.240])
        by smtp.gmail.com with ESMTPSA id k1-20020adff5c1000000b0020fff0ea0a3sm14171549wrp.116.2022.07.26.05.56.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 05:56:34 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
Date: Tue, 26 Jul 2022 14:56:11 +0200
Subject: [PATCH v2 6/7] arm64: dts: mediatek: mt8183: add keyboard node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220720-mt8183-keypad-v2-6-6d42c357cb76@baylibre.com>
References: <20220720-mt8183-keypad-v2-0-6d42c357cb76@baylibre.com>
In-Reply-To: <20220720-mt8183-keypad-v2-0-6d42c357cb76@baylibre.com>
Cc: linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Fabien Parent <fparent@baylibre.com>, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, Fabien Parent <parent.f@gmail.com>
X-Mailer: b4 0.10.0-dev-78725
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_055636_967120_57E13F30 
X-CRM114-Status: UNSURE (   5.99  )
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

From: Fabien Parent <fparent@baylibre.com>

MT8183 has an on-SoC keyboard controller commonly used for volume
up/down buttons.

List it in the SoC dts so that boards can enable/use it.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 9d32871973a2..9d8fdebaabe3 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -943,6 +943,15 @@ pwrap: pwrap@1000d000 {
 			clock-names = "spi", "wrap";
 		};
 
+		keyboard: keyboard@10010000 {
+			compatible = "mediatek,mt6779-keypad";
+			reg = <0 0x10010000 0 0x1000>;
+			interrupts = <GIC_SPI 186 IRQ_TYPE_EDGE_FALLING>;
+			clocks = <&clk26m>;
+			clock-names = "kpd";
+			status = "disabled";
+		};
+
 		scp: scp@10500000 {
 			compatible = "mediatek,mt8183-scp";
 			reg = <0 0x10500000 0 0x80000>,

-- 
b4 0.10.0-dev-78725

