Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F313EE021C
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Sep 2024 09:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LHQzU6voJbzXuiTDRaTgUllQ8sZpGhRSONHnUPaSmxM=; b=CBdyhEo4q+GS4VDcv4aUZKMrZq
	t2er5J/pASMz9xHGir8KKspgCecR25RIINGLlzNa3qvAnK04qTPrtKLRyX2tHeZ3cwfZ9LzfP8yPv
	jAMr5BvZXAsvizRW/0QDeDqXMi9DaNvFMh9yVRGS7NMsgXGm6SieT2lZ75mA2Ox7Clz01d1UIIW7X
	jxbwq8D+QaexVlmiCbvaSn/ywInN9W7zKQgpuHyZC0i1biSKCnM6kJJfjfozQmphACtXGu84vXC7N
	7gTuX+syvvVmIW6IzLAzSJI1Nfu/c0rttQbiKfLMr9P35w7oLFpZW2ElBoXYt/eDg7Y1WM5euYxlm
	ETmrhHSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soJRh-00000008sCb-4865;
	Wed, 11 Sep 2024 09:15:30 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soJJe-00000008pW5-2tRk
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Sep 2024 09:07:14 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2055136b612so78995145ad.0
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Sep 2024 02:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726045629; x=1726650429; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LHQzU6voJbzXuiTDRaTgUllQ8sZpGhRSONHnUPaSmxM=;
        b=EuPZaspYnBoKl25QPXA3UNE0GrHu3eoBPQlJHd6UjjczaDRGSWrRTsug0uvHnO248U
         NDZxhx7Pt9ahUFwtwplLFDo9dKWvjDmmKKrE8RmBQQ1/kan1KIgA+3pHMRwE8z+GU04t
         Qx76Zl6juKO6+iFQf4We33Y8FTWLmvufb/eK8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726045629; x=1726650429;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LHQzU6voJbzXuiTDRaTgUllQ8sZpGhRSONHnUPaSmxM=;
        b=DwNw4NQ1627ZRN7zGCGmkeBaYr/SzEBCPZDC96Xz3VCpdyiH0NFQPjD5dEhf/B2iG/
         XRm7nUoGgG4e8cCysXT16tDYtukCcsLQaOX79H6wQYluOW6AhFTxjmPK2NPLjaiijVKT
         tQNYy8xR49O6GzICmKYEPYyhXBTxjP3ZJIv7agSwTYTLdhNbMoRT2Jq7BPJIPfCTIHXC
         wJ/81us9BT6avAKtz2MXQ6RzFacre3ObdpL/Dkv1okWaRjydN0/CAW6DiHfUFMSKfNYy
         R/nHJN2sfQLv4R6B7eRKDJHHpGfAhs0mkr22ZPIisc2H1yedndopkAwfEmfTWM4UxdRE
         LwGg==
X-Forwarded-Encrypted: i=1; AJvYcCXPVQdekyatP3aQBnRw0esNsi12yutZHp1IwJ/NKLca7XoOmYvWxSLf/FaXfxcQmD54AkKpzG4kcKtYx5nYKA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwwnfGkOriDQK6b2mvptQRmr6dKNVJqLKw+10IfHNGFGGwS46If
	Q7M7zNJqlglnCouhXvknAkVkyyZeL8D4ag9RLcBdW/U0qjPYZToJ5qZWCtYX3w==
X-Google-Smtp-Source: AGHT+IGAqhBnf0SV+Z4g8R5aeEMdIP4KrSDUmh2/nEUjwoIAX+w20TRCdHvWil8SF4ixwWnbOny16Q==
X-Received: by 2002:a17:903:2406:b0:206:b04e:71b3 with SMTP id d9443c01a7336-2074c6e1110mr61414455ad.51.1726045628992;
        Wed, 11 Sep 2024 02:07:08 -0700 (PDT)
Received: from yuanhsinte.c.googlers.com (30.191.80.34.bc.googleusercontent.com. [34.80.191.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20710eeb39asm59572495ad.154.2024.09.11.02.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 02:07:08 -0700 (PDT)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Wed, 11 Sep 2024 09:07:03 +0000
Subject: [PATCH v2] arm64: dts: mt8183: Add encoder node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240911-venc-v2-1-5566c07756fd@chromium.org>
X-B4-Tracking: v=1; b=H4sIALZd4WYC/y3Myw7CIBCF4VdpZi2GwVasK9/DdGG4lFkUzKBE0
 /DuYnX5n5x8K2TH5DKcuxXYFcqUYgu168CEW5ydINsalFS9HOUoiotG9FoORnvvB3uEdr2z8/T
 amOvUOlB+JH5vasHv+gdQ/oCCAoVFbb0dD2jN6WICp4Weyz7xDFOt9QPFUVXEmwAAAA==
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
X-CRM114-CacheID: sfid-20240911_020710_888672_E8CAE26A 
X-CRM114-Status: GOOD (  10.05  )
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
Changes in v2:
- Fix typo in dts 
- Rename clock-names to venc_sel to match dt-bindings
- Remove deprecated property: mediatek,larb
- Link to v1: https://lore.kernel.org/r/20240910-venc-v1-1-d17dfd931dc8@chromium.org
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index fbf145639b8c90b2c69da1cb4bac4f61ca7a1c9e..d33c0e4fdfc1132463c1d8f058a791fb2b06579c 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -1965,6 +1965,23 @@ larb4: larb@17010000 {
 			power-domains = <&spm MT8183_POWER_DOMAIN_VENC>;
 		};
 
+		vcodec_enc: vcodec@17020000 {
+			compatible = "mediatek,mt8183-vcodec-enc";
+			reg = <0 0x17020000 0 0x1000>;
+			interrupts = <GIC_SPI 247 IRQ_TYPE_LEVEL_LOW>;
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
+			clock-names = "venc_sel";
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


