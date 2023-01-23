Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2792CC05027
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Jan 2023 16:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i0xrDD3xcfCowjDtQONef23ZJknmqB0wlCixYluZ1Ys=; b=yS7OHpAEBfJPTWdPlcNwVr2uT3
	VrxPtih/W03Ko7o2x/OP/YtM+9W9494oBdge+E+flSYrqGhhVqL3CACkKOg4Cfc/dj8Ba0ZLnx9QK
	d9yaa4mT5jPXcv/BiImcArdtPeFFHo4KhyCzXsPwC0GV2nuvde6biHm4o43FiQPtp0SDAhTD09qs7
	3+xERGcvuCO/9OOLQEMNoGrC38/XiLRC/FHXRKVKg5610Me3vp+1I8FFhZD85HU+PI7e8AMtuKCqr
	Y7YCuVl6heVyLZ3/6DodWnMFoqjD/KLRu2aIWu/VjH1d5t0MeuckYRXwbq/3mTDBEkDhcPHGgpEDv
	dMSYQC+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJzzS-000fu9-7x; Mon, 23 Jan 2023 16:48:14 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJzqM-000byl-HU
	for linux-mediatek@lists.infradead.org; Mon, 23 Jan 2023 16:38:53 +0000
Received: by mail-ed1-x536.google.com with SMTP id w11so6261edv.0
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Jan 2023 08:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i0xrDD3xcfCowjDtQONef23ZJknmqB0wlCixYluZ1Ys=;
        b=oaNwH+5XMsUaiNgWPF1Xozyst4lLtwAKhefYSdsFRfIniE5Ysxs+EzM0IFFqp2iVjz
         GlVnAzXgzb5LIY2D0Z0cflIQ17g9BvkTyNQ3ZJs8ukS05lKySphB2t7KG2k2HPStC2wv
         3U37/HoUIL0bfq2GUy46VpOA7M7HsTEo1RMykJnjqS6bLOUZ0wrK0X9aBT1K5B6pNbBW
         lnhbQ4uB0RzBsU48esTxGSzGrcNRL0RiSRbjpTjjrf1uA47TfOfTySE08BH3C5apMl3T
         C/RIpXE7a5pjxhd1WoFKvQHuipgDpcl3YewCyZkFXgqZ5/nX3QGKMJtvMXZ5zIm2rlWT
         awIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i0xrDD3xcfCowjDtQONef23ZJknmqB0wlCixYluZ1Ys=;
        b=wMD2Pgy1e5ptvS/GdH1jMm9YKrYVbOIXvBE+X/+ZLmy3X4XboU8C6oSfCTojc1UWy8
         wtZNc73uTBjq6IWJgCeuvwe89Q84zeVX3Jn87g6nZo+PchD/WkSwQGybjdgIUbr2iNFd
         qHeoZzSYXTubLZnCwLZV1OUjGIwTH5ATARhpbspaeZudqdLW70/Vis4RhumYHMU2B36T
         c7QTmbnclfnvfsR9TskkwCoaKy2nLlXe48Wia6DLO8Mvt/BeOxtTXV5W8+EJEfyt7Osv
         3CWszJArUGLgIJYpR811OCibhNBO8nynwKhimvJ4x1JIiaV8MpTJErNr+hw3Pgrbvm90
         VgOg==
X-Gm-Message-State: AFqh2krv3884AFqgJ19nNbO2XSQ4iN+3xpfA9dxwxLu834oicrBRsj2N
	QBVBlZWDCI8jMl3FWSmRCz7b5ZrToSauyPoY
X-Google-Smtp-Source: AMrXdXvtlhTYRpcRpSv2FajCyFKah6jQMJf8lvOVuXdoEzYk1bbjlbdfDNwCy1YucoGj8rGb8pC/xQ==
X-Received: by 2002:a05:6402:f05:b0:49c:d9c3:ca74 with SMTP id i5-20020a0564020f0500b0049cd9c3ca74mr29108363eda.13.1674491926273;
        Mon, 23 Jan 2023 08:38:46 -0800 (PST)
Received: from c64.fritz.box ([81.221.122.240])
        by smtp.gmail.com with ESMTPSA id lb25-20020a170907785900b007c00323cc23sm22198562ejc.27.2023.01.23.08.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 08:38:45 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-serial@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	tglx@linutronix.de,
	maz@kernel.org,
	lee@kernel.org,
	linus.walleij@linaro.org,
	matthias.bgg@gmail.com,
	gregkh@linuxfoundation.org,
	daniel.lezcano@linaro.org,
	chunfeng.yun@mediatek.com,
	angelogioacchino.delregno@collabora.com,
	allen-kh.cheng@mediatek.com,
	nfraprado@collabora.com,
	andrew@lunn.ch,
	gtk3@inbox.ru,
	sean.wang@mediatek.com,
	zhiyong.tao@mediatek.com
Subject: [PATCH v8 8/9] dt-bindings: serial: mediatek,uart: add MT8365 SoC bindings
Date: Mon, 23 Jan 2023 17:38:32 +0100
Message-Id: <20230123163833.1007181-9-bero@baylibre.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230123163833.1007181-1-bero@baylibre.com>
References: <20230123163833.1007181-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_083850_661514_C376623D 
X-CRM114-Status: UNSURE (   7.53  )
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

Add binding description for mediatek,mt8365-uart

Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
---
 Documentation/devicetree/bindings/serial/mediatek,uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
index fe098d98af6ee..303d02ca4e1ba 100644
--- a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
+++ b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
@@ -45,6 +45,7 @@ properties:
               - mediatek,mt8188-uart
               - mediatek,mt8192-uart
               - mediatek,mt8195-uart
+              - mediatek,mt8365-uart
               - mediatek,mt8516-uart
           - const: mediatek,mt6577-uart
 
-- 
2.39.1


