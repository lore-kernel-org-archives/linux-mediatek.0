Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59228C4345F
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Apr 2024 14:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xyh9I+7RDjmoXx6ibmqfU5YmUk8cuDqOZ30bQAqDPzU=; b=qqtH5NYbt5m4eFo0RzPP2tAcAa
	bfSL5mM083WoJasz+CbJbrT7WI96+6hDEUS0gtdbtxFCM6KJOxUfHOciK76hMI/zirXgP7olPI9UC
	0dvM09oY53ygO7FKAVuK1NwlUKXIV0r5iXWyXr5c/wDqTLHu/1UtzcR1DUueO/UjOiuTWwSfD4Mrw
	ynEMc2fGJ7u9ir6INm22WFHV2NUeM4Bntqo97luKHTMoPC50srTPOsOFSsdH9unU80+vhpp4dzB5H
	5JCF8eDINuF/nKaiIY9QCTpsZ11CQoEeaFukPcfVLpfNRrUX9zP5OIVGyoEBq8wHwsaGBZCMreeP2
	eEqNmoWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxSah-00000002ZAz-1qnT;
	Thu, 18 Apr 2024 14:18:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxSa2-00000002YmO-465e
	for linux-mediatek@bombadil.infradead.org;
	Thu, 18 Apr 2024 14:17:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Xyh9I+7RDjmoXx6ibmqfU5YmUk8cuDqOZ30bQAqDPzU=; b=fAWUXlbFMSaUFdeEdLCtpCjBih
	FfIBLuNm8tPJXinpZg0znryGzk236x6KHyk48UX1PXHCKQ8DAfQ2Bhl0nDL/FnE2frrS9V+Wo85ML
	QBEzLpiaNBJEobQ4d0BuWyGJ3LYb2IwZRwlioAiSiVgN+k+rU6pTXKd1Sn6idyWmfcnrnJyP9gsAE
	chldhR3YJduQp5kfPnXCZFqJVFpHEsxZTSxBozpSgCF/fuYZNwc57fnngCCpCsSPLcx3u5q/VLu5o
	eq2J9811tswP+m7B1VHBTW0oDuYzhGW2D36P1s4ZaX4dXYaDTaFewQyyS2jJG7yXMnT/xwOelXQFa
	2YPz/TNQ==;
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxSZr-0000000C27j-2DQE
	for linux-mediatek@lists.infradead.org;
	Thu, 18 Apr 2024 14:17:37 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-418ee2fcd6dso3682105e9.3
        for <linux-mediatek@lists.infradead.org>; Thu, 18 Apr 2024 07:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713449846; x=1714054646; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xyh9I+7RDjmoXx6ibmqfU5YmUk8cuDqOZ30bQAqDPzU=;
        b=oa3UZ4Gw8l6Y5aBznw8fUMjPDbrsibvSx8zyzf9eq+jWMD758TqVL34rcThPwq2gJl
         3wK7c+KGSXcfE1uW+eCcHOQS6d2SDojjK7E5F0wdHctdrq/9gQVMu5TudRDLzc2qylLW
         wZjJ5nrPdrdjQEeAK70YC2Z77Gqx4adOwvqcp2ZRghdJDyiXqe/j5fJLGqxQ2IvqBv1O
         hFOiJ36w1B7PaBTXw3ekzIt8V+SE2mNmgbAlOIbEUo0tVh4U4SxqKrW/1ZZE6hen+xY5
         gHX4XOUgMn86DJ1aLkRIiLaLOOTjgdjr6jrHAto6xgdozxXqIUx7vbyG2QwczWcdo3ep
         BcUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713449846; x=1714054646;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xyh9I+7RDjmoXx6ibmqfU5YmUk8cuDqOZ30bQAqDPzU=;
        b=m9SD9GZg5UAP2RIvKSVtP+A+jY0rl8cL0Lh5Zxb3zbHYVFzriP3m5thNbMDBRxTUAg
         EVtk+/GVy/Q00Xp0fN7SogtzSWK288HReYD4WAURmuYXnJY2gxCX/vLk5gCrUfBhHgmA
         oOhA5IAfXN1P34Y0qUNl8G/w/crHakPr1J0y7e8nL3mAs533lFOwk5J/ymLa0tvZpuLt
         84pjZKtnEvP8rpT2429utDawjq6qghigrtcx4p7VJRoW1+np1yBdfuH/iFfxVtk5mqfx
         8OZagO6+ssOx2s0+A6x7WBEi9yrDlSaThJGPYrS9mEqt9egZxc0y+oVIlCTZIVRJo0rM
         zg4A==
X-Forwarded-Encrypted: i=1; AJvYcCVr2TyqPIN/DvA4Qxrp8gU9jZISsicEzujUlIVhM2WQCId9/y2QUot4r2egB5f+rkfRLk4eM8t+i3WGKg5mTXLWv/rHMFLmv4/MN6SYO/u87r17
X-Gm-Message-State: AOJu0Yw4XXn2BpFNHJ12Jokse7RRL9AIv9ONDiOGFFPojxBDys4p2Ntv
	Dsg2W7KoN0okpHCtZnR6qmvug+FMwhvPzl3ZVzrfupinq2DPB57EJYfYhRhIAA0=
X-Google-Smtp-Source: AGHT+IEToY2RaHfp8/SGhr+SzxRU5xE6X46yItp1fzn/NmRrntSYP3f0mFM/gMKeI8XS0GnztZrbrg==
X-Received: by 2002:a05:600c:3d92:b0:418:bdee:d58 with SMTP id bi18-20020a05600c3d9200b00418bdee0d58mr2125448wmb.12.1713449846274;
        Thu, 18 Apr 2024 07:17:26 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id i9-20020a05600c354900b004180c6a26b4sm6267510wmq.1.2024.04.18.07.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 07:17:25 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 18 Apr 2024 16:16:58 +0200
Subject: [PATCH v3 10/17] dt-bindings: display: mediatek: rdma: add
 compatible for MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v3-10-53388f3ed34b@baylibre.com>
References: <20231023-display-support-v3-0-53388f3ed34b@baylibre.com>
In-Reply-To: <20231023-display-support-v3-0-53388f3ed34b@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Fabien Parent <fparent@baylibre.com>, 
 Markus Schneider-Pargmann <msp@baylibre.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, 
 linux-clk@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1014; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=FZE4p38am23Wbba4sdDEsuVyWoBZbiLCeYBCcNU5TdA=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmIStjb/g6WWWPTVLJUfpwBGujfY5yXZ146n2j/DZr
 MvPY23uJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZiErYwAKCRArRkmdfjHUReRND/
 9YQd5KWvjqnnV42cCyJN+vg12K+UwcFK9Rqo+3q0ESv9jvSgt8Dsv4UtzVW1uX+WisefO/wnHatJF7
 zmq/rIHOBgG0QUE3W48x/w7n7grwQbevcTrp3Ob+WdR6huTGfLIZNJtaYPzRfQrwJ29iPZS4+vFjyS
 EehxV87xYf4zKrcZzqIv/MiJL4YE4DgHyb50p9iRHfHqk3ckmNP5DYih9BCPMg0M9F0aEFmnHvIHV/
 J0VHAwMNctlR15SuKaxx603N5YhNwSGake9NtRGU9yR+EhVwZd3ekYKWH3hpQKcNoWCOw3zDz9xLd3
 uxggMjXj3E98lG6sfnVMGyQBqd+FWL6oGD1+Q5A47BQmaDQ+UCmZzKhTr8PPAyIUoyizJgXlreYXfU
 BAzAHe8Oiri/BtY4WAiGk6E++oY5VRR9Q1itentGNWiFJcrRqwjE52EVRbQ50WglmkFQ6If24plmxX
 5ndkqBsorM0ZOh6Qwado9dAe8FPWQtCux2D23eajIOzbqWp9EqP1k9/JNVUKkwOAtNX9jf8HMyBWBj
 VqAhCrYJfqblrISh0Q+iWgRKeKXGTFpBpneWVrfGqwMO4k1M0vWqi+Zu7aRoiAr60qf5cLKBPDH09+
 SBTNBjmjJBIRW8CV4F9gOKqoPW0hgoaz8D/jPji/HoRoudHa1889JQqqCOmw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_151727_739442_590C9EE1 
X-CRM114-Status: UNSURE (   9.39  )
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

Document the display Data Path Read DMA on MT8365, which is compatible
with that of the MT8183.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
index 39dbb5c8bcf8..4cadb245d028 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
@@ -45,6 +45,7 @@ properties:
           - enum:
               - mediatek,mt8186-disp-rdma
               - mediatek,mt8192-disp-rdma
+              - mediatek,mt8365-disp-rdma
           - const: mediatek,mt8183-disp-rdma
 
   reg:

-- 
2.25.1


