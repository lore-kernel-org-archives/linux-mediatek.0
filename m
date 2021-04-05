Return-Path: <SRS0=PUi9=JC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DD9DC433ED
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Apr 2021 20:09:04 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFBD0613BE
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Apr 2021 20:09:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BFBD0613BE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6XK1SVxLdpyxuegSwk8j/zIoaNs3sEOSj0z0Z8f+QvI=; b=fDNv+hKl8Ukb3Rkmn6TDJ/WdZ
	LdJVeGQruVyFP/Q9c1OplMbmF5girzwL1Ene6y8fTojVflVFHrVh0X0BbOQ3d1+E/ZRjr194RqiLo
	6dpttns6WfwLYGB83YVyOIfCAPsdYnGuI+H6H00nETk6HhVZRSxqx2llb5lxIAi4B5FfLwsIY8gDz
	Bfhc9g2acpoJ8xnHEr8lT4d9LgBSIKSWEvn+gcmzBuTsppHw8XLkGUF2nFQg88Mp/LPDz+RpBAdZb
	Sa099MEcxobpkxgq9izN1RE59sNJ2AR+UA5ALfEE6qEcMQb1bovRK3fmTV6m+K4gqPv9lX+YLkJII
	TFUqPzmLw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTVWk-000Y9s-D4; Mon, 05 Apr 2021 20:08:50 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTVWO-000Y18-3Q
 for linux-mediatek@lists.infradead.org; Mon, 05 Apr 2021 20:08:30 +0000
Received: by mail-wm1-x32b.google.com with SMTP id
 f22-20020a7bc8d60000b029010c024a1407so8123418wml.2
 for <linux-mediatek@lists.infradead.org>; Mon, 05 Apr 2021 13:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8aknEMXfHwgN2+JZLeFSPHnrU6CH5XTJuE/06jhcA4M=;
 b=PeMmuOhPfspxHBXQBSuaj+W2sB7MTucUvkDloX4KsqMG5rMb8sTP7aROvNS+Gka7qb
 WUj8as9h5MfSEWB4jkxHpaOVzbN2SOWFTueVB3rObZ6IGLNQUogIhEqB8V9MTjSwZ+vg
 XlUxk5+sCp4l3fhbVpulvFSTrqbGeoV7T1cbaUzOFjfVf50fPGi3FfOPqa83TAXB0/Y8
 WATdKCCeoSZeOOqLCgmJ+LKff428wbCuoZCpWZTiOXWkxaYA/5f+lsLA+f+BD7Cd7Pdh
 vpiR92fJ1S6XBbuCHhJy5yeddomOSuzZ4NI4llOFRZevhS2xNLPghAxoKbj6ow1yEQkw
 JmDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8aknEMXfHwgN2+JZLeFSPHnrU6CH5XTJuE/06jhcA4M=;
 b=dnwJsRuF431Vvc8PoY+1p0FxRiAWnKCbL0IbWA28CwU/SgxLfY52RHsKXHMFhcmKYk
 3m8aZBAuRsKVJcVHsMEQ5RXatzsKoTJcToYdXTZy2N5EXKJji1mGX7MCEa+zrmGp8yaE
 vOyT6cl0XoX+lYaUHp2mGPV66sxh8ZoPwVOCT6MKceM6YQnov3uZwibJ/GUipC/5DH1F
 1WGAj0wENMqfytWAUX1F/wXphf/MQZuxET3H1ctFYf/JN3vdhulKVGAfGxHZnrrbTY2k
 pIWNoDGi807EoGaWktIhSEgMrePYrfkwMLMjutZKN3OI86eJbOW59RxyDUb0KodS4rgC
 l0lg==
X-Gm-Message-State: AOAM533l12lvwOIu8lE6jpSbrLGBGhujO1DDf/T4pgzEuI3CVE1pTnJ6
 A1+up8O5T+rRYt3tHVIcuR8Adg==
X-Google-Smtp-Source: ABdhPJzPj8X6QTxHPnI9UzmRqR2H2VyXqprQJZiKTL4Sys9bnTOxc1P7fNfj75aFRhkg1Gxn6jMDlQ==
X-Received: by 2002:a1c:197:: with SMTP id 145mr727322wmb.48.1617653306403;
 Mon, 05 Apr 2021 13:08:26 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
 by smtp.gmail.com with ESMTPSA id v185sm609420wmb.25.2021.04.05.13.08.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Apr 2021 13:08:25 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: mkorpershoek@baylibre.com, Fabien Parent <fparent@baylibre.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] arm64: dts: mediatek: mt8167: add smi_common node
Date: Mon,  5 Apr 2021 22:08:18 +0200
Message-Id: <20210405200821.2203458-2-fparent@baylibre.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210405200821.2203458-1-fparent@baylibre.com>
References: <20210405200821.2203458-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210405_210828_284129_A8DFEEC7 
X-CRM114-Status: UNSURE (   9.00  )
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

Add the smi_common node.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8167.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8167.dtsi b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
index 9d765034dfb0..4b951f81db9e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8167.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
@@ -131,5 +131,14 @@ mmsys: mmsys@14000000 {
 			reg = <0 0x14000000 0 0x1000>;
 			#clock-cells = <1>;
 		};
+
+		smi_common: smi@14017000 {
+			compatible = "mediatek,mt8167-smi-common";
+			reg = <0 0x14017000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_SMI_COMMON>,
+				 <&mmsys CLK_MM_SMI_COMMON>;
+			clock-names = "apb", "smi";
+			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
+		};
 	};
 };
-- 
2.31.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
