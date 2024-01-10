Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2623BC3DA6E
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jan 2024 09:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WUzltDE1SVp4NPPJmaVgEfCYBki5uY9woZvLrnlkkZw=; b=D+hLabL6I0mAyPV37kyd+mWUYG
	gujaUBkDTxMgn7w708z2w5jaLaQLhk4G3e61WKCJjga5i5R5FeXKuHHyupzYlRI2jbaSUqERYF+H9
	Arx1VeFsdLE6dhXCK0SJQ60H+u+sfmxvKv+BunICmPmlIuyFuYbRwCOV+KtgcSxneQ+CFzSTYVE6y
	FMkNF8/Crcgl4ikVX4BwwJT59rXyom7QXSTInOHCj3djEz1JvytTPLJ3SbfX0NJNheH/fgBgCthrD
	yf0c3XGNAP9C7+JbtXVDlRocX2jm/UxXo2wpOUWxDuVr7iP72/1CLgWnyMZiOdm7NDYz6EaPKIuSP
	HSVzTvpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNVFf-00AvhA-2g;
	Wed, 10 Jan 2024 09:51:59 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNVFb-00Avff-39;
	Wed, 10 Jan 2024 09:51:57 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-55719cdc0e1so4420029a12.1;
        Wed, 10 Jan 2024 01:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704880312; x=1705485112; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WUzltDE1SVp4NPPJmaVgEfCYBki5uY9woZvLrnlkkZw=;
        b=Tlni69Ygg3oec+HOIzfaN+7L9V5Cotx+32QE8897wlZxGsAipYMXyAWH/07OBecivP
         LaXB3XmzNsjSfr8qAnj6U0fQwB8AK9cD4qtCbyEr7rdlZqYgJatPc/pJyRqVtBpCeGcP
         A6Qyq/mFWK+7gVc+YyCadNRxn3V4GL1n/qvQsyb3X3Y/u7x2oubp/UXk2jIIyvGY8fvH
         hpmeZazdAn6zAC0dR4qJk06dNBxAS1FL+FUyEi4e162KXlpAEvqC/jpuE79tOLjNuVMG
         LEpDqpJUnv+cuaon4z91ul8FsP2Xnr59ZVELr/9Tp1r3FTWGweEfusuaL8uhpkFvrWaO
         nZYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704880312; x=1705485112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WUzltDE1SVp4NPPJmaVgEfCYBki5uY9woZvLrnlkkZw=;
        b=NHh9PrZsI90z1a+p7jA3m8sVQQS6O9/8fWGXWr2fd3Nh4vVxuQ55YeHzzllyWeiN00
         8VoX/VUpfPwgZQaSNzS5iqjr0hHEVh0Ew2vjk4Hk25iV8Z2yWd4Oq7fjjyPIjNCUnVOa
         w2VrMiFvJ/SQv56LiWXkdmHNsLuQSN19PhB69R5lzGW88wmGJf/AB+6F2aNOJyxZj78M
         A8EBNQnAu33WGwHNqpz6n1fCwmfiWD//+Rs7PniTDrwaw887LXZkTZjX4HY17d0HjJlq
         3xeMU4Pb1DFX8fh6GgeQrN43vfQT5eWwN4xYLnGeOsfcw2/hxYT+iUQPT5SKo1fLMCb7
         StiQ==
X-Gm-Message-State: AOJu0YxK5SZZc15TvNzpajjhDCNJPSU3PrAL6Uq0hFCfHzK8f5UqTgSK
	UwpT0z64okoJVyvw7o3Ztak=
X-Google-Smtp-Source: AGHT+IGhH4RtbLFmC4kd1ULInhm5JRCwhjv8vz5K7Yp73wmHntuJM1qcu9oXtISgYuTWG/FPO4OqUA==
X-Received: by 2002:a17:907:320c:b0:a27:47a9:ec85 with SMTP id xg12-20020a170907320c00b00a2747a9ec85mr583983ejb.98.1704880312074;
        Wed, 10 Jan 2024 01:51:52 -0800 (PST)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id c24-20020a170906529800b00a27aabff0dcsm1947617ejm.179.2024.01.10.01.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 01:51:51 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Daniel Golle <daniel@makrotopia.org>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	jason-ch chen <Jason-ch.Chen@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 1/2] dt-bindings: arm64: mediatek: Add MT7981B and Xiaomi AX3000T
Date: Wed, 10 Jan 2024 10:51:17 +0100
Message-Id: <20240110095118.25598-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240110_015156_038008_0F1A7EC9 
X-CRM114-Status: GOOD (  10.23  )
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

From: Rafał Miłecki <rafal@milecki.pl>

MT7981B (AKA Filogic 820) is MediaTek's dual-core ARM Cortex-A53 SoC.
One of market devices using this SoC is Xiaomi AX3000T.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 92dbfb862757..12cf02b30967 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -82,6 +82,10 @@ properties:
           - enum:
               - mediatek,mt7629-rfb
           - const: mediatek,mt7629
+      - items:
+          - enum:
+              - xiaomi,ax3000t
+          - const: mediatek,mt7981b
       - items:
           - enum:
               - bananapi,bpi-r3
-- 
2.35.3


