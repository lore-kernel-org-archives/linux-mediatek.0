Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13BBCEE49BC
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Sep 2024 14:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dNJmlJuaspo2SJylGvarXYbq/qh4LXZFb+SB568Vu00=; b=Zr6B4JW/S87Wuf
	+6iclgN+xCgiFRDVlfiYFkRU1LsQA2zdSW5h83e3qCVzkY0pfWG2/5RQUYfscKxPNQJLPb/dDGMdT
	q+J5iiX6eIToG47SU3CWbusoL+80j9dosI4uXxA1Cu68ngid51jjI2mA6NNOR1FtryUwJWqecvDYK
	kqMMqCOdcRUoSUb182qEBzRasInugeQcQJrdg6xmRRzwmqcgVNWUS/JojxQIRuWA/UGjx0wQTT20q
	Z2u+Xd9cVCDadMts3xPPaUjqd6ZunULkghLhbJjcewKrZsWhIWfykIWWf0objpPKBXEW9nfb8PlGf
	jODbs1mMbgPmLoJ0TxzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soOjI-0000000A1hY-2tZn;
	Wed, 11 Sep 2024 14:54:00 +0000
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soORL-00000009wCo-0Ych
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Sep 2024 14:35:30 +0000
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-27b7a1480bdso924995fac.2
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Sep 2024 07:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726065326; x=1726670126; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dNJmlJuaspo2SJylGvarXYbq/qh4LXZFb+SB568Vu00=;
        b=iku0OSderSPEd6OL04PsPseXAkc70ma7p8gjif3q9x+VnVkyv97CvK7tQSonBwIB+Q
         tTgHPmXw823IX/LVlcrPBlvkgR/HB4i042eU9bQjEPXSn+yf+ng/4lbIauCi7Tz0hc7F
         hqU3u/7NbaaCI0uGYSuOa2eFEdES46OjNZ54w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726065326; x=1726670126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dNJmlJuaspo2SJylGvarXYbq/qh4LXZFb+SB568Vu00=;
        b=G2xh8B3IHpaCCc2QHc5w/2R0nm274M7J3dukJb43mJQQ7FXByT5fOEkhMo0tJ1OMBd
         N+rMd7+f5+6izc+AgLk5U8zKwTJnWMa6FUVAhOSSV8lOHfpN096BoDoD7/Hf/PKSsT+U
         0NTLnBlAlTQzHctdwVSjl5pTLI6WJVPcRub8KYojknKfA+cX28+Rt3zb55saHyYddNjj
         P4Pf4Nu5ddSpJKKy9UCxInk4dvSG4hkBEMppnuV//iEjV6sHwu1oTJ7Swef2FTGEmtT+
         n6N/MYuBuA7KyxRVSDWAnTXr7hy3ShY5YbKgpi1Ll78GhUm592+hYqEs78KXJATFyFdT
         k//w==
X-Forwarded-Encrypted: i=1; AJvYcCWxbaRFbpJ7Kwd4uA8ju3KYSTpXS6GTXyKG0RH3WbHTHN8E0eoMLBRVsIsZ2T/zzcPwYyMANsGTGrhXl7hUXw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzDIF/nbRbO0XGl+bMO5z6h50buv8tyoN1i9akNcAl+FuiHN2eR
	31hkqPwTofi+tGkoP5hWQ0I6rSKoBHxCidhz8y4Bm1uliXXFPyhYraJgpbW+6faLkr73FjzanY/
	Fcg==
X-Google-Smtp-Source: AGHT+IGME0UPIJahehavGen0dgvEatXYyewutMBmDSKHZzczItT4r7tLJ/JhZQ5wOmVfzQENAr9Cgw==
X-Received: by 2002:a05:6870:e416:b0:261:1b66:5ab1 with SMTP id 586e51a60fabf-27c1b5811dcmr2051517fac.21.1726065325607;
        Wed, 11 Sep 2024 07:35:25 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:102f:d738:6069:fd4b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db1fbb5901sm46620a12.24.2024.09.11.07.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 07:35:24 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v3 6/8] arm64: dts: mediatek: mt8188: Add SPMI support for PMIC control
Date: Wed, 11 Sep 2024 22:33:59 +0800
Message-ID: <20240911143429.850071-7-fshao@chromium.org>
X-Mailer: git-send-email 2.46.0.598.g6f2099f65c-goog
In-Reply-To: <20240911143429.850071-1-fshao@chromium.org>
References: <20240911143429.850071-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_073527_433143_8581CFBE 
X-CRM114-Status: UNSURE (   9.37  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add SPMI node for PMIC control on MT8188 SoC.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Fei Shao <fshao@chromium.org>
---

Changes in v3:
- Remove leading zeros in spmi reg size

 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index 61530f8c5599..a826ca4d10e3 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -1306,6 +1306,18 @@ pwrap: pwrap@10024000 {
 			clock-names = "spi", "wrap";
 		};
 
+		spmi: spmi@10027000 {
+			compatible = "mediatek,mt8188-spmi", "mediatek,mt8195-spmi";
+			reg = <0 0x10027000 0 0xe00>, <0 0x10029000 0 0x100>;
+			reg-names = "pmif", "spmimst";
+			assigned-clocks = <&topckgen CLK_TOP_SPMI_M_MST>;
+			assigned-clock-parents = <&topckgen CLK_TOP_ULPOSC1_D10>;
+			clocks = <&infracfg_ao CLK_INFRA_AO_PMIC_AP>,
+				 <&infracfg_ao CLK_INFRA_AO_PMIC_TMR>,
+				 <&topckgen CLK_TOP_SPMI_M_MST>;
+			clock-names = "pmif_sys_ck", "pmif_tmr_ck", "spmimst_clk_mux";
+		};
+
 		infra_iommu: iommu@10315000 {
 			compatible = "mediatek,mt8188-iommu-infra";
 			reg = <0 0x10315000 0 0x1000>;
-- 
2.46.0.598.g6f2099f65c-goog


