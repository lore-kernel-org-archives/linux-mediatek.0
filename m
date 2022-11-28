Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 625A3C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Nov 2022 10:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Vs91y4YHGaU4u34bShI3KgPuCoRDr3inolegFmFOmPY=; b=hcDN7gLmWWjF0FE4C24+5Diqoa
	Xqjl+3ah52a9dPODlDvMRb/HgqkABSseRbMnhbQEkUbxNjXudY2zm0kHdzzUaSeIfVrzIEkmcJE/3
	WFxjuz2oAk2fvs0kuUsqVYA/1dL4fP1SydVs5SF/fChqDecyGv+ym8J34bnxSpzUoxOeBCVSdcXS6
	Dsng3XeHnnC1pJBu3nO16exeWq7P7w60ZtxjOX0J8ebpkY+LmjbvpcpD0Uizb6mjy6xTmU9QzRAL7
	h/6ht3Ifw3urkE55MY7qk2lRAyDFood3WTNeBpHrPsBTkmeF90r7o6wxNBkepKmK8S1BcEQBTBNn/
	Eo7Ju1yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozbhX-0016l1-Ij; Mon, 28 Nov 2022 10:49:27 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozbhU-0016jk-Ml
	for linux-mediatek@lists.infradead.org; Mon, 28 Nov 2022 10:49:26 +0000
Received: by mail-ed1-x529.google.com with SMTP id d20so4077042edn.0
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Nov 2022 02:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Vs91y4YHGaU4u34bShI3KgPuCoRDr3inolegFmFOmPY=;
        b=g1wT1jbJufkUIzwh72l46wsx1uYKO6vUXth/QRDGsWDYmz2itJuh2wgRz8gFB54ual
         76YJb90ReXIyTt4Key/8F9QfduafhRtX1068ym/ARwB/w3JJhr4W7HkfdQ4HaSrDoWWJ
         9yhqFuIIlIl5iPlcxM9r1KT+oCOFR18mXqDpQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vs91y4YHGaU4u34bShI3KgPuCoRDr3inolegFmFOmPY=;
        b=bcP/djGTSyt9gGxfYfQpJR/IUIqALqy4qld87RR3MjNMLQUmGwAuvKZ3OHBejF4Mdg
         O8LtIG9c7im2KkcUey/7Hj+CjeWpPQwbgoDigPhuYZFTehOuZrpbqgqytDgJGWduSWqM
         PL2tVAHlImggATcFbDa38jZwFehTAxE1oLPGstjZnhsc5pD06XGKy9CD7JoCgnDMxg+u
         11IWzyBDxBqQlNBJyH1VzdWF4ZlwYhhgfjcLF4SNo4+LyvA5ppFHLh3xbkn0x8u72ueU
         NxstDTnnevzKY8fZ50eJa03KEfAdG6S24mpXu5Nu46mEpcqolGkp8sWYevmUlGidbZS2
         +4iw==
X-Gm-Message-State: ANoB5plY91Zpr6sgBnBshzw3rprIYCtKyAp4VvzNSMSZLzzqu7SYtdUf
	Pm79ryObbLS/qfE/+ZJfap2m7A==
X-Google-Smtp-Source: AA0mqf5hrXjmKOSXxjiJqKrhc6FaO+hU2zOidPRgql2hNwlfmPs5esNtOtTjU/0Dp9iwo7rwPZ433w==
X-Received: by 2002:a05:6402:25c6:b0:461:b825:d7cb with SMTP id x6-20020a05640225c600b00461b825d7cbmr23424438edb.167.1669632562801;
        Mon, 28 Nov 2022 02:49:22 -0800 (PST)
Received: from alco.roam.corp.google.com (80.71.134.83.ipv4.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id e16-20020a170906315000b0078d793e7927sm4804807eje.4.2022.11.28.02.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 02:49:22 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 28 Nov 2022 11:49:16 +0100
Subject: [PATCH] ASoC: mediatek: mt8173: Enable IRQ when pdata is ready
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221128-mt8173-afe-v1-0-70728221628f@chromium.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, alsa-devel@alsa-project.org,
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.11.0-dev-696ae
X-Developer-Signature: v=1; a=openpgp-sha256; l=2420; i=ribalda@chromium.org;
 h=from:subject:message-id; bh=1iNfBQprbCL5uuwJdOOHqaHKJMFyiY6IxXgcAY+v+5g=;
 b=owEBbQKS/ZANAwAKAdE30T7POsSIAcsmYgBjhJIviHDnwbhEMYFc1DDyoI7BOTyJsA2fKfNMrK8p
 kvF64PuJAjMEAAEKAB0WIQREDzjr+/4oCDLSsx7RN9E+zzrEiAUCY4SSLwAKCRDRN9E+zzrEiP7nD/
 44biNT3txpSfvfha5zX+nfGnR6vEZ5/aUznIE7t3v5EjRczkRaxGRDUahFKxVrfRp0FA49fA7X4sFd
 KVwoYZDahx0sO2UZxEkDCC2LgvSbZzCEdIBWK5khVTH5HskDhrUhnGNGMnla7oNl7syeaiWE2TK0M9
 N1fva9c3htr0ZJ4TTVsX3/QgzTcX3yjBBGsWuEEMKJOsZbv2Etaxg5SdJ9iiHbLW/Hy9Zf5gHWTx1J
 gscAlxKYeJVhkbwzm14KK4VZvycIxGcN7ct4cPbdxBz9r7fmPE1hSgAgqGX8Bw2awcXoEpEe0eOuCs
 yxvMeHXMK7dqnwhM+kXYPhljHkACNAwQORPRj1kvh+UnQQ/rE9yW9+5vyXrUGT0h8YsjMYqXSdMu9p
 fqp2TviL9spcEmukM+bgvHcAr/gzuJE+2xWosZ9Jt+Ybc0kwbc2pk755JkN7A5i2TdRHUz86L2xwhZ
 Qqz5NG6qp+qhX6wxx/dEiBOKhrr3MlAyVNVRohBN+iuAJ4ZfirvCLaI6Q/9YgyvlXszvfCWDna9Len
 bTmuYjX7Dqe1S6kyc25W/v6t+rlWao7KXbvFxUuRa0trMISstb93p+uLXVzc9eHR5uqgp+sralQNnL
 hu3L2ogYp6R3e3Gj58KOCtpPWzOgnY4fNwe77KAuxySKgrqpyu2TSBpelY0g==
X-Developer-Key: i=ribalda@chromium.org; a=openpgp;
 fpr=9EC3BB66E2FC129A6F90B39556A0D81F9F782DA9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_024924_795667_09692334 
X-CRM114-Status: GOOD (  13.99  )
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

If the device does not come straight from reset, we might receive an IRQ
before we are ready to handle it.

Fixes:

[    2.334737] Unable to handle kernel read from unreadable memory at virtual address 00000000000001e4
[    2.522601] Call trace:
[    2.525040]  regmap_read+0x1c/0x80
[    2.528434]  mt8173_afe_irq_handler+0x40/0xf0
...
[    2.598921]  start_kernel+0x338/0x42c

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
To: Liam Girdwood <lgirdwood@gmail.com>
To: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
To: Takashi Iwai <tiwai@suse.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: alsa-devel@alsa-project.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
index dcaeeeb8aac7..bc155dd937e0 100644
--- a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
+++ b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
@@ -1070,16 +1070,6 @@ static int mt8173_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	afe->dev = &pdev->dev;
 
-	irq_id = platform_get_irq(pdev, 0);
-	if (irq_id <= 0)
-		return irq_id < 0 ? irq_id : -ENXIO;
-	ret = devm_request_irq(afe->dev, irq_id, mt8173_afe_irq_handler,
-			       0, "Afe_ISR_Handle", (void *)afe);
-	if (ret) {
-		dev_err(afe->dev, "could not request_irq\n");
-		return ret;
-	}
-
 	afe->base_addr = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(afe->base_addr))
 		return PTR_ERR(afe->base_addr);
@@ -1185,6 +1175,16 @@ static int mt8173_afe_pcm_dev_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_cleanup_components;
 
+	irq_id = platform_get_irq(pdev, 0);
+	if (irq_id <= 0)
+		return irq_id < 0 ? irq_id : -ENXIO;
+	ret = devm_request_irq(afe->dev, irq_id, mt8173_afe_irq_handler,
+			       0, "Afe_ISR_Handle", (void *)afe);
+	if (ret) {
+		dev_err(afe->dev, "could not request_irq\n");
+		goto err_pm_disable;
+	}
+
 	dev_info(&pdev->dev, "MT8173 AFE driver initialized.\n");
 	return 0;
 

---
base-commit: 4312098baf37ee17a8350725e6e0d0e8590252d4
change-id: 20221128-mt8173-afe-5fda4512e8b5

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

