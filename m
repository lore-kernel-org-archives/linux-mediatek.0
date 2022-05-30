Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D687C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 May 2022 14:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fYDRLkkWaMAwMcRpG83vRSnxfwhDotWHJotu/JyKpx0=; b=BwVA5u7z0WEEpy
	E+FLYAujw6s3HLE7mUaTCmR0afw8DWchmGo/UOiA96mYRQv2pDA6nHe37kPoU+VZN9mUdXxZrnfTj
	EDv40gGez8iKrqWVTrBQjaKULoT9bKcPdxKt1neyHG7EcRSenIIYQEnZQLBeQA/xSToVS/p0Jbok4
	5iMvSVHGA01ShF8suGuXim5snajLglcYNCS0xSF4b3cD73LKBvXCfOpZxHP9AnsLgQsz+VO3QXsl9
	LW9FP33G6gqAwUcg4XBOprfv67bz+kNgSiPHL5aJy2GY9qqisSnRmXhcLml7bEK9AtZTPH7Akz3OM
	GbFn3klj5Ji9OY0KlskQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvgVK-007GvO-IZ; Mon, 30 May 2022 14:36:22 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvfs1-006xBz-6Y
	for linux-mediatek@lists.infradead.org; Mon, 30 May 2022 13:55:49 +0000
Received: by mail-wr1-x432.google.com with SMTP id q7so3784055wrg.5
        for <linux-mediatek@lists.infradead.org>; Mon, 30 May 2022 06:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZM5eYcuIY3/VuL1Woj6kSDisyNbm6FYEhsWCF5AlxTQ=;
        b=S37b2Djh5PZwJVNwauCbaYraC21CjX03rx/iQFhFOYUtKB971JORGxK89ePlyNFzxr
         pO2ZzDwk40Axo8A1xqsSkPEWbpKM1O1zPG9J5mBvsOk2cN/ePewdLaM7ZysPdcGdS22v
         tNQb3HK3nGxIbiLILgjd2odLwh+n0iqmHgK9k2I/5NJfwiXeF7QSUQz3ihn/yEblVkHP
         HNh9yaSnDFjdPneQIb9CdS4j+bOX4DvniIRn7PyROFWhHxCMiRKpImBIRKhO45tR4Y/S
         bAeeDkZNvO+QEiZlUeqtnYje9tEQyfHnp+pqZlWf36axIJw8HVuOWMOqZdGn1lQdHJj8
         2CJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZM5eYcuIY3/VuL1Woj6kSDisyNbm6FYEhsWCF5AlxTQ=;
        b=ZSPCdqJOmXbfyYCEoiGhfOTjmzMteV8Ev8obqEfSusaqem/Cl1DBuboBO1qTnSuVU8
         AltNsoQCL0epoWeV2/qhxMylQPPuw44OaJrQjArMHZEUSMget2L95xpdU6umsG1OixTk
         8kwb92dpaeEWwgZNKoAO0cgbpGMOTuAkP497ULAu8/U0n+Xsx12IXYr527HvAb5TZYi0
         5qfWOaFCdcmKEhVWjdViYy3krw35qMLLT9GQG89MnNBDybRznpgkgVAMOeLdqhJpAFYl
         vBNdGteb2uJCy0JdUeLrbEolIpbbGGEf2WkmeSFtGdnY1OLvfQMRrmxFot+f3QdcMvXh
         3bUA==
X-Gm-Message-State: AOAM533OPPgYbAiPDYWEmD/23QXV3vASwySaMyLBibIvILPasorrHnc1
	JuqS6rGo3TyaXZMITbfroeK8Pw==
X-Google-Smtp-Source: ABdhPJz4bx/yd7NERuUgiDWlU20pbMHsaQibRRol4g1P3jXWGbuvbaDgPUGuEW7ONxcStVl57WBYOQ==
X-Received: by 2002:a5d:4601:0:b0:20d:53a:2f39 with SMTP id t1-20020a5d4601000000b0020d053a2f39mr45981113wrq.347.1653918941461;
        Mon, 30 May 2022 06:55:41 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
        by smtp.gmail.com with ESMTPSA id w9-20020adfee49000000b0020cfed0bb7fsm9214856wro.53.2022.05.30.06.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 May 2022 06:55:40 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fabien Parent <fparent@baylibre.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 1/3] dt-bindings: soc: mediatek: pwrap: add MT8365 SoC bindings
Date: Mon, 30 May 2022 15:55:20 +0200
Message-Id: <20220530135522.762560-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_065545_309002_BFD61B93 
X-CRM114-Status: UNSURE (   9.40  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add pwrap binding documentation for

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 Documentation/devicetree/bindings/soc/mediatek/pwrap.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/mediatek/pwrap.txt b/Documentation/devicetree/bindings/soc/mediatek/pwrap.txt
index 0581dbda4828..00b94601071e 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/pwrap.txt
+++ b/Documentation/devicetree/bindings/soc/mediatek/pwrap.txt
@@ -29,6 +29,7 @@ Required properties in pwrap device node.
 	"mediatek,mt8183-pwrap" for MT8183 SoCs
 	"mediatek,mt8186-pwrap" for MT8186 SoCs
 	"mediatek,mt8195-pwrap" for MT8195 SoCs
+	"mediatek,mt8365-pwrap" for MT8365 SoCs
 	"mediatek,mt8516-pwrap" for MT8516 SoCs
 - interrupts: IRQ for pwrap in SOC
 - reg-names: "pwrap" is required; "pwrap-bridge" is optional.
@@ -38,6 +39,8 @@ Required properties in pwrap device node.
 - clock-names: Must include the following entries:
   "spi": SPI bus clock
   "wrap": Main module clock
+  "sys": System module clock (for MT8365 SoC)
+  "tmr": Timer module clock (for MT8365 SoC)
 - clocks: Must contain an entry for each entry in clock-names.
 
 Optional properities:
-- 
2.36.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
