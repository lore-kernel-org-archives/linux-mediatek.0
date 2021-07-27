Return-Path: <SRS0=KH1D=MT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E8C6C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 11:15:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CBC161263
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 11:15:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4CBC161263
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UCyUB7/nRmmx+L2mBO3Y31S6fQ2MyuHyaDrmfRBtel8=; b=BK30fHhqASBsem
	Pl2bdJ+dawvG+9B4/GDAnkZVIbThFuh+jsQZ/kRFSquJD11VdOKyqNxJ8fQpG6bPFrrnh0u+chQKY
	DB8WibBBaWKbIdEfDt8f80ihQ+N3JH0uaqWqBkB55FyIaap/hsLAZRRxsO1rBQuT/qy4NAmhh4Hpp
	fRx7iyI/QZcHsfqKgOwN6TY7JVn9iJll20b/JQpLJ2w7suL9aP/rQUuVCQtArezIL9xmFpb4QxU4E
	x8ZFoKUdA+p5ccS6uSf4gfqJ3DXtJ7XJOZ4DM8GlI0QdbF0cqjpVdH1R2byJ8P+i7V2R55dE+0ZA+
	hGghiD5QE7gA7C0nsKGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8L3V-00EaNh-1H; Tue, 27 Jul 2021 11:15:25 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8L3H-00EaED-5c
 for linux-mediatek@lists.infradead.org; Tue, 27 Jul 2021 11:15:12 +0000
Received: by mail-pl1-x631.google.com with SMTP id d1so8105441pll.1
 for <linux-mediatek@lists.infradead.org>; Tue, 27 Jul 2021 04:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+kNbslq7vj9YiuOoktOVh6hBVXag9OQ/inx+NSoMTgg=;
 b=EKGqxJGnjY+bKuBecKb+9x9V4U/zyM+DfI9cY8TJhi7MREHhy+5CblfukvfTyY1GnK
 qLPMOn0NfI5IO1onW2adkZwW/WzOoH05UqDRSyeJKs5LkjOYVDEoomKGyJe01U66eDjT
 cDOB5epPM1W3XhF+rOhslBK60tOGTaMakKcCU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+kNbslq7vj9YiuOoktOVh6hBVXag9OQ/inx+NSoMTgg=;
 b=I5o9OeeMc39VP2gzrH6m8E3GW9NTOcI4E4E5ubCXQq3/MPCQeIpVhk5Y0IzBQvMAfT
 ykrintdGuHaEmz/HMqsXqJK5tM5OzpeKMfKEbLZjxpua07ldt12P817JqZyFuy/DlY6R
 9fkUVlvJNbug4PKEl+CxLmVsdvgQmHEv2DK3VEVZkQe2cv8RhnODrymgj0wrQLxwtzDQ
 5D7r/bCOp666cAG9xPSFY2v8HwKBbL751Tk2t+w13s0OeoJLPuSZN7FG6bSpn4ykDpwr
 jvyxaWk4Yr/KKIk+Q9IP5J1LriuiqJWiHeWV/r985UrCPuvfHs/7+jzYMAEuBY37U+5l
 q6vA==
X-Gm-Message-State: AOAM533hkZrYoA7qg7tmvc4b5hdV4qbLV+NU8qrrAJFgfxB1NPZ7TsOo
 tnEgT9icRmT2MK2W/qxxeY2iZQ==
X-Google-Smtp-Source: ABdhPJzkLIgghdfrbRoZrulmILkoZzo0xSTn37F9lFpSImUcxzYkhY/lOslEJ4rksKObpe9qSWZe7Q==
X-Received: by 2002:a63:5f55:: with SMTP id t82mr23038185pgb.226.1627384510116; 
 Tue, 27 Jul 2021 04:15:10 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:5176:76cc:2193:9b8f])
 by smtp.gmail.com with ESMTPSA id t1sm3362305pgp.42.2021.07.27.04.15.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 04:15:09 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Enric Balletbo Serra <eballetbo@gmail.com>, eizan@chromium.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] arm64: dts: mt8173: elm: Use aliases to mmc nodes
Date: Tue, 27 Jul 2021 19:15:02 +0800
Message-Id: <20210727111502.2506311-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.32.0.432.gabb21c7263-goog
In-Reply-To: <20210727111502.2506311-1-hsinyi@chromium.org>
References: <20210727111502.2506311-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210727_041511_251466_4AF029BB 
X-CRM114-Status: GOOD (  12.10  )
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

fa2d0aa96941 ("mmc: core: Allow setting slot index via device tree alias")
allows the use of aliases to number SD/MMC slots. This patch use aliases
to mmc nodes so the partition name for eMMC and SD card will be consistent
across boots.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index 21452c51a20a8..d5a2cad39c9c7 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -10,6 +10,12 @@
 #include "mt8173.dtsi"
 
 / {
+	aliases {
+		mmc0 = &mmc0;
+		mmc1 = &mmc1;
+		mmc2 = &mmc3;
+	};
+
 	memory@40000000 {
 		device_type = "memory";
 		reg = <0 0x40000000 0 0x80000000>;
-- 
2.32.0.432.gabb21c7263-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
