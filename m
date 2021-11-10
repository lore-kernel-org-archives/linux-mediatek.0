Return-Path: <SRS0=x/8t=P5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EB94C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Nov 2021 06:31:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C9A9610CF
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Nov 2021 06:31:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5C9A9610CF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nmgJS5WGEiZxvRBTj5UkdsAzOMuqVPN6mtBrzniOYrI=; b=Z2e0SRI1FoiYTB
	LMoGOM7OLqz5wp5JUSf1KfVPzc/tbusb+jtBd6txLy0aUTL27YSntW6kapaE/AvpSvMFupqVsHc8A
	5Bim+tLeGGN/1EOW43Ea35flzl54hHlxy0ZyWyQCHLjgftw7RpGpOHg9GETp+5/1jS/ijzdvP4hro
	DM6TR8EwxJbR3NRDRl/KrzQZKsAREoc/jfm9PD7hJV4M7Y+4njtStaAZ++Kp/DIwpzKNJpSFWmFhn
	8+Ae2bEoJSVMbDUkYBfMgffuTr780/hun2Haxa4rlYy0yOvfE+p1WpGJG5k3cvypqR+a8JKpYr8Au
	Xdv4/pjWtd712x6DnxEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkh8o-004ZRo-GG; Wed, 10 Nov 2021 06:31:26 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkh8m-004ZQ2-6q
 for linux-mediatek@lists.infradead.org; Wed, 10 Nov 2021 06:31:25 +0000
Received: by mail-pg1-x52a.google.com with SMTP id s136so1366211pgs.4
 for <linux-mediatek@lists.infradead.org>; Tue, 09 Nov 2021 22:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RLjicxNmNpYNSdlDLoBw1hRqse8yPujz3RAWyTpfEac=;
 b=Gtn4k4zzu3W6ljfQD1cvBo1rwiOcUgXBRBafENUqpx5Wk3/Elt1T+pI3Pmb7uAQnay
 P6Z+NUHvKTtOQN4Ek9pvPReyXFOBSlulbtA6qYgiH/tbNY+puEmzxNzDvYiQ0Fn6vEin
 rZaEP67DtUT74PfPez9hZt2FVTWSGkBj+9X2Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RLjicxNmNpYNSdlDLoBw1hRqse8yPujz3RAWyTpfEac=;
 b=1O5elY5PvaYVl5lVnOB2wPSEdX4PkA08b/7egrQg0ZUTANNE0qStDADLcDxZ41gkE9
 NdIJCcsojyg4IritYmnaKMCY26nkanN+Chuz89lurTteyK6n7DDrn26KfHKD9m6qMRkJ
 KLcmw7j9DuvFK421Gx8YUIDjmdcyOx4sbi/WDKtS2ThzOQjQTzxx1rmoloFPAu4dvE3U
 ufajaXG6lqbAMQ1RsmXLqWvbi52Oole0OJBaSTWrm2rVhK1nGzJ4buT1tVVK3T5njgj1
 Z+5I3cw5z+bWxUXEBKy8+tZy53C7okChAVfivd4kKQqHH6L+q/xs43Ip6EuijsRoJJ3M
 oJ9Q==
X-Gm-Message-State: AOAM531PuFGlN3GQ87Vn3+LfeeuVOgvaSp5fpqTFisMfOcfMD4zL1WpA
 m9dkIJxLzrfV5nm7wEGQlCEQBw==
X-Google-Smtp-Source: ABdhPJwh/XmhIgwBxJwYcav1VPaKKJl7gxfyiZhW7q0qH/IvtJeKhRTimzl4lnxVJpIpXTwItejE0g==
X-Received: by 2002:a62:1d8e:0:b0:481:598:eb97 with SMTP id
 d136-20020a621d8e000000b004810598eb97mr14860418pfd.39.1636525882526; 
 Tue, 09 Nov 2021 22:31:22 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:6886:f712:1a79:e3d9])
 by smtp.gmail.com with ESMTPSA id w1sm15623959pgb.50.2021.11.09.22.31.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 22:31:22 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/7] arm64: dts: mt8183: jacuzzi: remove unused ddc-i2c-bus
Date: Wed, 10 Nov 2021 14:31:12 +0800
Message-Id: <20211110063118.3412564-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.34.0.rc0.344.g81b53c2807-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_223124_292243_66AB4D4D 
X-CRM114-Status: UNSURE (   9.59  )
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

EDID is read from bridge, so the ddc-i2c-bus is unused.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
index d8826c82bcda29..8f7bf33f607da2 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
@@ -9,7 +9,6 @@ / {
 	panel: panel {
 		compatible = "auo,b116xw03";
 		power-supply = <&pp3300_panel>;
-		ddc-i2c-bus = <&i2c4>;
 		backlight = <&backlight_lcd0>;
 
 		port {
-- 
2.34.0.rc0.344.g81b53c2807-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
