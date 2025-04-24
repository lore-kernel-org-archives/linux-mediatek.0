Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6BBFC369D7
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Apr 2025 11:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HOVuiI+8mSRH7O/02K1BDgrIMTx/XasOhwMXr41vKIE=; b=a+Trfk7FFlBdqf4bVfp9imx5fk
	UX7DTXXtpEL0HEm/WpyfS1cDncg4gt+GEa/1Ip6mUx4fasYVCcjQFoF0vEWSsABr0LUwAtIF25fX9
	LS7yG0o3uOizKsz/z4jRiJItig5auZtNr9LjGeWtY2HJZnN0Lcgtbycoc029iIlDQXHH30ZfWZGb7
	VRyoFhiD6UGQvamuu9sPbL7XxE7UepSLATkqWUdNxvqo+u5klOkzTaL2X3B5LhiFuMJGM4I+gdW7F
	yhXz02j3ubVH5Wks0dYg5jC045ae/9UrAApWCWYERiZAVMUSAkHk86d/fKFi8a7ZS+JSgnyVdoL/9
	hdf/0qwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7usL-0000000Dsat-2bgs;
	Thu, 24 Apr 2025 11:36:17 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7tlu-0000000DfSF-35fJ
	for linux-mediatek@lists.infradead.org;
	Thu, 24 Apr 2025 10:25:35 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2254e0b4b79so13077055ad.2
        for <linux-mediatek@lists.infradead.org>; Thu, 24 Apr 2025 03:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745490333; x=1746095133; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HOVuiI+8mSRH7O/02K1BDgrIMTx/XasOhwMXr41vKIE=;
        b=F0HscKVhiGRqfC1tSTuOPUCaJpMmgrxC94WKsNOhi1jlwGaSd0U54Pa6srlPLLn0gM
         IJsW6zXTkKLkmHL/nghZdB9J1nvI/bz5HtWfgek6cg99TOmaNdnJ4H35pk44kFh35+in
         sT0y23uUyri6feNmzhH6Wd9hmBiGWjOscbb3g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745490333; x=1746095133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HOVuiI+8mSRH7O/02K1BDgrIMTx/XasOhwMXr41vKIE=;
        b=Piu+GRpD6VYatgMekjhLYK+flxKYQ3H0sRfFn2/eDFEM9RrDUKTCLG7p5nyUTtnTWJ
         VUBchUHVPlNKTg64LgbYbrlaNxIQN2iJ/gdL3BjP0Awp5H+lmycTiPezj4E6XdtArL1+
         8NQKm7fDRfjA2MQ3zEsJlEnj5HkBlcKZ4k3nfLyuObgwP5zfyffklIOHBiN9+5W1mXA5
         ZeXQt4JhhHUE25UFDrIbTGJKhgBPBr7UB34MN6n+gI6IAyK9auzO/NyJB/QHGKv4P8u8
         2D4l4ZA0IQ8tsGcvrcIqN++sTsPiO/NOVrKpWJetzzv6mvdMDg4aihUWM0BZrjPmN+Vq
         1hQw==
X-Forwarded-Encrypted: i=1; AJvYcCXwYSm4/RS0TiOo+G9Nc6fLetle461a5I6e+HgllF8jeqCxWg4wmyF7a0+PEMBdaH72diOR3AgR/jLNJp3BLA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyjnmxgFpkpeGANXxMbuofqqscXJja47B1oBibKL8YW/e6SDJQh
	f1DRlf3kd33l/My8eL7G8VAbHwDn//ZgY/+s0ptcdrt7AXKAMdZQoOfFl1KqXQ==
X-Gm-Gg: ASbGnctL/oU3QoIgZ0E05DQ7cYHn+U2dYuuHqiQ1OZkdjl1+zUb/E/qmV4DLlXcga9q
	MWaRcDH8g10/IMrr9QPq9n97v05PvSUU4zT0mubov58sKR+os6HUQIS3neubNjidyZQQYQ0NpCL
	XW/qLJ02sWctU6UnAsfutm3BfmvdFpv+VoL+cXNkOZVd6OJLDtwuE8WH7c84ONADkFwb2Xm2twX
	x9prZ00Nw6jdscpG23Ndi7FHEuyTB25681E6WYxdeQNrAAkdcz1rGgkqchQbe3BZsthtUhUUUtn
	cen1aoYhorZ1ZbOCnoc/VysVy62HX70+l6CIhe/dnb/DTHNNeT7gN7eRIA==
X-Google-Smtp-Source: AGHT+IGD0vIug8Nt9qcP/TU1PZMvFZmtESOf6amtEN+pO0sojtfEbRYqEQc7zpWOQxTNCIuHa8wc2g==
X-Received: by 2002:a17:903:24f:b0:220:e655:d77 with SMTP id d9443c01a7336-22db3db14ecmr31506645ad.36.1745490332983;
        Thu, 24 Apr 2025 03:25:32 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:fa13:e633:684b:257])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dda40fsm9680305ad.104.2025.04.24.03.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 03:25:32 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/13] ASoC: dt-bindings: mt8186-afe-pcm: Allow specifying reserved memory region
Date: Thu, 24 Apr 2025 18:24:58 +0800
Message-ID: <20250424102509.1083185-5-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
In-Reply-To: <20250424102509.1083185-1-wenst@chromium.org>
References: <20250424102509.1083185-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_032534_773406_C99B7E4C 
X-CRM114-Status: GOOD (  10.95  )
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
2.49.0.805.g082f7c87e0-goog


