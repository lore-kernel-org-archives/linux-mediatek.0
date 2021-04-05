Return-Path: <SRS0=PUi9=JC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7132EC433B4
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Apr 2021 20:09:26 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17A5D613BE
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Apr 2021 20:09:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17A5D613BE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ECTYNCFub0PSZFDx3o83l58utuT6ubs5E1oOgPxCUPA=; b=klHI2uaYI9yCV7dAn3XNzVlrZ
	FZ6XJzrd0wJ1RLcwXbuHsLZNE/GtRbhO9841eoW5mADRNJ7eH43LJk9EaHEpLqAWjSRqUwZhk7Hdh
	oqI0uW+sn409RUz4O8rK8863hi+h4oWQShVl2C/1BFUPh1L79NsfL0JIBlNIf3RpVQRj2UwVopXOV
	a4aQ5psYuHZ2DlVtbwdDbaflnZugxATiLAEejRUtYlleqYDhfV58QKVgISwyngnCWzq1YKfpEz0PG
	lvPRcXufKpnHs/a5bzE4vL95aChlLY3L6bp/Bkups4FjevHunFXlCWFngcv27RJaA6FDsy0/6Y+uu
	RF7nxlHqg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTVX5-000YHF-V3; Mon, 05 Apr 2021 20:09:12 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTVWQ-000Y34-7Z
 for linux-mediatek@lists.infradead.org; Mon, 05 Apr 2021 20:08:32 +0000
Received: by mail-wr1-x429.google.com with SMTP id v11so11880472wro.7
 for <linux-mediatek@lists.infradead.org>; Mon, 05 Apr 2021 13:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ufQs2y0GBwgw7m0MhJTgtFAbHPutYUxFjCpTMhooQfg=;
 b=MRq1WUxPFgF+Cs5EgYUOsD3R2vpiujpm+kGD9l34xo2KTiFNld0V9y1x5GNvacaVaG
 n9kl8wT6n0xT3lTK9SVx5XeEF9GK2WxYf5bLTuMJtSjpPVsJDHq7iiG1eoezrkeHiZ0r
 dg7sI2ADz9yVJ0oJhTk/DM28PboLllHecZTVQb/jI3USzDiITW+XYI295LuZd/6C37PS
 QcKse72YV/07gLbWCVAlwQ3ThVQOjWotlP9OcB8Jnc4UOiycKQxLRXt0nRWMXVze2hHw
 moPEZ9BUSkXcwpoTYpbnQyncKhkK2KtB7Ga82MR6kbEyXlNXq1r6ooeX+/S/0Peez6VE
 XFZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ufQs2y0GBwgw7m0MhJTgtFAbHPutYUxFjCpTMhooQfg=;
 b=Hxu68nM/l2k5vjeh4cLK34Cd/R/wjsaLnBEKdJYFEVw0dQMragEHVo0com20z0WMSX
 Zj1S9TLB48LtS0vv6Mi7wkCLVGahMRCOTSt877oK2M5+bbbChikPoafbqykS0b4MBpsW
 RBZcvzEsXUIXocZu7m7FT74uQU96IhmPxRgHoRUGfjc8RVIqXbku3JQaS2YFZV5/rzu+
 d04S9+nFS2tQs/w+1PfrBqaj5zxl2V5ahQ5P39YaeeIQn0EP9SVmxUY62xosQEpcBAjn
 WmUIw8v42bplxKBhSQtqLdMbcqI0pBlg8/Ga5yMoO++uPNMb9iiSMGnN7DD8wQNeCdv5
 Ugkw==
X-Gm-Message-State: AOAM5322Q6ld8UkKX2K5da+em2l8A0PRMYwZle/xxCJmNtk7mpofDyik
 6vUk9W+KHZzeeaxOlpqCN5OjNA==
X-Google-Smtp-Source: ABdhPJzEXHOtw1Doi7xuzKLw96hEFfLJr5a0TsJ0YqgqlCvQ2W5ad0fVOww5uP6iFptbJD0eje7BFQ==
X-Received: by 2002:a5d:558b:: with SMTP id i11mr30210250wrv.176.1617653309236; 
 Mon, 05 Apr 2021 13:08:29 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
 by smtp.gmail.com with ESMTPSA id v185sm609420wmb.25.2021.04.05.13.08.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Apr 2021 13:08:28 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: mkorpershoek@baylibre.com, Fabien Parent <fparent@baylibre.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] arm64: dts: mediatek: mt8167: add iommu node
Date: Mon,  5 Apr 2021 22:08:20 +0200
Message-Id: <20210405200821.2203458-4-fparent@baylibre.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210405200821.2203458-1-fparent@baylibre.com>
References: <20210405200821.2203458-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210405_210830_451125_762F9161 
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

Add node for the MT8167's IOMMU.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8167.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8167.dtsi b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
index 9b352031c5f6..3ba03ca749b2 100644
--- a/arch/arm64/boot/dts/mediatek/mt8167.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
@@ -173,5 +173,14 @@ larb2: larb@16010000 {
 			clock-names = "apb", "smi";
 			power-domains = <&spm MT8167_POWER_DOMAIN_VDEC>;
 		};
+
+		iommu: m4u@10203000 {
+			cell-index = <0>;
+			compatible = "mediatek,mt8167-m4u";
+			reg = <0 0x10203000 0 0x1000>;
+			mediatek,larbs = <&larb0 &larb1 &larb2>;
+			interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_LOW>;
+			#iommu-cells = <1>;
+		};
 	};
 };
-- 
2.31.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
