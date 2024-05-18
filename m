Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF59AC25B77
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 May 2024 21:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6LaAmsr6IbfLWHWEKclaaIPD9AP5Zg/0Ttt/N0I0x4E=; b=eysq3GcWnhDpZdrnJtNvgBGE3Z
	W6ePzDvuOO6lLB0hvQQfWBm39skFvGsGf6pagjnyJM9H/kdrrDCwXeQaE2J0okwDrz2I2E4Dr98Nv
	zALvt7NEH0Ge9BIgZ1UWobLK+UWW0YMoyxiYadNM/1kjKrPdEDxdhg5tstaN2QuJAAXAZduCk5ZxB
	k962o6GIH+W483fIJLWiBdiFAw8yXqwzcnkI4mIcMaKek5R+iTJuzMdk/mx6Srzp5WbW13zctcljS
	8/qpYwQ4MGj9jMzwJtwFkV+WRP8njDq23mYpX63tm2O1qdZtWXZdRk7zvHJkvbUwM9dOP3pMbpdYT
	Xyr/QsnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8RLu-0000000AnSt-1zBp;
	Sat, 18 May 2024 21:12:26 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8RLh-0000000AnIH-3Mtl
	for linux-mediatek@lists.infradead.org;
	Sat, 18 May 2024 21:12:17 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2e576057c06so20306491fa.0
        for <linux-mediatek@lists.infradead.org>; Sat, 18 May 2024 14:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716066724; x=1716671524; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6LaAmsr6IbfLWHWEKclaaIPD9AP5Zg/0Ttt/N0I0x4E=;
        b=iFT+0U3LhJeC3K2zhmIgtuVidFln308GYRiiqFy2FY/3xCpTammlXy0q0c2e4vOtF0
         58WG0ZKGH23Lb8Jk7/VEPQVvCmh4xDADAKuQFUWkyySQqw4lWH3SQrA5i/zGPP7pXfrM
         eUhG9R2Ue65g9CoSkK/mKN0DZ+o59ghr6j0YhXKyhvhfpu4yVd4w68ydW+C2mXoAjY+b
         q90eXM9SOHUODCRQQs6+J6W9sIQIZ3NQ/6CFnYpF9A8Ed+A5U0L6ZzHuS4919LPiZCm2
         CDV4AuxWO8FFK9Txu9UW2mw2HHR+wvgn22AWdbARaz8rL9i3GxP1CeGthkNH8aaMHcai
         86hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716066724; x=1716671524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6LaAmsr6IbfLWHWEKclaaIPD9AP5Zg/0Ttt/N0I0x4E=;
        b=W7m4+hdRLxX8I4gqKjKWzavRpjpsnbHYyoluQaFOP3sWGPl4zxD541gi/fZCsLpmup
         uu9rYm++9mQfF8774t2CjWxsRk8/bICer3S7rUBaR2Ar5we7HYpqzRA09JuT+bqNB/1Z
         W+DPkVOBZwXYfpTXvfVOPXRiqkkZmsvDa9UFMWe3AjhvE17vPBxEgdJSidEWrRN8mhgG
         +uNkqhPr4BPKVjLqv5XHI0JcG4kkOzE3yMkC3e3k2LXLbf+MXiDbIOBPMhkiczenHzln
         BxJl4Lp58VWI4lQstRjIaP6BJ8CLbiiY2dYwj9YZ75XwCaDzYzRRAU49Ro+gkRL9XTGX
         Elrg==
X-Forwarded-Encrypted: i=1; AJvYcCUtvMKUv9tlvOOWS+Fp4CAJjqk3xwtV9WRuuROGbVDFvDM8tbXR8CyO2m+f63Yr3yc57cKv1i9q3RsY7vZsk8/NlXl+S/RkY3/M731gI4YN1N4/
X-Gm-Message-State: AOJu0YyF2yJAzWk2KO/Ett5wuhvyrhQRaC3JL+3mByjRqBOLcndogMPy
	JbB7hxYOUYi2k6RyV1szO+bcByyWQZ5MQdhfeCod9QuCAvYONzhTETodkpAF6MA=
X-Google-Smtp-Source: AGHT+IH2pXhxB9mDHw2Rl92k7GN8nvvr1DxEDU6XaMXuGmC+B9Bmnitesxw7rLcLqh6c221chfar1A==
X-Received: by 2002:a2e:91ce:0:b0:2df:1e3e:327f with SMTP id 38308e7fff4ca-2e52039bcb3mr173818671fa.38.1716066724409;
        Sat, 18 May 2024 14:12:04 -0700 (PDT)
Received: from krzk-bin.. ([178.197.206.169])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5733c323d3asm13151340a12.90.2024.05.18.14.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 May 2024 14:12:03 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	MandyJH Liu <mandyjh.liu@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/4] arm64: dts: mediatek: mt8365: use a specific SCPSYS compatible
Date: Sat, 18 May 2024 23:11:57 +0200
Message-ID: <20240518211159.142920-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240518211159.142920-1-krzysztof.kozlowski@linaro.org>
References: <20240518211159.142920-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240518_141214_068200_F75005CF 
X-CRM114-Status: GOOD (  11.61  )
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

SoCs should use dedicated compatibles for each of their syscon nodes to
precisely describe the block.  Using an incorrect compatible does not
allow to properly match/validate children of the syscon device.  Replace
SYSCFG compatible, which does not have children, with a new dedicated
one for SCPSYS block.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index 24581f7410aa..d3da5a22c2d2 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -300,7 +300,7 @@ syscfg_pctl: syscfg-pctl@10005000 {
 		};
 
 		scpsys: syscon@10006000 {
-			compatible = "mediatek,mt8365-syscfg", "syscon", "simple-mfd";
+			compatible = "mediatek,mt8365-scpsys", "syscon", "simple-mfd";
 			reg = <0 0x10006000 0 0x1000>;
 			#power-domain-cells = <1>;
 
-- 
2.43.0


