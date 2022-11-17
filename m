Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ED9BC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Nov 2022 21:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=psBkHMqowoOrMmAFezeNjkHyhvSdQLEEQY2n96pydj4=; b=jKIS8r731W20TcPWsuiFOhqJSA
	glSrW58XDvIxKxuvVLTI3VqmNXOpVsjMopEVWdmx7XrhleNG2hRUo8oToEAZ/hfaHyvbyqddRtLOX
	KND7qajBQ75cw0Zxcr7SZReKVq1XcLdPDDaITGjFGmdoZoIdk+AsYkc+U0D0ItSOypNvfqbfKmIQw
	4ouktVFCuvbyrnTlFMtflBiow9EgAK4REYHmzPYHU6LmEqyTv2K0XLoY8O9Ps2PQKtJEiTUGS67B+
	qukubft6Tg6e2QHzYqLheWkE74fb1jyK0T8YDC1YzRLy6+FWx+NYpq3Z2PgbghHP40XP74RFue5T2
	dcKTjufA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovm3p-00HUHt-TO; Thu, 17 Nov 2022 21:04:37 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovm3N-00HU7f-TB
	for linux-mediatek@lists.infradead.org; Thu, 17 Nov 2022 21:04:12 +0000
Received: by mail-ej1-x632.google.com with SMTP id ft34so8134420ejc.12
        for <linux-mediatek@lists.infradead.org>; Thu, 17 Nov 2022 13:04:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=psBkHMqowoOrMmAFezeNjkHyhvSdQLEEQY2n96pydj4=;
        b=lC07iQH1jl7tfyC4uuwpxN67tYK9v3Yjp9BvXxCSdX6Kr0gmCbNPBdwmbJH6C3IBqb
         soFQhNTCP7/AliDZ5iSeq0RwdGF+EzRCjT1LpsnXm7t/TYRvEi9oxspeX2RvrnzjoI3q
         kEguI2EWVejcIuEo6SqvkZl27KYYNVc5zDhOjp6G6X4eWHO/Py63/bOIiMBOknnmRlTV
         8mQyuQ8AYKr2AN9DyT+F47KSk7ZPwz0WzSX+N6zLumlfhW7hxpwmXXEq4NHGzDce30In
         huAYYvKHB2gD2iq5gA9YryORcTIFpgxRadwCS7AJ5rG0mQLo9GGet5JFVsSOCr8hCbb1
         IKQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=psBkHMqowoOrMmAFezeNjkHyhvSdQLEEQY2n96pydj4=;
        b=OLeguiozv+76RRo3xkoZ/YopdNL8xkaV49wPdietQSd141j9B9lKWNU7xd8Hi35/Nr
         cNHcBdMI9cGZ1zkbmrW+fhRmLJqJqPfLmNmvIjTIYbgmr8Had7dCSK69gl5lGh/+td27
         Lqg3IhQuUgAjAhnPbIi6G3SpaAirAh9Nea0sC2Albnpa02WwkG2rw/oilXWBuhepjvXa
         V5kiMkPAsXYZ66YdtmmfIPDAer9ubNnaB1wKzYfTLbbZl+jYk3JjuL9wYhCpbpk4NPVz
         8QnDqJuKCdjNKNmBNZrqAikZs+69jRquNgkf3QtCUezwqPftEYYDCiJK3McWl16YI7KH
         4F/A==
X-Gm-Message-State: ANoB5pkvFH+l+pVZt1Mw0ODMH09bhTXTCsHlW/jfaBdmSMtgDL0mU0lK
	D1Uk6pmclKIaNHGtfZiaXU4xOJz1RB4PL9Rz
X-Google-Smtp-Source: AA0mqf61l4SIM8McX8K8sLWdW8glXhfskZ3bRupcaz7MKTOz5I2y9yCTpxnMADlL4hRsjV1FKMhlfQ==
X-Received: by 2002:a17:906:5251:b0:791:9801:e48a with SMTP id y17-20020a170906525100b007919801e48amr3466134ejm.738.1668719048412;
        Thu, 17 Nov 2022 13:04:08 -0800 (PST)
Received: from c64.fritz.box ([2a01:2a8:8108:8301:7643:bec8:f62b:b074])
        by smtp.gmail.com with ESMTPSA id p15-20020aa7cc8f000000b00461c6e8453dsm970807edt.23.2022.11.17.13.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 13:04:08 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	angelogiocchino.delregno@collabora.com
Subject: [PATCH v3 5/7] dt-bindings: usb: mediatek,mtu3: add MT8365 SoC bindings
Date: Thu, 17 Nov 2022 22:03:54 +0100
Message-Id: <20221117210356.3178578-6-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221117210356.3178578-1-bero@baylibre.com>
References: <20221117210356.3178578-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_130409_959701_4065DD0A 
X-CRM114-Status: UNSURE (   8.70  )
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

Add binding documentation for the MT8365 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
---
 Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
index 80750b0f458a8..25934871a4d85 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
@@ -27,6 +27,7 @@ properties:
           - mediatek,mt8188-mtu3
           - mediatek,mt8192-mtu3
           - mediatek,mt8195-mtu3
+          - mediatek,mt8365-mtu3
       - const: mediatek,mtu3
 
   reg:
-- 
2.38.1


