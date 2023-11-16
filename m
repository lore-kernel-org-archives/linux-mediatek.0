Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 383A7C47071
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Nov 2023 09:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OQqe+M0SciQZs03dKyyk03FflXJC4UVH/RDIGAymDmI=; b=g9xYChx5u7fhhBHstV0yAghSGQ
	O/tdQkN70Nz7E/kuC7PQBrglz/5uAOjSyJJZ8l30p8YkFzS9A95DWPY6PYVWGbHRPiV5iSgXq6fkd
	kLXaM4tFzXHtXObfFKV2xAD+CRP9gbfTQCLaUqwfbDY0pepjK4a7dbjJNlIsnBGZf6TYRVZ99pLOS
	LPf8FOGeMEVIbRtGwJ88QH2b8kmTQ5XJhGi+qa63PInqWvydYR5KkhclqqpPIAX9O2pH92upqHJL0
	BfkfF04XdEuKPsDSenvnQ5PKYmY6dSttZjFOg2QYEBXSMNwUk6LzkTXoQunMlY5iN8JnZZ6L9CL3n
	+B9DPdOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3Ymb-002z9r-00;
	Thu, 16 Nov 2023 09:35:33 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3YmX-002z7M-1A
	for linux-mediatek@lists.infradead.org;
	Thu, 16 Nov 2023 09:35:31 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-5ab94fc098cso420351a12.1
        for <linux-mediatek@lists.infradead.org>; Thu, 16 Nov 2023 01:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1700127322; x=1700732122; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OQqe+M0SciQZs03dKyyk03FflXJC4UVH/RDIGAymDmI=;
        b=Y9+CjEvI2SNnyibNbusrxdnoyF3HHuO2SGAulVEYy6IW85iV6vQB1BG2AE0yeziReS
         P+PbZzmEwkD1qfUfvk3GgaGmWbJXnL535ANafedErfS/XyWe9+7hcBCsJC3mtpuj40Hk
         6N7NytKB1m1sXk3swPTwYcQD0adXIsSFvnSFf1mvatCAeJsnBBfnaL7aaNOBlMY+O5vW
         CZ056sbmxroErPB4/vWPOqqvIjRV1e7xfxhi3zX+/knodVIye8MkLfOD3FeiJ2G1bR9j
         mCBgF/okEhWX8jSXmXyzm2cPn92ACvJOuxx2BGg8DeePly7lHURDcnQ4Sps6P38z9Cnm
         TdNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700127322; x=1700732122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OQqe+M0SciQZs03dKyyk03FflXJC4UVH/RDIGAymDmI=;
        b=InRp2TdVxdWtcMVARmG8zB4B0zjqWiMd7AxuxmxR8gEdlrNdB2scsGJyuKufMUZQTG
         5TpaUYCnUlLwBxOXOtkLVZJ2EdyZ7SSHB0OgYhiaG43syc30Z/xVbJz8cGQPUbA3wW7z
         tEFNrISJ2iU3c50BwI+mtAoACsFcMVHMd/rRTRLm/e1XUqIZbI4OrKT3lH40w/ykYGYd
         pGayv/keNdE5Ow8zv8mKjD7ClUXrNFP3jp9H5TnCUdxP7ua7UkioF1xaVDrH/oGAJZPB
         ypqJlAHeghuF8A3h86QmBgS3o1hc415HNSFP8yLskg3tbmYvITHJFQWzhaubKDrx4YrC
         fhLQ==
X-Gm-Message-State: AOJu0YxRJ5Sqzi34ulm352lPnClU+TwlhmObzo8x46RrY4l8IS7h6kyX
	daPKkHGLdqA5KH2dviSzR3R/Sw==
X-Google-Smtp-Source: AGHT+IHn0vuFpmqTeZwYd/MNwbGBnfvbI4vmgww+bi0UMXJqY7MyI5ZeLDq5kWfWLtaUjlUPdcHlDA==
X-Received: by 2002:a17:90b:3149:b0:27d:4901:b0b7 with SMTP id ip9-20020a17090b314900b0027d4901b0b7mr13989756pjb.30.1700127321792;
        Thu, 16 Nov 2023 01:35:21 -0800 (PST)
Received: from localhost.localdomain ([101.78.151.194])
        by smtp.gmail.com with ESMTPSA id o10-20020a17090aac0a00b00280fcbbe774sm1175214pjq.10.2023.11.16.01.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 01:35:21 -0800 (PST)
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
Subject: [PATCH v7 1/4] ASoC: dt-bindings: mt8188-mt6359: add es8326 support
Date: Thu, 16 Nov 2023 17:35:09 +0800
Message-Id: <20231116093512.4180240-2-zhourui@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231116093512.4180240-1-zhourui@huaqin.corp-partner.google.com>
References: <20231116093512.4180240-1-zhourui@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231116_013529_597855_08C3BEB9 
X-CRM114-Status: UNSURE (   7.31  )
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


