Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CB9BC6FD1F
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Mar 2024 17:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g8BmwG7Q6jYnzmtteAjttsKel77uSlwfKjjKo/sXHv8=; b=PrrSh3CV3e3wU+B0K8VeGwZLyf
	1z3l4BL44RXT9lr4du0w1Eic/M6uZerurLV/VaWK3TzkR9TwK6WUY5TfJ4f68HvCJMfF0jjNV4CC8
	pTIGp/7cOwRMaoAeXa9fnG6Sxlbe+XLqNs5gI+H2DOA2ugdlF5K157ZUGppta3LIWnHVwo6gMK0CP
	hqC05y+rA25SzI1kEGtqZQN68JbozJDk0E++DU5je6Mrnm2KHQwp6jTgIfJo0AvooJIRvdDST/T0R
	fq33g461es0MecCPG3AIdzMZC5S0IusPSrZKk9cfcua+4MfBSUFMklVHAGqC4HnSTI0AjQYJj58eG
	C3ccIy2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqFz5-00000001T5Z-1ky2;
	Fri, 29 Mar 2024 17:25:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqFyP-00000001Se7-0la4
	for linux-mediatek@bombadil.infradead.org;
	Fri, 29 Mar 2024 17:25:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=g8BmwG7Q6jYnzmtteAjttsKel77uSlwfKjjKo/sXHv8=; b=UYESKJdEtUL2F6t4PEnrkqhsI9
	Xcn2AE92+aVfA2KVrr9JYJDUZAyyX1DAESRt0/R/T4Ux4OP1wK5igFJD5No+N6sfxSPzUpyh6iN6l
	HcYc7lvgSv5QRWg052SbPmmC944H9W3Vdj5Xq0mDoq17R4yAUrNA/iv5L8ksGLgzfj9rFsopj6e1T
	AJLN3bGlr5qBxGvNCM5cneYb/zUFNEcg2/zUCbLgkusmPhtFWu24L2XVwAtipbgSgA+HsPZRdwB/S
	AZbwdExoPteTzSw19iNUrLfcENUtkco68+9Uw7gLbgQVRwgi8ZzA2BUrLYzA6e8sSq9nhpol+CRTp
	50h4sibA==;
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqFyL-00000001fsl-3ukq
	for linux-mediatek@lists.infradead.org;
	Fri, 29 Mar 2024 17:24:59 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-41494c040a1so14879185e9.2
        for <linux-mediatek@lists.infradead.org>; Fri, 29 Mar 2024 10:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711733096; x=1712337896; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g8BmwG7Q6jYnzmtteAjttsKel77uSlwfKjjKo/sXHv8=;
        b=LJ9acMZBvgjbe/KewIBCZPB61L8UDQopkxb9gtiV/Jq3+7XhuHj43h/k5RzHxT2r0p
         JoB9+1RCllTYEYZnIwlL7mgwER2jiOKS+CKg15HJCIwf/49JFndbO1wfqKGR/e2Xy3U+
         57hWFqBBA43yPJHtfP2dX0ocO0WWrnVDI8sjuSTgWMaS1UCIpOSTmNwbcRjgbTxtlcPT
         kMRDdGIfyG2+Av8Am0O9/AmHU8DE/eSH9JjPWhqIw5ETtMyADDEmqKFXlGViq5QaGWS8
         f425B0VfZg16mDlq3XcJD7/wcVuinzyOVA7jOzO7pCc6fAY9nGms1L3ec5DmMaC7pc/r
         6G8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711733096; x=1712337896;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g8BmwG7Q6jYnzmtteAjttsKel77uSlwfKjjKo/sXHv8=;
        b=ErAnZdvdKXPd2i0ttsW0+Muv5xv78axH+UOTXG3YUYpoegY68s/lSJOHINd96Y8wTT
         RNiEv44W2QKZ4YGnDGOmXuJIqGaJnPt3T4diQec0UzzpXk4S7Q6R39jUraXBYHJ6KsqU
         PrzLA1IR8nByTmcf+dR+vcoQkBYG9mrhCfwvp83Bi1jaxX4DxUo4Q60QDkhNJ2WmA/ef
         mN13D7SvY8Julgbw9NmLkbj/MJ2g86G5h5SW+K04kky1cv/ulxU400XBv8QTh7w6iTvb
         VrHORvoi1NvQjcnsJTm2dLOzMKBWtnrm2s35q1O+Q6BmN2AKmpMG3Ec/Q9f/LyzVo8FS
         2ZlA==
X-Forwarded-Encrypted: i=1; AJvYcCWz5eAHH/jp2v5bJMN7ZmNzb94Cd0d4b3C0+WA7ysnUslx7rb0dmqONofrg8COgYVqrlqpgBTumpRHxJtfU0fRoJ6IEWduOY16fK5JdRuK9WxdU
X-Gm-Message-State: AOJu0YzRMLLvTMbWIEPVRctwLD/6tEWDyk2IggM1m5Kd2LGe0j0FfJI/
	/IFK/CJfHh+Jtm7bLTRYP/bEHKAi/xH1Uz8jQsQNjnfvchrCL+Ijguwf46Ar96M=
X-Google-Smtp-Source: AGHT+IGkMQKZmBwfysAyXcTOIdEaETGLP8XC6UQptvkkNiT6RrRdfIxr4AefhOFV8q8KgXAsCgTSLA==
X-Received: by 2002:a05:600c:4f44:b0:413:2c4b:35d1 with SMTP id m4-20020a05600c4f4400b004132c4b35d1mr2416556wmq.31.1711733096290;
        Fri, 29 Mar 2024 10:24:56 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id v8-20020a05600c470800b004149543c82fsm8491069wmo.39.2024.03.29.10.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 10:24:55 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 29 Mar 2024 18:24:35 +0100
Subject: [PATCH 5/7] wifi: brcm80211: drop driver owner initialization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240329-module-owner-sdio-v1-5-e4010b11ccaa@linaro.org>
References: <20240329-module-owner-sdio-v1-0-e4010b11ccaa@linaro.org>
In-Reply-To: <20240329-module-owner-sdio-v1-0-e4010b11ccaa@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>, 
 Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
 Arend van Spriel <arend.vanspriel@broadcom.com>, 
 Brian Norris <briannorris@chromium.org>, 
 =?utf-8?q?J=C3=A9r=C3=B4me_Pouiller?= <jerome.pouiller@silabs.com>
Cc: linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-bluetooth@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-wireless@vger.kernel.org, 
 ath10k@lists.infradead.org, brcm80211@lists.linux.dev, 
 brcm80211-dev-list.pdl@broadcom.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=873;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=wDiiPdIToMYXQU5+yRee3/V3ANx19Hr4dGWjE2WOnus=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmBvlbWI+uz/9YwUaNlefiHsHpsoaQewqU+4KoC
 5vsAyo/lEyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgb5WwAKCRDBN2bmhouD
 17wwD/wJZQBJuomWoovMyFzif8oMaN6Puy7t9a5St5yy/oTFPoU3mqYzYEazstQewmxHvQUC57q
 12gVOI3lkjSN7jECNwwVrruhMnyzAPJX2Mj363zHzxxFAIWv02+1K2uoYMSiT3tboYo13zUUKAf
 bL2FV8El6mxFZoLTjYq+j+BQVkVDUxHH3vDDj5Gb6s5/CDQaSXMbzmJV3JM59LwxwkIRXOkDkp1
 6r4wkWH5vTAefQZbKuKd0GY+kaQ80eHpOhz5R+QbBiAWJ4KJoEKLXHFeXZJErpRRfi9vQgl1E/k
 Nds/H3lTLJ/HIIZv3545bPWIl7uWDabBQpm+o75gegBXRaW7DOP50XRPktxUF3cdtxXqz4IP6/n
 f2Ef/MKjS3MVCOlVsVThZS9RaoNQKbuM3yhDETpqBOv6Xv98szOYEkYtr5EQmMMkqydFE3FS50D
 30FIFa8pX2wUEu45dM3tEsXtoJn/CwiaDctGHRJfVHlBDC2pTeMT8eVp8SeRSEGIMmm4KNX4eHB
 PkQFlm9RMpykklRbyAQenHDshwl1WuDToLRkFW53XltZd8xXR4B5bYqMuV3Wdp8KN50y+1bUUxB
 Z5KPesX3r313jcBNZv7LfYa8aob+hVnPATZeEuObcXJCmEIndjEz5WZGaPdhbniutXm9FOlcdOm
 vozlrq6EJIGUBwA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_172458_252346_640615D7 
X-CRM114-Status: GOOD (  10.69  )
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

Core in sdio_register_driver() already sets the .owner, so driver does
not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on the first patch.
---
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c
index 00679a990e3d..13391c2d82aa 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c
@@ -1238,7 +1238,6 @@ static struct sdio_driver brcmf_sdmmc_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = brcmf_sdmmc_ids,
 	.drv = {
-		.owner = THIS_MODULE,
 		.pm = pm_sleep_ptr(&brcmf_sdio_pm_ops),
 		.coredump = brcmf_dev_coredump,
 	},

-- 
2.34.1


