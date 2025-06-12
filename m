Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DCF9C71136
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Jun 2025 08:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qw5Lgt5fODmZWlZ1xq501GDoPtHJnRW5D55nCqbrfp4=; b=RV1YHFQKPx+oJW/BeSDFI4+tuB
	l2zOye2UDr4ZtIGIEO4OfSEGKpkil/IbTRZpymLCaihbPY2QoM/wOdBV3DRiqzXQfK+8aA2Br10vV
	F2hrHQfs7oswU6jZ1d3MO46ZcoeyKKsCWVHvxgrGTI5FZMsoDrtJF12+FZ4yrCOi3slBKOzfqZcEx
	Jghp11OCkr2ERU4SYNtIVwtqRoThte8rLDRxAvzf4xrHmZ7bGqEzj7SFhfWsQ5UC+ZC1JB3n/37EL
	KJLFdh2dpL2699ftgOQWdizpOet5fxGkOnqtJ29gp4BSVmXawaKwcJhltacslJ9ud0mVMsQjCvwww
	GBLTNdQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPdAk-0000000Cb50-075G;
	Thu, 12 Jun 2025 08:20:30 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPcgg-0000000CVRM-3xaY
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Jun 2025 07:49:28 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-23602481460so6728205ad.0
        for <linux-mediatek@lists.infradead.org>; Thu, 12 Jun 2025 00:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749714566; x=1750319366; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qw5Lgt5fODmZWlZ1xq501GDoPtHJnRW5D55nCqbrfp4=;
        b=HQwGtO6Ebaf3dvQ4YWnEwiAoxq2FooZMgulpm2HPxFiXc8F5SGFScNa1odFP4YfXDZ
         /m+5zrIl/xI/xUiROLWfktk1DHJwOpS3DXDEud2i2NBrY0RgQajBr84ZGiU6AwTUwt2d
         Ps1MJYaVg9NcJbJam+H5uYZm3GacmB4l2nTuY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749714566; x=1750319366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qw5Lgt5fODmZWlZ1xq501GDoPtHJnRW5D55nCqbrfp4=;
        b=azwhxY0n/W2G/Z1+fhznaSjtS1EZFY3I8nm74GJY3YwRMx2NblC0AgO9CtsJEjcQ/+
         QX3p/hZKJfsnGRvrCWMs2w87qgGmtvQsKs31jXcwhq8NIJ+KtDVanKdyMxr7w9jx3HxQ
         MgUti/QkmQ09kfBhjyIaxXbY0g95MrpH1blxAGoEKsHw+cMkvwN/ICzkMzwAmE6yBl9M
         U8iXKAevTnLKgHi5dVf/0haJXXpfYd1szniW0UiQ08+aWXaAKyqcUcDEp64V22ZjXNAZ
         W2JidRcWSRLm3Lba5Mgwb7fwHbiE6fkrF+8LMsvPFpmGpghNggOOwVb+cFqehJrHmu1a
         gWaw==
X-Forwarded-Encrypted: i=1; AJvYcCW9ZWxNdeL7l+U53CjZ/VKiGo2VcwbTliWgVP/IC6ZHGMrDF6XkO73WtZsdnOpGFD0XK0/+Q9GufKnVhSeuaA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxef6RcRYUVPxmzJG+g+su99LOSFLonL7W8lEbGvgYNid8WqGTD
	oRicBgGDEHcMhpmqRcfsAIB7TmEzaMqgpH2Z0jM4DF/70FPyqxwYGLQEC9iXlK2D4A==
X-Gm-Gg: ASbGncuBAtL9arCNmjBdW5c+/7ry+J1/L4Lk72zhaemteJYvMBtzILfDHhS3n6h255t
	FWiSGoqT+13Yt2IghnhGeN4MVOQHcIMWfdz2CNwHjoHR0dE4LeVIJvlkakxssKMyos0cwoDW0Me
	lgoIc9JeSLlb3bdlF0BAiattOEOku5ROtSfy2eUiCb8wa+tL5Zw/5wcgYjQBHRiMhWnCHJWVv1P
	E7MYrTH0cfs891EWC3eI15YHcokhXbdWmPe4yZTt51kKrs0TVAgOJuT6CJiPdtZmIr2vHM25nvP
	gnCmdv4QVDkiIDOt7sMo5S0ZP/W37OFp75+EPHa9RsEtfTWHaxVpV9BGxW6k9zRlMziO+6mxKPI
	lHuM=
X-Google-Smtp-Source: AGHT+IGLmVy09OL49mJ9w79Slu0toVZtoekmlbumEh4gtf04pg2yxxSPvNOvb9XVQc/93dY7TLT9gg==
X-Received: by 2002:a17:902:db08:b0:235:f632:a4d5 with SMTP id d9443c01a7336-23641aa22e5mr78622785ad.9.1749714566433;
        Thu, 12 Jun 2025 00:49:26 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:5b9:e73a:2e58:5a47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2364e63d42esm7893295ad.74.2025.06.12.00.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 00:49:26 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/9] ASoC: dt-bindings: mt8186-afe-pcm: Allow specifying reserved memory region
Date: Thu, 12 Jun 2025 15:48:55 +0800
Message-ID: <20250612074901.4023253-5-wenst@chromium.org>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
In-Reply-To: <20250612074901.4023253-1-wenst@chromium.org>
References: <20250612074901.4023253-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_004926_997948_645DB287 
X-CRM114-Status: GOOD (  11.26  )
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

It is desirable to reserve memory for the audio frontend.

Allow the "memory-region" property, to be used to point to a reserved
memory region.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 Documentation/devicetree/bindings/sound/mt8186-afe-pcm.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/mt8186-afe-pcm.yaml b/Documentation/devicetree/bindings/sound/mt8186-afe-pcm.yaml
index 7fe85b08f9df..f5af2cf18158 100644
--- a/Documentation/devicetree/bindings/sound/mt8186-afe-pcm.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8186-afe-pcm.yaml
@@ -25,6 +25,10 @@ properties:
   reset-names:
     const: audiosys
 
+  memory-region:
+    description: memory region for audio DMA buffers
+    maxItems: 1
+
   mediatek,apmixedsys:
     $ref: /schemas/types.yaml#/definitions/phandle
     description: The phandle of the mediatek apmixedsys controller
@@ -170,6 +174,7 @@ examples:
                       "top_apll12_div_tdm",
                       "top_mux_audio_h",
                       "top_clk26m_clk";
+        memory-region = <&afe_dma_mem>;
     };
 
 ...
-- 
2.50.0.rc1.591.g9c95f17f64-goog


