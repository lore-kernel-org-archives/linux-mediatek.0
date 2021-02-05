Return-Path: <SRS0=sOPI=HH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E386C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Feb 2021 07:19:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B52D64DFA
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Feb 2021 07:19:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B52D64DFA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tNC+j+Dna9xNZd4jkFa0qxAzTjZYj61xASdzZkIt/h8=; b=dsaMj1gj6l6ggs9euUEiBA+Ub
	luE6Vp7oDdnFjbopdZ127eA5V8tUVE6B/ig6KEOKqTH/Ee/Fnwb7HWCiDpTPxXLQtpG8oOiOzmiaF
	Q54pCR7N5zlOdgQnKdefR51392Bt8ek9SC00AuiN98B8OPIP8O9kQ9b+VMN7r4+hunDBvyZxfMZPT
	psqGE0b2jRrLQtpvrIgeuZ3PGw3uHctajgtpo/rcLPP6cu8l3ld6xKmJHz0BfJgD2+b4f1WZHQaXV
	4Csxo7Ufbi4cRHN0bMUfS4rxkjPJF0WVJf6iKI0oNk163O8c4fkKY1oiQ4sbHBsyHpU2rG03yMNOy
	/zyMPZFdw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7vOF-0006ak-5I; Fri, 05 Feb 2021 07:18:51 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7vOA-0006Y0-QJ
 for linux-mediatek@lists.infradead.org; Fri, 05 Feb 2021 07:18:49 +0000
Received: by mail-pg1-x531.google.com with SMTP id s23so3902365pgh.11
 for <linux-mediatek@lists.infradead.org>; Thu, 04 Feb 2021 23:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cThBBHhfisbdUPR0BkCKaJgx6RZfF0oevqoz0x7YcXQ=;
 b=gs7kBuH9Kl2Esc4hMGZparVZwOgugR9fMHaIj/vMqeARwLiB+DD6trkrhEWDltv91m
 LngB76WnruOTsnwJd6m8W6cZkeVEfhUjzNei/e4OA42Ap1JhPN4i3rnIx9sPrzENRo3a
 4bu9FswKSpiKzu6PoZ5Gj1wjQWMe9ruXQ99jI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cThBBHhfisbdUPR0BkCKaJgx6RZfF0oevqoz0x7YcXQ=;
 b=GTKjYAtYZbkW3WerOS+/S7mwPM7Pb62Cf6DLVnrdxZ4sc6UsVHvJe0dgchtXUV0VYm
 1TzT+3W0XHJhCRsGGfs49DQYRLjATzbaoWW9ybQiHmnmtVQjqNZwqoMREDygOpDUZISO
 ouVvECUlsqBhq0NV4E6asqizF0FUGNu6BR1FWEvE/FsiWasoEV+HrpLfhrS5rYep/OAT
 kfBXafLw2b0aZJS2yRcUiCMCiXeq0H6MgDaTsg+4S2cksqlKuAmuOAOlQ5bPTEkrNT2D
 +FZILYgrzR+FruOoNrXXUpNeaHOIliA09KgG5mvhVxFMQGPc6mPH8mO2LJGJTCma8ghG
 rRtw==
X-Gm-Message-State: AOAM531ITvFlQu8qu64m3JWLws29sYO3LhioB0RZ3CzgNl4CoRaRGHaH
 JezuxKba434U8UdsB3PRWFHWJg==
X-Google-Smtp-Source: ABdhPJxVTkGhbC4mb8o4v/jbnmCm1Zn/84EZDxDHwP99CjSL5G3+3Z+E4oZSCPRdCA7E7eTYRJE58A==
X-Received: by 2002:a63:5d59:: with SMTP id o25mr2963041pgm.322.1612509524491; 
 Thu, 04 Feb 2021 23:18:44 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:ed70:6d43:9c6a:2e22])
 by smtp.gmail.com with ESMTPSA id oa10sm6292028pjb.45.2021.02.04.23.18.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 23:18:44 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>, CK Hu <ck.hu@mediatek.com>,
 linux-mediatek@lists.infradead.org
Subject: [PATCH v3 2/3] arm64: dts: mt8192: add gce node
Date: Fri,  5 Feb 2021 15:18:32 +0800
Message-Id: <20210205071833.2707243-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
In-Reply-To: <20210205071833.2707243-1-hsinyi@chromium.org>
References: <20210205071833.2707243-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210205_021846_929162_08509AEB 
X-CRM114-Status: GOOD (  12.67  )
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
Cc: devicetree@vger.kernel.org, Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>, linux-kernel@vger.kernel.org,
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 Jassi Brar <jaswinder.singh@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Yongqiang Niu <yongqiang.niu@mediatek.com>

add gce node for mt8192

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index 9757138a8bbd8..1afa6ad06b2b8 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -5,6 +5,7 @@
  */
 
 /dts-v1/;
+#include <dt-bindings/gce/mt8192-gce.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/pinctrl/mt8192-pinfunc.h>
@@ -291,6 +292,15 @@ systimer: timer@10017000 {
 			clock-names = "clk13m";
 		};
 
+		gce: mailbox@10228000 {
+			compatible = "mediatek,mt8192-gce";
+			reg = <0 0x10228000 0 0x4000>;
+			interrupts = <GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH 0>;
+			#mbox-cells = <3>;
+			clocks = <&infracfg CLK_INFRA_GCE>;
+			clock-names = "gce";
+		};
+
 		uart0: serial@11002000 {
 			compatible = "mediatek,mt8192-uart",
 				     "mediatek,mt6577-uart";
-- 
2.30.0.365.g02bc693789-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
