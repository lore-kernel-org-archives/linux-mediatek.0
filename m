Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B462CD128A
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Apr 2024 14:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KtzghwkQC0PmjQC/FhDBGdEgi78pS9U5YA2ZXwW6cgM=; b=Tl7oSWXnEaLLjvDuN0YLxwdIzH
	pTQcE8NlvhqmTLCHH9C5zZt4yOB3aYdFNnq8h/bH8hspNQYlYx4Sl/Bjdd8ap4aJppKAgWIH4BGwu
	L9s4K2rNzxwVhQzdtIj1GoaPQTV62dDKGrYSKdB2f5umKUmMbyuXBHwDDlYzsbmYkWmdtAjuaNMyn
	AmNbHX0jLSaMfV9MTv8s5LwSThRL+nckmrT0Yjfq5Dl68R60VfynJZdSB8TtD/bIG1tp5CUCtPY/9
	t/x+N1/4nTd0ggXCsezpD/pC8RFmdc9coSY7w/C5YiL01W7pnW0iPn3VdwewKSDa6AhNg8yFOX92W
	+igtByEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs1Qk-0000000GPrI-1Nj8;
	Wed, 03 Apr 2024 14:17:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs1QW-0000000GPia-0jr2
	for linux-mediatek@bombadil.infradead.org;
	Wed, 03 Apr 2024 14:17:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=KtzghwkQC0PmjQC/FhDBGdEgi78pS9U5YA2ZXwW6cgM=; b=fMkUfbj2ixOZ2N6+kawQ8v0nJe
	29d4FThscCa4fgYKn1n79UBWe6cN0vJwxPvpU10+A4pB6pFE3zGRszZpiKkl28mMtTuXWDIqr4B5K
	4ro4h4iw7nLuKI6DRx666iA0noqipMrZh8gBCX49Nuoark/gjJiZwc0zjgGaOyiQULEI1+3VlHQX8
	uKuH6G9j+aG88D2DDH//FvJedL+qeibL8h3rqVJ1fTIaKPAAcWKEZqeDWo78qmhwhwFo05fAsG3Ba
	daUBW7ArMm2aTZOiO26n1sdWyFN9+R4svNfZXvz1XVq4FOdOWAMA4EteBe1UJYhAFN3YeOg91AYpF
	zEjKDyGQ==;
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs1QS-00000004GVR-2Il3
	for linux-mediatek@lists.infradead.org;
	Wed, 03 Apr 2024 14:17:18 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a4a393b699fso173618266b.0
        for <linux-mediatek@lists.infradead.org>; Wed, 03 Apr 2024 07:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712153835; x=1712758635; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KtzghwkQC0PmjQC/FhDBGdEgi78pS9U5YA2ZXwW6cgM=;
        b=RVPRS2S9xfzPNpLwg4U0fj8PL1Gn2qsXXvKLj+Y/T54lIGhLaGIMF2iM2R8eMaEc1U
         LGBvSfKQHeormhZT11lLdFLIEPKk87JlXvpmyLXZIfblR3fYWH50oIJ2MEj3r4WO0t3M
         +Jue9SpXnupG7HaL+X5avU1LALYuyeEGnGOLn6NzRg9odcbIFQuo15yM+Vhls9LuoHTH
         eXJGN6BgL8+CbjNUIUH+uok4oh2kJg5mVeZQP9z7vwIktt1AbgGjJdmOTfdH40zqbaGy
         7UvR+LZEvMEPr7x1nGyg87NkDiu3otd9flYs22SQrSy/YJ1OWYXrONstWJNMx2UUUDDj
         gVtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712153835; x=1712758635;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KtzghwkQC0PmjQC/FhDBGdEgi78pS9U5YA2ZXwW6cgM=;
        b=XkQaKpxwZKvTwDHYP3co8hmyBjVuPB4qTdpjareVCIz2OHUon6TB9Is5IG7qx2Z+K5
         AbjnkbXbBPTF/YwFR/t6wt50BY1V1ni/fow0kkpKj+UQvE4UMfGQwjzrdfgfU8W7smJH
         q7RuQ35a+8lqePGXwJiBFTRztl/fRfP8bHCEu4ClqXy4ubnTGMN51VamhyGPTmuuf8w8
         YJpHeIBIvycgvS8kmLaJB1cRC5WEESvasnAowCDfpPcHNyBPUpbwqzvDtHrvV9k6b9nk
         iqglhRRpv6l/rFs+Rwq6Cp7/vVIdqjorTrvKPSlZmInZkXNPq780h20onfyJHIHSVoHH
         IwFw==
X-Forwarded-Encrypted: i=1; AJvYcCUihqY86J/3CepEwun09VaA04sA6miPsB5WKepOFL8wOmbc+3kfqjLUMzdhtZrltY7zeH1DZFcDhccLwStCK8YNRJRKEWZQXLnDisZzbXxhsXER
X-Gm-Message-State: AOJu0Ywi3H38GPCvfe+tjB2xQ2d9EOTNrcc4gFSRgElX2tCzXnTHh22d
	HYK3Vm0gXL0Dtr9ui9zPE1EqxHdXGT6mkI5rjMDsz+Fabn4tM4qPIPUYS5x9UW8=
X-Google-Smtp-Source: AGHT+IHhgEWh9iPNOPHwnOG5Ucf0f1VjLhJAnC0jPd6Py8JOZqFE+ITUDFrj/tVu+BgC1bMNTDrVYA==
X-Received: by 2002:a17:906:f203:b0:a4e:3841:8da9 with SMTP id gt3-20020a170906f20300b00a4e38418da9mr2445038ejb.23.1712153834987;
        Wed, 03 Apr 2024 07:17:14 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id he18-20020a1709073d9200b00a4729f093ecsm7737819ejc.53.2024.04.03.07.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 07:17:14 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 03 Apr 2024 16:16:54 +0200
Subject: [PATCH v2 5/7] wifi: brcm80211: drop driver owner initialization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240403-module-owner-sdio-v2-5-ae46d6b955eb@linaro.org>
References: <20240403-module-owner-sdio-v2-0-ae46d6b955eb@linaro.org>
In-Reply-To: <20240403-module-owner-sdio-v2-0-ae46d6b955eb@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>, 
 Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
 Arend van Spriel <arend.vanspriel@broadcom.com>, 
 Brian Norris <briannorris@chromium.org>, 
 Francesco Dolcini <francesco@dolcini.it>, 
 =?utf-8?q?J=C3=A9r=C3=B4me_Pouiller?= <jerome.pouiller@silabs.com>
Cc: linux-mmc@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-wireless@vger.kernel.org, 
 ath10k@lists.infradead.org, brcm80211@lists.linux.dev, 
 brcm80211-dev-list.pdl@broadcom.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=936;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=+oQOj54E8azRB6OAy0SBTyBX7qm6Cw4f0BTTdrV/19g=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmDWTdk4remwYQ8MPd4+0bn1vbzqllLhREEFzZE
 nqHbYhDUiaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZg1k3QAKCRDBN2bmhouD
 10GHEACVe0SHPfWrkE8WfxpC0NwDclSzh8WdeUe8P2iGIhi2sSBmHMWdbEVvwA9PEG7eDB+lXHQ
 y3vG54Y+GTZz3oErC9uQb+hWN3JzA1tsIZww1h9xrezZ+dHz+FpsZhz6VWSG271LLle0fmTzzzC
 3/SC+j3CiyPS/JRWizY1s4AxuFuSRiN67/LUGaXDQd5+VDig6n1gdH5oByYOnL2cZNDybG/fDje
 qSXiUl9pkheNK39WKuvwn5jVwJxdohynYCmR2ePhSJfLvyroUxXque3MgCqvk6DS61IR88VqP4X
 P3uEzcVFQCghvmhnv/Mj+gBdqOV/BJAjvC0Q0pwAfNKIv2A8LSd8KsvGgG6aalFW57nuOw8HC87
 5RoT8klgd7VwJA2f0bvjXtsZXkoIoL+73dU3mShuF5Ara7wcxpXXBrzpZdrJ8exjN3L/UYqbAsr
 MjQGm0YUEnN7MshNVlBNwx39kWCCvv5HV6qF31vpKcYUNjuD2FXj1n17JGqMO4pTPCn2DAUeyvd
 gQ2Cs2YcDuT78OzcrktDA+vylKPDyonrGSChlZ4WZWO7oiy64jN1KTzFJHsdFO/0vC3oOX1ts/q
 au+zXHVRkAi0iqcmT28UKAxFFFpWHoKMiv/HLfDlAWvQrtH3zcR0IoZdl+WyAU+Wx+uXvOAyNji
 8iU4ZZ+B2ce9nVw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_151716_858911_BD2A404E 
X-CRM114-Status: GOOD (  11.72  )
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
Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>
---

Depends on the patch in mmc tree.
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


