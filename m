Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1BDECE7D0D
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Oct 2024 11:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z8fXwFowiSq282GBggx76buGJQF3HVDXJm077wJTisA=; b=zmpurlqdcH0vPM
	l6K/SpB62qQUXy+MsoQov1Jtvu05hGa41D7D9HBOiKjf6GMKoZ9o8r9o3GBHq4Kq+Q3A/WgIcqO6F
	oF26m0VybkPeGyhkg29v46ncEaJVzsmH3vrfE024XmRzd7RKPKvx78I4XZiEYCA09EX1dGk4AGTe0
	2WMtLTNlOOc3RII+lpYqzL/k+1W2JMoIoOuySfV3Ihd+3ZSnv/Kiru4KCtrGNpaqanrWGi+YctIe0
	PRkqYuPG97+4hQqzIQS7nF9D/HwHXaBxo8nw7VB6XX3GS4PM2IeM8Dhs09osu+xmJQfjkQD+e66vI
	gEALKI5TYw0jy3EjNh3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svbLp-00000002ZpR-1nq1;
	Tue, 01 Oct 2024 11:47:33 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svb6Q-00000002WRh-2yVR
	for linux-mediatek@lists.infradead.org;
	Tue, 01 Oct 2024 11:31:40 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-71788bfe60eso3991235b3a.1
        for <linux-mediatek@lists.infradead.org>; Tue, 01 Oct 2024 04:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727782298; x=1728387098; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z8fXwFowiSq282GBggx76buGJQF3HVDXJm077wJTisA=;
        b=jCrmllnYlgYY15b7c+Bo9qL4+w/u1mhJ4Ll2OfsXI3SnwhU6s2ItpODFHw0RpipwXk
         JwDK4SFhDOmE7raF0hTZLlqxLr/WDC5K9Y5Wvrz6KKdnWx+1D/V5AtDrhYEeoXuEpkGk
         tX/KaGr0pbX7GwCghjRv/7C5EhW8O/Y7MeldQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727782298; x=1728387098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z8fXwFowiSq282GBggx76buGJQF3HVDXJm077wJTisA=;
        b=Nq6TSnW1jKEgiLFjaalcsn4ZNFyuNbQIWs/mAn9ZLxnrCdG3RKMZiR3TFa+N3wuSVg
         15JowLz5QTLJoMraOFJ5aX1c+bbXwgHdk2q69jxcFTkYTU0JoygyQ3e7ofyab9kDw4AK
         fCjKFDwBRuuV4sSeLrLu7wSz2PWMXjOFKlvtsGcglfwJs/JFFQmMc8ysWZP84cGEb0Kc
         bBhLrmaISznhPq3NvhjCzoQWx/0XtRbSSVFj5NfcWfPtHqSDWmJPBgnCL782QDq5ZQrt
         9UVBTMowW+4xOaokhbzCokyIR+wbeWgrHYVjXdiW/DJu/rO1QXqB9885+Kd6hcW2kw6U
         RM8g==
X-Forwarded-Encrypted: i=1; AJvYcCVQD6s9jrXDNemkUk3LXYG+9omOI6+jyW1DlzaZQqEvLX6fxZEs0Xa3+saKoCY5yvPX6q5vcih5wnhF3gAhmA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwuyFTRLzpBT5W8HgBgFSrxOb7kTii5RnY8WXoL2bA+Ml8G1RUH
	0bms0yQDs3ZKuNzAYaDZyXnCSu03b6YpE/tPluHZXG6IFkBWd9O4GI431DcTvw==
X-Google-Smtp-Source: AGHT+IH09z3QCZ1p0pTjFjuPslZ4C1g3IxE08k1hiNGnKInQp2WoOjwX15K0+Vnyd5cLS3+99kg5ug==
X-Received: by 2002:a05:6a00:17a9:b0:70d:2fb5:f996 with SMTP id d2e1a72fcca58-71b25f451e7mr23221279b3a.11.1727782298034;
        Tue, 01 Oct 2024 04:31:38 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:e044:f156:126b:d5c6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b264b63d9sm7810646b3a.52.2024.10.01.04.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 04:31:37 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 7/8] arm64: dts: mediatek: mt8188: Move vdec1 power domain under vdec0
Date: Tue,  1 Oct 2024 19:27:25 +0800
Message-ID: <20241001113052.3124869-8-fshao@chromium.org>
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
In-Reply-To: <20241001113052.3124869-1-fshao@chromium.org>
References: <20241001113052.3124869-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_043138_758348_0A6E8AC2 
X-CRM114-Status: GOOD (  11.68  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The MT8188 video decoder pipeline has two hardware IP blocks: LAT and
Core, which are powered by vdec0 and vdec1 power domains, respectively.

The hardware design includes a dependency between the vdec0 and vdec1
power domains to ensure that Core is powered down before LAT. Without
correctly describing this dependency in DT, the system will fail to
suspend.

As a comparable reference, MT8192 also uses the LAT + Core decoding
pipeline, and it has the correct power domain dependency defined in DT.

Update vdec1 as a sub-domain of vdec0 in MT8188 DT to reflect the
hardware design. Also, use more specific clock names for both power
domains.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

Changes in v2:
Revise commit message.

 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index 790315c1bdb3..ca50ed20fca0 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -1062,20 +1062,22 @@ power-domain@MT8188_POWER_DOMAIN_VPPSYS1 {
 							#power-domain-cells = <0>;
 						};
 
-						power-domain@MT8188_POWER_DOMAIN_VDEC1 {
-							reg = <MT8188_POWER_DOMAIN_VDEC1>;
-							clocks = <&vdecsys CLK_VDEC2_LARB1>;
-							clock-names = "ss-vdec";
-							mediatek,infracfg = <&infracfg_ao>;
-							#power-domain-cells = <0>;
-						};
-
 						power-domain@MT8188_POWER_DOMAIN_VDEC0 {
 							reg = <MT8188_POWER_DOMAIN_VDEC0>;
 							clocks = <&vdecsys_soc CLK_VDEC1_SOC_LARB1>;
-							clock-names = "ss-vdec";
+							clock-names = "ss-vdec1-soc-l1";
 							mediatek,infracfg = <&infracfg_ao>;
-							#power-domain-cells = <0>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+							#power-domain-cells = <1>;
+
+							power-domain@MT8188_POWER_DOMAIN_VDEC1 {
+								reg = <MT8188_POWER_DOMAIN_VDEC1>;
+								clocks = <&vdecsys CLK_VDEC2_LARB1>;
+								clock-names = "ss-vdec2-l1";
+								mediatek,infracfg = <&infracfg_ao>;
+								#power-domain-cells = <0>;
+							};
 						};
 
 						cam_vcore: power-domain@MT8188_POWER_DOMAIN_CAM_VCORE {
-- 
2.46.1.824.gd892dcdcdd-goog


