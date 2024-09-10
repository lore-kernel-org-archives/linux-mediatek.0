Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C21DECE564
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Sep 2024 06:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9NAqLSzfiTKu9/ujNb6PjoEVWXdaDlFqYoM8Sol5284=; b=CYv1kRSWI9zBlyytc0vKxlVCNt
	cLCUtWQthpUu79cV0NGdYYHm2gLYCJNCNLos1e70o8YJc/Jgn6JpEMSuCmne6DTMmgQZwcTklMgMh
	p2R3AHCZpy9JGx4lkxUY3MVn8pvXzsHJv782U1vW5Lg6qS5e0OJ8qLXNY6wgxTCpprYXs4vXRmMYp
	3Zq3tlONzbWktKw/Oa4FH+iD8Aq6MA+kaKRYdI3W5gRbg5KfFYN8/wAmGrcd/SftEXNQ6/K4gq4lO
	pHvv+CmaI26pWM+iorwteUIS8F0Sg+lVXb2NeoCLRowvqo0agdr5YK6H8+LZ/0ULiJjsWV2kk3aDl
	gwV15UXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snuGL-00000004R4k-1L0A;
	Tue, 10 Sep 2024 06:22:05 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snuFI-00000004QyH-2ZBQ
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Sep 2024 06:21:02 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-70b2421471aso3409337a12.0
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Sep 2024 23:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725949259; x=1726554059; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9NAqLSzfiTKu9/ujNb6PjoEVWXdaDlFqYoM8Sol5284=;
        b=REmd0b+w2mlVB6mv32RPzenTfNvEuHxpABKhdEMzFn/mTC7eOaE7VhFHqFIkhNLfiK
         K2aAVifjdJf+P25X+ee791P8HzTnfF3o0nPcSK+cRMlmmuXK1UcVRhGVWCOJx4cA8Bxj
         tNfM+1NZAJUEVjpBsviefE9dtHlp4pNSUjDp4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725949259; x=1726554059;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9NAqLSzfiTKu9/ujNb6PjoEVWXdaDlFqYoM8Sol5284=;
        b=n8ijNBl67EOB4biryrjM5RI7ggWSB1xwK4csy6rQTbcYTHWhogRNI/Kg8Y2SuBDZ6m
         +dRec8RioexTPeFhFMYFNwtJL0F0qieSu/Nap2uI6M88xO+SQcGHm9Sc0E055KbflHxQ
         7I41dn15qVq5xruGg+gvjcy3pzrSXBgkYByq18wV2xX6w2Pkn8FhHS44sS12CL6mybSx
         2pIuRttwPrV1LH2w95w0DVVV1uxS8U+rsASc9AwgmC21SjToqPmSdoQuNHrSnz1H4SCc
         LkbkjGeRGTexe8j22VwMxKjcIWy/9DmOsC1iXV+qQCjEdcZ1OlI+GTy4vNZAwdB0t8AR
         RwrA==
X-Forwarded-Encrypted: i=1; AJvYcCVGvshJFnsvPmP2sAlfMslh+lJGpcocsp353ZNvPflmgPWpq+DKK+sJFV9bl45WN56nrDpiY0uif0C7TA2zhg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwSDE/uzs592YxmZos8uZ5KzrJe9zP1Yc/L+qK0K49KUet06+aQ
	1jJvEuuVwS91uknFuZjmyxVh5wDzcWinFbu6G1tHUMic+bL9grk0HUATAUbaKg==
X-Google-Smtp-Source: AGHT+IEbJWi/XiTXkjvEqBmFZgc8Mp05CZ7p6lurFZhANudU33VAWtc+4cYuapG1rcW6R1YeF9lrEg==
X-Received: by 2002:a05:6a20:6f08:b0:1c4:9ef6:499b with SMTP id adf61e73a8af0-1cf1d13337amr13713739637.29.1725949259296;
        Mon, 09 Sep 2024 23:20:59 -0700 (PDT)
Received: from yuanhsinte.c.googlers.com (30.191.80.34.bc.googleusercontent.com. [34.80.191.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-719090b0397sm675188b3a.154.2024.09.09.23.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 23:20:58 -0700 (PDT)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Tue, 10 Sep 2024 06:20:55 +0000
Subject: [PATCH] arm64: dts: mt8183: Add encoder node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240910-venc-v1-1-d17dfd931dc8@chromium.org>
X-B4-Tracking: v=1; b=H4sIAEbl32YC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDSwNL3bLUvGRdE3MD02TztLQ00xQzJaDSgqLUtMwKsDHRsbW1AAWLZWl
 WAAAA
X-Change-ID: 20240909-venc-4705c7fff5d6
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Hsin-Te Yuan <yuanhsinte@chromium.org>
X-Mailer: b4 0.15-dev-7be4f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_232100_710138_580E2D48 
X-CRM114-Status: UNSURE (   9.32  )
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

Add encoder node.

Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
---
According to
https://lore.kernel.org/all/184d895c-239e-3f23-970e-6a9563235cd9@gmail.com/,
the encoder node of MT8183 should be added only after its dependency has
been accepted. Add the encoder node in this patch.
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index fbf145639b8c90b2c69da1cb4bac4f61ca7a1c9e..d24c89e4e13b0c74f549e638e97e0729052909a7 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -1965,6 +1965,24 @@ larb4: larb@17010000 {
 			power-domains = <&spm MT8183_POWER_DOMAIN_VENC>;
 		};
 
+		vcodec_enc: vcodec@17020000 {
+			compatible = "mediatek,mt8183-vcodec-enc";
+			reg = <0 0x17020000 0 0x1000>,
+			interrupts = <GIC_SPI 247 IRQ_TYPE_LEVEL_LOW>;
+			mediatek,larb = <&larb4>;
+			iommus = <&iommu M4U_PORT_VENC_REC>,
+				 <&iommu M4U_PORT_VENC_BSDMA>,
+				 <&iommu M4U_PORT_VENC_RD_COMV>,
+				 <&iommu M4U_PORT_VENC_CUR_LUMA>,
+				 <&iommu M4U_PORT_VENC_CUR_CHROMA>,
+				 <&iommu M4U_PORT_VENC_REF_LUMA>,
+				 <&iommu M4U_PORT_VENC_REF_CHROMA>;
+			mediatek,scp = <&scp>;
+			power-domains = <&spm MT8183_POWER_DOMAIN_VENC>;
+			clocks = <&vencsys CLK_VENC_VENC>;
+			clock-names = "MT_CG_VENC";
+		};
+
 		venc_jpg: jpeg-encoder@17030000 {
 			compatible = "mediatek,mt8183-jpgenc", "mediatek,mtk-jpgenc";
 			reg = <0 0x17030000 0 0x1000>;

---
base-commit: da3ea35007d0af457a0afc87e84fddaebc4e0b63
change-id: 20240909-venc-4705c7fff5d6

Best regards,
-- 
Hsin-Te Yuan <yuanhsinte@chromium.org>


