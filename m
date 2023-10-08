Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0539E95A86
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Oct 2023 01:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AnkYs5/BG/9GOQBaCWwWyOfl1fNQBQrw4AiO+6MYmI8=; b=hMZbxlX5O/t8rYTO7zmQuuTgtJ
	K5IakEp18t1Uj3s8VDkOCaj09DFRXsXm0VfkUqs6YK6a8oFUgo3g7Z7v7y1nwrsnIXQHJcV/Sikd0
	wId01Pdc/fLexYas9FvwCTaGDz49j00uq5EImhdol1kTRyAPBsme3tqnDO5Umlt6gMDWS5VqODEmJ
	AuLTcHkBpzN4XF6SL9PK3VKOALMvjGqUy4IKNK+eiYMd4Ak0ORQpmupmII6L5V8Is0PPNjorilHwq
	d6Am/MJXh+lpWZ+DhMbHcriBSJuxzI4/OossOnzs3Br+DWMBytAt0fUR4dOi8zvhiREbODWR0xJ7X
	ERlJy9Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpIsc-0089nK-0h;
	Sun, 08 Oct 2023 01:46:50 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpIsZ-0089l7-0o
	for linux-mediatek@lists.infradead.org;
	Sun, 08 Oct 2023 01:46:48 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-690d2441b95so2551298b3a.1
        for <linux-mediatek@lists.infradead.org>; Sat, 07 Oct 2023 18:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1696729603; x=1697334403; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AnkYs5/BG/9GOQBaCWwWyOfl1fNQBQrw4AiO+6MYmI8=;
        b=SJsFnG7FG2CL71+M9j86iN6IaZMFwSkHVttrDoZ+TLN/WyjPyglkbXGUxINLlezdK5
         LCpSBjbWEDuhhoWQD/YOOYjC3DO4K0q7EFXuTlER8j0nkrRPHtuttQYIN5GUNfH2jd6r
         6t7ERsn32BFBJq8rPKUYkzNdRLijeCZG3rI3dGnEoNQ6mIU6PimyfTU0P6tDZ5GR3nhm
         IuZzUTH0I4ujfr7KbcFwhP9D2gME5uP0ZAx8QfX7/XQo7cVv/uGfLVj5Ylm+slp7LmR0
         Azk+8X1e+kHL2KEN8bpCi0Fq8VUcBFZEAe5UNC/QWcvu+ScGiMMES6RX7zgyQ6szkAbd
         fhgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696729603; x=1697334403;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AnkYs5/BG/9GOQBaCWwWyOfl1fNQBQrw4AiO+6MYmI8=;
        b=P7aSezt7eu+SlbnaAP9EDbTfp/9kLOzgmmHi5EcQ7CEcPL3U6+L/+HFYIXtxhbVG1g
         BJwzmUEYLH/9gfmyzVnkiYHeenJLu693QiypPRq+MBi8+24+dHFpTtbVelalGCCU9FPp
         Nw7BpRnL55lpNj2YPGRSpFiwEhw/ywR9NQbPi+T1vtjJVyCSOqjnSh3WRnTSEneNuJTI
         dUUvS9BFRy/mPk1wDg7h+u0ow3yvFufO638y8guiJIQUDj6jUEwpaW4jUS+o6jGs6+tN
         C8rXrbgBSKoDaxOg9DNSJwNqq6keyBRkgc54QBN0nUSyVdAlLoCAjolaKYeQyUvAOEPS
         kobQ==
X-Gm-Message-State: AOJu0Yzc5xge1ELVEH1PevRzzrDIpXof4KJdiOHFcAE1ackrjLLr4kiR
	mazCe3ksfeAUe/3X8bRIY/+5Pw==
X-Google-Smtp-Source: AGHT+IGWr16rliwrfcLVvoGiO2V3+fKoKVyKcsYrbchWrREpwol8Erq4V6J5un5az6Bk51HfqHF5TA==
X-Received: by 2002:a05:6a20:8425:b0:135:bf8d:b758 with SMTP id c37-20020a056a20842500b00135bf8db758mr13343502pzd.16.1696729603504;
        Sat, 07 Oct 2023 18:46:43 -0700 (PDT)
Received: from ubuntu.huaqin.com ([101.78.151.205])
        by smtp.gmail.com with ESMTPSA id v1-20020a63bf01000000b00563826c66eesm4888846pgf.61.2023.10.07.18.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Oct 2023 18:46:43 -0700 (PDT)
From: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
To: lgirdwood@gmail.com,
	robh+dt@kernel.org,
	broonie@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	perex@perex.cz,
	tiwai@suse.com,
	trevor.wu@mediatek.com,
	maso.huang@mediatek.com
Cc: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
Subject: [v4 1/2] ASoC: dt-bindings: mediatek,mt8188-mt6359: add RT5682S support
Date: Sun,  8 Oct 2023 09:46:28 +0800
Message-Id: <20231008014629.4971-2-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231008014629.4971-1-xiazhengqiao@huaqin.corp-partner.google.com>
References: <20231008014629.4971-1-xiazhengqiao@huaqin.corp-partner.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231007_184647_287784_624EDA03 
X-CRM114-Status: UNSURE (   7.47  )
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


