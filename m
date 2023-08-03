Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13BD9C04A6A
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Aug 2023 07:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O80suLs8Qvsgc7R30L63r0azKWcMa3PZDlYRfpOpp9M=; b=BTtCB2qvaOXOGAw5OVspGs/wOy
	Ddofr17Fat+XfYluXd0fzkJnXKF9NPaSFRvmoefe7F+jEGjqVAfL1KKVYry7ugbI891UIGR4/Q5H6
	C/2rw483+Jp8/E6m9lB3ds3RV22iIWpOEy8Ak3nfdJuSiKxuXaHZoTeqyHlFPzexchhfTGpXMv2Ds
	imT5gsmbFA2ROCWxJV8+3f0QDUNUg4xqAqiF4oFY7WtAPw6M3f1TWBVPgWwVXAdGRngNcRPvbf8HL
	4bj2kLxi6dyvtsfk+JYozTsLLNOUOsza3Wi3s4E5HpPATv+rMmueJxsl225VcXXSgc8tdgdc/O3zd
	cAeDq4Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRSzC-006u7w-0Y;
	Thu, 03 Aug 2023 07:43:06 +0000
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRSz8-006u5D-2s
	for linux-mediatek@lists.infradead.org;
	Thu, 03 Aug 2023 07:43:04 +0000
Received: by mail-oo1-xc31.google.com with SMTP id 006d021491bc7-56cb1e602e7so411808eaf.1
        for <linux-mediatek@lists.infradead.org>; Thu, 03 Aug 2023 00:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1691048580; x=1691653380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O80suLs8Qvsgc7R30L63r0azKWcMa3PZDlYRfpOpp9M=;
        b=G50odMpAiZPUQ5zKrQkOTXNvwx71UmOrW5jQwfS90yBVF4M1S1MmNa91G9TeT3n6x9
         kcPygwXC5w7+KoeaijZIPd62cmcxCJBeeJ4uc68B4fPzdMdTG58FRERDnHX3inxJbaWI
         bKxOMGW/At9tyeEGMXhL/vivf8DwgG9a/sh5M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691048580; x=1691653380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O80suLs8Qvsgc7R30L63r0azKWcMa3PZDlYRfpOpp9M=;
        b=iyXiSOqKxkSOuCIIJUFKAIO95BddO8daHU6+uUAoHvZBLlMP/mFUnVN/YGMHIeTexL
         GtvvZUjUnqygyoP/H+5/bX/sndTEytgBSLjooG18bIKCp/CWqTEOND+nK+dhYYALVNob
         sEPf2BJNKWKh8R3Ad/KdEZfaWhUYabzz/hyL8JinP8TA/cLXKq4MaLF4c6BQRHjArOeP
         LI59049tK+6qdgTArXxDK7JZQhSWQoTG9WODzCm2RVdARlTbC+fMhJjaT2/kL+L9OjJW
         JG7I7rnl4I5iI/GZq4kNGxyXX+kYIDdk/8updcPnXEt9UkEzuvscyu47WoAY6W9wdQ7f
         +pmg==
X-Gm-Message-State: ABy/qLZ242YanbNJfbkk8rOSHpcv8FrKTzPoNUqJE5F00zmr1qu0v5n2
	8m6OoybR8D8KenFTiUEfMLbhTg==
X-Google-Smtp-Source: APBJJlGY9mduFao8XJQFVBFE9ih/bv4zzgVrQtxOi7vXuN0THQ/f3tRLfB/zLRer9OPXZDJahrPkbA==
X-Received: by 2002:a54:4d8b:0:b0:3a6:f876:148d with SMTP id y11-20020a544d8b000000b003a6f876148dmr18312483oix.8.1691048580528;
        Thu, 03 Aug 2023 00:43:00 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:6f3e:66ee:db46:473b])
        by smtp.gmail.com with ESMTPSA id l11-20020a17090a72cb00b00262d079720bsm2095753pjk.29.2023.08.03.00.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 00:43:00 -0700 (PDT)
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
Subject: [PATCH 1/9] dt-bindings: mfd: mt6397: Split out compatible for MediaTek MT6366 PMIC
Date: Thu,  3 Aug 2023 15:42:39 +0800
Message-ID: <20230803074249.3065586-2-wenst@chromium.org>
X-Mailer: git-send-email 2.41.0.585.gd2178a4bd4-goog
In-Reply-To: <20230803074249.3065586-1-wenst@chromium.org>
References: <20230803074249.3065586-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_004302_947224_1A106CCD 
X-CRM114-Status: GOOD (  12.49  )
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
VCAM* LDOs, but has additional VM18, VMDDR, and VSRAM_CORE LDOs.

Add a separate compatible for the MT6366 PMIC.

Fixes: 49be16305587 ("dt-bindings: mfd: Add compatible for the MediaTek MT6366 PMIC")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 Documentation/devicetree/bindings/mfd/mt6397.txt | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/mt6397.txt b/Documentation/devicetree/bindings/mfd/mt6397.txt
index 294693a8906c..d4778b0d5f5c 100644
--- a/Documentation/devicetree/bindings/mfd/mt6397.txt
+++ b/Documentation/devicetree/bindings/mfd/mt6397.txt
@@ -22,8 +22,9 @@ compatible:
 	"mediatek,mt6323" for PMIC MT6323
 	"mediatek,mt6331" for PMIC MT6331 and MT6332
 	"mediatek,mt6357" for PMIC MT6357
-	"mediatek,mt6358" for PMIC MT6358 and MT6366
+	"mediatek,mt6358" for PMIC MT6358
 	"mediatek,mt6359" for PMIC MT6359
+	"mediatek,mt6366" for PMIC MT6366
 	"mediatek,mt6397" for PMIC MT6397
 
 Optional subnodes:
@@ -41,6 +42,8 @@ Optional subnodes:
 	see ../regulator/mt6323-regulator.txt
 		- compatible: "mediatek,mt6358-regulator"
 	see ../regulator/mt6358-regulator.txt
+		- compatible: "mediatek,mt6366-regulator"
+	see ../regulator/mediatek,mt6366-regulator.yaml
 		- compatible: "mediatek,mt6397-regulator"
 	see ../regulator/mt6397-regulator.txt
 - codec
-- 
2.41.0.585.gd2178a4bd4-goog


