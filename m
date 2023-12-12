Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C959FC4167D
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Dec 2023 12:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OQqe+M0SciQZs03dKyyk03FflXJC4UVH/RDIGAymDmI=; b=jIvjLMzzxR8jEBwAwy2cbCCVGD
	cjQcnShH7TjupOVdYf1W26gsvarJTNZ819TAO4wgZyNhh0saB2CiHHx5NTgyohBx7DgY9EaU2Nm2/
	7IQR5UE7JqxUb6vgiABUsjlyK62lFgUKHztNY107X00Xq748rVZqnch7qs7WCnd893kz848rgtCGY
	9DxSHZSnzrCufA0dD1dSG1DvTIuLn8hadj9hea+5dweSyoQwr+lJtAfXzbPQBMoKet9r/teQqX5nZ
	egtWX1T1QquTLKxMF8VvlgN9u9KmYkFJshff6fZIk8R42xb4ldan5jPQWJ0GD9nTdgE+TPJf+c51Q
	5dKFC18w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rD1vE-00BfkC-2J;
	Tue, 12 Dec 2023 12:31:36 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rD1v7-00Bfa5-0d
	for linux-mediatek@lists.infradead.org;
	Tue, 12 Dec 2023 12:31:32 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1d336a8e27fso2107415ad.2
        for <linux-mediatek@lists.infradead.org>; Tue, 12 Dec 2023 04:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1702384263; x=1702989063; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OQqe+M0SciQZs03dKyyk03FflXJC4UVH/RDIGAymDmI=;
        b=zMGD11BBUrCPn1bEL0PC8T14Vh3zet6v1tBUigRFAX9EbUnbCyykxO8VhFXKwunKit
         Gs/Bz/ZuaB8ilB4UAbGfXEOnQ5AQiViVsPAI31ESmOiEO3REDRO9enRSPqS0oG6mH+Jq
         RlOWWKKG8XaTUfE4SAcqQytTbARGDLR3ISfxeJfLjd3ztcGDxTWjN/e1GtvJPBevSV+4
         FsHnDepUqoq2eRmho0uOd0di6IHW9NlSq/INhE6aegpaJ8bo2Cwn4KCwdxKdFIZjnk3U
         KpI/S2JOZaBtWpJ0EINySPqEFBuHxBTVUZQirnJzHeLSrgegU+/DNzHiQPSUOrHQgqRn
         0/aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702384263; x=1702989063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OQqe+M0SciQZs03dKyyk03FflXJC4UVH/RDIGAymDmI=;
        b=tqsA5dLSU97t4yPE9iuKY7V7QekpIagjwkvdny/9POi2fpVV/xGVg/7FuCoe+BaK3H
         S7vdHRizSwaLuw/QdYJ4Q0HxPUugPhlZJ/bL6Xu/PxInyTz/B4U9w48+mHk0iVC/xyfA
         b9rHRZ26S01V0hjJm3ti3/xtx7r7RahyF1bGUn97SiyhvrzrcfSRmbl7TYwNwZlvYSXw
         3Q7D9oqzHR3kaNh71ik6Y8iv/ShLa4vIogwbjJSv5hxH+LPxFfOlqGSvC7XN75QNwWBb
         40L9+wBSKZHMPXkjM3ozmXXVikY6llfYzHh9f03GjPpnlXFjod2XzrvCWp1zydxqQ4Nq
         Bh4w==
X-Gm-Message-State: AOJu0YzecMpHmPjcvFAl0svSn7UsF+iJYKI9Xiy5XkARMBi2U4lzrGQu
	a3LeBdYhtIoe4Mnl9tkmmFzR2Q==
X-Google-Smtp-Source: AGHT+IEDUBr/+oX1uIcLCJf/m0NlbaRCePwvYMtZ5/+9t/R/pYCnAZMXHXO1IYqgFH048E0hgIsy0g==
X-Received: by 2002:a17:903:280e:b0:1d0:9fdb:a961 with SMTP id kp14-20020a170903280e00b001d09fdba961mr2989604plb.32.1702384263212;
        Tue, 12 Dec 2023 04:31:03 -0800 (PST)
Received: from localhost.localdomain ([101.78.151.194])
        by smtp.gmail.com with ESMTPSA id z5-20020a170903018500b001cf65844874sm8517471plg.45.2023.12.12.04.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 04:31:02 -0800 (PST)
From: Rui Zhou <zhourui@huaqin.corp-partner.google.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	perex@perex.cz,
	tiwai@suse.com,
	trevor.wu@mediatek.com,
	allen-kh.cheng@mediatek.com,
	kuninori.morimoto.gx@renesas.com
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Rui Zhou <zhourui@huaqin.corp-partner.google.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [v9 1/4] ASoC: dt-bindings: mt8188-mt6359: add es8326 support
Date: Tue, 12 Dec 2023 20:30:47 +0800
Message-Id: <20231212123050.4080083-2-zhourui@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231212123050.4080083-1-zhourui@huaqin.corp-partner.google.com>
References: <20231212123050.4080083-1-zhourui@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_043129_244570_3231EEF2 
X-CRM114-Status: UNSURE (   7.87  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add compatible string "mediatek,mt8188-es8326" to support new board
with es8326 codec.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Rui Zhou <zhourui@huaqin.corp-partner.google.com>
---
 .../devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
index 4c8c95057ef7..f94ad0715e32 100644
--- a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
@@ -15,6 +15,7 @@ allOf:
 properties:
   compatible:
     enum:
+      - mediatek,mt8188-es8326
       - mediatek,mt8188-mt6359-evb
       - mediatek,mt8188-nau8825
       - mediatek,mt8188-rt5682s
-- 
2.25.1


