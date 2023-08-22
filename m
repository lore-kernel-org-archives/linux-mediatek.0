Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E05B2EE49A3
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Aug 2023 08:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=scA3slj2GnANfQZ9WmrZNWN3UDRBxFFiMbyHn692ZM4=; b=oA1s6++LebXz2dlBlA6hA3O4Zu
	rKOlvzjpzRIuJppKJSh6cuYsp2zjpRNX/Wvq311cNbUIJUa4YoQH2FGOSYB8WtUgJVryBdCNTT7qY
	feXI3vmPFpzo/S/Gj58icnIDOSBPM0v0fAGf+q2P9RyRuGecPIF9AZ+kGKhffqDBrOmyN57uiYevc
	v6TJ+ZbzEP0h5QwVPMqZQRAqYgEKKCXgERm3ERWyHm9DrZgicw6v2JrEa5FrwK37Mc4Y4q8n1lt2t
	tY2FJoGt00DmsfxyrqkrneVTQFNVJySzL79dixFqQT8ridH9cXdBuKmbAUporPFp3ZysXkCmAZSob
	Q7E8DU3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYN1A-00FU7G-2U;
	Tue, 22 Aug 2023 08:45:40 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYN15-00FU2h-2n
	for linux-mediatek@lists.infradead.org;
	Tue, 22 Aug 2023 08:45:37 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-68a520dba33so1421169b3a.0
        for <linux-mediatek@lists.infradead.org>; Tue, 22 Aug 2023 01:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692693933; x=1693298733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=scA3slj2GnANfQZ9WmrZNWN3UDRBxFFiMbyHn692ZM4=;
        b=Y6BM3dWQ2i1ulThxW8v48ZRSijPKfGGDZU7YePxZx4AQcVIlA/ORIdCKMV08hkCpCY
         qPNYEzQkzeGYFKSMV8pGTxo2/wvqI8UxJHVruSp1Y+nVqJz8GWV514e3wRNI1sTiDPYK
         nUL7pKK3A3Qh1AOStKX69Lnb2vawQmrTGjUGY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692693933; x=1693298733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=scA3slj2GnANfQZ9WmrZNWN3UDRBxFFiMbyHn692ZM4=;
        b=Wt6VhO/T/0+PR38IDBR4pjqoGsp/3Kjzg4sl1IDEdK8g0I0EQ3iWPLyhMxhqWYgV+I
         1cW3tZx26FxGOhjItkLJ1lMMs8Xl3Cd5Xi0ictl5UvFXSJbiS3xUCSuN2K1h1zktA+w8
         UfTGjZHCqTVD5fZ4ML8qC2gmT513UTvJ9W6NrXHQ4Lmi/bfMKZpomz0fMcJ35JgXorS8
         vD3/1fuaxCKHrrb6Y3ozBbSemT7D7M03zex77mCbURnl6tkGhsFJLOmr9kDOZu54ExuK
         2f8myJLWwGqfMUABRhXQrQcmJnnDfgOSMeBgnK1P2Xc3Uv+w/57EoSW2pE7grnf0pJQ8
         MyeQ==
X-Gm-Message-State: AOJu0YytyUtD+Fj547ySBwd+KsrPGwt0WXj1HFkXCSbDTgUgqlG38T68
	brB34Hn0lGdfYgoCfMjIAblxEQ==
X-Google-Smtp-Source: AGHT+IHW6ePGH6SgC29qM4b5i2IL+bnaOrlXSniE0MdltskRkrxsbx0tRAxYxqvSf6DSgpjVj78adQ==
X-Received: by 2002:a05:6a00:1492:b0:68a:4312:e0d6 with SMTP id v18-20020a056a00149200b0068a4312e0d6mr7109893pfu.10.1692693932995;
        Tue, 22 Aug 2023 01:45:32 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:e619:3fa0:1a90:6bb0])
        by smtp.gmail.com with ESMTPSA id s26-20020aa78d5a000000b00666b012baedsm7304790pfe.158.2023.08.22.01.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Aug 2023 01:45:32 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mark Brown <broonie@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Zhiyong Tao <zhiyong.tao@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 01/11] dt-bindings: mfd: mt6397: Split out compatible for MediaTek MT6366 PMIC
Date: Tue, 22 Aug 2023 16:45:09 +0800
Message-ID: <20230822084520.564937-2-wenst@chromium.org>
X-Mailer: git-send-email 2.42.0.rc1.204.g551eb34607-goog
In-Reply-To: <20230822084520.564937-1-wenst@chromium.org>
References: <20230822084520.564937-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_014535_901928_7D347EF9 
X-CRM114-Status: GOOD (  14.06  )
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

The MT6366 PMIC is mostly, but not fully, compatible with MT6358. It has
a different set of regulators. Specifically, it lacks the camera related
VCAM* LDOs and VLDO28, but has additional VM18, VMDDR, and VSRAM_CORE LDOs.

The PMICs contain a chip ID register that can be used to detect which
exact model is preset, so it is possible to share a common base
compatible string.

Add a separate compatible for the MT6366 PMIC, with a fallback to the
MT6358 PMIC.

Fixes: 49be16305587 ("dt-bindings: mfd: Add compatible for the MediaTek MT6366 PMIC")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Dropped Conor's Reviewed-by tag as this patch is now completely different.

 Documentation/devicetree/bindings/mfd/mt6397.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/mt6397.txt b/Documentation/devicetree/bindings/mfd/mt6397.txt
index 294693a8906c..10540aa7afa1 100644
--- a/Documentation/devicetree/bindings/mfd/mt6397.txt
+++ b/Documentation/devicetree/bindings/mfd/mt6397.txt
@@ -22,8 +22,9 @@ compatible:
 	"mediatek,mt6323" for PMIC MT6323
 	"mediatek,mt6331" for PMIC MT6331 and MT6332
 	"mediatek,mt6357" for PMIC MT6357
-	"mediatek,mt6358" for PMIC MT6358 and MT6366
+	"mediatek,mt6358" for PMIC MT6358
 	"mediatek,mt6359" for PMIC MT6359
+	"mediatek,mt6366", "mediatek,mt6358" for PMIC MT6366
 	"mediatek,mt6397" for PMIC MT6397
 
 Optional subnodes:
@@ -40,6 +41,7 @@ Optional subnodes:
 		- compatible: "mediatek,mt6323-regulator"
 	see ../regulator/mt6323-regulator.txt
 		- compatible: "mediatek,mt6358-regulator"
+		- compatible: "mediatek,mt6366-regulator", "mediatek-mt6358-regulator"
 	see ../regulator/mt6358-regulator.txt
 		- compatible: "mediatek,mt6397-regulator"
 	see ../regulator/mt6397-regulator.txt
-- 
2.42.0.rc1.204.g551eb34607-goog


