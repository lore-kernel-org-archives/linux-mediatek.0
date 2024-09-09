Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CE6FECE579
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Sep 2024 12:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ckgyamt9fIAy8TE1Yk1YBjU42OpcFXF6RxP0WQ2W6QI=; b=4I/M1i0mCYbQra
	cLrN7IAjvsgxDNtmOhdyuFujSeMr32RBNv+8l+Qpxrh7CWAqijBRvnS8NzmOuCa/pYOO/H+fdfDRw
	09N+SlWHacgg/rwtsruZ6JlnBiCtpCgy67kWIQOTcOAzA9aYEeYUFGTlCxaxglF7ojYzJ0bO3VvgO
	IbcVmUtS4C3VPt/BkzmKWZOaXypNXIgaboYYQiHju4qPnZvEsj+dfBkkaAwEiiAOzaC/WtHe9qRbJ
	tF0A3klvrzXh+YrRNECZ32gAnngjZublGgYvAmbY6v/VicmB0LN9IfAjbNXN1YoXDsBGWxmhBSinF
	IpvmvKqUgpbUcHR5uMTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sndnS-00000001uCg-0emS;
	Mon, 09 Sep 2024 12:47:10 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sncPR-00000001dLu-0osZ
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Sep 2024 11:18:19 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-207115e3056so12089515ad.2
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Sep 2024 04:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725880696; x=1726485496; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ckgyamt9fIAy8TE1Yk1YBjU42OpcFXF6RxP0WQ2W6QI=;
        b=hJZCjfL2kJUJcPylSi3eazOxXJnzBtFnaN8vpP4lGDAMCsy5L7h/AAh5t3JCMWGaUV
         XUsbHzSySwZ9SFBJwGTKwK2DbbefbvK8vkl1307uko2RRzG5ubKx4DaN45mGwUfHgOWO
         pxzNQtsxDgjOlaEMzho/Lh+Elo05quJGKa4T0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725880696; x=1726485496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ckgyamt9fIAy8TE1Yk1YBjU42OpcFXF6RxP0WQ2W6QI=;
        b=fU0eC+VMX4QOdxbLlXMED6yxpN9E/TbyG+kNO856l3O9frteTJUGrs8Qd3iaZomFNH
         jxvQxJUZ971sO6Fmjp2iVRPlMY0qGM18m91nQJPL3TeIP4rKOgnCVYPf1fcf+LLLic7T
         GRpxeRjHW/XtqDryFv/jLQjs56dq43t5q1c4xx2doZLlH3IIvQxkHtl5TXH34FD7xRhN
         j/VhZFuz/JtzsgCI4iN0j2wNPKnt6Px+qEtwWwSYOAC+IZYksvEsRUM9C/7Dr15p2Yus
         24X7BWeLZFyXPiJIiOLs/TVEH//MzBz3KxUuD71/1ugJWCTkigjOorAb8Y4FKA9mKkOJ
         9cPg==
X-Forwarded-Encrypted: i=1; AJvYcCVEWLruAP46KHE3i6K5ShEuUoGaG6KQJfB/en8ikd3PavqQiuyv6aEnHVRKRa8DPGz+a1NuqKrG8I2x082GnA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwVLNN+ZVP79TtMKYEEO80//f9a76089oZTvSzqYTMFrLIsDtMm
	3lyVxN7SGcMPcR3FiiQcvnd21/IBTrWB7ac0jQze+1lrkQZG4KThYbWU9XUZRw==
X-Google-Smtp-Source: AGHT+IFRpkGOOqIZHwaCAgwZfgwkno7RZN67aHUXn/a4/ib3Hspbmk92vpL01CBwnX4m3qWy82ITrg==
X-Received: by 2002:a17:902:ea12:b0:207:1826:2f0d with SMTP id d9443c01a7336-20718262f70mr43516725ad.59.1725880696573;
        Mon, 09 Sep 2024 04:18:16 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:6647:6d5f:dd48:8f5c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20710f1dc55sm32039745ad.186.2024.09.09.04.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 04:18:16 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 11/13] arm64: dts: mediatek: mt8188: Add SPMI support for PMIC control
Date: Mon,  9 Sep 2024 19:14:24 +0800
Message-ID: <20240909111535.528624-12-fshao@chromium.org>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
In-Reply-To: <20240909111535.528624-1-fshao@chromium.org>
References: <20240909111535.528624-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_041817_297423_8843F63A 
X-CRM114-Status: UNSURE (   9.29  )
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

Signed-off-by: Fei Shao <fshao@chromium.org>
---

 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index 4593bc1fb5b7..08f13ccefcfc 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -1311,6 +1311,18 @@ pwrap: pwrap@10024000 {
 			clock-names = "spi", "wrap";
 		};
 
+		spmi: spmi@10027000 {
+			compatible = "mediatek,mt8188-spmi", "mediatek,mt8195-spmi";
+			reg = <0 0x10027000 0 0x000e00>, <0 0x10029000 0 0x000100>;
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
2.46.0.469.g59c65b2a67-goog


