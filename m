Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D15FC04FFF
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Apr 2024 14:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ngpZb20B2h9Qc9IbX5I/ZiczUNGoVVnils8jWsBLdA=; b=l/CJVqzg14kh5U1wWH4zcMQKzi
	CjLeVvLLX+cYWIvJvrW8Uf84S4mfL66Fsw06twh6AdGDDahyR0QuoJ5l2rB7BT2JiCc3/6A0h4S4g
	muz8Z0hzj4PmYnq9VQSa2C/BaJOYnobuYiPX0zc0hKSeIR9MJ6ztM4ueb9c73wBBIujypU1C8hBro
	CbvigJeJX+s4Tj8Zw3rxqso3RskCDiClJQNd32EhwWevMSgN+TJgQhWHGS9yqVHmfDZ12SJxKNB8K
	DmQWw8MQwv3pIyDFlTaGvTZ9WqeTnOpsqR2z9Zt/OVv+gvJqezxDs/4qeT+o/3q02Uc9o04NHefII
	jAn+m3QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxSbn-00000002ZrZ-3ufR;
	Thu, 18 Apr 2024 14:19:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxSaH-00000002Yv5-1fwy
	for linux-mediatek@bombadil.infradead.org;
	Thu, 18 Apr 2024 14:17:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=6ngpZb20B2h9Qc9IbX5I/ZiczUNGoVVnils8jWsBLdA=; b=kT1Vaw5/3lv1lllNoQHeyKb8BG
	W8Ys05qvTesYyZw5iFxI2UskQkDxDiP0uohCW15BrHYkQMzkTfBjxud3kJhhX3NxBvjUpHOXCXsMb
	pN+FvxdJ61iGBdOQpjEW5XH0lylS3LeRLJY7/TimdXHBkRJqPCgIJzviyauXOWJEoHXRs58FJvVXE
	GSGs2xzHZKynZYk59Yiqv9l929z6fKVbfHqFAP2loaGUCEd9JIslv92x+a/M/rV+K4MVv9NCzSBNz
	rpDmMfU0RzADOYNeBOYLpPwE9InS+p2zegYkgD6ceTalGF2gct3aaR3YpEhvpcJEnDSbpJYgJcVr6
	9UfCRCGA==;
Received: from mail-wm1-f43.google.com ([209.85.128.43])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxSa6-0000000C2B1-3No0
	for linux-mediatek@lists.infradead.org;
	Thu, 18 Apr 2024 14:17:52 +0000
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-418e06c0ef4so8030245e9.0
        for <linux-mediatek@lists.infradead.org>; Thu, 18 Apr 2024 07:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713449854; x=1714054654; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6ngpZb20B2h9Qc9IbX5I/ZiczUNGoVVnils8jWsBLdA=;
        b=hoinRxqjjp/Ury8KEfUbf9R88Telext3KQEGxVzDMRppfiKe2FSnaWQzSpbD0yygFV
         yZUf9mEFnfy+t0TCv49MNqpCwZh67bhcbmxy8GPuvK9ZjuM2IoSxvMKkg9VcgVRtfWXN
         WUh2YCxzc0MnyRjGOMxPcgrinIVX5E3C4STYlCPvnGuUhxjoeRclijR9l+TwFpEIchn1
         GA3xiGanUrcySlLz3qU4yifKMmuMidi3fsHST6Vbj8uHnb0uZR8d4GaM6Richww+aF2+
         gGK8t/+aATOBepH86LYdc6pjwphbmMX4dKn3WXpoQbdmio9fr2tBQHGLIFhjVGXng30X
         3RzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713449854; x=1714054654;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ngpZb20B2h9Qc9IbX5I/ZiczUNGoVVnils8jWsBLdA=;
        b=AFVmWkVUBmlsqSSlvnaV1n9vwG0kYytDY00ZYw3xEIvAWibU5gFuOCr/6nVE+ESktE
         mR0xH3oxHijoLGFiu37cBCfcXDk3bLEd6l3IOcmTvs79AzbCXusABWHZTwcr+0elMYWs
         O+6bqBfBxD066TpkPlBex98NfNzF+Uw4Hgs5W4OWwATLlMRgaO/t+zu5kPlZywL9RTij
         0JMMBhiIOLc/f8gWGi0ing4Bvi0WC/vQbBOMAZH1XeQPDxuh9VgK/svz1I2I2l/sCToj
         IXkS0MSNlqNzEwmOJUksO5qH5YZbLE4UIoOV/OMbtmiCdYuO2lBGIxFptrE3N5KMq+ka
         G2kA==
X-Forwarded-Encrypted: i=1; AJvYcCVYU56BdSGkgaVuY8ntXF3G/wqmtDzAg/WhwQVhnBoSb5bWHpFgYuvULFRSl2hnZxa0QVVCBncEWDqI62SQ2AVoW+3xueZV9AhFr26GRNvygVyl
X-Gm-Message-State: AOJu0YyPcZ6w/CnvCHJjMSPpNuVqCQ+UIj/kUaeHgEvIWRsxrJPN7ZA8
	z18bvAZTMmX0ZtoA6q2F4ijKJ9f9zd5Z/Rb7y/wZ6yqS6aecjdmJxx7pEiJgbno=
X-Google-Smtp-Source: AGHT+IGNk7+q98Dt50c94htj2Yax4/KnYeuA1Mwztlc7Yw/kKE9BWFSk6X7OkJkTV8uxkSAExv++dg==
X-Received: by 2002:a05:600c:5254:b0:418:fb6f:5f3d with SMTP id fc20-20020a05600c525400b00418fb6f5f3dmr290856wmb.17.1713449854525;
        Thu, 18 Apr 2024 07:17:34 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id i9-20020a05600c354900b004180c6a26b4sm6267510wmq.1.2024.04.18.07.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 07:17:34 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 18 Apr 2024 16:17:03 +0200
Subject: [PATCH v3 15/17] arm64: defconfig: enable display connector
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v3-15-53388f3ed34b@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=693; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=woF6NgCy9sWp4jU9xhCym7WDVQPI/tzmO1lBDEzOVXQ=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmIStjXZeg5Jh2Is/gAHWoRmg5aIyMiEXbGdEHozO1
 0cFGgByJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZiErYwAKCRArRkmdfjHUReAhD/
 9Yax8im2q4PngGvAwi5mmyFvPkrrQweqeFZGttybB7sZdfiirXSiQhiPajWkHJ5qYP3CaLIdpsBbwO
 Rly04rqoR9UjnSnssubHEZRNV8FDtUpWG2kx2KI8YtrPQXLedyoviZ5yXRMhrIo4YQKztKVAM1anaN
 +4z/FdycM/OVy+qFYOtxIBm5OZVvmTBFcaobZ7N/b8dnOVarjKVjWcJMqc5DvBg82J9pfb7i5a32+j
 qkq7SMbQJPWRhsJJ1p+PmDZc34BROzx6SdrqIaQTJnDjE3jg9ejPrn72qGRpeCHd5u+WRMmbRlWe34
 QjAIUX44315fL/fLIduyc01lfQV48zhoOFVjpUGN219Rl/nbxQdtQizyG9s3C52+sBnHtBtCKGtM5p
 KeRTXx1RnMx3zK5gkElzJRvnWP3BpiS7jkdcymFux9TZriFYx9saLHrclsMJIMoAgdDwNvi+2YDgbv
 ZFd1zRXXRB3wFltaeIYmv61ET5XbsgRNVlB3erg09SjegSD5W4C+dUv8X7DTr/JNQYk5xB8c0r5kLA
 S1ZmTU+T7QLg2br8fX3i9CU7FZDBm4vI+C/FubNpkg75I5aXe2dOy+RetsN0udQ96a/LBJPDmKFksS
 ZnLWgsJyU/bn4dG+J0ziy4jI04KodR1dokrbqRImv1aZvrEx8euPdeTU6aiQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_151743_035977_5535E5D4 
X-CRM114-Status: UNSURE (   8.82  )
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

Enable this feature for the i350-evk HDMI connector support.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index fce98a150014..1df337882835 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -872,6 +872,7 @@ CONFIG_DRM_PANEL_STARTEK_KD070FHFID015=m
 CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA=m
 CONFIG_DRM_PANEL_VISIONOX_VTDR6130=m
 CONFIG_DRM_FSL_LDB=m
+CONFIG_DRM_DISPLAY_CONNECTOR=m
 CONFIG_DRM_LONTIUM_LT8912B=m
 CONFIG_DRM_LONTIUM_LT9611=m
 CONFIG_DRM_LONTIUM_LT9611UXC=m

-- 
2.25.1


