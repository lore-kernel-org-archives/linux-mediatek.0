Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 635FFC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 May 2022 15:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oXhLHRo1m6Y3t9az+e+mewwilTOFJO8bGu+og4cEkoc=; b=vhI/WsDNYz6sat
	LyZ14szSmHXQh/dCjyGf98TA/ajECzHySnp9Dz5C5cDBvyQtxiUTmssrPyBGKXZgjBoggJBzNrrsX
	fNKho+LO9d7yEe0LL1tA7OPik4XDuTpV1z72K2QPVI1dvs4GJ6PJPKI9qGAfTorG63/TCzjH+TEjt
	fzfrEsXbl0NSHiKZPJdWYTPpw8yelyHUpMm2u5bVenLSvIpDKSYGe2q5KfqhfzIyCjJ7u2KiQTIrA
	WsRF60POgU3V5EpJ2YHXOqBorM6TbaS/4UKwzcX4bgxtlOnPdcH4LexQGseI0OYUOHbWDv3NvDFHF
	dkNQiWmlhq2oC+17bvBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw3NZ-00BPUn-UC; Tue, 31 May 2022 15:01:53 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw2Gt-00BAAN-Gz
	for linux-mediatek@bombadil.infradead.org; Tue, 31 May 2022 13:50:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=uV55XMdMMXm/8YBcA+hYcRdN/Sy/q9ytKejpU0TX1a4=; b=mBZ4SInt7ZhT1m/kIMiSsykkwY
	sMI2hBjm90sBEx0+fCkip2oGcS2cB7T6kHh5eELY1jd+zdb8j4EmO/VuRz8mkFxrnUQndOkqzCFzD
	rZFRei65ZOwBiiFuK60KTz7buFK0d8lT1x9GQiJkGSOMfOZoAO0t8UpjmHAabFl9sSej7f8RtwG1B
	Avm5/L6y9xQWjlI9Gzu82bq6rr8EuL8pc7PASv3uqK7SpElecAwjkRBOf2aamAS5pWxY8cQw3jHs2
	/SvLoqeRvCWVS0k4stEUob11aF4jkE1Pc59+GcCVnAw7QGxRGBDs5/SuedlzXONSaRs6Cx2Q739Jq
	BbA1IRZg==;
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw2Gm-003Sdd-Ca
	for linux-mediatek@lists.infradead.org; Tue, 31 May 2022 13:50:51 +0000
Received: by mail-wr1-x434.google.com with SMTP id q7so7831745wrg.5
        for <linux-mediatek@lists.infradead.org>; Tue, 31 May 2022 06:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uV55XMdMMXm/8YBcA+hYcRdN/Sy/q9ytKejpU0TX1a4=;
        b=ydZ0fPc4/noMrgY/rszzHccN97Dm96R2jV+wrzbjo52SSgkXsjX2+EmRB8HsR5XPRy
         OVhxeu+TgJKJQmJ8ptz4ZS7KSw34lKfJHR/Oh1KxcrGhn/iCWSi/i3mbLTb8GgMD5vo4
         pr0FmYobyv9iFimX2s+CYCufeQZNf5yKkJ6M6nUmnNbMUbsURMc58EQ4rsJoD++egq8e
         XahX6EwRKB1QJ10UyGUAm9BQzptgx5KvmldEadtAjoKFX5UJv5AzOa20xrPpQB/aVtrR
         qLyOwm378YQrHUZMrdxvMFzDfZaVWFwOrMrwzLddQGIhcZrd9/nkoQi88OD6OFhcqZvG
         /tww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uV55XMdMMXm/8YBcA+hYcRdN/Sy/q9ytKejpU0TX1a4=;
        b=qWTR2BlAZgJHqvB0NsZg67HNGnK6phtqTvVwqiKtyaBq9lYXKEaoSrsrnGMzhR9GhR
         swzbx8D4QU5rNmWBtt45WePAx+z6+qAkhbrCdFhWYhmMm66NXR3m0Kar4/hTvXS9LeYa
         rQTGPYIuIcA7UY0ycGOMdUI76maT7FdLRaPH7FQ9WEEoCXHtBVyWJ44xqWVe9ABytSnE
         +y2/QFq5YXC+Pin5WziqoU20f0CrR+VojXOTVVliL000Ws/AKdWED2dM9BbAPgljuSF5
         CvBxUWlmW6gFib+WljXpF5A085SrcQhu+lTsX4OWRaagKxzUfB6KqRADJWoQW6bBdVtL
         KkrQ==
X-Gm-Message-State: AOAM5303lAsLLGY6twC7xKFSYY8QMnSSc25XGh9R6/JiPTeRAfDJSU6u
	Ek0mfwaED+xd9FpYoffBeld2Dg==
X-Google-Smtp-Source: ABdhPJxv8/PQNV+ezFLIiwnnP78JfWw4efymnBcIzCpOQsc85VBTswc/napM3IwCND/u1AFwGmeM9A==
X-Received: by 2002:a05:6000:1869:b0:20f:c1a4:111 with SMTP id d9-20020a056000186900b0020fc1a40111mr43818748wri.261.1654005045408;
        Tue, 31 May 2022 06:50:45 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
        by smtp.gmail.com with ESMTPSA id l11-20020a05600c1d0b00b00394351e35edsm2404806wms.26.2022.05.31.06.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 06:50:44 -0700 (PDT)
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
	Sean Wang <sean.wang@mediatek.com>
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
Subject: [PATCH 04/17] dt-bindings: arm: mediatek: Add binding for mt8365-evk board
Date: Tue, 31 May 2022 15:50:13 +0200
Message-Id: <20220531135026.238475-5-fparent@baylibre.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220531135026.238475-1-fparent@baylibre.com>
References: <20220531135026.238475-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_145049_201988_938BEED5 
X-CRM114-Status: UNSURE (   9.79  )
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

Add binding documentation for the MT8365-EVK board. The MT8365 EVK board
has the following IOs:
* DPI <-> HDMI bridge and HDMI connector.
* 2 audio jack
* 1 USB Type-A Host port
* 2 UART to USB port
* 1 battery connector
* 1 eMMC
* 1 SD card
* 2 camera connectors
* 1 M.2 slot for connectivity
* 1 DSI connector + touchscreen connector
* RPI compatible header
* 1 Ethernet port

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 4a2bd9759c47..a4b1288fa837 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -216,6 +216,10 @@ properties:
           - enum:
               - mediatek,mt8516-pumpkin
           - const: mediatek,mt8516
+      - items:
+          - enum:
+              - mediatek,mt8365-evk
+          - const: mediatek,mt8365
 
 additionalProperties: true
 
-- 
2.36.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
