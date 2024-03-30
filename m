Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9178CD1288
	for <linux-mediatek@archiver.kernel.org>; Sat, 30 Mar 2024 21:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lytz4NRlGMjIcJpm2jggdQDN6y6/sjFypog/Jp0bB6c=; b=TM00+qMFseuervWg1tXjPbmBy7
	iVMwfbJ+rMBuYnmfcC91zRHYvu6XSy8mqMSbhO1d+ChM3FPB/6RfLwrlVcKrCMmzsATo4tMc0OeH7
	q/YbA4mkUuBhBofzqNIt+/icafiJ6p3Qy84wRL3pQ3t3fbsfd7J4+fbIKpb7QVosRinKh46GXEH2r
	2+nM5w2pt7iOHkDuMuknRdgUraZugQam1mmKbrmEeLF3MfwWh4MbANGBj3vAPGDGe62qTrt9pS1PW
	k7nLnxKBk8bIphvuXJ+PZgsF3qIEov+o5FWTFcHp+6xaV5s1FmVZ1TLw0AaC0Ch2Bcp8HmBD6hSNl
	U9ZQ/oyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqga3-00000004JqS-3Wp4;
	Sat, 30 Mar 2024 21:49:40 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqfYH-00000004Bve-33va
	for linux-mediatek@lists.infradead.org;
	Sat, 30 Mar 2024 20:43:47 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-34100f4f9a2so2086854f8f.2
        for <linux-mediatek@lists.infradead.org>; Sat, 30 Mar 2024 13:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711831424; x=1712436224; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lytz4NRlGMjIcJpm2jggdQDN6y6/sjFypog/Jp0bB6c=;
        b=yGOGOALtmpqALiYEdX6KFYntQSM6DXopF1B9SuPcKqjEXI33KsQvz9y8yJQuMPn0Yx
         nOAi5GZfRN4oycF0vCws0iQa9CDpanrD16zDTYyO0k9yfexc4pdTGDq5+HQdQ+MmXLeY
         bWVisUTLfxyU3vY9ulzlqthsitflIQRx65A35lmwp5zkWCcF3v3c0Dz1IEIPLjsF3PPH
         4DHyH6SXau31DB2Fo9TC8DtQrAMw6br994g/aVtuHi+h6p7m1Eyuv59vI2UWVCpevIi1
         NQpE/czXuxtK5EBImV9sdvm+4eXgoU2mGzq76uAg6RH1Vo2wbsupKiJrNGT9LSU84iyv
         BfDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711831424; x=1712436224;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lytz4NRlGMjIcJpm2jggdQDN6y6/sjFypog/Jp0bB6c=;
        b=CJvMq4Elk6x0URDIYsum+pbMnAP1MzlbISBfPiRpgNNykULZqez1+E6eF2t/dMcPNk
         rsry2/wkrl6XOYSh04vsyyYlwu0hcxHk5abxbrY3u0tRiVejQcb03jgx9xuddOSunx2K
         TdIyKQBdGveDsJm0+/owKRyc6ajGzqTR5j5w21YRuKaGUvO1mlyAjjUTePnQUU+XR3He
         3sFGXA5PNJ00CjdpkP6m58E8x+CQZGVV6Dn0tKYalxqeOIRqf5ipybVjcs4qLoxamP1k
         pPt8MaGoHlMqoSECtU9bKLyiAUo69zZwKovq24p0Dc9yksgDrDCnr+Z6LfNtm7lnzbYN
         cqBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWou4N7mpxGzSUrhLkUnaydCjrEIOvZjJNAhpbshu7B5OA76c//a0et0TaxEa06PzsXh3WleApjT5FdMMGcPKYc3MiOCJBnsDygKGT/kq/UVCiA
X-Gm-Message-State: AOJu0YzPhiEn8qrf+FVfW5ygExUXNbBQQWWXHFAKElb6jENKD6bRjEZm
	+JveTTkX/F4FWXrBLHah9XuR1Xvc8+JFvmdkrrnWIpTZMdYg0iJ2e+mWzWuSXRU=
X-Google-Smtp-Source: AGHT+IEmC+12zHWKXQrDYIZtxl1tMQr6URkl8P5NKb7hNbBHYUVheUANTikJ3X+pXT1ODg2Gi3mwIw==
X-Received: by 2002:a5d:4524:0:b0:33e:d15c:3575 with SMTP id j4-20020a5d4524000000b0033ed15c3575mr3374244wra.33.1711831424325;
        Sat, 30 Mar 2024 13:43:44 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id o12-20020a5d4a8c000000b0033e7b05edf3sm7231299wrq.44.2024.03.30.13.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Mar 2024 13:43:43 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 30 Mar 2024 21:43:22 +0100
Subject: [PATCH 11/11] drm/mediatek: padding: drop driver owner
 initialization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240330-b4-module-owner-drm-mediatek-v1-11-fd5c4b8d633e@linaro.org>
References: <20240330-b4-module-owner-drm-mediatek-v1-0-fd5c4b8d633e@linaro.org>
In-Reply-To: <20240330-b4-module-owner-drm-mediatek-v1-0-fd5c4b8d633e@linaro.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=832;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=YcU01k3+utKezOFHPg08Yx3HafMCGt2Hy8rvn4zmr1c=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmCHlt2ZfAYGdPMVaud2WYnO/P2J6dEJEhY9cF/
 xWcTAT5AUiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgh5bQAKCRDBN2bmhouD
 185oEACByr63OyistUrAchRSUDePvLKUvea1pTj+6E4Q7EDGWgMV96qccpsRcfic1ckPDR8OUdl
 PAiUiqY3YBNXzQkXqwCJ/qCvhYOZwcfGmRuPXZxbQi3fKgESPqBLfjiJQ1ljMwhVZBu3Xqj6gJ7
 Yy/KKaAroXr2oxP3trIO1SZ5EMnZWFWFOWVHxR72WFZ/SCVyIg4OWl7pG+TGjNeCKBDeV4pFkR1
 xcQX9POwxlD7JFfLDz4lTzaPcrjHiyLiknsb+hMxWl8b2+cHB1WzkGEGwyYStobHvwxJJEVkOEj
 VX8lWB7SOcOy4S0l21nMtN8gFSgLu/q5/+nnaVHm+8XsTK+b5CYgV99B4wwCbl/2030p1xM+tBz
 QQIwisBM8DB0R/RpZuG809+9pqMP/7o1XLQb1IHFoHrIXOzxhNio97ZhXeNq9Zf05fTryfz7uPO
 aKxrsaC45FnvoOXNWAtfgLngEvqZYUkDA/Oo5WV31brU5NrYFx72Pviop4+SxbN0WoWHH8zvQCw
 ml47OAu+Mtq7XkbRX1tkb16TeMLByt2/vzM6HaB9ZGz7PRDkNXoezeUTDZoA9j5Ai5YV6FQzFhS
 FI8Z0DBbUYFcxKk9kGe34NLc20SdvfCCZBw5XFIMWKmNpHu+HSowyD5PWAMd1Xh56m38ZUGfThU
 jHlv1s/GNzDIitA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240330_134345_909466_37B10E9B 
X-CRM114-Status: GOOD (  10.48  )
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

Core in platform_driver_register() already sets the .owner, so driver
does not need to.  Whatever is set here will be anyway overwritten by
main driver calling platform_driver_register().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/mediatek/mtk_padding.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_padding.c b/drivers/gpu/drm/mediatek/mtk_padding.c
index 0d6451c149b6..aed84af5b9ac 100644
--- a/drivers/gpu/drm/mediatek/mtk_padding.c
+++ b/drivers/gpu/drm/mediatek/mtk_padding.c
@@ -154,7 +154,6 @@ struct platform_driver mtk_padding_driver = {
 	.remove		= mtk_padding_remove,
 	.driver		= {
 		.name	= "mediatek-disp-padding",
-		.owner	= THIS_MODULE,
 		.of_match_table = mtk_padding_driver_dt_match,
 	},
 };

-- 
2.34.1


