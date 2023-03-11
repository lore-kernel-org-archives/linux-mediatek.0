Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 564FDC6FD1F
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Mar 2023 11:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fqnFWHdK7OkL6s/x+Horh58nZE+IP653IunDnJQbJV4=; b=UHrTVyr8J4jFDegIeh24Q5xeHX
	h9M1ze7mtUGkM/L68RvxDcQFIcBr8QwokdqhjeW0rvkKcVZwH2AoKfF64k60tLX2dlgumGxU+XH94
	+/tM6JtkzM4V4LpjnbuFJAnz/R07SgvB5Zs6tdpAqbzRaY0FPm1uQeeu7Yh+uh1usOhC/6DfR20t2
	xmTl2s6jFx4pjBfjIuMIG/D+kwl6ZOW9kCgE8xWlALVcrAWOpNWx5KNnRugRZfIJs7A3AvfVeXeF1
	h/2eMZn6etlPIX5BDiLzbXhhYPJDfu9pbAx0nHhZbcfNGxLYXe2WQl3NDWLkttAeJKktA4Df+JCxy
	MengFDMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paxDC-000GJm-Ok; Sat, 11 Mar 2023 11:16:30 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paxAs-000F5t-Jx
	for linux-mediatek@lists.infradead.org; Sat, 11 Mar 2023 11:14:07 +0000
Received: by mail-ed1-x533.google.com with SMTP id o12so30716228edb.9
        for <linux-mediatek@lists.infradead.org>; Sat, 11 Mar 2023 03:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678533245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fqnFWHdK7OkL6s/x+Horh58nZE+IP653IunDnJQbJV4=;
        b=wn7FVQFl7D3LMIfw29Qi1jtJ1MVwkM0EDx7SDmMVlQpPZ5Z8OlHgNky0ImuXoqfRPH
         HOIBqaVfLiMYyvenIsfFpJilxjljVUcOfIlgnqBk+mRvo/SWhWQF64W2CdhCzeQ68l+c
         JLHt6bAMGJVOWiphYP/YUW7qz0QALjbqRPxYK8QTi4EL1dX4/vYfi145nYdkd5ioNFPx
         YcV3bsrvZ41Q6CCxd73yqKiSRoOL8cHmuIzg1R/Co0Y5ryPOtRY4bb72pGfD5Arr7eoq
         /i5vHp2yfNDSzSrc/YDFxPvyaX2mx/q7nkH/1KSTA46KnLsPcmcJgDngsRDyam/mWby1
         GFLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678533245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fqnFWHdK7OkL6s/x+Horh58nZE+IP653IunDnJQbJV4=;
        b=xNjSJvs5Mn/lD0D93S3eSgpxypid0DddJq1taWYLrTYB/dtNHWJfGgNgT+GIuMjGx7
         HHUd9f/d5EJJ3wBlrqWOpsx8ImCmXC0HTgwlrSUAaznuRMofTXIYyhXGOkPwDHKXR10K
         nGhtm9pF97kyrZtHoHsRoXK0YYa8L58SwAgVZTyePaokGwOVsAhC/3j1t1hCfDinLWlZ
         d1pFZfdf8mXKiG9iLpTIOe4BgNmZYNd4RlTqF/kKU0VtWqv8hwWCM6+isszvJSRrctrd
         1AmBRG7Qxuo4gSH0AypSTWQFrlz4rO/ULOcVxbHltbbJQMV7hEVzCvTgIa75uIGtjgkt
         5M5A==
X-Gm-Message-State: AO0yUKVg+iALpDc/VMMwCZOYck3781k1+Orlp9fMRhiy0mnCt4Tf2pgG
	TQjQuMFXr32YEapQug2ymBsDcg==
X-Google-Smtp-Source: AK7set8FKt7DgZJCxADdonM8M5e0Zncbtd5P2PQt9Jg/NcC9iy3KbzD1PtBGcdMWo1JVDQsA6rHrqQ==
X-Received: by 2002:a17:907:7f87:b0:881:44e3:baae with SMTP id qk7-20020a1709077f8700b0088144e3baaemr4671177ejc.54.1678533245427;
        Sat, 11 Mar 2023 03:14:05 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:fa97:2d7c:bdd7:e1b])
        by smtp.gmail.com with ESMTPSA id q12-20020a50c34c000000b004bf2d58201fsm1053859edb.35.2023.03.11.03.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 03:14:05 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/4] Bluetooth: btmrvl_sdio: mark OF related data as maybe unused
Date: Sat, 11 Mar 2023 12:13:52 +0100
Message-Id: <20230311111354.251316-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230311111354.251316-1-krzysztof.kozlowski@linaro.org>
References: <20230311111354.251316-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230311_031406_714322_B328B7FF 
X-CRM114-Status: GOOD (  12.22  )
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

The driver can be compile tested with !CONFIG_OF making certain data
unused:

  drivers/bluetooth/btmrvl_sdio.c:43:34: error: ‘btmrvl_sdio_of_match_table’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/bluetooth/btmrvl_sdio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btmrvl_sdio.c b/drivers/bluetooth/btmrvl_sdio.c
index ba057ebfda5c..d76c799553aa 100644
--- a/drivers/bluetooth/btmrvl_sdio.c
+++ b/drivers/bluetooth/btmrvl_sdio.c
@@ -40,7 +40,7 @@ static struct memory_type_mapping mem_type_mapping_tbl[] = {
 	{"EXTLAST", NULL, 0, 0xFE},
 };
 
-static const struct of_device_id btmrvl_sdio_of_match_table[] = {
+static const struct of_device_id btmrvl_sdio_of_match_table[] __maybe_unused = {
 	{ .compatible = "marvell,sd8897-bt" },
 	{ .compatible = "marvell,sd8997-bt" },
 	{ }
-- 
2.34.1


