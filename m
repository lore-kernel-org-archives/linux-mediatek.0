Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C44AC3DA5D
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jul 2024 04:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HvPAyIWQtNqLx7WUlcX5/vDSF7IPzDdVVmoFWrTiQJU=; b=NAb+gdL7Rp4KSo
	GlY04snDXMtHmqMt4ZBA82YxgcNJ9zDY4gSfbzIE9VCCCJFa/jQaS2Ycew/xiXvbp40VIyM/0zfTZ
	ggig24YXWcbOSDj6lxQHtZVxEkrMKcO7SBFVkAb0dVlq3OOPOu0L2aFPzOMj+TwdrrftHd2Eoe+Ni
	kpwkwYxQ6/AKoTTBWAOm3fmhQR6fKZihDa7glGMJy9tWVHYxEOj9gsU73m5BPOm4ZsIXLrU0oDFxe
	zAqE5mqgy4ZlpRWgLdc3I9lItirThRMezlFZEgJiEAVNwYk9ELolIaGIyXbvQkOHVNbL3hqzhmol+
	H+DscQ7CbRScBvBEUjmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUfhX-00000001bEA-0vOq;
	Fri, 19 Jul 2024 04:58:39 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUfhT-00000001bDG-2u4k
	for linux-mediatek@lists.infradead.org;
	Fri, 19 Jul 2024 04:58:37 +0000
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-3d9ddfbbc58so894280b6e.2
        for <linux-mediatek@lists.infradead.org>; Thu, 18 Jul 2024 21:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1721365114; x=1721969914; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HvPAyIWQtNqLx7WUlcX5/vDSF7IPzDdVVmoFWrTiQJU=;
        b=a0blm2o16mHdsmbwZ+ToZQMmUPZD02YOSeyZtsIcJBJtrCFQknijk2nZEAZdkm9gi6
         D24BlRUcN66zcii89Kjo6dGWxWdBy5myhNqzwDOoV+bVYu2o3W5wxZJlvUKpIycBbv7v
         udFBnlJaI8tJyKRjcslbmzsf/s/gDGN57rXfU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721365114; x=1721969914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HvPAyIWQtNqLx7WUlcX5/vDSF7IPzDdVVmoFWrTiQJU=;
        b=pt2z4idkW/FNncApXV5X1noKVvy/Uau6R/GXoTBzdqwyFQ/UiDUvkVlunjRNSNOLOY
         ey77GXXoTVhCCnEM7jQgrGYFx9JtdSStm/Fa6T6ODHfxa2iQlPJkzadBC0LksHp0WJgF
         SlsBTd/Sk8iMoWAHC6se/2oSlQKUCr4IYWMSdbMh3wW5FWFHBDZ1mPZmDxbrZcydwZ6E
         EBVf8CN7NouS7nFYpVsnRaDYdlWb9MZfJC+KmVL3Ca8npGQz4KBeRQ0juGQZg/QXkpEW
         LSrDWDefa728OKD0tdBfpVwQfMKFUceM6ToB7u5kw8N64EUwVTlaizXP1C2s5ftt4RFd
         Bi7w==
X-Forwarded-Encrypted: i=1; AJvYcCXfBju8aXw8z8DYIK1XDtvfyEtUCA+C7/ZGFYOt88ZzzOJQF+AvKfepZn+kevt95Zy4Cmir7DTW5bTN+MZ7WujBgX4+FtZel/Q584E7Uz/0C2Or
X-Gm-Message-State: AOJu0YwVQsALNGM7bL1e5HuahcRd58QVQT/8kwsZJLPwHbzQRq3kl7yq
	HGctDw03FW/5OWprd71giAwrWc83JE4vc/Qan8VWy0QtMRkIUXQGz5sUhxQC8w==
X-Google-Smtp-Source: AGHT+IGpiUr+CwP2dyLNoFMb2Gyi+iGSCs3Az6ihXhSH1HtJoGXSvzeVXRwA6MyZOfyivrJ/f6qmBA==
X-Received: by 2002:a05:6808:300f:b0:3d9:dd2c:f1e3 with SMTP id 5614622812f47-3dad521abd7mr7316927b6e.25.1721365114323;
        Thu, 18 Jul 2024 21:58:34 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:4760:1d59:4f13:7c6f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-79db9fc1dd8sm422310a12.84.2024.07.18.21.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 21:58:33 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: [PATCH] arm64: dts: mediatek: mt8186-corsola: Update ADSP reserved memory region
Date: Fri, 19 Jul 2024 12:58:04 +0800
Message-ID: <20240719045823.3264974-1-fshao@chromium.org>
X-Mailer: git-send-email 2.45.2.1089.g2a221341d9-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_215835_835094_D3E08E7E 
X-CRM114-Status: GOOD (  11.54  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Corsola firmware reserves the memory region of [0x60000000, 0x61100000)
exclusively for ADSP usage.
But in fact, a 6 MB "hole" of [0x60A00000, 0x61000000) didn't get
assigned to the ADSP node in the Corsola device tree, meaning no audio
tasks can access and utilize that memory section.

Update the reserved ADSP memory region to fill the gap.

Fixes: 8855d01fb81f ("arm64: dts: mediatek: Add MT8186 Krabby platform based Tentacruel / Tentacool")
Signed-off-by: Fei Shao <fshao@chromium.org>
---

 arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
index afdab5724eaa..0c4a26117428 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
@@ -169,7 +169,7 @@ adsp_dma_mem: memory@61000000 {
 
 		adsp_mem: memory@60000000 {
 			compatible = "shared-dma-pool";
-			reg = <0 0x60000000 0 0xA00000>;
+			reg = <0 0x60000000 0 0x1000000>;
 			no-map;
 		};
 
-- 
2.45.2.1089.g2a221341d9-goog


