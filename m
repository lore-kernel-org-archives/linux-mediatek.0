Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5561C3A5A7
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Dec 2022 16:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kpi/j5z0FbtVkkrb1PZtlydLmmXe24f0gXZLejwp68M=; b=pHbftL995zR7Rwrk/Lu6J7hdGr
	t8LRvyiy7GLuc/A0jVI5z+2QJ0kLzLyurLTkaADZNjcytHPMvS7ha1mfrrhbna5y2GE7MPAolXLdf
	rEvKKNdPVz2gbhwaHCDyffd1RQnQlvxdqyi3+2FAKXxUSFe5OlCEIJZ5K22rw1y9y0qXOQ5HFyWoc
	gHt94i/rScIKYeB8kEKTFu6HAOdG9bcD2u94dR/TyMBRF5SaprlEcnQrWzHnJuwk+p54V3oOiCqWY
	PmThPDbTNc8t0RnXuDyLLiOltvQ4TswiG2sILuuQ2QvtdGw5HsBkV0Oc/u2KkT8WkMR+NHn89Un6Z
	brhCFI1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3JoF-005FD6-O0; Thu, 08 Dec 2022 16:31:43 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3IrG-003Ud0-01
	for linux-mediatek@lists.infradead.org; Thu, 08 Dec 2022 15:30:50 +0000
Received: by mail-wr1-x435.google.com with SMTP id f18so2036271wrj.5
        for <linux-mediatek@lists.infradead.org>; Thu, 08 Dec 2022 07:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kpi/j5z0FbtVkkrb1PZtlydLmmXe24f0gXZLejwp68M=;
        b=Ncgde2xkEEF7N78o+7a6QgHZVmWNhGH7KfQHQ2MNmk0i5oNgbS5hlnHDCzFp4z6bfh
         fAY6Hyol+fpPuVPmv1yxv/yuGJU1zbqGDqamEnKbMQQInZ/7WdvkYQKzpBrGXSQizNRC
         xWq+c89MTmmczI/38+BAS74+wr1ixg7np7sIYG4YVrVT1GRuyd+BdwEcDICmzRmjAzCp
         cOG8JfkCNmSa3o+VlciZlqyY/SBZ+T1DDwf14esb4SIJlu4GnbW7ltb/9PAOk0mYkhQn
         0Xrbb/H5m7PefDqnK4tluq+h+tPd3LFwJnQjUoRY+z1bIwbPzRu8w7LXCeBMwMqqXxaZ
         IPrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kpi/j5z0FbtVkkrb1PZtlydLmmXe24f0gXZLejwp68M=;
        b=BSjEPGBTBvVYqbMBHOHBIZVOpdwS7UfRKhH3cPC3RiTzexIl6tNZfowLcSuasshdDQ
         aHq9PS9xbe336eCxj57pqLI+BQuQB4AAtZ/PdVO04V17TYXtAtMvuIVOqw/KXp6T9LZ4
         DPB9p7O19gFs2TvvIdiIjZ8jgs80Ns0JGOkVvojvDoRIsy33Ltvksb7HZ0WbQpgPAtu3
         vpUD816VsI4Y1pWDPGzt5ElRQ1x0h22rEOni2pC9JiLYVZZDOA+WEB7+zawNfIl7bGVC
         6eTbtSKFVfcdi0BTZJKOOEII9LmRblJMpVQyxWZp3M1Fy3QNaebUVgY/7NuALcc9py+m
         rIPA==
X-Gm-Message-State: ANoB5pnGetOGAfYcssB3WGNs180Ma1UxDYRLkaesiJbE4Hg83w0aLWBN
	2rbtw2LcfBb6Py/JDZVgfiIjvXiRTiWGNyTmJQHlcA==
X-Google-Smtp-Source: AA0mqf7JE15GmAE4aDoqbu1GztReLcb2ZiFPPX8H6zMGZmcao5P4v41JRR4wBSmp4dtXkDKIfxfkyw==
X-Received: by 2002:a5d:490d:0:b0:242:fa5:ce83 with SMTP id x13-20020a5d490d000000b002420fa5ce83mr1925959wrq.37.1670513443451;
        Thu, 08 Dec 2022 07:30:43 -0800 (PST)
Received: from predatorhelios.baylibre (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id h10-20020a5d504a000000b002366553eca7sm10673239wrt.83.2022.12.08.07.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 07:30:43 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	khilman@baylibre.com
Subject: [PATCH v4 1/7] dt-bindings: arm64: dts: mediatek: Add mt8365-evk board
Date: Thu,  8 Dec 2022 16:30:34 +0100
Message-Id: <20221208153041.3965378-2-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221208153041.3965378-1-bero@baylibre.com>
References: <20221208153041.3965378-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_073046_420806_BAC2AD58 
X-CRM114-Status: UNSURE (   7.81  )
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

Add bindings for the Mediatek mt8365-evk board.

Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 2275e5d93721b..ae12b1cab9fbd 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -244,6 +244,10 @@ properties:
           - enum:
               - mediatek,mt8183-pumpkin
           - const: mediatek,mt8183
+      - items:
+          - enum:
+              - mediatek,mt8365-evk
+          - const: mediatek,mt8365
       - items:
           - enum:
               - mediatek,mt8516-pumpkin
-- 
2.38.1


