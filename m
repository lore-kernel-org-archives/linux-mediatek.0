Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 025B3C197A0
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Nov 2023 09:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gm1vhROaHDruTkjEkYQ+e3YE5nLctFy09vafq9HP69k=; b=OE07+FiMzvyYrjccVBd63oogoE
	mLAuHqB/ap/lMKTVZTMeO+7Hi64oSe7AvB+4KX/eOWlTwQ5mWeGauPJ8xkLdePlV6oyc9LxXhsk0C
	nWZYZtbCh1tYem6wqHTfqI+W3gT2cRBs/fHCANpz8zMSeVfUG10ahEL7TASFOH2bxUG21NuMqiA50
	gyP4mLbJkYXzg1RlLoov0b2tlqLZItEJHC3eE0owbPS9AeMy6MUlJtWcl0y88Xnje2E6x5qrNAkIY
	DZonBUqyfNhtG/quMelB3/SriuYo/B6Vt3sNsUuXgX7LGjnfhd311E0itb7lVKR5MvPeFAK8fuGVg
	zQdAyGPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3Ymg-002zDM-2Y;
	Thu, 16 Nov 2023 09:35:38 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3Ymd-002z9I-0S
	for linux-mediatek@lists.infradead.org;
	Thu, 16 Nov 2023 09:35:36 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-28019b66ad5so442715a91.3
        for <linux-mediatek@lists.infradead.org>; Thu, 16 Nov 2023 01:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1700127332; x=1700732132; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gm1vhROaHDruTkjEkYQ+e3YE5nLctFy09vafq9HP69k=;
        b=wpaYLfkRaxs4iC50UGZEj8N+dRqT169g4uGm5jU1kpt2PSyCBGFMrFd6ZAUSIHgCyK
         hVKgTFWfTSHXCoidMZWKCUxe/ZRCuWwXsdLckA4K5hYqomxGoeVOeFBuyz8hN7J9p4+W
         uMitHfO0m7ZEf+802TAuQYu3zzNLmQ1L+LPKHiQTKjM/N2o9zTCUtFcDhxyVNCiiJUhZ
         nlInKkxKbSLqXo/RPeFoLM6pSxq7dqx8q0EENABhOooMrEFy2QXHAWLdQFK18UYUqsAn
         Lcl3D+TW03iRok43rmycj8iETIdVZ2OcgI5B+o0g2ihZoKWIggAxW+MGRknUYiQRf++l
         wWnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700127332; x=1700732132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gm1vhROaHDruTkjEkYQ+e3YE5nLctFy09vafq9HP69k=;
        b=ICJO42DjH4hWilHp1zKA/5k6i1RrRxZPdGn6mfDhaSgtTMFplEMBXiTzN7M+tNgzM7
         /sccXDnAxnrfoI3jVe+7A/RxR1tS6KGz6ftUlhaqzW/GzualnYCscjblVDanBmnZAP18
         LJfzNpwg74KOTzI5GaPghY++xHE+VKf9EHfJnJjxHMz0zzk3oDVlQh6mGlMzLT+J4Tr6
         dvsR4vH6iRcr4mi2ChJR7ZAsV7xL6g6JIqkxlzvL+OTcf4OxcwWy1XzkGnd5g+ht5WWe
         3sU2JL3rnfQsKpEUBmA8Qqa25sNWQuA77gaosxgc5kemOPGjfUgkY/nASThrZVGa6zcF
         JxeQ==
X-Gm-Message-State: AOJu0YxsPYhPaCAzZWQQyQ/s3PWGzYNiBFVSQNVp3D5w5hgBsqq1jzs3
	ds25N3nlCaq/5vT8rpHo88/7Ig==
X-Google-Smtp-Source: AGHT+IGG52IxZ72bRX48Su6eFunewmHAUv8tQuSJkhkYUETijVCXzx/LbhHhz8lhyxR3r0JnhWcSlg==
X-Received: by 2002:a17:90b:1c0c:b0:27f:fce3:2266 with SMTP id oc12-20020a17090b1c0c00b0027ffce32266mr15213758pjb.24.1700127331753;
        Thu, 16 Nov 2023 01:35:31 -0800 (PST)
Received: from localhost.localdomain ([101.78.151.194])
        by smtp.gmail.com with ESMTPSA id o10-20020a17090aac0a00b00280fcbbe774sm1175214pjq.10.2023.11.16.01.35.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 01:35:31 -0800 (PST)
From: Rui Zhou <zhourui@huaqin.corp-partner.google.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	angelogioacchino.delregno@collabora.com,
	perex@perex.cz,
	allen-kh.cheng@mediatek.com,
	kuninori.morimoto.gx@renesas.com
Cc: linux-sound@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Rui Zhou <zhourui@huaqin.corp-partner.google.com>
Subject: [PATCH v7 4/4] ASoC: mediatek: mt8188-mt6359: Enable dual amp for mt8188-rt5682s
Date: Thu, 16 Nov 2023 17:35:12 +0800
Message-Id: <20231116093512.4180240-5-zhourui@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231116093512.4180240-1-zhourui@huaqin.corp-partner.google.com>
References: <20231116093512.4180240-1-zhourui@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231116_013535_181722_141F9656 
X-CRM114-Status: GOOD (  10.92  )
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

Enable support for dual MAX98390 amplifiers on the mt8188-rt5682s board.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Rui Zhou <zhourui@huaqin.corp-partner.google.com>
---
 sound/soc/mediatek/mt8188/mt8188-mt6359.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
index 96c39f4e4b70..be450292f351 100644
--- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
+++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
@@ -1443,7 +1443,7 @@ static struct mt8188_card_data mt8188_nau8825_card = {
 
 static struct mt8188_card_data mt8188_rt5682s_card = {
 	.name = "mt8188_rt5682s",
-	.quirk = RT5682S_HS_PRESENT,
+	.quirk = RT5682S_HS_PRESENT | MAX98390_TWO_AMP,
 };
 
 static struct mt8188_card_data mt8188_es8326_card = {
-- 
2.25.1


