Return-Path: <SRS0=yE1p=NL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7D4DC432BE
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Aug 2021 08:17:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 796FD60C41
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Aug 2021 08:17:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 796FD60C41
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n+iA5qTpax/bm5Kp1y5jgMudhhrC3TIiMzFFHgaZltU=; b=PaWPlK79c85hN5
	BQSn3/0RGjRd3rTOuHz97U4OYb+r99SIYVeJIZpVQmtbWWucJQmcOHgLH+MljnVtT7Tfn45TKkaIU
	IARm9uzAe4MTutsnkEJ9kdZhKquk8yCdRpBvDCPLn/K7AJ7r1SE72qd/46gDdGnPrPeZq1EsJmb51
	y5t8U7HV5FcPIwzUhxWz3ZwUyKwPiO8T3vOnH3I80JwVJMYzLIiJ83Yj8p0KSVSV0AGjyRfMiD+Q6
	9oFtQOKuxi0P9HFGU+B1iuUGZeJxZ2utPH9VPh5gVSIOHsY06CQCjOXBuAxCM9YlhrY3UpK2r5WV+
	xrXhMFCY7lJ6I5wGZBUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGzhu-00ALVQ-W3; Fri, 20 Aug 2021 08:16:55 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGzhO-00ALIn-1G
 for linux-mediatek@lists.infradead.org; Fri, 20 Aug 2021 08:16:28 +0000
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D4577407A6
 for <linux-mediatek@lists.infradead.org>; Fri, 20 Aug 2021 08:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1629447380;
 bh=rFYV7pHtPVAhRCoujACv0nbWtGdLJ18YOanrxxZY/lQ=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=ENhS/boz7O5nErTumJsWMhmVKGE3En1BTsOfI88J/gLC22zyViUtMgCP3qW0Ggovq
 qlMHzbkXMUNwkQnWJIlULdxvZJTrDsUAK1IUqAEFVDVymbtj8rEzJP7w1xvm+HpemV
 We87/JOq8U4bUweX85eXD6zIj2n8U/0agtjXqkZNSAqbTUWUu+N+RGrVuPnDKm61rG
 GQA4VLZg/VXnhygu+h+JaOI5ieu+9+L6tv9C9Eu0ofOl15TysBonGh5Q9q9ATHRWv1
 pBfawvA6CZy9Y1XLZd5OmcRYoLRiZfKCdW/pFk4Gdhf8Re4dY8n7gMMda3awBXQIJK
 vfAdTtk+Y+MqA==
Received: by mail-ej1-f70.google.com with SMTP id
 v19-20020a170906b013b02905b2f1bbf8f3so3373784ejy.6
 for <linux-mediatek@lists.infradead.org>; Fri, 20 Aug 2021 01:16:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rFYV7pHtPVAhRCoujACv0nbWtGdLJ18YOanrxxZY/lQ=;
 b=K2/0wfGtCcmZfPB/wIIgfrXU3mKzj+78oypDZ1+nQ6ijYa0aUVaCoE8jLxi8nCx2wZ
 tXpTck9sJFyr0+EQ/0ZnAeSjkfsNZhG/HwShvmr+3oT7sioIuGVZzQ+ukht+ACnfyOkC
 QyqHcGI457pIJuFhBEuV58XV/anFT22Hng/WpzRKZnbHV71uhYPpEAolwbS+vVrfo9Cn
 lSpvSWEMnv+hL63WLPbobIwxbQksD0frptM1MbHTBikENGQsx8UJ3wR3jIXuKKi9qaoH
 67g0i1eFNLCSPtK34d8lZ3EjS74xJKwrWaAXPBrIiFwt7x6MUZ1Xq+Cmk9l3IlNCDv8t
 f4PQ==
X-Gm-Message-State: AOAM533QiNDC+Z2BU3YAxUva4+8VjhS4Zn0YDPwspYJIx5VK0PKz3C4o
 tEC2lOQoPWpXs7PENh8OylV8vAnkqb3aoMfGkuxoznAlRXamnULtwCIQevIHYZW2oYCILbHlKkr
 oUzG19ttnwvJyALWpP1GlcvdAXc2PC5y1kiSTQpR71o3PSSuNew==
X-Received: by 2002:a05:6402:13cf:: with SMTP id
 a15mr21006888edx.117.1629447380409; 
 Fri, 20 Aug 2021 01:16:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwhFPcjbeXROTX7e6+Upaf75ZvqQGL1rcjdhNt9+IdhuGxzIbim1t5Pp3fsAw4KLjqKWlg5QA==
X-Received: by 2002:a05:6402:13cf:: with SMTP id
 a15mr21006874edx.117.1629447380301; 
 Fri, 20 Aug 2021 01:16:20 -0700 (PDT)
Received: from localhost.localdomain ([86.32.42.198])
 by smtp.gmail.com with ESMTPSA id w13sm351632edx.67.2021.08.20.01.16.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 01:16:20 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH 2/2] arm64: dts: mediatek: align thermal zone node names with
 dtschema
Date: Fri, 20 Aug 2021 10:16:16 +0200
Message-Id: <20210820081616.83674-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210820081616.83674-1-krzysztof.kozlowski@canonical.com>
References: <20210820081616.83674-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210820_011622_240676_710DAA48 
X-CRM114-Status: GOOD (  14.12  )
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

Align the name of thermal zone node to dtschema to fix warnings like:

  arch/arm64/boot/dts/mediatek/mt8173-elm.dt.yaml:
    thermal-zones: 'cpu_thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,12}-thermal$', 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm64/boot/dts/mediatek/mt2712e.dtsi | 4 ++--
 arch/arm64/boot/dts/mediatek/mt8173.dtsi  | 2 +-
 arch/arm64/boot/dts/mediatek/mt8183.dtsi  | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt2712e.dtsi b/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
index a9cca9c146fd..640d4fdaa611 100644
--- a/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
@@ -19,7 +19,7 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
-	cluster0_opp: opp_table0 {
+	cluster0_opp: opp-table-0 {
 		compatible = "operating-points-v2";
 		opp-shared;
 		opp00 {
@@ -36,7 +36,7 @@ opp02 {
 		};
 	};
 
-	cluster1_opp: opp_table1 {
+	cluster1_opp: opp-table-1 {
 		compatible = "operating-points-v2";
 		opp-shared;
 		opp00 {
diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 49c6b6a5b489..066025d80ca4 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -273,7 +273,7 @@ cpum_ck: oscillator2 {
 	};
 
 	thermal-zones {
-		cpu_thermal: cpu_thermal {
+		cpu_thermal: cpu-thermal {
 			polling-delay-passive = <1000>; /* milliseconds */
 			polling-delay = <1000>; /* milliseconds */
 
diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index caab109add28..d836769b87bb 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -759,7 +759,7 @@ thermal: thermal@1100b000 {
 		};
 
 		thermal_zones: thermal-zones {
-			cpu_thermal: cpu_thermal {
+			cpu_thermal: cpu-thermal {
 				polling-delay-passive = <100>;
 				polling-delay = <500>;
 				thermal-sensors = <&thermal 0>;
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
