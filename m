Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 817D0CD1284
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Apr 2024 10:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mZUgXZ3l9DX2S4a80uAdGLWMlbvZfcEw87Whhx0PSEo=; b=C7BB2BMUgfxlLDSNYzXC2ael28
	biPdAC862DeYxm77wvAFH/aeODna++3zLg+pb5t8FLyC/6vM8ze5HKjuDFKsVy0nqsWo53Tko5NWp
	G1HFwqV80Czxxl7m46742UYysKIR/wE+54+wru1OjdYRNmablQL9maqyiUk/T2MS0U0U054QjMBty
	v6B/YuxnL6aeUqSZfeoFNAIac83wZ4JNi+O8nomorY60ZGQhEoPNK5m7wa1dE6kdxCfhNKsR51MfQ
	hu/hF0RrN+lX+E4UsUlmU1ib1LtyrPeX+53cNiSr+iSPjp4h8l4cuIcszTad0xdMUxtk+TahAunsu
	9aPdx3Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru8WL-00000001OzF-2tpX;
	Tue, 09 Apr 2024 10:16:06 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru8UR-00000001NiP-1UsB
	for linux-mediatek@lists.infradead.org;
	Tue, 09 Apr 2024 10:14:20 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2d87660d5c9so30837711fa.2
        for <linux-mediatek@lists.infradead.org>; Tue, 09 Apr 2024 03:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712657645; x=1713262445; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mZUgXZ3l9DX2S4a80uAdGLWMlbvZfcEw87Whhx0PSEo=;
        b=lRWyYq+efZ02qnheKYQF2jlC29mzT2MOsBQ5M0QvjokT+K8+Uw1z3YQO9nwkmLwVAG
         IkEkcJp5FlkVlsvlI33M3mZK6xyZ07KDuy0sZlF8lVq+CVXhinhDf2tbhfbWC7+x2Hym
         dat0raVDWURfRxSJ9ejM1oUi9+xba1QegCADfZavLWkMLRONID6edpPy49dIZMF+hHzw
         2zUnHzBBs1wCsepnVw1tTOeYILup/kM8nZ3xBAPuPBUGZ09/dJmOX/bnquPDlaRDfx8t
         aOPTrKWXAYbf91OiEwr8mrBI4fSbYbrwEkHY2GDGx0GsVl+upr8do0ydxPcqtkQPp8sG
         LL3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712657645; x=1713262445;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mZUgXZ3l9DX2S4a80uAdGLWMlbvZfcEw87Whhx0PSEo=;
        b=hq5jbX8PmenXtCMegc9yaMNwNGQw6CKnp7649z0OsDKleDh12yqghexZNZGSmVBUMy
         kxoa5t30oDr6aUpZyyzFxnqMjzhsOWR+Jy6EAYVbKLt33LAKQzsZdKgZbktwSve3Bm7a
         ohkbAslPHN6Ch1C5O6TrO1gC6hbLPSwSbDdwnJPmomCa+OHpEc1t1M401QYv8+yndEbx
         wKryJA6JY5sT60POzFEts/ri2mEc4uWFhFdSNKJMZsQskar/7ahDQDT46QOSPftQh43M
         Qsepd0rx1crHe2amVe97KaQFDekzNBLRoqS5gBL6+zh/WRHA+6SU8KD27YREYR7h/e2o
         yLzw==
X-Forwarded-Encrypted: i=1; AJvYcCU+OCKcXd3iu7ZgJnHBqxtle4FStuwMRh0DqNyPz06Aqpw/iZ+wGvomNXIESfi4bm/PW12bSpB63WUtUH0pnlH+axwkwGbjFHs9VnWFIoaHsKBz
X-Gm-Message-State: AOJu0Yxzyp12LkBuvkoBXCDI9xfFlQ5zMsgqwsfb8rikQMqIKJWnMUXd
	baYOrtMwMOQOiNoKFDQwO/RwCvu4AjQz6tpo8sR4OL1mbXAU2aYEI0X4/7WxyWY=
X-Google-Smtp-Source: AGHT+IENdUOHrGfs5r6bs+Wha4bn9SDjds7qLVwOQAcnUYwqRAeg46DX9D+xFYcRM1j81YaRR1bsjQ==
X-Received: by 2002:a2e:9891:0:b0:2d8:6e0b:8166 with SMTP id b17-20020a2e9891000000b002d86e0b8166mr7274355ljj.53.1712657645405;
        Tue, 09 Apr 2024 03:14:05 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id r7-20020a05600c458700b00416b035c2d8sm1124149wmo.3.2024.04.09.03.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 03:14:05 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 09 Apr 2024 12:13:37 +0200
Subject: [PATCH v2 16/18] arm64: dts: mediatek: add mt6357 audio codec
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v2-16-3043d483de0d@baylibre.com>
References: <20240226-audio-i350-v2-0-3043d483de0d@baylibre.com>
In-Reply-To: <20240226-audio-i350-v2-0-3043d483de0d@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lee Jones <lee@kernel.org>, Flora Fu <flora.fu@mediatek.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Rob Herring <robh@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=927; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=9JiWubCt7cv90b13bkV2NJN74YeswiFHCbXLjZUbZs4=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmFRTTG2fTNzUli3ntNCZsXBAHw4VMKqQOmZ8HnVyz
 451K1leJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZhUU0wAKCRArRkmdfjHURXv8D/
 4swIhESlxC/0lqHODwrAjRgviVRfhgvqxo+Th3OJ5EqCuB6mgn07DpwhYr39z6xFPQuZ8ACs5cVxq8
 0kiFqDuyuSy2SoPq1Q4Edcn/UxpUJsta1MghQ9tIrj90OMjJs2xIMXVhvOzwSz+DDwafKaTy+stV4T
 uxaKBpicLjp+mXYe4rF+wTkPCmsUJmEktncgNswuJ8o3WhLCNOTkv86LVKKLglyOPqocDKf5eOcwjX
 RjJZ6r7ctGH3SZp7eAbkR6vNdpW4uRh8UD9XREPqie93DW6HeSA+Ck87bNhY+wuDGbyKthzZiRp1J5
 hTlQ3TzYYgCl5muwUARI/jKr7PEefR9ebBfioTXeEqlAQKhIXyuA0qJxjCZUBW1ldstdI423VgezL9
 Uof0r7nHT1zTFI/Usd2NnJfZkqSgzQmRkmsVo+RAJ1zonBtJMghqJmLh4XwVB9YLvwqvSP4XMs6Qrt
 T1cPlTkMDyN344xkkYaEognTPRD8TnDrWyI4jXM8MUTypzDfM51S+kIjpUtPwcek4LD/22YjWZ87Wb
 esb5AjAp7WqMQ8c+BmYo906y9L6zAbCjk64FX61FpkTvl2aQksD8BSgYMVtEf8fad+82F/WpIGsSng
 7hxh43JcVhRMdEzpBrHIN5rEwic+qjEkWM+Y4gXlZELArf7DKwXVkjVXq+6A==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_031408_339510_E6913985 
X-CRM114-Status: GOOD (  12.37  )
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

Add audio codec support of MT6357 PMIC.
Update the file header.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt6357.dtsi | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt6357.dtsi b/arch/arm64/boot/dts/mediatek/mt6357.dtsi
index 3330a03c2f74..ade410851524 100644
--- a/arch/arm64/boot/dts/mediatek/mt6357.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6357.dtsi
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: (GPL-2.0 OR MIT)
 /*
  * Copyright (c) 2020 MediaTek Inc.
- * Copyright (c) 2023 BayLibre Inc.
+ * Copyright (c) 2024 BayLibre Inc.
  */
 
 #include <dt-bindings/input/input.h>
@@ -10,6 +10,9 @@ &pwrap {
 	mt6357_pmic: pmic {
 		compatible = "mediatek,mt6357";
 
+		mt6357_codec: codec {
+		};
+
 		regulators {
 			mt6357_vproc_reg: buck-vproc {
 				regulator-name = "vproc";

-- 
2.25.1


