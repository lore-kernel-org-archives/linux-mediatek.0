Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 219FCEE49BD
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Sep 2024 14:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gnJ313n4mu2c3Gv27Gu48uhKalN/G5CTdU7jzWSbSxk=; b=EOIZDlVylo8R0g
	GAKQIJXdNYE3NgdaD9fcp5pzQZ+XPBpqWSXCwgtBsXUrDfRP+6cAyJcAlWBd6A1A0Tdrc8UQqZh9V
	X8SOyi7c3+RnmXMC/aGQaQHxpAxw1hX33nwJDkEZhFNjeJrZB3+boU6EDfgY8w7oRD9BjgAk4tQx6
	mI2Z+mreiMQeTiCorucoqHM/bwN7pAiPsAYI+MvI5zAM+GTif5uHE1gC/71zMrfqakssrAlUrCEyY
	+DMB3EMLbbsFcf1K85mMr/0/MmuJFsvI6T6aAsXW1cy+EDeY84GWOvo7+OmSo9Jq1zM0d3FrxDS5P
	sU8f4ZFflKPzrrvq1qfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soOc9-00000009ztH-38bl;
	Wed, 11 Sep 2024 14:46:37 +0000
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soOR6-00000009w4h-2tSN
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Sep 2024 14:35:14 +0000
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-3e049185cfeso1273658b6e.1
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Sep 2024 07:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726065311; x=1726670111; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gnJ313n4mu2c3Gv27Gu48uhKalN/G5CTdU7jzWSbSxk=;
        b=EktvD5eGw2OeDp7VmfphePMcJFGAXmTU2eqTkttdZ1JoZvm5b52EjcaBXcok138DKp
         qm1OeniqK0PZz9zi+b7q5yRq4jn1xZw8lGKjMYdroKB4HjhW+/aHBCbICn9ehgpXD0kh
         82fq38jgmee0FrrY2dcIH4Q5YEmnDc77tbwac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726065311; x=1726670111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gnJ313n4mu2c3Gv27Gu48uhKalN/G5CTdU7jzWSbSxk=;
        b=g4qod3aFp4MyUU9S4eveYTanTyMbMtddX/DsCRXXNNEtTS7JS3j+lGACX5wctgDbTs
         MKac7aaqB6owCOAxxEevwQv1npp/xKwN7qQ48g2LtTrFAoc9Jd99gqkb0YEP2J8uq00W
         2zpQjnqjKYB5cAWmrzAC1CFNYi3yYIiL+1KqMxqOAvHySAVwbfaDELwYio2WkgMLsEva
         fkeWccHFh6WkcA+vP5tUVA1o/yLS4ZV0N5b9oZ/71SSso3BAdlvJqlUlw9MXTTSaSo28
         EgNzQ2bud1zQk1KI7f4/k/f8+58hQqUF8dfq1oflSf7CgI9M4aEcEhcMpj/8K+RCrVeh
         ZLYw==
X-Forwarded-Encrypted: i=1; AJvYcCWSOvvsAdQ+AfE3D6UohfbFLBZx8wB4mv31knB4CRz6GpORAwpS2KHUghhAJ4YF9pkWjgJE7Uy4EZvSHHZcUw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzvMdcJKvxuMNZJO2NOEwA2zM3jC2yJSNxpHuooib4JIiwgcqTx
	gpwW2q6gOwdo46weg2fsJU7v7HmrOFk0S2uW7epCRiO4uac3AMi2IWDbiWi/cSRuP0ZQdyGJ9+d
	6Sg==
X-Google-Smtp-Source: AGHT+IFMamFHGmhxPFHOGWER3aFhQ1jLAPCLcwDI6yIOXvYykC7XUTDUyt75MOdeg3LnVxx5oP82RA==
X-Received: by 2002:a05:6808:14c7:b0:3e0:3dd9:9053 with SMTP id 5614622812f47-3e03dd994bemr10549858b6e.11.1726065311408;
        Wed, 11 Sep 2024 07:35:11 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:102f:d738:6069:fd4b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db1fbb5901sm46620a12.24.2024.09.11.07.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 07:35:11 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v3 1/8] dt-bindings: spmi: spmi-mtk-pmif: Add compatible for MT8188
Date: Wed, 11 Sep 2024 22:33:54 +0800
Message-ID: <20240911143429.850071-2-fshao@chromium.org>
X-Mailer: git-send-email 2.46.0.598.g6f2099f65c-goog
In-Reply-To: <20240911143429.850071-1-fshao@chromium.org>
References: <20240911143429.850071-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_073512_804360_5C4E583B 
X-CRM114-Status: UNSURE (   9.60  )
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
Cc: "Rob Herring \(Arm\)" <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add compatible string for the SPMI block on MT8188 SoC, which is
compatible with the one used on MT8195.

Acked-by: Stephen Boyd <sboyd@kernel.org>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Fei Shao <fshao@chromium.org>
---

(no changes since v1)

 Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml b/Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml
index ac99883a3f29..7f0be0ac644a 100644
--- a/Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml
+++ b/Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml
@@ -25,6 +25,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt8186-spmi
+              - mediatek,mt8188-spmi
           - const: mediatek,mt8195-spmi
 
   reg:
-- 
2.46.0.598.g6f2099f65c-goog


