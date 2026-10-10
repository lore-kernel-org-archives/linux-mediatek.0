Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DD71CA9EC9
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Oct 2026 11:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yWSkHUKka7QH4eH23AR+aM1Gs2nsmpiVfZDP2dicIho=; b=UNbfNFMGNoRFPQKkl/UrtLbwEA
	Peeg2H0GTgnx7oliBSTjN2Vz5QiznaRFMBXcx7D+kyshtWxgK0FUmu2a624BCiCBJD5daGKwI0Zh9
	a3KyL0UM4K65CCCGMq6yyPes0XjfW2AhIUjvehnFkr2ZO1z9fj5SkEBtAC2QmWaJkb5lQ4f0Lzd4y
	LSFC3m2kTTzQ4sPVkEOrU2qKa/vg0HZ67pobYpnn/IYpZON7WcKLtff4DveEFYtE2GhV9htx44cox
	pyGUniYS6iaCrDuDhsrDKfuNYhwzD2m+dTDIYMlB58YPik9H86pjAoHYBCG4VfOfeqrg3ZUn8kAYh
	ZkFhF1RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFVgW-00000007y3K-0vyS;
	Sat, 10 Oct 2026 11:56:16 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFVgA-00000007xmZ-2aOs
	for linux-mediatek@lists.infradead.org;
	Sat, 10 Oct 2026 11:55:59 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-48bbb06e746so292458f8f.3
        for <linux-mediatek@lists.infradead.org>; Sat, 10 Oct 2026 04:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791633353; x=1792238153; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yWSkHUKka7QH4eH23AR+aM1Gs2nsmpiVfZDP2dicIho=;
        b=F0Ez2enbvg4wRs1+fz+JxL6bo5NF3hR4o+YH3c8l4MylYyo/IxcOVgZrWe8seD3wWH
         J3ugqhfJWbyMh1QBW+BxAi91Pwt6cvVHIWxHfJMd/Hsm6OsgIdjW1dD1dU0K0oR5dn7q
         NZGqgZNcP2QifkbxtmDv2BITdWtOotaAnHYsOqSnc9ZZv8wHTlOgPsG/WSAKjO0+6GX/
         MtMgvaQEwvOA2zJlN+rG8bKqgzktDbJaLDqRTodaQwb1T/kHtNk6Fow+gMvIhdhBQ/8W
         gmnxcdf05YuRUzo2oBObB0RlmafUeGx1ntNPQaM693vV5KX8d8RfVq8CuA8fjdMPI+b4
         QG1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791633353; x=1792238153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yWSkHUKka7QH4eH23AR+aM1Gs2nsmpiVfZDP2dicIho=;
        b=rPbDOf669cH9IqC5X5V/a4wJ2TU/6xBJmJqP5XMn5J1QhmzlJlKSuvy+6AUMMkdPDy
         cQVETUcngLLPcE/kxfKav614gpKXZq/ocrfWXXh1O8JNn0reZriCJr+PN5BULAFMD0aT
         jhD0V6dct2NdNo9PzEN1DJdjKcBNCB/wi0a9Qf6sDArbtoNDoKICS/HI5CpOdS5JeVXx
         tWth+cslWSdI2REgu6gROS4sE7qA0E+sf2pjmBPWsftAHrQSM82wwjmUBfSmQkC0fLXP
         22EGDi7kIG6hNMr2nadJ5CcTuuliUP4VTSGC+VtSe6TwpCub9F7fLC4Rrm/nmLki/u51
         nMrw==
X-Gm-Message-State: AFq9FYKjDKDOQ+wVOeAfMZ2cRWVA1EBIjQhkJQqgCu0lkjLUUzsCZptA
	vsxaPY42uOf7gp2AVFXbR/59pHUvMW/JFIgwSwY5j/JiK46DWnPIeS7N/1522Cki
X-Gm-Gg: AYBFou0or9bZSmDnXimpupJIqkSVzUvnASocCJHwV5ngY2B05gbb29sATjXeevMrW1p
	WgbXEm9peu2mWJ5X+OOYY4Drkq/PW1+p2n81IbGVE7oyCC5HudPuS0oq3gtdV2jzT1I5vgL/hEt
	Xjbh7YmFWieFO3mwh5xy+/d4XYzSDvLFMnXpaUetxBJ4CB+BWCa+ycygOJcvkHrYdVS/F078Deo
	nzm9U+D/BecPhcez26ykQ1tKEuuVDAhk0DozHAQqilvePGSN9D88qnVmMcW14RGNnacgWub5jms
	qlyj5AeZRXWoun1uXNL0JXRaFoH8IcTSbMytMsytHlzh8+fTBGq9OIsNR3nM3rkXzYO7ByBUUVl
	Ee0NWBwHAIwKBAr4GvF9/fRIXoO6DSypNbqf2rYKDSqpLrmO+hp5vRzSLlR53qtE5ti3AEAm5cc
	f85G/u1WbjNUUAALeVUFrTBdwmA3EtQlvhc8dMl/rj3Ujv9geF7FEe1XC0aViAORBaxg==
X-Received: by 2002:a5d:444d:0:b0:48b:fdd:fbe4 with SMTP id ffacd0b85a97d-48dba9c7d29mr7028135f8f.21.1791633352509;
        Sat, 10 Oct 2026 04:55:52 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9aca657sm8746340f8f.43.2026.10.10.04.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 04:55:52 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Fabien Parent <fparent@baylibre.com>,
	CK Hu <ck.hu@mediatek.com>,
	chunhui dai <chunhui.dai@mediatek.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/7] dt-bindings: mediatek: hdmi-phy: Add compatible for mt8167
Date: Sat, 10 Oct 2026 13:54:01 +0200
Message-ID: <20261010115539.9237-2-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261010115539.9237-1-l.scorcia@gmail.com>
References: <20261010115539.9237-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_045557_246659_D0AF7588 
X-CRM114-Status: GOOD (  10.01  )
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

The hdmi-phy for the MediaTek mt8167 SoC is not compatible with any of
the existing hdmi-phy. Add a separate compatible to describe it.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml
index ac93069f4801..f0c8ea2c72b1 100644
--- a/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml
@@ -31,6 +31,7 @@ properties:
               - mediatek,mt8188-hdmi-phy
           - const: mediatek,mt8195-hdmi-phy
       - const: mediatek,mt2701-hdmi-phy
+      - const: mediatek,mt8167-hdmi-phy
       - const: mediatek,mt8173-hdmi-phy
       - const: mediatek,mt8195-hdmi-phy
 
-- 
2.43.0


