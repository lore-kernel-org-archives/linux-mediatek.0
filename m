Return-Path: <SRS0=aDjs=G5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74A90C433E9
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jan 2021 13:26:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FFC9206F9
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jan 2021 13:26:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0FFC9206F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vQiRbpEUGo6B4iO7g7sG0rYeP3vayH0gLmR6d8ALkis=; b=QRMAyqr9pO3lYoJGqHX6qaUuH
	46F0hHnYyRJyHPgNlh/79q2eVOT5xrypUIGphIhbcmssdHgHE/B5kD4MmphrWbozbw4uuBziT7ns0
	DvHICkseiziGqUkdwdLp8yCUhsazLlGsqafZGOwCy+zJyZfpAk/F5MAkDBchwzgvfzF+PrG2guuz0
	og5PcfCkpFgsxDgsEcAHmov0EeMh/xqVCwxRNRYQoAANVDKeLYvXa2yXWD8Pc8Gm9PpDqaiAeUXox
	tmSGObnlhPuVrUw5q86fRsT1KiAhTmALOPwkshgvAq92/2LitH/IiAfxHdGKs8aWnr2pvQkAbWn/2
	8+EbOL8cA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4OMT-00086v-EV; Tue, 26 Jan 2021 13:26:25 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4OMO-00083w-P8
 for linux-mediatek@lists.infradead.org; Tue, 26 Jan 2021 13:26:22 +0000
Received: by mail-ed1-x52e.google.com with SMTP id bx12so19700133edb.8
 for <linux-mediatek@lists.infradead.org>; Tue, 26 Jan 2021 05:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jJsyBSQ5fnIh7z+EGO1ct3NYyuJeKMfKI26SOZHy/5M=;
 b=nreZNHlarXxqqf5v1K41FArfFksX47QMYvpuQazuFPHcwCsFArVTbduVnLIzt9WudS
 TV8fBmKsTd6KRZXO+6PmPol6JoQevANIt/52yoKVyl7u7SOoOLr1JaKVIIBURin13/OS
 ozXZaN2EPwkbo5YSiSjLBn81LbdbKH14+6EUwaxblzZXRq5+WCCvCJmFjTFManR/E0Ml
 zFr3Tk1CYCjXMJELN7gy4dBmw/5tuQTNDQGrds//v6ZcmvXvGYwQmcW2Uwizfp5yJ08b
 LpFFLzJbO0gbmSnkj8OzClOly8qROT5daNyeuDJWHIXgEGW2Zk27TvJNn6Sist2aTXSR
 6/3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jJsyBSQ5fnIh7z+EGO1ct3NYyuJeKMfKI26SOZHy/5M=;
 b=fY/SlsFSjQ3nB8PxACPymCzdb+8kdqWdsp/DqMzourKdttcr3T5zgBN5KEK2TfrrhY
 XjkZyHdz1Tx3m0+hHyWEr8Jqw94sNEANzYXrtt9UTxcv7wNZugJBaTyWi3b94pb7l09z
 Ti8sBF1xQ2a7GLkA13sFSwhgSwX0Kye5beNY2iehJRpQfH5wZK+vGMOaIIwkegEFaEyL
 Unbc/Ows3PzopxtAcjlBN/VJwQOxe4Mud5t7F05j8uL1lCPiiKqaDCuMFAqt6l6Cy7Lw
 56gzl1AgzaU1ZgA4Y25yh3wPGAQYUvzSlDRuREKgYhcqqNi+zLsgG4Nw4Fr2e7galj53
 0r0A==
X-Gm-Message-State: AOAM532CQTq1IQdYkARDEusMsxLGK6ww9M/mUwGMX5fgxzRWyFMB+X+z
 6ivzNwhjJqrNEV+kY0WXXS7xRA==
X-Google-Smtp-Source: ABdhPJxbhLHk4eGRreEqF4cTHMfjlD/b2feroKVc/aXltYt5dPKG1lCH+uD6Eh2WG04mPRzB26UreQ==
X-Received: by 2002:a05:6402:438d:: with SMTP id
 o13mr4500539edc.135.1611667577953; 
 Tue, 26 Jan 2021 05:26:17 -0800 (PST)
Received: from localhost.localdomain ([2a02:2450:102f:d6a:65c9:91eb:731f:f2c8])
 by smtp.gmail.com with ESMTPSA id dh14sm12236010edb.11.2021.01.26.05.26.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jan 2021 05:26:17 -0800 (PST)
From: Robert Foss <robert.foss@linaro.org>
To: linus.walleij@linaro.org, robh+dt@kernel.org, lars.povlsen@microchip.com,
 Steen.Hegelund@microchip.com, UNGLinuxDriver@microchip.com,
 lgirdwood@gmail.com, broonie@kernel.org, matthias.bgg@gmail.com,
 jiaxin.yu@mediatek.com, shane.chien@mediatek.com,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v1 2/2] dt-bindings: mediatek: mt8192: Fix dt_binding_check
 warning
Date: Tue, 26 Jan 2021 14:25:31 +0100
Message-Id: <20210126132531.2084711-2-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210126132531.2084711-1-robert.foss@linaro.org>
References: <20210126132531.2084711-1-robert.foss@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210126_082620_858707_8861714A 
X-CRM114-Status: GOOD (  11.65  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Robert Foss <robert.foss@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Silence indentation level warning reported by dt_binding_check in
order to reduce noise during routine checks.

$ make dt_binding_check
mt8192-mt6359-rt1015-rt5682.yaml:10:4: [warning] wrong indentation:
expected 2 but found 3 (indentation)

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 .../bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml b/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
index bf8c8ba25009..54650823b29a 100644
--- a/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
@@ -7,8 +7,8 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Mediatek MT8192 with MT6359, RT1015 and RT5682 ASoC sound card driver
 
 maintainers:
-   - Jiaxin Yu <jiaxin.yu@mediatek.com>
-   - Shane Chien <shane.chien@mediatek.com>
+  - Jiaxin Yu <jiaxin.yu@mediatek.com>
+  - Shane Chien <shane.chien@mediatek.com>
 
 description:
   This binding describes the MT8192 sound card.
-- 
2.27.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
