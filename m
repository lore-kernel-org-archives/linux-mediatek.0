Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2661C47071
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Nov 2023 07:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OQqe+M0SciQZs03dKyyk03FflXJC4UVH/RDIGAymDmI=; b=G1ZHo12BzJCnlBAvPOsJnXj0R+
	q7vk5Mog4Wo42XmxM2kqhIPJ3mhNRSWkQxtN/k3hgLrHKUYejaH6NNzxvn5nHCsYHzYu1LcFqLeIQ
	RTlwKjuw655cmxRmLfRbM1sytGYL260PtBGVwL/E6cyjJ2zNvwZOmJGFB/7bAQHIcMHxE/Np61H3R
	XHz1LS0pgiuJBrxyfplGkE1/W/PuBNet2sYvWCNAYW1O9vc8gWSa2h9FclpNc2icbXzyMhjVCOEiM
	g8T+Qxn3mE1cIxto5CyBXzE8bE4i0w6T7zvKwmFOr9ou9+QfzMaHMJOZBIwuLB+2lBdfOi8l6sEk3
	bNIa0tTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3WqP-002l1k-1h;
	Thu, 16 Nov 2023 07:31:21 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3WqM-002l0o-2Q
	for linux-mediatek@lists.infradead.org;
	Thu, 16 Nov 2023 07:31:20 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-5bd5809f63aso352124a12.3
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Nov 2023 23:31:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1700119877; x=1700724677; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OQqe+M0SciQZs03dKyyk03FflXJC4UVH/RDIGAymDmI=;
        b=MKlp1IRwE9PZQuwo4sTtpewA0y8hRCkZno2t/opo3++fH4Q081NRxVoU+EA1ApxIID
         ILQqvYeJsDFdv6e0PgnK8R9XRPEWZm4iwV4/1VamU43MME3vqHSSbWswb0zC7Vqei4jZ
         lYMFonxVFF4PZTCf1InomQb9Oz4N9W5tmks/lxiU9pl8rirwErMeQ1lZCKf4ZCRmQbJs
         bzyEYjqueShexeAl27oG9UBDoZhuZlyLcwUOdK/02WoA7ua0ue9cZCdbcvhSI+Ink+Rp
         SaOrHTtMvty1wpvrPjnfreWW0V+rjCGTvI6RlHw3dUcddBdUBp/CD/yN4uCNMVUGOnxQ
         IcpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700119877; x=1700724677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OQqe+M0SciQZs03dKyyk03FflXJC4UVH/RDIGAymDmI=;
        b=VJeKadaVJaFH2dLn3Bu4wdcFmqR8IkEJn3p+OERCEnI9m36yycvLsGFmA7jYdENN67
         pg4dYNWNntSPI0LWKJ/Upjmt8Sh2tFVo2K/z7AssVgEslOxGtngAT3o2PXjmq30oX/Bs
         yFxI2jdIRRKTztYzVQ4C2Xki9nqb7gXxLz2mocwQSUA9C0rrVvNmpC1wdjN183uBm9qf
         c9dvh7S75z8EsDRs3fy3oMGeZ1a5HfeMpk9ErRprU3pU1sy7+a6NzgTirshvfgb6Qh1b
         8/pIqhTTZ4t1wG/afeahNUD8iSCwWGkllaf9mKRJ3B9hfu+dfncoIaR95Ojef+mNGcvR
         9XfA==
X-Gm-Message-State: AOJu0YzHoY+4+QWOZKhxsCegnvxELv0wV7tIJEkDVLKIsm8ZE/v48pfp
	pxTMACaJ/0RXU3OC/dPq6tScNw==
X-Google-Smtp-Source: AGHT+IGaIHMuZOF1yIQ+fu37CRcJPSkHxBe4FY68rHUbHJbx9eg/h6FQ9gOr3clRUr3PW/eqMNrTTQ==
X-Received: by 2002:a05:6a20:da8b:b0:187:6dab:578 with SMTP id iy11-20020a056a20da8b00b001876dab0578mr4603393pzb.40.1700119877022;
        Wed, 15 Nov 2023 23:31:17 -0800 (PST)
Received: from localhost.localdomain ([101.78.151.194])
        by smtp.gmail.com with ESMTPSA id m6-20020a170902db8600b001c0a414695bsm8496706pld.43.2023.11.15.23.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 23:31:16 -0800 (PST)
From: Rui Zhou <zhourui@huaqin.corp-partner.google.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	angelogioacchino.delregno@collabora.com,
	perex@perex.cz,
	allen-kh.cheng@mediatek.com,
	kuninori.morimoto.gx@renesas.com
Cc: linux-sound@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Rui Zhou <zhourui@huaqin.corp-partner.google.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v6 1/4] ASoC: dt-bindings: mt8188-mt6359: add es8326 support
Date: Thu, 16 Nov 2023 15:31:03 +0800
Message-Id: <20231116073106.3757618-2-zhourui@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231116073106.3757618-1-zhourui@huaqin.corp-partner.google.com>
References: <20231116073106.3757618-1-zhourui@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231115_233118_790254_20D58750 
X-CRM114-Status: UNSURE (   7.43  )
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


