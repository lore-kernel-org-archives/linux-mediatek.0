Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B310109318F
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Mar 2026 08:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qDGOglO7IMqYnkwgfR6oUN6v8rO29Is2tHBRv7dt4O0=; b=qKPkCbZHCeIrurt7ab2c+0ddrH
	BWt+MQmA3oUPgNhN4y7i+zFAIwfqBfHchTCM3kP2fbUR1lgwKBfP0NfMFSpdmVxDhidnnF8AiLWLK
	tfIjVM6IgMQCg3CuaBiCtaH4TTOekm5qmNLB1NQBPe3IMCTdqKlogYtyjPGeXNIFBmeEsLA7GYE/j
	JUuFIPy6+VYI4KUdtr7wjjLeLem1oMw00VkL1U/gtmwgjoZpG/rSZNV3un3IaLVGrMQyzkBk3eZQs
	5LNv6QMVda5uJsETEwPAIC4NaqtdyRvnFtI2kRGcPBszZM8l18QBPV3/YaREOKsAHsb7vQO6OWYx1
	OEsXQaFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VTB-0000000COC1-37Sd;
	Fri, 20 Mar 2026 08:44:39 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VSx-0000000CNsG-02wK
	for linux-mediatek@lists.infradead.org;
	Fri, 20 Mar 2026 08:44:24 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2b06c43e6a7so1986435ad.2
        for <linux-mediatek@lists.infradead.org>; Fri, 20 Mar 2026 01:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773996262; x=1774601062; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qDGOglO7IMqYnkwgfR6oUN6v8rO29Is2tHBRv7dt4O0=;
        b=flYFCkTPBdmml9BIVxYwV+YN398YpwoxHk1YLb0SSCV1BSwFFfcbGzvOmLTXxQcu1u
         SEklUhfBX/DcPq/r09/qFIBMk5L0DksmX3Iq4J1rpzz5oXKGOem4b+S85TUxS+7PPXqh
         Q6KvQWoPY/pfiNEPQvV3jH+nfSDTv9yURQg/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773996262; x=1774601062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qDGOglO7IMqYnkwgfR6oUN6v8rO29Is2tHBRv7dt4O0=;
        b=CTtuBTV9aJpuMRl23lUV9CgNDFV9tvx86l8X9bWgt+pXqM0RyJuqrAH5TCGEbHuYFQ
         42/IlJNxmCoUF/A5tt0jOTcetjEmnSrXi9M0YVCxXlFEOuOT31uPPmuyuA9DXB9/2z76
         c0Gxbf+2oC3JpaijLVFyKQu7J4bsO0PAkD5CmI2DHNTpcTHMmKF9Lj2ZE+FJ7GGUr8um
         hFubBIi1pRsvokILU+qvYJaZun7LJqc0sTdY8sQPQsDthNFqYe3vaqHBGvgQDjoyTyve
         nu3VBoSJhjkjHCJwvIOPEdhcZiW/o5pR/iqNrENUNnp28wj1Z83l5Wve7fF9p//3zkzs
         xjEg==
X-Forwarded-Encrypted: i=1; AJvYcCX13MP3M4XhCvyqJ6f0DeS5xCZ3BHo6+ikUBmWiYxX+6K6MwPcKTQIadJCXiH2HyZ5WuG697anj44sCGVA0sg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzhdiJzLLYdIbgNSPlLdPtVtQmFDgN2Bs6snBDkW3mpqy+3Wegy
	Z3BBPg+p5t6WCalTZ4qNQSgzleU8B0qeIj02gAcQCfyoFiIfjkXJndDBWRN4bP8o+w==
X-Gm-Gg: ATEYQzx9cIVz+Ka0mwhnDytwsDu9eM7ro05HkyiZJHuCRZoo6lClHqdW42F/sb4yH5q
	9/LdFrxKTPZ5BZpc6A81jmmnlaBy9CAoeWyd8d9ASMInXg0EzOWrlzsGHcm5w8be6zy1Es5pBnT
	zZo0fLkdrQEUbWlEYxGGdSBT58AlG7Qa+ubMpcIWb6zOh/4Vku9y1AqLHVz125ib5D9Ph25jCDP
	QhnLOFkdH4FGpLuifa5uuGUSXexO0y1nh5SRW5kniYC7x6XmEwJSjFhhUXTAUTxoG9csvSiU09v
	0nPjXYabTJx9ovV79mirUnfb/Z/hvwAWBmiirEMm/buS3qEX6Y8GNtQ3m62AzCSaxPOiYIAQq2v
	4fh1P1+IYq+dvTDHmtqBvjKKG8cOYBRoU8Q1S8Oa8iqcr/MK8Qa3r46cTf2Ui6zVOkgwdZVahjR
	MxE3td65vSdoOo+hsO1FKGMKeoiGtqh09Rw0Adj50IJST2GzywhvV0LyOHJCNc4skF0ZEMygn+W
	CrN5KW0mnyt1P27zhk=
X-Received: by 2002:a17:903:1b6b:b0:2ae:bf92:5acc with SMTP id d9443c01a7336-2b0826ff359mr19764785ad.3.1773996262311;
        Fri, 20 Mar 2026 01:44:22 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:9cdf:e932:6f2f:c654])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0836a3066sm14917905ad.75.2026.03.20.01.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 01:44:21 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 10/13] arm64: dts: mediatek: mt8195-cherry: Add MT6315 PMIC supplies
Date: Fri, 20 Mar 2026 16:43:42 +0800
Message-ID: <20260320084351.2461060-11-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.959.g497ff81fa9-goog
In-Reply-To: <20260320084351.2461060-1-wenst@chromium.org>
References: <20260320084351.2461060-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_014423_051111_3074CE8A 
X-CRM114-Status: GOOD (  10.27  )
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

The MT8195 Cherry design has two MT6315 PMICs. One has 4 outputs ganged
together; the other has 2 outputs ganged together, and the other two
unused.

Add supplies for these two PMICs. Since the outputs are ganged together,
just add the supply for the first one.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index b53e602659a7..ca747531629d 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -1478,6 +1478,8 @@ mt6315@6 {
 		reg = <0x6 SPMI_USID>;
 
 		regulators {
+			pvdd1-supply = <&pp4200_z2>;
+
 			mt6315_6_vbuck1: vbuck1 {
 				regulator-name = "Vbcpu";
 				regulator-min-microvolt = <400000>;
@@ -1495,6 +1497,8 @@ mt6315@7 {
 		reg = <0x7 SPMI_USID>;
 
 		regulators {
+			pvdd1-supply = <&pp4200_z2>;
+
 			mt6315_7_vbuck1: vbuck1 {
 				regulator-name = "Vgpu";
 				regulator-min-microvolt = <400000>;
-- 
2.53.0.959.g497ff81fa9-goog


