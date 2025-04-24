Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D1ABC369AB
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Apr 2025 11:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a6nLuv544CgGW21n1DbIuZxhKW3jrit2HZOkiVGCAv4=; b=KbA2zeSb84CMFvluNCV8Dzflkn
	hbrZx7f5gcvkZ405qqAidZOPT88B87qbrWwY1GQHV2XCJh81SSFvjN6tXD5asFEFxvoc8hHK1GcoT
	1WD1a2at8YtB5uLUjiy1mBDd8z2zilnnxkVzukMe7WAoLPPuRCD8Mppzi5vFRDUb/I7sLrsHjtRNF
	bXySsI9lEJ5CWInOolSMQd49OOMgrIuEsNVQIqCftwmZJFXbWoSzRFGXdcYoEEsyF8FGCnWqGsltN
	7bO/8LDG7XjtfsjWQdCZwXmiD6O282RWKfBelXpJw7puZXuvsINP4jam5Ym3utgNG5AdWr7XB3Qwa
	p/TCs1Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7v1L-0000000DuOD-0UdW;
	Thu, 24 Apr 2025 11:45:35 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7tmM-0000000DfeH-0wxK
	for linux-mediatek@lists.infradead.org;
	Thu, 24 Apr 2025 10:26:03 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-227d6b530d8so8438525ad.3
        for <linux-mediatek@lists.infradead.org>; Thu, 24 Apr 2025 03:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745490361; x=1746095161; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a6nLuv544CgGW21n1DbIuZxhKW3jrit2HZOkiVGCAv4=;
        b=ExDYA1GWChNX/DE3L6I+0oFPM80QIk5SpklOg+aaASkvO3FkHR005r7TMBbA3gE3tR
         0VDd+Mz2KG0SQ9VCPTdxNsOekYoMeFCo+guQ0Z6jzZiIFjsd0rVVIM1R/jtHHqfNvCsD
         8enEoAZYGPcczLRDj3InSEu9MEYuA1o48R2Mk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745490361; x=1746095161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a6nLuv544CgGW21n1DbIuZxhKW3jrit2HZOkiVGCAv4=;
        b=Gsjof+ACs5paUx4EjMtfAPt4LfNeCUMMx1qEiAAHCkoH0dlmBQnxVepAHmXtDfxcPk
         BcKUTV1RRA0buPSF6zc966RV4bxRjTwXCbqdbMYXGh5x/IICI3RejelvXJNtPFb9RQ0e
         GfiYCXA5twaaSaNd+pI1bHKmzy77eOmqMgqD4Muxw3i1Gw4JBY8Bjc/Pc9PKngGkVsQP
         cxg17amL0AFAM91flyX5ni6xMfNfvtL7Mz4gUXmDD4KZOGKdafP+MaCAWBVmCX42jiEz
         lV3QmuRVsJGfY8ePuhHgpBgY19GGhMAZ0r1n6iTCpA2IGRLYOUXXg8LMhKtEBZLVBLcl
         hYKw==
X-Forwarded-Encrypted: i=1; AJvYcCX3Kux7mmfzGA9xhY825URRHsFtOlk05998PRAngCuh7TzjkUJSc3+AK2uOFMJebVM2Im3viU08zYH/gJzbhQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzvo2bDC1FlxWJsVabrCj5iBd3oPQgtRPsBzmEU9JR+lBqXKxCu
	yzxQ8vuRB3nIEnT61NVTqGXVrhJGQ3T1zS1xxLcfluFheYdjbje6j7lO0ZHqtA==
X-Gm-Gg: ASbGncuiNBNzZyJ2VDdIuAi2YX0LfJtwaCHCa1ntr5APiA+ft/qIaohnRZmAGAGvHCZ
	BX6P15whaTanDUToeQk9ThechrXww3fZt8OpPK/+R1MwXyP+KiKurFgpnnn7+xaagb7P6VLHEMC
	uhFAkwoHMdcWsNMbx4xK7BlT44qVJVsbezkVLG8yOleD3xwe6UQbCIn6h9QxlsUK6qEAkOyQEn8
	dvrQBC+khlzCqfGFKQFR4mqSa5tIv7wclg+F2QBxJA9OojQrsQL+YyrRcYMjA8ovhgpWYf3Fq6v
	OQ/HRTXHff+8g6JQlgECM13y2GlocFpxFKy9Pp59gou2zzggLFARsqCTQA==
X-Google-Smtp-Source: AGHT+IEelhbgbGZri6Py80kdsIiPuav90J0vW3iMX5g3fAzfa3TjO84nP2ENhMsx6DVzKWavR3GEDw==
X-Received: by 2002:a17:903:2311:b0:220:e9ac:e746 with SMTP id d9443c01a7336-22db3ded901mr33410315ad.53.1745490361492;
        Thu, 24 Apr 2025 03:26:01 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:fa13:e633:684b:257])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dda40fsm9680305ad.104.2025.04.24.03.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 03:26:01 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 13/13] arm64: dts: mediatek: mt8192-asurada: Reserve memory for audio frontend
Date: Thu, 24 Apr 2025 18:25:07 +0800
Message-ID: <20250424102509.1083185-14-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
In-Reply-To: <20250424102509.1083185-1-wenst@chromium.org>
References: <20250424102509.1083185-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_032602_257795_847BD890 
X-CRM114-Status: GOOD (  12.91  )
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

Some MediaTek platforms already reserve a small block of memory for the
audio frontend. These platforms reserve it at a fixed address, though it
is unclear if that is due to hardware access restrictions or simply
compacting the reserved memory blocks together.

Reserve the same size of memory on the MT8192 Asurada family as well, to
align with the other MediaTek-based ChromeOS platforms.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index 516fba9b3c6d..0574fe50468f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -199,6 +199,13 @@ reserved_memory: reserved-memory {
 		#size-cells = <2>;
 		ranges;
 
+		afe_dma_mem: audio-dma-pool {
+			compatible = "shared-dma-pool";
+			size = <0 0x100000>;
+			alignment = <0 0x10>;
+			no-map;
+		};
+
 		scp_mem_reserved: scp@50000000 {
 			compatible = "shared-dma-pool";
 			reg = <0 0x50000000 0 0x2900000>;
@@ -277,6 +284,10 @@ sound: sound {
 	};
 };
 
+&afe {
+	memory-region = <&afe_dma_mem>;
+};
+
 &dpi0 {
 	pinctrl-names = "sleep", "default";
 	pinctrl-0 = <&dpi_pin_default>;
-- 
2.49.0.805.g082f7c87e0-goog


