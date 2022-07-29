Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C34DC00144
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jul 2022 05:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KElw61eLlKwxj7+Xj4c/fe2WkAnEdD75KF1vS/H3hCw=; b=0dDZWMzoovHn1Dkbz8f/yWqlfX
	QWw9WGcpV//hybeimR9ByGS0ngky37Ty3YxddAhp1dm9kDyodnveRg2XmEyoWFpguS+x1wSxTWCPy
	Dr7FeRzGQbRBJPhntLi58Z6VYvVPHPQnbKAcj3xxyimJFp3ESDeQf62m4SjPWAbUU6tER2UCgZHN1
	BY3F8hgfdU0fZQT9q4d/AYVODTlmODWiOs6i5TSHHlKODzDD/slpxOgvgysiKkBUntctu5ZdL97ma
	npFIx4y4Z8J94PdLPi5g4ieGUll7fpvrMx+PtD6u6GIgXH/JDHjcYYvvE/q5K7wdaqlx2vtac7BfI
	qazYrlEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHIcT-001a4G-TA; Fri, 29 Jul 2022 05:33:05 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHIcR-001a3E-CF
	for linux-mediatek@lists.infradead.org; Fri, 29 Jul 2022 05:33:04 +0000
Received: by mail-pf1-x42c.google.com with SMTP id y141so3721156pfb.7
        for <linux-mediatek@lists.infradead.org>; Thu, 28 Jul 2022 22:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KElw61eLlKwxj7+Xj4c/fe2WkAnEdD75KF1vS/H3hCw=;
        b=V+dUhOUkEkwox3z7VTXI8K0jleX0N2fBr7eNQe0krpSetMQsJCmnCW/k5i7xFzo8oS
         zoRM1HsdBLAarjNWuxbe/Jn+jmiXSJvdA2kAL/dR0E8tcNlhKbNQ/fUe74i0u2KxNE4D
         WmR8QnCF493w/FK8xBFY2wNtqeN5fl9wB9dxk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KElw61eLlKwxj7+Xj4c/fe2WkAnEdD75KF1vS/H3hCw=;
        b=IwSh0nJpaIqQoJa8Gw4fuXM4IX3xqPubigABENt+w1cndht4sRY22S1HXywJwIiEOz
         wGWaCkN3IQtlXutkDWeW0MDfSj4vXXBfSAOb98vNe9I8t//SMxYGlfG9fbB/XBz7agsI
         T83q4oyjE34F9TA8JPt70CVmqr0MKRSQrtlVqgfnk06Fp6N02tJ5G4B5c+KEWvsnqzK3
         71k5YLKaNi7i0YAUg+zlk3fvng5fic+InYcZycgETRZ+3W5E9o0xCwSL/2FoSoW5SMxF
         MXvPeVfDvks2CKrUrv2psHZbem8LzGrFKC+H/ujChzqP84oGg0sYxj21T5tLW8KeQC3m
         XMPQ==
X-Gm-Message-State: AJIora+VvarTF2GweKPEQCeShR0IJGr5CSFK7EBuWcieJuDMCikwxvuB
	9sJ4c3qbny2tx0t51rXgdRhTxA==
X-Google-Smtp-Source: AGRyM1thc/3FPJPxHBIe27C3oCbWb/CZ7bNvT/uFSgYftyyhmkTsNKx/WtR4DEu6RRDtx0dKyPB6TQ==
X-Received: by 2002:a63:2102:0:b0:41a:8139:2cb3 with SMTP id h2-20020a632102000000b0041a81392cb3mr1701228pgh.314.1659072780573;
        Thu, 28 Jul 2022 22:33:00 -0700 (PDT)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:df93:db78:d658:2b3b])
        by smtp.gmail.com with ESMTPSA id h27-20020a63211b000000b0040d48cf046csm1820690pgh.55.2022.07.28.22.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jul 2022 22:32:59 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Evan Benn <evanbenn@chromium.org>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	Eizan Miyamoto <eizan@chromium.org>,
	Pin-yen Lin <treapking@chromium.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v5] arm64: dts: mt8173-elm: Switch to SMC watchdog
Date: Fri, 29 Jul 2022 13:32:54 +0800
Message-Id: <20220729053254.220585-1-treapking@chromium.org>
X-Mailer: git-send-email 2.37.1.455.g008518b4e5-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_223303_449097_B031A818 
X-CRM114-Status: GOOD (  10.92  )
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

Changes in v5:
- Remove redundant new line.

Changes in v4:
- Rename the watchdog node (smc_watchdog -> watchdog)
- Correct the patch summary (mt8173-oak -> mt8173-elm)

Changes in v3:
- Remove /delete-node/ and create a new node for SMC watchdog.

Changes in v2:
- Move the modifications to mt8173-elm.dtsi and add some comments.

 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index e21feb85d822..abe3140cfcc6 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -161,6 +161,18 @@ hdmi_connector_in: endpoint {
 			};
 		};
 	};
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


