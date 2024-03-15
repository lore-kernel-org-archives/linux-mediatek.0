Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94ABCC54E69
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Mar 2024 11:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ViN1BNw9ywWRFA76/0dzsoN+2iKy9AGYS37opt3AHyU=; b=zcJqnH7HV0FGsnjSbK8esXjwfu
	ze2jITG9CxehSJwhbMf+Ub8zmhZ/+dxfMGeB9tZ0Uo8WRBeCl/K8RvqTNbXdcmx2TcCiGqoNVHvmQ
	xbDHnmvUpZ/Zxx9AUvW9luLp1XYjpYVeMJ5KncYU+4hPa2+ngSLTpFRdrPkLOXiFCEAEUtl0QZPao
	U1xO0prRmVL8Mbv3DVbz3Smob5Te8Y1ApYCcD/RwhO7Ak8VpMYsZZNcUYYJORV4ogSLECmRkWDhlM
	niCGl2apExG90d1+M07k5EE/7iX8n8ihbqtuaSRO1yR4MKO2In9OK8C7nIDfs7ld89hnaYiRVMkzL
	bPPrLJMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl5YI-0000000HaSs-0mib;
	Fri, 15 Mar 2024 11:16:42 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl5YB-0000000HaNu-1c3l
	for linux-mediatek@lists.infradead.org;
	Fri, 15 Mar 2024 11:16:36 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6e622b46f45so1615818b3a.1
        for <linux-mediatek@lists.infradead.org>; Fri, 15 Mar 2024 04:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1710501393; x=1711106193; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ViN1BNw9ywWRFA76/0dzsoN+2iKy9AGYS37opt3AHyU=;
        b=CyjkWIx+KWks3OQxj25DQsdQJ+KMEW7+UpRKEjwgSl2YokrFEApIvsLYmpe21CtOr4
         t4ufjbTcrDnTgK7pM2pZrcBGSJZ/8HDmyPVr2eLO3UKUgOyOmyKH1gPhUD8YEObs+f04
         hsPGvoY0xlAUkYNydbm9OOaCkTpIDCKZ6JVrQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710501393; x=1711106193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ViN1BNw9ywWRFA76/0dzsoN+2iKy9AGYS37opt3AHyU=;
        b=XrnkZmZC1pgkVHwG32I3QYTt6mD0i/Ol2J93WSM7iXjoabBaYqI0TbSvGAdXAOmXC/
         /eH+CTeIxUMSCsjTZ6msy5oojoVCpiEKtpDu0+twU423kE4VJxtixBCGlunFqqByR6r+
         d9rKSJMphzB8AcYaqeYNXCf4QzwK87+PgZRChS46NPJrxYCLVMcsU7pUrHM6jBicShJu
         qSKbqFOPzxo7iCQgRapZb1F4iZq0QZdkcJ7wYFzoa3TvritAp+aQ5jdCN/IahrM+3b+8
         ncuc2Ti3Mg1uqRFned5CWA8mRxWQhTpu4HEOtJAYUHADLGkZM3vjaX23Z+PzwMJ1Uns8
         8JOA==
X-Forwarded-Encrypted: i=1; AJvYcCVpoMYEqz5mQI3VesrG+qbtfO8KnwvsbHLxd6NK/UO2EP6RF23UoU8eYyhvrn/MtyCu23UEh/MZ9KPx9N0xZ0aVtq4sl5/8ODQJuXIWlbCwK/qY
X-Gm-Message-State: AOJu0YyUlDtIbThevlev32Om8bxxcQWWwx0vu19p7u6hnEDHUOdZI1cn
	W6ULFfu1hNp8uO05dm9wI6a/2eKQFYrM65NvV4scuIz+CaF33Xg2ss+VR/ZsYw==
X-Google-Smtp-Source: AGHT+IE8Jnmp6iXr1KlhSQhcrwZ95AW4suNiCVQyzgxcTB5US5FAQdRs628m8tj5JI5n2G9MZ0ieiQ==
X-Received: by 2002:aa7:88c5:0:b0:6e6:af7e:ccf8 with SMTP id k5-20020aa788c5000000b006e6af7eccf8mr3240803pff.6.1710501393278;
        Fri, 15 Mar 2024 04:16:33 -0700 (PDT)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:2f9c:c00a:bf1f:e53c])
        by smtp.gmail.com with ESMTPSA id c11-20020a62e80b000000b006e6aee6807dsm3122683pfi.22.2024.03.15.04.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Mar 2024 04:16:33 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	linux-mediatek@lists.infradead.org,
	Pin-yen Lin <treapking@chromium.org>
Subject: [PATCH v2 3/4] arm64: dts: mediatek: mt8183-kukui: Use default min voltage for MT6358
Date: Fri, 15 Mar 2024 19:16:04 +0800
Message-ID: <20240315111621.2263159-4-treapking@chromium.org>
X-Mailer: git-send-email 2.44.0.291.gc1ea87d7ee-goog
In-Reply-To: <20240315111621.2263159-1-treapking@chromium.org>
References: <20240315111621.2263159-1-treapking@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240315_041635_458921_6058FA6F 
X-CRM114-Status: GOOD (  10.47  )
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

The requested voltage could be lower than the minimum voltage on the
GPU OPP table when the MTK Smart Voltage Scaling (SVS) driver is
enabled, so removing the definition in mt8183-kukui to use the default
minimum voltage (500000 uV) defined in mt6358.dtsi.

Fixes: 31c6732da9d5 ("arm64: dts: mediatek: mt8183-kukui: Override vgpu/vsram_gpu constraints")
Signed-off-by: Pin-yen Lin <treapking@chromium.org>
---

Changes in v2:
- New in v2

 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index 3830daf7ea85..a64d06adf796 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -433,7 +433,6 @@ &mt6358regulator {
 };
 
 &mt6358_vgpu_reg {
-	regulator-min-microvolt = <625000>;
 	regulator-max-microvolt = <900000>;
 
 	regulator-coupled-with = <&mt6358_vsram_gpu_reg>;
-- 
2.44.0.291.gc1ea87d7ee-goog


