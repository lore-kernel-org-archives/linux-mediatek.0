Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93EDEC369CF
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Sep 2024 11:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QVeMj7wLnXufiIx19gdVV+26XJBDhZuDvTGjagZ/exM=; b=RdTzRgJcEm5vH2
	m1KQCcftP/fMwPNz3vaVOkfSjs3xpikTUMaK8aCz+bvDTJKWfH8iTq1P2AdzTI1gdhvhBGB9hah8M
	JGsVKgQNTcNfij9UtZf4Zy+ixxUircoDAYfOqk/yc0x5Dgg6CBYdofkRWgwTwWTpl5wcadGFkxN/m
	myGDe9pFVZz58I25jq/5fjfAm4vPusV74h02JQuACTCCmsYFZP/tCvUia0UxsF9zfPZUdvreleKIN
	aCggQr6iCbci/3UW4UpvU2S6+/moIZCjn429C6rJoYlG2fAgIyJFs96mg3tCAW0uaaI+GRpWgt/9t
	wergNeWW+2WiHgJcBf5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stPoC-00000004ovL-1F4d;
	Wed, 25 Sep 2024 11:03:48 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stPlu-00000004oLE-01mh
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Sep 2024 11:01:27 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-71979bf5e7aso4615830b3a.1
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Sep 2024 04:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727262085; x=1727866885; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QVeMj7wLnXufiIx19gdVV+26XJBDhZuDvTGjagZ/exM=;
        b=TSRRbIYl0QKSYQJCWT4pyj/FtriiibYz2+UCxdM8rNfrjJsueijegHip9+wyeW+YPD
         mggcumzJP7mfAi+9xceC+1xQevAMi4mzkk+eHFkyAbcz6+HVawG2PPk0S7qlt5dSQUKk
         3zak32G5t+R/FREb8Xgyu9TaWfezOPvG37prI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727262085; x=1727866885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QVeMj7wLnXufiIx19gdVV+26XJBDhZuDvTGjagZ/exM=;
        b=Mq06LE7WzGm5TqpEHn4mV1VeOoRzBI51wxXPzaAUoNINtnn9Duy4L4rp/Ye9O5JVQC
         hOYb7FrCItESKOn8OhS4bDCJEakmhBSovNhwHLAxsB0pi2vxjWGA+oEeSw/MhFwkw9GW
         kW9eQ0CeKrLViTtF03e2xkg118y3kRVwqbW+n0RZz7pxITHaZHeu1MMlS1mu6hKYYa65
         QwbLWpusj6mprjDf14in6dDGsbuWROh8McQi7WoPUc5jK0LVj4c3EwkHI+8IkUgytV63
         jKJ/+9zj6BmG6QkVwGYFggfUqQX+Z/6tD3HUWOJa4XD6oDf9XKPOYS8IW2ZRXwMIxnqv
         Adrg==
X-Forwarded-Encrypted: i=1; AJvYcCWOOmF2rceIYF6Arn24g2oZw/R852mNII2yaWZcevvHFhQ9bQT4vJTt1ig7cZoyFh0T3rcztED5qDngMvmalA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyhryZMv0GXJMAxfLQr9VDv/xTckZFQiJ9muV/XQiQ1TKZyx6f8
	ar/2b/EmGJsM/CMDRdAqbkmMl6zAq39MS0aXGtRqSVS+AZWmgWeR2XwTiR/+Hw==
X-Google-Smtp-Source: AGHT+IFvn40kXszElCdDiZEOckut6uDsZhbA1ymXKe+lan+5/nDemYiY5zux8PnoVFCzu4aMNSiAeQ==
X-Received: by 2002:a05:6a00:b81:b0:706:3329:5533 with SMTP id d2e1a72fcca58-71b0afa2c26mr3124717b3a.24.1727262084788;
        Wed, 25 Sep 2024 04:01:24 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:2b86:78b6:8ebc:e17a])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7e6b7c73085sm2570298a12.59.2024.09.25.04.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 04:01:24 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 1/6] dt-bindings: power: mediatek: Add another nested power-domain layer
Date: Wed, 25 Sep 2024 18:57:45 +0800
Message-ID: <20240925110044.3678055-2-fshao@chromium.org>
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
In-Reply-To: <20240925110044.3678055-1-fshao@chromium.org>
References: <20240925110044.3678055-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_040126_075718_0E12FC1B 
X-CRM114-Status: GOOD (  10.31  )
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
Cc: "Rob Herring \(Arm\)" <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Alexandre Mergnat <amergnat@baylibre.com>, Ulf Hansson <ulf.hansson@linaro.org>, linux-kernel@vger.kernel.org, Fabien Parent <fparent@baylibre.com>, devicetree@vger.kernel.org, MandyJH Liu <mandyjh.liu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The MT8188 SoC has a more in-depth power-domain tree, and the
CHECK_DTBS=y check could fail because the current MediaTek power
dt-binding is insufficient to cover its CAM_SUBA and CAM_SUBB
sub-domains.

Add one more nested power-domain layer to pass the check.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Fei Shao <fshao@chromium.org>
---

 .../devicetree/bindings/power/mediatek,power-controller.yaml  | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
index 8985e2df8a56..a7df4041b745 100644
--- a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
+++ b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
@@ -54,6 +54,10 @@ patternProperties:
             patternProperties:
               "^power-domain@[0-9a-f]+$":
                 $ref: "#/$defs/power-domain-node"
+                patternProperties:
+                  "^power-domain@[0-9a-f]+$":
+                    $ref: "#/$defs/power-domain-node"
+                    unevaluatedProperties: false
                 unevaluatedProperties: false
             unevaluatedProperties: false
         unevaluatedProperties: false
-- 
2.46.0.792.g87dc391469-goog


