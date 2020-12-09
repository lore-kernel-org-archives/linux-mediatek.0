Return-Path: <SRS0=7tkd=FN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C70B1C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Dec 2020 12:03:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4914923B6C
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Dec 2020 12:03:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4914923B6C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9Pxqz0IWSWFLSq6rN8pzMqFYVdmqp/CIt88K5SeGcGQ=; b=cbHgUG+TU32U1Ap7EcTEUTx5wS
	2oe0DAzFGPRnZcqg2VOmckJtX9JeOvk2ANHte9rcTXqN7VQe4cg4kP6UQdbVsJ5X/hw7ZFfqY1IDy
	c2tcLIywKZvMGQONayFu9rKmAdowJP8VkDRPx4NKFWK1PWEDAYWduesdRTo5ebOccFmiejmoJglsc
	q56Q8Ij9SPXLRY13/zPNtz6xV9ZezHWeNrV8p6mcL74gxkw5feMV054kpdzQaHiM16qJ2jc1tRzHC
	9F2KE/OnjAf2aFzRD03jE+if1I/ffNEKMyneFYAd7IIR30iUFqZSto31Z6hIBQdBuMdNNpSZBa64s
	RqvRZLsA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmyBv-0003cY-51; Wed, 09 Dec 2020 12:03:31 +0000
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmyBr-0003b0-TQ
 for linux-mediatek@lists.infradead.org; Wed, 09 Dec 2020 12:03:29 +0000
Received: by mail-ej1-x642.google.com with SMTP id ce23so1739423ejb.8
 for <linux-mediatek@lists.infradead.org>; Wed, 09 Dec 2020 04:03:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YgPOLZ0cXqann9wHWJGTtja1w+Jeu8r8r8uXUCZYKm4=;
 b=hZ2upUa3r7Gb5ZtyGDeoOvFsaXJFdH5Oq7uEsm+viOimuvfSwGP050A5c76vT9BDRH
 gDz3ATdS4jub5Tdh/3EaxWSCt5wsoum7GIo0Sq796fkstnSuGgAJscJkEVVwGO03OQM0
 ALgCi5uF50iYeZGeXXSkNtYsY+jkTkB6gmirp3rclmqefJahtesZ+0KqxlOQt7B66hpj
 x7nTBFP0v20WEriC4IscwzWFHi2wr3Rrj12Zz6ffLe6TJyjZuodt56D8qyn+bS5qyPT8
 XMyVW+mtTrQniy6VmUHZ7Vme7uxJIlZXTLn9trdNLkqPCMvnoYgau4TksvW5+0bXjj74
 lsTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YgPOLZ0cXqann9wHWJGTtja1w+Jeu8r8r8uXUCZYKm4=;
 b=nPwzaCJsmg2AyE/csKYLCxhlEkCH1jvapnNzMMXr6bxGZClIfNxY5zj9dlQ2//ZbH7
 58iqrDgmccG2foTl/iejZMq4XaSYORWwdrHl/VlfEpcRhv6d4s8ynC9l9n0FRVBEzCfJ
 dbldrq3dJVCBZtlSVmPR/1jCE6O256fdJfkg/DU3dDzFscX6IMZxrzZ4CeldmWkGC5IZ
 lc19ak1iZP0tSaBgSk1GGpUxBfYbAPWHo3jclmiL6kvKK/ABwv2yS14b9X9iRknAExQ+
 b9bCcBOKesU5dy3tmnd7D/egQSEh1UVT4a5lutcp6lz91/gIKMdbK9TVRJtZJcdiUMZU
 FIRw==
X-Gm-Message-State: AOAM5305b6crfyzpV0zav+SKkTD52mSwrWzG2oTkyyJFVSgocJWWnDCL
 95boNOjhKn9AN0d8tPqCoz5p2Q==
X-Google-Smtp-Source: ABdhPJzGFFxI90GB1VyHjbguUQ1b5/vjj2GWXp5X7Z2DX7SeMMR4nVLPUMgQsmiSkjCxP8XzYj0DJQ==
X-Received: by 2002:a17:906:1542:: with SMTP id
 c2mr1720748ejd.382.1607515405909; 
 Wed, 09 Dec 2020 04:03:25 -0800 (PST)
Received: from localhost.localdomain ([88.160.162.107])
 by smtp.gmail.com with ESMTPSA id c23sm1426548eds.88.2020.12.09.04.03.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 04:03:24 -0800 (PST)
From: Fabien Parent <fparent@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2 1/2] arm64: dts: mediatek: mt8183: add pwm node
Date: Wed,  9 Dec 2020 13:03:20 +0100
Message-Id: <20201209120322.137610-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_070327_994666_25295D70 
X-CRM114-Status: GOOD (  10.59  )
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
Cc: Fabien Parent <fparent@baylibre.com>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

MT8183 SoC has 4 PWMs. Add the pwm node in order to support them.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---

V2: rename pwm0 to pwm1 since disp-pwm has been merged in v5.11 as pwm0

 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 5b782a4769e7..a0004bd9f9c2 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -667,6 +667,20 @@ pwm0: pwm@1100e000 {
 			clock-names = "main", "mm";
 		};
 
+		pwm1: pwm@11006000 {
+			compatible = "mediatek,mt8183-pwm";
+			reg = <0 0x11006000 0 0x1000>;
+			#pwm-cells = <2>;
+			clocks = <&infracfg CLK_INFRA_PWM>,
+				 <&infracfg CLK_INFRA_PWM_HCLK>,
+				 <&infracfg CLK_INFRA_PWM1>,
+				 <&infracfg CLK_INFRA_PWM2>,
+				 <&infracfg CLK_INFRA_PWM3>,
+				 <&infracfg CLK_INFRA_PWM4>;
+			clock-names = "top", "main", "pwm1", "pwm2", "pwm3",
+				      "pwm4";
+		};
+
 		i2c3: i2c@1100f000 {
 			compatible = "mediatek,mt8183-i2c";
 			reg = <0 0x1100f000 0 0x1000>,
-- 
2.29.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
