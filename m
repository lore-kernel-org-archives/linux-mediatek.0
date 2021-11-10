Return-Path: <SRS0=x/8t=P5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CC44C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Nov 2021 19:24:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 570F06112E
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Nov 2021 19:24:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 570F06112E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7B5FqE/pOWVle2DZG6hsw2PgYCxhsE+7s0zxrMjSHmw=; b=bfDKQbzLboAvIQ
	UUm4x8R3wAxzliifwlbFFf0cS9uTr892NYdzmdk6lmE6iic8de0HfBtfFK2k2XRsqXI8ycf6t+qZj
	a4IF5JhMWBTGJFcCFGVdw8IxKdvCGMr2pm8WKVmBlzHOHWmgPQZ2MQq0IxHIXi6cWNwkaRHToKPkY
	2tMpT6h2MPnr9M05w643+hXI44zCek6/UMxM/cOnXTUmRnLyGgXvTQ7FiGP2ESfN7WCDVj+mTx9Dx
	VYb3V4WT6d3e3kbps+B10ro8jngHNO/5MnLmhgo+KcIt+67gWSdhA2i647BcnoZQB9bItrZwF8XJ3
	8TDdB+ZVVVuAjJh3dmoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mktD7-0068FV-8P; Wed, 10 Nov 2021 19:24:41 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mktD2-0068Dw-Bf
 for linux-mediatek@lists.infradead.org; Wed, 10 Nov 2021 19:24:38 +0000
Received: by mail-wr1-x433.google.com with SMTP id u1so5785704wru.13
 for <linux-mediatek@lists.infradead.org>; Wed, 10 Nov 2021 11:24:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZBcNPte2JXqPPCbEyKj3qBnsYEms5FQgmkXXyIOHj4o=;
 b=g1uERBZq8p2ygU7G/w6WcKWaEF0vsLuDSAM24vOncFKQu6RUj7RcLgPl5GXCxE+9pX
 4YpW4iLSPc96b7BKxII6r88zDn7HNPI9RjkhMn9T0sH6Oot09NPQb6fb4690M69mTiR/
 +ZQZmvO+Rw6QQUGOx2QUwK2eVOCzFtN5ir7wY0KH+6bITt8fkx21LrgIcZgtUEiwn4C8
 eBgIARzp/Vf3VvREVqCtloMZp/qVEf1Q+Q5jxIu4eSCikcUcVISJWI8bWnsMUgFZswLw
 EbCjKsIhWzabKpbpbEJCK9NoVSznd5ISCSt4jSw/1dtaDssSVaVFG4NjuDUu8T+PE4ZT
 o2tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZBcNPte2JXqPPCbEyKj3qBnsYEms5FQgmkXXyIOHj4o=;
 b=p+WQhCWtFJDkP24G49MTzuanUlfRoLE4OgwQGZ3p4D1Sl44pJgKZ3oVrDwjVkVvx3o
 stHA0LTenmQGwx5lPqDy5HimrWFqYe2oHy+XdmVnhRziRZ/hNdlhHgTa8v7k4Ue1aiAx
 Tulc4EWeSL54gbG9uh+OLdrIXRrw+rwz71fm618JJ6wtH/9vkdw0ZIIV3iFJolW1yGWv
 StPdv6jk/8c0c8BIkON/YhcehMgRTozJIc9XLXzlG5UT6s9LT/KROLnxAU2CKyFT+vuR
 +MMo8G1u6QqASF20NAOCUXlnEpCkGjX9E+a+BfsQ4GyNRpP/Z5nrNbEXIHxuvfB3OAIr
 7OOw==
X-Gm-Message-State: AOAM530Ci6AnCUtdkjGEhi5LrnIwLuW69/u+ISd/6QNvVKAG94OVLIg7
 WmRBMiA3NDj6z6C3sVDuODPiWQ==
X-Google-Smtp-Source: ABdhPJz2CFovYIbvWQjxyj3Y/wTT7TED3FY5M53+Mhy5pC+92jywXsPb6uDNVPidlkv4OHjR3R7s/g==
X-Received: by 2002:adf:eece:: with SMTP id a14mr1689076wrp.333.1636572274488; 
 Wed, 10 Nov 2021 11:24:34 -0800 (PST)
Received: from localhost.localdomain ([88.160.162.107])
 by smtp.gmail.com with ESMTPSA id d16sm6250113wmb.37.2021.11.10.11.24.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 11:24:34 -0800 (PST)
From: Fabien Parent <fparent@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Pi-Hsun Shih <pihsun@chromium.org>, Jitao Shi <jitao.shi@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] arm64: dts: mt8183: add dpi node to mt8183
Date: Wed, 10 Nov 2021 20:24:15 +0100
Message-Id: <20211110192417.4177741-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211110_112436_487729_731C5A6D 
X-CRM114-Status: UNSURE (   9.85  )
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

From: Pi-Hsun Shih <pihsun@chromium.org>

Add dpi node to mt8183.

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index ba4584faca5a..7c283c0b68b5 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -1443,6 +1443,17 @@ dsi0: dsi@14014000 {
 			phy-names = "dphy";
 		};
 
+		dpi0: dpi@14015000 {
+			compatible = "mediatek,mt8183-dpi";
+			reg = <0 0x14015000 0 0x1000>;
+			interrupts = <GIC_SPI 237 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
+			clocks = <&mmsys CLK_MM_DPI_IF>,
+				 <&mmsys CLK_MM_DPI_MM>,
+				 <&apmixedsys CLK_APMIXED_TVDPLL>;
+			clock-names = "pixel", "engine", "pll";
+		};
+
 		mutex: mutex@14016000 {
 			compatible = "mediatek,mt8183-disp-mutex";
 			reg = <0 0x14016000 0 0x1000>;
-- 
2.33.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
