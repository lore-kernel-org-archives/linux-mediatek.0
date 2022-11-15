Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 962E1C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Nov 2022 02:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nGhqsrWtoUF+r+GxLNoynNg4eDvQCpkc+w7aehIlpC4=; b=JGj9YMQIG/6vMBqYYXOhXG5fnE
	vpxxixZrvaV3lqsGptkgeQdaIAvjnEztTwlc1dF9W3ORX3rMIwZ+p2+vrkoRK3i5zavsdUMjUioyp
	bAZyPCECGrSnTkMWih/AXJBNlmQIsdH9CB56KemvkQhNvGNTlO3qf3plb4pFfYXHj+CTaECUP2cRi
	XEOYaFIYJ/Anji4K8Nd8d34k9hOp1Ymh5Jx1H5a+e9h2QQO8XwgZN7FOTLEqkbG6V5yArVWAlHtWF
	sy9CtJJD/246iMBFOi/Qz2exFPXEhClCE1npStObHehoYWNVmn8c4GWThT1500McuT0fMg3QRAjkH
	nCc4J5oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oum6D-006yUX-Cf; Tue, 15 Nov 2022 02:54:57 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oum5p-006yJB-3y
	for linux-mediatek@lists.infradead.org; Tue, 15 Nov 2022 02:54:36 +0000
Received: by mail-ej1-x633.google.com with SMTP id n12so32846305eja.11
        for <linux-mediatek@lists.infradead.org>; Mon, 14 Nov 2022 18:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nGhqsrWtoUF+r+GxLNoynNg4eDvQCpkc+w7aehIlpC4=;
        b=0fnevSKGjjGBJ3qbrdksjgiYMOJ3TZ9mwSy9dgBW8RpN0R1fMpj3d3LvtCpPo+dT/M
         TRKH398GUIeoh6cTSPkjGC8fNmj3ikK2PAJFq/aidDLRdxdkPzN45u3dqJPzjVFoeX1P
         Bw1uaV7V0z5IgFK6pTBKIskT9BVV4FffxU5LujTHYbDfOoMx+Gnl1/yymNFfKL6DOEnG
         ccTKP2HKw+YY34CJRizi4uWzX9C/OTot9znJNJzsexUWG5aPqVq6lvikeUQb30Bv1nUi
         G0yuCaHx6MRPnFC0i7t3bSj3+fuymxfpT/rTrIS1yQ39adSQFpUAgjCFP4B28T8AYmS5
         /hQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nGhqsrWtoUF+r+GxLNoynNg4eDvQCpkc+w7aehIlpC4=;
        b=z50ozeo9U+MPOG6DWnIogl7IGF7t4+mvWEJfcdLdvYw1eLEyp1+ts93wdB+FzCiYPN
         aQlfmQ+iBwmbG5lT82Er4mJHMklKSri/va86PCiFyQ2kJ+8tqDmNhcl06iwVvXbiXzXN
         9MxtzQMMLUTl5CRDQQPM4G2Gy0JfvM3XfP32caFYxKDHtpq0fyzKJfVG0/1Rqt1EW3CH
         jXCsevHkpiALI4nrDp0O82wVYYDT2IDCP1b8Ajw2bBSQDaZypmpxbatIK/ZJFeDpozU+
         /HpfWGj3x7+QE7S1zzHoyT6PYLiQbMHnDpxIxYjIYV6zDMBfOXFLK8zkYxuXB6rLui/O
         zF7Q==
X-Gm-Message-State: ANoB5pkT9l8NHnt7w0W0c0M2Goyy+3ZIa8iKDhzXZ31RoCewXJw2wBix
	XAJKwg94ZjRZTHljOQ/CUR7aBJVyxts2tlW9
X-Google-Smtp-Source: AA0mqf4KVfJZu9eu7sw3r5DjXqih8y43qnoBLcb0u+Dfac8Lwz6kDXTrdEyMBKtSP4hPXr0qif6+sg==
X-Received: by 2002:a17:907:2350:b0:78d:9c2f:bf78 with SMTP id we16-20020a170907235000b0078d9c2fbf78mr12175149ejb.594.1668480870745;
        Mon, 14 Nov 2022 18:54:30 -0800 (PST)
Received: from c64.fritz.box ([2a01:2a8:8108:8301:7643:bec8:f62b:b074])
        by smtp.gmail.com with ESMTPSA id l9-20020a1709063d2900b0073d9a0d0cbcsm4861177ejf.72.2022.11.14.18.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 18:54:30 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com
Subject: [PATCH v2 02/15] dt-bindings: watchdog: mtk-wdt: Add MT8365 SoC bindings
Date: Tue, 15 Nov 2022 03:54:08 +0100
Message-Id: <20221115025421.59847-3-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221115025421.59847-1-bero@baylibre.com>
References: <20221107211001.257393-1-bero@baylibre.com>
 <20221115025421.59847-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_185433_163183_0BE74CF2 
X-CRM114-Status: UNSURE (   8.89  )
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
---
 Documentation/devicetree/bindings/watchdog/mtk-wdt.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
index 762c62e428ef2..835af28b46de0 100644
--- a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
+++ b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
@@ -20,6 +20,7 @@ Required properties:
 	"mediatek,mt8516-wdt", "mediatek,mt6589-wdt": for MT8516
 	"mediatek,mt8192-wdt": for MT8192
 	"mediatek,mt8195-wdt", "mediatek,mt6589-wdt": for MT8195
+	"mediatek,mt8365-wdt", "mediatek,mt6589-wdt": for MT8365
 
 - reg : Specifies base physical address and size of the registers.
 
-- 
2.38.1


