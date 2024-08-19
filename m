Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E634FC3DA4A
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Aug 2024 12:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kb1adcHc3E8U+gSdouMJyc+8B8S5nqfJYg6YgFfK1Po=; b=lfzM8DoYoFJm7cEP0ZXpNyAXsg
	04VHKbeEU6szxXB4fcqSlonBkjnR40P3x33TjWuJwQ2dlBQfxgpvcbvCG099rbreWwmuYJknwUkp4
	NkzBS7OtMRfQrv71sQ+nBioTeXSML4bfA0eBqMPMRGSMIrZRWASjXBniiSgwvjGNFLNzQfo6nxI1q
	xUyJUGI0CjGicKOhOtiJX8Apj/l+hQDl7g29vb3uMWa1EjvZKG7XQx9G4E5cfIl6/CF+JUnt7Jr+2
	Sbg/XVhemmcGWw3zvAeSdNCrldVvt9Gr+WwgjLfTVziTOxyq9FA1I0ZWJb2X2n564Mvz+GxDqfl2y
	aBqI9yHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg1IC-00000001OYg-3v3D;
	Mon, 19 Aug 2024 12:15:25 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg1Ar-00000001Mbh-3Obp
	for linux-mediatek@lists.infradead.org;
	Mon, 19 Aug 2024 12:07:52 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-20227ba378eso11400385ad.0
        for <linux-mediatek@lists.infradead.org>; Mon, 19 Aug 2024 05:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724069268; x=1724674068; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kb1adcHc3E8U+gSdouMJyc+8B8S5nqfJYg6YgFfK1Po=;
        b=LCxJi79LnANgZXC6d0QpfJQNeoc5InEHKokSWojNk1XElD1Q3sYJL7FQPAxwzRNQyn
         QpKaJCLhF3Sq8i26rmcCTtXvpm1itU4Tr4FOkFcxQZyr8W9ID3GgklQleFwEheOK/vUu
         k8HPPOu91obsbGV6cuzhncM+IbPjofzd2GyLU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724069268; x=1724674068;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kb1adcHc3E8U+gSdouMJyc+8B8S5nqfJYg6YgFfK1Po=;
        b=dcpIQkxf4rZ67LDDomYPra1hiPhu6tF9isIptd1xHLConhCn++WIE03p2YfJLOzOMN
         N+0ay9OtOmKLom8GueuAujXUlHJmc+aRhmczt5+/21ZtLZjf5jeGJAjahMQSMFw7wRmb
         ow5FYAY8xjy0x94B6/fq3LZHno3UX6ALmSzq1cCUiTj7xXMh1l0bc9N9y8u9+c9RNDEl
         s9epIYOh2rXO+OdQl7Olnec69cTBN/2Bo+G2M94s3dJCd/jKE7xXrgBEFTyo4drUoRsr
         K3FLZ0HoO/DR+ncjp1S/q7R+dU1Kjj33RIMan9t5nhwuwrIGWkElSnhCPFGZ3K0DnRT2
         VQAg==
X-Forwarded-Encrypted: i=1; AJvYcCU4ZqwyP8bLyplx1KvAMaH+gnc/RNVl7EUr+3u472xnUNV8dMbjApNjsDS8oIvF2ZRuysTNk3rK8fIQLzmf8JBGovvuPsh40dccSFcXINIvXe7I
X-Gm-Message-State: AOJu0YynJD/sS2OyC+aAvOkCQl5/PMQOrcTopZbP7yo9TxoGci0lFTHL
	UVCDLy0PqWcRcbqmwAXt5eBUCu6izHZ2Swq1kuJOS9QoRBtGRmyu5FGHEiiqLg==
X-Google-Smtp-Source: AGHT+IEruytxR9BL+HNBSd/NfoQ9M+d1X+XJ4kW9Kd3kJNr04j3cPKnLo1htQAN7DL5PhvB2Vt1A0Q==
X-Received: by 2002:a17:902:f690:b0:202:47ca:fa1d with SMTP id d9443c01a7336-20247cafdd4mr34834745ad.50.1724069267993;
        Mon, 19 Aug 2024 05:07:47 -0700 (PDT)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:923a:77c1:913c:bcb8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201f02fab02sm61802005ad.48.2024.08.19.05.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 05:07:47 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	Pi-Hsun Shih <pihsun@chromium.org>,
	Jitao Shi <jitao.shi@mediatek.com>,
	Fabien Parent <fparent@baylibre.com>,
	Pin-yen Lin <treapking@chromium.org>
Subject: [RESEND PATCH v2 1/2] arm64: dts: mt8183: add dpi node to mt8183
Date: Mon, 19 Aug 2024 20:05:55 +0800
Message-ID: <20240819120735.1508789-1-treapking@chromium.org>
X-Mailer: git-send-email 2.46.0.184.g6999bdac58-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240819_050750_029096_25AEEDBB 
X-CRM114-Status: UNSURE (   9.11  )
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

From: Pi-Hsun Shih <pihsun@chromium.org>

Add dpi node to mt8183.

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
Signed-off-by: Fabien Parent <fparent@baylibre.com>
Signed-off-by: Pin-yen Lin <treapking@chromium.org>
---

(no changes since v1)

 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 267378fa46c0..266441e999f2 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -1836,6 +1836,17 @@ dsi0: dsi@14014000 {
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
2.46.0.184.g6999bdac58-goog


