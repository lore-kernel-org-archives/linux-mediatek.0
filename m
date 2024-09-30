Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DBCCCEB2CD
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Sep 2024 22:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n+VM5TZSFztMjLb3KAfFJRsMesVIdyYR2yr/sMtsQkw=; b=05nt9BQ5bG45t9xVKPO8eRO7F1
	U7jmDDNmDefUAyQXZBHzOfVOCQlLtAWQCxvMwGdP17tReu/+f7QM7evcVLGi0voaMD2rg34Efpyj1
	LtjNyTnpaRWl8g+P7o0wVfGAzU2SEmMlcY6prNplZxoqFxvmCJM13RovDE5yCn4yqoqFX+qTwhyLj
	zJMtz+0BwgEF5Id49oMniI5CFwudvtcB/l907+lugmh4kk8y4qvSO4NtWzKQLAiid5d/RN7Rz9mRk
	38NWyPdQs7BtM8/vigV4eeyP1amFt3qjBVIDEX2WUv2OEQtrJ0oQZETEhnxTYyhsCAtyEysOf+Lbg
	7e/blY8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svPJD-000000014YN-0Mel;
	Mon, 30 Sep 2024 22:56:03 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svPCp-000000013ky-0Co1;
	Mon, 30 Sep 2024 22:49:28 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-718e2855479so3485081b3a.1;
        Mon, 30 Sep 2024 15:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727736566; x=1728341366; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n+VM5TZSFztMjLb3KAfFJRsMesVIdyYR2yr/sMtsQkw=;
        b=EJ/cdm/ngviMF5uVfZm91jdBbKfgFHchH9VZUS4fkJ4Tnw8qu9nNyT1P4W7SH9Hx5k
         +2ZrFO2wbk6PCVlYgn7BGxJIQgKsaoDZ5EkKr29/eXcMCMbUvJBhXuK9aOy3It6LxT9U
         oB4S+VKl47oSDbVxDnr5Ebbza3TzpHE/adbAuSQL9oKoeQ2yWSqX0+kHZHiN9hfQBF2F
         bt5Rt7sOdfigj/x67zhbTjC0Nl3mNaeYZJhxyW5GP7XJbpFCV7XDkJoA5T9PM4uvI0ez
         7RIV4hTfVDAJ78xpnof0s6ThxkmYFpeom2oI3mgIuEA4c0TQVQY01X1yj3cn1ZSNoezl
         8yAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727736566; x=1728341366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n+VM5TZSFztMjLb3KAfFJRsMesVIdyYR2yr/sMtsQkw=;
        b=SIV7/zyt8qlkIm5/JDjramRxFfbxzlzOrX30cIswNRhNk4ew3jagPBadE97Dl3zK4F
         R0JwB6q5ux/nDhD1dd4dMuAs7nCE/yVv2UsClQQQDeL4ZYRUlacGjSq1/jj16sOxHlV5
         rQX+Voo2Y5b7xRiwjqutGMuIFcQ6LkeGjMeqGfHkDPUJJQ/pTlzNKoGdiEyXXAwuLIsD
         LEAYO4r4mIVz/+7/MosyoojYbD2EDiG4xa++1Mp/V/CdDOCUPdts/U2fJXP/e8Vx7agX
         TDhsiGBNOeux7y3JVlurTTa5dk/6BDCnOjRhcbzLpGhfTIJHRtr2SuOhLiZeEyv6182u
         x2tg==
X-Forwarded-Encrypted: i=1; AJvYcCUkACjldJwzHc+RdH2vkXW+7n6e/Il+zuOoBPHP2yyD3bboINtjLaWCi8uU+EqXs7QEchu96DR1ptPp9RFdc5k=@lists.infradead.org, AJvYcCX9G5pha+mR15EPEIVBmjTLmDQi2Wjpuh9Nw+I6pYSIxIR6IwBY7WAvxSwlsS/dTtx8uHMbk6EU7mZ0jYty9Mkl@lists.infradead.org
X-Gm-Message-State: AOJu0YzZ/AX0n3ut8giqetXkZKj0hwjVM6f2J88A4mrKIME+AWN5Bk+j
	Q5H9qLpA82WFc0s58qcLEMofIjsrsTCWbu8G/NPmhXdhBqMu/IwU
X-Google-Smtp-Source: AGHT+IHB+v9R3OPGcEtIwwUWx+aIIBEO/ORAGhDYlWynhw4/iVHFD/CvPXAdYHoa+7TwSGXOYGMmSQ==
X-Received: by 2002:a05:6300:4041:b0:1cf:3a0a:ae45 with SMTP id adf61e73a8af0-1d4fa7ae36emr22105311637.35.1727736566076;
        Mon, 30 Sep 2024 15:49:26 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7e6db2b391bsm7029528a12.22.2024.09.30.15.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 15:49:25 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mmc@vger.kernel.org
Cc: Chaotian Jing <chaotian.jing@mediatek.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH 3/3] mmc: mtk-sd: fix devm_clk_get_optional usage
Date: Mon, 30 Sep 2024 15:49:19 -0700
Message-ID: <20240930224919.355359-4-rosenp@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20240930224919.355359-1-rosenp@gmail.com>
References: <20240930224919.355359-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_154927_107544_2F85DA65 
X-CRM114-Status: GOOD (  11.88  )
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

This already returns NULL when not found. However, it can return
EPROBE_DEFER and should thus return here.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/mmc/host/mtk-sd.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index 4be13b9c2d71..b02cbae96e89 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -2769,9 +2769,8 @@ static int msdc_drv_probe(struct platform_device *pdev)
 	if (!(mmc->caps2 & MMC_CAP2_NO_MMC)) {
 		host->crypto_clk = devm_clk_get_optional(&pdev->dev, "crypto");
 		if (IS_ERR(host->crypto_clk))
-			host->crypto_clk = NULL;
-		else
-			mmc->caps2 |= MMC_CAP2_CRYPTO;
+			return PTR_ERR(host->crypto_clk);
+		mmc->caps2 |= MMC_CAP2_CRYPTO;
 	}
 
 	host->irq = platform_get_irq(pdev, 0);
-- 
2.46.2


