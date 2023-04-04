Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA00BC6FD1D
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Apr 2023 16:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RXCUKi5pLgJUBY4+DuTQW+y3V8bEHDXD8BVtVDMZZN0=; b=djI0eLKNLBqA2JU/QazQ4MAL2J
	ShUaH4o/8bDuASHKLegJ0p3MuSRBtiPnPHZlNzQ66Rym2QvqRyqpcnntJhXWMhXkENofc0x7CCsrj
	tuoHpXqfrPbMogEahyVXRDHYH+hjA9P4wZiZ/4328eX8GVFPDlMph/pXUk9aMPW0GPpoPfMs1zYrc
	YhMhjro4yz43llqSdrfyoBY5cpqVTjIsy/W1MRQWvQK118XOuhlqZ9xRRnD75XWIUbZuBgDik+MGc
	bdzDnua3+5JW0EXblIMtRz9OvkJ1hL6E+KVTann+nkqZhOMd5vzlHEAN5ayWi4FrBFzip2KwJ4Dfq
	gyL9xM7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjjY3-002CtY-08;
	Tue, 04 Apr 2023 16:30:19 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjjXv-002Cow-14
	for linux-mediatek@lists.infradead.org;
	Tue, 04 Apr 2023 16:30:13 +0000
Received: by mail-wr1-x429.google.com with SMTP id r29so33417406wra.13
        for <linux-mediatek@lists.infradead.org>; Tue, 04 Apr 2023 09:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680625809;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RXCUKi5pLgJUBY4+DuTQW+y3V8bEHDXD8BVtVDMZZN0=;
        b=x83VudRGauAHV1kLMU4VIDKWdiOnacBuhBc9RYi3f4sxfs2XweNKIeNIy7rnpOsOkp
         gB3Y3PmWwfHJ6+rVwIGkzr+R90zB9f1ScZTmP5pBXTk6OCG+i/WM3YIYubUXwveDkFgW
         B5qtnSnJPQvaZwQv3DzcllhiYux4yPm/PQG5GKlpQk03mPF8LGkiP4QRSC9SH1D2cZdK
         RLeCG7AUpLveaizQd/zIfOAIc/9rfUv+HP/7vA6yF9lcjsZ/5466Cr2bE/vulCe91elu
         nCg+NMOKmLP/ADnn/I4Tp8bb4I9Q9vATZMVc6Mbo/tBYqEVrzBnjBJvWMdbx6FLMpkHe
         pF6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680625809;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RXCUKi5pLgJUBY4+DuTQW+y3V8bEHDXD8BVtVDMZZN0=;
        b=0MbK7noMHOgFlDIXfz6hgMx27xFk/WPpt+G6KekBAYw5DOkEbPel449VS7X+sGwVC0
         WgAiyfFXcgsrDYokA0svzInN2VfJ+JdwThXV8l7Ds7ILoKR2XG8RcElKMm0ETX9twoAc
         kiDw0gdgFzdUU4nFb/RuY8oJNpvZ13Nrc5a/vfovDnvkuw6FXuvTxPjUxbUtkH17A/D1
         v1N1EEZAx0+shdbacEQT8nKsCqznwyFbmVyZctpdZZ3RVgmiYmI6ZKrFHX26N9icPsmu
         YgTVjG7Gs4TWqzds2ZI70KkuTd+NzrTy6ALAyX+kX84XfpvMk6/WpRaU0grTpLQde2Mz
         ccyg==
X-Gm-Message-State: AAQBX9ca2YcDDY3WF/ea1d27IrC5ePScZfeICoTMDrfPY8ioNNUanvCn
	MS6sgbxVkxxQWW1R/H3EWC6shg==
X-Google-Smtp-Source: AKy350Zz0PfT3XGOK9Wa8a7yqRYF3C0KlPhlP1JiPHsCEgTyJVh7gGi6gYk/9kkxi1PRWnHtQi3S3w==
X-Received: by 2002:adf:f0c4:0:b0:2ce:aa2f:55ff with SMTP id x4-20020adff0c4000000b002ceaa2f55ffmr2047020wro.1.1680625809559;
        Tue, 04 Apr 2023 09:30:09 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id o7-20020adfe807000000b002e4cd2ec5c7sm12694528wrm.86.2023.04.04.09.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 09:30:09 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 04 Apr 2023 18:29:51 +0200
Subject: [PATCH v3 3/3] dt-bindings: pinctrl: mediatek,mt8365-pinctrl: add
 drive strength property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230327-cleanup-pinctrl-binding-v3-3-6f56d5c7a8de@baylibre.com>
References: <20230327-cleanup-pinctrl-binding-v3-0-6f56d5c7a8de@baylibre.com>
In-Reply-To: <20230327-cleanup-pinctrl-binding-v3-0-6f56d5c7a8de@baylibre.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Zhiyong Tao <zhiyong.tao@mediatek.com>, 
 =?utf-8?q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1303; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=cYHxBDCQoGJzPsmuJwnAfXpE5ottu0FMlkHkQen22jw=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkLFCNiPnKq5m500FTYjWaFJHdGzwyKvH2iKxU1L0d
 XA/Iqa6JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZCxQjQAKCRArRkmdfjHURdhPD/
 0X4LhELLZx9sdnK7pRBtxWQYcXNGprCl3/3LUi6CQHqWNoNLRA+F4wQ9LaiPkAbOoz6srmj/44kuoC
 D++ydE0BicfPHO3zA0HgvaZhK89jP5FHWmMNGzM3ruNbpUTxbTdZ/iuyATw/tFot6EZ2y03ezv98XG
 lEhUepZJeT38R8W+zuoNFoyudkAO7gdRNvsXDUks7VylKc2kdgKz2uaj3hBbJQGhw7S7aCMzruKh/+
 H6WqSMJvLI/V7DBBj4TgeIy2ObWmQCBwYHILu1Q/zia470nRoDOdiwGJXntlLIJuL4doGoJIniFU6C
 fuhnG5eCUpurqYRrr1hN2GhyB2pCLcMaTP8iv9cI2NaENkIwSYGY+UvImZplYEVQNezEvYiGi5zrqE
 2FdxbhcoPyFB+9Nm0bSgED0YIn/fYVlBexqBIThLXyI/jBWbvvus6HDgJaOXXdoNObQCcNRZEgzLuE
 XO+Oo0XIB80Ekijuol85ECWgScXzQqEsHjw1xcRjGRWuXcZCETY8XVVb0LJTgVdMmhh1Z3NkoAF7rh
 1WG87fxk2rLxzE9hKJR60KEETsFqBJpTMfvQXO0qwD5Zbdzlwjgsm5VQ1AZvyKvvfcA3GfVDvokh/4
 UnSR8FcAam0JL/osQs5ps8fd62s6sifvVVuWrSpYhAEnsKQSz8ER1Savx0Fg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_093011_375155_5881FC66 
X-CRM114-Status: UNSURE (   9.87  )
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

This SoC is able to drive the following output current:
- 2 mA
- 4 mA
- 6 mA
- 8 mA
- 10 mA
- 12 mA
- 14 mA
- 16 mA

Then drive-strength property is set with enum to reflect its HW capability.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml
index 75d74b92c767..61b33b5416f5 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml
@@ -99,6 +99,9 @@ patternProperties:
               102: (R1, R0) = (1, 0) which means R1 enabled and R0 disabled.
               103: (R1, R0) = (1, 1) which means R1 enabled and R0 enabled.
 
+          drive-strength:
+            enum: [2, 4, 6, 8, 10, 12, 14, 16]
+
           input-enable: true
 
           input-disable: true

-- 
2.25.1


