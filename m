Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 261FCC4707B
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Jan 2024 10:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qPI1X20P/Je0ba5yFdcffHFwmZ27vo/Hq5v/+iKRorM=; b=2LKn8ciOkZUz3DxQHLaL6kHXnF
	7NzmAnOaPrXIUM4gL2F08w2RpHugu7R6ZBnb/M0X+mj/ef3OMTkgD7uSiQbESVekikoIw/KJC0Xmy
	uyUhS0PAA0LdE6zRd883+Q8uP+je3IVHow3CdsSQm32QW3YuBZ15NBIpa8RUU3vBeZ6DAoTBKF8WN
	P7ojRru43CTE9OW/SeDQM+ZDGue1rCftW1WJp9wzEK9ghq25Qn39y31hkQ+tz/kVTUz7F809cBjIP
	eS/KQltSXNNA0NdJF9S2QB9ypDBMItKzRKVFyX4xYDY5hTAq7C51X3w9iX5yo4AdXWqCYj5s2fTUl
	JKVVQT6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNsTU-00H29p-2e;
	Thu, 11 Jan 2024 10:39:48 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNsTR-00H278-1g;
	Thu, 11 Jan 2024 10:39:46 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-50e766937ddso5986135e87.3;
        Thu, 11 Jan 2024 02:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704969577; x=1705574377; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qPI1X20P/Je0ba5yFdcffHFwmZ27vo/Hq5v/+iKRorM=;
        b=GUWyIyikDw9u3LVDnKgXyP1g4XAPoadRbObEApPRsGN9k9BC2MQ5hqhvMJ7VsVefU2
         3ZiR51/3CApKdFDCFtgXDYzFgUitzBlIlH/e3JN9tccMV3w4KmphJmsJAU+B4cH9cN3g
         qmU0+I0eWlETGTcPCaF8LwlxhU4VmqoK/St8e5UHZ4sjzSkLMX/+75d/9XXkCHxlNwK+
         eOAbKp22hfl+z3710XTpcIpmuFkY3t900LVKv2bpD0YHrkTnksEtBYYOPCo/zkUWdOth
         sLkLXo0LHSAZpbeLolUzKDlRh9jQLIy39zOHxpm00ZZzpeR0wI0YwMsq2xoVrI97HDKR
         JuJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704969577; x=1705574377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qPI1X20P/Je0ba5yFdcffHFwmZ27vo/Hq5v/+iKRorM=;
        b=aN+QajHsq0btUWSUHG0wRUjgwCFcTjVfbjHH9q1yX8EG/0QHeVnwhOfuP9xvA1hfHn
         iACtcoRehJ7LkQrtJ+VoxjzwGnSIeBqpFtc2gnlEaHR9q8S3LSBuT6WS19ARle2hUf8p
         mtetmXZVYprMd8x35q8rnjTu8ZymLmAgR1zYBraIO9sE+g1zN4huk1B0Da+MIQGNaQ0o
         SSsCDW3ITgyKDfnnpnjmXLO9AJQiwfaHS7eIUeQc41vTwFPvR/+vWUXGSV3AB11s2sqp
         wOBJ8FZDBwDoV7xh3t+RFj9gGvPPlBaddDOBlIMbJY4aHojL5Htmg83S81ndNrbw0o25
         115w==
X-Gm-Message-State: AOJu0Yz3kv8jgUeJfTNB5CiodilaaecGLQxefWLPS4dQ+eHFhmglAw5e
	nI6y3Ll4Di1kWpSqQc1gtnI=
X-Google-Smtp-Source: AGHT+IEpoHyDf1gqLg9M/jmdtKfdJe1FslovTRkFcPaMSTdBqVE/TypY2qP1lbz07KRoJPguDTflnA==
X-Received: by 2002:a05:6512:31d2:b0:50e:7ade:d394 with SMTP id j18-20020a05651231d200b0050e7aded394mr636997lfe.0.1704969577147;
        Thu, 11 Jan 2024 02:39:37 -0800 (PST)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id d14-20020a170906c20e00b00a298e2f6b3csm407179ejz.213.2024.01.11.02.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 02:39:36 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Daniel Golle <daniel@makrotopia.org>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	jason-ch chen <Jason-ch.Chen@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	soc@kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH V2 1/2] dt-bindings: arm64: mediatek: Add MT7981B and Xiaomi AX3000T
Date: Thu, 11 Jan 2024 11:39:27 +0100
Message-Id: <20240111103928.721-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240111103928.721-1-zajec5@gmail.com>
References: <20240111103928.721-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_023945_560045_99FCF82E 
X-CRM114-Status: UNSURE (   9.96  )
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

From: Rafał Miłecki <rafal@milecki.pl>

MT7981B (AKA Filogic 820) is MediaTek's dual-core ARM Cortex-A53 SoC.
One of market devices using this SoC is Xiaomi AX3000T.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 92dbfb862757..12cf02b30967 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -82,6 +82,10 @@ properties:
           - enum:
               - mediatek,mt7629-rfb
           - const: mediatek,mt7629
+      - items:
+          - enum:
+              - xiaomi,ax3000t
+          - const: mediatek,mt7981b
       - items:
           - enum:
               - bananapi,bpi-r3
-- 
2.35.3


