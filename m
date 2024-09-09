Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 356DBECE57A
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Sep 2024 11:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QUOItIdN4CuqJ3bySYoQipdxuI7Z/Vcroiw20gsxaUE=; b=QX7EB2rs1w5Mws
	zifIwTsKxHg8Kv9z9tLR41lwDSSaauzEu17K40V13jdMxkssKOnJeZ7SvEdmBVC//+/jtSuau3KjX
	3T4YqM9PBOnTIx8t5+Eek/GRmCS4pmcdDqFZk+Nx3IreRUDkcl8jvRxBq0qTCU4cS36zuof+us9Df
	TIx556bX+muUWFkb3UIW5hkChgD0jox3/8K8thMao/eUqy8Ef1Mwk6H0DE/ryRUgViMR/+j5/OabD
	UaOcF5u9pYV8MTTI7knm4HaFF5+D6LWFwdPw/ymApKiEjuJgrcIBBEYlZgMptkUxeTYbe0N13XZyx
	ZNJnajPLUO4f3fKNCt6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sncj5-00000001hR8-30Vl;
	Mon, 09 Sep 2024 11:38:35 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sncPD-00000001dEf-3pPT
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Sep 2024 11:18:05 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-206aee40676so34288925ad.0
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Sep 2024 04:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725880683; x=1726485483; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QUOItIdN4CuqJ3bySYoQipdxuI7Z/Vcroiw20gsxaUE=;
        b=QwlGRKORKmCrsWY1xsnI8uuxYl5Ih5wdNOqzPpNukyT4w3zmsGY+fuaUenWkJO1uKD
         MHOZmua25W+lSBBzGCmVb2Htsp8lXFLoO0POkxhW8zGzghquRqGuYhcWlrKphuuRc5Yg
         raVNwJCG0bV/hCNONaRhaVzdq1jgUgOSOdWe8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725880683; x=1726485483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QUOItIdN4CuqJ3bySYoQipdxuI7Z/Vcroiw20gsxaUE=;
        b=FAQyP61zH7kb/YIN3Z9wHIh4OgagyjFjDy/Id9xCqXIWPoIMcWtDHUE8xPwE7H9usJ
         lZozNVWCS/qg6F7ojzM4GUlNejXJy/a6+JYDUnGngW11sGDXZ4nozZvcsYIXeLDPFuPE
         xU3kWne8J4wrnMVk7KnQhnMIkJHDb4Obx4gLmeJMKbuUzNyg050xCipt/ezHO9JHygD9
         eou06jqLmSAPITk9owwLM2xe4YkOB3vpp20o3TD/O00/iL1BbrsQzlmNaRCMm+yKHHFV
         xYan9npqILJrtRiHLho9L6vfT8iezBsAgdLELzG++ya0Xx2HIc3E9h50TCuKjA/+gIK7
         0MtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrBWX6ZBtoWIkurfWbIuPBJC8cQ74hW18X+yYiS2JE1Zlg3Brkn4kPOmjfY3lcOkdbzRJHMgxn4eHWoAa2EA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+3IiV7u9xn5BVqZW5AsKRJe/Lteaeqc7Q9104DHD8+bMk9LH0
	boqBGBPVZF92x6LXL6HMx6vCGyD8Y8+7oIvkgruEyEZSNY6dx+pAIHofWfGCsg==
X-Google-Smtp-Source: AGHT+IG2C9XNJ4DI2nFoNmA76+SiA1/BQlCYF1MYXDlROT/zJMV16eihIHNxUAdcFdrNF1d3RzLl+w==
X-Received: by 2002:a17:902:d489:b0:206:9399:5dd7 with SMTP id d9443c01a7336-2070701f2dfmr72449825ad.56.1725880683061;
        Mon, 09 Sep 2024 04:18:03 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:6647:6d5f:dd48:8f5c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20710f1dc55sm32039745ad.186.2024.09.09.04.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 04:18:02 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 06/13] arm64: dts: mediatek: mt8188: Update VPPSYS node name and compatible
Date: Mon,  9 Sep 2024 19:14:19 +0800
Message-ID: <20240909111535.528624-7-fshao@chromium.org>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
In-Reply-To: <20240909111535.528624-1-fshao@chromium.org>
References: <20240909111535.528624-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_041803_976925_5F6EAC08 
X-CRM114-Status: GOOD (  10.32  )
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

Use and add "syscon" in VPPSYS node names and compatible to fix errors
from `make CHECK_DTBS=y mediatek/mt8188-evb.dtb`.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index 2900d78b7ceb..14e51a11f688 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -1799,8 +1799,8 @@ mfgcfg: clock-controller@13fbf000 {
 			#clock-cells = <1>;
 		};
 
-		vppsys0: clock-controller@14000000 {
-			compatible = "mediatek,mt8188-vppsys0";
+		vppsys0: syscon@14000000 {
+			compatible = "mediatek,mt8188-vppsys0", "syscon";
 			reg = <0 0x14000000 0 0x1000>;
 			#clock-cells = <1>;
 		};
@@ -1817,8 +1817,8 @@ wpesys_vpp0: clock-controller@14e02000 {
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
2.46.0.469.g59c65b2a67-goog


