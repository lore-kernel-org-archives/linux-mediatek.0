Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE93FC6FD1B
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 16:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+OFCWs6sMvmcACVP359vGdpDLS8nF6pX77Um/B5ZzBQ=; b=MOEKXOCmr1xf+ycBdh9H06XYzV
	ZkEwmLoz99unEB7xSWQbvTfKK8IYrKHm5MeBhq+eOOTADIx0GQ/e/2zo3Uae0w2Fm5/3RX86GQZr0
	ov47Zv5wCR+xxC6glw4DGrO/QUgOhSMLwP2hiEmTX9qKykjgboDBXAuVs58AG7OEUrml8ajPUTvWg
	eZQFwT7zLqZ66iR7IxjTfaXiRoeRO1lDz8i33lyhLRg0nrafc0RaI2pX8sMJwT2WZ9ZVZhu8uvhZ6
	1hI2O3KvjwR7jIDY7pqOF8auODo0REjv+BXEdJ8KtN2zROcLMmTxRpqUpT+stCTcARG1TTJyPI0Wx
	UkJ+U0GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZaRw-001dM0-FC; Tue, 07 Mar 2023 16:46:04 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZZVK-001IQP-Bq
	for linux-mediatek@lists.infradead.org; Tue, 07 Mar 2023 15:45:34 +0000
Received: by mail-wr1-x42e.google.com with SMTP id g3so12576981wri.6
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Mar 2023 07:45:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678203928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+OFCWs6sMvmcACVP359vGdpDLS8nF6pX77Um/B5ZzBQ=;
        b=I4Km7KvrsZJjag+t2OnVfY3qj3nEqw18rDA/g/UnXtDjeMVyd4k+jsQmwXhiEHzOOo
         kus9JATGqXhXUaxRpv72NOs1h97nszn7FihQqNJoWCZ4lJ2nBUxLH8V90eL0TPDQu0QI
         QnkjKYyyNt80BDehpoieSDTVidG4vOfOz8QARoAuzl0FpUgYUQFqaeYZtm8H+1GNymNh
         e/F9JasTMspKNjy0jKFrRUHz1uU3XzRE/rshBmRHo6TedQ2ljZi4b5ko1viqH4ExiODT
         mezb4sGJN4y4TEdKqBJ9b97gThmeClR1kvXXs5KWMhrroBsc9N/cws97ENwz8+QX6NQ7
         CQ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678203928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+OFCWs6sMvmcACVP359vGdpDLS8nF6pX77Um/B5ZzBQ=;
        b=O2VA2mAKJF1wTph1XOIGby150irOh0l22IxZpVSYKN6DKGI2kfc+eLl2c0MvldJxTP
         W05/X5Jme8v4nmTUccXxRtFHP/E1HpZScrui+NERSBTQhyGOX1/Lm7TLwqxmhAfdXauP
         KHm9h6zIEhb0TWHRf2fZdoT2eMAZTXduFouiCga2axl/JTpsmm3ez5myiIyD5TXybBfk
         aLuGFWK0H1wgelbpyySEC2BTystGk+ceM5gJBC6apwNR2OUBxgc45RENDdcopEuem+WK
         K2gdKeuiMjWGnMY8vFiNxqoMjJTKHub32Rv/HEK0NFoQchbqD7DA1ojeBQD8FQB3XDCi
         3EVA==
X-Gm-Message-State: AO0yUKXRERsrYJAgqFRGWehg99gRUN5qqtxG5C6MiWNuCLtbj8XjZ/Km
	u/Z1sn7hv5X+aSKEjn77PMtJ7w==
X-Google-Smtp-Source: AK7set/+bC2C/uYd0izZbbAPg4Ofkw0p/GsTZYFxd0TjK9UR7bUQOp5p/RMcGAtJ3iaLQsWPqZ5+hw==
X-Received: by 2002:a5d:4089:0:b0:2c7:3ee7:a44c with SMTP id o9-20020a5d4089000000b002c73ee7a44cmr8371471wrp.65.1678203928444;
        Tue, 07 Mar 2023 07:45:28 -0800 (PST)
Received: from localhost.localdomain (laubervilliers-657-1-248-155.w90-24.abo.wanadoo.fr. [90.24.137.155])
        by smtp.gmail.com with ESMTPSA id f2-20020a5d50c2000000b002c704271b05sm12697905wrt.66.2023.03.07.07.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 07:45:28 -0800 (PST)
From: bchihi@baylibre.com
To: daniel.lezcano@linaro.org,
	angelogioacchino.delregno@collabora.com,
	rafael@kernel.org,
	amitk@kernel.org,
	rui.zhang@intel.com,
	matthias.bgg@gmail.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	rdunlap@infradead.org,
	ye.xingchen@zte.com.cn,
	p.zabel@pengutronix.de
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	khilman@baylibre.com,
	james.lo@mediatek.com,
	rex-bc.chen@mediatek.com
Subject: [PATCH 1/4] dt-bindings: thermal: mediatek: Add AP domain to LVTS thermal controllers for mt8195
Date: Tue,  7 Mar 2023 16:45:21 +0100
Message-Id: <20230307154524.118541-2-bchihi@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307154524.118541-1-bchihi@baylibre.com>
References: <20230307154524.118541-1-bchihi@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_074530_422830_D821F0A9 
X-CRM114-Status: UNSURE (   8.85  )
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

From: Balsam CHIHI <bchihi@baylibre.com>

Add AP Domain to LVTS thermal controllers dt-binding definition for mt8195.

Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
---
 include/dt-bindings/thermal/mediatek,lvts-thermal.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/dt-bindings/thermal/mediatek,lvts-thermal.h b/include/dt-bindings/thermal/mediatek,lvts-thermal.h
index c09398920468..8fa5a46675c4 100644
--- a/include/dt-bindings/thermal/mediatek,lvts-thermal.h
+++ b/include/dt-bindings/thermal/mediatek,lvts-thermal.h
@@ -16,4 +16,14 @@
 #define MT8195_MCU_LITTLE_CPU2  6
 #define MT8195_MCU_LITTLE_CPU3  7
 
+#define MT8195_AP_VPU0  8
+#define MT8195_AP_VPU1  9
+#define MT8195_AP_GPU0  10
+#define MT8195_AP_GPU1  11
+#define MT8195_AP_VDEC  12
+#define MT8195_AP_IMG   13
+#define MT8195_AP_INFRA 14
+#define MT8195_AP_CAM0  15
+#define MT8195_AP_CAM1  16
+
 #endif /* __MEDIATEK_LVTS_DT_H */
-- 
2.34.1


