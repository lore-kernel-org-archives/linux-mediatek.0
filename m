Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DF57C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Nov 2023 01:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lnUk2lN233lJF/YyaHvDp2l8ZWBM31IpiG9Lcizf72Y=; b=XRQkpAGzWI7ZMNTq+6wBJcUlnl
	GjYiSdS3l4ZA6GFmhXBSzfXJbrdp4VSR02AxoVn8zcNpPGyaOlUNDcG3+ZIZVodul+Y99MZZlxJ0L
	1eRS8PmdkDltkRFIpIkeDtj1fo+C5rUSAnbK6MnoxvNAI/eFWpvctahfRi4+R/kd1v+Sb64Vpe3u2
	EL5TX/X9QSXHEQE55mY9TLYigD/oPJvuQltue3skiIHNd1q632+QSL7aoSGuzP//6faiXebyhRs1O
	/vPwfJ0uwgrZ87H7KCmXo4qgpE5BM5xTSsiuOC+U8nCDPf3+UE6wG8BYKrY170qbBiyZTuS4pFY/6
	z3GP6nnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0XL1-002lGw-1T;
	Wed, 08 Nov 2023 01:26:35 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0XKz-002lG5-0u
	for linux-mediatek@lists.infradead.org;
	Wed, 08 Nov 2023 01:26:34 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6ba54c3ed97so6455482b3a.2
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Nov 2023 17:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1699406788; x=1700011588; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lnUk2lN233lJF/YyaHvDp2l8ZWBM31IpiG9Lcizf72Y=;
        b=dDTsYQSLDukAHx2gWsEUWFC77d3JZDWazFvZ75vLnlrFbIdJ6BKvF1Ek8ho2pddK0b
         lOTJBavqe0C+VRrDgO8QKt7ZLFIfyPmTbt0VUt5d8sQRw7IJ20vxJpKsUAsl896rMVCA
         uDF98tkM0woZKTzpU7CADXQkrtg6jzoAAj8ibqgFF+UvHkUBn+kJxQy/W11/QrKtSWLV
         98iiqcRSphixMzEPIs2c8T37GtTOzTuZC0L7kbZVbTeSndfHKJ+lQmL2OGeffwopQgAq
         YH9ldhBLmhlJHXyBSYH7Xy6ufyJWSYDpjNFc0nNz7S1tIrdi950kPGfwGtidzpnrst9p
         FbgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699406788; x=1700011588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lnUk2lN233lJF/YyaHvDp2l8ZWBM31IpiG9Lcizf72Y=;
        b=UGY2TSGIHQ1iPoIUM4b+dlYz5wP+WJ87I8wPkEggACh12i8DLyEidpWEFK+ZuV50En
         LFA95BkeGx9Zqd9qvwt4Kngphkd1p51/qTjzvjlCM7W7kkAxy9uqkVP9JAi2eHaR9Trw
         CrUGMXhqEZeKe8xFKgJ9af4k950oP32AgPYTF6rcI3tSXzOpMvnIcI3kgpWb08OkpFnc
         qGS89LjoAbApA+Wuseau4Pvkh56CYjWbRYHZ6m2WDQdrU074sdmCM7wSX3IrvQ/8Mpve
         XuM3TFEs/GTIwXZqM6YtauBBt8ITGN0+MxJool1+N6bJ7LS603REzMM7iLTBoVsVfBe5
         RKpw==
X-Gm-Message-State: AOJu0Yzxj1ylmPLWLnva/96ucHpP0yAeCuOk0Hbc8awk+LatjcUVtb3B
	qdMCCS4xwqxOzBws24CSWlK6KA==
X-Google-Smtp-Source: AGHT+IFFQb7pJ/h6ep5KR74sYF0C2Q/6gBWOFswvmQk8s345ZG7NvUPiQpV5jpBi+wvwviyxaMuI3g==
X-Received: by 2002:a05:6a00:b54:b0:6c0:4006:4195 with SMTP id p20-20020a056a000b5400b006c040064195mr437520pfo.0.1699406788557;
        Tue, 07 Nov 2023 17:26:28 -0800 (PST)
Received: from localhost.localdomain ([101.78.151.194])
        by smtp.gmail.com with ESMTPSA id h7-20020a62b407000000b0069323619f69sm7966778pfn.143.2023.11.07.17.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 17:26:28 -0800 (PST)
From: Rui Zhou <zhourui@huaqin.corp-partner.google.com>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	angelogioacchino.delregno@collabora.com,
	perex@perex.cz,
	allen-kh.cheng@mediatek.com,
	kuninori.morimoto.gx@renesas.com
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Rui Zhou <zhourui@huaqin.corp-partner.google.com>
Subject: [PATCH v2 1/3] ASoC: dt-bindings: mt8188-mt6359: add es8326 support
Date: Wed,  8 Nov 2023 09:26:15 +0800
Message-Id: <20231108012617.3973539-2-zhourui@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231108012617.3973539-1-zhourui@huaqin.corp-partner.google.com>
References: <20231108012617.3973539-1-zhourui@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_172633_320946_8614DE1B 
X-CRM114-Status: UNSURE (   8.02  )
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

Add compatible string "mediatek,mt8188-es8326" to support new board
with es8326 codec.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Rui Zhou <zhourui@huaqin.corp-partner.google.com>
---
 .../devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
index 4c8c95057ef7..f94ad0715e32 100644
--- a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
@@ -15,6 +15,7 @@ allOf:
 properties:
   compatible:
     enum:
+      - mediatek,mt8188-es8326
       - mediatek,mt8188-mt6359-evb
       - mediatek,mt8188-nau8825
       - mediatek,mt8188-rt5682s
-- 
2.25.1


