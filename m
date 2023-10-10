Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF0ABCD68E4
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Oct 2023 02:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FBRoIXxc4ljc8DF/PDtBoqS0A6CYruv097EKMy33JAI=; b=cdOCdmtCz0xn+yEmhf4g63qFvj
	4f2rXs6HcV31L0umo6D0gv1IFuhY8DE+RKZ5uukei3cocvVrWNAC9r3BxiYrIBAay/VQ3hj5+YYvE
	4gDXTHG+2kQ1daIu5ldrn981HKnYNAvK4Am6j5HMZe7aSah1i5mrEmkl53/kXNRCEBKS4r6jlnrS2
	JZ3R/dsC0EAuoL0pIw44adx+N1vzF90RBImZcSCvHzA5F72JQXYfXZdDcAhrbcS4AXx+49d1UNiUb
	kS5vFc6dC4VD8yqEFx6GTtAr629izLVo68HNQwsvywn0YWyd8AvSYE3L4NljHg/375YyGxmrdIo4L
	16zzCVEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qq2dE-00C8EQ-1E;
	Tue, 10 Oct 2023 02:38:00 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qq2dB-00C8D6-1m
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Oct 2023 02:37:58 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1c5db4925f9so38220245ad.1
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Oct 2023 19:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1696905474; x=1697510274; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FBRoIXxc4ljc8DF/PDtBoqS0A6CYruv097EKMy33JAI=;
        b=ShbLkO4Z3lHeLDCIf1IHUz+RUvr4nPu8uJjOxX+zAsL+t5oTdJO9OrZg3ffMAQfuYv
         f1e6qma/xDIghOtV9Jl/cxXpgkcoP0mU4TLPCmSFniTewgsYS/K8GTov1HjJHXaXrhRo
         GYd0Gj655N0sQB/YQ6yV1SIN6qn/c6k9Id3AfNRKGMVh2Ufvh9Btz5XN/H6dRC7BU+oC
         D0G5S6TIpljBzgSJwut8FJiP61QfExgGoIigW5baF95su3QQ4AAp0Jj6dbpJeIen1ate
         utVypQsIHasrfEvzyjnMgQUprVvgNkpVpNIoQcQ4NSFGbZ5jpWulCLoeZRvrLrnxwZXL
         4XsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696905474; x=1697510274;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FBRoIXxc4ljc8DF/PDtBoqS0A6CYruv097EKMy33JAI=;
        b=oleo1eTc3WQjyZXQyYs35ImPuAYF7XO8KZi7XeUzbjiCM/dbbO0r0ohFhGVDiLfloN
         AWQADgQPfzjDI3+P+SNXIKBTEA2dIc0p2JRoQdf3dk1w18heWmOGtTnGhUD27VFXSYdc
         lAf5W9VVbFDof98GNHjLA2cyNcHW4zv7x4+wZIvBTj2rpTSShUN/hJpWWDywjAY64w6D
         mRpMT49PxIrL/GskwSBabQtkWoQEqeKTNwGhWpN7fjIj0IGTX10JYIzVz1tjlwxh9DwS
         6UiJe1jl8K1eHD61ECRMrR/SDIdrVPtluNfuPXOBF8tyjXTVIh4jcQoDBILx2TCWYWs1
         l96Q==
X-Gm-Message-State: AOJu0YwXsBg15lO0ugwrO3DONXv5mqXuBJmKS6GNHd+a6se4c1nbreRl
	txKziIV/vQglVKBWJn1rKVbxMw==
X-Google-Smtp-Source: AGHT+IEv18QaxmdXF/vUEo7prCg0gx1O29LYJaDyQoUVhpU9JZshh+ovBSvE4QZw0O7F38u1Ae0ekQ==
X-Received: by 2002:a17:902:ecd1:b0:1bc:1e17:6d70 with SMTP id a17-20020a170902ecd100b001bc1e176d70mr20438926plh.24.1696905473655;
        Mon, 09 Oct 2023 19:37:53 -0700 (PDT)
Received: from ubuntu.huaqin.com ([101.78.151.205])
        by smtp.gmail.com with ESMTPSA id e1-20020a17090301c100b001c613091aeesm10269039plh.293.2023.10.09.19.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 19:37:53 -0700 (PDT)
From: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	perex@perex.cz,
	trevor.wu@mediatek.com
Cc: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
Subject: [v5 1/2] ASoC: dt-bindings: mediatek,mt8188-mt6359: add RT5682S support
Date: Tue, 10 Oct 2023 10:37:37 +0800
Message-Id: <20231010023738.8241-2-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231010023738.8241-1-xiazhengqiao@huaqin.corp-partner.google.com>
References: <20231010023738.8241-1-xiazhengqiao@huaqin.corp-partner.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_193757_587286_28B0A6D6 
X-CRM114-Status: UNSURE (   7.91  )
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

Add compatible string "mediatek,mt8188-rt5682s" to support new board
with rt5682s codec.

Signed-off-by: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
index 43b3b67bdf3b..4c8c95057ef7 100644
--- a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
@@ -17,6 +17,7 @@ properties:
     enum:
       - mediatek,mt8188-mt6359-evb
       - mediatek,mt8188-nau8825
+      - mediatek,mt8188-rt5682s
 
   audio-routing:
     description:
-- 
2.17.1


