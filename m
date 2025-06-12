Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ABADC61CE8
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Jun 2025 08:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7XrR9Z799EQOitdhyIDhq08g/G4OghhPor0uKz260cg=; b=s1PmSUTQi/HqgZQhPska9SNvdD
	28OifSIhpNGnxp7u64QAAbAaQmv52CUjFXUCchiHlkzFcAW+Lj0sMcrRYP/6ywBCJcQ9u3JuubJLE
	spjM2QOXgncL7ZJ3h5/qowCutnnfEeDTYbdXzKn8CS6jUqwBnOzLLhp5rKPQ6UN0+737GgswpRsGr
	R86DZ7uYzJmppzdsh728sZGRW47lSU9xOaAGGB1nCB/N0nR84YvVlSU5vN6cGaloIhulL6+3e7wiI
	ojWxLbtzMRoP1nF636jD0dyJNMamaZ6TSNI3VRfCi6e5jqEgTDDM4sIlh+QE2+CyFVglqWpiHKC/V
	X+xZY5IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPdCq-0000000CbiY-0U7b;
	Thu, 12 Jun 2025 08:22:40 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPcgj-0000000CVSv-4589
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Jun 2025 07:49:31 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-235e1d710d8so8268285ad.1
        for <linux-mediatek@lists.infradead.org>; Thu, 12 Jun 2025 00:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749714569; x=1750319369; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7XrR9Z799EQOitdhyIDhq08g/G4OghhPor0uKz260cg=;
        b=DfjpXB9MJ4jNcfiko4gCDOol4CX20vwo85Ag2R3VAAiEBpAvBSbaQv9GWW1L8w9VsO
         vcg0e0QL9dfT1W9mcaV0vzKhHTMIGh69Yq+WFakE+33GJiufoXbajpGcT9TfvtN+hk8U
         O2DBNIYzASLBA8+1i0GKl6Mew9Xo1wwFNcq3A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749714569; x=1750319369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7XrR9Z799EQOitdhyIDhq08g/G4OghhPor0uKz260cg=;
        b=U6aZljtE3JEX6WipF/Z2yxIKZWtnlSjvYp8hLvIEsB3Uwpf09ZtnNFy1X9FGCg7gdU
         rNIP4OXfFmqHzL1HbChXdm2r9QC0eistAkeqvPhD3Rnoklp73O7U2lwV02PZsnJkpzJ1
         FKSm2iaclKC1sP8dsxyJHTiEcuWiSZGIkJX8QbGkjnhpBRJM9scJeGzNc5ksTgcMQ7Sg
         iZA/zyU1EbMJb2Rb0jrgfeG+iS+wTX+VTaWv67P3Pprds7i4Bp4LeEb3XKlvyNCyqA2L
         XXYYSVHbZydBzyp3GHeA49qQyKYPv/603wEN5k59/Ix0FYjehYm+LN/kpdmeT5TUpBky
         3w5A==
X-Forwarded-Encrypted: i=1; AJvYcCW9JbspuHOkSUnYSl38GqH4JB1CHf39mq89j3o5zw45fwlRqylLveLhx3lPDUWfixy2jSXrNBVDvMWfZH1V/Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzQyU8sa1zNq3OrJ6GrGbfESqfP5epsieLbSzIyLVyNWmhokBBh
	CEEqH/AH/E5EfBmUZ2wBK7PZkkz3hMVCLT1mSg3k/5Uu9ou2eDmfDw6wxolfHGn/Ig==
X-Gm-Gg: ASbGncsgjEOCCU9afvD23SE9N2JNwH/1avozueBGq662LHd+arEJCOlZ91ZtseqV/fR
	8ry6f+F+P8gOZbni9kSj1X1+EFaogNNjVyA2vrAj/usGtgzA73Mr5mt+OYmcWfbexEZ6X1y4c2W
	UiomILTZdqtChktkT7HYZFcdIcTbDSuE4WFBFKBqkFmbXf+piKXjGMLiB9ZRNI6wIvWV5uoPNnO
	6cpXOwfmMESQ+7/LwvM/WO2GfsBRJL7nz3P2Yvqtm4iW5+NwJTJqrwHzUZSIaI+T2lgY2IfDYbT
	DPX1IRR3NRHzZ3gN2OyHIlPKUH/Er/xxQ0lYhDnVtCWMblGwtZS7ncjAPl1E6+OcP0wKriBUgxF
	lstqYwv1RcdbbHw==
X-Google-Smtp-Source: AGHT+IFE5DvvPsxXV+bi1JEfMtSwm9K9UZ18IP94fohAyoCbLtffwhmgBBALXCfno10M7kxbt6Y0fw==
X-Received: by 2002:a17:902:d54a:b0:233:ab04:27a with SMTP id d9443c01a7336-23641b3fa11mr102085905ad.53.1749714569502;
        Thu, 12 Jun 2025 00:49:29 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:5b9:e73a:2e58:5a47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2364e63d42esm7893295ad.74.2025.06.12.00.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 00:49:29 -0700 (PDT)
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
Subject: [PATCH v3 5/9] ASoC: dt-bindings: mt8192-afe-pcm: Allow specifying reserved memory region
Date: Thu, 12 Jun 2025 15:48:56 +0800
Message-ID: <20250612074901.4023253-6-wenst@chromium.org>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
In-Reply-To: <20250612074901.4023253-1-wenst@chromium.org>
References: <20250612074901.4023253-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_004930_006613_D2B124F4 
X-CRM114-Status: GOOD (  11.16  )
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
 Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml b/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
index 064ef172bef4..8ddf49b0040d 100644
--- a/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
@@ -23,6 +23,10 @@ properties:
   reset-names:
     const: audiosys
 
+  memory-region:
+    description: memory region for audio DMA buffers
+    maxItems: 1
+
   mediatek,apmixedsys:
     $ref: /schemas/types.yaml#/definitions/phandle
     description: The phandle of the mediatek apmixedsys controller
@@ -95,6 +99,7 @@ examples:
                       "aud_dac_predis_clk",
                       "aud_infra_clk",
                       "aud_infra_26m_clk";
+        memory-region = <&afe_dma_mem>;
     };
 
 ...
-- 
2.50.0.rc1.591.g9c95f17f64-goog


