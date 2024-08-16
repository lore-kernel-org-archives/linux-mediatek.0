Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8D45C531DC
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Aug 2024 15:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i72cl2LG6rsfBE9NuFNe0vCjzQLf8lqqkLVcJWffpKE=; b=SIf4ST4C9EVbJ7UaRwgB8Iw6cL
	4YXh7oAZPmoavH3/t3lLbDI5epbngAYKL0AMMo88bvIL7l3S3/096fG0nmU5yml3MfKxfqaVtDJvu
	si/zi3E2tjdFIrGzeQc7WN7frQeANh8Od/IMBnknAC/MeojuyZslDq1D2DLAzy5TnGj2cONHaf9SA
	OffyWpwhFX41w6A4fTz47Mi4KNatz8WmpWWQdf8bNgPrf2JqiAt2aBD0MH9KxgPyqIGT8gmn/gNiU
	4eWpNRWi5czYYx1Nctkkl4MKmuGtWeJCTz4m7/iuVH9gCLBlKGSi/Nv4nHqKYIS4Fc3+1JhydKKt5
	olv88Ojw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sez5m-0000000DREp-2UtS;
	Fri, 16 Aug 2024 15:42:18 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seyw8-0000000DOky-2KBK
	for linux-mediatek@lists.infradead.org;
	Fri, 16 Aug 2024 15:32:22 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-37196229343so437365f8f.0
        for <linux-mediatek@lists.infradead.org>; Fri, 16 Aug 2024 08:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723822339; x=1724427139; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i72cl2LG6rsfBE9NuFNe0vCjzQLf8lqqkLVcJWffpKE=;
        b=WD8adzXUIk/khadRaCUzhmKiEK8Ge8gzlE3758odUdMK+4yBubiCfpxxtLE07G/2T4
         IAbZQmzwTulptu7/w4JyHEV7SEK7B14x1yh/ESjmRC+Yax1DFkPEcOmWUi4QldCg7Pky
         avJf0rftgIKfqRj7qajjSDyoRN/STsbAqXGuRIb1dsaCKPz7M/qNw/RnLKulRHVwzcAZ
         mmT6e8OyNDkcBNsSxyELtPSx/X/3l9MtFjRnRiJz0Sn3lm1vRGMloP3wQdIfmY0Y+pJT
         +ZTa9s1Y6/Tdy6Gd5MeaYprkUfBANGcsyp1Jmkacz9p6G6jLBA0kSYpqCcLqbgIGoyep
         nkmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723822339; x=1724427139;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i72cl2LG6rsfBE9NuFNe0vCjzQLf8lqqkLVcJWffpKE=;
        b=t0GHRDr79LHysGzkyQpzLZWfidawzw1eCuxzJBLau783N7mPCsHZANpvIeHQ/K6Ko8
         Q7mglTv9QWOhuuYYvITxcq3T9Cp9lZxcngHqpQ6v6ghyWxk6ZH8aRnack8K7mHIiTxjR
         FSDFKe0RdDamgti8XCLHv7/5Rm/5oiA4WOJJvvdNWq/6d85mxSa6xjQKCgKDUZh9y9kR
         paUIpHeL1wNlKl3PB/C+dP5tchpE7MnlkDNBjL+6WH2/cQ/M+JdV0vfURDKOd3f3C1+R
         MtZYomVSExMk5s42zFdj3vV66SZOy1VqNgsFZ98l/SZcFdrDo2hKNdxbJPwsncfxl/F+
         +zqw==
X-Forwarded-Encrypted: i=1; AJvYcCWnrEsP0oPjjmFGZY4piISPoKxWrSLGQyzgDSba7bV5/C5Z8kbo6OMNW0uxRCebudq9nVEZrskyI9mniz/kh2++PJU1rImLOx11xfTkMDBc/MLY
X-Gm-Message-State: AOJu0Yx5HWU/trtCtwYMUrYDk1c5435rPCD0JB39v2KZp5xPdlXtsYL9
	j+/ZDIjmTM5dFDBSwp3BGRe4ioqrLdxsEuWkYe/XsBHvc8LyxsFgcoJWGbUNyvAMFsaO5EGx/4d
	O
X-Google-Smtp-Source: AGHT+IED0WYx0TreQX2OrKap07J96mSpWj6wWPju1D8qe2yhsCsW41zGu895F7DsFQ1Mn543/zW+Kg==
X-Received: by 2002:a5d:4b02:0:b0:371:82ec:206f with SMTP id ffacd0b85a97d-371943293cdmr1861574f8f.16.1723822338955;
        Fri, 16 Aug 2024 08:32:18 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-371898497f0sm3853661f8f.39.2024.08.16.08.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 08:32:18 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 16 Aug 2024 17:31:49 +0200
Subject: [PATCH 17/17] leds: qcom-lpg: Simplify with scoped for each OF
 child loop
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240816-cleanup-h-of-node-put-var-v1-17-1d0292802470@linaro.org>
References: <20240816-cleanup-h-of-node-put-var-v1-0-1d0292802470@linaro.org>
In-Reply-To: <20240816-cleanup-h-of-node-put-var-v1-0-1d0292802470@linaro.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Riku Voipio <riku.voipio@iki.fi>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1848;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=evm4/Qf1Gix0CG1zjk2y90RZHb2Oo+FXRI+CwqZngfA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmv3DojUfs6j9ghjY8rYQZeR83/DBn5C5vGVai7
 SH1nEKJD1aJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZr9w6AAKCRDBN2bmhouD
 12UID/4yUfw9u/p7xohuwxORPZDDT+wUHcCCjyoUV2diG+Nd0Oqzcv35eu6NeZNl7BNB3X0EQoQ
 VQn8BrW9aEHJFgdQC2UPhVqwKnqyy2th/AJfD9MDAa63IdWIdTPI4ZAUqhAMFTHyj4QCIM+Cewp
 6LSA+M0GHdFwqqZXKWRyINxmfNb+nD1yOcUJSn1p4mQVAlwWCr5tXZEmhFh/pvurGumxCqeHGt4
 EEPK8uuEV/ZrxuMoKFKYaZxEmbrQkvfISkoql4+54GXtQ4u7qmSdTqCSESVW8wrX19GteWzW34w
 /3rW7iV14tptFvALyHd80HwsDP/FpK1oa9PDUI4ukf8VXk4DMcTg0/DlK553j0gew5RgjMZszdh
 D6o0hFLVuvoe4M/wRvnYDb2c/HvPKNwKG2yLIkft3ezelGstcfsyprKU6Wvg9ui2s4MSiYcfIpb
 RkiasvWRnhtsxaMbCeE0GbtB8xTkCUJufOlMHca6MY6/0upIL7buM+iZ2gQD03zfpWZChYZ9xRT
 noGcSiHIFcHWGBT7QU3Aac96iJHkrY4pfr8vq2oE3o8DZhpegNlm58HqHDk0kl89GIR+JuccPSF
 ZN/CyNtXDJP5V8DPnd4ZHC6QzRAeZYyQ3PrXV/BluuDVR+gcWQ4G60i6McsRcpRxELK+EFjjgst
 yLwTWCItNdg6GjA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240816_083220_603963_5A21B902 
X-CRM114-Status: GOOD (  13.25  )
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

Use scoped for_each_available_child_of_node_scoped() when iterating over
device nodes to make code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/leds/rgb/leds-qcom-lpg.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
index e74b2ceed1c2..f3c9ef2bfa57 100644
--- a/drivers/leds/rgb/leds-qcom-lpg.c
+++ b/drivers/leds/rgb/leds-qcom-lpg.c
@@ -1368,7 +1368,6 @@ static int lpg_add_led(struct lpg *lpg, struct device_node *np)
 {
 	struct led_init_data init_data = {};
 	struct led_classdev *cdev;
-	struct device_node *child;
 	struct mc_subled *info;
 	struct lpg_led *led;
 	const char *state;
@@ -1399,12 +1398,10 @@ static int lpg_add_led(struct lpg *lpg, struct device_node *np)
 		if (!info)
 			return -ENOMEM;
 		i = 0;
-		for_each_available_child_of_node(np, child) {
+		for_each_available_child_of_node_scoped(np, child) {
 			ret = lpg_parse_channel(lpg, child, &led->channels[i]);
-			if (ret < 0) {
-				of_node_put(child);
+			if (ret < 0)
 				return ret;
-			}
 
 			info[i].color_index = led->channels[i]->color;
 			info[i].intensity = 0;
@@ -1600,7 +1597,6 @@ static int lpg_init_sdam(struct lpg *lpg)
 
 static int lpg_probe(struct platform_device *pdev)
 {
-	struct device_node *np;
 	struct lpg *lpg;
 	int ret;
 	int i;
@@ -1640,12 +1636,10 @@ static int lpg_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
-	for_each_available_child_of_node(pdev->dev.of_node, np) {
+	for_each_available_child_of_node_scoped(pdev->dev.of_node, np) {
 		ret = lpg_add_led(lpg, np);
-		if (ret) {
-			of_node_put(np);
+		if (ret)
 			return ret;
-		}
 	}
 
 	for (i = 0; i < lpg->num_channels; i++)

-- 
2.43.0


