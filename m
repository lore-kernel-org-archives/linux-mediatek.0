Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB1D7C2BD09
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jun 2024 20:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Xfb8qh56GtYXoD9jZvOPRH85DxPa0JeSyiOdHUBDC38=; b=qVi2YfbxW/H6DO
	EuRZWvovzPwrCSsYKldY7X+As+Dgbi1QD9ampjU9KXd6KERcwvx8cMqTv1bZynF78rgApqeTZUtdp
	wV8zIdu5NQcQlZVcP4PkbfCeJ3j/4ceAOeo+Z1g3kL3D5XHz/ZmXfD+1kN1v6RrCYg1dntZBvUjvF
	Dia/oaNRUnSFGa69xX6FHE2N5V7oyEkhKpyeodhA64dk4xlk55hGpq1j0l1MTRAZI4vCIszmoOQd3
	+tdM/tPWN+qK8soUYnQoXF1hhH79cYpnIWGeaPIouU8fIsgAmMwBt4QohWRTmNQRVSB2WrHWBxwlu
	Eu8b6jOmedsuKlFRCoMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMw7O-0000000Bh5x-1i25;
	Thu, 27 Jun 2024 20:53:22 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMw7E-0000000Bh4J-3v70;
	Thu, 27 Jun 2024 20:53:14 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4256742f67fso7549515e9.3;
        Thu, 27 Jun 2024 13:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719521591; x=1720126391; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xfb8qh56GtYXoD9jZvOPRH85DxPa0JeSyiOdHUBDC38=;
        b=SBWBXyS14IbMU9aEThuza8rVc2p7/EfkkXFwxVpcoMbPf5t/tXKjQY5uEBxg8/c3vy
         muCVoe4HhIrnwEcjFLTiqunRq4Hvr6X/KyUE6a/r/0VCcd3grER/SLmOCIkXIOPuZtR5
         uJbG3hJ1yh+/Km1PPDdWHrMb5So7LKo04Lh9jXuagnWB4r3HYi24pS0nu23KLMKyp3DH
         u+0sMeRLHsFB53xkX+RD1LAUUzC0eHuXf1AC7yY2eDl12GIBtvhUWDK7U0zjpB7FJnB6
         ho612iimkXawCgILAJaRWznyHCTkhfcSRz5XvDIy7ipmYvY5cCwmFg1oOUiIMVBEaybk
         nGqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719521591; x=1720126391;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xfb8qh56GtYXoD9jZvOPRH85DxPa0JeSyiOdHUBDC38=;
        b=u5hw3Mw5kHEhH5qDtTjBscbN8Gm4deTPRpoATJ3CnrxXz6/I8HM2MpIwQqvoe/9WMf
         8bvdii0xB4MZQLwrCn2xrlYwXweJGJa6G7XDRgqQpkmxYOAL4bTiaduAKIoMuxbJzXOm
         lnvTm+mWK4WcExYwIm+6uDsliuaRGZNlHQTkSaXl3GH6Z/ZMgeG7G0GjyXCZLoy4be0a
         DEOhY32QzEf/uUcFBFrAumBPHrt8FLJV9o+z9/qdANd3fAoC5jFUPfDWvzpy8XdDWWlP
         wPEe/4np//q988fwBADp4CmxVWTKBS+JgLxLx69hXQaz6/lCPIdlDd7u0+6SicSHs/ve
         gscw==
X-Forwarded-Encrypted: i=1; AJvYcCUp1EwgPQt0tYtuuhMBlLL0wxy20Fzpx3ntvxDynTbfSxq9n1/dJx0VFFA8HVy37sAWZBbI+x1AJUaU/jdoRpE0v9UAWOMLPrbTbDIC/OsOuBGZAIbMzz0LGAHLbVqW7R6lqB2P0sAmNiVxERSenPbIS/KvDm5mQOc=
X-Gm-Message-State: AOJu0YzgswBNPEeVWJ0/R4cT6PoRMJyyVIykSrcs+TuZuOg+h8QJR1hq
	pOgHK0KtICK2bPy0MA6QqrM2KZhXlHy7rop1c9KGQvzbfsFCZ40e
X-Google-Smtp-Source: AGHT+IEyFGnUG+ZaEsbZSSMkgKHiw+IpNLv9h1YAzb4VBZz9c2j4FW3QknMf/JcEiIHOYQfbwlYHow==
X-Received: by 2002:a05:600c:6a98:b0:425:5f86:41bf with SMTP id 5b1f17b1804b1-42564571f40mr24797395e9.30.1719521590820;
        Thu, 27 Jun 2024 13:53:10 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4256b068e93sm7216935e9.24.2024.06.27.13.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 13:53:10 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 1/2] arm64: dts: mediatek: mt7622: readd syscon to pciesys node
Date: Thu, 27 Jun 2024 22:52:56 +0200
Message-ID: <20240627205309.28742-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_135312_997535_8D0ABE64 
X-CRM114-Status: GOOD (  12.99  )
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
Cc: Christian Marangi <ansuelsmth@gmail.com>, stable@vger.kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Sata node reference the pciesys with the property mediatek,phy-node
and that is used as a syscon to access the pciesys regs.

Readd the syscon compatible to pciesys node to restore correct
functionality of the SATA interface.

Fixes: 3ba5a6159434 ("arm64: dts: mediatek: mt7622: fix clock controllers")
Reported-by: Frank Wunderlich <frank-w@public-files.de>
Co-developed-by: Frank Wunderlich <frank-w@public-files.de>
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Cc: stable@vger.kernel.org
---
 arch/arm64/boot/dts/mediatek/mt7622.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7622.dtsi b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
index 917fa39a74f8..bb0ec1edbe5b 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
@@ -790,7 +790,7 @@ u2port1: usb-phy@1a0c5000 {
 	};
 
 	pciesys: clock-controller@1a100800 {
-		compatible = "mediatek,mt7622-pciesys";
+		compatible = "mediatek,mt7622-pciesys", "syscon";
 		reg = <0 0x1a100800 0 0x1000>;
 		#clock-cells = <1>;
 		#reset-cells = <1>;
-- 
2.45.1


