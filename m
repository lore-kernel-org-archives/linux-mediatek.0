Return-Path: <SRS0=xI6Y=LQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04259C48BE5
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Jun 2021 03:08:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B66F361108
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Jun 2021 03:08:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B66F361108
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YnDpajWz7dOTJqU/N1jzXDHPIJgsonXQnX2FsHPdITQ=; b=4f1dICclHfBlky
	gj0zsMS+GFk/HwtHT5lGIGyIVMC9qkudq3z9LL/LUDhyiGw08GxIgXzWfgVftW04ezW9pgkFLPbZS
	V+4rrmhyX6cusjCV279oWyYKHg0D4f2PU4dzwZmic6MaXP0pbouRfN7B/nJ26ZO69xrAN0BmPJAF+
	OZVOnRsRwOqI70U+RcymcNTQEj4ZSuUNBWPulY7AuhrzE296ZcEHy6NY0Pz35Nfjtwl7xdtNJk8CT
	KOZYs6dZK2P+v0prQSsFRAht5egIrT0GIW5B6njKKoICii9DwXCyqWDRfR6oJdanXmQMgNUSbomzq
	mdfZOj4Zsa84mruoPw3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvWlr-005T1K-5S; Tue, 22 Jun 2021 03:08:15 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvWlm-005T07-33
 for linux-mediatek@lists.infradead.org; Tue, 22 Jun 2021 03:08:11 +0000
Received: by mail-pj1-x102f.google.com with SMTP id
 13-20020a17090a08cdb029016eed209ca4so1402323pjn.1
 for <linux-mediatek@lists.infradead.org>; Mon, 21 Jun 2021 20:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=/axYvMfoFLDaKlVP6Tl3B1EkkhrpvpNeyDJW5bdfZhA=;
 b=k83nh7RiqD5V5056qN6WN5ZvDCnNY7sTi5WlZN+3QbXPNZ2g2CkqGDadYDq4XoFeNN
 0Snrfbt7Y2f+NcE03wtJHCU1hBKJmETfVTuCnD13rgueHS+Ad/l0saAD3vC1wNxxSUi2
 eZnVA4f4AQW/pShwvz4okalEODd2eKmF2+pMw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/axYvMfoFLDaKlVP6Tl3B1EkkhrpvpNeyDJW5bdfZhA=;
 b=IJXf10VQC/6YNBrEfUlQlTKfuahZUR+MntjoFUf+LAODtHO3rg+1bZcDMWDVkri5Kr
 W4YOUjzz8wEdPtVrUMk5H0/YVimDmFlAVOwuY0EbDj7xn+XEJ66An7DDkgRPdTWmzwBc
 GmHuByU/l4WFxaNw9c0plzVhR0LGHN6wr2KL/WoOqpFLyjylLOmBpRlq4ISVmqC01cMy
 QSOJmqor+8Gqy0S00Cu+fJXL/twd2OuPFjRgCpEunW34UhiOjT0bhTBqRMVrYOiZXOFI
 aXzksTe9nnSfqzlJkJ1PQkE1Gk1PUkQmtygiP5CKw83KYqK8Kkq6IDd5/iMaT2caPsX1
 E/dA==
X-Gm-Message-State: AOAM532JIKX5C1kIJFOc46CpGPho3Q+lbdOJuzwZX+SdX0FKLLg7ByyV
 0p5NBuuhYgs0eqLeSjKEZbCdMA==
X-Google-Smtp-Source: ABdhPJwzlzyWf3yKiyhlNbzn0nwaQRXwZEnBSa4r9G4IGQMWgp7yjmz4s5T6yEUp3O4J48EBirki1w==
X-Received: by 2002:a17:90b:3d0:: with SMTP id
 go16mr1368208pjb.236.1624331289347; 
 Mon, 21 Jun 2021 20:08:09 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:aaeb:6e67:2eb9:f492])
 by smtp.gmail.com with ESMTPSA id z6sm13740722pfj.117.2021.06.21.20.08.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 20:08:08 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 devicetree@vger.kernel.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jassi Brar <jaswinder.singh@linaro.org>
Subject: [PATCH v3 RESEND 2/2] dt-bindings: mediatek: Add optional mediatek,
 gce-events property
Date: Tue, 22 Jun 2021 11:07:43 +0800
Message-Id: <20210622030741.2120393-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.32.0.288.g62a8d224e6-goog
In-Reply-To: <20210622030741.2120393-1-hsinyi@chromium.org>
References: <20210622030741.2120393-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210621_200810_175650_0A09672A 
X-CRM114-Status: UNSURE (   9.72  )
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

This property is used by gce clients.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/mailbox/mtk-gce.txt       | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/mailbox/mtk-gce.txt b/Documentation/devicetree/bindings/mailbox/mtk-gce.txt
index 7771ecaac5868..2ef7ff67cb2b0 100644
--- a/Documentation/devicetree/bindings/mailbox/mtk-gce.txt
+++ b/Documentation/devicetree/bindings/mailbox/mtk-gce.txt
@@ -35,6 +35,10 @@ Optional properties for a client device:
   start_offset: the start offset of register address that GCE can access.
   size: the total size of register address that GCE can access.
 
+Optional properties for a client mutex node:
+- mediatek,gce-events: GCE events used by clients. The event numbers are
+  defined in 'dt-bindings/gce/<chip>-gce.h'.
+
 Some vaules of properties are defined in 'dt-bindings/gce/mt8173-gce.h',
 'dt-binding/gce/mt8183-gce.h' or 'dt-bindings/gce/mt6779-gce.h'. Such as
 sub-system ids, thread priority, event ids.
@@ -62,3 +66,14 @@ Example for a client device:
 					  <&gce SUBSYS_1401XXXX 0x2000 0x100>;
 		...
 	};
+
+Example for a client mutex node:
+	mutex: mutex@14020000 {
+		compatible = "mediatek,mt8173-disp-mutex";
+		reg = <0 0x14020000 0 0x1000>;
+		interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_LOW>;
+		power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
+		clocks = <&mmsys CLK_MM_MUTEX_32K>;
+		mediatek,gce-events = <CMDQ_EVENT_MUTEX0_STREAM_EOF>,
+				      <CMDQ_EVENT_MUTEX1_STREAM_EOF>;
+	};
-- 
2.32.0.288.g62a8d224e6-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
