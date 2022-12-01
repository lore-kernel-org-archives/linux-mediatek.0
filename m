Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53AA4C43217
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Dec 2022 08:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V298lkV5QtI9GGd+VqJ9vB4qdc38PxeAIxTF+s8oIPU=; b=TqzSBh3opSHABmf+4QQu+vdT0A
	2GRsgrwbX1qGpZM5NI49qZz4EWfaLfZVSlPxxoDHNOx4thLEZepiPxxE7KfGK7cO18TAfUSO91hxv
	4bGUGDhzvKh2Zf6zP98fij+JhsC9TAninBKRuYDnLhrmqQq5+eiq6weD633jAGaP1k/uFMVNqLYea
	uPYeksIadThgvu6Zj2wGK5N7Ejge2mGO1kg6ntKRQU6M2SnnCeBozFOGWh4pkUnhs+4Fvu2SAjWmr
	nMN0MkKnEwqcXhOvynff5vNyeiptqVKYYtJ8vv28kozehEdR2TQErU5T6hA4OXysL6YTC1QxDJ/Kk
	lt/+uzeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0fAv-005zJW-2B; Thu, 01 Dec 2022 08:44:09 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0f9a-005yb5-Cc
	for linux-mediatek@lists.infradead.org; Thu, 01 Dec 2022 08:42:47 +0000
Received: by mail-pl1-x62e.google.com with SMTP id jn7so969143plb.13
        for <linux-mediatek@lists.infradead.org>; Thu, 01 Dec 2022 00:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V298lkV5QtI9GGd+VqJ9vB4qdc38PxeAIxTF+s8oIPU=;
        b=HXNerBkWxszjzmqR+65CvsTOErf+iOTLkDjru19S6a7Uz08AbN/rnneQjLsuIJvrwr
         Dg4WpD9aZ6NDY+2mQzKl90XlI6RelVXlXhdV3g6eI1GbO5rHFK0JkQSA/Uh9EvY/A0St
         ykQNoytvUS9qE6UxB7Ts+ItS8hkq2vLt19GbE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V298lkV5QtI9GGd+VqJ9vB4qdc38PxeAIxTF+s8oIPU=;
        b=i1T7ooAHfsM8uHUpAnKNOJ5ZNUdsiT5FoITFsWcjiI2xiNG/3wid2d16c8dnA2f5bY
         ClTpWR5KdCdknSHw3v3/IUkS0PVIY+x7kqNSSmk0FffBrjc08sFOtbfFrVfnH0xvp6Lo
         Vgm0FoDaGk2OscPHWPEAaQw/SpmIMjkJCMyRdcqaww4EYf52o/DHoWhbUfYfznlL4W+k
         ct1r3Vvsf+Dpax0snkjiTQlsLsKn4W9YQ4ksAvVcrNCBIzOUaxZxueG52NDCqNDheOqf
         UX6oCvSvfhPdfrqsrjvCat1D+Fmh76ri9+ZaHqYIN261H86EPdbg2yeN4ijvq1KhxNQO
         kXDQ==
X-Gm-Message-State: ANoB5pm42azoW5t2jO4YD6SiTSDAqgre9TtDgekOBqgOvvv2A07v/h2H
	QlUVaewvNI9RGlx+MQhS0nRwMQ==
X-Google-Smtp-Source: AA0mqf665+1a7uoBaUKEuv2A7tuu9y7S3ALImhvKQOwgh7iwjPQZ077I2pm6cCd4wI2XcxO8yLOpyQ==
X-Received: by 2002:a17:90a:4594:b0:218:f745:76fe with SMTP id v20-20020a17090a459400b00218f74576femr37452609pjg.245.1669884163980;
        Thu, 01 Dec 2022 00:42:43 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:2416:fa4e:4eeb:fcde])
        by smtp.gmail.com with ESMTPSA id j5-20020a170902690500b001708c4ebbaesm2932293plk.309.2022.12.01.00.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 00:42:43 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>
Subject: [PATCH 4/4] arm64: dts: mediatek: mt8186: Fix systimer 13 MHz clock description
Date: Thu,  1 Dec 2022 16:42:29 +0800
Message-Id: <20221201084229.3464449-5-wenst@chromium.org>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
In-Reply-To: <20221201084229.3464449-1-wenst@chromium.org>
References: <20221201084229.3464449-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_004246_459099_2DE79398 
X-CRM114-Status: UNSURE (   9.94  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The systimer block derives its 13 MHz clock by dividing the main 26 MHz
oscillator clock by 2 internally. The 13 MHz clock is not a separate
oscillator.

Fix this by making the 13 MHz clock a divide-by-2 fixed factor clock,
taking its input from the main 26 MHz oscillator.

Fixes: 2e78620b1350 ("arm64: dts: Add MediaTek MT8186 dts and evaluation board and Makefile")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
index 4a2f7ad3c6f0..209f26f12dbc 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
@@ -215,10 +215,12 @@ l3_0: l3-cache {
 		};
 	};
 
-	clk13m: oscillator-13m {
-		compatible = "fixed-clock";
+	clk13m: fixed-factor-clock-13m {
+		compatible = "fixed-factor-clock";
 		#clock-cells = <0>;
-		clock-frequency = <13000000>;
+		clocks = <&clk26m>;
+		clock-div = <2>;
+		clock-mult = <1>;
 		clock-output-names = "clk13m";
 	};
 
-- 
2.38.1.584.g0f3c55d4c2-goog


