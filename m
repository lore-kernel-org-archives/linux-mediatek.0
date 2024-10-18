Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59C30D2F7E1
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Oct 2024 08:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ApvJO6d5QNNF3xPCBagvaYSTGXu+2K2cOSJlqV2xdXM=; b=oBgquGUKSwc4w4enLxYhmNnQYB
	JXFmRiPdwmPT2Bwax9hBm9abMaT8rKpvYjuM0HV02FrvnF9vVC+qOdq0UO9pNEjBhtQicNy9IaBq0
	PdJbxSWsHwJuHdD/Ry/47Wuk2RWdjJv5QE1Y5HhOsPPbtCYnpTb4TkuiRxLVI6JLJ5QD64uxyD3d4
	c78tDhR+iP+5FOjHNIdHm216iO7TxPBTefErwZ6kBPNeKge7t+uAzmljKyZPGnk0LhS9Cx5XUtKeH
	nJIV68H/nkwErzt1DeaLWz1m4vWEpjXZSG+6vL5WLg7b3/wgDdrwHLGbz26RwvR3lZ/3uHDn86fTr
	2Iw9XXWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1iHR-0000000HVaQ-1fJw;
	Fri, 18 Oct 2024 08:24:17 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1i5L-0000000HSRm-37fB;
	Fri, 18 Oct 2024 08:11:49 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5c94c4ad9d8so2546036a12.2;
        Fri, 18 Oct 2024 01:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729239106; x=1729843906; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ApvJO6d5QNNF3xPCBagvaYSTGXu+2K2cOSJlqV2xdXM=;
        b=OAN/7YIW9kMa+WAEWJZNtyw1a7m6kQN1LYIj1yEhqemzUVaB8XYAiFDaADsLWucKGE
         N71RKNhfTOEBQeWxU4+08yax5ZA//XHuNmy2TW9D1z/WA3CiQJ5k3wwFJc7eSxZcC9g8
         reemsj681LE00HHMNqbNqu6ffG8xdc5V57ZaCTrPKNL5ra1QblrrWPU9xjmU94vrN6Hk
         h687frdPNbO6brL5k5g39OgbH9//qmjd2B30q+Tt1iA4hBnsFCavcSMTjyW6HB/UZ2xI
         FYf9ahHLapEGdoXzrCC0bTs9ZIowy8SDQ1pilHg8R2PZUsTt5uO0Fe016fOiazWOtMxD
         a9iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729239106; x=1729843906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ApvJO6d5QNNF3xPCBagvaYSTGXu+2K2cOSJlqV2xdXM=;
        b=DDgRhfk0BBAHpEaJHAkB/5uA/acMtaGkpBLUvGvRxxtZzD/EGyVB/5NWuGZF0pyFDY
         bFvXqkNfzP/8jxScrOk6CBVt1R8ugK13ujAA1J+viKyNiWjgXJF4N35UMWEuGxTIeg/7
         KKFeXxuRySRj3YxkrM6VF86J8eQ1NOscxCKrURhNMq6ZoKuaNN1vesbWbMkfGPyZUyUO
         LxMTURHI7LnciipJNXQVvqlAC0cqq5iZn3qtiU8wt/fhA1XDfucKGVB6cd56IAXosiCP
         Lwo7wXP/dj2IUO7cmVVb5gVautX4dy/Ny0LJmTDLa47xfS7dPlENZxPGRvKbylDK0Su/
         jMlg==
X-Forwarded-Encrypted: i=1; AJvYcCUXhGb6sI0EPn2nPTwXkzaPWU7kvf7dCjCRtIB47RAQq/4qQXwsry9Fu6YqsILrMiNwDqd8a8GpPCtVBw/Wdis=@lists.infradead.org, AJvYcCWqBw54h8CSw8jUHbRfd9Yhd5i2ZM8zyhrjJpfLDzXB1lVV1CF4JO4sLT/ikJNzsBxggp+3bYskMfX56xUKkAOG@lists.infradead.org
X-Gm-Message-State: AOJu0Yyxh1j8bRfeX07h4oBHbQ1aazaslHhkAlTkg19Xmj9YBUpDDEm6
	kLau5WQvodS8cxEDzWgaHD4Wr3S6Z5oJyXIf3s77v05UEYVyQlYP
X-Google-Smtp-Source: AGHT+IHpgy+ZvIS+CmXt9F8h8DxgTe7oDeEKUVy4LrsM1AJZIkYp9J3mz10ihMJQWs5+U1Tp5bM3GA==
X-Received: by 2002:a17:906:478b:b0:a9a:3705:9ad9 with SMTP id a640c23a62f3a-a9a69c98d93mr129677466b.50.1729239105439;
        Fri, 18 Oct 2024 01:11:45 -0700 (PDT)
Received: from zenbook.agu.edu.tr ([95.183.227.33])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a68a8e734sm61129666b.24.2024.10.18.01.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 01:11:44 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	jason-ch chen <Jason-ch.Chen@mediatek.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	Flora Fu <flora.fu@mediatek.com>,
	Alexandre Mergnat <amergnat@baylibre.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	Yassine Oudjana <yassine.oudjana@gmail.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 2/6] dt-bindings: mfd: mediatek: mt6397: Add bindings for MT6328
Date: Fri, 18 Oct 2024 11:10:44 +0300
Message-ID: <20241018081050.23592-3-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241018081050.23592-1-y.oudjana@protonmail.com>
References: <20241018081050.23592-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241018_011147_814287_8B718A49 
X-CRM114-Status: GOOD (  10.40  )
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

From: Yassine Oudjana <y.oudjana@protonmail.com>

Add compatible strings for the MT6328 PMIC.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml | 1 +
 Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml      | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
index 466566ae7f103..6a0e66fba53c4 100644
--- a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
+++ b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
@@ -25,6 +25,7 @@ properties:
   compatible:
     enum:
       - mediatek,mt6323-keys
+      - mediatek,mt6328-keys
       - mediatek,mt6331-keys
       - mediatek,mt6357-keys
       - mediatek,mt6358-keys
diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
index 95e9566fc535d..224b9b1bd629d 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
@@ -35,6 +35,7 @@ properties:
       - enum:
           - mediatek,mt6323
           - mediatek,mt6331 # "mediatek,mt6331" for PMIC MT6331 and MT6332.
+          - mediatek,mt6328
           - mediatek,mt6358
           - mediatek,mt6359
           - mediatek,mt6397
@@ -85,6 +86,7 @@ properties:
         oneOf:
           - enum:
               - mediatek,mt6323-regulator
+              - mediatek,mt6328-regulator
               - mediatek,mt6358-regulator
               - mediatek,mt6397-regulator
           - items:
-- 
2.47.0


