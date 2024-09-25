Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46DDAC369CC
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Sep 2024 11:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+0gdoWEmQ8OIzTuFnl4n60fS6o89niEVW+7kgdyvnOE=; b=f1RXB1bwdmZ4HZ
	3BGH7q4FghRaQ+OGl164y/BLPGqRju3YDhSGWH+K2JXngbfNr7F+6WkG+M4ixlic0BHcUVKzmVeyG
	WjlwtNYa4hegIMxmNa57wT0dBkkadgXoHpp846p/ln+G6m8sUbddnkOmNxMDN8aL21nQlG5jE3PFp
	QLegM4D3X8y7IigDdi2e/udwfZIUBzKmagMPMG5wrR7nLyLf0jk1glVOx6antyAQKKjzzOe8Syg1h
	UF6QozAGbwzv4zPxeR6rtZEDWI32lm6bUpgLC3RmbvL1qD5Dg67coeID1AiX3mAB7Bbp57sZRLAm7
	Olde0AqO4cVtWxdnV6Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stPsj-00000004pp5-49vN;
	Wed, 25 Sep 2024 11:08:29 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stPm9-00000004oSC-2Swb
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Sep 2024 11:01:42 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-719b17b2da1so2799822b3a.0
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Sep 2024 04:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727262101; x=1727866901; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+0gdoWEmQ8OIzTuFnl4n60fS6o89niEVW+7kgdyvnOE=;
        b=Lt5SMHsz+SYowrd6p5vNeEMA2z7vc0+kVGYMHP/icp97XCtv7rlj8sVfumUTHlssXf
         i9Eiat7QuNSLzGPQ74qtm2jibQV/bi/W6H5tgsokyRddeTJlYns7hLPkHviTXzYFspvp
         3SqSu2582mhouhsKr/t0lCK0PRvLrMROe8fjc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727262101; x=1727866901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+0gdoWEmQ8OIzTuFnl4n60fS6o89niEVW+7kgdyvnOE=;
        b=r5tFRnqHY0mDih8JkS4aF3VCeE+8jUsJiSEHadsoxiiPLhB3YndXglD0r70NX9vgH7
         RzXVDK6Ob2xgXLRJrIsTbPWM8J5wc0pJOcPeaporLtV5zvjP68xfD5QhRpvmkepYMYJ7
         kNb5TBodIhbDCP2mTpN4p6SC9Gt3fvrvmccEtm3IbxVBqQ/hha5JMccqVfzzc19GsWo3
         QrIcyYv/Ayej9bMo5rOkIiWgISImPtIg6fvJDXrVrKlu/8Ezf9abkTffWyUNJbiEoGJZ
         2n0sH8pdq9Psz+hNnIJL/d5VauCBY1iIjBLhxJLhVrgNp6bkuKR1nyUxJMPkbTsX3Yz3
         Kvvg==
X-Forwarded-Encrypted: i=1; AJvYcCVC8JM04E5qDUFib2efTOAke8A8xInohhHG/p+oAbf4/F2ij3sWPPIJr0O+wSz+QoBYNcmYDlwZYtLNJ7WsOQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzEFRCRUl3pS6tExuCqGZkHw9gQNbfgsczU+EhaDX5aSPpSjbcp
	KEGyFYFRXXIuWco68aYDZoa1/YWnac79MP34eNHfNrXYxpfkumNUY0HV+hSHx0KuhG8VTsgm99I
	=
X-Google-Smtp-Source: AGHT+IHW8akhne8ifxBoarbEIqQkjZqpqla6rNR9R3QeDqTmmCGIt95+B1YaGfD1lQYvQ0y0FfdixQ==
X-Received: by 2002:a05:6a20:1010:b0:1d4:e56e:93b5 with SMTP id adf61e73a8af0-1d4e56e93bbmr1103285637.16.1727262100947;
        Wed, 25 Sep 2024 04:01:40 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:2b86:78b6:8ebc:e17a])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7e6b7c73085sm2570298a12.59.2024.09.25.04.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 04:01:40 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 6/6] arm64: dts: mediatek: mt8188: Update vppsys node names to syscon
Date: Wed, 25 Sep 2024 18:57:50 +0800
Message-ID: <20240925110044.3678055-7-fshao@chromium.org>
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
In-Reply-To: <20240925110044.3678055-1-fshao@chromium.org>
References: <20240925110044.3678055-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_040141_659561_766CD5CD 
X-CRM114-Status: GOOD (  12.11  )
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

The MediaTek mmsys is more than just a clock controller; it's a
system controller. In addition to clock controls, it provides display
pipeline routing controls and other miscellaneous control registers.

On the MT8188 and MT8195 SoCs, the mmsys blocks utilize the same mmsys
driver but have been aliased to "vdosys" and "vppsys", likely to better
represent their actual functionality.

Update the vppsys node names and compatibles in MT8188 DT to reflect
that and fix dtbs_check errors against mediatek/mt8188-evb.dtb.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index a6cd08ea74eb..98ba3485a8bd 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -1783,8 +1783,8 @@ mfgcfg: clock-controller@13fbf000 {
 			#clock-cells = <1>;
 		};
 
-		vppsys0: clock-controller@14000000 {
-			compatible = "mediatek,mt8188-vppsys0";
+		vppsys0: syscon@14000000 {
+			compatible = "mediatek,mt8188-vppsys0", "syscon";
 			reg = <0 0x14000000 0 0x1000>;
 			#clock-cells = <1>;
 		};
@@ -1801,8 +1801,8 @@ wpesys_vpp0: clock-controller@14e02000 {
 			#clock-cells = <1>;
 		};
 
-		vppsys1: clock-controller@14f00000 {
-			compatible = "mediatek,mt8188-vppsys1";
+		vppsys1: syscon@14f00000 {
+			compatible = "mediatek,mt8188-vppsys1", "syscon";
 			reg = <0 0x14f00000 0 0x1000>;
 			#clock-cells = <1>;
 		};
-- 
2.46.0.792.g87dc391469-goog


