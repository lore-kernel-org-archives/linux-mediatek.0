Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B3D6EE49AB
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Aug 2023 08:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k79wdmYHctxTtTviGEsItx8Rkhv7MYSzlD064SW+BWo=; b=T6xry1/k3LRYQJGSzOtUnLl7ej
	mbC9rqBMYdmmfCvt4desrM/dVbR811lgSbFCulx+hTpG0GGHCggd0ES03eX5z4/tvtG60I+1ihs3g
	6yR93Qxf0nVIWs4NgO4U8aQeL89YkwyLEH5mqoXaB/dNZFfNCeW4Syn9GM5uA6YmjfhUtNyjW+cvc
	PAA5i5ROLXz21myZu6F5390NV7HQKe/nheuIsvFRZrBlOGQvG7iMT9l5v1xznoxOG17PTicFQxDrU
	XlhXqQSkTWDGArmx7p2vx8b5QX3F0eHaWpgsqBxHLVhsd3V5FonSWuXCaZ1c4HLaTVQjdpELOZZzW
	vPhlvUQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYN1L-00FUEQ-1b;
	Tue, 22 Aug 2023 08:45:51 +0000
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYN17-00FU3m-18
	for linux-mediatek@lists.infradead.org;
	Tue, 22 Aug 2023 08:45:39 +0000
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-1cc61f514baso1443786fac.1
        for <linux-mediatek@lists.infradead.org>; Tue, 22 Aug 2023 01:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692693935; x=1693298735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k79wdmYHctxTtTviGEsItx8Rkhv7MYSzlD064SW+BWo=;
        b=l3UNByXtp7EcL+5pV348GVt6NJLrnCD5W0g9jVmO89nbf6Dt9TJc7YhaUQr9r8jSi+
         NTk+SdWvqrIUWXCWUNUfLZB8bFQ8+DFThbyCe1qmx/G4NGmarLbYM1uGQxD4M6rfqIPI
         Kat4JQ8Me81NQIcTYoTx+JFs3gDoEGAyzlc5E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692693935; x=1693298735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k79wdmYHctxTtTviGEsItx8Rkhv7MYSzlD064SW+BWo=;
        b=WW0/K+IukSJHJRLVP/UnRGLqjRe6cZoxqvgqe/7XhMLPxYgZZ89r5Yx40E5IB068w3
         0pHwp9dgkHc/w0IJxVBQ4FqzFDKTZ8fabAQnQdRf7XO+Yym5QNAJ43Ogjeiu83ykeb9k
         tI/rAsvoSDOK+wnL0ltLW25VtjzQdgJqqGKU5r5MlMHOgC5rrYXpTqHWZf4EkX9/ylq6
         LfFk26SaV6D15rP8DkfipUK2pvJq2F4eVJLufjkIXooOAyXm/FWxjzgy53CPJOWNMO/F
         XHDPffMnim7HrudtwjvfQZXLLKgh2nGLXeBibV9KeYClJVzM+LW/xJuWNhjj7Lh2Kwcq
         BYpQ==
X-Gm-Message-State: AOJu0Ywsk8O8Ybq4C8B939yskKjq/tL4WZnO0cMoUGRCVEcju8LA83Up
	E9eVBAlaM6iGLlcZhxTqm5EiXg==
X-Google-Smtp-Source: AGHT+IFrqNfX0Z2M1qPDMP5VU3WvMzTEBG6FxwX95QutkiDBAyygmWZFCFMonYMFDSbc3GnKB2Qo8A==
X-Received: by 2002:a05:6870:211:b0:1c8:d72a:d6b4 with SMTP id j17-20020a056870021100b001c8d72ad6b4mr9470932oad.2.1692693935466;
        Tue, 22 Aug 2023 01:45:35 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:e619:3fa0:1a90:6bb0])
        by smtp.gmail.com with ESMTPSA id s26-20020aa78d5a000000b00666b012baedsm7304790pfe.158.2023.08.22.01.45.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Aug 2023 01:45:35 -0700 (PDT)
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
Subject: [PATCH v2 02/11] mfd: mt6358: Add registers for MT6366 specific regulators
Date: Tue, 22 Aug 2023 16:45:10 +0800
Message-ID: <20230822084520.564937-3-wenst@chromium.org>
X-Mailer: git-send-email 2.42.0.rc1.204.g551eb34607-goog
In-Reply-To: <20230822084520.564937-1-wenst@chromium.org>
References: <20230822084520.564937-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_014537_391634_D107DBCA 
X-CRM114-Status: GOOD (  12.81  )
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

The MT6366 PMIC, compared to the MT6358, does away with the VCAM*
regulators. Two regulators VM18 and VMDDR reuse their register space.
There's also a VSRAM type regulator VSRAM_CORE thats' split between
the VCAM* register space and other parts.

Add register address macros for these MT6366 specific regulators.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 include/linux/mfd/mt6358/registers.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/include/linux/mfd/mt6358/registers.h b/include/linux/mfd/mt6358/registers.h
index 5ea2590be710..d83e87298ac4 100644
--- a/include/linux/mfd/mt6358/registers.h
+++ b/include/linux/mfd/mt6358/registers.h
@@ -294,4 +294,21 @@
 #define MT6358_AUD_TOP_INT_CON0               0x2228
 #define MT6358_AUD_TOP_INT_STATUS0            0x2234
 
+/*
+ * MT6366 has no VCAM*, but has other regulators in its place. The names
+ * keep the MT6358 prefix for ease of use in the regulator driver.
+ */
+#define MT6358_LDO_VSRAM_CON5                 0x1bf8
+#define MT6358_LDO_VM18_CON0                  MT6358_LDO_VCAMA1_CON0
+#define MT6358_LDO_VM18_CON1                  MT6358_LDO_VCAMA1_CON1
+#define MT6358_LDO_VM18_CON2                  MT6358_LDO_VCAMA1_CON2
+#define MT6358_LDO_VMDDR_CON0                 MT6358_LDO_VCAMA2_CON0
+#define MT6358_LDO_VMDDR_CON1                 MT6358_LDO_VCAMA2_CON1
+#define MT6358_LDO_VMDDR_CON2                 MT6358_LDO_VCAMA2_CON2
+#define MT6358_LDO_VSRAM_CORE_CON0            MT6358_LDO_VCAMD_CON0
+#define MT6358_LDO_VSRAM_CORE_DBG0            0x1cb6
+#define MT6358_LDO_VSRAM_CORE_DBG1            0x1cb8
+#define MT6358_VM18_ANA_CON0                  MT6358_VCAMA1_ANA_CON0
+#define MT6358_VMDDR_ANA_CON0                 MT6358_VCAMD_ANA_CON0
+
 #endif /* __MFD_MT6358_REGISTERS_H__ */
-- 
2.42.0.rc1.204.g551eb34607-goog


