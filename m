Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B827C00140
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jul 2022 03:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=q1Lq7KUo05n519UFqiy0/X3OfMebl6UDXCVyDW4GsoA=; b=T53izm10p721wpmP7rLnZt5R49
	plgT0ghmDtNhJ0Imd2MdwZsZHPfJAKMfwGYoaW0L0QOoxyln6BAGDmEunWFDq9osiqR74GoK/ie4L
	xPk5JEAZ/nwZXkFOP9UN8cMDTafRB2LycpAY+5HiBaHZ50rP+xGLsbR6mSI0l607G3oVv4HLaizOx
	sSnPoVSyGdTnhJGYT/r9sR/lG4Jl2ClSsYXFiUC88334e9Iro0CZhoM8Oz7DnfFfDOLjhQIwq2+R5
	Csb1QfbQXkDvpzZx0TT7K33+155MM/51O6QQInWz1HUEMIkpOW/SIpkRU+mJWVEgy76zES/VSlJIc
	W9wU9fzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHGcI-000EDc-2O; Fri, 29 Jul 2022 03:24:46 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHGcE-000EAu-Sb
	for linux-mediatek@lists.infradead.org; Fri, 29 Jul 2022 03:24:44 +0000
Received: by mail-pj1-x1035.google.com with SMTP id c19-20020a17090ae11300b001f2f94ed5c6so6250309pjz.1
        for <linux-mediatek@lists.infradead.org>; Thu, 28 Jul 2022 20:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=q1Lq7KUo05n519UFqiy0/X3OfMebl6UDXCVyDW4GsoA=;
        b=I7P1wkNqAl1wnv0IiLInzobHs+RGv0nqejGxMJdl3aipPlOW4KhvtWpQJOExHASTY8
         rJhHRHGKFQhjFrrIcBcgPzUkzCvOB5TWFaxBfIDbeN/pKRrQ+SEYinFFOPJsb5SVNqwC
         wVUf7dCk741hZUB5PYYMw91wQV5YmFqs5BjsM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=q1Lq7KUo05n519UFqiy0/X3OfMebl6UDXCVyDW4GsoA=;
        b=P89ytQuZ1LGxKHsZVTpRvAFtfuHRr43nog1KTlqQxogLj3uIHlpC2HmQwDf5ccRzUf
         vFhGLM0HjAKzyIRCW0dHRU5X3tzHiFNTR21nUc+w5y5COeQcftwqOxSdlTZ4MrGlIjR/
         TbAABs/f8UJQHDigRlnyuVKnbl3EdQJYaVR4A5XpfHSY37S17UzxeTQ++ctYMUqLvR1f
         JT5QdYxPqSX6RMpRY9hKm+JWaofCUMnWYxRYLRQ8zfVeMPMnyA+OO8f7XT1JZhpvU5ln
         lzq3gnP+tdBaf8EhXbMDzqUj51OcDn6RQqx3trYGNzxbP3Ojlot5Xh+KcRQAGa4stvju
         7ljQ==
X-Gm-Message-State: ACgBeo1QcqrpzuUs8EpRCSARfkGlJYW1k79UhvAumdT/73P/PdkCPQaz
	NXQs3B+TWyT2gKFX+zv7TchaDxvfC6dX4A==
X-Google-Smtp-Source: AA6agR6SMdNRzdPmTw+V/2OYfhKP553d0oZivr6hg6YyG766ehaFPezydPvsxQrjkWWpx+F/HasOUw==
X-Received: by 2002:a17:90b:2686:b0:1f2:503c:2472 with SMTP id pl6-20020a17090b268600b001f2503c2472mr1849462pjb.187.1659065079781;
        Thu, 28 Jul 2022 20:24:39 -0700 (PDT)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:df93:db78:d658:2b3b])
        by smtp.gmail.com with ESMTPSA id n5-20020a170902e54500b0016c0593876csm2145129plf.157.2022.07.28.20.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jul 2022 20:24:39 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Hsin-Yi Wang <hsinyi@chromium.org>,
	Evan Benn <evanbenn@chromium.org>,
	Eizan Miyamoto <eizan@chromium.org>,
	Pin-yen Lin <treapking@chromium.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v4] arm64: dts: mt8173-elm: Switch to SMC watchdog
Date: Fri, 29 Jul 2022 11:24:23 +0800
Message-Id: <20220729032423.157144-1-treapking@chromium.org>
X-Mailer: git-send-email 2.37.1.455.g008518b4e5-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_202442_998446_2453D86F 
X-CRM114-Status: GOOD (  11.16  )
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

Switch to SMC watchdog because we need direct control of HW watchdog
registers from kernel. The corresponding firmware was uploaded in
https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/3405.

Signed-off-by: Pin-yen Lin <treapking@chromium.org>
---

Changes in v4:
- Rename the watchdog node (smc_watchdog -> watchdog)
- Correct the patch summary (mt8173-oak -> mt8173-elm)

Changes in v3:
- Remove /delete-node/ and create a new node for SMC watchdog.

Changes in v2:
- Move the modifications to mt8173-elm.dtsi and add some comments.

 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index e21feb85d822..421bb2945135 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -161,6 +161,19 @@ hdmi_connector_in: endpoint {
 			};
 		};
 	};
+
+
+	watchdog {
+		compatible = "arm,smc-wdt";
+	};
+};
+
+/*
+ * Disable the original MMIO watch dog and switch to the SMC watchdog, which
+ * operates on the same MMIO.
+ */
+&watchdog {
+	status = "disabled";
 };
 
 &mfg_async {
-- 
2.37.1.455.g008518b4e5-goog


