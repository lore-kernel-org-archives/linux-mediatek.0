Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27B23CDB482
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Oct 2023 02:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Azt+KfO9BoapxXrqgvd2zufA2s8NVZ07Ks//tnwBWjg=; b=1HV0TpDI/syIkiutVB3zv6PdPD
	hjGNXgnPwfa+oSZQjiLPeLn41YmEouUQESOFZKySmDuuLgiktey3eSrebuo5Wpbx+qb63/lzfeMIC
	xrhuZ+sp9n17BeLhm12e4lSm7gpwFWmvO+BwANdCk8K2WThTHuSf9bdhnOb/Xp4YmX45hqZA8IbrN
	GDnfRx5Q5kv7aTsegixab9XCnq3AC9ypOzLgTF7g1GDTS8pK/E6tsaKxS22ojTtKqOK983plgl9GD
	xAKOXf2+4WNd6ddMLl0pOJ+OUEHEE+uMjcDVahWZPnw4tkhrD/NIxB1OxwsGSv0a4BSLk+obOOKm8
	b2NdDHwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtIVo-00G6d6-2s;
	Thu, 19 Oct 2023 02:11:48 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtIVl-00G6cC-0G
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Oct 2023 02:11:47 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-6b20577ef7bso4780724b3a.3
        for <linux-mediatek@lists.infradead.org>; Wed, 18 Oct 2023 19:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1697681503; x=1698286303; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Azt+KfO9BoapxXrqgvd2zufA2s8NVZ07Ks//tnwBWjg=;
        b=kmspirehVvERTKxFJSi2Rl9ekpUSrX/pZ0geP2Fr0KeK4+HdZ7Ji8r6PfOkBswbpOv
         RbvOSCmdTR0GsMX4jshdKF+MqJhh4EsTSaDGvDEgb6Aw5vao0GMAvFHvxJR35vr5PFcY
         7+9bWTluqNkvWueDJ0l9WSBI8SNzLXOTO1cBNVXAVIHfEpp8tWuePw1UNCc5xFuaoFbO
         nVxbNLoS3YrMN84NAq+9jfFPk9+Bwxxn7pQBRs0fn2cYU/Lfwa/H0WuhC0rbRSwvwToC
         GHOhhF+SqXBno0o9ylEh4i9eo8SiqFCUkQkK3LQ/8IsD8Txl/LQvqh1+SdYukNRujIcJ
         eYYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697681503; x=1698286303;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Azt+KfO9BoapxXrqgvd2zufA2s8NVZ07Ks//tnwBWjg=;
        b=PRjcQvf3HZb4/8/0EqKEMpH/p82LIvcUoU8TlUW2yvnctbmTqizzyPt8s0O8JzMKL/
         4/NxHpNn6d7Pk8pMuOWYWslpqqMile88BuLZWi7damX9B160BIA8LBJ5C6SyoKGVWiPT
         pQeM+mgfQwyzywhJTN1VqqvV7lPydAD/PXfii6qJ+ulfxHpb3ftIIQCZ4kJyXKy7ZSx4
         MkLf+H+7+mA4dlGxaQ8LyMdnsBc3ENMTot+A15cgYpd9d63CBQdbM+pmSbs7r2Nf5Dk6
         K6YhnmJUK83GCtzpSoOXucVYykVSdC7Aa1+edAd7WJ7H+sWke4x8ACCK8tSEfPjuH6JE
         lvqA==
X-Gm-Message-State: AOJu0YxjipYkMXXUxd+b5MCk3Sz67kDy/S0Rku0HO2LauHge8PXTqPAj
	hNjwKsS94gu5P3LKeD5e2g3J5g==
X-Google-Smtp-Source: AGHT+IFNM9DN+I31MJZtznVBNyudmhbiTq1tVGLCtePwCwctczzofTe/a2wJR7hJZK/9i/gwrSmiFg==
X-Received: by 2002:a05:6a00:2d1a:b0:68e:2d59:b1f3 with SMTP id fa26-20020a056a002d1a00b0068e2d59b1f3mr748544pfb.13.1697681503421;
        Wed, 18 Oct 2023 19:11:43 -0700 (PDT)
Received: from ubuntu.huaqin.com ([101.78.151.205])
        by smtp.gmail.com with ESMTPSA id d7-20020aa797a7000000b0068fadc9226dsm3974278pfq.33.2023.10.18.19.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 19:11:43 -0700 (PDT)
From: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	angelogioacchino.delregno@collabora.com,
	matthias.bgg@gmail.com,
	perex@perex.cz,
	trevor.wu@mediatek.com,
	jiaxin.yu@mediatek.com
Cc: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
Subject: [v1 1/2] ASoC: dt-bindings: mt8186-mt6366-rt1019-rt5682s: add RT5650 support
Date: Thu, 19 Oct 2023 10:11:32 +0800
Message-Id: <20231019021133.23855-2-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231019021133.23855-1-xiazhengqiao@huaqin.corp-partner.google.com>
References: <20231019021133.23855-1-xiazhengqiao@huaqin.corp-partner.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_191145_137975_9B8F7160 
X-CRM114-Status: UNSURE (   7.32  )
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

Add new sound card "mt8186_rt5650". RT5650 comes with amp and
earphone codec.

Signed-off-by: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
---
 .../devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml  | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml b/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml
index d80083df03eb..bdf7b0960533 100644
--- a/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml
@@ -17,6 +17,7 @@ properties:
     enum:
       - mediatek,mt8186-mt6366-rt1019-rt5682s-sound
       - mediatek,mt8186-mt6366-rt5682s-max98360-sound
+      - mediatek,mt8186-mt6366-rt5650-sound
 
   mediatek,platform:
     $ref: /schemas/types.yaml#/definitions/phandle
-- 
2.17.1


