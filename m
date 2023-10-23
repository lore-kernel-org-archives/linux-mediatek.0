Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 527D1C004C0
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Oct 2023 14:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f2d8tTfPryf4AKFcvtoM/0h2MGK4CVeevmA8lDq1t/g=; b=3s1Q4ZLHLd8r8loersBIt6ruKW
	O1mePK3Z+q+l0ekYSbkLn/5SU4cNdhHypmQJGfZqW4KXalVw2TIGZanKgYUxV8LwIkzAPUTShwtXG
	/tB54KSE/+DnmcFP8qC+SagS5Bc/pwWuSnuA2azizBRxKDCRBYqfJN2kUE4Mr0cAniH2UNMt5MEbD
	nDkpxbQkbljqz1EPrLhA1oJ62brcVCVTgG/HjIZgQTKd/Iol+w5x49RLv12nLo/X3LxmVkxjEsARQ
	0DMC4GQ6NCMmuLd7j16V5Vpa80loAXbQfKVaXHgJYSx6ulu4cZkGVmg2ySPGpBjhP0hQPIGmoLlqG
	/xk90U1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quw6f-007ZVO-0W;
	Mon, 23 Oct 2023 14:40:37 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quw6U-007ZMe-3C
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Oct 2023 14:40:28 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-66d0f945893so27869086d6.1
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Oct 2023 07:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698072025; x=1698676825; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f2d8tTfPryf4AKFcvtoM/0h2MGK4CVeevmA8lDq1t/g=;
        b=BCnijNqW5WgGCeUcktouB1E4/mDI8IH73PFEG92IIxPCHEXtt97+IbBbeyM1Vephg0
         WrTIBirXRhbcwHADQ+sHwHGqAvgirQXPe8CAjGgvpwQg3t/W2w+ugfJ/Xs7BTfvD+2V8
         ZrqB+lULCrRN1G2Fa9u8SVsNuTgWcIIyQfrxvMbqgUQ4wa/ZzYkj21Kyu+UZVEz2GipX
         SOWkoHb76d4rDITBXmHhVp9FpXvG5fkbV7KiUUY5G3204nWUN870qZg4oCXhHnZxXERN
         mCjNFcXyXW1uCNkhgqTi2Ye4l329LASMVH1ALNFc8EQaoPe/jJM8XyDBJYBfUN+pQFpy
         WTWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698072025; x=1698676825;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f2d8tTfPryf4AKFcvtoM/0h2MGK4CVeevmA8lDq1t/g=;
        b=Xs6IVZ5gV0MgiI4MYtr6nBLS9v0y7cpZMPZ2C31F5grSB83u+xFcKNmXrj4LDGZx8x
         GX7sj8QZJyfyIrEvTLHImeqPTi0cTVQ+GQAmvxONfhH/pokVViR1y7P8qGFovwunkQ8U
         wNhRBYuptXCnptysZ8QBLDY55kAmbTbD/2O5+LCLlbZBBYrkwZr5DPSpD0XlGzSXDN3h
         cSIE9NPsH+4b6kg2Cgp6RpqjQbwhj0Rs07tvddw1J4C9ap8ILM0Rkph6R9y9RvgFUtT/
         beuhINUdk9ss1iMDManf8iwa5VvO5HzxoUqzGC75Yc9Eg77k4/FDmqsCYEielX+KN1qy
         857g==
X-Gm-Message-State: AOJu0Yx41AAuY/Hc3wwIqs+m0t268dXo5n8YHEi7GO1sWoPTKKl20SEz
	nzlr4N22ML8RaQJEQw+rWG8veA==
X-Google-Smtp-Source: AGHT+IHYknGzIGWpZ0MnxMFj1HRLj9OGQkiXiBAhAeZ95cF7ut0X8xJi+rv2oEbieuv/EeZZSuR9Bw==
X-Received: by 2002:ad4:4d43:0:b0:656:500e:7b64 with SMTP id m3-20020ad44d43000000b00656500e7b64mr16687358qvm.16.1698072025639;
        Mon, 23 Oct 2023 07:40:25 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id f1-20020a05620a408100b007789a3499casm2725020qko.115.2023.10.23.07.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 07:40:25 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 23 Oct 2023 16:40:02 +0200
Subject: [PATCH 02/18] dt-bindings: display: mediatek: ccorr: add binding
 for MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v1-2-5c860ed5c33b@baylibre.com>
References: <20231023-display-support-v1-0-5c860ed5c33b@baylibre.com>
In-Reply-To: <20231023-display-support-v1-0-5c860ed5c33b@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, Xinlei Lee <xinlei.lee@mediatek.com>, 
 CK Hu <ck.hu@mediatek.com>, Thierry Reding <thierry.reding@gmail.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=994; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=JeNqW+WVxqqJtX+9p7tMLNbwoCk4n1DQyFj303zeDpE=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBlNoXOHe+hbAHJDiOZ+OVrpp+ogl+pb7Lr4y+qX804
 OlABC7GJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZTaFzgAKCRArRkmdfjHURc2gEA
 DFJ7bqOoha+846mBbXiyiSz8SjEv8vWq1uEyYeVmfWi3sxNfPvY88KKVK7KzsjG1iTOx2+0Kxn7leo
 DOIAZgnV2ZNoPSq6euB3iS86wajZsW+Vqe7IUem0PaHmzDl5JptkYOnFzuuIS0ABQ/ngG0ps1lkYtS
 Ku0Coa2KbBAmY6K2/XZ1O6P2AT3AqD5te9dsIbX1F0UJButVt/QxtIy4Iu8OelRfrJJbJUJkt6CJPB
 Xw0YSXE3JTv0zxGTiV+7gKGRSXBmCst2FmRFQnxUanUhBfB0ouROeDsJ+FAOENbfhfiRVn7Xfbfkc4
 HtR/EOX7cSm75MblTuT956tp2Kc6ikETj7dUmuQXOGCrg4NDtSMJZCTvZ29mCRjbtoZAZ4Te9H2m0t
 y7inJcqCfOcr2TO4IFx6TaEF/Ut5PZkYBuVspi005Cf8RyWovpNcA2LwTViTn14qQ09Z9X6MaRqbDc
 7MU5GLr/L+fTsk6gNYWEp027LKetYZpar7qX4imTJJD8a3DDGtW/5DMJN3W1DxzhBAOP/Yzi+kuv0P
 xd2f31lSLvE5rKq4BcX//75+rMyXe1AOrB1iA0StQrLWHNcao0QUVTtFeVzHAPUGBAMOrj/4bfaBCJ
 SPVxVC9f9mMG4h9P0XbJD5KniE3CaSL9W8jimZ23Xjz5kgf1ynbthPIpuZ+g==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_074027_031030_4C633E80 
X-CRM114-Status: UNSURE (   9.31  )
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

Display Color Correction for MT8365 is compatible with another SoC.
Then, add MT8365 binding along with MT8183 SoC.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
index 8c2a737237f2..9f8366763831 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
@@ -24,6 +24,9 @@ properties:
       - enum:
           - mediatek,mt8183-disp-ccorr
           - mediatek,mt8192-disp-ccorr
+      - items:
+          - const: mediatek,mt8365-disp-ccorr
+          - const: mediatek,mt8183-disp-ccorr
       - items:
           - enum:
               - mediatek,mt8186-disp-ccorr

-- 
2.25.1


