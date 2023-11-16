Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D54EFC197A0
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Nov 2023 13:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ewa/RO/c2nNV9BqZXYhhMq1WyzGVfFe1cICq2jP+i3Q=; b=JldKjdYc808okZ
	bw61FZDFGjEqUHQEAq2GWz9uFBAQlKh5sK5YxRqhN7biRf/jko1n2TadrjsCMJ6XyulrBmyVv+Z+5
	tpwt7qVpYNMQC0kbQC25RlUvAOf2koNYFh2Hh6Huvne3YSZSSEwI0kN7kO1olV5/xBtS7tA23vjHs
	M0hHZVVMd2jxZ173JIhw1XjaqDgz3gQTlBopp11HyDvGU5UBlSn4M5wWdLibkjkOJ52iwyDYb+1Yh
	G2U8xirXq64jh9yxBQ/nriXDHLkQTVcRKB4/aTQojB84KVYGg0wAk9n2Q0B2Nu+Qg0yX+6Z09cLFN
	cxkb37yooZm25a2JSQsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3c6f-003Y67-03;
	Thu, 16 Nov 2023 13:08:29 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3c6b-003Y5P-1C;
	Thu, 16 Nov 2023 13:08:26 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-9e62f903e88so104341566b.2;
        Thu, 16 Nov 2023 05:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700140103; x=1700744903; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ewa/RO/c2nNV9BqZXYhhMq1WyzGVfFe1cICq2jP+i3Q=;
        b=BSQKjPookZZ1pVp5bfI3aDFSgF/+qkPBhrt4arC6nLuJoC3EGJXW79lGWEEDguLp5w
         dFbqjoePjldNWUtfZEGT4pvksIcn8hwc6Msdr+4zZq6JnvEaEOwR3C7p2bhBdHCVyW5f
         ZISQ/7++sUzrodMZ6Fm3CBPK848tTGVGAA/oV3A64fdht4C5bN266V5IWtsuo6yi445/
         QPd7z6ELcxbkAj95jRgDJX7kM5ypl2oO8Jskrte3905aRT/AdYr0kknLoNc6axzGxmE6
         ejjF0hi6ppkzxA2l/5KmRTI2sTp+J/6eVADeQL3SBi8cugarLLa5Zq+gTsV6RDV0IcIF
         /ptQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700140103; x=1700744903;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ewa/RO/c2nNV9BqZXYhhMq1WyzGVfFe1cICq2jP+i3Q=;
        b=r9/KEf3xbVlcZfLutgXBo8Mb9TIpLRqAS2PYC1zzqmFBT9HmrTdZoOi3Bu6i+5CIAJ
         A89BxHT+cBr00BuI7EdufNsAb6mMNxyeZW3HUL1OtgHTPffP/mk3otizr0OEl98V5HG3
         2a3TOXHn7gmo4OrEohgfL+iIj4F2V88WsqvhHx8NOW42hBEXRJdJxqiz84H5FvCJzaEG
         cHs4/gsrzsNBbJMWyS2eLF/LdJfx8JJ4uDRhQvZI/LTcVObwMNPhD90RJ3MNkjq8SMG5
         NQ5N/6yJzDVQ6ZdUh7x6cber9JFoykYGiSOdE4VFProlH8vcATqJUsB2BkBN4uL1KdYw
         PckA==
X-Gm-Message-State: AOJu0Ywiz2fcdNDEu3D5zOm1T4aX8RXE5OOWR6bjuOrEj01OLb+qXFGm
	rJ1YwDsXw/HsjUuTgp5kZxU=
X-Google-Smtp-Source: AGHT+IHVuYL+1VlYakZtvkRco8laP3tpnuEfUx0y1nDVLHShdfNJc8z8ihZGXgeJGqFKdg+MjA7dCQ==
X-Received: by 2002:a17:906:774a:b0:9e6:da40:50e4 with SMTP id o10-20020a170906774a00b009e6da4050e4mr13395959ejn.7.1700140102989;
        Thu, 16 Nov 2023 05:08:22 -0800 (PST)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id a3-20020a1709065f8300b009e505954becsm8375833eju.107.2023.11.16.05.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 05:08:22 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH] arm64: dts: mediatek: mt7986: fix reference to PWM in fan node
Date: Thu, 16 Nov 2023 14:08:16 +0100
Message-Id: <20231116130816.4932-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231116_050825_448768_0C8ADDBA 
X-CRM114-Status: GOOD (  12.74  )
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
Cc: devicetree@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, linux-mediatek@lists.infradead.org, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Rafał Miłecki <rafal@milecki.pl>

This fixes typo and resolves following validation error:
arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtb: pwm-fan: pwms: [[54, 0, 10000], [0]] is too long
        from schema $id: http://devicetree.org/schemas/hwmon/pwm-fan.yaml#

Fixes: c26f779a2295 ("arm64: dts: mt7986: add pwm-fan and cooling-maps to BPI-R3 dts")
Cc: Daniel Golle <daniel@makrotopia.org>
Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
index af4a4309bda4..ba65e3e72bf6 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
@@ -43,7 +43,7 @@ fan: pwm-fan {
 		#cooling-cells = <2>;
 		/* cooling level (0, 1, 2) - pwm inverted */
 		cooling-levels = <255 96 0>;
-		pwms = <&pwm 0 10000 0>;
+		pwms = <&pwm 0 10000>;
 		status = "okay";
 	};
 
-- 
2.35.3


