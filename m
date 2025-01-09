Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 686DEE77197
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jan 2025 15:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9nxBzYrNzM8Me+hNhVQhLjukgzaVazmsb+QowMe4xPo=; b=MeILeanWduH2IqglvzKFbrvgeW
	Z/5tqnWi+lTZyxKHlk92HaD6rZlHPBmSC6fckGWFsbBgGyDY5ZYCv72GR1Zv1p3JjdAnVmrVDD+fv
	q50o10s2pOL8QUTou5eM3+4CSdUGoHoeTrRJzxRCe7l9y+pp/tKCMhWawWG+GJ5kZboZsf/7Ha3cy
	DEzHJpz6erdWorPxeo2jygiFsCLdBqE6kz2I7/rF/gq77gz9mOiJ9euwHoXcRGuxkc4ALD8wCSSlE
	r1m9yQYF/pG/Nn5PA+FsSh8rJCeUuoC7HeGcztEHG3LTQN4BIGg4iTo+05kwB52ILYRGB9y9sD6sB
	PxFRZhsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVuVr-0000000CUEZ-217I;
	Thu, 09 Jan 2025 15:31:59 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVuU1-0000000CTnI-3Lqo
	for linux-mediatek@lists.infradead.org;
	Thu, 09 Jan 2025 15:30:08 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43625c4a50dso8933815e9.0
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Jan 2025 07:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736436604; x=1737041404; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9nxBzYrNzM8Me+hNhVQhLjukgzaVazmsb+QowMe4xPo=;
        b=jbDrEPNXpBt2jI6n2RhFIZ5uEW56xtGMUp9s8tfAnx6sQDwuGnkey7jVOeHf8DTQP1
         jHHH4wl6tDO889EWjnqxCw314ZvBs72lazmRLpZdOWvcZoiCNicchssk6c0nnhSIPx7J
         AxNGbfHc9fW3HAuSHbgUorvivStq1hThCIzOtnyR6iJkSzvAZR3xNja1ZsqLPKaWvZEB
         UkukZjpQNc3L3G+vQlxHiIz0y9qnVn8H/sJegXTGaYMf+QFdqpxcv14Uhl0Xz23rEG0N
         6/IrrjGb7wgFda2uiv6KeH+9xQCYgJAFlMKLqaumVeMSMmKOOidVDeTG1jeez5hXp5pT
         J1aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736436604; x=1737041404;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9nxBzYrNzM8Me+hNhVQhLjukgzaVazmsb+QowMe4xPo=;
        b=Q2P4cCipGnQc5PjrPFrvopbdNw5STV2OiU+WzFpVWrErl62X8e+6Z/vUGis1+p1iAB
         XTdjfyr1VzoRmeqkYgNst5n9XwAF5wlcWAxHKDNKZQKK6CS2asQvIzUCStD6P7Fhukhi
         qi+HpjhLRbl/DvHIU7nISY4yh4dptViT099bH1vB9KM2t3SNJMqOUzHaTkelqrrv6amX
         htouFdskRFLzFVC+DaY3VYLokf74V3yvW0osvwC1JFXYDbC06Xm+d5tO3iDN3ET286Gn
         tsm+K5r3Yw1wyUO+t/t/ZJqLeciFQ6AXrs42wfbz49mGJgszysc0c6GzR58i0Rt+n5VB
         sdTg==
X-Forwarded-Encrypted: i=1; AJvYcCVn1JLaUM3lWqblcTSe+nqWuT2vXZPLugb9g9qqbZ9oIdxxg/WNLMzNVrPdLxBXdHtKbla0K+w29svTLU4wIw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwR0Y++IoXoh3mIxCclB/QK39QqGRWLt7JAqikhc1CgegpUOFqW
	s3+lacW2CHK9HYVWkGc1wrdLXeUDeWay/ak3B+ryb/B3Az4zOjSLDho8apZVF6E=
X-Gm-Gg: ASbGncsRK2uTuBBqiHjdYcbeQ/CTq/Ems0BB8k+hJPIrBvBmucu3W1y5VKNgv+ey8QK
	1uRECnyJquHObarkx5z28CoQZ72vpY54Biv42luAfoAA6qzfQGEMxPasXKWEGPLAXdE06hGYShV
	dMO/keOOd5jx4wYtIUmiUffsZSE44/S9aRpgtN48z28QLP/wD3hODLmooFgsSFNtl7lGAyN93KS
	P8mqLQz9UrrehC264M3JEHog3RGuF9NUKmlBP6NyfFdFogbmsf8/VPbB3M=
X-Google-Smtp-Source: AGHT+IH7DdR8iHL2Hi28KJ2xlmMvDv/dz/uFZ53tjjjsjQowPC4CZmmWUVJY9138Dh2OGjHWbB1Iqw==
X-Received: by 2002:a5d:5985:0:b0:386:3f3e:ab11 with SMTP id ffacd0b85a97d-38a87312e0dmr6332012f8f.34.1736436603924;
        Thu, 09 Jan 2025 07:30:03 -0800 (PST)
Received: from [127.0.1.1] ([2a01:e0a:5ee:79d0:125:358f:ea05:210e])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-436e2df3610sm58307805e9.20.2025.01.09.07.30.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 07:30:03 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 09 Jan 2025 16:29:51 +0100
Subject: [PATCH 1/2] rtc: mt6359: add mt6357 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250109-enable-rtc-v1-1-e8223bf55bb8@baylibre.com>
References: <20250109-enable-rtc-v1-0-e8223bf55bb8@baylibre.com>
In-Reply-To: <20250109-enable-rtc-v1-0-e8223bf55bb8@baylibre.com>
To: Eddie Huang <eddie.huang@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=790; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=QOPtwlardGLEi9evReTJWR65j/y1YA1zAVx5xliXYTo=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBnf+t5Uh5A00pLQHAjBhwGqpehhi2NxaAmpv/tdLI+
 QoL7SkiJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZ3/reQAKCRArRkmdfjHURe2CD/
 91UHitfxOG9AFgC4OxNgHslqy/ktEncdPmkEzj4qa/S0mkFFbThl1dTkHiokREYRRHWegB2nIQxR0g
 XXbhL6B2phVKeYwHj/awOTxD/0Xz3f1AIW6uXrReZ9OwPiOocSKEbhkv/TpynTsEglyCKyoMj7uDQy
 ZyRN64qJurasgzdP+chqQA/hVuBMgeY7TKsb9iWUXywCzM5d9vtauWZ11gky3+CVpEcl4nD9b5ACuC
 8YVRgHfV42ZHBjpGancF9Yw2mH+4ZePPBEL71JXGk+4oo5rdLr7cwGmH+b7hCKV8jFRuVvVD7kLeqq
 HykeOuklv0stKYLgkQrYC+m2DVov3dH/LRsTsrwQblw5QTR/kI2z10jO0Myuo28BJxhmUx60Lh2ONp
 KWOxwyX/SDoS85iVCX6rglVYLUyfKHwTQcupnENexHrbwm6e5HdjqrgPYi101AIrpflbv11s/cjHJ3
 fvFQmJKSI02JM6S/jrk2TTZNsFLBLf2SMZneU+p4j8zJuHYUGr0QdqP8S1x6WunOADkV6Mm438Q1vL
 V0E5mPdlrAiREzegdBOG2OJD0tPNO68/a7d3nxlczqX8OYztJnkK7w57Ope9ISflKNBh6O1gHdPpuU
 Q/HMAfzexfkRvazAMpBvYk3hmsPZWtHyAN5tQfuQcFdDutdh24Kx+E0iCAZQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_073006_150826_D6F5116F 
X-CRM114-Status: UNSURE (   9.45  )
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

MT6357 PMIC's RTC use the MT6358's RTC data.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/rtc/rtc-mt6397.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
index 152699219a2b..55e75712edd4 100644
--- a/drivers/rtc/rtc-mt6397.c
+++ b/drivers/rtc/rtc-mt6397.c
@@ -332,6 +332,7 @@ static const struct mtk_rtc_data mt6397_rtc_data = {
 
 static const struct of_device_id mt6397_rtc_of_match[] = {
 	{ .compatible = "mediatek,mt6323-rtc", .data = &mt6397_rtc_data },
+	{ .compatible = "mediatek,mt6357-rtc", .data = &mt6358_rtc_data },
 	{ .compatible = "mediatek,mt6358-rtc", .data = &mt6358_rtc_data },
 	{ .compatible = "mediatek,mt6397-rtc", .data = &mt6397_rtc_data },
 	{ }

-- 
2.25.1


