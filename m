Return-Path: <SRS0=Vqxm=DT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E54AC433E7
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Oct 2020 21:06:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23DD6206DC
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Oct 2020 21:06:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nJ43l+6r";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="17HX+CBl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 23DD6206DC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tPOGFh/0wePg0tgENyNR3Og79UVzKhz2GmmAfeYCYqo=; b=nJ43l+6r2Fy+rUNFvjVYsy7g5
	i4tnmqbIcY2I3v1+qZg4/+xPWeZ5m0CT0mY+YXq0Ro1ivd/gHesvfNFgdlsVopDodjjpnQ6kndIlQ
	jSP40XoziS5dng3sPPGxaHE4dNm6Wx7keBxpGponwhyOgH7EI0mt6KeR3vgWwRBZtDtIavnxUl3tk
	PPEcbnq3uWaW2J2Olr+2lN1qEV6tzZ6zQn4j61He4jT/uwAMPQ2zUT+PAzBDKqlwd64kEqtrgnECg
	Jdaasa+Lu1e191V8jz0T8Hbs4WATM62Oycg49rCjNg6AD5LSiebwwJr+6OmO3jpiWI0KsfHTPlTo5
	dET1eNOMw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kS51Q-0004JV-JR; Mon, 12 Oct 2020 21:06:20 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kS4o7-0006Mk-PL
 for linux-mediatek@lists.infradead.org; Mon, 12 Oct 2020 20:52:38 +0000
Received: by mail-wr1-x442.google.com with SMTP id s9so8771735wro.8
 for <linux-mediatek@lists.infradead.org>; Mon, 12 Oct 2020 13:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e+bkzKiAfFdHWo2iBUMur2DQuOMcGF3zo5qvmeIt97g=;
 b=17HX+CBl3cCBM8alB53y26WgGSoL4yOdOTcjv5H317ipfio7nzX8ecLju5ILpEI5EN
 VsxVuJSujCOxvw7fq0mDp/2Dgv52ZJTIIQb19saH7DtAo5qpg3tChqg9LVDrjN2Weyvy
 lAd50rifN+a/W7r/4Or3BhSU4izPchvEdBWItIk5lzLatuRPePwdT1UpdXlSlFQAMnsN
 YXoq5oXhCvHs4VFJocaCRnFiy6SGJzbou78OKfH604JXyekoYmWvAHnuO9yvrdBNKFN9
 rNusTFsKDIRfhZ7KO6P3kiaxVrY5Bo9uaHmuqGTFujq0MzdKrlnAGDU4fENxWa6QHSi1
 ZD4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e+bkzKiAfFdHWo2iBUMur2DQuOMcGF3zo5qvmeIt97g=;
 b=k/N/3doe1l5TjLoNYrLcZVX2ECKlmHbP5Qq0mSiJrj/DNCeW5dcUa3/TUhSslvCTUS
 M+sSKCnkR/ssfyf7uWMhPNDB4vpbvafDJlAFVnchBbpErItOE3rGWz3xHQwiTGwAzqmw
 eG9CO4dwbNzViVRkUnoCpWKyLS25J+vg90RjUOVgTLGUycbLSELxXn5jioyf94Akk/zA
 5BDp5vuEiIoA9Hp2p489zUGfGEwBdupMD4HG6fZwIO3VG0fIMpaZHQczaH/o3e29Mai8
 qE0RLxcnr6cYhuxvDAX0uhCyX/TE1DRJ5LBgI1xtQA4dA5SPbzrNJ8ytQqB2JY0Ymd41
 4IxQ==
X-Gm-Message-State: AOAM530y45Ysu+pxZ7CChuonGi9CXYe/JyIMuuvjnHv8DL9r9Ht727Yi
 /1Zy5u8i0bxxA7J798I32CT37w==
X-Google-Smtp-Source: ABdhPJxM+7DnCHKyvrcJBWveKSAlmwc8SbAavQH79tcH238Z72uusz7nKP34YEXTbOsLpmRNUG4YmQ==
X-Received: by 2002:adf:df07:: with SMTP id y7mr34659457wrl.347.1602535952752; 
 Mon, 12 Oct 2020 13:52:32 -0700 (PDT)
Received: from localhost.localdomain (170.175.185.81.rev.sfr.net.
 [81.185.175.170])
 by smtp.gmail.com with ESMTPSA id o184sm3623936wmo.37.2020.10.12.13.52.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 13:52:31 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-iio@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: mediatek: mt8516: add auxadc node
Date: Mon, 12 Oct 2020 22:52:18 +0200
Message-Id: <20201012205218.3010868-2-fparent@baylibre.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201012205218.3010868-1-fparent@baylibre.com>
References: <20201012205218.3010868-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201012_165236_159506_EC6EC8F8 
X-CRM114-Status: GOOD (  11.50  )
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
Cc: lars@metafoo.de, Fabien Parent <fparent@baylibre.com>, robh+dt@kernel.org,
 pmeerw@pmeerw.net, knaack.h@gmx.de, matthias.bgg@gmail.com, jic23@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add node for the auxadc IP. The IP is compatible with the one found
in MT8173 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8516.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8516.dtsi b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
index 89af661e7f63..943c426e9aaf 100644
--- a/arch/arm64/boot/dts/mediatek/mt8516.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
@@ -470,5 +470,15 @@ usb0_port: usb-phy@11110800 {
 				#phy-cells = <1>;
 			};
 		};
+
+		auxadc: adc@11003000 {
+			compatible = "mediatek,mt8516-auxadc",
+				     "mediatek,mt8173-auxadc";
+			reg = <0 0x11003000 0 0x1000>;
+			clocks = <&topckgen CLK_TOP_AUX_ADC>;
+			clock-names = "main";
+			#io-channel-cells = <1>;
+			status = "disabled";
+		};
 	};
 };
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
